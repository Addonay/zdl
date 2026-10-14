//! Linux X11 connections, windows, typed events, EWMH window states, cursors and
//! CPU raster presentation, built on the system Xlib (libX11.so.6) loaded with
//! the runtime dynamic loader. Xlib declarations stay private in xlib.zig; keyboard translation
//! lives in keyboard.zig and selection (clipboard) handling in clipboard.zig.
//! XDND drops are in dnd.zig, window shapes in shape.zig, and pen samples in
//! xinput.zig.
//!
//! Ownership: a Library owns the libX11 handle and the allocator used for keymaps
//! and clipboard text. A Connection borrows the Library and owns its Display and
//! keyboard Layout. A Window borrows its Connection and owns a graphics context.
//! Destroy windows and cursors before their connection, and connections before
//! their Library. Nothing here synchronizes: one thread drives a connection.
//!
//! Deliberate differences from SDL's X11 backend:
//! - Errors are recorded per display by a non-terminating Xlib handler (see
//!   xlib.zig); operations that call `Connection.sync` return ServerError with
//!   the protocol details. Asynchronous errors surface at the next sync.
//! - Keyboard tables use XKB groups when the server offers XKB (keyboard.zig);
//!   X11 modifier state comes from the core keymap otherwise.
//! - Text input is committed UTF-8 from XIM/XIC (text_input.zig), and the
//!   composition is reported as `text_editing` events with the caret. The
//!   selection length of a composition is not reported (always zero).
//! - Presentation prefers MIT-SHM and sends only dirty rectangles (shm.zig),
//!   converting the frame once per call instead of per rectangle.
//! - Modifier side bits come from physical modifier key events, resynchronized
//!   from XQueryKeymap on focus; X state alone has no sides.
const std = @import("std");
const geometry = @import("../geometry.zig");
const pixels = @import("../pixels.zig");
const surface = @import("../surface.zig");
const keyboard = @import("../../input/keyboard.zig");
const xlib = @import("xlib.zig");
const layout_mod = @import("keyboard.zig");
const text_input = @import("text_input.zig");
const displays = @import("displays.zig");
const shm = @import("shm.zig");
const ewmh = @import("ewmh.zig");
const xinput = @import("xinput.zig");
const dnd = @import("dnd.zig");
const xshape = @import("shape.zig");

/// Owns the libX11 handle and the function table. See the module comment.
pub const Library = xlib.Library;

/// Backend failures. Server-side protocol errors use Xlib's default handler.
pub const Error = surface.Error || error{
    DisplayUnavailable,
    KeymapUnavailable,
    InvalidSize,
    WindowFailure,
    TitleTooLong,
    UnsupportedPixelFormat,
    SizeMismatch,
    SelectionUnavailable,
    CursorFailure,
    SelectionDataUnsupported,
    AllocationFailed,
    /// A request failed on the server; see Connection.last_error for the details.
    ServerError,
    TextInputUnavailable,
    ConnectionFailure,
    SelectionTimeout,
    SharedMemoryUnavailable,
    /// XGrabPointer or XGrabKeyboard refused the grab after the retry budget.
    GrabFailed,
    /// libXi is missing, the server lacks XInput 2.0, or XInput2 was not enabled.
    XInputUnavailable,
    /// Touch events need XInput 2.2, which the server does not offer.
    TouchUnsupported,
    /// The window manager hint or _NET_WM_ICON property could not be set.
    IconFailure,
    /// No core font matched the requested pattern.
    FontUnavailable,
    /// libXcursor is missing or the theme has no cursor with that name.
    ThemedCursorUnavailable,
    /// libXext's XShape is missing, or the server lacks the SHAPE extension.
    ShapeUnavailable,
};

/// X server window identifiers, distinct from unrelated native integers.
pub const WindowId = enum(usize) { _ };
/// X atoms as exposed to callers (selections, targets, properties).
pub const Atom = enum(usize) { none = 0, _ };
/// Protocol-sized window extents. Zero is rejected before creating/resizing.
pub const Size = struct { width: u16, height: u16 };
/// Keyboard modifiers and locks, the same flags the keyboard module uses.
pub const Modifiers = keyboard.Modifiers;
pub const Scancode = keyboard.Scancode;
pub const Keycode = keyboard.Keycode;

/// Clipboard selections SDL exposes (CLIPBOARD and PRIMARY).
pub const Selection = enum { clipboard, primary };

/// Atom names this backend interns once per connection. Tag names are the exact
/// X atom spellings, so `atom(.WM_DELETE_WINDOW)` interns "WM_DELETE_WINDOW".
pub const AtomName = enum {
    WM_PROTOCOLS,
    WM_DELETE_WINDOW,
    WM_CHANGE_STATE,
    WM_CLASS,
    WM_NAME,
    _NET_WM_NAME,
    _NET_WM_PID,
    _NET_WM_STATE,
    _NET_WM_STATE_FULLSCREEN,
    _NET_WM_STATE_MAXIMIZED_VERT,
    _NET_WM_STATE_MAXIMIZED_HORZ,
    _NET_ACTIVE_WINDOW,
    _MOTIF_WM_HINTS,
    INCR,
    UTF8_STRING,
    TARGETS,
    TEXT,
    CLIPBOARD,
    PRIMARY,
    ZDL_SELECTION_DATA,
    WM_STATE,
    _NET_WM_STATE_HIDDEN,
    _NET_WM_STATE_FOCUSED,
    _NET_WM_STATE_ABOVE,
    _NET_WM_STATE_DEMANDS_ATTENTION,
    _NET_WM_STATE_MODAL,
    _NET_WM_STATE_SKIP_TASKBAR,
    _NET_WM_STATE_SKIP_PAGER,
    _NET_WM_ICON,
    _NET_WM_WINDOW_OPACITY,
    _NET_WM_WINDOW_TYPE,
    _NET_WM_WINDOW_TYPE_DIALOG,
    _NET_WM_WINDOW_TYPE_POPUP_MENU,
    _NET_WM_WINDOW_TYPE_TOOLTIP,
    XdndAware,
    XdndEnter,
    XdndPosition,
    XdndStatus,
    XdndLeave,
    XdndDrop,
    XdndFinished,
    XdndSelection,
    XdndActionCopy,
    XdndTypeList,
};

/// Keyboard, pointer and window events after X11 translation. Fields that
/// SDL keeps in global state (current modifiers, button history) are per-event here.
pub const Event = struct {
    window: WindowId,
    payload: Payload,

    pub const Payload = union(enum) {
        /// The window manager asked to close the window (WM_DELETE_WINDOW).
        close,
        /// The server destroyed the window; it must not be used again.
        destroyed,
        shown,
        hidden,
        /// Expose with no pending subsequent areas: repaint the whole window.
        exposed,
        /// Position and size reported by the server (ConfigureNotify).
        configured: struct { position: geometry.Point(i32), size: Size },
        focused: bool,
        /// True when the pointer entered the window, false when it left.
        pointer_crossed: bool,
        key: Key,
        button: Button,
        motion: Motion,
        /// Wheel ticks from X buttons 4-7: positive y is up, positive x is right.
        wheel: struct { x: i32, y: i32, timestamp: u32 },
        /// Keyboard mapping changed on the server; the layout was rebuilt.
        keymap_changed,
        /// Another client took a selection this window owned.
        selection_cleared: Atom,
        /// Another client asks this window to convert its selection.
        selection_requested: SelectionRequest,
        /// Result of a ConvertSelection requested by this window.
        selection_notified: SelectionNotify,
        /// Committed text from the input method, UTF-8, at most 64 bytes per event.
        text: TextInput,
        /// The XKB keyboard group changed (0-3). Keymaps follow the group.
        keyboard_group: u8,
        /// A property changed on a window that asked for PropertyChange events.
        property_changed: Atom,
        /// A property was deleted; INCR transfers use this to send the next chunk.
        property_deleted: Atom,
        /// Screen size, output or CRTC configuration changed (RandR); query outputs again.
        display_changed,
        /// _NET_WM_STATE or WM_STATE changed on the window: the window manager
        /// maximized, minimized, fullscreened or focused it, or the compositor
        /// hid it. Call `Connection.window_state` to read the new state (SDL re-reads
        /// the property on the same PropertyNotify).
        window_state_changed,
        /// Raw relative motion (after `Connection.set_raw_motion(true)`).
        raw_motion: xinput.RawMotion,
        /// A touch point began, moved or ended (after `Window.select_xinput`).
        touch: xinput.Touch,
        /// Smooth scroll from a device's scroll valuators (after `Window.select_xinput`).
        smooth_scroll: xinput.SmoothScroll,
        /// Drag over the window (XDND): position in window pixels. Sent for each
        /// XdndPosition, the first one included.
        drop_position: geometry.Point(i32),
        /// The drag left the window or was cancelled before a drop.
        drop_left,
        /// One line of dropped text (any target except text/uri-list).
        drop_text: Utf8Chunk,
        /// One URI from a dropped text/uri-list, as the source sent it.
        drop_file: Utf8Chunk,
        /// Every item of a drop has been reported; XdndFinished has been sent.
        drop_complete,
        /// The input method's composition changed: the text and caret (after `take_preedit`).
        text_editing: TextEditing,
        /// A pen (tablet stylus or eraser) moved or changed pressure. Needs `pen`
        /// in `xinput.Events`; tip contact is pressure above zero.
        pen_motion: PenMotion,
        /// A pen came into or left the sensing range of the tablet.
        pen_proximity: PenProximity,
    };

    /// UTF-8 text of at most `text_input.extended_capacity` bytes.
    pub const Utf8Chunk = struct {
        length: u8,
        bytes: [text_input.extended_capacity]u8,

        /// The UTF-8 bytes carried by this event.
        pub fn text(self: *const Utf8Chunk) []const u8 {
            return self.bytes[0..self.length];
        }
    };

    /// Composition text with the caret, in characters from the start of the text.
    pub const TextEditing = struct {
        caret: u32,
        length: u8,
        bytes: [text_input.extended_capacity]u8,

        /// The composition's UTF-8 bytes. Empty when the composition ended.
        pub fn text(self: *const TextEditing) []const u8 {
            return self.bytes[0..self.length];
        }
    };

    /// A pen sample. `pressure` is 0 to 1; `tilt` is in degrees, normalized from
    /// the device's tilt range to plus or minus 90 (SDL reports the normalized value).
    pub const PenMotion = struct {
        device: i32,
        eraser: bool,
        down: bool,
        position: geometry.Point(f32),
        pressure: f32,
        tilt: geometry.Point(f32),
        timestamp: u32,
    };

    pub const PenProximity = struct {
        device: i32,
        eraser: bool,
        in_proximity: bool,
    };

    pub const TextInput = struct {
        length: u8,
        bytes: [text_input.chunk_capacity]u8,

        /// The committed UTF-8 bytes carried by this event.
        pub fn text(self: *const TextInput) []const u8 {
            return self.bytes[0..self.length];
        }
    };

    pub const Key = struct {
        pressed: bool,
        scancode: Scancode,
        keycode: Keycode,
        modifiers: Modifiers,
        x_keycode: u8,
        timestamp: u32,
    };
    pub const Button = struct {
        pressed: bool,
        button: u8,
        position: geometry.Point(i32),
        modifiers: Modifiers,
        timestamp: u32,
    };
    pub const Motion = struct {
        position: geometry.Point(i32),
        modifiers: Modifiers,
        timestamp: u32,
    };
    pub const SelectionRequest = struct {
        requestor: WindowId,
        selection: Atom,
        target: Atom,
        /// Destination property named by the requestor; `none` for obsolete clients.
        property: Atom,
        timestamp: u32,
    };
    pub const SelectionNotify = struct {
        selection: Atom,
        target: Atom,
        /// `none` when the owner refused the conversion.
        property: Atom,
        timestamp: u32,
    };
};

