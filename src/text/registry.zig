//! Owner-thread document registrations for delayed editor/native actions.
//! Mutable Documents stay application-owned and at stable addresses until all
//! registrations end. Snapshots own only immutable document data. No OS/native
//! callbacks are installed here; external producers must separately quiesce.
const std = @import("std");
const identity = @import("../core/identity.zig");
const document = @import("document.zig");
pub const Error = document.Error || error{ RegistryClosed, ForeignRegistry, StaleRegistration, StaleDocument, RegistrationLimit };
pub const Handle = struct { domain: identity.Domain, slot: u32, generation: u64 };
/// Plain metadata: no document pointer or payload lease. Capture the revision
/// when the request is created; dispatch must not silently substitute a new one.
pub const Target = struct { registration: Handle, revision: document.Revision };
pub const Options = struct { max_registrations: u32 = 4096, max_slots: u32 = 8192 };
const Slot = struct {
    generation: u64 = 1,
    retired: bool = false,
    pointer: ?*document.Document = null,
    document_id: document.DocumentId = undefined,
    next_free: ?u32 = null,
};
const Core = struct {
    allocator: std.mem.Allocator,
    domain: identity.Domain,
    options: Options,
    references: usize = 1,
    closed: bool = false,
    live: usize = 0,
    free_head: ?u32 = null,
    slots: std.ArrayList(Slot) = .empty,
    fn release(self: *Core) void {
        self.references -= 1;
        if (self.references == 0) {
            const allocator = self.allocator;
            self.slots.deinit(allocator);
            allocator.destroy(self);
        }
    }
    fn entry(self: *Core, handle: Handle) Error!*Slot {
        if (self.closed) return error.RegistryClosed;
        if (handle.domain != self.domain) return error.ForeignRegistry;
        if (handle.slot >= self.slots.items.len) return error.StaleRegistration;
        const slot = &self.slots.items[handle.slot];
        if (slot.pointer == null or slot.generation != handle.generation) return error.StaleRegistration;
        return slot;
    }
    fn resolve(self: *Core, handle: Handle) Error!*document.Document {
        const slot = try self.entry(handle);
        const pointer = slot.pointer.?;
        const revision = try pointer.current_revision();
        // This catches an in-place replacement at a still-live address; it cannot
        // make freeing a borrowed Document before unregistering it safe.
        if (revision.document != slot.document_id) return error.StaleDocument;
        return pointer;
    }
    fn invalidate(self: *Core, index: u32) void {
        const slot = &self.slots.items[index];
        slot.pointer = null;
        self.live -= 1;
        if (slot.generation == std.math.maxInt(u64)) {
            slot.retired = true;
            slot.next_free = null;
        } else {
            slot.generation += 1;
            slot.next_free = self.free_head;
            self.free_head = index;
        }
    }
};
/// Owns logical routing identity, not the borrowed Document. Move, do not
/// independently deinitialize shallow copies. close is idempotent and cannot
/// allocate/fail; it also works after the Registry owner is destroyed.
pub const Registration = struct {
    core: ?*Core,
    id: Handle,
    /// Metadata may be retained after close; resolution will reject it as stale.
    pub fn handle(self: *const Registration) Handle {
        return self.id;
    }
    /// Invalidates before releasing the last owner reference. Does not close the
    /// application document or unregister any external OS/provider callback.
    pub fn close(self: *Registration) void {
        const core = self.core orelse return;
        if (!core.closed) {
            const slot = core.entry(self.id) catch null;
            if (slot != null) core.invalidate(self.id.slot);
        }
        self.core = null;
        core.release();
    }
    /// Alias for scoped ownership cleanup.
    pub fn deinit(self: *Registration) void {
        self.close();
    }
};
/// A movable owner of a heap-stable registration domain. All access (including
/// action dispatch) is serialized on the document/UI owner thread. Foreign
/// callbacks enqueue owned messages containing Target; they never call this API.
pub const Registry = struct {
    core: *Core,
    /// Creates an empty routing domain with explicit registration/slot limits.
    pub fn init(allocator: std.mem.Allocator, options: Options) Error!Registry {
        if (options.max_registrations == 0 or options.max_slots < options.max_registrations) return error.InvalidOptions;
        const core = try allocator.create(Core);
        errdefer allocator.destroy(core);
        core.* = .{ .allocator = allocator, .domain = try identity.issue_domain(), .options = options };
        return .{ .core = core };
    }
    /// Invalidates every handle without allocation or document dereferences.
    pub fn close(self: *Registry) void {
        if (self.core.closed) return;
        self.core.closed = true;
        for (self.core.slots.items, 0..) |slot, i| if (slot.pointer != null) self.core.invalidate(@intCast(i));
    }
    /// Outstanding Registration values keep their cleanup core alive.
    pub fn deinit(self: *Registry) void {
        self.close();
        self.core.release();
        self.* = undefined;
    }
    /// Borrows a live application document. Multiple independent views may
    /// register the same document. It must not move/die before unregister/close.
    pub fn register(self: *Registry, value: *document.Document) Error!Registration {
        const core = self.core;
        if (core.closed) return error.RegistryClosed;
        if (core.live >= core.options.max_registrations) return error.RegistrationLimit;
        if (core.references == std.math.maxInt(usize)) return error.ReferenceLimit;
        const revision = try value.current_revision();
        const index: u32 = core.free_head orelse block: {
            if (core.slots.items.len >= core.options.max_slots) return error.RegistrationLimit;
            const appended: u32 = @intCast(core.slots.items.len);
            try core.slots.append(core.allocator, .{});
            break :block appended;
        };
        const slot = &core.slots.items[index];
        if (core.free_head != null) core.free_head = slot.next_free;
        slot.next_free = null;
        slot.document_id = revision.document;
        slot.pointer = value;
        core.live += 1;
        core.references += 1;
        return .{ .core = core, .id = .{ .domain = core.domain, .slot = @intCast(index), .generation = slot.generation } };
    }
    /// Explicit early invalidation. A later owning Registration.close is safe
    /// and cannot invalidate a new registration that reused the slot.
    pub fn unregister(self: *Registry, handle: Handle) Error!void {
        _ = try self.core.entry(handle);
        self.core.invalidate(handle.slot);
    }
    /// Owning snapshot; its immutable data can outlive registration/document.
    pub fn snapshot(self: *Registry, handle: Handle) Error!document.Snapshot {
        return (try self.core.resolve(handle)).snapshot();
    }
    /// Applies only to this live view and the exact observed document revision.
    pub fn apply(self: *Registry, target: Target, edits: []const document.Replacement, options: document.EditOptions) Error!document.EditResult {
        return (try self.core.resolve(target.registration)).apply(target.revision, edits, options);
    }
    /// Same checked dispatch path for a single replacement.
    pub fn replace(self: *Registry, target: Target, range: document.Range, text: []const u8, options: document.EditOptions) Error!document.EditResult {
        return (try self.core.resolve(target.registration)).replace(target.revision, range, text, options);
    }
    /// Revision-checked selection/action result; no mutable document pointer escapes.
    pub fn set_selection(self: *Registry, target: Target, selection: document.Selection) Error!document.Snapshot {
        return (try self.core.resolve(target.registration)).set_selection(target.revision, selection);
    }
    /// Revision-checked history traversal through the same live binding.
    pub fn undo(self: *Registry, target: Target) Error!document.Snapshot {
        return (try self.core.resolve(target.registration)).undo(target.revision);
    }
    /// Revision-checked redo through the same live binding.
    pub fn redo(self: *Registry, target: Target) Error!document.Snapshot {
        return (try self.core.resolve(target.registration)).redo(target.revision);
    }
};

