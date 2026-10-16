//! Disposable pinned-provider extension; compiled inside accesskit-c, not ZDL.
//! Handler-owned Arc lifetime acknowledges final provider callback ownership.
use crate::{
    unix_adapter, ActionHandlerCallback, ActivationHandlerCallback, BoxCastPtr,
    DeactivationHandlerCallback, FfiActionHandler, FfiActivationHandler, FfiDeactivationHandler,
};
use accesskit::{ActionHandler, ActionRequest, ActivationHandler, DeactivationHandler, TreeUpdate};
use accesskit_unix::Adapter;
use std::{ffi::c_void, sync::Arc};

struct Lease {
    userdata: *mut c_void,
    release: extern "C" fn(*mut c_void),
}
// Caller guarantees synchronized userdata and a release callback safe on any
// provider thread. No Rust code dereferences userdata; this is the C contract.
unsafe impl Send for Lease {}
unsafe impl Sync for Lease {}
impl Drop for Lease {
    fn drop(&mut self) {
        (self.release)(self.userdata);
    }
}
struct Activation {
    inner: FfiActivationHandler,
    _lease: Arc<Lease>,
}
impl ActivationHandler for Activation {
    fn request_initial_tree(&mut self) -> Option<TreeUpdate> {
        self.inner.request_initial_tree()
    }
}
struct Action {
    inner: FfiActionHandler,
    _lease: Arc<Lease>,
}
impl ActionHandler for Action {
    fn do_action(&mut self, request: ActionRequest) {
        self.inner.do_action(request);
    }
}
struct Deactivation {
    inner: FfiDeactivationHandler,
    _lease: Arc<Lease>,
}
impl DeactivationHandler for Deactivation {
    fn deactivate_accessibility(&mut self) {
        self.inner.deactivate_accessibility();
    }
}
fn handlers(
    activation: ActivationHandlerCallback,
    action: ActionHandlerCallback,
    deactivation: DeactivationHandlerCallback,
    userdata: *mut c_void,
    release: extern "C" fn(*mut c_void),
) -> (Activation, Action, Deactivation) {
    let lease = Arc::new(Lease { userdata, release });
    (
        Activation {
            inner: FfiActivationHandler::new(activation, userdata),
            _lease: lease.clone(),
        },
        Action {
            inner: FfiActionHandler::new(action, userdata),
            _lease: lease.clone(),
        },
        Deactivation {
            inner: FfiDeactivationHandler::new(deactivation, userdata),
            _lease: lease,
        },
    )
}
/// All four callbacks are required. Null callback rejects without transferring
/// userdata. Success transfers one userdata lease, released exactly once after
/// all three provider handlers are destroyed, possibly asynchronously and on a
/// foreign thread. No callback may unwind. The library must remain resident.
#[no_mangle]
pub extern "C" fn zdl_accesskit_unix_adapter_new_leased(
    activation: ActivationHandlerCallback,
    action: ActionHandlerCallback,
    deactivation: DeactivationHandlerCallback,
    userdata: *mut c_void,
    release: Option<extern "C" fn(*mut c_void)>,
) -> *mut unix_adapter {
    if activation.is_none() || action.is_none() || deactivation.is_none() || release.is_none() {
        return std::ptr::null_mut();
    }
    let (activation, action, deactivation) =
        handlers(activation, action, deactivation, userdata, release.unwrap());
    unix_adapter::to_mut_ptr(Adapter::new(activation, action, deactivation))
}
#[no_mangle]
pub extern "C" fn zdl_accesskit_lease_abi_version() -> u32 {
    4
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::{
        atomic::{AtomicUsize, Ordering},
        Barrier,
    };
    use std::time::{Duration, Instant};
    struct Cookie {
        releases: AtomicUsize,
        entered: Barrier,
        resume: Barrier,
    }
    extern "C" fn activation(data: *mut c_void) -> *mut crate::tree_update {
        let cookie = unsafe { &*(data as *const Cookie) };
        cookie.entered.wait();
        cookie.resume.wait();
        std::ptr::null_mut()
    }
    extern "C" fn idle(_: *mut c_void) -> *mut crate::tree_update {
        std::ptr::null_mut()
    }
    extern "C" fn action(request: *mut crate::action_request, _: *mut c_void) {
        crate::accesskit_action_request_free(request);
    }
    extern "C" fn deactivation(_: *mut c_void) {}
    extern "C" fn release(data: *mut c_void) {
        unsafe { &*(data as *const Cookie) }
            .releases
            .fetch_add(1, Ordering::SeqCst);
    }
    fn cookie() -> Box<Cookie> {
        Box::new(Cookie {
            releases: AtomicUsize::new(0),
            entered: Barrier::new(2),
            resume: Barrier::new(2),
        })
    }
    #[test]
    fn zdl_lease_inflight_callback_delays_final_release() {
        let data = cookie();
        let (mut active, action, deactivation) = handlers(
            Some(activation),
            Some(self::action),
            Some(self::deactivation),
            (&*data as *const Cookie).cast_mut().cast(),
            release,
        );
        let worker = std::thread::spawn(move || {
            assert!(active.request_initial_tree().is_none());
        });
        data.entered.wait();
        drop(action);
        drop(deactivation);
        assert_eq!(data.releases.load(Ordering::SeqCst), 0);
        data.resume.wait();
        worker.join().unwrap();
        assert_eq!(data.releases.load(Ordering::SeqCst), 1);
    }
    #[test]
    fn zdl_lease_real_unix_adapter_eventually_releases_all_handlers() {
        for _ in 0..32 {
            let data = cookie();
            let adapter = zdl_accesskit_unix_adapter_new_leased(
                Some(idle),
                Some(action),
                Some(deactivation),
                (&*data as *const Cookie).cast_mut().cast(),
                Some(release),
            );
            assert!(!adapter.is_null());
            unix_adapter::accesskit_unix_adapter_free(adapter);
            let deadline = Instant::now() + Duration::from_secs(5);
            while data.releases.load(Ordering::SeqCst) == 0 {
                if Instant::now() >= deadline {
                    // A timeout cannot revoke a native lease. Preserve userdata
                    // even on this failing test path rather than risking UAF.
                    std::mem::forget(data);
                    panic!("native handler release acknowledgement timed out");
                }
                std::thread::sleep(Duration::from_millis(1));
            }
            assert_eq!(data.releases.load(Ordering::SeqCst), 1);
        }
    }
    #[test]
    fn zdl_lease_invalid_callbacks_do_not_accept_userdata() {
        let data = cookie();
        let adapter = zdl_accesskit_unix_adapter_new_leased(
            None,
            Some(action),
            Some(deactivation),
            (&*data as *const Cookie).cast_mut().cast(),
            Some(release),
        );
        assert!(adapter.is_null());
        assert_eq!(data.releases.load(Ordering::SeqCst), 0);
    }
}

