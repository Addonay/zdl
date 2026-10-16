//! Private ABI for the pinned disposable leased AccessKit provider.
const std = @import("std");
const zdl = @import("zdl");
const NativeInbox = @import("ingress.zig").Inbox(8, 64);
const NativeRouter = @import("router.zig").Router(NativeInbox, 16);
const Adapter = opaque {};
const Tree = opaque {};
const Request = opaque {};
const NativeNode = opaque {};
const TreeInfo = opaque {};
const Rect = extern struct { x0: f64, y0: f64, x1: f64, y1: f64 };
const Activation = *const fn (?*anyopaque) callconv(.c) ?*Tree;
const Action = *const fn (*Request, ?*anyopaque) callconv(.c) void;
const Notify = *const fn (?*anyopaque) callconv(.c) void;
const Factory = *const fn (?*anyopaque) callconv(.c) *Tree;
const Visitor = *const fn (u64, u32, [*]const u8, usize, ?*anyopaque) callconv(.c) void;
const Functions = struct {
    zdl_accesskit_probe_actions_for_node: *const fn (Action, ?*anyopaque, u64) callconv(.c) void,
    zdl_accesskit_tree_clone: *const fn (*const Tree) callconv(.c) *Tree,
    zdl_accesskit_probe_activation: *const fn (Activation, ?*anyopaque) callconv(.c) usize,
    zdl_accesskit_probe_factory: *const fn (Factory, ?*anyopaque) callconv(.c) usize,
    accesskit_unix_adapter_update_if_active: *const fn (*Adapter, Factory, ?*anyopaque) callconv(.c) void,

    zdl_accesskit_node_new: *const fn (u32, u32, u32, i32) callconv(.c) ?*NativeNode,
    zdl_accesskit_probe_tree: *const fn (*const Tree) callconv(.c) usize,
    zdl_accesskit_probe_tree_properties: *const fn (*const Tree) callconv(.c) void,
    accesskit_node_free: *const fn (*NativeNode) callconv(.c) void,
    accesskit_node_set_label_with_length: *const fn (*NativeNode, [*]const u8, usize) callconv(.c) void,
    accesskit_node_set_description_with_length: *const fn (*NativeNode, [*]const u8, usize) callconv(.c) void,
    accesskit_node_set_value_with_length: *const fn (*NativeNode, [*]const u8, usize) callconv(.c) void,
    accesskit_node_push_child: *const fn (*NativeNode, u64) callconv(.c) void,
    accesskit_node_push_labelled_by: *const fn (*NativeNode, u64) callconv(.c) void,
    accesskit_node_push_described_by: *const fn (*NativeNode, u64) callconv(.c) void,
    accesskit_node_set_active_descendant: *const fn (*NativeNode, u64) callconv(.c) void,
    accesskit_node_set_numeric_value: *const fn (*NativeNode, f64) callconv(.c) void,
    accesskit_node_set_min_numeric_value: *const fn (*NativeNode, f64) callconv(.c) void,
    accesskit_node_set_max_numeric_value: *const fn (*NativeNode, f64) callconv(.c) void,
    accesskit_node_set_size_of_set: *const fn (*NativeNode, usize) callconv(.c) void,
    accesskit_node_set_position_in_set: *const fn (*NativeNode, usize) callconv(.c) void,
    accesskit_node_set_bounds: *const fn (*NativeNode, Rect) callconv(.c) void,
    accesskit_tree_info_new: *const fn (u64) callconv(.c) ?*TreeInfo,
    accesskit_tree_update_with_capacity_and_focus: *const fn (usize, u64) callconv(.c) ?*Tree,
    accesskit_tree_update_free: *const fn (*Tree) callconv(.c) void,
    accesskit_tree_update_push_node: *const fn (*Tree, u64, *NativeNode) callconv(.c) void,
    accesskit_tree_update_set_tree_info: *const fn (*Tree, *TreeInfo) callconv(.c) void,
    accesskit_tree_update_debug: *const fn (*const Tree) callconv(.c) ?[*:0]u8,
    accesskit_string_free: *const fn ([*:0]u8) callconv(.c) void,

    zdl_accesskit_visit_action: *const fn (*const Request, Visitor, ?*anyopaque) callconv(.c) bool,
    zdl_accesskit_probe_actions: *const fn (Action, ?*anyopaque) callconv(.c) void,
    zdl_accesskit_lease_abi_version: *const fn () callconv(.c) u32,
    zdl_accesskit_unix_adapter_new_leased: *const fn (Activation, Action, Notify, ?*anyopaque, Notify) callconv(.c) ?*Adapter,
    accesskit_unix_adapter_free: *const fn (*Adapter) callconv(.c) void,
    accesskit_action_request_free: *const fn (*Request) callconv(.c) void,
};
const State = struct {
    released: std.atomic.Value(bool) = .init(false),
    free_request: *const fn (*Request) callconv(.c) void,
    fn activation(_: ?*anyopaque) callconv(.c) ?*Tree {
        return null;
    }
    fn action(request: *Request, userdata: ?*anyopaque) callconv(.c) void {
        const self: *State = @ptrCast(@alignCast(userdata.?));
        self.free_request(request);
    }
    fn deactivate(_: ?*anyopaque) callconv(.c) void {}
    fn release(userdata: ?*anyopaque) callconv(.c) void {
        const self: *State = @ptrCast(@alignCast(userdata.?));
        // Last access to userdata. Acquire observation permits owner reclamation;
        // provider mappings remain resident even after this callback returns.
        self.released.store(true, .release);
    }
};
const DecodeState = struct {
    router: *NativeRouter,
    functions: *const Functions,
    routed: std.atomic.Value(usize) = .init(0),
    route_rejected: std.atomic.Value(usize) = .init(0),
    decode_rejected: std.atomic.Value(usize) = .init(0),
    fn action(request: *Request, userdata: ?*anyopaque) callconv(.c) void {
        const self: *DecodeState = @ptrCast(@alignCast(userdata.?));
        defer self.functions.accesskit_action_request_free(request);
        if (!self.functions.zdl_accesskit_visit_action(request, visit, self)) {
            _ = self.decode_rejected.fetchAdd(1, .monotonic);
        }
    }
    fn visit(id: u64, code: u32, bytes: [*]const u8, len: usize, userdata: ?*anyopaque) callconv(.c) void {
        const self: *DecodeState = @ptrCast(@alignCast(userdata.?));
        const kind: @import("router.zig").Kind = switch (code) {
            1 => .activate,
            2 => .focus,
            3 => .replace_value,
            else => {
                _ = self.decode_rejected.fetchAdd(1, .monotonic);
                return;
            },
        };
        _ = self.router.route(id, kind, bytes[0..len]) catch {
            _ = self.route_rejected.fetchAdd(1, .monotonic);
            return;
        };
        _ = self.routed.fetchAdd(1, .monotonic);
    }
};
/// Owned candidate conversion. Native strings/children are copied; no scene
/// lease is retained. Library stays at a stable address until deinit. Conversion
/// does not publish to a native adapter or mutate the action router.
pub const Publication = struct {
    library: *Library,
    allocator: std.mem.Allocator,
    native: *Tree,
    entries: []@import("router.zig").Entry,
    pub fn deinit(self: *Publication) void {
        self.library.functions.accesskit_tree_update_free(self.native);
        self.allocator.free(self.entries);
        self.* = undefined;
    }
    pub fn routing(self: *const Publication) []const @import("router.zig").Entry {
        return self.entries;
    }
    pub fn validate_native(self: *const Publication) !void {
        if (self.library.functions.zdl_accesskit_probe_tree(self.native) != self.entries.len) return error.NativeTreeMismatch;
    }
    pub fn debug_copy(self: *const Publication, allocator: std.mem.Allocator) ![]u8 {
        const string = self.library.functions.accesskit_tree_update_debug(self.native) orelse return error.NativeFailure;
        defer self.library.functions.accesskit_string_free(string);
        return allocator.dupe(u8, std.mem.span(string));
    }
};
const SemanticDomain = @TypeOf(@as(zdl.ui.semantics.Id, undefined).domain);
const PublishContext = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    functions: Functions,
    domain: SemanticDomain,
    mutex: std.Io.Mutex = .init,
    inbox: NativeInbox,
    router: NativeRouter,
    current: ?Publication = null,
    closed: bool = false,
    released: std.atomic.Value(bool) = .init(false),
    routed: std.atomic.Value(usize) = .init(0),
    rejected: std.atomic.Value(usize) = .init(0),
    fn activation(userdata: ?*anyopaque) callconv(.c) ?*Tree {
        const self: *PublishContext = @ptrCast(@alignCast(userdata.?));
        self.mutex.lockUncancelable(self.io);
        defer self.mutex.unlock(self.io);
        if (self.closed) return null;
        return self.functions.zdl_accesskit_tree_clone(self.current.?.native);
    }
    fn factory(userdata: ?*anyopaque) callconv(.c) *Tree {
        // Owner serializes publish/close. The pinned update method calls this
        // factory synchronously, after publish has released the context lock.
        return activation(userdata) orelse unreachable;
    }
    fn action(request: *Request, userdata: ?*anyopaque) callconv(.c) void {
        const self: *PublishContext = @ptrCast(@alignCast(userdata.?));
        defer self.functions.accesskit_action_request_free(request);
        self.mutex.lockUncancelable(self.io);
        defer self.mutex.unlock(self.io);
        if (self.closed) {
            _ = self.rejected.fetchAdd(1, .monotonic);
            return;
        }
        if (!self.functions.zdl_accesskit_visit_action(request, visit, self)) {
            _ = self.rejected.fetchAdd(1, .monotonic);
        }
    }
    fn visit(id: u64, code: u32, bytes: [*]const u8, len: usize, userdata: ?*anyopaque) callconv(.c) void {
        const self: *PublishContext = @ptrCast(@alignCast(userdata.?));
        const kind: @import("router.zig").Kind = switch (code) {
            1 => .activate,
            2 => .focus,
            3 => .replace_value,
            else => {
                _ = self.rejected.fetchAdd(1, .monotonic);
                return;
            },
        };
        _ = self.router.route(id, kind, bytes[0..len]) catch {
            _ = self.rejected.fetchAdd(1, .monotonic);
            return;
        };
        _ = self.routed.fetchAdd(1, .monotonic);
    }
    fn deactivation(_: ?*anyopaque) callconv(.c) void {}
    fn release(userdata: ?*anyopaque) callconv(.c) void {
        const self: *PublishContext = @ptrCast(@alignCast(userdata.?));
        self.released.store(true, .release);
    }
};

