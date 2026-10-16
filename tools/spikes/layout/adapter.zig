//! Disposable zlay adapter. Backend IDs, callbacks and render-command leases
//! never escape into retained scene identities or result snapshots.
const std = @import("std");
const zlay = @import("zlay");
const ui = @import("zdl").ui;
pub const Error = std.mem.Allocator.Error || error{
    InvalidOptions,
    InvalidGeometry,
    UnsupportedFractionalSpacing,
    UnsupportedConstraint,
    MissingStyle,
    DuplicateStyle,
    ForeignStyle,
    MeasurementRevision,
    Capacity,
    BackendFailure,
    MissingGeometry,
    NeedsMeasurement,
    EpochExhausted,
};
pub const Range = struct { min: f32 = 0, max: ?f32 = null };
pub const Axis = union(enum) { fixed: f32, grow: Range, content: Range, fraction: f32 };
pub const Constraint = union(enum) { unbounded, bounded: f32 };
pub const Size = struct { width: f32, height: f32 };
pub const Measurement = struct { scene_revision: u64, size: Size, constraint: Constraint };
pub const Padding = struct { left: f32 = 0, right: f32 = 0, top: f32 = 0, bottom: f32 = 0 };
pub const Style = struct {
    width: Axis = .{ .grow = .{} },
    height: Axis = .{ .content = .{} },
    direction: enum { row, column } = .column,
    padding: Padding = .{},
    gap: f32 = 0,
    align_x: enum { start, center, end } = .start,
    align_y: enum { start, center, end } = .start,
    /// Opaque leaf metrics from the same immutable paragraph used for paint.
    measurement: ?Measurement = null,
};
pub const Item = struct { id: ui.NodeId, style: Style };
pub const Rect = struct { x: f32, y: f32, width: f32, height: f32 };
pub const Placement = struct { id: ui.NodeId, box: Rect };
pub const Request = struct { id: ui.NodeId, scene_revision: u64, constraint: Constraint };
pub const Options = struct { max_nodes: u32 = 4096, max_dimension: f32 = 16384 };
fn finite(value: f32) bool {
    return std.math.isFinite(value) and value >= 0;
}
fn spacing(value: f32) Error!u16 {
    if (!finite(value) or value > std.math.maxInt(u16)) return error.InvalidGeometry;
    if (@trunc(value) != value) return error.UnsupportedFractionalSpacing;
    return @intFromFloat(value);
}
fn valid_axis(axis: Axis) Error!void {
    switch (axis) {
        .fixed => |value| if (!finite(value)) return error.InvalidGeometry,
        .fraction => |value| if (!finite(value) or value > 1) return error.InvalidGeometry,
        .grow, .content => |range| {
            if (!finite(range.min)) return error.InvalidGeometry;
            if (range.max) |max| if (!finite(max) or max < range.min or max == 0) return error.InvalidGeometry;
        },
    }
}
fn sizing(axis: Axis, measured: ?f32, padding: f32, leaf: bool) zlay.SizingAxis {
    return switch (axis) {
        .fixed => |value| .fixed(value),
        .fraction => |value| .percent(value),
        .grow => |range| .grow(.{ .min = range.min, .max = range.max orelse 0 }),
        .content => |range| if (leaf) .fixed(@min(@max((measured orelse 0) + padding, range.min), range.max orelse std.math.floatMax(f32))) else .fit(.{ .min = range.min, .max = range.max orelse 0 }),
    };
}
fn backend_id(index: usize) zlay.ElementId {
    // Reserve zero and the engine's implicit root. No hashing/collisions or
    // retained IDs are delegated to the backend's 32-bit identity space.
    var value: u32 = @intCast(index + 1);
    if (value >= zlay.Context.root_id.id) value += 1;
    return .{ .id = value, .base_id = value };
}
fn same_width(a: f32, b: f32) bool {
    return @abs(a - b) <= 0.0001 * @max(@as(f32, 1), @max(@abs(a), @abs(b)));
}
const State = struct { first_error: ?zlay.ErrorType = null };
fn report(err: zlay.ErrorData) void {
    const state: *State = @ptrCast(@alignCast(err.user_data.?));
    if (state.first_error == null) state.first_error = err.kind;
}
/// Result owns a retained scene and independent geometry/request storage.
/// Backend scratch may be reused/freed; no returned data aliases zlay memory.
pub fn Result(comptime Snapshot: type) type {
    return struct {
        allocator: std.mem.Allocator,
        arena: std.heap.ArenaAllocator,
        source: Snapshot,
        epoch: u64,
        boxes: []const Placement,
        requests: []const Request,
        lookup: std.AutoHashMapUnmanaged(ui.NodeId, u32),
        pub fn deinit(self: *@This()) void {
            self.source.deinit();
            self.arena.deinit();
            self.* = undefined;
        }
        pub fn ready(self: *const @This()) bool {
            return self.requests.len == 0;
        }
        pub fn measurement_requests(self: *const @This()) []const Request {
            return self.requests;
        }
        pub fn placements(self: *const @This()) Error![]const Placement {
            if (!self.ready()) return error.NeedsMeasurement;
            return self.boxes;
        }
        pub fn get(self: *const @This(), id: ui.NodeId) Error!Rect {
            if (!self.ready()) return error.NeedsMeasurement;
            return self.boxes[self.lookup.get(id) orelse return error.ForeignStyle].box;
        }
    };
}
/// Owns fixed-capacity backend scratch only. Results own no Adapter pointer.
/// Owner-thread only; callbacks only record backend errors, never call fonts/apps.
pub const Adapter = struct {
    allocator: std.mem.Allocator,
    options: Options,
    memory: []u8,
    context: *zlay.Context,
    state: *State,
    epoch: u64 = 0,
    pub fn init(allocator: std.mem.Allocator, options: Options) Error!Adapter {
        if (options.max_nodes == 0 or options.max_nodes > 1000000 or !finite(options.max_dimension) or options.max_dimension == 0) return error.InvalidOptions;
        const state = try allocator.create(State);
        errdefer allocator.destroy(state);
        state.* = .{};
        const config: zlay.Options = .{ .max_element_count = options.max_nodes + 2, .max_measure_text_cache_word_count = 1, .max_scroll_containers = 1, .max_transitions = 1, .error_handler = .{ .function = report, .user_data = state } };
        const memory = try allocator.alloc(u8, zlay.minMemorySize(config));
        errdefer allocator.free(memory);
        const context = zlay.Context.init(memory, config) catch return error.Capacity;
        context.setCullingEnabled(false);
        if (state.first_error != null) return error.BackendFailure;
        return .{ .allocator = allocator, .options = options, .memory = memory, .context = context, .state = state };
    }
    pub fn deinit(self: *Adapter) void {
        self.allocator.free(self.memory);
        self.allocator.destroy(self.state);
        self.* = undefined;
    }
    pub fn run(self: *Adapter, snapshot: anytype, items: []const Item, viewport: Size) (Error || snapshot_errors(@TypeOf(snapshot)))!Result(@TypeOf(snapshot)) {
        const nodes = snapshot.nodes();
        if (nodes.len > self.options.max_nodes) return error.Capacity;
        if (items.len != nodes.len) return error.MissingStyle;
        if (!finite(viewport.width) or !finite(viewport.height) or viewport.width == 0 or viewport.height == 0 or viewport.width > self.options.max_dimension or viewport.height > self.options.max_dimension) return error.InvalidGeometry;
        if (self.epoch == std.math.maxInt(u64)) return error.EpochExhausted;
        var scratch_arena = std.heap.ArenaAllocator.init(self.allocator);
        defer scratch_arena.deinit();
        const scratch = scratch_arena.allocator();
        var arena = std.heap.ArenaAllocator.init(self.allocator);
        errdefer arena.deinit();
        const output = arena.allocator();
        var index: std.AutoHashMapUnmanaged(ui.NodeId, u32) = .empty;
        for (nodes, 0..) |node, i| try index.put(output, node.id, @intCast(i));
        const styles = try scratch.alloc(Style, nodes.len);
        const seen = try scratch.alloc(bool, nodes.len);
        @memset(seen, false);
        for (items) |item| {
            _ = snapshot.resolve(item.id) catch return error.ForeignStyle;
            const i = index.get(item.id) orelse return error.ForeignStyle;
            if (seen[i]) return error.DuplicateStyle;
            seen[i] = true;
            styles[i] = item.style;
        }
        const ranges = try scratch.alloc(struct { first: usize, count: usize }, nodes.len);
        var edges: std.ArrayList(u32) = .empty;
        var roots: std.ArrayList(u32) = .empty;
        const width_bound = try scratch.alloc(bool, nodes.len);
        const height_bound = try scratch.alloc(bool, nodes.len);
        for (nodes, 0..) |node, i| {
            const style = styles[i];
            try valid_axis(style.width);
            try valid_axis(style.height);
            _ = try spacing(style.gap);
            _ = try spacing(style.padding.left);
            _ = try spacing(style.padding.right);
            _ = try spacing(style.padding.top);
            _ = try spacing(style.padding.bottom);
            var children = try snapshot.children(node.id);
            const first = edges.items.len;
            while (children.next()) |child| try edges.append(scratch, index.get(child.id) orelse return error.ForeignStyle);
            ranges[i] = .{ .first = first, .count = edges.items.len - first };
            if (style.measurement) |measurement| {
                if (ranges[i].count != 0 or measurement.scene_revision != snapshot.revision()) return error.MeasurementRevision;
                if (!finite(measurement.size.width) or !finite(measurement.size.height) or measurement.size.width > self.options.max_dimension or measurement.size.height > self.options.max_dimension) return error.InvalidGeometry;
                if (measurement.constraint == .bounded and (!finite(measurement.constraint.bounded) or measurement.constraint.bounded > self.options.max_dimension)) return error.InvalidGeometry;
            }
            const parent_index: ?u32 = if (node.parent) |parent| index.get(parent) orelse return error.ForeignStyle else null;
            const parent_width = if (parent_index) |parent| width_bound[parent] else true;
            const parent_height = if (parent_index) |parent| height_bound[parent] else true;
            if (((style.width == .grow or style.width == .fraction) and !parent_width) or ((style.height == .grow or style.height == .fraction) and !parent_height)) return error.UnsupportedConstraint;
            width_bound[i] = style.width != .content or ranges[i].count == 0;
            height_bound[i] = style.height != .content or ranges[i].count == 0;
            if (parent_index == null) try roots.append(scratch, @intCast(i));
        }
        self.state.first_error = null;
        self.context.setLayoutDimensions(.{ .width = viewport.width, .height = viewport.height });
        self.context.beginLayout();
        const Frame = struct { node: u32, next: usize = 0 };
        const stack = try scratch.alloc(Frame, nodes.len);
        for (roots.items) |root| {
            var depth: usize = 1;
            stack[0] = .{ .node = root };
            try self.open(root, styles[root], ranges[root].count == 0);
            while (depth != 0) {
                const frame = &stack[depth - 1];
                const range = ranges[frame.node];
                if (frame.next < range.count) {
                    const child = edges.items[range.first + frame.next];
                    frame.next += 1;
                    try self.open(child, styles[child], ranges[child].count == 0);
                    stack[depth] = .{ .node = child };
                    depth += 1;
                } else {
                    self.context.closeElement();
                    depth -= 1;
                }
                if (self.state.first_error != null) return error.BackendFailure;
            }
        }
        _ = self.context.endLayout(0);
        if (self.state.first_error != null or self.context.warnings.max_elements_exceeded) return error.BackendFailure;
        const boxes = try output.alloc(Placement, nodes.len);
        var requests: std.ArrayList(Request) = .empty;
        for (nodes, 0..) |node, i| {
            const data = self.context.elementData(backend_id(i)) orelse return error.MissingGeometry;
            const b = data.bounding_box;
            if (!std.math.isFinite(b.x) or !std.math.isFinite(b.y) or !finite(b.width) or !finite(b.height) or
                !std.math.isFinite(b.x + b.width) or !std.math.isFinite(b.y + b.height) or @abs(b.x) > self.options.max_dimension or @abs(b.y) > self.options.max_dimension or b.width > self.options.max_dimension or b.height > self.options.max_dimension) return error.InvalidGeometry;
            boxes[i] = .{ .id = node.id, .box = .{ .x = b.x, .y = b.y, .width = b.width, .height = b.height } };
            const style = styles[i];
            if (ranges[i].count == 0 and (style.measurement != null or style.width == .content or style.height == .content)) {
                const width = @max(@as(f32, 0), b.width - style.padding.left - style.padding.right);
                const requested: ?Constraint = if (style.measurement) |measurement| switch (measurement.constraint) {
                    .bounded => |measured_width| if (same_width(width, measured_width)) null else .{ .bounded = width },
                    .unbounded => if (width + 0.0001 >= measurement.size.width) null else .{ .bounded = width },
                } else if (style.width == .content) .unbounded else .{ .bounded = width };
                if (requested) |constraint| try requests.append(output, .{ .id = node.id, .scene_revision = snapshot.revision(), .constraint = constraint });
            }
        }
        const retained = try snapshot.retain();
        self.epoch += 1;
        // No allocation after moving the final arena state into the result.
        return .{ .allocator = self.allocator, .arena = arena, .source = retained, .epoch = self.epoch, .boxes = boxes, .requests = requests.items, .lookup = index };
    }
    fn open(self: *Adapter, index: u32, style: Style, leaf: bool) Error!void {
        const measurement = style.measurement;
        self.context.openElement(backend_id(index));
        self.context.configureOpenElement(.{ .layout = .{
            .sizing = .{ .width = sizing(style.width, if (measurement) |m| m.size.width else null, style.padding.left + style.padding.right, leaf), .height = sizing(style.height, if (measurement) |m| m.size.height else null, style.padding.top + style.padding.bottom, leaf) },
            .direction = if (style.direction == .row) .left_to_right else .top_to_bottom,
            .padding = .{ .left = try spacing(style.padding.left), .right = try spacing(style.padding.right), .top = try spacing(style.padding.top), .bottom = try spacing(style.padding.bottom) },
            .child_gap = try spacing(style.gap),
            .child_alignment = .{ .x = switch (style.align_x) {
                .start => .left,
                .center => .center,
                .end => .right,
            }, .y = switch (style.align_y) {
                .start => .top,
                .center => .center,
                .end => .bottom,
            } },
        } });
        if (self.state.first_error != null) return error.BackendFailure;
    }
};
fn snapshot_errors(comptime Snapshot: type) type {
    return @typeInfo(@typeInfo(@TypeOf(Snapshot.retain)).@"fn".return_type.?).error_union.error_set;
}