/// Private normalized decoder: no Zig code reads the C tagged union. Visitor
/// borrows bytes only during this call; it must copy before returning. Root tree
/// only; unsupported actions/data are rejected rather than coerced.
#[no_mangle]
pub extern "C" fn zdl_accesskit_visit_action(
    request: *const crate::action_request,
    visitor: Option<extern "C" fn(u64, u32, *const u8, usize, *mut c_void)>,
    userdata: *mut c_void,
) -> bool {
    if request.is_null() || visitor.is_none() {
        return false;
    }
    let request = unsafe { &*request };
    if request.target_tree.bytes != [0; 16] {
        return false;
    }
    let data = if request.data.has_value {
        Some(unsafe { request.data.value.assume_init_ref() })
    } else {
        None
    };
    let (kind, text): (u32, &[u8]) = match (request.action, data) {
        (accesskit::Action::Click, None) => (1, &[]),
        (accesskit::Action::Focus, None) => (2, &[]),
        (accesskit::Action::SetValue, Some(crate::action_data::Value(value)))
            if !value.is_null() =>
        {
            (3, unsafe { std::ffi::CStr::from_ptr(*value) }.to_bytes())
        }
        _ => return false,
    };
    visitor.unwrap()(
        request.target_node,
        kind,
        text.as_ptr(),
        text.len(),
        userdata,
    );
    true
}