/// Disposable owner-thread publisher. All callback state is heap-stable; IO and
/// Library outlive deinit acknowledgement. Never shallow-copy this owner.
pub const Publisher = struct {
    context: ?*PublishContext,
    adapter: ?*Adapter,
    /// Moves the candidate only on success. Failure leaves it caller-owned.
    pub fn init(library: *Library, allocator: std.mem.Allocator, io: std.Io, candidate: *?Publication) !Publisher {
        const initial = candidate.* orelse return error.MissingCandidate;
        if (initial.library != library or initial.entries.len == 0) return error.ForeignCandidate;
        const context = try allocator.create(PublishContext);
        errdefer allocator.destroy(context);
        context.* = .{ .allocator = allocator, .io = io, .functions = library.functions, .domain = initial.entries[0].target.domain, .inbox = NativeInbox.init(io), .router = undefined };
        context.router = NativeRouter.init(io, &context.inbox);
        for (initial.entries) |entry| if (entry.target.domain != context.domain) return error.ForeignCandidate;
        try context.router.publish(initial.entries);
        context.current = initial;
        const adapter = library.functions.zdl_accesskit_unix_adapter_new_leased(PublishContext.activation, PublishContext.action, PublishContext.deactivation, context, PublishContext.release) orelse {
            context.current = null;
            return error.NativeRejected;
        };
        candidate.* = null;
        return .{ .context = context, .adapter = adapter };
    }
    /// Prebuilt candidate + routing swap under one callback gate. No native
    /// adapter method runs while the gate is held (native state can call back).
    /// Router rejection leaves both the old tree and caller candidate intact.
    pub fn publish(self: *Publisher, candidate: *?Publication) !void {
        const context = self.context orelse return error.Closed;
        const next = candidate.* orelse return error.MissingCandidate;
        context.mutex.lockUncancelable(context.io);
        if (context.closed) {
            context.mutex.unlock(context.io);
            return error.Closed;
        }
        if (next.library != context.current.?.library or next.entries.len == 0) {
            context.mutex.unlock(context.io);
            return error.ForeignCandidate;
        }
        for (next.entries) |entry| if (entry.target.domain != context.domain) {
            context.mutex.unlock(context.io);
            return error.ForeignCandidate;
        };
        context.router.publish(next.entries) catch |err| {
            context.mutex.unlock(context.io);
            return err;
        };
        var old = context.current.?;
        context.current = next;
        candidate.* = null;
        context.mutex.unlock(context.io);
        old.deinit();
        context.functions.accesskit_unix_adapter_update_if_active(self.adapter.?, PublishContext.factory, context);
    }
    pub fn take(self: *Publisher) ?NativeInbox.Item {
        return if (self.context) |context| context.inbox.take() else null;
    }
    /// Logical close disables callbacks/staging before native teardown. It does
    /// not revoke already admitted public action-queue tickets or user workers.
    pub fn close(self: *Publisher) void {
        const context = self.context orelse return;
        context.mutex.lockUncancelable(context.io);
        if (context.closed) {
            context.mutex.unlock(context.io);
            return;
        }
        context.closed = true;
        context.router.close();
        var old = context.current;
        context.current = null;
        context.mutex.unlock(context.io);
        if (old) |*value| value.deinit();
        if (self.adapter) |adapter| context.functions.accesskit_unix_adapter_free(adapter);
        self.adapter = null;
    }
    /// Retains context on timeout/cancellation so the owner can retry. IO and
    /// Library must remain alive; timeout is not permission to revoke a lease.
    pub fn deinit(self: *Publisher) !void {
        const context = self.context orelse return;
        self.close();
        const start = std.Io.Clock.awake.now(context.io).nanoseconds;
        while (!context.released.load(.acquire)) {
            if (std.Io.Clock.awake.now(context.io).nanoseconds - start > 5 * std.time.ns_per_s) return error.ReleaseTimeout;
            try std.Io.sleep(context.io, .fromNanoseconds(std.time.ns_per_ms), .awake);
        }
        const allocator = context.allocator;
        allocator.destroy(context);
        self.context = null;
    }
};

pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,
    pub fn open_resident(path: [:0]const u8) !Library {
        var handle = try std.DynLib.open(path);
        errdefer handle.close();
        var functions: Functions = undefined;
        const fields = @typeInfo(Functions).@"struct";
        inline for (fields.field_names, fields.field_types) |name, T| {
            @field(functions, name) = handle.lookup(T, name ++ "") orelse return error.MissingSymbol;
        }
        if (functions.zdl_accesskit_lease_abi_version() != 4) return error.UnsupportedAbi;
        // Adapter creation starts provider threads. They have process lifetime;
        // balancing our loader handle is not permission to unload their code.
        const resident = std.c.dlopen(path.ptr, .{ .NOW = true, .NOLOAD = true, .NODELETE = true }) orelse return error.ResidencyFailed;
        _ = std.c.dlclose(resident);
        return .{ .handle = handle, .functions = functions };
    }
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }
    /// Full snapshot conversion, not incremental updates or native publication.
    /// Semantic serials are stable/nonrecycled within one Scene domain. Bind one
    /// native window/router to that domain; changing Scene owners needs a new
    /// native adapter. Native allocation aborts are not recoverable Zig OOM.
    pub fn convert_snapshot(self: *Library, allocator: std.mem.Allocator, snapshot: anytype, limit: usize) !Publication {
        var count: usize = 0;
        var root: ?u64 = null;
        var focus: ?u64 = null;
        while (snapshot.semantic_at(count)) |view| : (count += 1) {
            if (count == limit) return error.MappingLimit;
            if (view.parent == null) root = view.id.serial;
            if (view.focused) focus = view.id.serial;
        }
        const root_id = root orelse return error.EmptyTree;
        const entries = try allocator.alloc(@import("router.zig").Entry, count);
        errdefer allocator.free(entries);
        const tree = self.functions.accesskit_tree_update_with_capacity_and_focus(count, focus orelse root_id) orelse return error.NativeFailure;
        errdefer self.functions.accesskit_tree_update_free(tree);
        const info = self.functions.accesskit_tree_info_new(root_id) orelse return error.NativeFailure;
        self.functions.accesskit_tree_update_set_tree_info(tree, info);
        for (entries, 0..) |*entry, i| {
            const view = snapshot.semantic_at(i).?;
            const actions: zdl.ui.semantics.Actions = .{ .activate = view.actions.activate, .focus = view.actions.focus, .replace_text = view.actions.replace_text };
            const mask: u32 = @intFromBool(actions.activate) | (@as(u32, @intFromBool(actions.focus)) << 1) | (@as(u32, @intFromBool(actions.replace_text)) << 2);
            var flags: u32 = @intFromBool(!view.enabled or view.inert);
            if (view.text) |text| {
                if (text.read_only or text.protected) flags |= 2;
                if (text.protected) flags |= 4;
            }
            const role: u32 = switch (view.role) {
                .window => 0,
                .group => 1,
                .label => 2,
                .button => 3,
                .checkbox => 4,
                .slider => 5,
                .collection => 6,
                .item => 7,
                .editor => 8,
            };
            const checked: i32 = if (view.checked) |value| @intFromBool(value) else -1;
            const node = self.functions.zdl_accesskit_node_new(role, mask, flags, checked) orelse return error.NativeFailure;
            var transferred = false;
            defer if (!transferred) self.functions.accesskit_node_free(node);
            self.functions.accesskit_node_set_label_with_length(node, view.name.ptr, view.name.len);
            self.functions.accesskit_node_set_description_with_length(node, view.description.ptr, view.description.len);
            for (0..view.child_count) |ordinal| {
                const child = (try snapshot.semantic_child(view.id, ordinal)).?;
                self.functions.accesskit_node_push_child(node, child.id.serial);
            }
            if (view.relations.labelled_by) |id| self.functions.accesskit_node_push_labelled_by(node, id.serial);
            if (view.relations.described_by) |id| self.functions.accesskit_node_push_described_by(node, id.serial);
            if (view.relations.active_descendant) |id| self.functions.accesskit_node_set_active_descendant(node, id.serial);
            if (view.bounds) |bounds| {
                const x1 = bounds.x + bounds.width;
                const y1 = bounds.y + bounds.height;
                if (!std.math.isFinite(x1) or !std.math.isFinite(y1)) return error.InvalidBounds;
                self.functions.accesskit_node_set_bounds(node, .{ .x0 = bounds.x, .y0 = bounds.y, .x1 = x1, .y1 = y1 });
            }
            if (view.number) |number| {
                self.functions.accesskit_node_set_numeric_value(node, number.value);
                self.functions.accesskit_node_set_min_numeric_value(node, number.min);
                self.functions.accesskit_node_set_max_numeric_value(node, number.max);
            }
            if (view.collection_count) |value| self.functions.accesskit_node_set_size_of_set(node, std.math.cast(usize, value) orelse return error.MappingLimit);
            if (view.position) |value| self.functions.accesskit_node_set_position_in_set(node, std.math.cast(usize, value + 1) orelse return error.MappingLimit);
            entry.* = .{ .native_id = view.id.serial, .target = view.id, .revision = view.revision, .actions = actions };
            if (view.text) |text| {
                if (!text.protected) self.functions.accesskit_node_set_value_with_length(node, text.value.ptr, text.value.len);
                entry.document = .{ .revision = text.target.revision, .byte_len = text.value.len };
            }
            self.functions.accesskit_tree_update_push_node(tree, view.id.serial, node);
            transferred = true;
        }
        const Order = struct {
            fn less(_: void, a: @import("router.zig").Entry, b: @import("router.zig").Entry) bool {
                return a.native_id < b.native_id;
            }
        };
        std.mem.sort(@import("router.zig").Entry, entries, {}, Order.less);
        return .{ .library = self, .allocator = allocator, .native = tree, .entries = entries };
    }
    /// Real native adapter/update API plus synthetic activation races. Normal
    /// live-bus publication/announcements remain a separate environment gate.
    pub fn probe_publisher(self: *Library, io: std.Io) !void {
        const allocator = std.heap.page_allocator;
        var document = try zdl.text.Document.init(allocator, "never disclose", .{});
        defer document.deinit();
        var documents = try zdl.text.Registry.init(allocator, .{});
        defer documents.deinit();
        var registration = try documents.register(&document);
        defer registration.deinit();
        var source = try document.snapshot();
        defer source.deinit();
        var owner = try PublicationModel.Scene.init(allocator, .{});
        defer owner.deinit();
        var initial = try describe_publication(&owner, source, registration.handle(), false);
        defer initial.deinit();
        var candidate: ?Publication = try self.convert_snapshot(allocator, initial, 16);
        defer if (candidate) |*value| value.deinit();
        var empty: [0]u8 = .{};
        var failing = std.heap.FixedBufferAllocator.init(&empty);
        if (Publisher.init(self, failing.allocator(), io, &candidate)) |value| {
            var unexpected = value;
            try unexpected.deinit();
            return error.ExpectedAllocationFailure;
        } else |err| if (err != error.OutOfMemory or candidate == null) return error.WrongOwnershipOnFailure;
        var publisher = try Publisher.init(self, allocator, io, &candidate);
        defer publisher.deinit() catch @panic("publisher callback lease was not released");
        const context = publisher.context.?;
        if (candidate != null or self.functions.zdl_accesskit_probe_factory(PublishContext.factory, context) != 9) return error.BadFactory;
        var entered: std.atomic.Value(bool) = .init(false);
        var closed_seen: std.atomic.Value(bool) = .init(false);
        var failed: std.atomic.Value(bool) = .init(false);
        const worker = try std.Thread.spawn(.{}, publisher_worker, .{ context, &entered, &closed_seen, &failed });
        var joined = false;
        defer {
            publisher.close();
            if (!joined) worker.join();
        }
        const start = std.Io.Clock.awake.now(io).nanoseconds;
        while (!entered.load(.acquire)) {
            if (std.Io.Clock.awake.now(io).nanoseconds - start > 5 * std.time.ns_per_s) return error.CallbackStartTimeout;
            std.Thread.yield() catch {};
        }
        var latest_revision: u64 = 0;
        var button_id: u64 = 0;
        for (0..12) |i| {
            var scene = try describe_publication(&owner, source, registration.handle(), i % 2 == 0);
            defer scene.deinit();
            candidate = try self.convert_snapshot(allocator, scene, 16);
            for (candidate.?.entries) |entry| if (entry.actions.activate) {
                latest_revision = entry.revision;
                button_id = entry.native_id;
            };
            try publisher.publish(&candidate);
            if (candidate != null or self.functions.zdl_accesskit_probe_factory(PublishContext.factory, context) != 9) return error.BadPublication;
        }
        // Domain mismatch preserves the caller's candidate and current native tree.
        var foreign_owner = try PublicationModel.Scene.init(allocator, .{});
        defer foreign_owner.deinit();
        var foreign = try describe_publication(&foreign_owner, source, registration.handle(), false);
        defer foreign.deinit();
        candidate = try self.convert_snapshot(allocator, foreign, 16);
        if (publisher.publish(&candidate)) |_| return error.ExpectedForeignCandidate else |err| if (err != error.ForeignCandidate or candidate == null) return error.WrongOwnershipOnFailure;
        if (self.functions.zdl_accesskit_probe_factory(PublishContext.factory, context) != 9) return error.LostPriorPublication;
        self.functions.zdl_accesskit_probe_actions_for_node(PublishContext.action, context, button_id);
        for (0..2) |_| {
            var item = publisher.take() orelse return error.MissingMappedAction;
            if (item.request().revision != latest_revision or item.request().target.serial != button_id) return error.MixedPublication;
            try item.reject(error.NoWidgetController);
        }
        if (publisher.take() != null or context.routed.load(.acquire) != 2 or context.rejected.load(.acquire) != 3) return error.WrongPublicationRouting;
        publisher.close();
        worker.join();
        joined = true;
        if (!closed_seen.load(.acquire) or failed.load(.acquire)) return error.CallbackRace;
        if (self.functions.zdl_accesskit_probe_activation(PublishContext.activation, context) != 0) return error.ActivationAfterClose;
        self.functions.zdl_accesskit_probe_actions_for_node(PublishContext.action, context, button_id);
        if (publisher.take() != null or context.rejected.load(.acquire) != 8) return error.ActionAfterClose;
        if (publisher.publish(&candidate)) |_| return error.ExpectedClosed else |err| if (err != error.Closed or candidate == null) return error.WrongOwnershipOnFailure;
        try publisher.deinit();
        try publisher.deinit();
    }
    /// Owned full-tree snapshots validated by the real native consumer, with
    /// stable identities, relations, checked/collection state and protected text.
    pub fn probe_publication(self: *Library, io: std.Io) !void {
        var converted = try self.publication_fixture(io);
        defer converted.deinit();
        // Every source scene/document/registration has ended inside the fixture.
        try converted.validate_native();
        self.functions.zdl_accesskit_probe_tree_properties(converted.native);
        const dump = try converted.debug_copy(std.heap.page_allocator);
        defer std.heap.page_allocator.free(dump);
        if (std.mem.indexOf(u8, dump, "PasswordInput") == null or std.mem.indexOf(u8, dump, "never disclose") != null or std.mem.indexOf(u8, dump, "Native café") == null) return error.NativeDisclosureOrLifetime;
    }
    fn publication_fixture(self: *Library, io: std.Io) !Publication {
        const allocator = std.heap.page_allocator;
        var document = try zdl.text.Document.init(allocator, "never disclose", .{});
        defer document.deinit();
        var documents = try zdl.text.Registry.init(allocator, .{});
        defer documents.deinit();
        var registration = try documents.register(&document);
        defer registration.deinit();
        var source = try document.snapshot();
        defer source.deinit();
        var owner = try PublicationModel.Scene.init(allocator, .{});
        defer owner.deinit();
        var first = try describe_publication(&owner, source, registration.handle(), false);
        defer first.deinit();
        var converted = try self.convert_snapshot(allocator, first, 9);
        errdefer converted.deinit();
        try converted.validate_native();
        self.functions.zdl_accesskit_probe_tree_properties(converted.native);
        var inbox = NativeInbox.init(io);
        var router = NativeRouter.init(io, &inbox);
        defer router.close();
        try router.publish(converted.routing());
        var second = try describe_publication(&owner, source, registration.handle(), true);
        defer second.deinit();
        var next = try self.convert_snapshot(allocator, second, 9);
        defer next.deinit();
        try next.validate_native();
        self.functions.zdl_accesskit_probe_tree_properties(next.native);
        try router.publish(next.routing());
        for (converted.routing(), next.routing()) |before, after| {
            if (before.native_id != after.native_id or !std.meta.eql(before.target, after.target)) return error.UnstableNativeId;
        }
        var empty: [0]u8 = .{};
        var failing = std.heap.FixedBufferAllocator.init(&empty);
        if (self.convert_snapshot(failing.allocator(), second, 9)) |value| {
            var unexpected = value;
            unexpected.deinit();
            return error.ExpectedAllocationFailure;
        } else |err| if (err != error.OutOfMemory) return err;
        if (self.convert_snapshot(allocator, second, 8)) |value| {
            var unexpected = value;
            unexpected.deinit();
            return error.ExpectedCapacityFailure;
        } else |err| if (err != error.MappingLimit) return err;
        try converted.validate_native();
        self.functions.zdl_accesskit_probe_tree_properties(converted.native);
        return converted;
    }
    /// Synthetic foreign Rust-thread requests through the actual C request
    /// ownership/decoder path, inbox, queue and live document dispatcher. This
    /// is not an AT-SPI client or a native semantic tree publication test.
    pub fn probe_actions(self: *Library, io: std.Io) !void {
        const allocator = std.heap.page_allocator;
        var document = try zdl.text.Document.init(allocator, "before", .{});
        defer document.deinit();
        var documents = try zdl.text.Registry.init(allocator, .{});
        defer documents.deinit();
        var registration = try documents.register(&document);
        defer registration.deinit();
        var initial = try document.snapshot();
        defer initial.deinit();
        const Model = zdl.ui.with_semantics(.{});
        var owner = try Model.Scene.init(allocator, .{});
        defer owner.deinit();
        var update = try owner.begin_update();
        defer update.abort();
        _ = try update.semantic_node(null, .{ .integer = 1 }, .{
            .role = .editor,
            .name = "Editor",
            .actions = .{ .focus = true, .replace_text = true },
            .document = .{ .snapshot = initial, .registration = registration.handle() },
        }, null);
        var scene = try update.commit();
        defer scene.deinit();
        const view = scene.semantic_at(0).?;
        var inbox = NativeInbox.init(io);
        var router = NativeRouter.init(io, &inbox);
        defer router.close();
        try router.publish(&.{.{ .native_id = 7, .target = view.id, .revision = view.revision, .actions = .{ .focus = true, .replace_text = true }, .document = .{ .revision = initial.revision(), .byte_len = initial.text().len } }});
        var state: DecodeState = .{ .router = &router, .functions = &self.functions };
        self.functions.zdl_accesskit_probe_actions(DecodeState.action, &state);
        if (state.routed.load(.acquire) != 2 or state.route_rejected.load(.acquire) != 1 or state.decode_rejected.load(.acquire) != 2) return error.UnexpectedDecode;
        var queue = try zdl.ui.action_queue.Queue.init(allocator, .{});
        defer queue.deinit();
        var focus = inbox.take() orelse return error.MissingFocus;
        const focus_ticket = try focus.admit(&queue);
        var text = inbox.take() orelse return error.MissingText;
        const text_ticket = try text.admit(&queue);
        var first = (try queue.take()).?;
        defer first.deinit();
        if (zdl.ui.document_actions.dispatch(&owner, &documents, &first, .{})) |value| {
            var unexpected = value;
            unexpected.deinit();
            return error.UnexpectedFocusExecution;
        } else |err| if (err != error.NotDocumentAction) return err;
        var second = (try queue.take()).?;
        defer second.deinit();
        if ((try second.request()).source != .assistive) return error.WrongSource;
        var result = try zdl.ui.document_actions.dispatch(&owner, &documents, &second, .{});
        defer result.deinit();
        if (!std.mem.eql(u8, result.snapshot().text(), "native café")) return error.LostNativeText;
        if ((try queue.status(focus_ticket)).final.rejected != error.NotDocumentAction or (try queue.status(text_ticket)).final != .handled) return error.WrongReceipt;
        router.close();
        self.functions.zdl_accesskit_probe_actions(DecodeState.action, &state);
        if (state.routed.load(.acquire) != 2 or state.route_rejected.load(.acquire) != 4 or state.decode_rejected.load(.acquire) != 4 or inbox.take() != null) return error.LateNativeAction;
    }
    /// Real native adapter cycles and foreign-thread release acknowledgement.
    /// No semantic tree or assistive client is installed by this probe.
    pub fn probe(self: *Library, io: std.Io, count: usize) !void {
        for (0..count) |_| {
            const state = try std.heap.page_allocator.create(State);
            state.* = .{ .free_request = self.functions.accesskit_action_request_free };
            const adapter = self.functions.zdl_accesskit_unix_adapter_new_leased(State.activation, State.action, State.deactivate, state, State.release) orelse {
                std.heap.page_allocator.destroy(state);
                return error.NativeRejected;
            };
            self.functions.accesskit_unix_adapter_free(adapter);
            const start = std.Io.Clock.awake.now(io).nanoseconds;
            while (!state.released.load(.acquire)) {
                if (std.Io.Clock.awake.now(io).nanoseconds - start > 5 * std.time.ns_per_s) {
                    // A timeout does not revoke the provider lease. Deliberately
                    // retain this allocation until process exit on failure.
                    return error.ReleaseTimeout;
                }
                std.Io.sleep(io, .fromNanoseconds(std.time.ns_per_ms), .awake) catch |err| {
                    // Same retained-state rule if owner waiting is cancelled.
                    return err;
                };
            }
            std.heap.page_allocator.destroy(state);
        }
    }
};