/// A server-side protocol error recorded for a request this connection sent,
/// as reported by the error handler at the next `Connection.sync`.
pub const ProtocolError = struct {
    error_code: u8,
    request_code: u8,
    minor_code: u8,
    resource_id: u64,
    serial: u64,
};

/// Completion code ShmCompletion (XShm.h), offset from the MIT-SHM event base.
const shm_completion_offset: c_int = 0;
/// Timeout for each wait on the server socket in blocking protocols (INCR, SHM).
const wait_timeout_ms: i32 = 5000;

/// Owns a display connection: interned atoms, the keyboard layout (per XKB
/// group when available), input-method contexts, the event queue and the
/// optional extension event bases. Keep the Connection at a stable address while
/// windows or cursors borrow it. Calls must come from the thread driving it.
pub const Connection = struct {
    library: *Library,
    display: *xlib.Display,
    screen: c_int,
    root: WindowId,
    visual: *xlib.Visual,
    depth: u32,
    atoms: std.EnumArray(AtomName, xlib.Atom),
    keyboard: layout_mod.Layout,
    /// Physical modifier keys currently held, from key events and focus sync.
    held_modifiers: Modifiers = .none,
    /// Input-method contexts, one per window that enabled text input.
    text: text_input.Manager,
    /// Events translated but not yet returned by `poll` (text after a key, events
    /// seen while a blocking exchange waited for something else).
    queue: std.ArrayList(Event) = .empty,
    /// First event code of the XKB, RandR and MIT-SHM extensions, when present.
    xkb_event_base: ?c_int = null,
    randr_event_base: ?c_int = null,
    shm_event_base: ?c_int = null,
    /// MIT-SHM is usable on this display (XShmQueryExtension succeeded).
    shm_enabled: bool = false,
    /// Shared-memory puts whose completion events have not arrived yet.
    shm_outstanding: u32 = 0,
    /// Most recent protocol error seen by `sync`.
    last_error: ?ProtocolError = null,
    /// XInput2 state, present after `enable_xinput` succeeds. Owns the device cache.
    xi: ?xinput.State = null,
    /// A pointer grab failed in full once; later grabs fail at once (SDL's broken_pointer_grab).
    pointer_grab_broken: bool = false,
    /// XDND drag in progress, and the MIME atoms it needs (see dnd.zig).
    drop: dnd.State = .{},
    drop_atoms: dnd.Atoms,

    /// Connects to a named display (null uses DISPLAY), interns atoms, loads the
    /// keyboard layout (one keymap per XKB group when XKB is available) and
    /// probes the optional extensions. Connecting never opens a window.
    pub fn open(library: *Library, name: ?[:0]const u8) Error!Connection {
        const api = &library.functions;
        const display = api.XOpenDisplay(if (name) |value| value.ptr else null) orelse return error.DisplayUnavailable;
        errdefer _ = api.XCloseDisplay(display);
        if (!xlib.register_display(api, display)) return error.DisplayUnavailable;
        errdefer xlib.unregister_display(api, display);

        const screen = api.XDefaultScreen(display);
        const depth = std.math.cast(u32, api.XDefaultDepth(display, screen)) orelse return error.UnsupportedPixelFormat;
        var atoms: std.EnumArray(AtomName, xlib.Atom) = .initUndefined();
        inline for (@typeInfo(AtomName).@"enum".field_names) |field| {
            const name_tag = @field(AtomName, field);
            atoms.set(name_tag, api.XInternAtom(display, field.ptr, 0));
        }

        var opcode: c_int = 0;
        var xkb_event: c_int = 0;
        var xkb_error: c_int = 0;
        var major: c_int = 1;
        var minor: c_int = 0;
        var xkb_base: ?c_int = null;
        if (api.XkbQueryExtension(display, &opcode, &xkb_event, &xkb_error, &major, &minor) != 0) {
            const mask = xlib.XkbNewKeyboardNotifyMask | xlib.XkbMapNotifyMask | xlib.XkbStateNotifyMask;
            _ = api.XkbSelectEvents(display, xlib.XkbUseCoreKbd, mask, mask);
            xkb_base = xkb_event;
        }
        var keyboard_layout = try Connection.load_keyboard(library.allocator, api, display, xkb_base != null);
        errdefer keyboard_layout.deinit();

        const randr_base = displays.event_base(library, display);
        var shm_enabled = false;
        var shm_base: ?c_int = null;
        if (library.xext) |*extension| {
            if (extension.XShmQueryExtension(display) != 0) {
                shm_enabled = true;
                shm_base = extension.XShmGetEventBase(display);
            }
        }

        var connection: Connection = .{
            .library = library,
            .display = display,
            .screen = screen,
            .root = @fromBackingInt(@intCast(api.XRootWindow(display, screen))),
            .visual = api.XDefaultVisual(display, screen),
            .depth = depth,
            .atoms = atoms,
            .keyboard = keyboard_layout,
            .text = text_input.Manager.init(library.allocator),
            .xkb_event_base = xkb_base,
            .randr_event_base = randr_base,
            .shm_event_base = shm_base,
            .shm_enabled = shm_enabled,
            .drop_atoms = dnd.Atoms.intern(api, display),
        };
        connection.sync_held_modifiers();
        return connection;
    }

    /// Reads the core keymap and, when XKB is active, the per-group keymaps.
    fn load_keyboard(allocator: std.mem.Allocator, api: *const xlib.Functions, display: *xlib.Display, xkb: bool) Error!layout_mod.Layout {
        var layout = try layout_mod.Layout.load(allocator, api, display);
        errdefer layout.deinit();
        if (xkb) {
            _ = layout.load_xkb_groups(allocator, api, display) catch |err| switch (err) {
                error.OutOfMemory => return error.OutOfMemory,
                error.KeymapUnavailable => false,
            };
        }
        return layout;
    }

    /// Closes the display. Windows, cursors and clipboards must already be released.
    pub fn deinit(self: *Connection) void {
        const api = &self.library.functions;
        self.text.deinit(api);
        if (self.xi) |*state| state.deinit();
        self.queue.deinit(self.library.allocator);
        self.keyboard.deinit();
        xlib.unregister_display(api, self.display);
        _ = api.XCloseDisplay(self.display);
        self.* = undefined;
    }

    /// Returns the socket descriptor for readiness integration. The descriptor
    /// remains owned by Xlib; do not close it.
    pub fn file_descriptor(self: *Connection) Error!i32 {
        return self.library.functions.XConnectionNumber(self.display);
    }

    /// Sends buffered requests to the server.
    pub fn flush(self: *Connection) Error!void {
        _ = self.library.functions.XFlush(self.display);
    }

    /// Waits until the server has processed every request sent so far (XSync)
    /// and returns ServerError when Xlib's handler recorded a protocol error for
    /// this display in the meantime. The error is kept in `last_error`.
    pub fn sync(self: *Connection) Error!void {
        _ = self.library.functions.XSync(self.display, 0);
        const raw = xlib.take_error(self.display) orelse return;
        self.last_error = .{
            .error_code = raw.error_code,
            .request_code = raw.request_code,
            .minor_code = raw.minor_code,
            .resource_id = @intCast(raw.resource_id),
            .serial = @intCast(raw.serial),
        };
        return error.ServerError;
    }

    /// Human-readable text for a protocol error (XGetErrorText), written into
    /// `buffer`. The result is a prefix of `buffer` and may be empty.
    pub fn describe_error(self: *const Connection, failure: ProtocolError, buffer: []u8) []const u8 {
        if (buffer.len == 0) return buffer[0..0];
        buffer[buffer.len - 1] = 0;
        _ = self.library.functions.XGetErrorText(self.display, @as(c_int, failure.error_code), buffer.ptr, @intCast(buffer.len));
        return std.mem.sliceTo(buffer, 0);
    }

    /// Returns the interned atom for a name in AtomName.
    pub fn atom(self: *const Connection, name: AtomName) xlib.Atom {
        return self.atoms.get(name);
    }

    /// The root window of the screen this connection uses.
    fn root_window(self: *const Connection) xlib.Window {
        return @intCast(@backingInt(self.root));
    }

    /// Returns the next translated event, or null when none is pending. Events
    /// that carry no public meaning (expose sub-rectangles, unrelated mapping
    /// notifications, repeated key releases) are consumed silently.
    pub fn poll(self: *Connection) Error!?Event {
        if (self.queue.items.len == 0) try self.pump();
        if (self.queue.items.len == 0) return null;
        return self.queue.orderedRemove(0);
    }

    /// Reads every event the server has already delivered, translating each into
    /// the queue. Never blocks; a non-blocking read of the socket is part of XPending.
    fn pump(self: *Connection) Error!void {
        const api = &self.library.functions;
        while (api.XPending(self.display) > 0) {
            var raw: xlib.Event = undefined;
            _ = api.XNextEvent(self.display, &raw);
            if (try self.translate(&raw)) |event| try self.queue.append(self.library.allocator, event);
        }
    }

    /// Waits up to `timeout_ms` for the server socket to become readable.
    fn wait_readable(self: *Connection, timeout_ms: i32) Error!bool {
        var descriptors = [_]std.posix.pollfd{.{
            .fd = self.library.functions.XConnectionNumber(self.display),
            .events = std.posix.POLL.IN,
            .revents = 0,
        }};
        const ready = std.posix.poll(&descriptors, timeout_ms) catch return error.ConnectionFailure;
        return ready > 0;
    }

    /// Puts events back at the front of the queue, keeping their order, so a
    /// blocking exchange can hand back the events it was not waiting for.
    pub fn restore_events(self: *Connection, events: []const Event) Error!void {
        try self.queue.insertSlice(self.library.allocator, 0, events);
    }

    /// Waits up to `timeout_ms` for the next event. Each wait for the socket is
    /// bounded by the timeout, so partial protocol traffic may extend the total.
    /// Returns null on timeout.
    pub fn next_event_within(self: *Connection, timeout_ms: i32) Error!?Event {
        while (true) {
            if (try self.poll()) |event| return event;
            if (!try self.wait_readable(timeout_ms)) return null;
        }
    }

    /// Blocks until every shared-memory put sent with completion requests has
    /// been reported by the server, so the segment may be written again.
    pub fn wait_shm_idle(self: *Connection) Error!void {
        while (self.shm_outstanding > 0) {
            try self.pump();
            if (self.shm_outstanding == 0) break;
            if (!try self.wait_readable(wait_timeout_ms)) return error.SharedMemoryUnavailable;
        }
    }

    /// Converts one raw event into the public Event, or null for events that are
    /// consumed silently. Extra events produced by one raw event (text after a
    /// key press) are appended to the queue, after the one returned.
    fn translate(self: *Connection, raw: *xlib.Event) Error!?Event {
        const api = &self.library.functions;
        const window: WindowId = @fromBackingInt(@intCast(raw.any.window));
        if (raw.kind == xlib.generic_event) {
            // Only XInput2 generic events are selected by this backend; others are ignored.
            const state = self.xi orelse return null;
            if (raw.generic.extension != state.opcode) return null;
            return xinput.translate(self, raw);
        }
        if (self.xkb_event_base) |base| {
            if (raw.kind == base) return self.translate_xkb(raw);
        }
        if (self.randr_event_base) |base| {
            if (raw.kind == base + xlib.rr_screen_change_notify or raw.kind == base + xlib.rr_notify_base_offset) {
                return .{ .window = self.root, .payload = .display_changed };
            }
        }
        if (self.shm_event_base) |base| {
            if (raw.kind == base + shm_completion_offset) {
                self.shm_outstanding -|= 1;
                return null;
            }
        }
        switch (raw.kind) {
            xlib.key_press, xlib.key_release => {
                const pressed = raw.kind == xlib.key_press;
                if (!pressed and self.is_auto_repeat_release(raw)) return null;
                const x_keycode: u8 = @intCast(raw.key.keycode);
                const scancode = self.keyboard.scancode(x_keycode);
                self.update_held(scancode, pressed);
                // An input method that consumes the event (composition in progress) hides the key.
                const consumed = self.text.filter(api, raw, raw.any.window);
                try self.queue_composition(window, raw.any.window);
                if (consumed) return null;
                const modifiers = self.modifiers_for_state(raw.key.state);
                if (pressed) try self.enqueue_text(window, raw);
                return .{ .window = window, .payload = .{ .key = .{
                    .pressed = pressed,
                    .scancode = scancode,
                    .keycode = self.keyboard.keycode(scancode, modifiers),
                    .modifiers = modifiers,
                    .x_keycode = x_keycode,
                    .timestamp = @truncate(raw.key.time),
                } } };
            },
            xlib.button_press, xlib.button_release => {
                const button = raw.key.keycode;
                if (raw.kind == xlib.button_press and button >= 4 and button <= 7) {
                    return .{ .window = window, .payload = .{ .wheel = .{
                        .x = if (button == 6) 1 else if (button == 7) -1 else 0,
                        .y = if (button == 4) 1 else if (button == 5) -1 else 0,
                        .timestamp = @truncate(raw.key.time),
                    } } };
                }
                if (button >= 4 and button <= 7) return null;
                return .{ .window = window, .payload = .{ .button = .{
                    .pressed = raw.kind == xlib.button_press,
                    .button = @intCast(button),
                    .position = .{ .x = raw.key.x, .y = raw.key.y },
                    .modifiers = self.modifiers_for_state(raw.key.state),
                    .timestamp = @truncate(raw.key.time),
                } } };
            },
            xlib.motion_notify => return .{ .window = window, .payload = .{ .motion = .{
                .position = .{ .x = raw.motion.x, .y = raw.motion.y },
                .modifiers = self.modifiers_for_state(raw.motion.state),
                .timestamp = @truncate(raw.motion.time),
            } } },
            xlib.enter_notify, xlib.leave_notify => return .{ .window = window, .payload = .{
                .pointer_crossed = raw.kind == xlib.enter_notify,
            } },
            xlib.focus_in, xlib.focus_out => {
                if (raw.kind == xlib.focus_in) self.sync_held_modifiers();
                self.text.set_focus(api, raw.any.window, raw.kind == xlib.focus_in);
                return .{ .window = window, .payload = .{ .focused = raw.kind == xlib.focus_in } };
            },
            xlib.expose => {
                if (raw.expose.count != 0) return null;
                return .{ .window = window, .payload = .exposed };
            },
            xlib.configure_notify => return .{ .window = window, .payload = .{ .configured = .{
                .position = .{ .x = raw.configure.x, .y = raw.configure.y },
                .size = .{
                    .width = std.math.cast(u16, raw.configure.width) orelse return null,
                    .height = std.math.cast(u16, raw.configure.height) orelse return null,
                },
            } } },
            xlib.map_notify => return .{ .window = window, .payload = .shown },
            xlib.unmap_notify => return .{ .window = window, .payload = .hidden },
            xlib.destroy_notify => return .{ .window = window, .payload = .destroyed },
            xlib.property_notify => {
                // Window-state properties get their own event so callers re-read the state.
                if (ewmh.is_state_property(self, raw.property.atom)) {
                    return .{ .window = window, .payload = .window_state_changed };
                }
                const changed: Atom = @fromBackingInt(@intCast(raw.property.atom));
                if (raw.property.state == xlib.property_delete) return .{ .window = window, .payload = .{ .property_deleted = changed } };
                return .{ .window = window, .payload = .{ .property_changed = changed } };
            },
            xlib.client_message => {
                if (try dnd.translate_client(self, raw)) |drop_event| return drop_event;
                const protocols = self.atom(.WM_PROTOCOLS);
                const delete = self.atom(.WM_DELETE_WINDOW);
                if (@as(c_ulong, @bitCast(raw.client.message_type)) == protocols and raw.client.format == 32 and
                    @as(c_ulong, @bitCast(raw.client.data.longs[0])) == delete)
                {
                    return .{ .window = window, .payload = .close };
                }
                return null;
            },
            xlib.selection_clear => return .{ .window = window, .payload = .{
                .selection_cleared = @fromBackingInt(@intCast(raw.selection_clear.selection)),
            } },
            xlib.selection_request => return .{ .window = window, .payload = .{ .selection_requested = .{
                .requestor = @fromBackingInt(@intCast(raw.selection_request.requestor)),
                .selection = @fromBackingInt(@intCast(raw.selection_request.selection)),
                .target = @fromBackingInt(@intCast(raw.selection_request.target)),
                .property = @fromBackingInt(@intCast(raw.selection_request.property)),
                .timestamp = @truncate(raw.selection_request.time),
            } } },
            xlib.selection_notify => {
                if (try dnd.translate_selection(self, raw)) |drop_event| return drop_event;
                return .{ .window = window, .payload = .{ .selection_notified = .{
                    .selection = @fromBackingInt(@intCast(raw.selection.selection)),
                    .target = @fromBackingInt(@intCast(raw.selection.target)),
                    .property = @fromBackingInt(@intCast(raw.selection.property)),
                    .timestamp = @truncate(raw.selection.time),
                } } };
            },
            xlib.mapping_notify => {
                if (raw.mapping.request != xlib.mapping_keyboard) return null;
                _ = api.XRefreshKeyboardMapping(&raw.mapping);
                try self.reload_keyboard();
                return .{ .window = window, .payload = .keymap_changed };
            },
            else => return null,
        }
    }

    /// XKB state and keymap notifications: group switches and keymap changes.
    fn translate_xkb(self: *Connection, raw: *xlib.Event) Error!?Event {
        switch (raw.xkb_state.xkb_type) {
            xlib.xkb_state_notify => {
                if (!self.keyboard.uses_xkb()) return null;
                const requested: u8 = @intCast(std.math.clamp(raw.xkb_state.group, 0, 255));
                if (requested == self.keyboard.active_group) return null;
                self.keyboard.set_group(requested);
                return .{ .window = self.root, .payload = .{ .keyboard_group = self.keyboard.active_group } };
            },
            xlib.xkb_map_notify, xlib.xkb_new_keyboard_notify => {
                try self.reload_keyboard();
                return .{ .window = self.root, .payload = .keymap_changed };
            },
            else => return null,
        }
    }

    /// Rebuilds the keyboard layout (core and XKB groups) after a mapping change.
    fn reload_keyboard(self: *Connection) Error!void {
        const layout = try Connection.load_keyboard(self.library.allocator, &self.library.functions, self.display, self.xkb_event_base != null);
        self.keyboard.deinit();
        self.keyboard = layout;
    }

    /// Queues a text-editing event when a preedit callback changed the composition
    /// of `xid` since the last call. The text is copied out of the context here.
    fn queue_composition(self: *Connection, window: WindowId, xid: xlib.Window) Error!void {
        const update = self.text.take_preedit(xid) orelse return;
        const split = text_input.split_chunk(update.text, text_input.extended_capacity);
        var payload: Event.TextEditing = .{
            .caret = @intCast(@max(update.caret, 0)),
            .length = @intCast(split.chunk.len),
            .bytes = undefined,
        };
        @memcpy(payload.bytes[0..split.chunk.len], split.chunk);
        try self.queue.append(self.library.allocator, .{ .window = window, .payload = .{ .text_editing = payload } });
    }

    /// Queues committed text for a key press as one or more events of at most
    /// `text_input.chunk_capacity` bytes each.
    fn enqueue_text(self: *Connection, window: WindowId, raw: *xlib.Event) Error!void {
        var buffer: [4 * text_input.chunk_capacity]u8 = undefined;
        const length = self.text.lookup(&self.library.functions, raw.any.window, &raw.key, &buffer);
        var rest: []const u8 = buffer[0..length];
        while (rest.len > 0) {
            const split = text_input.next_chunk(rest);
            var payload: Event.TextInput = .{ .length = @intCast(split.chunk.len), .bytes = undefined };
            @memcpy(payload.bytes[0..split.chunk.len], split.chunk);
            try self.queue.append(self.library.allocator, .{ .window = window, .payload = .{ .text = payload } });
            rest = split.rest;
        }
    }

    /// Key repeat sends KeyRelease then KeyPress with the same keycode and time.
    /// X11_KeyRepeat peeks for that press; a release followed by it is dropped.
    fn is_auto_repeat_release(self: *Connection, release: *const xlib.Event) bool {
        const api = &self.library.functions;
        if (api.XPending(self.display) <= 0) return false;
        var next: xlib.Event = undefined;
        _ = api.XPeekEvent(self.display, &next);
        if (next.kind != xlib.key_press or next.key.keycode != release.key.keycode) return false;
        const release_time: u32 = @truncate(release.key.time);
        const press_time: u32 = @truncate(next.key.time);
        return press_time -% release_time < 2;
    }

    /// Updates the side-specific held state for modifier scancodes.
    fn update_held(self: *Connection, scancode: Scancode, pressed: bool) void {
        const side = modifier_side(scancode);
        if (side.bits() == 0) return;
        self.held_modifiers = if (pressed) self.held_modifiers.either(side) else self.held_modifiers.without(side);
    }

    /// Modifiers for an event: held physical modifier sides, plus the lock and
    /// level state the server reports in the event's state mask.
    pub fn modifiers_for_state(self: *const Connection, state: c_uint) Modifiers {
        const from_state = self.keyboard.modifiers_from_state(state);
        const sided = Modifiers.shift_keys.either(Modifiers.ctrl_keys).either(Modifiers.alt_keys).either(Modifiers.gui_keys);
        return self.held_modifiers.either(from_state.without(sided));
    }

    /// Rebuilds the held modifier sides from XQueryKeymap (X11 ReconcileKeyboardState).
    fn sync_held_modifiers(self: *Connection) void {
        const api = &self.library.functions;
        var keys: [32]u8 = @splat(0);
        _ = api.XQueryKeymap(self.display, &keys);
        var held: Modifiers = .none;
        for (0..256) |code| {
            if (keys[code / 8] & (@as(u8, 1) << @intCast(code % 8)) == 0) continue;
            held = held.either(modifier_side(self.keyboard.scancode(@intCast(code))));
        }
        self.held_modifiers = held;
    }

    /// Enables committed-text input for a window (creates its input context).
    /// Returns TextInputUnavailable when the locale has no usable input method.
    pub fn enable_text_input(self: *Connection, window: *const Window) Error!void {
        try self.text.enable(&self.library.functions, self.display, @intCast(@backingInt(window.id)));
    }

    /// Destroys the text-input context for a window.
    pub fn disable_text_input(self: *Connection, window: *const Window) void {
        self.text.disable(&self.library.functions, @intCast(@backingInt(window.id)));
    }

    /// Places the input method's candidate window at `position` (window coordinates).
    pub fn set_text_input_spot(self: *Connection, window: *const Window, position: geometry.Point(i32)) Error!void {
        const x = std.math.cast(i16, position.x) orelse return error.TextInputUnavailable;
        const y = std.math.cast(i16, position.y) orelse return error.TextInputUnavailable;
        try self.text.set_spot(&self.library.functions, @intCast(@backingInt(window.id)), x, y);
    }

    /// Reads the connected outputs of the root screen through RandR.
    pub fn outputs(self: *Connection, allocator: std.mem.Allocator) displays.Error!displays.OutputList {
        return displays.query(allocator, self.library, self.display, self.root_window());
    }

    /// Subscribes to RandR configuration changes (`display_changed` events).
    pub fn watch_displays(self: *Connection) displays.Error!void {
        try displays.select_events(self.library, self.display, self.root_window());
    }

    /// Switches an output to `mode` (exclusive fullscreen). Restore the previous
    /// mode by passing the Output read before the switch.
    pub fn set_display_mode(self: *Connection, output: displays.Output, mode: displays.Mode) displays.Error!void {
        try displays.set_mode(self.library, self.display, self.root_window(), output, mode);
        _ = self.library.functions.XFlush(self.display);
    }

    /// The state the window manager and server report for `window`: maximized,
    /// fullscreen, minimized (iconic), hidden, always-on-top, focused and urgent
    /// (demands attention). Read it again after a `window_state_changed` event.
    pub fn window_state(self: *const Connection, window_handle: *const Window) Error!ewmh.WindowState {
        if (!window_handle.alive) return error.WindowFailure;
        return ewmh.read(self, @intCast(@backingInt(window_handle.id)));
    }

    /// The raw X visual id of the visual every window of this connection uses
    /// (the screen's default visual). EGL config matching compares it to
    /// EGL_NATIVE_VISUAL_ID. XID values are 32-bit by protocol.
    pub fn default_visual_id(self: *const Connection) u32 {
        return @intCast(self.visual.id);
    }

    /// Moves the pointer to `position` in root (screen) coordinates. The server
    /// generates motion events; the window under the pointer changes as usual.
    pub fn warp_mouse_global(self: *Connection, position: geometry.Point(i32)) Error!void {
        const api = &self.library.functions;
        _ = api.XWarpPointer(self.display, xlib.none, self.root_window(), 0, 0, 0, 0, position.x, position.y);
        _ = api.XSync(self.display, 0);
    }

    /// Enables XInput2 for this connection (libXi, protocol 2.0 or later; touch
    /// later needs 2.2). Idempotent. Events are selected separately with
    /// `Window.select_xinput` and `set_raw_motion`.
    pub fn enable_xinput(self: *Connection) Error!void {
        try xinput.enable(self);
    }

    /// Selects or deselects raw relative motion on the root window. Requires
    /// `enable_xinput`. Raw motion arrives as `Payload.raw_motion`.
    pub fn set_raw_motion(self: *Connection, enabled: bool) Error!void {
        try xinput.set_raw_motion(self, enabled);
    }

    /// True when libXcursor is present, so `Cursor.themed` and `Cursor.system`
    /// can use the desktop theme.
    pub fn has_themed_cursors(self: *const Connection) bool {
        return self.library.xcursor != null;
    }
};

