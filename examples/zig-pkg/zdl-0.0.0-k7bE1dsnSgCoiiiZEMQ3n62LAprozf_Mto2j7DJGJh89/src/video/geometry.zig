//! Allocation-free coordinate geometry for pixel and floating-point spaces.
//! Integer rectangles contain `width * height` pixels and exclude their right
//! and bottom boundaries. Floating rectangles include boundary coordinates;
//! zero width or height therefore represents a line or point, not an empty set.
//! These distinctions preserve SDL's geometry conventions without C layouts.
// Ported from video/SDL_rect_impl.h; native ownership and errors replace the C ABI.
const std = @import("std");

/// Representation failures are reported rather than wrapping coordinates.
pub const GeometryError = error{ Overflow, NonFinite, PrecisionLoss };

fn check_scalar(comptime Scalar: type) void {
    if (Scalar != i32 and Scalar != f32) @compileError("coordinate type must be i32 or f32");
}

/// A position in integer pixel coordinates or floating-point coordinates.
pub fn Point(comptime Scalar: type) type {
    check_scalar(Scalar);
    return struct {
        x: Scalar,
        y: Scalar,
    };
}

/// A directed line segment. Clipping preserves the ordering of its endpoints.
pub fn Line(comptime Scalar: type) type {
    return struct {
        start: Point(Scalar),
        end: Point(Scalar),
    };
}

