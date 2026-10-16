//! Owned backend-neutral paint packets. Recording invokes no deferred callbacks.
//! Solid/gradient geometry, affine clips, opacity layers and immutable RGBA images
//! form the initial protocol; positioned text, filters and public replay remain gated.
const std = @import("std");
const identity = @import("../core/identity.zig");
const gradient = @import("gradient.zig");
pub const Gradient = gradient.Gradient;
pub const GradientView = gradient.View;
pub const GradientSample = gradient.Sample;
pub const GradientStop = gradient.Stop;
pub const GradientGeometry = gradient.Geometry;
pub const GradientOptions = gradient.Options;
pub const GradientExtend = gradient.Extend;
const raster = @import("image.zig");
pub const Image = raster.Image;
pub const ImageView = raster.View;
pub const Error = raster.Error || gradient.Error || error{ ColorPolicyMismatch, ForeignGradient, InvalidGeometry, InvalidColor, InvalidPath, InvalidStroke, InvalidOpacity, CommandLimit, GeometryLimit, DepthLimit, Unbalanced, RecorderFailed };
const types = @import("types.zig");
pub const Point = types.Point;
pub const Rect = types.Rect;
pub const Color = types.Color;
pub const ColorPolicy = types.ColorPolicy;
pub const Affine = types.Affine;
pub const Segment = union(enum) { move: Point, line: Point, quadratic: struct { control: Point, to: Point }, cubic: struct { first: Point, second: Point, to: Point }, close: void };
pub const FillRule = enum { nonzero, even_odd };
pub const Cap = enum { butt, round, square };
pub const Join = enum { miter, round, bevel };
pub const Stroke = struct { width: f64 = 1, cap: Cap = .butt, join: Join = .miter, miter_limit: f64 = 10 };
pub const Sampling = enum { nearest, linear };
pub const RoundedRect = struct { rect: Rect, radius: f64 };
pub const Command = union(enum) {
    save: void,
    restore: void,
    transform: Affine,
    clip_rect: Rect,
    clip_rounded_rect: RoundedRect,
    clip_path: struct { segments: []const Segment, rule: FillRule },
    fill_rect: struct { rect: Rect, color: Color },
    fill_rounded_rect: struct { shape: RoundedRect, color: Color },
    fill_path: struct { segments: []const Segment, rule: FillRule, color: Color },
    stroke_path: struct { segments: []const Segment, style: Stroke, color: Color },
    fill_rect_gradient: struct { rect: Rect, gradient_id: identity.Domain },
    fill_rounded_rect_gradient: struct { shape: RoundedRect, gradient_id: identity.Domain },
    fill_path_gradient: struct { segments: []const Segment, rule: FillRule, gradient_id: identity.Domain },
    stroke_path_gradient: struct { segments: []const Segment, style: Stroke, gradient_id: identity.Domain },
    image: struct { image: ImageView, source: Rect, destination: Rect, sampling: Sampling },
    begin_layer: f64,
    end_layer: void,
};
pub const SceneStamp = struct { domain: identity.Domain, revision: u64 };
pub const Options = struct {
    scene: ?SceneStamp = null,
    color_policy: ColorPolicy = .srgb_compatible,
    device_transform: Affine = .identity,
    max_commands: usize = 65536,
    max_depth: usize = 256,
    max_segments: usize = 1024 * 1024,
    /// Unique retained tightly packed raster bytes, not process RSS or all memory.
    max_image_bytes: usize = 64 * 1024 * 1024,
    /// Unique retained gradient stop bytes, excluding headers/container capacity.
    max_gradient_bytes: usize = 16 * 1024 * 1024,
};
pub const Metadata = struct {
    scene: ?SceneStamp,
    color_policy: ColorPolicy,
    device_transform: Affine,
    /// Initial protocol always requests a full redraw. No inferred damage/opacity.
    full_redraw: bool = true,
};
const Storage = struct {
    allocator: std.mem.Allocator,
    references: std.atomic.Value(usize) = .init(1),
    metadata: Metadata,
    commands: std.ArrayList(Command) = .empty,
    images: std.ArrayList(Image) = .empty,
    image_index: std.AutoHashMapUnmanaged(identity.Domain, void) = .empty,
    gradients: std.ArrayList(Gradient) = .empty,
    gradient_index: std.AutoHashMapUnmanaged(identity.Domain, usize) = .empty,
    gradient_bytes: usize = 0,
    image_bytes: usize = 0,
    segments: usize = 0,
    fn destroy(self: *Storage) void {
        const allocator = self.allocator;
        for (self.commands.items) |command| switch (command) {
            inline .clip_path, .fill_path, .stroke_path, .fill_path_gradient, .stroke_path_gradient => |value| allocator.free(value.segments),
            else => {},
        };
        for (self.images.items) |*image| image.deinit();
        for (self.gradients.items) |*resource| resource.deinit();
        self.gradients.deinit(allocator);
        self.gradient_index.deinit(allocator);
        self.images.deinit(allocator);
        self.image_index.deinit(allocator);
        self.commands.deinit(allocator);
        allocator.destroy(self);
    }
};
/// Immutable command/resource lease. Clone/deinit on distinct handles are atomic;
/// allocator final-release threading rules are the same as Image. Commands borrow
/// this Packet; retaining a slice alone does not retain the resources it names.
pub const Packet = struct {
    storage: ?*Storage,
    /// Retains this immutable packet; saturation fails instead of wrapping.
    pub fn clone(self: *const Packet) Error!Packet {
        const storage = self.storage orelse return error.Closed;
        var count = storage.references.load(.monotonic);
        while (true) {
            if (count == std.math.maxInt(usize)) return error.ReferenceLimit;
            if (storage.references.cmpxchgWeak(count, count + 1, .monotonic, .monotonic)) |actual| count = actual else break;
        }
        return .{ .storage = storage };
    }
    /// Borrows command/resource views while this or another owning lease lives.
    pub fn commands(self: *const Packet) Error![]const Command {
        return (self.storage orelse return error.Closed).commands.items;
    }
    /// Borrows only a gradient retained by this packet; foreign IDs reject.
    pub fn gradient_view(self: *const Packet, id: identity.Domain) Error!GradientView {
        const storage = self.storage orelse return error.Closed;
        const index = storage.gradient_index.get(id) orelse return error.ForeignGradient;
        return storage.gradients.items[index].view();
    }
    /// Copies source revision, device transform and declared color policy.
    pub fn metadata(self: *const Packet) Error!Metadata {
        return (self.storage orelse return error.Closed).metadata;
    }
    /// Releases this lease; idempotent on this handle.
    pub fn deinit(self: *Packet) void {
        const storage = self.storage orelse return;
        self.storage = null;
        if (storage.references.fetchSub(1, .acq_rel) == 1) storage.destroy();
    }
};
const Frame = struct { kind: enum { save, layer }, transform: Affine };
/// Single-owner builder. Every failed recording operation poisons finish; discard
/// and rebuild from the current model, leaving the previous Packet untouched.
pub const Recorder = struct {
    storage: ?*Storage,
    options: Options,
    stack: std.ArrayList(Frame) = .empty,
    transform: Affine,
    failed: bool = false,
    /// Starts an independent recording; no native renderer/provider is opened.
    pub fn init(allocator: std.mem.Allocator, options: Options) Error!Recorder {
        try finite_transform(options.device_transform);
        const storage = try allocator.create(Storage);
        storage.* = .{ .allocator = allocator, .metadata = .{ .scene = options.scene, .color_policy = options.color_policy, .device_transform = options.device_transform } };
        return .{ .storage = storage, .options = options, .transform = options.device_transform };
    }
    /// Discards unsubmitted recording and all its owned geometry/resource leases.
    pub fn deinit(self: *Recorder) void {
        if (self.storage) |storage| {
            self.stack.deinit(storage.allocator);
            storage.destroy();
            self.storage = null;
        }
    }
    fn ready(self: *Recorder) Error!*Storage {
        const storage = self.storage orelse return error.Closed;
        if (self.failed) return error.RecorderFailed;
        return storage;
    }
    fn append(self: *Recorder, command: Command) Error!void {
        const storage = try self.ready();
        if (storage.commands.items.len == self.options.max_commands) return error.CommandLimit;
        try storage.commands.append(storage.allocator, command);
    }
    fn push(self: *Recorder, kind: @FieldType(Frame, "kind"), opacity: f64) Error!void {
        const storage = try self.ready();
        if (self.stack.items.len == self.options.max_depth) return error.DepthLimit;
        try self.stack.ensureUnusedCapacity(storage.allocator, 1);
        try self.append(if (kind == .save) .save else .{ .begin_layer = opacity });
        self.stack.appendAssumeCapacity(.{ .kind = kind, .transform = self.transform });
    }
    fn pop(self: *Recorder, kind: @FieldType(Frame, "kind")) Error!void {
        _ = try self.ready();
        if (self.stack.items.len == 0 or self.stack.items[self.stack.items.len - 1].kind != kind) return error.Unbalanced;
        try self.append(if (kind == .save) .restore else .end_layer);
        const frame = self.stack.pop().?;
        self.transform = frame.transform;
    }
    /// Saves graphics state; restore must match this scope before any enclosing layer.
    pub fn save(self: *Recorder) Error!void {
        errdefer self.failed = true;
        try self.push(.save, 1);
    }
    /// Restores the most recent save scope; crossing a layer boundary is an error.
    pub fn restore(self: *Recorder) Error!void {
        errdefer self.failed = true;
        try self.pop(.save);
    }
    /// Layer boundaries implicitly save/restore all graphics state, including clips.
    pub fn begin_layer(self: *Recorder, opacity: f64) Error!void {
        errdefer self.failed = true;
        if (!std.math.isFinite(opacity) or opacity < 0 or opacity > 1) return error.InvalidOpacity;
        try self.push(.layer, opacity);
    }
    /// Composites the layer with its declared opacity and restores entry state.
    pub fn end_layer(self: *Recorder) Error!void {
        errdefer self.failed = true;
        try self.pop(.layer);
    }
    /// Concatenates local coordinates after the current transform; finite degeneracy is allowed.
    pub fn concat(self: *Recorder, local: Affine) Error!void {
        errdefer self.failed = true;
        try finite_transform(local);
        const combined = self.transform.concat(local);
        try finite_transform(combined);
        try self.append(.{ .transform = local });
        self.transform = combined;
    }
    fn point(self: *const Recorder, value: Point) Error!void {
        if (!finite_point(value) or !finite_point(self.transform.point(value))) return error.InvalidGeometry;
    }
    fn rect(self: *const Recorder, value: Rect) Error!void {
        if (!std.math.isFinite(value.width) or !std.math.isFinite(value.height) or value.width < 0 or value.height < 0) return error.InvalidGeometry;
        try self.point(.{ .x = value.x, .y = value.y });
        try self.point(.{ .x = value.x + value.width, .y = value.y });
        try self.point(.{ .x = value.x, .y = value.y + value.height });
        try self.point(.{ .x = value.x + value.width, .y = value.y + value.height });
    }
    fn color(self: *const Recorder, value: Color) Error!void {
        inline for (.{ value.r, value.g, value.b, value.a }) |component| if (!std.math.isFinite(component)) return error.InvalidColor;
        if (value.a < 0 or value.a > 1) return error.InvalidColor;
        if (self.options.color_policy != .extended_linear and (value.r < 0 or value.r > 1 or value.g < 0 or value.g > 1 or value.b < 0 or value.b > 1)) return error.InvalidColor;
    }
    fn rounded(self: *const Recorder, value: RoundedRect) Error!RoundedRect {
        try self.rect(value.rect);
        if (!std.math.isFinite(value.radius) or value.radius < 0) return error.InvalidGeometry;
        return .{ .rect = value.rect, .radius = @min(value.radius, @min(value.rect.width, value.rect.height) / 2) };
    }
    /// Intersects the current clip with a transformed local rectangle.
    pub fn clip_rect(self: *Recorder, value: Rect) Error!void {
        errdefer self.failed = true;
        try self.rect(value);
        try self.append(.{ .clip_rect = value });
    }
    /// Clips to rounded geometry; radius clamps to half the smaller side.
    pub fn clip_rounded_rect(self: *Recorder, value: RoundedRect) Error!void {
        errdefer self.failed = true;
        try self.append(.{ .clip_rounded_rect = try self.rounded(value) });
    }
    /// Fills local geometry with straight-alpha color in packet policy encoding.
    pub fn fill_rect(self: *Recorder, value: Rect, tint: Color) Error!void {
        errdefer self.failed = true;
        try self.rect(value);
        try self.color(tint);
        try self.append(.{ .fill_rect = .{ .rect = value, .color = tint } });
    }
    /// Fills rounded geometry, clamping radius to half the smaller side.
    pub fn fill_rounded_rect(self: *Recorder, value: RoundedRect, tint: Color) Error!void {
        errdefer self.failed = true;
        try self.color(tint);
        try self.append(.{ .fill_rounded_rect = .{ .shape = try self.rounded(value), .color = tint } });
    }
    fn path(self: *Recorder, segments: []const Segment) Error![]const Segment {
        const storage = try self.ready();
        if (segments.len > self.options.max_segments - storage.segments) return error.GeometryLimit;
        var open = false;
        for (segments) |segment| switch (segment) {
            .move => |value| {
                try self.point(value);
                open = true;
            },
            .line => |value| {
                if (!open) return error.InvalidPath;
                try self.point(value);
            },
            .quadratic => |value| {
                if (!open) return error.InvalidPath;
                try self.point(value.control);
                try self.point(value.to);
            },
            .cubic => |value| {
                if (!open) return error.InvalidPath;
                try self.point(value.first);
                try self.point(value.second);
                try self.point(value.to);
            },
            .close => {
                if (!open) return error.InvalidPath;
                open = false;
            },
        };
        return storage.allocator.dupe(Segment, segments);
    }
    /// Copies path geometry and intersects the clip using the explicit fill rule.
    pub fn clip_path(self: *Recorder, segments: []const Segment, rule: FillRule) Error!void {
        errdefer self.failed = true;
        const storage = try self.ready();
        const owned = try self.path(segments);
        errdefer storage.allocator.free(owned);
        try self.append(.{ .clip_path = .{ .segments = owned, .rule = rule } });
        storage.segments += segments.len;
    }
    /// Copies path geometry for a solid fill; each contour must start with move.
    pub fn fill_path(self: *Recorder, segments: []const Segment, rule: FillRule, tint: Color) Error!void {
        errdefer self.failed = true;
        try self.color(tint);
        const storage = try self.ready();
        const owned = try self.path(segments);
        errdefer storage.allocator.free(owned);
        try self.append(.{ .fill_path = .{ .segments = owned, .rule = rule, .color = tint } });
        storage.segments += segments.len;
    }
    /// Copies path geometry and finite stroke cap/join/miter properties; no implicit dashes.
    pub fn stroke_path(self: *Recorder, segments: []const Segment, style: Stroke, tint: Color) Error!void {
        errdefer self.failed = true;
        try self.color(tint);
        try self.stroke_style(style);
        const storage = try self.ready();
        const owned = try self.path(segments);
        errdefer storage.allocator.free(owned);
        try self.append(.{ .stroke_path = .{ .segments = owned, .style = style, .color = tint } });
        storage.segments += segments.len;
    }
    fn stroke_style(self: *const Recorder, style: Stroke) Error!void {
        if (!std.math.isFinite(style.width) or style.width < 0 or !std.math.isFinite(style.miter_limit) or style.miter_limit < 1) return error.InvalidStroke;
        const scale = @max(@abs(self.transform.xx) + @abs(self.transform.xy), @abs(self.transform.yx) + @abs(self.transform.yy));
        if (!std.math.isFinite(style.width * scale * style.miter_limit)) return error.InvalidStroke;
    }
    fn retain_gradient(self: *Recorder, resource: *const Gradient) Error!identity.Domain {
        const storage = try self.ready();
        const view = try resource.view();
        if (view.color_policy != self.options.color_policy) return error.ColorPolicyMismatch;
        switch (view.geometry) {
            .linear => |value| {
                try self.point(value.start);
                try self.point(value.end);
            },
            .radial => |value| for ([_]gradient.Circle{ value.start, value.end }) |circle| {
                try self.point(circle.center);
                try self.point(.{ .x = circle.center.x - circle.radius, .y = circle.center.y });
                try self.point(.{ .x = circle.center.x + circle.radius, .y = circle.center.y });
                try self.point(.{ .x = circle.center.x, .y = circle.center.y - circle.radius });
                try self.point(.{ .x = circle.center.x, .y = circle.center.y + circle.radius });
            },
        }
        if (!storage.gradient_index.contains(view.id)) {
            const bytes = std.math.mul(usize, view.stops.len, @sizeOf(gradient.Stop)) catch return error.GradientLimit;
            if (bytes > self.options.max_gradient_bytes - storage.gradient_bytes) return error.GradientLimit;
            var retained = try resource.clone();
            var live = true;
            errdefer if (live) retained.deinit();
            try storage.gradients.ensureUnusedCapacity(storage.allocator, 1);
            try storage.gradient_index.ensureUnusedCapacity(storage.allocator, 1);
            storage.gradient_index.putAssumeCapacity(view.id, storage.gradients.items.len);
            storage.gradients.appendAssumeCapacity(retained);
            live = false;
            storage.gradient_bytes += bytes;
        }
        return view.id;
    }
    /// Reuses immutable gradient stops in the current local coordinate system.
    pub fn fill_rect_gradient(self: *Recorder, value: Rect, resource: *const Gradient) Error!void {
        errdefer self.failed = true;
        try self.rect(value);
        const id = try self.retain_gradient(resource);
        try self.append(.{ .fill_rect_gradient = .{ .rect = value, .gradient_id = id } });
    }
    /// Rounded fill using a retained, policy-matched gradient.
    pub fn fill_rounded_rect_gradient(self: *Recorder, value: RoundedRect, resource: *const Gradient) Error!void {
        errdefer self.failed = true;
        const shape = try self.rounded(value);
        const id = try self.retain_gradient(resource);
        try self.append(.{ .fill_rounded_rect_gradient = .{ .shape = shape, .gradient_id = id } });
    }
    /// Copies path geometry and retains gradient backing once per identity.
    pub fn fill_path_gradient(self: *Recorder, segments: []const Segment, rule: FillRule, resource: *const Gradient) Error!void {
        errdefer self.failed = true;
        const storage = try self.ready();
        const owned = try self.path(segments);
        errdefer storage.allocator.free(owned);
        const id = try self.retain_gradient(resource);
        try self.append(.{ .fill_path_gradient = .{ .segments = owned, .rule = rule, .gradient_id = id } });
        storage.segments += segments.len;
    }
    /// Solid-geometry stroke with a retained gradient source.
    pub fn stroke_path_gradient(self: *Recorder, segments: []const Segment, style: Stroke, resource: *const Gradient) Error!void {
        errdefer self.failed = true;
        try self.stroke_style(style);
        const storage = try self.ready();
        const owned = try self.path(segments);
        errdefer storage.allocator.free(owned);
        const id = try self.retain_gradient(resource);
        try self.append(.{ .stroke_path_gradient = .{ .segments = owned, .style = style, .gradient_id = id } });
        storage.segments += segments.len;
    }
    /// Images are retained once per identity, including repeated sampling. The
    /// source rectangle is in image pixels; destination is in current logical space.
    pub fn draw_image(self: *Recorder, image: *const Image, source: Rect, destination: Rect, sampling: Sampling) Error!void {
        errdefer self.failed = true;
        const storage = try self.ready();
        const view = try image.view();
        if (!std.math.isFinite(source.x) or !std.math.isFinite(source.y) or !std.math.isFinite(source.width) or !std.math.isFinite(source.height) or source.x < 0 or source.y < 0 or source.width < 0 or source.height < 0 or source.x + source.width > @as(f64, @floatFromInt(view.width)) or source.y + source.height > @as(f64, @floatFromInt(view.height))) return error.InvalidGeometry;
        try self.rect(destination);
        if (!storage.image_index.contains(view.id)) {
            if (view.rgba.len > self.options.max_image_bytes - storage.image_bytes) return error.ImageLimit;
            var retained = try image.clone();
            var retained_live = true;
            errdefer if (retained_live) retained.deinit();
            try storage.images.ensureUnusedCapacity(storage.allocator, 1);
            try storage.image_index.ensureUnusedCapacity(storage.allocator, 1);
            storage.image_index.putAssumeCapacity(view.id, {});
            storage.images.appendAssumeCapacity(retained);
            retained_live = false;
            storage.image_bytes += view.rgba.len;
        }
        try self.append(.{ .image = .{ .image = view, .source = source, .destination = destination, .sampling = sampling } });
    }
    /// Allocation-free move. An unbalanced/failed recorder cannot publish a packet.
    pub fn finish(self: *Recorder) Error!Packet {
        errdefer self.failed = true;
        const storage = try self.ready();
        if (self.stack.items.len != 0) return error.Unbalanced;
        self.stack.deinit(storage.allocator);
        self.storage = null;
        return .{ .storage = storage };
    }
};
fn finite_point(value: Point) bool {
    return std.math.isFinite(value.x) and std.math.isFinite(value.y);
}
fn finite_transform(value: Affine) Error!void {
    inline for (.{ value.xx, value.yx, value.xy, value.yy, value.x0, value.y0 }) |component| if (!std.math.isFinite(component)) return error.InvalidGeometry;
}