/// Blocks the calling thread for `milliseconds` (used only by the grab retry loop,
/// which SDL also runs on the calling thread). Interrupted sleeps are not resumed.
fn sleep_ms(milliseconds: u32) void {
    const request: std.os.linux.timespec = .{
        .sec = 0,
        .nsec = @as(isize, @intCast(milliseconds)) * std.time.ns_per_ms,
    };
    _ = std.os.linux.nanosleep(&request, null);
}

/// The left or right variant for a modifier scancode, or no modifiers.
fn modifier_side(scancode: Scancode) Modifiers {
    return switch (scancode) {
        .lshift => .{ .left_shift = true },
        .rshift => .{ .right_shift = true },
        .lctrl => .{ .left_ctrl = true },
        .rctrl => .{ .right_ctrl = true },
        .lalt => .{ .left_alt = true },
        .ralt => .{ .right_alt = true },
        .lgui => .{ .left_gui = true },
        .rgui => .{ .right_gui = true },
        else => .none,
    };
}

/// Native creation options. Visibility is caller-controlled: nothing shows implicitly.
/// Kind of override-redirect popup; it selects the _NET_WM_WINDOW_TYPE hint.
pub const PopupKind = enum { menu, tooltip };

/// Options for `Window.create_popup`. The position is relative to the parent window.
pub const PopupOptions = struct {
    position: geometry.Point(i32) = .{ .x = 0, .y = 0 },
    size: Size,
    kind: PopupKind = .menu,
    visible: bool = true,
};

