//! Basic value types shared by every part of zlay: geometry, colors and
//! element ids. Nothing in here touches the layout context, so these types are
//! safe to construct anywhere (including at comptime).

const hash = @import("hash.zig");

/// Largest finite `f32`. Used as "no upper bound" for sizing constraints.
/// (We cannot use `std.math.floatMax` because zlay does not depend on std.)
pub const max_float: f32 = 3.40282346638528859812e+38;

/// Tolerance used when comparing floats produced by the layout algorithm.
pub const epsilon: f32 = 0.01;

/// Approximate float equality with a fixed tolerance of `epsilon`.
pub fn floatEqual(a: f32, b: f32) bool {
    const d = a - b;
    return d < epsilon and d > -epsilon;
}

/// A 2D vector / point. Positions are relative to the root of the layout.
pub const Vec2 = struct {
    x: f32 = 0,
    y: f32 = 0,

    pub const zero: Vec2 = .{};

    pub fn init(x: f32, y: f32) Vec2 {
        return .{ .x = x, .y = y };
    }
};

/// A width / height pair.
pub const Dimensions = struct {
    width: f32 = 0,
    height: f32 = 0,

    pub const zero: Dimensions = .{};

    pub fn init(width: f32, height: f32) Dimensions {
        return .{ .width = width, .height = height };
    }
};

/// An axis-aligned rectangle. `x`/`y` is the top-left corner.
pub const BoundingBox = struct {
    x: f32 = 0,
    y: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,

    pub fn init(x: f32, y: f32, width: f32, height: f32) BoundingBox {
        return .{ .x = x, .y = y, .width = width, .height = height };
    }

    /// True if `point` lies inside the box (edges inclusive, like Clay).
    pub fn contains(self: BoundingBox, point: Vec2) bool {
        return point.x >= self.x and point.x <= self.x + self.width and
            point.y >= self.y and point.y <= self.y + self.height;
    }
};

/// An RGBA color. By convention each channel is in the 0-255 range, but the
/// interpretation is entirely up to your renderer; zlay only passes it along
/// (and interpolates it for transitions).
pub const Color = struct {
    r: f32 = 0,
    g: f32 = 0,
    b: f32 = 0,
    a: f32 = 0,

    pub const transparent: Color = .{};
    pub const white: Color = .rgb(255, 255, 255);
    pub const black: Color = .rgb(0, 0, 0);

    pub fn rgba(r: f32, g: f32, b: f32, a: f32) Color {
        return .{ .r = r, .g = g, .b = b, .a = a };
    }

    /// Opaque color (alpha = 255).
    pub fn rgb(r: f32, g: f32, b: f32) Color {
        return .{ .r = r, .g = g, .b = b, .a = 255 };
    }

    /// Returns the same color with a different alpha.
    pub fn withAlpha(self: Color, a: f32) Color {
        return .{ .r = self.r, .g = self.g, .b = self.b, .a = a };
    }

    /// Exact (bitwise-style) equality of all four channels.
    pub fn eql(self: Color, other: Color) bool {
        return self.r == other.r and self.g == other.g and self.b == other.b and self.a == other.a;
    }

    /// Linear interpolation between two colors, `t` in 0..1.
    pub fn lerp(from: Color, to: Color, t: f32) Color {
        return .{
            .r = lerpFloat(from.r, to.r, t),
            .g = lerpFloat(from.g, to.g, t),
            .b = lerpFloat(from.b, to.b, t),
            .a = lerpFloat(from.a, to.a, t),
        };
    }
};

/// Corner rounding for rectangles, borders, images and custom elements.
/// A radius `r` means a circle of radius `r` is inset into that corner.
pub const CornerRadius = struct {
    top_left: f32 = 0,
    top_right: f32 = 0,
    bottom_left: f32 = 0,
    bottom_right: f32 = 0,

    pub const none: CornerRadius = .{};

    /// Same radius on every corner (Clay's `CLAY_CORNER_RADIUS`).
    pub fn all(radius: f32) CornerRadius {
        return .{ .top_left = radius, .top_right = radius, .bottom_left = radius, .bottom_right = radius };
    }

    pub fn isZero(self: CornerRadius) bool {
        return self.top_left == 0 and self.top_right == 0 and self.bottom_left == 0 and self.bottom_right == 0;
    }
};

/// Identifies an element across frames. Ids are hashes of a string label (and
/// optionally an index and/or a parent id), so the same label always produces
/// the same id. An `id` of 0 is reserved to mean "no id / auto generated".
pub const ElementId = struct {
    /// The resulting hash; this is what zlay uses internally.
    id: u32 = 0,
    /// The numeric offset (index) mixed into the hash, if any.
    offset: u32 = 0,
    /// The hash of the label alone (before the offset was mixed in).
    base_id: u32 = 0,
    /// The label that was hashed. Kept for the debug view; not copied, so it
    /// must outlive the frame if you want it displayed correctly.
    string_id: []const u8 = "",

    /// Ask zlay to derive an id from the element's position in the tree
    /// (Clay's `CLAY_AUTO_ID`).
    pub const auto: ElementId = .{};

    /// Global id from a label (Clay's `CLAY_ID` / `CLAY_SID`).
    pub fn named(label: []const u8) ElementId {
        return hash.hashString(label, 0);
    }

    /// Global id from a label plus an index, handy inside loops
    /// (Clay's `CLAY_IDI` / `CLAY_SIDI`).
    pub fn indexed(label: []const u8, index: u32) ElementId {
        return hash.hashStringWithOffset(label, index, 0);
    }

    /// Id derived from a label and an explicit seed (for example a parent id).
    /// `Context.localId` uses this with the currently open element's id.
    pub fn seeded(label: []const u8, seed: u32) ElementId {
        return hash.hashString(label, seed);
    }

    /// Like `seeded`, but with an index as well.
    pub fn seededIndexed(label: []const u8, index: u32, seed: u32) ElementId {
        return hash.hashStringWithOffset(label, index, seed);
    }

    pub fn isAuto(self: ElementId) bool {
        return self.id == 0;
    }

    pub fn eql(self: ElementId, other: ElementId) bool {
        return self.id == other.id;
    }
};

/// Linear interpolation helper shared by colors and transitions.
pub fn lerpFloat(from: f32, to: f32, t: f32) f32 {
    return from + (to - from) * t;
}

/// Interaction state of the pointer for the current frame.
pub const PointerState = enum(u8) {
    /// The button / touch went down this frame.
    pressed_this_frame,
    /// Held down since an earlier frame.
    pressed,
    /// Released this frame.
    released_this_frame,
    /// Not pressed.
    released,

    pub fn isDown(self: PointerState) bool {
        return self == .pressed or self == .pressed_this_frame;
    }
};

pub const PointerData = struct {
    /// Relative to the root of the layout.
    position: Vec2 = .{},
    state: PointerState = .released,
};