/// A rectangle described by an origin and extents. Negative extents are empty;
/// integer zero extents are empty too. Methods check floating-point finiteness
/// and widen arithmetic so valid inputs cannot overflow intermediate sums.
pub fn Rect(comptime Scalar: type) type {
    check_scalar(Scalar);
    const integer = Scalar == i32;
    const Wide = if (integer) i64 else f64;
    const Position = Point(Scalar);
    const Segment = Line(Scalar);
    const unit: Wide = if (integer) 1 else 0;

    return struct {
        const Self = @This();
        x: Scalar,
        y: Scalar,
        width: Scalar,
        height: Scalar,

        /// Distinguishes invalid floating coordinates from an ordinary empty
        /// rectangle. Negative extents are allowed so intersections can be empty.
        pub fn validate(self: Self) GeometryError!void {
            if (!integer and (!std.math.isFinite(self.x) or !std.math.isFinite(self.y) or
                !std.math.isFinite(self.width) or !std.math.isFinite(self.height))) return error.NonFinite;
        }

        /// True when no coordinates belong to this rectangle. Floating NaN or
        /// infinity is invalid, not an empty rectangle; use validate to check it.
        pub fn is_empty(self: Self) bool {
            if (integer) return self.width <= 0 or self.height <= 0;
            return self.width < 0 or self.height < 0;
        }

        /// Membership test. Non-finite input has no meaningful position here
        /// and returns false; arithmetic uses widened right/bottom boundaries.
        pub fn contains(self: Self, point: Position) bool {
            self.validate() catch return false;
            if (!integer and (!std.math.isFinite(point.x) or !std.math.isFinite(point.y))) return false;
            if (self.is_empty()) return false;
            const right = widen(self.x) + widen(self.width) - unit;
            const bottom = widen(self.y) + widen(self.height) - unit;
            return point.x >= self.x and point.y >= self.y and widen(point.x) <= right and widen(point.y) <= bottom;
        }

        /// Shared coordinates, or null when the rectangles are disjoint/empty.
        /// Adjacent integer rectangles do not intersect; touching floating edges
        /// do. Returned extents use the same coordinate convention as the inputs.
        pub fn intersection(self: Self, other: Self) GeometryError!?Self {
            try self.validate();
            try other.validate();
            if (self.is_empty() or other.is_empty()) return null;
            const left = @max(self.x, other.x);
            const top = @max(self.y, other.y);
            const right = @min(widen(self.x) + widen(self.width), widen(other.x) + widen(other.width));
            const bottom = @min(widen(self.y) + widen(self.height), widen(other.y) + widen(other.height));
            if (right - unit < widen(left) or bottom - unit < widen(top)) return null;
            return .{ .x = left, .y = top, .width = try narrow(right - widen(left)), .height = try narrow(bottom - widen(top)) };
        }

        /// Bounding rectangle of both inputs. Empty inputs contribute nothing;
        /// two empty inputs yield null instead of inventing an origin. A union
        /// wider than the scalar can represent returns Overflow.
        pub fn union_with(self: Self, other: Self) GeometryError!?Self {
            try self.validate();
            try other.validate();
            if (self.is_empty()) return if (other.is_empty()) null else other;
            if (other.is_empty()) return self;
            const left = @min(self.x, other.x);
            const top = @min(self.y, other.y);
            const right = @max(widen(self.x) + widen(self.width), widen(other.x) + widen(other.width));
            const bottom = @max(widen(self.y) + widen(self.height), widen(other.y) + widen(other.height));
            return .{ .x = left, .y = top, .width = try narrow(right - widen(left)), .height = try narrow(bottom - widen(top)) };
        }

        /// Stateful point accumulation. This also lets other modules provide
        /// positions one at a time without allocating an intermediate slice.
        pub const Bounds = struct {
            minimum: ?Position = null,
            maximum: Position = undefined,

            /// Includes a position; invalid floating input leaves prior bounds
            /// untouched. Integer points need no range conversion or allocation.
            pub fn include(self: *Bounds, point: Position) GeometryError!void {
                if (!integer and (!std.math.isFinite(point.x) or !std.math.isFinite(point.y))) return error.NonFinite;
                if (self.minimum) |minimum| {
                    self.minimum = .{ .x = @min(minimum.x, point.x), .y = @min(minimum.y, point.y) };
                    self.maximum = .{ .x = @max(self.maximum.x, point.x), .y = @max(self.maximum.y, point.y) };
                } else {
                    self.minimum = point;
                    self.maximum = point;
                }
            }

            /// Returns null before the first point. One integer point encloses
            /// one pixel; one floating point has zero width and height.
            pub fn rectangle(self: Bounds) GeometryError!?Self {
                const minimum = self.minimum orelse return null;
                return .{
                    .x = minimum.x,
                    .y = minimum.y,
                    .width = try narrow(widen(self.maximum.x) - widen(minimum.x) + unit),
                    .height = try narrow(widen(self.maximum.y) - widen(minimum.y) + unit),
                };
            }
        };

        /// Encloses the positions admitted by an optional clipping rectangle.
        /// An empty slice or a clip that admits no points returns null.
        pub fn enclosing(points: []const Position, clip: ?Self) GeometryError!?Self {
            if (clip) |rectangle| try rectangle.validate();
            var bounds: Bounds = .{};
            for (points) |point| {
                if (clip) |rectangle| if (!rectangle.contains(point)) continue;
                try bounds.include(point);
            }
            return bounds.rectangle();
        }

        /// Clips a segment using Cohen-Sutherland outcodes. Widening before
        /// subtraction fixes overflow in translated integer endpoint arithmetic.
        /// Integer intersections truncate slopes towards zero, as SDL does;
        /// floating intermediates use f64 before returning f32 coordinates.
        pub fn clip_line(self: Self, line: Segment) GeometryError!?Segment {
            try self.validate();
            if (self.is_empty()) return null;
            if (!integer and (!std.math.isFinite(line.start.x) or !std.math.isFinite(line.start.y) or
                !std.math.isFinite(line.end.x) or !std.math.isFinite(line.end.y))) return error.NonFinite;
            const left = widen(self.x);
            const top = widen(self.y);
            const right = left + widen(self.width) - unit;
            const bottom = top + widen(self.height) - unit;
            var x1 = widen(line.start.x);
            var y1 = widen(line.start.y);
            var x2 = widen(line.end.x);
            var y2 = widen(line.end.y);
            while (true) {
                const first = outcode(left, top, right, bottom, x1, y1);
                const second = outcode(left, top, right, bottom, x2, y2);
                if (first | second == 0) return .{
                    .start = .{ .x = try narrow(x1), .y = try narrow(y1) },
                    .end = .{ .x = try narrow(x2), .y = try narrow(y2) },
                };
                if (first & second != 0) return null;
                const code = if (first != 0) first else second;
                var x: Wide = undefined;
                var y: Wide = undefined;
                // A zero denominator here would mean both endpoints share an
                // outside region, which the preceding rejection already handles.
                if (code & 1 != 0) {
                    y = top;
                    x = x1 + interpolate(x2 - x1, y - y1, y2 - y1);
                } else if (code & 2 != 0) {
                    y = bottom;
                    x = x1 + interpolate(x2 - x1, y - y1, y2 - y1);
                } else if (code & 4 != 0) {
                    x = left;
                    y = y1 + interpolate(y2 - y1, x - x1, x2 - x1);
                } else {
                    x = right;
                    y = y1 + interpolate(y2 - y1, x - x1, x2 - x1);
                }
                // Rounding must not turn a failed refinement into an endless
                // loop. Report inability to refine rather than claiming success.
                if (first != 0) {
                    if (x == x1 and y == y1) return error.PrecisionLoss;
                    x1 = x;
                    y1 = y;
                } else {
                    if (x == x2 and y == y2) return error.PrecisionLoss;
                    x2 = x;
                    y2 = y;
                }
            }
        }

        fn widen(value: Scalar) Wide {
            return value;
        }
        fn narrow(value: Wide) GeometryError!Scalar {
            if (integer) return std.math.cast(Scalar, value) orelse error.Overflow;
            const result: Scalar = @floatCast(value);
            if (!std.math.isFinite(result)) return error.Overflow;
            return result;
        }
        fn interpolate(delta: Wide, distance: Wide, denominator: Wide) Wide {
            if (integer) return @intCast(@divTrunc(@as(i128, delta) * distance, denominator));
            return delta * distance / denominator;
        }
        fn outcode(left: Wide, top: Wide, right: Wide, bottom: Wide, x: Wide, y: Wide) u4 {
            var code: u4 = 0;
            if (y < top) code |= 1 else if (y > bottom) code |= 2;
            if (x < left) code |= 4 else if (x > right) code |= 8;
            return code;
        }
    };
}

/// A full-width integer span covering visible rows of the supplied rectangles.
/// Dimensions are nonnegative i32-sized values. Empty or completely clipped
/// input yields null; negative rectangle extents contribute nothing.
pub fn enclosing_vertical_span(width: u31, height: u31, rectangles: []const Rect(i32)) ?Rect(i32) {
    if (width == 0 or height == 0) return null;
    var top: i64 = height;
    var bottom: i64 = 0;
    for (rectangles) |rectangle| {
        if (rectangle.is_empty()) continue;
        const start = @max(@as(i64, 0), rectangle.y);
        const end = @min(@as(i64, height), @as(i64, rectangle.y) + rectangle.height);
        if (end <= start) continue;
        top = @min(top, start);
        bottom = @max(bottom, end);
    }
    if (bottom <= top) return null;
    return .{ .x = 0, .y = @intCast(top), .width = width, .height = @intCast(bottom - top) };
}
