//! Retained model-only scenes: keyed reconciliation and atomic publication.
//! No layout, painting, widgets, text provider, event dispatch or native bridge
//! is implied. Owner-thread only, including snapshot retain/release. Snapshots
//! own immutable strings/records and remain readable after updates or close.
const std = @import("std");
const identity = @import("identity.zig");
const state_pool = @import("state.zig");
const sem = @import("semantics.zig");
pub const NodeId = identity.NodeId;
pub const Key = identity.Key;
pub const Domain = identity.Domain;
pub const Error = std.mem.Allocator.Error || error{
    DomainExhausted,
    Closed,
    UpdateInProgress,
    UpdateFinished,
    UpdateFailed,
    RevisionExhausted,
    ReferenceLimit,
    ForeignDomain,
    StaleNode,
    ForeignDraft,
    InvalidParent,
    InvalidProperties,
    InvalidUtf8,
    InvalidTarget,
    DuplicateKey,
    NodeLimit,
    SlotLimit,
    TextLimit,
    DepthLimit,
    InvalidLimits,
    UnbalancedScopes,
};
/// Record categories, not claims of implemented controls/editing behavior.
pub const Kind = enum { group, label, control, editor };
pub const Properties = struct {
    label: []const u8 = "",
    enabled: bool = true,
    focusable: bool = false,
};
pub const Limits = struct {
    max_nodes: u32 = 100_000,
    /// Includes dead and permanently retired slots. Removed live slots become
    /// reusable only in a subsequent commit, preserving reconciliation order.
    max_slots: u32 = 200_000,
    max_text_bytes: usize = 4 * 1024 * 1024,
    max_depth: u16 = 256,
    max_state_entries: u32 = 100_000,
    max_semantic_nodes: u32 = 200_000,
    max_semantic_bytes: usize = 4 * 1024 * 1024,
    /// Logical value/owned-byte accounting per version, not process RSS or all
    /// independently retained snapshots. Policies report optional owned_bytes.
    max_state_bytes: usize = 16 * 1024 * 1024,
};
pub const DraftId = struct { domain: Domain, transaction: u64, index: u32 };
pub const Node = struct {
    id: NodeId,
    key: Key,
    parent: ?NodeId,
    kind: Kind,
    properties: Properties,
    // Dense ranges are snapshot-local implementation data, never durable IDs.
    first_child: u32 = 0,
    child_count: u32 = 0,
};
const Slot = struct { generation: u64 = 1, node: ?u32 = null, retired: bool = false };
const ScopedKey = struct { parent: ?NodeId, key: Key };
const KeyContext = struct {
    pub fn hash(_: @This(), key: ScopedKey) u64 {
        var h = std.hash.Wyhash.init(0);
        const tag: u8 = if (key.parent != null) 1 else 0;
        h.update(&.{tag});
        if (key.parent) |parent| {
            const domain = @backingInt(parent.domain);
            h.update(std.mem.asBytes(&domain));
            h.update(std.mem.asBytes(&parent.slot));
            h.update(std.mem.asBytes(&parent.generation));
        }
        switch (key.key) {
            .integer => |value| {
                h.update(&.{0});
                h.update(std.mem.asBytes(&value));
            },
            .named => |value| {
                h.update(&.{1});
                h.update(value);
            },
        }
        return h.final();
    }
    pub fn eql(_: @This(), a: ScopedKey, b: ScopedKey) bool {
        const same_parent = if (a.parent) |parent| if (b.parent) |other| parent.eql(other) else false else b.parent == null;
        return same_parent and a.key.eql(b.key);
    }
};
const Index = std.HashMapUnmanaged(ScopedKey, u32, KeyContext, 80);
const Declaration = struct { parent: ?u32, key: Key, kind: Kind, properties: Properties, depth: u16 };
const Selection = union(enum) { retain, clear, draft: DraftId };
/// Creates a scene namespace with separate typed state channels. Schema is a
/// comptime named struct of ownership-policy types, e.g. .{ .scroll = Policy }.
pub fn with_states(comptime schema: anytype) type {
    return Model(schema, false);
}
/// Same engine with transactional semantic intent and owner-side action checks.
pub fn with_semantics(comptime schema: anytype) type {
    return Model(schema, true);
}
fn Model(comptime schema: anytype, comptime semantic_enabled: bool) type {
    const info = @typeInfo(@TypeOf(schema));
    if (info != .@"struct") @compileError("state schema must be a comptime named struct of policy types");
    const names = info.@"struct".field_names;
    for (names) |name| {
        if (@TypeOf(@field(schema, name)) != type) @compileError("each state channel must name an ownership-policy type");
        const Policy = @field(schema, name);
        if (!@hasDecl(Policy, "Value") or !@hasDecl(Policy, "clone") or !@hasDecl(Policy, "deinit"))
            @compileError("state policy needs Value, clone(allocator, value) and deinit(allocator, value)");
    }
    const PolicyErrors = block: {
        var Errors: type = error{};
        for (names) |name| Errors = Errors || state_pool.clone_errors(@field(schema, name));
        break :block Errors;
    };
    return struct {
        const Failure = BaseError || PolicyErrors || (if (names.len == 0) error{} else error{StateLimit}) || (if (semantic_enabled) sem.Error else error{});
        pub const Error = Failure;
        fn Tables(comptime field: []const u8) type {
            var types: [names.len]type = undefined;
            for (names, 0..) |name, i| types[i] = @field(state_pool.Pool(@field(schema, name)), field);
            return @Tuple(&types);
        }
        const StateEntries = Tables("Entries");
        const Stages = Tables("Stage");
        const OldIndices = Tables("OldIndex");
        const Prepared = Tables("Prepared");
        fn empty_entries() StateEntries {
            var result: StateEntries = undefined;
            inline for (names, 0..) |_, i| result[i] = &.{};
            return result;
        }
        fn empty_stages() Stages {
            var result: Stages = undefined;
            inline for (names, 0..) |_, i| result[i] = .empty;
            return result;
        }
        fn state_index(comptime name: []const u8) usize {
            for (names, 0..) |candidate, i| if (std.mem.eql(u8, name, candidate)) return i;
            @compileError("unknown retained state channel: " ++ name);
        }
        fn State(comptime name: []const u8) type {
            return @field(schema, name).Value;
        }

        const SemanticTree = if (semantic_enabled) sem.Tree else void;
        const SemanticBuilder = if (semantic_enabled) sem.Builder else void;
        const Storage = struct {
            allocator: std.mem.Allocator,
            arena: std.heap.ArenaAllocator,
            references: usize = 1,
            domain: Domain,
            revision: u64,
            transaction: u64,
            nodes: []const Node,
            slots: []const Slot,
            children: []const u32,
            focus: ?NodeId = null,
            capture: ?NodeId = null,
            states: StateEntries = empty_entries(),
            semantic_tree: SemanticTree = if (semantic_enabled) .{} else {},
            fn retain(self: *Storage) Failure!void {
                if (self.references == std.math.maxInt(usize)) return error.ReferenceLimit;
                self.references += 1;
            }
            fn release(self: *Storage) void {
                self.references -= 1;
                if (self.references == 0) {
                    const allocator = self.allocator;
                    inline for (names, 0..) |_, i| for (self.states[i]) |entry| entry.cell.release();
                    if (semantic_enabled) self.semantic_tree.release();
                    self.arena.deinit();
                    allocator.destroy(self);
                }
            }
            fn resolve(self: *const Storage, id: NodeId) Failure!*const Node {
                if (id.domain != self.domain) return error.ForeignDomain;
                if (id.slot >= self.slots.len) return error.StaleNode;
                const slot = self.slots[id.slot];
                if (slot.generation != id.generation) return error.StaleNode;
                const index = slot.node orelse return error.StaleNode;
                return &self.nodes[index];
            }
        };
        /// An owning reference. Strings/Node pointers/child iterators borrow this
        /// reference until deinit; retaining another snapshot extends their lifetime.
        /// Historical resolve deliberately accepts IDs live in that snapshot. Route
        /// actions through Owner.resolve instead to validate against the current scene.
        pub const Version = struct {
            storage: *Storage,
            /// Releases this owning reference; do not deinitialize shallow copies.
            pub fn deinit(self: *Version) void {
                self.storage.release();
                self.* = undefined;
            }
            /// Creates another owning reference on the scene owner thread.
            pub fn retain(self: Version) Failure!Version {
                try self.storage.retain();
                return self;
            }
            /// Successful publication sequence; aborted descriptions do not advance it.
            pub fn revision(self: Version) u64 {
                return self.storage.revision;
            }
            /// Immutable declaration-order records borrowing this snapshot.
            pub fn nodes(self: Version) []const Node {
                return self.storage.nodes;
            }
            /// Focus reference published with this historical scene version.
            pub fn focus(self: Version) ?NodeId {
                return self.storage.focus;
            }
            /// Capture reference published with this historical scene version.
            pub fn capture(self: Version) ?NodeId {
                return self.storage.capture;
            }
            /// Validates a handle against this snapshot, not the latest live scene.
            pub fn resolve(self: Version, id: NodeId) Failure!*const Node {
                return self.storage.resolve(id);
            }
            /// Immutable typed state borrowing this snapshot, or null if the
            /// live historical node has no value in this channel.
            pub fn state(self: Version, comptime channel: []const u8, id: NodeId) Failure!?*const State(channel) {
                _ = try self.resolve(id);
                const index = comptime state_index(channel);
                return state_pool.Pool(@field(schema, channel)).find(self.storage.states[index], self.storage.slots[id.slot].node.?);
            }
            /// Logical state accounting across all channels; O(state entries).
            /// Excludes cell headers, indexes and independently retained versions.
            pub fn state_usage(self: Version) struct { entries: usize, logical_bytes: usize } {
                var result: struct { entries: usize, logical_bytes: usize } = .{ .entries = 0, .logical_bytes = 0 };
                inline for (names, 0..) |_, i| for (self.storage.states[i]) |entry| {
                    result.entries += 1;
                    result.logical_bytes += entry.cell.logical_bytes;
                };
                return .{ .entries = result.entries, .logical_bytes = result.logical_bytes };
            }
            /// Semantic views borrow this owning scene snapshot. Historical
            /// views are readable; route requests through live Scene validation.
            pub fn semantic(self: Version, id: sem.Id) Failure!sem.View {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic snapshots");
                return self.storage.semantic_tree.get(id);
            }
            /// Declaration-order semantic view, or null after the last record.
            pub fn semantic_at(self: Version, index: usize) ?sem.View {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic snapshots");
                return self.storage.semantic_tree.at(index);
            }
            /// Resolves a draft only in the snapshot published by its update.
            pub fn semantic_id_for(self: Version, draft: sem.Draft) Failure!sem.Id {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic snapshots");
                return self.storage.semantic_tree.id_for(draft, self.storage.transaction);
            }
            /// Child view borrowing this immutable semantic/scene snapshot.
            pub fn semantic_child(self: Version, id: sem.Id, ordinal: usize) Failure!?sem.View {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic snapshots");
                return self.storage.semantic_tree.child(id, ordinal);
            }
            /// Resolves a draft from the update that produced this snapshot.
            pub fn id_for(self: Version, draft: DraftId) Failure!NodeId {
                if (draft.domain != self.storage.domain or draft.transaction != self.storage.transaction or draft.index >= self.storage.nodes.len)
                    return error.ForeignDraft;
                return self.storage.nodes[draft.index].id;
            }
            /// Capacity of immutable snapshot storage. Staging/reconciliation scratch
            /// is freed at publication. Excludes Core/Storage headers, allocator metadata
            /// and independently retained scene revisions.
            pub fn arena_capacity_bytes(self: Version) usize {
                return self.storage.arena.queryCapacity();
            }
            /// Child iterator borrowing this reference; returns declaration order.
            pub fn children(self: Version, id: NodeId) Failure!ChildIterator {
                const node = try self.resolve(id);
                return .{ .storage = self.storage, .indices = self.storage.children[node.first_child..][0..node.child_count] };
            }
        };
        /// Borrows the snapshot that produced it; iteration order is declaration order.
        pub const ChildIterator = struct {
            storage: *const Storage,
            indices: []const u32,
            index: usize = 0,
            /// Next borrowed record, or null at the end of this parent scope.
            pub fn next(self: *ChildIterator) ?*const Node {
                if (self.index == self.indices.len) return null;
                const node = &self.storage.nodes[self.indices[self.index]];
                self.index += 1;
                return node;
            }
        };
        const Core = struct {
            allocator: std.mem.Allocator,
            limits: Limits,
            domain: Domain,
            references: usize = 1,
            current: ?*Storage,
            closed: bool = false,
            active: ?u64 = null,
            next_transaction: u64 = 1,
            fn release(self: *Core) void {
                self.references -= 1;
                if (self.references == 0) {
                    const allocator = self.allocator;
                    allocator.destroy(self);
                }
            }
        };
        /// Owns current scene storage. May move between calls: Transaction holds a separate
        /// heap-stable core reference. deinit/close do not invalidate retained snapshots.
        pub const Owner = struct {
            core: *Core,
            /// Creates an empty revision-zero scene with explicit allocation and limits.
            pub fn init(allocator: std.mem.Allocator, limits: Limits) Failure!Owner {
                if (limits.max_nodes == 0 or limits.max_slots < limits.max_nodes or limits.max_depth == 0) return error.InvalidLimits;
                const core = try allocator.create(Core);
                errdefer allocator.destroy(core);
                const domain = try identity.issue_domain();
                const storage = try allocator.create(Storage);
                storage.* = .{ .allocator = allocator, .arena = std.heap.ArenaAllocator.init(allocator), .domain = domain, .revision = 0, .transaction = 0, .nodes = &.{}, .slots = &.{}, .children = &.{}, .semantic_tree = if (semantic_enabled) .{ .domain = domain } else {} };
                core.* = .{ .allocator = allocator, .limits = limits, .domain = domain, .current = storage };
                return .{ .core = core };
            }
            /// Allocation-free, idempotent invalidation. Outstanding updates can only
            /// abort; snapshots retain historical data independently. Finish all host
            /// callbacks before releasing the caller's own Owner value.
            pub fn close(self: *Owner) void {
                const core = self.core;
                if (core.closed) return;
                core.closed = true;
                core.active = null;
                core.current.?.release();
                core.current = null;
            }
            /// Closes the scene and releases its owner reference.
            pub fn deinit(self: *Owner) void {
                self.close();
                self.core.release();
                self.* = undefined;
            }
            /// Retains the current immutable scene; caller deinitializes the result.
            pub fn snapshot(self: *const Owner) Failure!Version {
                if (self.core.closed) return error.Closed;
                try self.core.current.?.retain();
                return .{ .storage = self.core.current.? };
            }
            /// Result borrows the current scene until its next successful commit/close.
            pub fn resolve(self: *const Owner, id: NodeId) Failure!*const Node {
                if (self.core.closed) return error.Closed;
                return self.core.current.?.resolve(id);
            }
            /// Validates current identity, semantic revision, enabled/actions and
            /// document revision. It does not execute behavior or enqueue work.
            pub fn validate_semantic_action(self: *const Owner, request: sem.Request) Failure!sem.Resolved {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic actions");
                if (self.core.closed) return error.Closed;
                return self.core.current.?.semantic_tree.validate_action(request);
            }
            /// Begins the only active replacement description; caller commits or aborts.
            pub fn begin_update(self: *Owner) Failure!Transaction {
                const core = self.core;
                if (core.closed) return error.Closed;
                if (core.active != null) return error.UpdateInProgress;
                if (core.next_transaction == std.math.maxInt(u64) or core.current.?.revision == std.math.maxInt(u64)) return error.RevisionExhausted;
                if (core.references == std.math.maxInt(usize)) return error.ReferenceLimit;
                const transaction = core.next_transaction;
                core.next_transaction += 1;
                core.references += 1;
                core.active = transaction;
                return .{ .core = core, .transaction = transaction, .arena = std.heap.ArenaAllocator.init(core.allocator) };
            }
        };
        /// A complete replacement description over the same retained records. Declaration
        /// errors poison this update: commit will fail instead of publishing omitted
        /// nodes. abort is idempotent and safe after commit. Ownership-policy callbacks
        /// only clone/release resources: no model reducers or domain actions run here.
        pub const Transaction = struct {
            core: ?*Core,
            transaction: u64,
            arena: std.heap.ArenaAllocator,
            declarations: std.ArrayList(Declaration) = .empty,
            keys: Index = .empty,
            stack: std.ArrayList(DraftId) = .empty,
            text_bytes: usize = 0,
            failed: bool = false,
            focus: Selection = .retain,
            capture: Selection = .retain,
            states: Stages = empty_stages(),
            semantic_builder: SemanticBuilder = if (semantic_enabled) .{} else {},
            fn ready(self: *Transaction) Failure!*Core {
                const core = self.core orelse return error.UpdateFinished;
                if (core.closed) return error.Closed;
                if (self.failed) return error.UpdateFailed;
                return core;
            }
            fn validate_draft(self: *Transaction, draft: DraftId) Failure!u32 {
                const core = try self.ready();
                if (draft.domain != core.domain or draft.transaction != self.transaction or draft.index >= self.declarations.items.len) return error.ForeignDraft;
                return draft.index;
            }
            /// Releases staged data; idempotent, including after successful commit.
            pub fn abort(self: *Transaction) void {
                const core = self.core orelse return;
                inline for (names, 0..) |name, i| state_pool.Pool(@field(schema, name)).release_stage(self.states[i]);
                if (semantic_enabled) self.semantic_builder.release();
                self.arena.deinit();
                if (core.active == self.transaction) core.active = null;
                self.core = null;
                core.release();
            }
            /// Declares a node under an earlier draft parent, copying key/label bytes.
            pub fn add(self: *Transaction, parent: ?DraftId, key: Key, kind: Kind, properties: Properties) Failure!DraftId {
                errdefer self.failed = true;
                const core = try self.ready();
                if (self.declarations.items.len >= core.limits.max_nodes) return error.NodeLimit;
                const key_bytes = switch (key) {
                    .named => |bytes| bytes.len,
                    else => 0,
                };
                const additional = std.math.add(usize, key_bytes, properties.label.len) catch return error.TextLimit;
                if (additional > core.limits.max_text_bytes - self.text_bytes) return error.TextLimit;
                if (!std.unicode.utf8ValidateSlice(properties.label)) return error.InvalidUtf8;
                if (properties.focusable and kind != .control and kind != .editor) return error.InvalidProperties;
                const parent_index: ?u32 = if (parent) |value| try self.validate_draft(value) else null;
                var depth: u16 = 1;
                if (parent_index) |index| {
                    const declaration = self.declarations.items[index];
                    if (declaration.kind == .label) return error.InvalidParent;
                    if (declaration.depth >= core.limits.max_depth) return error.DepthLimit;
                    depth = declaration.depth + 1;
                }
                const parent_scope: ?NodeId = if (parent_index) |index| .{ .domain = core.domain, .slot = index, .generation = 0 } else null;
                if (self.keys.contains(.{ .parent = parent_scope, .key = key })) return error.DuplicateKey;
                const allocator = self.arena.allocator();
                const copied_key: Key = switch (key) {
                    .named => |bytes| .{ .named = try allocator.dupe(u8, bytes) },
                    else => key,
                };
                var copied_properties = properties;
                copied_properties.label = try allocator.dupe(u8, properties.label);
                const index: u32 = @intCast(self.declarations.items.len);
                try self.declarations.append(allocator, .{ .parent = parent_index, .key = copied_key, .kind = kind, .properties = copied_properties, .depth = depth });
                try self.keys.put(allocator, .{ .parent = parent_scope, .key = copied_key }, index);
                self.text_bytes += additional;
                return .{ .domain = core.domain, .transaction = self.transaction, .index = index };
            }
            /// Declares under the current builder group, or the root scope.
            pub fn node(self: *Transaction, key: Key, kind: Kind, properties: Properties) Failure!DraftId {
                errdefer self.failed = true;
                _ = try self.ready(); // Never inspect an aborted builder's released stack.
                return self.add(if (self.stack.items.len == 0) null else self.stack.items[self.stack.items.len - 1], key, kind, properties);
            }
            /// Declares and enters a group on the same transaction engine.
            pub fn begin_group(self: *Transaction, key: Key, properties: Properties) Failure!DraftId {
                errdefer self.failed = true;
                const draft = try self.node(key, .group, properties);
                try self.stack.append(self.arena.allocator(), draft);
                return draft;
            }
            /// Ends the current builder scope; unbalanced scopes reject publication.
            pub fn end_group(self: *Transaction) Failure!void {
                errdefer self.failed = true;
                _ = try self.ready();
                if (self.stack.items.len == 0) return error.UnbalancedScopes;
                self.stack.items.len -= 1;
            }
            /// Requests focus at publication; null explicitly clears it.
            pub fn request_focus(self: *Transaction, draft: ?DraftId) Failure!void {
                errdefer self.failed = true;
                _ = try self.ready();
                if (draft) |value| {
                    _ = try self.validate_draft(value);
                    self.focus = .{ .draft = value };
                } else self.focus = .clear;
            }
            /// Requests capture at publication; null explicitly clears it.
            pub fn request_capture(self: *Transaction, draft: ?DraftId) Failure!void {
                errdefer self.failed = true;
                _ = try self.ready();
                if (draft) |value| {
                    _ = try self.validate_draft(value);
                    self.capture = .{ .draft = value };
                } else self.capture = .clear;
            }
            /// Declares an independent logical semantic node; materialization
            /// is optional and never used as the semantic identity itself.
            pub fn semantic_node(self: *Transaction, parent: ?sem.Draft, key: Key, properties: sem.Properties, materialized: ?DraftId) Failure!sem.Draft {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic intent");
                errdefer self.failed = true;
                const core = try self.ready();
                const index = if (materialized) |draft| try self.validate_draft(draft) else null;
                return self.semantic_builder.add(self.arena.allocator(), core.domain, self.transaction, core.limits.max_semantic_nodes, core.limits.max_semantic_bytes, parent, key, properties, index);
            }
            /// Sets checked staged references after all endpoints are declared.
            pub fn semantic_relations(self: *Transaction, draft: sem.Draft, relations: sem.Relations) Failure!void {
                if (!semantic_enabled) @compileError("use ui.with_semantics for semantic intent");
                errdefer self.failed = true;
                const core = try self.ready();
                try self.semantic_builder.link(draft, relations, core.domain, self.transaction);
            }
            /// Clones a replacement before publication. State channels are
            /// independent typed pools, never an erased public pointer/union.
            pub fn set_state(self: *Transaction, comptime channel: []const u8, draft: DraftId, value: *const State(channel)) Failure!void {
                errdefer self.failed = true;
                const core = try self.ready();
                const node_index = try self.validate_draft(draft);
                const index = comptime state_index(channel);
                const Pool = state_pool.Pool(@field(schema, channel));
                if (core.limits.max_state_entries == 0 or try Pool.logical_bytes(value) > core.limits.max_state_bytes) return error.StateLimit;
                const cell = try Pool.Cell.create(core.allocator, value);
                errdefer cell.release();
                if (cell.logical_bytes > core.limits.max_state_bytes) return error.StateLimit;
                const entry = try self.states[index].getOrPut(self.arena.allocator(), node_index);
                const previous = if (entry.found_existing) entry.value_ptr.* else null;
                entry.value_ptr.* = cell;
                if (previous) |owned| owned.release();
            }
            /// Explicitly clears a channel; absence of an override otherwise
            /// inherits the previous value when key/scope/kind identity matches.
            pub fn clear_state(self: *Transaction, comptime channel: []const u8, draft: DraftId) Failure!void {
                errdefer self.failed = true;
                const node_index = try self.validate_draft(draft);
                const index = comptime state_index(channel);
                const entry = try self.states[index].getOrPut(self.arena.allocator(), node_index);
                const previous = if (entry.found_existing) entry.value_ptr.* else null;
                entry.value_ptr.* = null;
                if (previous) |owned| owned.release();
            }
            fn selection(request: Selection, previous: ?NodeId, storage: *const Storage, is_focus: bool) Failure!?NodeId {
                const id = switch (request) {
                    .clear => return null,
                    .retain => previous orelse return null,
                    .draft => |draft| storage.nodes[draft.index].id,
                };
                const node_value = storage.resolve(id) catch |err| switch (request) {
                    .retain => return null,
                    else => return err,
                };
                var enabled = node_value.properties.enabled;
                var parent = node_value.parent;
                while (parent) |ancestor| {
                    const record = try storage.resolve(ancestor);
                    enabled = enabled and record.properties.enabled;
                    parent = record.parent;
                }
                const valid = enabled and (if (is_focus) node_value.properties.focusable else node_value.kind == .control or node_value.kind == .editor);
                if (!valid) switch (request) {
                    .retain => return null,
                    else => return error.InvalidTarget,
                };
                return id;
            }
            /// Validates/resolves and publishes once. Success consumes staging and
            /// returns an owning snapshot; failure leaves the old scene unchanged.
            pub fn commit(self: *Transaction) Failure!Version {
                errdefer self.failed = true;
                const core = try self.ready();
                if (self.stack.items.len != 0) return error.UnbalancedScopes;
                const old = core.current.?;
                const scratch = self.arena.allocator();
                var frozen = std.heap.ArenaAllocator.init(core.allocator);
                errdefer frozen.deinit();
                const allocator = frozen.allocator();
                var prepared: Prepared = undefined;
                inline for (names, 0..) |_, i| prepared[i] = .{};
                errdefer inline for (names, 0..) |_, i| prepared[i].release();
                var old_states: OldIndices = undefined;
                inline for (names, 0..) |_, i| {
                    old_states[i] = .empty;
                    for (old.states[i]) |entry| try old_states[i].put(scratch, entry.node, entry.cell);
                    const capacity = @min(self.declarations.items.len, std.math.add(usize, old.states[i].len, self.states[i].count()) catch return error.StateLimit);
                    const Pool = state_pool.Pool(@field(schema, names[i]));
                    prepared[i].entries = try allocator.alloc(Pool.Entry, capacity);
                }
                var state_count: usize = 0;
                var state_bytes: usize = 0;
                var index: Index = .empty;
                for (old.nodes, 0..) |old_node, i| try index.put(scratch, .{ .parent = old_node.parent, .key = old_node.key }, @intCast(i));
                const capacity = @min(@as(usize, core.limits.max_slots), std.math.add(usize, old.slots.len, self.declarations.items.len) catch return error.SlotLimit);
                var slots = try std.ArrayList(Slot).initCapacity(allocator, capacity);
                slots.appendSliceAssumeCapacity(old.slots);
                for (slots.items) |*slot| slot.node = null;
                const nodes = try allocator.alloc(Node, self.declarations.items.len);
                var free_cursor: usize = 0;
                for (self.declarations.items, 0..) |declaration, i| {
                    const parent: ?NodeId = if (declaration.parent) |p| nodes[p].id else null;
                    const old_index = index.get(.{ .parent = parent, .key = declaration.key });
                    var id: NodeId = undefined;
                    if (old_index != null and old.nodes[old_index.?].kind == declaration.kind) {
                        id = old.nodes[old_index.?].id;
                    } else {
                        while (free_cursor < old.slots.len and (old.slots[free_cursor].node != null or old.slots[free_cursor].retired)) free_cursor += 1;
                        const slot_index = if (free_cursor < old.slots.len) block: {
                            const available = free_cursor;
                            free_cursor += 1;
                            break :block available;
                        } else block: {
                            if (slots.items.len >= core.limits.max_slots) return error.SlotLimit;
                            const appended = slots.items.len;
                            slots.appendAssumeCapacity(.{});
                            break :block appended;
                        };
                        id = .{ .domain = core.domain, .slot = @intCast(slot_index), .generation = slots.items[slot_index].generation };
                    }
                    slots.items[id.slot].node = @intCast(i);
                    const copied_key: Key = switch (declaration.key) {
                        .named => |bytes| .{ .named = try allocator.dupe(u8, bytes) },
                        else => declaration.key,
                    };
                    var properties = declaration.properties;
                    properties.label = try allocator.dupe(u8, properties.label);
                    nodes[i] = .{ .id = id, .parent = parent, .key = copied_key, .kind = declaration.kind, .properties = properties };
                    inline for (names, 0..) |_, channel| {
                        const cell = if (self.states[channel].getPtr(@intCast(i))) |override| override.* else block: {
                            if (old_index) |previous| if (old.nodes[previous].id.eql(id)) break :block old_states[channel].get(previous);
                            break :block null;
                        };
                        if (cell) |value| {
                            if (state_count >= core.limits.max_state_entries) return error.StateLimit;
                            state_bytes = std.math.add(usize, state_bytes, value.logical_bytes) catch return error.StateLimit;
                            if (state_bytes > core.limits.max_state_bytes) return error.StateLimit;
                            try prepared[channel].append(@intCast(i), value);
                            state_count += 1;
                        }
                    }
                    if (declaration.parent) |p| nodes[p].child_count += 1;
                }
                for (old.slots, 0..) |previous, i| {
                    if (previous.node != null and slots.items[i].node == null) {
                        if (previous.generation == std.math.maxInt(u64)) slots.items[i].retired = true else slots.items[i].generation += 1;
                    }
                }
                var child_count: usize = 0;
                for (nodes) |*n| {
                    n.first_child = @intCast(child_count);
                    child_count += n.child_count;
                }
                const children = try allocator.alloc(u32, child_count);
                const filled = try scratch.alloc(u32, nodes.len);
                @memset(filled, 0);
                for (self.declarations.items, 0..) |declaration, i| if (declaration.parent) |p| {
                    children[nodes[p].first_child + filled[p]] = @intCast(i);
                    filled[p] += 1;
                };
                var candidate: Storage = .{ .allocator = core.allocator, .arena = frozen, .domain = core.domain, .revision = old.revision + 1, .transaction = self.transaction, .nodes = nodes, .slots = slots.items, .children = children };
                inline for (names, 0..) |_, i| candidate.states[i] = prepared[i].entries[0..prepared[i].count];
                candidate.focus = try selection(self.focus, old.focus, &candidate, true);
                candidate.capture = try selection(self.capture, old.capture, &candidate, false);
                if (semantic_enabled) candidate.semantic_tree = try self.semantic_builder.prepare(allocator, scratch, core.domain, &old.semantic_tree, nodes, candidate.focus);
                errdefer if (semantic_enabled) candidate.semantic_tree.release();
                // Semantic preparation can grow the arena after candidate creation.
                candidate.arena = frozen;
                const storage = try core.allocator.create(Storage);
                storage.* = candidate;
                storage.references = 2; // Owner plus the returned owning snapshot.
                // No fallible work or model action after publication. Ownership-policy
                // retirement below is infallible and must not reenter the scene.
                core.current = storage;
                core.active = null;
                self.core = null;
                if (semantic_enabled) self.semantic_builder.release();
                inline for (names, 0..) |name, i| state_pool.Pool(@field(schema, name)).release_stage(self.states[i]);
                self.arena.deinit();
                core.release();
                old.release();
                return .{ .storage = storage };
            }
        };

        pub const Scene = Owner;
        pub const Snapshot = Version;
        pub const Update = Transaction;
        pub const Children = ChildIterator;
    };
}
const BaseError = Error;
const Plain = with_states(.{});
pub const Scene = Plain.Scene;
pub const Snapshot = Plain.Snapshot;
pub const Update = Plain.Update;
pub const Children = Plain.Children;