pub const Options = struct {
    size: Size = .{ .width = 640, .height = 480 },
    title: []const u8 = "zdl",
    /// WM_CLASS instance and class names (ASCII, no NUL bytes).
    class_name: []const u8 = "zdl",
    visible: bool = true,
};

/// Owns an X server window and its graphics context, borrowing its Connection.
/// Destroy it before closing the connection. Calls must come from the thread
/// driving the connection.
pub const Window = struct {
    connection: *Connection,
    id: WindowId,
    size: Size,
    position: geometry.Point(i32) = .{ .x = 0, .y = 0 },
    gc: *xlib.Gc,
    minimum: ?Size = null,
    maximum: ?Size = null,
    alive: bool = true,
    /// Shared-memory frame for MIT-SHM presentation, created on first use.
    frame: ?shm.Frame = null,
    /// Set after MIT-SHM failed for this window; presentation then uses XPutImage.
    shm_failed: bool = false,

    /// Creates a default-visual window that receives input, focus, pointer and
    /// structure events, plus WM_DELETE_WINDOW, WM_CLASS, _NET_WM_PID and the
    /// title. Creation does not map the window unless `options.visible` is set.
    pub fn create(connection: *Connection, options: Options) Error!Window {
        if (options.size.width == 0 or options.size.height == 0) return error.InvalidSize;
        const root: xlib.Window = @intCast(@backingInt(connection.root));
        var result = try Window.open(connection, root, .{ .x = 0, .y = 0 }, options.size, false);
        errdefer result.deinit();
        dnd.advertise(connection, @intCast(@backingInt(result.id)));
        try result.set_class(options.class_name, options.class_name);
        try result.set_title(options.title);
        if (options.visible) try result.show();
        try connection.sync();
        return result;
    }

    /// Creates an override-redirect popup (a menu or tooltip) as a child of
    /// `parent`. The position is relative to the parent, and the window manager
    /// does not place or decorate it: the popup has no frame and is not managed.
    /// Menus take input with `set_mouse_grab` and `set_keyboard_grab` once shown,
    /// as SDL's popup grabs do.
    pub fn create_popup(parent: *const Window, options: PopupOptions) Error!Window {
        if (options.size.width == 0 or options.size.height == 0) return error.InvalidSize;
        try parent.require_alive();
        const connection = parent.connection;
        var result = try Window.open(connection, @intCast(@backingInt(parent.id)), options.position, options.size, true);
        errdefer result.deinit();
        const kind: AtomName = switch (options.kind) {
            .menu => ._NET_WM_WINDOW_TYPE_POPUP_MENU,
            .tooltip => ._NET_WM_WINDOW_TYPE_TOOLTIP,
        };
        var type_value = [_]c_ulong{connection.atom(kind)};
        _ = connection.library.functions.XChangeProperty(
            connection.display,
            @intCast(@backingInt(result.id)),
            connection.atom(._NET_WM_WINDOW_TYPE),
            xlib.xa_atom,
            32,
            xlib.prop_mode_replace,
            @ptrCast(&type_value),
            1,
        );
        try result.set_bordered(false);
        if (options.visible) try result.show();
        try connection.sync();
        return result;
    }

    /// Creates the server window with its graphics context, event selection,
    /// WM_PROTOCOLS entry and _NET_WM_PID. `override_redirect` bypasses the window
    /// manager for popups. The window is not mapped.
    fn open(connection: *Connection, parent: xlib.Window, position: geometry.Point(i32), size: Size, override_redirect: bool) Error!Window {
        const api = &connection.library.functions;
        const id = api.XCreateSimpleWindow(connection.display, parent, position.x, position.y, size.width, size.height, 0, 0, 0);
        if (id == 0) return error.WindowFailure;
        errdefer _ = api.XDestroyWindow(connection.display, id);
        if (override_redirect) {
            var attributes: xlib.XSetWindowAttributes = .{ .override_redirect = 1 };
            _ = api.XChangeWindowAttributes(connection.display, id, xlib.cw_override_redirect, &attributes);
        }

        var values: xlib.XGCValues = std.mem.zeroes(xlib.XGCValues);
        values.graphics_exposures = 0;
        const gc = api.XCreateGC(connection.display, id, xlib.gc_graphics_exposures, &values) orelse return error.WindowFailure;
        errdefer _ = api.XFreeGC(connection.display, gc);

        const event_mask = xlib.key_press_mask | xlib.key_release_mask | xlib.button_press_mask |
            xlib.button_release_mask | xlib.enter_window_mask | xlib.leave_window_mask |
            xlib.pointer_motion_mask | xlib.exposure_mask | xlib.structure_notify_mask |
            xlib.focus_change_mask | xlib.property_change_mask;
        _ = api.XSelectInput(connection.display, id, event_mask);

        var protocols = [_]xlib.Atom{connection.atom(.WM_DELETE_WINDOW)};
        _ = api.XSetWMProtocols(connection.display, id, &protocols, 1);

        var result: Window = .{
            .connection = connection,
            .id = @fromBackingInt(@intCast(id)),
            .size = size,
            .position = position,
            .gc = gc,
        };
        try result.set_pid();
        return result;
    }

    /// Frees the graphics context and destroys the server window.
    pub fn deinit(self: *Window) void {
        const api = &self.connection.library.functions;
        if (self.frame) |*frame| {
            if (self.connection.library.xext) |*extension| frame.deinit(extension, self.connection.display);
            self.frame = null;
        }
        _ = api.XFreeGC(self.connection.display, self.gc);
        if (self.alive) _ = api.XDestroyWindow(self.connection.display, @backingInt(self.id));
        self.* = undefined;
    }

    /// Sets the window title: _NET_WM_NAME as UTF-8, and WM_NAME with non-ASCII
    /// characters replaced by '?' for window managers that ignore UTF-8.
    pub fn set_title(self: *Window, title: []const u8) Error!void {
        try self.require_alive();
        const length = std.math.cast(c_int, title.len) orelse return error.TitleTooLong;
        const api = &self.connection.library.functions;
        const window = @backingInt(self.id);
        _ = api.XChangeProperty(self.connection.display, window, self.connection.atom(._NET_WM_NAME), self.connection.atom(.UTF8_STRING), 8, xlib.prop_mode_replace, title.ptr, length);

        const ascii = try self.connection.library.allocator.alloc(u8, title.len);
        defer self.connection.library.allocator.free(ascii);
        for (title, ascii) |byte, *out| out.* = if (byte < 0x80) byte else '?';
        _ = api.XChangeProperty(self.connection.display, window, self.connection.atom(.WM_NAME), xlib.xa_string, 8, xlib.prop_mode_replace, ascii.ptr, length);
    }

    /// Sets WM_CLASS (instance then class). Both names are copied through a
    /// NUL-terminated buffer; names longer than the buffer are rejected.
    pub fn set_class(self: *Window, instance: []const u8, class: []const u8) Error!void {
        try self.require_alive();
        var instance_buffer: [128]u8 = undefined;
        var class_buffer: [128]u8 = undefined;
        if (instance.len >= instance_buffer.len or class.len >= class_buffer.len) return error.TitleTooLong;
        @memcpy(instance_buffer[0..instance.len], instance);
        instance_buffer[instance.len] = 0;
        @memcpy(class_buffer[0..class.len], class);
        class_buffer[class.len] = 0;
        var hint: xlib.XClassHint = .{
            .res_name = @ptrCast(&instance_buffer),
            .res_class = @ptrCast(&class_buffer),
        };
        _ = self.connection.library.functions.XSetClassHint(self.connection.display, @backingInt(self.id), &hint);
    }

    /// Publishes the process ID as _NET_WM_PID so window managers can find it.
    fn set_pid(self: *Window) Error!void {
        const pid: c_ulong = @intCast(std.os.linux.getpid());
        var data = [_]c_ulong{pid};
        _ = self.connection.library.functions.XChangeProperty(
            self.connection.display,
            @backingInt(self.id),
            self.connection.atom(._NET_WM_PID),
            xlib.xa_cardinal,
            32,
            xlib.prop_mode_replace,
            @ptrCast(&data),
            1,
        );
    }

    /// Maps the window and flushes; exposure and map events arrive from poll.
    pub fn show(self: *Window) Error!void {
        try self.require_alive();
        _ = self.connection.library.functions.XMapWindow(self.connection.display, @backingInt(self.id));
        try self.connection.flush();
    }

    /// Unmaps without destroying the window or its resources.
    pub fn hide(self: *Window) Error!void {
        try self.require_alive();
        _ = self.connection.library.functions.XUnmapWindow(self.connection.display, @backingInt(self.id));
        try self.connection.flush();
    }

    /// Requests a new size. The window manager may choose another; apply the
    /// configured event to keep the cached size in step with the server.
    pub fn resize(self: *Window, size: Size) Error!void {
        try self.require_alive();
        if (size.width == 0 or size.height == 0) return error.InvalidSize;
        _ = self.connection.library.functions.XResizeWindow(self.connection.display, @backingInt(self.id), size.width, size.height);
        try self.connection.flush();
    }

    /// Requests a new top-left position in root coordinates.
    pub fn move(self: *Window, position: geometry.Point(i32)) Error!void {
        try self.require_alive();
        _ = self.connection.library.functions.XMoveWindow(self.connection.display, @backingInt(self.id), position.x, position.y);
        try self.connection.flush();
    }

    /// Sets the minimum size honored by the window manager (ICCCM WM_NORMAL_HINTS).
    /// Null removes the constraint.
    pub fn set_minimum_size(self: *Window, size: ?Size) Error!void {
        try self.require_alive();
        self.minimum = size;
        try self.update_size_hints();
    }

    /// Sets the maximum size. Null means the screen size, which is how SDL's
    /// unconstrained window reports itself to window managers.
    pub fn set_maximum_size(self: *Window, size: ?Size) Error!void {
        try self.require_alive();
        self.maximum = size;
        try self.update_size_hints();
    }

    fn update_size_hints(self: *Window) Error!void {
        const api = &self.connection.library.functions;
        const screen_width = api.XDisplayWidth(self.connection.display, self.connection.screen);
        const screen_height = api.XDisplayHeight(self.connection.display, self.connection.screen);
        const minimum = self.minimum orelse Size{ .width = 0, .height = 0 };
        const maximum = self.maximum orelse Size{ .width = @intCast(screen_width), .height = @intCast(screen_height) };
        var hints: xlib.XSizeHints = std.mem.zeroes(xlib.XSizeHints);
        hints.flags = xlib.p_min_size | xlib.p_max_size;
        hints.min_width = minimum.width;
        hints.min_height = minimum.height;
        hints.max_width = maximum.width;
        hints.max_height = maximum.height;
        api.XSetWMNormalHints(self.connection.display, @backingInt(self.id), &hints);
        try self.connection.flush();
    }

    /// Enters or leaves fullscreen through _NET_WM_STATE_FULLSCREEN.
    pub fn set_fullscreen(self: *Window, enabled: bool) Error!void {
        try self.send_state(enabled, &.{.{ .name = ._NET_WM_STATE_FULLSCREEN }});
    }

    /// Maximizes or restores both axes through _NET_WM_STATE_MAXIMIZED_VERT/HORZ.
    pub fn set_maximized(self: *Window, enabled: bool) Error!void {
        try self.send_state(enabled, &.{ .{ .name = ._NET_WM_STATE_MAXIMIZED_VERT }, .{ .name = ._NET_WM_STATE_MAXIMIZED_HORZ } });
    }

    /// Iconifies the window through the window manager (XIconifyWindow).
    pub fn minimize(self: *Window) Error!void {
        try self.require_alive();
        _ = self.connection.library.functions.XIconifyWindow(self.connection.display, @backingInt(self.id), self.connection.screen);
        try self.connection.flush();
    }

    /// Leaves fullscreen and maximized states, maps the window and raises it.
    pub fn restore(self: *Window) Error!void {
        try self.set_fullscreen(false);
        try self.set_maximized(false);
        try self.show();
        try self.raise();
    }

    /// Raises the window above its siblings.
    pub fn raise(self: *Window) Error!void {
        try self.require_alive();
        _ = self.connection.library.functions.XRaiseWindow(self.connection.display, @backingInt(self.id));
        try self.connection.flush();
    }

    /// Asks the window manager to activate the window (_NET_ACTIVE_WINDOW) and
    /// sets the X input focus directly for managers without EWMH support.
    pub fn focus(self: *Window) Error!void {
        try self.require_alive();
        try self.send_root_message(self.connection.atom(._NET_ACTIVE_WINDOW), .{ 1, 0, 0, 0, 0 });
        _ = self.connection.library.functions.XSetInputFocus(self.connection.display, @backingInt(self.id), xlib.revert_to_parent, xlib.current_time);
        try self.connection.flush();
    }

    /// Shows or hides window decorations through the Motif hints property.
    pub fn set_bordered(self: *Window, bordered: bool) Error!void {
        try self.require_alive();
        // MwmHints: flags, functions, decorations, input_mode, status. Only the
        // decorations flag is set; decorations 1 keeps the frame.
        var hints = [_]c_long{ xlib.mwm_hints_decorations, 0, if (bordered) 1 else 0, 0, 0 };
        _ = self.connection.library.functions.XChangeProperty(
            self.connection.display,
            @backingInt(self.id),
            self.connection.atom(._MOTIF_WM_HINTS),
            self.connection.atom(._MOTIF_WM_HINTS),
            32,
            xlib.prop_mode_replace,
            @ptrCast(&hints),
            hints.len,
        );
        try self.connection.flush();
    }

    /// Applies a cursor to this window (XDefineCursor). Pass null to use the parent's.
    pub fn set_cursor(self: *Window, cursor: ?*const Cursor) Error!void {
        try self.require_alive();
        const handle: xlib.Cursor = if (cursor) |value| value.handle else xlib.none;
        _ = self.connection.library.functions.XDefineCursor(self.connection.display, @backingInt(self.id), handle);
        try self.connection.flush();
    }

    /// Updates the cached size and position from a configured event.
    pub fn apply(self: *Window, event: Event) void {
        if (event.window != self.id) return;
        switch (event.payload) {
            .configured => |change| {
                if (change.size.width != 0 and change.size.height != 0) self.size = change.size;
                self.position = change.position;
            },
            .destroyed => self.alive = false,
            else => {},
        }
    }

    /// Presents a raster the size of the window. The whole view is transferred;
    /// see `present_dirty` for partial updates.
    pub fn present(self: *Window, allocator: std.mem.Allocator, view: surface.View) Error!void {
        const full = [_]geometry.Rect(i32){.{ .x = 0, .y = 0, .width = self.size.width, .height = self.size.height }};
        try self.present_dirty(allocator, view, &full);
    }

    /// Presents only the listed rectangles of `view` (window coordinates). Each
    /// rectangle is clipped to the window and empty ones are skipped, so only the
    /// dirty regions cross the socket (or the shared-memory segment). The whole
    /// view is converted to the server's pixel layout once per call, with
    /// `allocator` owning that temporary buffer.
    ///
    /// Uses MIT-SHM when the server supports it: rectangles are copied into a
    /// shared segment and sent with XShmPutImage, and the call waits for the
    /// previous put to complete before it writes again. Falls back to XPutImage
    /// when MIT-SHM is unavailable or the segment cannot be attached.
    pub fn present_dirty(self: *Window, allocator: std.mem.Allocator, view: surface.View, rectangles: []const geometry.Rect(i32)) Error!void {
        try self.require_alive();
        if (view.width != self.size.width or view.height != self.size.height) return error.SizeMismatch;
        const api = &self.connection.library.functions;
        const display = self.connection.display;

        // A throwaway XImage supplies the server's visual masks and row stride.
        const image = api.XCreateImage(display, self.connection.visual, self.connection.depth, 2, 0, null, self.size.width, self.size.height, 32, 0) orelse return error.AllocationFailed;
        defer {
            // The pixel buffer belongs to the caller or the segment, so detach it before destroying the metadata.
            image.data = null;
            _ = image.functions.destroy(image);
        }
        if (image.bits_per_pixel <= 0 or image.bits_per_pixel > 32 or @mod(image.bits_per_pixel, 8) != 0) return error.UnsupportedPixelFormat;
        const bytes_per_pixel: usize = @intCast(@divTrunc(image.bits_per_pixel, 8));
        const packed_format = try pixels.Packed.from_masks(@intCast(bytes_per_pixel), if (image.byte_order == 0) .little else .big, .{
            .r = std.math.cast(u32, image.red_mask) orelse return error.UnsupportedPixelFormat,
            .g = std.math.cast(u32, image.green_mask) orelse return error.UnsupportedPixelFormat,
            .b = std.math.cast(u32, image.blue_mask) orelse return error.UnsupportedPixelFormat,
        });
        var converted = try surface.Surface.convert(allocator, view, .{ .masked = packed_format }, null);
        defer converted.deinit();
        if (std.math.cast(usize, image.bytes_per_line) != converted.view.stride) return error.UnsupportedPixelFormat;

        if (try self.shared_frame()) |frame| {
            try self.connection.wait_shm_idle();
            const extension = &self.connection.library.xext.?;
            const destination = frame.pixels();
            for (rectangles) |rect| {
                const clip = self.clip_rect(rect) orelse continue;
                copy_region(destination, converted.view.data, frame.bytes_per_line, bytes_per_pixel, clip);
                _ = extension.XShmPutImage(display, @backingInt(self.id), self.gc, frame.image, clip.x, clip.y, clip.x, clip.y, @intCast(clip.width), @intCast(clip.height), 1);
                self.connection.shm_outstanding += 1;
            }
            try self.connection.flush();
            return;
        }

        image.data = converted.view.data.ptr;
        for (rectangles) |rect| {
            const clip = self.clip_rect(rect) orelse continue;
            _ = api.XPutImage(display, @backingInt(self.id), self.gc, image, clip.x, clip.y, clip.x, clip.y, @intCast(clip.width), @intCast(clip.height));
        }
        try self.connection.flush();
    }

    /// The shared-memory frame for the current window size, created on demand.
    /// Returns null when MIT-SHM is unavailable; the window then uses XPutImage.
    fn shared_frame(self: *Window) Error!?*shm.Frame {
        if (self.shm_failed or !self.connection.shm_enabled) return null;
        const display = self.connection.display;
        const extension: *xlib.Xext = if (self.connection.library.xext) |*value| value else return null;
        if (self.frame) |*frame| {
            if (frame.width == self.size.width and frame.height == self.size.height) return frame;
            frame.deinit(extension, display);
            self.frame = null;
        }
        self.frame = shm.Frame.create(extension, display, self.connection.visual, self.connection.depth, self.size.width, self.size.height) catch {
            self.shm_failed = true;
            return null;
        };
        // Attachment failures arrive as protocol errors, so confirm the server accepted the segment.
        self.connection.sync() catch {
            if (self.frame) |*frame| frame.deinit(extension, display);
            self.frame = null;
            self.shm_failed = true;
            return null;
        };
        return &self.frame.?;
    }

    /// The part of `rect` inside the window, or null when nothing remains.
    fn clip_rect(self: *const Window, rect: geometry.Rect(i32)) ?geometry.Rect(i32) {
        const x0 = @max(rect.x, 0);
        const y0 = @max(rect.y, 0);
        const x1 = @min(rect.x +| rect.width, @as(i32, self.size.width));
        const y1 = @min(rect.y +| rect.height, @as(i32, self.size.height));
        if (x1 <= x0 or y1 <= y0) return null;
        return .{ .x = x0, .y = y0, .width = x1 - x0, .height = y1 - y0 };
    }

    /// Copies the bytes of one clipped rectangle between two rasters with the same stride.
    fn copy_region(destination: []u8, source: []const u8, stride: usize, bytes_per_pixel: usize, rect: geometry.Rect(i32)) void {
        const start = @as(usize, @intCast(rect.x)) * bytes_per_pixel;
        const length = @as(usize, @intCast(rect.width)) * bytes_per_pixel;
        for (0..@as(usize, @intCast(rect.height))) |row| {
            const offset = (@as(usize, @intCast(rect.y)) + row) * stride + start;
            @memcpy(destination[offset..][0..length], source[offset..][0..length]);
        }
    }

    fn require_alive(self: *const Window) Error!void {
        if (!self.alive) return error.WindowFailure;
    }

    /// The top-left corner in root (screen) coordinates, asked of the server
    /// (XTranslateCoordinates). The `position` field is only the last value seen
    /// in a ConfigureNotify and can lag window-manager moves; use this when it matters.
    pub fn query_position(self: *const Window) Error!geometry.Point(i32) {
        try self.require_alive();
        const api = &self.connection.library.functions;
        var x: c_int = 0;
        var y: c_int = 0;
        var child: xlib.Window = 0;
        if (api.XTranslateCoordinates(self.connection.display, @backingInt(self.id), self.connection.root_window(), 0, 0, &x, &y, &child) == 0) {
            return error.WindowFailure;
        }
        return .{ .x = x, .y = y };
    }

    /// Moves the pointer to `position` in this window's coordinates (XWarpPointer).
    /// The server then reports the motion like any user movement.
    pub fn warp_mouse(self: *Window, position: geometry.Point(i32)) Error!void {
        try self.require_alive();
        const api = &self.connection.library.functions;
        _ = api.XWarpPointer(self.connection.display, xlib.none, @backingInt(self.id), 0, 0, 0, 0, position.x, position.y);
        _ = api.XSync(self.connection.display, 0);
    }

    /// The raw X visual id of this window. Windows use the connection's default
    /// visual, so this equals `Connection.default_visual_id`. EGL matches it
    /// against EGL_NATIVE_VISUAL_ID when choosing configs.
    pub fn visual_id(self: *const Window) u32 {
        return self.connection.default_visual_id();
    }

    /// Keeps the window above ordinary windows (_NET_WM_STATE_ABOVE). A mapped
    /// window gets a ClientMessage that the window manager acts on. An unmapped
    /// window has the state written to its _NET_WM_STATE property, which the
    /// manager reads when it maps the window; clearing it removes the whole property.
    pub fn set_always_on_top(self: *Window, enabled: bool) Error!void {
        try self.require_alive();
        const connection = self.connection;
        if (ewmh.read(connection, @intCast(@backingInt(self.id))).hidden) {
            const api = &connection.library.functions;
            const property = connection.atom(._NET_WM_STATE);
            if (enabled) {
                var above = [_]xlib.Atom{connection.atom(._NET_WM_STATE_ABOVE)};
                _ = api.XChangeProperty(connection.display, @backingInt(self.id), property, xlib.xa_atom, 32, xlib.prop_mode_replace, @ptrCast(&above), 1);
            } else {
                _ = api.XDeleteProperty(connection.display, @backingInt(self.id), property);
            }
            try connection.flush();
        } else {
            try self.send_state(enabled, &.{.{ .name = ._NET_WM_STATE_ABOVE }});
        }
    }

    /// Sets window opacity from 0 (transparent) to 1 (opaque) through
    /// _NET_WM_WINDOW_OPACITY, which compositors honor. Values are clamped, and 1
    /// removes the property, as SDL does.
    pub fn set_opacity(self: *Window, opacity: f32) Error!void {
        try self.require_alive();
        const connection = self.connection;
        const api = &connection.library.functions;
        // Written as an if chain so NaN falls through to fully transparent.
        const value: f32 = if (opacity >= 1) 1 else if (opacity > 0) opacity else 0;
        if (value == 1) {
            _ = api.XDeleteProperty(connection.display, @backingInt(self.id), connection.atom(._NET_WM_WINDOW_OPACITY));
        } else {
            // A 32-bit CARDINAL: the server stores each item as a native long.
            var alpha = [_]c_long{@intFromFloat(@as(f64, value) * 4294967295.0)};
            _ = api.XChangeProperty(connection.display, @backingInt(self.id), connection.atom(._NET_WM_WINDOW_OPACITY), xlib.xa_cardinal, 32, xlib.prop_mode_replace, @ptrCast(&alpha), 1);
        }
        try connection.flush();
    }

    /// Sets the window icon (_NET_WM_ICON) from a raster. The view is converted to
    /// 32-bit ARGB (alpha in the top byte) with `allocator`, which holds the
    /// temporary property buffer for the duration of the call. The icon is the
    /// width, height and then one long per pixel, in row order.
    pub fn set_icon(self: *Window, allocator: std.mem.Allocator, view: surface.View) Error!void {
        try self.require_alive();
        const connection = self.connection;
        const argb = pixels.Packed.from_masks(4, .little, .{
            .r = 0x00ff0000,
            .g = 0x0000ff00,
            .b = 0x000000ff,
            .a = 0xff000000,
        }) catch return error.UnsupportedPixelFormat;
        var converted = try surface.Surface.convert(allocator, view, .{ .masked = argb }, null);
        defer converted.deinit();
        const width = converted.view.width;
        const height = converted.view.height;
        const count = 2 + @as(usize, width) * height;
        const property = try allocator.alloc(c_long, count);
        defer allocator.free(property);
        property[0] = width;
        property[1] = height;
        var index: usize = 2;
        for (0..height) |row| {
            const line = converted.view.data[row * converted.view.stride ..];
            for (0..width) |column| {
                property[index] = std.mem.readInt(u32, line[column * 4 ..][0..4], .little);
                index += 1;
            }
        }
        const api = &connection.library.functions;
        _ = api.XChangeProperty(connection.display, @backingInt(self.id), connection.atom(._NET_WM_ICON), xlib.xa_cardinal, 32, xlib.prop_mode_replace, @ptrCast(property.ptr), @intCast(count));
        try connection.flush();
    }

    /// Operations on the window manager's urgency hint (WM_HINTS UrgencyHint),
    /// which it shows as attention on the window.
    pub const FlashOperation = enum { cancel, briefly, until_focused };

    /// Sets or clears the urgency hint. `briefly` and `until_focused` both set it.
    /// SDL cancels a brief flash after one second and skips the flash when the
    /// window has focus; this layer has no timers and does not know the focus
    /// state, so the caller sends `.cancel` when it is done and avoids flashing a
    /// focused window.
    pub fn flash(self: *Window, operation: FlashOperation) Error!void {
        try self.require_alive();
        const connection = self.connection;
        const api = &connection.library.functions;
        const hints = api.XGetWMHints(connection.display, @backingInt(self.id)) orelse return error.WindowFailure;
        defer _ = api.XFree(hints);
        hints.flags &= ~xlib.urgency_hint;
        if (operation != .cancel) hints.flags |= xlib.urgency_hint;
        _ = api.XSetWMHints(connection.display, @backingInt(self.id), hints);
        try connection.flush();
    }

    /// Makes this window a transient of `parent` (WM_TRANSIENT_FOR), which window
    /// managers use to keep dialogs above and related to their parent.
    pub fn set_transient_for(self: *Window, parent: *const Window) Error!void {
        try self.require_alive();
        const connection = self.connection;
        _ = connection.library.functions.XSetTransientForHint(connection.display, @backingInt(self.id), @backingInt(parent.id));
        try connection.flush();
    }

    /// Grabs the pointer to this window and confines it there (true), or releases
    /// the grab (false). Matches SDL's X11_SetWindowMouseGrab: a hidden window
    /// is not grabbed, the window is raised after a grab, and a refused grab is
    /// retried up to 100 times, 50 ms apart. The first full failure marks the
    /// connection so later grabs fail at once (SDL's broken_pointer_grab rule),
    /// and the result is GrabFailed.
    pub fn set_mouse_grab(self: *Window, grabbed: bool) Error!void {
        try self.require_alive();
        const connection = self.connection;
        const api = &connection.library.functions;
        const display = connection.display;
        const id: xlib.Window = @intCast(@backingInt(self.id));
        if (grabbed) {
            if (ewmh.read(connection, id).hidden) return;
            if (!connection.pointer_grab_broken) {
                const mask: c_uint = @intCast(xlib.button_press_mask | xlib.button_release_mask | xlib.pointer_motion_mask | xlib.focus_change_mask);
                var result: c_int = 0;
                for (0..100) |attempt| {
                    result = api.XGrabPointer(display, id, 0, mask, xlib.grab_mode_async, xlib.grab_mode_async, id, xlib.none, xlib.current_time);
                    if (result == xlib.grab_success) break;
                    if (attempt + 1 < 100) sleep_ms(50);
                }
                if (result != xlib.grab_success) connection.pointer_grab_broken = true;
            }
            _ = api.XRaiseWindow(display, id);
        } else {
            _ = api.XUngrabPointer(display, xlib.current_time);
        }
        _ = api.XSync(display, 0);
        if (connection.pointer_grab_broken) return error.GrabFailed;
    }

    /// Grabs the keyboard to this window (true) or releases it (false), as SDL's
    /// X11_SetWindowKeyboardGrab. A hidden window is not grabbed; the grab applies
    /// to the owner window with owner events on.
    pub fn set_keyboard_grab(self: *Window, grabbed: bool) Error!void {
        try self.require_alive();
        const connection = self.connection;
        const api = &connection.library.functions;
        const display = connection.display;
        const id: xlib.Window = @intCast(@backingInt(self.id));
        if (grabbed) {
            if (ewmh.read(connection, id).hidden) return;
            _ = api.XGrabKeyboard(display, id, 1, xlib.grab_mode_async, xlib.grab_mode_async, xlib.current_time);
        } else {
            _ = api.XUngrabKeyboard(display, xlib.current_time);
        }
        _ = api.XSync(display, 0);
    }

    /// Shapes the window's input region from the alpha channel of `view`, scaled
    /// to the window size: pixels with zero alpha pass pointer input through, as
    /// SDL's X11_UpdateWindowShape does with ShapeInput. A null view removes the
    /// shape. Needs libXext's XShape. The mask is built in `allocator` and freed
    /// before returning.
    pub fn set_shape(self: *Window, allocator: std.mem.Allocator, view: ?surface.View) Error!void {
        try self.require_alive();
        try xshape.set_input_shape(self.connection, allocator, @intCast(@backingInt(self.id)), self.size, view);
    }

    /// Selects XInput2 events for this window. Requires `Connection.enable_xinput`.
    /// Selecting `motion` stops core MotionNotify for this window, as the X
    /// protocol requires; see xinput.zig for how the pointer then arrives.
    pub fn select_xinput(self: *Window, events: xinput.Events) Error!void {
        try self.require_alive();
        try xinput.select_window(self.connection, @intCast(@backingInt(self.id)), events);
    }

    const StateAtom = struct { name: AtomName };

    /// Sends a _NET_WM_STATE client message to the root window: action 1 adds,
    /// 0 removes, as the EWMH specification defines.
    fn send_state(self: *Window, enabled: bool, states: []const StateAtom) Error!void {
        try self.require_alive();
        const action: c_long = if (enabled) 1 else 0;
        const first = self.connection.atom(states[0].name);
        const second: xlib.Atom = if (states.len > 1) self.connection.atom(states[1].name) else xlib.none;
        try self.send_root_message(self.connection.atom(._NET_WM_STATE), .{ action, @bitCast(first), @bitCast(second), 1, 0 });
    }

    /// Sends a 32-bit ClientMessage to the root window, the EWMH way to ask the
    /// window manager to act on this window. `data` holds the message longs; the
    /// window itself travels in the message's window field.
    fn send_root_message(self: *Window, message_type: xlib.Atom, data: [5]c_long) Error!void {
        var event: xlib.Event = undefined;
        @memset(std.mem.asBytes(&event), 0);
        event.client.header.kind = xlib.client_message;
        event.client.header.display = self.connection.display;
        event.client.header.window = @backingInt(self.id);
        event.client.message_type = message_type;
        event.client.format = xlib.client_message_format;
        event.client.data.longs = data;
        const root: xlib.Window = @intCast(@backingInt(self.connection.root));
        _ = self.connection.library.functions.XSendEvent(
            self.connection.display,
            root,
            0,
            xlib.substructure_redirect_mask | xlib.substructure_notify_mask,
            &event,
        );
    }
};

