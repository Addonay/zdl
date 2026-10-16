//! Owner-thread execution of queued semantic document commands. No callbacks,
//! scene publication, focus/modal authorization or native ingress occurs here.
const doc = @import("../text/document.zig");
const registry = @import("../text/registry.zig");
const queue = @import("action_queue.zig");

/// Owns the accepted document result independently of scene and delivery leases.
pub const Result = union(enum) {
    replacement: doc.EditResult,
    selection: doc.Snapshot,
    pub fn deinit(self: *Result) void {
        switch (self.*) {
            .replacement => |*value| value.deinit(),
            .selection => |*value| value.deinit(),
        }
        self.* = undefined;
    }
    /// Borrows until this Result is deinitialized.
    pub fn snapshot(self: *const Result) *const doc.Snapshot {
        return switch (self.*) {
            .replacement => |*value| &value.snapshot,
            .selection => |*value| value,
        };
    }
};

/// Validate against the live semantic owner, then execute one exact-revision
/// document command. All access, cancellation and close must be serialized on
/// this thread; no user/provider callback is invoked between validation/effect/
/// completion. Caller authorizes seat/modal policy before invoking this function.
///
/// Active failed requests receive a rejected receipt. Cancelled/completed leases
/// return AlreadyFinalized without changing their outcome. Success finalizes the
/// receipt before returning an owning result; scene refresh is a separate step
/// and must never replay this delivery if publication later fails. Edit options
/// are controller policy, not supplied by an untrusted native request.
pub fn dispatch(owner: anytype, documents: *registry.Registry, delivery: *queue.Delivery, options: doc.EditOptions) !Result {
    if (!delivery.active()) return error.AlreadyFinalized;
    const request = try delivery.request();
    const intent = owner.validate_semantic_action(request) catch |err| return reject(delivery, err);
    const target = intent.document orelse return reject(delivery, error.NotDocumentAction);
    const result: Result = switch (intent.payload) {
        .replace_text => |value| .{ .replacement = documents.replace(target, value.range, value.text, options) catch |err| return reject(delivery, err) },
        .set_selection => |value| .{ .selection = documents.set_selection(target, value.selection) catch |err| return reject(delivery, err) },
        else => return reject(delivery, error.NotDocumentAction),
    };
    // Under the documented serialized contract no cancellation or callback can
    // intervene; complete performs no allocation and this lease is still active.
    delivery.complete(.handled) catch unreachable;
    return result;
}
fn reject(delivery: *queue.Delivery, err: anyerror) anyerror {
    delivery.complete(.{ .rejected = err }) catch unreachable;
    return err;
}