const PublicationModel = zdl.ui.with_semantics(.{});
fn describe_publication(owner: *PublicationModel.Scene, source: zdl.text.Snapshot, handle: zdl.text.registry.Handle, changed: bool) !PublicationModel.Snapshot {
    var update = try owner.begin_update();
    defer update.abort();
    const button = try update.node(.{ .integer = 1 }, .control, .{ .focusable = true });
    try update.request_focus(button);
    const root = try update.semantic_node(null, .{ .integer = 0 }, .{ .role = .window, .name = "Fixture" }, null);
    const label = try update.semantic_node(root, .{ .integer = 1 }, .{ .role = .label, .name = "Caption" }, null);
    _ = try update.semantic_node(root, .{ .integer = 2 }, .{ .role = .button, .name = if (changed) "Updated native" else "Native café", .actions = .{ .activate = true, .focus = true }, .bounds = .{ .x = 10, .y = 20, .width = 100, .height = 30 } }, button);
    _ = try update.semantic_node(root, .{ .integer = 3 }, .{ .role = .checkbox, .name = "Enabled", .checked = true }, null);
    const editor = try update.semantic_node(root, .{ .integer = 4 }, .{ .role = .editor, .document = .{ .snapshot = source, .registration = handle, .protected = true } }, null);
    try update.semantic_relations(editor, .{ .labelled_by = label });
    const list = try update.semantic_node(root, .{ .integer = 5 }, .{ .role = .collection, .name = "Choices", .collection_count = 2 }, null);
    _ = try update.semantic_node(list, .{ .integer = 0 }, .{ .role = .item, .name = "One", .position = 0 }, null);
    _ = try update.semantic_node(list, .{ .integer = 1 }, .{ .role = .item, .name = "Two", .position = 1 }, null);
    _ = try update.semantic_node(root, .{ .integer = 6 }, .{ .role = .slider, .name = "Level", .enabled = false, .number = .{ .value = 5, .min = 0, .max = 10 }, .actions = .{ .set_number = true } }, null);
    return update.commit();
}

fn publisher_worker(context: *PublishContext, entered: *std.atomic.Value(bool), closed_seen: *std.atomic.Value(bool), failed: *std.atomic.Value(bool)) void {
    for (0..4096) |_| {
        const count = context.functions.zdl_accesskit_probe_activation(PublishContext.activation, context);
        entered.store(true, .release);
        if (count == 0) {
            closed_seen.store(true, .release);
            return;
        }
        if (count != 9) {
            failed.store(true, .release);
            return;
        }
        std.Thread.yield() catch {};
    }
    failed.store(true, .release);
}