/// Synthetic ABI fixture, not native AT-SPI traffic: execute the same owned
/// FfiActionHandler from a Rust thread, transfer request ownership to the Zig
/// callback and join before returning. Includes valid text, wrong data and a
/// foreign tree. The callback must free each request even when decoding rejects.
#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_actions_for_node(
    callback: ActionHandlerCallback,
    userdata: *mut c_void,
    native_id: u64,
) {
    let mut handler = FfiActionHandler::new(callback, userdata);
    std::thread::spawn(move || {
        for (action, target_tree, data) in [
            (accesskit::Action::Click, accesskit::TreeId::ROOT, None),
            (accesskit::Action::Focus, accesskit::TreeId::ROOT, None),
            (
                accesskit::Action::SetValue,
                accesskit::TreeId::ROOT,
                Some(accesskit::ActionData::Value("native café".into())),
            ),
            (
                accesskit::Action::Click,
                accesskit::TreeId::ROOT,
                Some(accesskit::ActionData::NumericValue(1.0)),
            ),
            (
                accesskit::Action::SetValue,
                crate::tree_id { bytes: [1; 16] }.into(),
                Some(accesskit::ActionData::Value("foreign".into())),
            ),
        ] {
            handler.do_action(accesskit::ActionRequest {
                action,
                target_tree,
                target_node: accesskit::NodeId(native_id),
                data,
            });
        }
    })
    .join()
    .unwrap();
}

/// Private normalized role/action/flag constructor. Zig does not guess C enum
/// discriminants. Other properties use the pinned standard C setter surface.
#[no_mangle]
pub extern "C" fn zdl_accesskit_node_new(
    role: u32,
    actions: u32,
    flags: u32,
    checked: i32,
) -> *mut crate::node {
    let role = match role {
        0 => accesskit::Role::Window,
        1 => accesskit::Role::Group,
        2 => accesskit::Role::Label,
        3 => accesskit::Role::Button,
        4 => accesskit::Role::CheckBox,
        5 => accesskit::Role::Slider,
        6 => accesskit::Role::List,
        7 => accesskit::Role::ListItem,
        8 => {
            if flags & 4 != 0 {
                accesskit::Role::PasswordInput
            } else {
                accesskit::Role::TextInput
            }
        }
        _ => return std::ptr::null_mut(),
    };
    let mut node = accesskit::Node::new(role);
    if actions & 1 != 0 {
        node.add_action(accesskit::Action::Click);
    }
    if actions & 2 != 0 {
        node.add_action(accesskit::Action::Focus);
    }
    if actions & 4 != 0 {
        node.add_action(accesskit::Action::SetValue);
    }
    if flags & 1 != 0 {
        node.set_disabled();
    }
    if flags & 2 != 0 {
        node.set_read_only();
    }
    if checked == 0 {
        node.set_toggled(accesskit::Toggled::False);
    }
    if checked == 1 {
        node.set_toggled(accesskit::Toggled::True);
    }
    crate::node::to_mut_ptr(node)
}

/// Native consumer validation fixture. Invalid producer trees deliberately fail
/// this finite process, rather than being silently certified by debug printing.
#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_tree(update: *const crate::tree_update) -> usize {
    let update: &accesskit::TreeUpdate = crate::ref_from_ptr(update);
    let tree = accesskit_consumer::Tree::new(update.clone(), true);
    assert_eq!(
        tree.state().root().role(),
        update
            .nodes
            .iter()
            .find(|(id, _)| *id == update.tree.as_ref().unwrap().root)
            .unwrap()
            .1
            .role()
    );
    update.nodes.len()
}