/// Standard cursor shapes from the X cursor font.
pub const CursorShape = enum {
    arrow,
    hand,
    text,
    crosshair,
    wait,
    move,
    horizontal_resize,
    vertical_resize,
    help,
    /// Pointing hand (SDL_SYSTEM_CURSOR_POINTER); `hand` is the same font shape.
    pointer,
    /// Busy but interactive (SDL_SYSTEM_CURSOR_PROGRESS): the watch shape.
    progress,
    /// Action refused (SDL_SYSTEM_CURSOR_NOT_ALLOWED): the pirate shape in the X font.
    not_allowed,
    /// Diagonal resizes along the two diagonals (SDL_SYSTEM_CURSOR_NWSE/NESW_RESIZE).
    nwse_resize,
    nesw_resize,
    /// Edge and corner resizes (SDL_SYSTEM_CURSOR_N/NE/E/SE/S/SW/W/NW_RESIZE).
    n_resize,
    ne_resize,
    e_resize,
    se_resize,
    s_resize,
    sw_resize,
    w_resize,
    nw_resize,
};

/// An X cursor owned by its Connection's display. Free it before closing the
/// connection; cursors used by windows stay valid until freed.
pub const Cursor = struct {
    display: *xlib.Display,
    api: *const xlib.Functions,
    handle: xlib.Cursor,

    /// Creates a standard cursor from the X cursor font. The shape codes follow
    /// SDL_x11mouse.c's GetLegacySystemCursorShape, so crosshair uses `tcross`.
    pub fn standard(connection: *Connection, shape: CursorShape) Error!Cursor {
        const shape_code: c_uint = switch (shape) {
            .arrow => xlib.cursor_xc_arrow,
            .hand, .pointer => xlib.cursor_xc_hand2,
            .text => xlib.cursor_xc_xterm,
            .crosshair => xlib.cursor_xc_tcross,
            .wait, .progress => xlib.cursor_xc_watch,
            .move => xlib.cursor_xc_fleur,
            .horizontal_resize => xlib.cursor_xc_sb_h_double_arrow,
            .vertical_resize => xlib.cursor_xc_sb_v_double_arrow,
            .help => xlib.cursor_xc_question_arrow,
            .not_allowed => xlib.cursor_xc_pirate,
            .nwse_resize, .nw_resize => xlib.cursor_xc_top_left_corner,
            .nesw_resize, .ne_resize => xlib.cursor_xc_top_right_corner,
            .n_resize => xlib.cursor_xc_top_side,
            .e_resize => xlib.cursor_xc_right_side,
            .se_resize => xlib.cursor_xc_bottom_right_corner,
            .s_resize => xlib.cursor_xc_bottom_side,
            .sw_resize => xlib.cursor_xc_bottom_left_corner,
            .w_resize => xlib.cursor_xc_left_side,
        };
        const handle = connection.library.functions.XCreateFontCursor(connection.display, shape_code);
        if (handle == 0) return error.CursorFailure;
        return .{ .display = connection.display, .api = &connection.library.functions, .handle = handle };
    }

    /// The CSS cursor name for a shape (SDL_GetCSSCursorName), used to look the
    /// shape up in the desktop's cursor theme.
    pub fn css_name(shape: CursorShape) [:0]const u8 {
        return switch (shape) {
            .arrow => "default",
            .hand, .pointer => "pointer",
            .text => "text",
            .crosshair => "crosshair",
            .wait => "wait",
            .move => "move",
            .horizontal_resize => "ew-resize",
            .vertical_resize => "ns-resize",
            .help => "help",
            .progress => "progress",
            .not_allowed => "not-allowed",
            .nwse_resize => "nwse-resize",
            .nesw_resize => "nesw-resize",
            .n_resize => "n-resize",
            .ne_resize => "ne-resize",
            .e_resize => "e-resize",
            .se_resize => "se-resize",
            .s_resize => "s-resize",
            .sw_resize => "sw-resize",
            .w_resize => "w-resize",
            .nw_resize => "nw-resize",
        };
    }

    /// Loads a cursor from the desktop theme by CSS name (libXcursor). Fails with
    /// ThemedCursorUnavailable when libXcursor is absent or the theme lacks the cursor.
    pub fn themed(connection: *Connection, name: [:0]const u8) Error!Cursor {
        const xcursor = connection.library.xcursor orelse return error.ThemedCursorUnavailable;
        const handle = xcursor.XcursorLibraryLoadCursor(connection.display, name.ptr);
        if (handle == 0) return error.ThemedCursorUnavailable;
        return .{ .display = connection.display, .api = &connection.library.functions, .handle = handle };
    }

    /// The cursor for a shape as the desktop draws it: the themed cursor when
    /// libXcursor provides one, otherwise the X font shape. This is SDL's system
    /// cursor order.
    pub fn system(connection: *Connection, shape: CursorShape) Error!Cursor {
        return themed(connection, css_name(shape)) catch standard(connection, shape);
    }

    /// Creates an invisible cursor from a blank 8x8 bitmap.
    pub fn hidden(connection: *Connection) Error!Cursor {
        const api = &connection.library.functions;
        const blank: [8]u8 = @splat(0);
        const pixmap = api.XCreateBitmapFromData(connection.display, @backingInt(connection.root), &blank, 8, 8);
        if (pixmap == 0) return error.CursorFailure;
        defer _ = api.XFreePixmap(connection.display, pixmap);
        var color: xlib.XColor = std.mem.zeroes(xlib.XColor);
        const handle = api.XCreatePixmapCursor(connection.display, pixmap, pixmap, &color, &color, 0, 0);
        if (handle == 0) return error.CursorFailure;
        return .{ .display = connection.display, .api = api, .handle = handle };
    }

    /// Releases the cursor on the server.
    pub fn deinit(self: *Cursor) void {
        _ = self.api.XFreeCursor(self.display, self.handle);
        self.* = undefined;
    }
};
