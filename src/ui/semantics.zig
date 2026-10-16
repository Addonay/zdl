//! Provider-independent semantic intent and checked owner-thread actions.
//! No native accessibility service/client is implemented by these records.
const std = @import("std");
const identity = @import("identity.zig");
const scene = @import("scene.zig");
const doc = @import("../text/document.zig");
const registry = @import("../text/registry.zig");
pub const Id = struct { domain: identity.Domain, serial: u64 };
pub const Draft = struct { domain: identity.Domain, transaction: u64, index: u32 };
pub const Error = doc.Error || error{
    SemanticLimit,
    SemanticIdExhausted,
    SemanticRevisionExhausted,
    ForeignSemantic,
    ForeignSemanticDraft,
    DuplicateSemanticKey,
    InvalidSemantics,
    InvalidRelationship,
    RelationshipCycle,
    InvalidCollection,
    UnnamedControl,
    SemanticFocusMissing,
    StaleSemantic,
    StaleSemanticRevision,
    DisabledSemantic,
    UnsupportedSemanticAction,
};
pub const Role = enum { window, group, label, button, checkbox, slider, collection, item, editor };
pub const Action = enum { activate, focus, set_checked, set_number, reveal, set_selection, replace_text };
pub const Actions = struct {
    activate: bool = false,
    focus: bool = false,
    set_checked: bool = false,
    set_number: bool = false,
    reveal: bool = false,
    set_selection: bool = false,
    replace_text: bool = false,
    pub fn has(self: Actions, action: Action) bool {
        return switch (action) {
            inline else => |tag| @field(self, @tagName(tag)),
        };
    }
};
pub const Bounds = struct { x: f64, y: f64, width: f64, height: f64 };
pub const Number = struct { value: f64, min: f64, max: f64 };
/// Input snapshot is borrowed by add; staging/publication retain independent
/// immutable references. Protected disclosure exposes no text/selection view.
pub const Document = struct {
    snapshot: doc.Snapshot,
    registration: registry.Handle,
    read_only: bool = false,
    protected: bool = false,
};
pub const Properties = struct {
    role: Role,
    name: []const u8 = "",
    description: []const u8 = "",
    enabled: bool = true,
    inert: bool = false,
    actions: Actions = .{},
    checked: ?bool = null,
    number: ?Number = null,
    bounds: ?Bounds = null,
    document: ?Document = null,
    /// Complete logical collection metadata, not just its visible paint nodes.
    collection_count: ?u64 = null,
    position: ?u64 = null,
};
pub const Relations = struct { labelled_by: ?Draft = null, described_by: ?Draft = null, active_descendant: ?Draft = null };
pub const ResolvedRelations = struct { labelled_by: ?Id = null, described_by: ?Id = null, active_descendant: ?Id = null };
pub const Text = struct {
    value: []const u8,
    selection: ?doc.Selection,
    target: registry.Target,
    read_only: bool,
    protected: bool,
};
/// All slices borrow the scene snapshot/current scene that produced the view.
pub const View = struct {
    id: Id,
    revision: u64,
    parent: ?Id,
    role: Role,
    name: []const u8,
    description: []const u8,
    enabled: bool,
    inert: bool,
    focused: bool,
    actions: Actions,
    checked: ?bool,
    number: ?Number,
    bounds: ?Bounds,
    relations: ResolvedRelations,
    materialized: ?identity.NodeId,
    text: ?Text,
    collection_count: ?u64,
    position: ?u64,
    child_count: u32,
};
pub const Payload = union(Action) {
    activate: void,
    focus: void,
    set_checked: bool,
    set_number: f64,
    reveal: void,
    set_selection: struct { revision: doc.Revision, selection: doc.Selection },
    replace_text: struct { revision: doc.Revision, range: doc.Range, text: []const u8 },
};
pub const Source = enum { pointer, keyboard, assistive, programmatic };
pub const Request = struct { target: Id, revision: u64, payload: Payload, source: Source = .programmatic };
/// Immediate owner-thread result. Key borrows current scene; text payload borrows
/// Request. No callback/model mutation or asynchronous ticket completion occurs.
pub const Resolved = struct {
    target: Id,
    model_key: identity.Key,
    materialized: ?identity.NodeId,
    payload: Payload,
    source: Source,
    document: ?registry.Target,
    needs_materialization: bool,
};
const ScopeKey = struct { parent: u64, key: identity.Key };
const Context = struct {
    pub fn hash(_: @This(), value: ScopeKey) u64 {
        var h = std.hash.Wyhash.init(0);
        h.update(std.mem.asBytes(&value.parent));
        switch (value.key) {
            .integer => |n| {
                h.update(&.{0});
                h.update(std.mem.asBytes(&n));
            },
            .named => |name| {
                h.update(&.{1});
                h.update(name);
            },
        }
        return h.final();
    }
    pub fn eql(_: @This(), a: ScopeKey, b: ScopeKey) bool {
        return a.parent == b.parent and a.key.eql(b.key);
    }
};
const Index = std.HashMapUnmanaged(ScopeKey, u32, Context, 80);
const Declaration = struct { parent: ?u32, key: identity.Key, properties: Properties, materialized: ?u32, relations: Relations = .{} };
const Node = struct {
    id: Id,
    revision: u64 = 1,
    parent: ?Id,
    key: identity.Key,
    properties: Properties,
    materialized: ?identity.NodeId,
    relations: ResolvedRelations = .{},
    enabled: bool,
    inert: bool,
    focused: bool,
    name: []const u8 = "",
    first_child: u32 = 0,
    child_count: u32 = 0,
    fn view(self: *const Node) View {
        const text: ?Text = if (self.properties.document) |binding| .{
            .value = if (binding.protected) "" else binding.snapshot.text(),
            .selection = if (binding.protected) null else binding.snapshot.selection(),
            .target = .{ .registration = binding.registration, .revision = binding.snapshot.revision() },
            .read_only = binding.read_only,
            .protected = binding.protected,
        } else null;
        return .{ .id = self.id, .revision = self.revision, .parent = self.parent, .role = self.properties.role, .name = self.name, .description = self.properties.description, .enabled = self.enabled, .inert = self.inert, .focused = self.focused, .actions = self.properties.actions, .checked = self.properties.checked, .number = self.properties.number, .bounds = self.properties.bounds, .relations = self.relations, .materialized = self.materialized, .text = text, .collection_count = self.properties.collection_count, .position = self.properties.position, .child_count = self.child_count };
    }
};
/// Storage belongs to the containing scene arena; release only owned resources.
pub const Tree = struct {
    domain: identity.Domain = @fromBackingInt(0),
    next_id: u64 = 1,
    nodes: []const Node = &.{},
    children: []const u32 = &.{},
    index: std.AutoHashMapUnmanaged(u64, u32) = .empty,
    focus: ?Id = null,
    pub fn release(self: *const Tree) void {
        for (self.nodes) |node| if (node.properties.document) |binding| {
            var snapshot = binding.snapshot;
            snapshot.deinit();
        };
    }
    fn find_node(self: *const Tree, id: Id) Error!*const Node {
        if (id.domain != self.domain) return error.ForeignSemantic;
        const i = self.index.get(id.serial) orelse return error.StaleSemantic;
        return &self.nodes[i];
    }
    pub fn get(self: *const Tree, id: Id) Error!View {
        return (try self.find_node(id)).view();
    }
    pub fn at(self: *const Tree, index: usize) ?View {
        return if (index < self.nodes.len) self.nodes[index].view() else null;
    }
    pub fn id_for(self: *const Tree, draft: Draft, transaction: u64) Error!Id {
        if (draft.domain != self.domain or draft.transaction != transaction or draft.index >= self.nodes.len) return error.ForeignSemanticDraft;
        return self.nodes[draft.index].id;
    }
    pub fn child(self: *const Tree, id: Id, ordinal: usize) Error!?View {
        const parent = try self.find_node(id);
        if (ordinal >= parent.child_count) return null;
        return self.nodes[self.children[parent.first_child + ordinal]].view();
    }
    pub fn validate_action(self: *const Tree, request: Request) Error!Resolved {
        const target = try self.find_node(request.target);
        if (target.revision != request.revision) return error.StaleSemanticRevision;
        if (!target.enabled or target.inert) return error.DisabledSemantic;
        const kind = std.meta.activeTag(request.payload);
        if (!target.properties.actions.has(kind)) return error.UnsupportedSemanticAction;
        var document_target: ?registry.Target = null;
        switch (request.payload) {
            .set_number => |value| {
                const number = target.properties.number orelse return error.InvalidSemantics;
                if (!std.math.isFinite(value) or value < number.min or value > number.max) return error.InvalidSemantics;
            },
            inline .set_selection, .replace_text => |payload| {
                const binding = target.properties.document orelse return error.InvalidSemantics;
                if (binding.read_only or binding.protected) return error.UnsupportedSemanticAction;
                const revision = binding.snapshot.revision();
                if (payload.revision.document != revision.document) return error.ForeignDocument;
                if (payload.revision.value != revision.value) return error.StaleRevision;
                const text = binding.snapshot.text();
                switch (request.payload) {
                    .set_selection => |value| {
                        if (!boundary(text, value.selection.anchor_byte) or !boundary(text, value.selection.active_byte)) return error.InvalidSelection;
                    },
                    .replace_text => |value| {
                        if (value.range.start_byte > value.range.end_byte or !boundary(text, value.range.start_byte) or !boundary(text, value.range.end_byte)) return error.InvalidRange;
                        if (!std.unicode.utf8ValidateSlice(value.text)) return error.InvalidUtf8;
                        if (std.mem.indexOfScalar(u8, value.text, 0) != null) return error.EmbeddedNul;
                    },
                    else => unreachable,
                }
                document_target = .{ .registration = binding.registration, .revision = revision };
            },
            else => {},
        }
        return .{ .target = target.id, .model_key = target.key, .materialized = target.materialized, .payload = request.payload, .source = request.source, .document = document_target, .needs_materialization = target.materialized == null and (kind == .focus or kind == .reveal) };
    }
};
fn boundary(text: []const u8, offset: usize) bool {
    return offset <= text.len and (offset == text.len or text[offset] & 0xc0 != 0x80);
}
fn name_present(name: []const u8) bool {
    return std.mem.trim(u8, name, " \r\n\t").len != 0;
}
fn named_role(role: Role) bool {
    return switch (role) {
        .window, .button, .checkbox, .slider, .editor, .item => true,
        else => false,
    };
}
fn allowed(role: Role, action: Action) bool {
    return switch (action) {
        .activate => role == .button or role == .checkbox or role == .item,
        .focus => role == .button or role == .checkbox or role == .slider or role == .editor or role == .item or role == .collection,
        .set_checked => role == .checkbox,
        .set_number => role == .slider,
        .reveal => role == .item,
        .set_selection, .replace_text => role == .editor,
    };
}
fn properties_valid(p: Properties) Error!void {
    if (!std.unicode.utf8ValidateSlice(p.name) or !std.unicode.utf8ValidateSlice(p.description)) return error.InvalidUtf8;
    if (std.mem.indexOfScalar(u8, p.name, 0) != null or std.mem.indexOfScalar(u8, p.description, 0) != null) return error.EmbeddedNul;
    inline for (std.meta.tags(Action)) |action| if (p.actions.has(action) and !allowed(p.role, action)) return error.InvalidSemantics;
    if ((p.role == .checkbox) != (p.checked != null) or (p.role == .slider) != (p.number != null) or (p.role == .editor) != (p.document != null) or
        (p.role == .collection) != (p.collection_count != null) or (p.role == .item) != (p.position != null)) return error.InvalidSemantics;
    if (p.number) |number| if (!std.math.isFinite(number.value) or !std.math.isFinite(number.min) or !std.math.isFinite(number.max) or number.min > number.max or number.value < number.min or number.value > number.max) return error.InvalidSemantics;
    if (p.bounds) |bounds| if (!std.math.isFinite(bounds.x) or !std.math.isFinite(bounds.y) or !std.math.isFinite(bounds.width) or !std.math.isFinite(bounds.height) or bounds.width < 0 or bounds.height < 0) return error.InvalidSemantics;
    if (p.document) |binding| {
        if ((binding.read_only or binding.protected) and (p.actions.set_selection or p.actions.replace_text)) return error.InvalidSemantics;
        if (!binding.protected and std.mem.indexOfScalar(u8, binding.snapshot.text(), 0) != null) return error.EmbeddedNul;
    }
}
fn binding_eql(a: ?Document, b: ?Document) bool {
    if (a) |left| {
        const right = b orelse return false;
        return std.meta.eql(left.registration, right.registration) and std.meta.eql(left.snapshot.revision(), right.snapshot.revision()) and left.read_only == right.read_only and left.protected == right.protected;
    }
    return b == null;
}
fn same(a: *const Node, b: *const Node, fresh: *const Tree, old: *const Tree) bool {
    const p = a.properties;
    const q = b.properties;
    if (!std.meta.eql(a.parent, b.parent) or !std.meta.eql(a.materialized, b.materialized) or !std.meta.eql(a.relations, b.relations) or
        a.enabled != b.enabled or a.inert != b.inert or a.focused != b.focused or !std.mem.eql(u8, a.name, b.name) or
        !std.mem.eql(u8, p.description, q.description) or !std.meta.eql(p.actions, q.actions) or p.checked != q.checked or
        !std.meta.eql(p.number, q.number) or !std.meta.eql(p.bounds, q.bounds) or !binding_eql(p.document, q.document) or
        p.collection_count != q.collection_count or p.position != q.position or a.child_count != b.child_count) return false;
    for (0..a.child_count) |i| if (!std.meta.eql(fresh.nodes[fresh.children[a.first_child + i]].id, old.nodes[old.children[b.first_child + i]].id)) return false;
    return true;
}
/// Staging borrows its containers/strings from Update's arena and owns retained
/// input document references. Caller releases resources before arena teardown.
pub const Builder = struct {
    declarations: std.ArrayList(Declaration) = .empty,
    keys: Index = .empty,
    bytes: usize = 0,
    pub fn release(self: *Builder) void {
        for (self.declarations.items) |declaration| if (declaration.properties.document) |binding| {
            var snapshot = binding.snapshot;
            snapshot.deinit();
        };
    }
    fn draft_index(self: *const Builder, draft: Draft, domain: identity.Domain, transaction: u64) Error!u32 {
        if (draft.domain != domain or draft.transaction != transaction or draft.index >= self.declarations.items.len) return error.ForeignSemanticDraft;
        return draft.index;
    }
    pub fn add(self: *Builder, allocator: std.mem.Allocator, domain: identity.Domain, transaction: u64, limit: usize, byte_limit: usize, parent: ?Draft, key: identity.Key, properties: Properties, materialized: ?u32) Error!Draft {
        if (self.declarations.items.len >= limit) return error.SemanticLimit;
        const key_bytes = switch (key) {
            .named => |name| name.len,
            else => 0,
        };
        var additional = std.math.add(usize, key_bytes, properties.name.len) catch return error.SemanticLimit;
        additional = std.math.add(usize, additional, properties.description.len) catch return error.SemanticLimit;
        if (properties.document) |binding| additional = std.math.add(usize, additional, binding.snapshot.text().len) catch return error.SemanticLimit;
        if (additional > byte_limit - self.bytes) return error.SemanticLimit;
        try properties_valid(properties);
        const parent_index = if (parent) |value| try self.draft_index(value, domain, transaction) else null;
        if (parent_index) |index| if (self.declarations.items[index].properties.role == .label) return error.InvalidSemantics;
        const scope: u64 = if (parent_index) |i| @as(u64, i) + 1 else 0;
        if (self.keys.contains(.{ .parent = scope, .key = key })) return error.DuplicateSemanticKey;
        const copied_key: identity.Key = switch (key) {
            .named => |name| .{ .named = try allocator.dupe(u8, name) },
            else => key,
        };
        var copied = properties;
        copied.name = try allocator.dupe(u8, properties.name);
        copied.description = try allocator.dupe(u8, properties.description);
        // Put may fail: resources are acquired only after all other staging work.
        const index: u32 = @intCast(self.declarations.items.len);
        try self.declarations.ensureUnusedCapacity(allocator, 1);
        try self.keys.put(allocator, .{ .parent = scope, .key = copied_key }, index);
        if (copied.document) |*binding| binding.snapshot = try binding.snapshot.retain();
        self.declarations.appendAssumeCapacity(.{ .parent = parent_index, .key = copied_key, .properties = copied, .materialized = materialized });
        self.bytes += additional;
        return .{ .domain = domain, .transaction = transaction, .index = index };
    }
    pub fn link(self: *Builder, draft: Draft, relations: Relations, domain: identity.Domain, transaction: u64) Error!void {
        const index = try self.draft_index(draft, domain, transaction);
        inline for (.{ "labelled_by", "described_by", "active_descendant" }) |field| if (@field(relations, field)) |target| {
            _ = try self.draft_index(target, domain, transaction);
        };
        self.declarations.items[index].relations = relations;
    }
    pub fn prepare(self: *const Builder, allocator: std.mem.Allocator, scratch: std.mem.Allocator, domain: identity.Domain, old: *const Tree, materialized: []const scene.Node, focus: ?identity.NodeId) Error!Tree {
        var tree: Tree = .{ .domain = domain, .next_id = old.next_id };
        const nodes = try allocator.alloc(Node, self.declarations.items.len);
        tree.nodes = nodes;
        var built: usize = 0;
        errdefer for (nodes[0..built]) |node| if (node.properties.document) |binding| {
            var snapshot = binding.snapshot;
            snapshot.deinit();
        };
        var old_index: Index = .empty;
        for (old.nodes, 0..) |node, i| try old_index.put(scratch, .{ .parent = if (node.parent) |parent| parent.serial else 0, .key = node.key }, @intCast(i));
        const physical_enabled = try scratch.alloc(bool, materialized.len);
        var physical_index: std.AutoHashMapUnmanaged(u32, u32) = .empty;
        for (materialized, 0..) |node, i| {
            var enabled = node.properties.enabled;
            if (node.parent) |parent| {
                const p = physical_index.get(parent.slot) orelse return error.InvalidSemantics;
                if (!materialized[p].id.eql(parent)) return error.InvalidSemantics;
                enabled = enabled and physical_enabled[p];
            }
            physical_enabled[i] = enabled;
            try physical_index.put(scratch, node.id.slot, @intCast(i));
        }
        const matches = try scratch.alloc(?u32, nodes.len);
        var roots: usize = 0;
        var root: u32 = 0;
        var linked: std.AutoHashMapUnmanaged(u32, void) = .empty;
        for (self.declarations.items, 0..) |declaration, i| {
            const parent: ?Id = if (declaration.parent) |p| nodes[p].id else null;
            const previous = old_index.get(.{ .parent = if (parent) |p| p.serial else 0, .key = declaration.key });
            const matched = previous != null and old.nodes[previous.?].properties.role == declaration.properties.role;
            matches[i] = if (matched) previous else null;
            var id: Id = undefined;
            if (matched) id = old.nodes[previous.?].id else {
                if (tree.next_id == std.math.maxInt(u64)) return error.SemanticIdExhausted;
                id = .{ .domain = domain, .serial = tree.next_id };
                tree.next_id += 1;
            }
            var properties = declaration.properties;
            properties.name = try allocator.dupe(u8, properties.name);
            properties.description = try allocator.dupe(u8, properties.description);
            const key: identity.Key = switch (declaration.key) {
                .named => |name| .{ .named = try allocator.dupe(u8, name) },
                else => declaration.key,
            };
            var node_id: ?identity.NodeId = null;
            var enabled = properties.enabled;
            var inert = properties.inert;
            if (declaration.parent) |p| {
                enabled = enabled and nodes[p].enabled;
                inert = inert or nodes[p].inert;
            } else {
                roots += 1;
                root = @intCast(i);
            }
            if (declaration.materialized) |index| {
                if (index >= materialized.len or linked.contains(index)) return error.InvalidSemantics;
                try linked.put(scratch, index, {});
                const node = materialized[index];
                node_id = node.id;
                enabled = enabled and physical_enabled[index];
                const valid = switch (properties.role) {
                    .button, .checkbox, .slider => node.kind == .control,
                    .editor => node.kind == .editor,
                    .label => node.kind == .label,
                    else => true,
                };
                if (!valid or (properties.actions.focus and !node.properties.focusable)) return error.InvalidSemantics;
            }
            if (properties.document) |*binding| binding.snapshot = try binding.snapshot.retain();
            nodes[i] = .{ .id = id, .parent = parent, .key = key, .properties = properties, .materialized = node_id, .enabled = enabled, .inert = inert, .focused = node_id != null and focus != null and node_id.?.eql(focus.?) };
            built += 1;
            if (nodes[i].focused) {
                if (!enabled or inert) return error.InvalidSemantics;
                tree.focus = id;
            }
            if (declaration.parent) |p| nodes[p].child_count += 1;
            try tree.index.put(allocator, id.serial, @intCast(i));
        }
        if (nodes.len != 0 and roots != 1) return error.InvalidSemantics;
        if (focus != null and tree.focus == null) return error.SemanticFocusMissing;
        var children_count: usize = 0;
        for (nodes) |*node| {
            node.first_child = @intCast(children_count);
            children_count += node.child_count;
        }
        const children = try allocator.alloc(u32, children_count);
        tree.children = children;
        const filled = try scratch.alloc(u32, nodes.len);
        @memset(filled, 0);
        for (self.declarations.items, 0..) |declaration, i| {
            if (declaration.parent) |p| {
                children[nodes[p].first_child + filled[p]] = @intCast(i);
                filled[p] += 1;
            }
            inline for (.{ "labelled_by", "described_by", "active_descendant" }) |field| {
                if (@field(declaration.relations, field)) |draft| @field(nodes[i].relations, field) = nodes[draft.index].id;
            }
        }
        // Tree DFS intervals make descendant checks linear overall.
        const tin = try scratch.alloc(u32, nodes.len);
        const tout = try scratch.alloc(u32, nodes.len);
        const Frame = struct { index: u32, next: u32 = 0 };
        const stack = try scratch.alloc(Frame, nodes.len);
        if (nodes.len != 0) {
            var depth: usize = 1;
            var clock: u32 = 1;
            stack[0] = .{ .index = root };
            tin[root] = 0;
            while (depth != 0) {
                const frame = &stack[depth - 1];
                const node = nodes[frame.index];
                if (frame.next < node.child_count) {
                    const child = children[node.first_child + frame.next];
                    frame.next += 1;
                    tin[child] = clock;
                    clock += 1;
                    stack[depth] = .{ .index = child };
                    depth += 1;
                } else {
                    tout[frame.index] = clock;
                    depth -= 1;
                }
            }
        }
        // Combined naming/description graph must be acyclic.
        const marks = try scratch.alloc(u2, nodes.len);
        @memset(marks, 0);
        for (0..nodes.len) |start| {
            if (marks[start] != 0) continue;
            var depth: usize = 1;
            stack[0] = .{ .index = @intCast(start) };
            marks[start] = 1;
            while (depth != 0) {
                const frame = &stack[depth - 1];
                if (frame.next == 2) {
                    marks[frame.index] = 2;
                    depth -= 1;
                    continue;
                }
                const relation = if (frame.next == 0) nodes[frame.index].relations.labelled_by else nodes[frame.index].relations.described_by;
                frame.next += 1;
                if (relation) |id| {
                    const next = tree.index.get(id.serial).?;
                    if (marks[next] == 1) return error.RelationshipCycle;
                    if (marks[next] == 0) {
                        marks[next] = 1;
                        stack[depth] = .{ .index = next };
                        depth += 1;
                    }
                }
            }
        }
        // Resolve shared label names in linear work, without duplicating bytes.
        @memset(marks, 0);
        for (0..nodes.len) |start| {
            if (marks[start] != 0) continue;
            var at: u32 = @intCast(start);
            var depth: usize = 0;
            var resolved: []const u8 = "";
            while (true) {
                if (marks[at] != 0) {
                    resolved = nodes[at].name;
                    break;
                }
                stack[depth] = .{ .index = at };
                depth += 1;
                if (name_present(nodes[at].properties.name)) {
                    resolved = nodes[at].properties.name;
                    break;
                }
                const label = nodes[at].relations.labelled_by orelse break;
                at = tree.index.get(label.serial).?;
            }
            for (stack[0..depth]) |frame| {
                nodes[frame.index].name = resolved;
                marks[frame.index] = 2;
            }
        }
        for (nodes, 0..) |*node, i| {
            if (named_role(node.properties.role) and !name_present(node.name)) return error.UnnamedControl;
            if (node.relations.active_descendant) |id| {
                const target = tree.index.get(id.serial).?;
                if (tin[target] <= tin[i] or tin[target] >= tout[i]) return error.InvalidRelationship;
            }
            if (node.properties.role == .collection) {
                if (node.properties.collection_count.? != node.child_count) return error.InvalidCollection;
                for (0..node.child_count) |position| {
                    const item = nodes[children[node.first_child + position]];
                    if (item.properties.role != .item or item.properties.position.? != position) return error.InvalidCollection;
                }
            }
            if (node.properties.role == .item) {
                const parent = node.parent orelse return error.InvalidCollection;
                if (nodes[tree.index.get(parent.serial).?].properties.role != .collection) return error.InvalidCollection;
            }
            if (matches[i]) |previous| {
                node.revision = old.nodes[previous].revision;
                if (!same(node, &old.nodes[previous], &tree, old)) {
                    if (node.revision == std.math.maxInt(u64)) return error.SemanticRevisionExhausted;
                    node.revision += 1;
                }
            }
        }
        return tree;
    }
};