test "document registration retires saturated slots and reference issuance fails safely" {
    const t = std.testing;
    var doc = try document.Document.init(t.allocator, "x", .{});
    defer doc.deinit();
    var registry = try Registry.init(t.allocator, .{ .max_registrations = 1, .max_slots = 1 });
    defer registry.deinit();
    registry.core.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, registry.register(&doc));
    registry.core.references = 1;
    var registration = try registry.register(&doc);
    defer registration.close();
    registry.core.slots.items[0].generation = std.math.maxInt(u64);
    registration.id.generation = std.math.maxInt(u64);
    const handle = registration.handle();
    registration.close();
    try t.expect(registry.core.slots.items[0].retired);
    try t.expectError(error.StaleRegistration, registry.snapshot(handle));
    try t.expectError(error.RegistrationLimit, registry.register(&doc));
}

test "document registration captured identity mismatch rejects before document mutation" {
    const t = std.testing;
    var one = try document.Document.init(t.allocator, "one", .{});
    defer one.deinit();
    var two = try document.Document.init(t.allocator, "two", .{});
    defer two.deinit();
    var registry = try Registry.init(t.allocator, .{});
    defer registry.deinit();
    var view = try registry.register(&one);
    defer view.close();
    registry.core.slots.items[0].document_id = (try two.current_revision()).document;
    try t.expectError(error.StaleDocument, registry.replace(.{ .registration = view.handle(), .revision = try one.current_revision() }, .{ .start_byte = 0, .end_byte = 0 }, "bad", .{}));
    var original = try one.snapshot();
    defer original.deinit();
    try t.expectEqualStrings("one", original.text());
}
