//! Immutable reusable gradient resources. No native backend or shader handles.
const std = @import("std");
const identity = @import("../core/identity.zig");
const t = @import("types.zig");
pub const Extend = enum { pad, repeat, reflect, none };
pub const Stop = struct { offset: f64, color: t.Color };
pub const Circle = struct { center: t.Point, radius: f64 };
pub const Geometry = union(enum) { linear: struct { start: t.Point, end: t.Point }, radial: struct { start: Circle, end: Circle } };
pub const Options = struct { color_policy: t.ColorPolicy = .srgb_compatible, extend: Extend = .pad, max_stops: usize = 4096 };
pub const Error = std.mem.Allocator.Error || error{ DomainExhausted, ReferenceLimit, Closed, InvalidGradient, GradientLimit };
pub const Sample = struct { r: f64, g: f64, b: f64, a: f64 };
pub const View = struct {
    id: identity.Domain,
    geometry: Geometry,
    stops: []const Stop,
    color_policy: t.ColorPolicy,
    extend: Extend,
    uniform_alpha: bool,
    /// Premultiplied component sample in resource policy. Duplicate stops choose
    /// the last stop at the boundary; spread is applied to the [0,1] parameter.
    pub fn sample(self: View, parameter: f64) Error!Sample {
        if (!std.math.isFinite(parameter)) return error.InvalidGradient;
        var x = parameter;
        switch (self.extend) {
            .none => if (x < 0 or x > 1) return .{ .r = 0, .g = 0, .b = 0, .a = 0 },
            .pad => x = std.math.clamp(x, 0, 1),
            .repeat => x -= @floor(x),
            .reflect => {
                x -= 2 * @floor(x / 2);
                if (x > 1) x = 2 - x;
            },
        }
        var lo: usize = 0;
        var hi = self.stops.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            if (self.stops[mid].offset <= x) lo = mid + 1 else hi = mid;
        }
        if (lo == 0) return premultiply(self.stops[0].color);
        if (lo == self.stops.len) return premultiply(self.stops[lo - 1].color);
        const left = self.stops[lo - 1];
        const right = self.stops[lo];
        const fraction = (x - left.offset) / (right.offset - left.offset);
        const l = premultiply(left.color);
        const r = premultiply(right.color);
        return .{ .r = l.r * (1 - fraction) + r.r * fraction, .g = l.g * (1 - fraction) + r.g * fraction, .b = l.b * (1 - fraction) + r.b * fraction, .a = l.a * (1 - fraction) + r.a * fraction };
    }
    /// Constant-alpha stops are equivalent under straight/premultiplied interpolation.
    pub fn constant_alpha(self: View) bool {
        return self.uniform_alpha;
    }
};
const Storage = struct { allocator: std.mem.Allocator, references: std.atomic.Value(usize) = .init(1), view: View };
/// Clone/release on distinct handles use atomic ownership; allocator/context must
/// outlive every lease and support the thread performing final release.
pub const Gradient = struct {
    storage: ?*Storage,
    /// Copies ordered stops; equal offsets retain insertion order for hard edges.
    /// Interpolation is in premultiplied components in the declared color policy.
    pub fn init(allocator: std.mem.Allocator, geometry: Geometry, stops: []const Stop, options: Options) Error!Gradient {
        if (stops.len > options.max_stops) return error.GradientLimit;
        if (stops.len < 2) return error.InvalidGradient;
        switch (geometry) {
            .linear => |value| {
                try point(value.start);
                try point(value.end);
                if (value.start.x == value.end.x and value.start.y == value.end.y) return error.InvalidGradient;
            },
            .radial => |value| {
                try circle(value.start);
                try circle(value.end);
                if (value.start.radius == value.end.radius and value.start.center.x == value.end.center.x and value.start.center.y == value.end.center.y) return error.InvalidGradient;
                if (value.start.radius == 0 and value.end.radius == 0) return error.InvalidGradient;
            },
        }
        var previous: f64 = 0;
        var uniform_alpha = true;
        for (stops) |stop| {
            if (!std.math.isFinite(stop.offset) or stop.offset < previous or stop.offset > 1) return error.InvalidGradient;
            previous = stop.offset;
            if (stop.color.a != stops[0].color.a) uniform_alpha = false;
            const color = stop.color;
            inline for (.{ color.r, color.g, color.b, color.a }) |v| if (!std.math.isFinite(v)) return error.InvalidGradient;
            if (color.a < 0 or color.a > 1) return error.InvalidGradient;
            if (options.color_policy != .extended_linear and (color.r < 0 or color.r > 1 or color.g < 0 or color.g > 1 or color.b < 0 or color.b > 1)) return error.InvalidGradient;
        }
        const storage = try allocator.create(Storage);
        errdefer allocator.destroy(storage);
        const owned = try allocator.dupe(Stop, stops);
        errdefer allocator.free(owned);
        storage.* = .{ .allocator = allocator, .view = .{ .id = try identity.issue_domain(), .geometry = geometry, .stops = owned, .color_policy = options.color_policy, .extend = options.extend, .uniform_alpha = uniform_alpha } };
        return .{ .storage = storage };
    }
    /// Retains immutable geometry/stops; reference saturation cannot wrap.
    pub fn clone(self: *const Gradient) Error!Gradient {
        const storage = self.storage orelse return error.Closed;
        var count = storage.references.load(.monotonic);
        while (true) {
            if (count == std.math.maxInt(usize)) return error.ReferenceLimit;
            if (storage.references.cmpxchgWeak(count, count + 1, .monotonic, .monotonic)) |actual| count = actual else break;
        }
        return .{ .storage = storage };
    }
    /// Borrows from an owning gradient or packet lease.
    pub fn view(self: *const Gradient) Error!View {
        return (self.storage orelse return error.Closed).view;
    }
    /// Releases this handle; idempotent here, not on independent shallow copies.
    pub fn deinit(self: *Gradient) void {
        const storage = self.storage orelse return;
        self.storage = null;
        if (storage.references.fetchSub(1, .acq_rel) == 1) {
            const allocator = storage.allocator;
            allocator.free(storage.view.stops);
            allocator.destroy(storage);
        }
    }
};
fn point(value: t.Point) Error!void {
    if (!std.math.isFinite(value.x) or !std.math.isFinite(value.y)) return error.InvalidGradient;
}
fn circle(value: Circle) Error!void {
    try point(value.center);
    if (!std.math.isFinite(value.radius) or value.radius < 0) return error.InvalidGradient;
}

fn premultiply(color: t.Color) Sample {
    return .{ .r = color.r * color.a, .g = color.g * color.a, .b = color.b * color.a, .a = color.a };
}