test "scene retired generations never wrap and reused slots reject stale IDs" {
    const t = std.testing;
    var scene = try Scene.init(t.allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try update.node(.{ .integer = 1 }, .label, .{});
    var first = try update.commit();
    const original = try first.id_for(draft);
    first.deinit();
    update = try scene.begin_update();
    var empty = try update.commit();
    empty.deinit();
    update = try scene.begin_update();
    const next_draft = try update.node(.{ .integer = 2 }, .label, .{});
    var next = try update.commit();
    const reused = try next.id_for(next_draft);
    try t.expectEqual(original.slot, reused.slot);
    try t.expectEqual(original.generation + 1, reused.generation);
    try t.expectError(error.StaleNode, scene.resolve(original));
    next.deinit();
    // Controlled private fixture at the otherwise unreachable wrap boundary.
    const current = scene.core.current.?;
    @constCast(current.slots)[reused.slot].generation = std.math.maxInt(u64);
    @constCast(current.nodes)[0].id.generation = std.math.maxInt(u64);
    const saturated = current.nodes[0].id;
    update = try scene.begin_update();
    empty = try update.commit();
    empty.deinit();
    try t.expect(scene.core.current.?.slots[reused.slot].retired);
    update = try scene.begin_update();
    const replacement = try update.node(.{ .integer = 3 }, .label, .{});
    var last = try update.commit();
    defer last.deinit();
    try t.expect((try last.id_for(replacement)).slot != saturated.slot);
    try t.expectError(error.StaleNode, scene.resolve(saturated));
}

test "scene revision transaction and reference limits fail without mutation" {
    const t = std.testing;
    var scene = try Scene.init(t.allocator, .{});
    defer scene.deinit();
    const storage = scene.core.current.?;
    storage.revision = std.math.maxInt(u64);
    try t.expectError(error.RevisionExhausted, scene.begin_update());
    storage.revision = 0;
    scene.core.next_transaction = std.math.maxInt(u64);
    try t.expectError(error.RevisionExhausted, scene.begin_update());
    scene.core.next_transaction = 1;
    storage.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, scene.snapshot());
    storage.references = 1;
    scene.core.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, scene.begin_update());
    scene.core.references = 1;
    try t.expect(scene.core.active == null);
    try t.expectEqual(@as(u64, 0), storage.revision);
}

test "scene full-key equality handles forced hash collisions" {
    const ConstantContext = struct {
        pub fn hash(_: @This(), _: ScopedKey) u64 {
            return 0;
        }
        pub fn eql(_: @This(), a: ScopedKey, b: ScopedKey) bool {
            return KeyContext.eql(.{}, a, b);
        }
    };
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    var index: std.HashMapUnmanaged(ScopedKey, u32, ConstantContext, 80) = .empty;
    for (0..100) |i| {
        const name = try std.fmt.allocPrint(allocator, "key-{d}", .{i});
        try index.put(allocator, .{ .parent = null, .key = .{ .named = name } }, @intCast(i));
    }
    for (0..100) |i| {
        const name = try std.fmt.allocPrint(allocator, "key-{d}", .{i});
        try std.testing.expectEqual(@as(?u32, @intCast(i)), index.get(.{ .parent = null, .key = .{ .named = name } }));
    }
}