/// Assertions for the finite nine-node fixture, separate from generic validity.
#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_tree_properties(update: *const crate::tree_update) {
    let update: &accesskit::TreeUpdate = crate::ref_from_ptr(update);
    assert_eq!(update.nodes.len(), 9);
    let tree = accesskit_consumer::Tree::new(update.clone(), true);
    assert_eq!(tree.state().focus_in_tree().role(), accesskit::Role::Button);
    let mut checked = 0;
    let mut protected = 0;
    let mut positions = Vec::new();
    for (id, source) in &update.nodes {
        let node = tree
            .state()
            .node_by_tree_local_id(*id, update.tree_id)
            .unwrap();
        assert_eq!(node.data(), source);
        match node.role() {
            accesskit::Role::Button => {
                let bounds = node.data().bounds().unwrap();
                assert_eq!(
                    (bounds.x0, bounds.y0, bounds.x1, bounds.y1),
                    (10.0, 20.0, 110.0, 50.0)
                );
                assert!(node.data().supports_action(accesskit::Action::Click));
            }
            accesskit::Role::CheckBox => {
                assert_eq!(node.toggled(), Some(accesskit::Toggled::True));
                checked += 1;
            }
            accesskit::Role::PasswordInput => {
                assert!(node.is_read_only());
                assert!(node.data().value().is_none());
                assert!(node.data().text_selection().is_none());
                assert_eq!(node.labelled_by().count(), 1);
                assert!(!node.data().supports_action(accesskit::Action::SetValue));
                protected += 1;
            }
            accesskit::Role::Slider => {
                assert!(node.is_disabled());
                assert_eq!(node.data().numeric_value(), Some(5.0));
                assert_eq!(node.data().min_numeric_value(), Some(0.0));
                assert_eq!(node.data().max_numeric_value(), Some(10.0));
                assert!(!node.data().supports_action(accesskit::Action::SetValue));
            }
            accesskit::Role::List => assert_eq!(node.size_of_set(), Some(2)),
            accesskit::Role::ListItem => positions.push(node.position_in_set().unwrap()),
            _ => (),
        }
    }
    positions.sort();
    assert_eq!(positions, vec![1, 2]);
    assert_eq!((checked, protected), (1, 1));
}

#[no_mangle]
pub extern "C" fn zdl_accesskit_tree_clone(
    update: *const crate::tree_update,
) -> *mut crate::tree_update {
    let update: &accesskit::TreeUpdate = crate::ref_from_ptr(update);
    crate::tree_update::to_mut_ptr(update.clone())
}

/// Synthetic provider callback entry on a foreign Rust thread. The same FFI
/// activation wrapper takes ownership of the returned clone; consumer validates
/// it. Null means closed/not ready. This is not a live AT-SPI activation.
#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_activation(
    callback: ActivationHandlerCallback,
    userdata: *mut c_void,
) -> usize {
    let mut handler = FfiActivationHandler::new(callback, userdata);
    std::thread::spawn(move || match handler.request_initial_tree() {
        Some(update) => {
            let count = update.nodes.len();
            let _tree = accesskit_consumer::Tree::new(update, true);
            count
        }
        None => 0,
    })
    .join()
    .unwrap()
}

/// The update factory's non-null ownership contract, tested synchronously just
/// as the pinned native update_if_active implementation invokes its closure.
#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_factory(
    factory: crate::tree_update_factory,
    userdata: *mut c_void,
) -> usize {
    let update = *crate::box_from_ptr(factory.unwrap()(crate::tree_update_factory_userdata(
        userdata,
    )));
    let count = update.nodes.len();
    let _tree = accesskit_consumer::Tree::new(update, true);
    count
}

#[no_mangle]
pub extern "C" fn zdl_accesskit_probe_actions(
    callback: ActionHandlerCallback,
    userdata: *mut c_void,
) {
    zdl_accesskit_probe_actions_for_node(callback, userdata, 7);
}
