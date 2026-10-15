//! Custom-titlebar hit testing (SDL_HitTestResult with SDL_SetWindowHitTest).
//!
//! An application that hides the native title bar describes its own areas
//! instead of a callback: a short list of draggable and non-draggable
//! rectangles in window coordinates, plus the width of a resize border along
//! the window edges. The platform classifies each pointer press against that
//! description (`classify`) and starts the compositor's move or resize, or
//! shows the window menu. The description is a value, so the application can
//! rebuild it every frame without allocating and without a `void *` userdata.
//!
//! Precedence, as in SDL's X11 and Wayland backends:
//! 1. Resize edges and corners, when the window is resizable and not maximized
//!    or fullscreen. A corner wins over the edges it joins.
//! 2. Regions, last added first: the first region containing the point decides.
//!    A `draggable` region starts a move; a `not_draggable` region (for example
//!    a button inside a header) is an ordinary point even when a draggable
//!    region covers it.
//! 3. Anything else is an ordinary point.
const std = @import("std");
const geometry = @import("../video/geometry.zig");

/// A point in window coordinates (pixels, origin at the top-left corner).
pub const Point = geometry.Point(i32);
/// A rectangle in window coordinates.
pub const Rect = geometry.Rect(i32);

/// Edges a resize starts from. The bit order matches the xdg_toplevel resize
/// edge bitmask (top 1, bottom 2, left 4, right 8), so `bits` is sent unchanged
/// on Wayland; X11 maps the combination to _NET_WM_MOVERESIZE directions.
pub const Edges = packed struct(u4) {
    top: bool = false,
    bottom: bool = false,
    left: bool = false,
    right: bool = false,

    /// The xdg_toplevel resize-edge bitmask for these edges.
    pub fn bits(self: Edges) u32 {
        return @as(u4, @bitCast(self));
    }

    /// True when no edge is selected.
    pub fn is_none(self: Edges) bool {
        return @as(u4, @bitCast(self)) == 0;
    }
};

/// What a pointer press at a point means.
pub const Hit = union(enum) {
    /// An ordinary point: deliver the press to the application.
    normal,
    /// Start an interactive move (or the window menu on a right press).
    draggable,
    /// Start an interactive resize from these edges or corners.
    resize: Edges,
};

/// Whether a region moves the window or is an exception inside a draggable one.
pub const Kind = enum { draggable, not_draggable };

/// One rectangle of the application's hit-test description.
pub const Region = struct {
    rect: Rect,
    kind: Kind,
};

/// Capacity of `HitTest`. Headers with window controls need only a handful.
pub const max_regions = 32;

/// Error when a description holds more regions than `max_regions`.
pub const Error = error{TooManyRegions};

/// The application's hit-test description for one window. Regions are kept in
/// order; `classify` consults the last one first.
pub const HitTest = struct {
    /// Width of the resize border inside the window edges, in pixels. Zero
    /// disables edge resizing, which custom title bars usually want on Linux
    /// only where the compositor draws no frame.
    resize_border: u16 = 0,
    regions: [max_regions]Region = undefined,
    len: u8 = 0,

    /// Builds a description from a slice of regions in order.
    pub fn from_regions(resize_border: u16, regions: []const Region) Error!HitTest {
        if (regions.len > max_regions) return error.TooManyRegions;
        var value: HitTest = .{ .resize_border = resize_border, .len = @intCast(regions.len) };
        @memcpy(value.regions[0..regions.len], regions);
        return value;
    }

    /// Appends a region on top of the existing ones.
    pub fn add(self: *HitTest, region: Region) Error!void {
        if (self.len == max_regions) return error.TooManyRegions;
        self.regions[self.len] = region;
        self.len += 1;
    }

    /// The regions in order, first added first.
    pub fn items(self: *const HitTest) []const Region {
        return self.regions[0..self.len];
    }

    /// True when the description can change a press: edge resizing is on or a region exists.
    pub fn is_active(self: HitTest) bool {
        return self.resize_border != 0 or self.len != 0;
    }
};

/// Classifies a pointer position inside a window of `size` (width, height in
/// pixels). `resizable` says whether the window may be resized by the user.
/// Points outside the window are ordinary.
pub fn classify(hit_test: HitTest, width: i32, height: i32, point: Point, resizable: bool) Hit {
    if (width <= 0 or height <= 0) return .normal;
    if (point.x < 0 or point.y < 0 or point.x >= width or point.y >= height) return .normal;

    const border: i32 = hit_test.resize_border;
    if (resizable and border > 0) {
        // The left and top bands win when a window is narrower than two borders.
        const left = point.x < border;
        const top = point.y < border;
        const edges: Edges = .{
            .left = left,
            .right = !left and point.x >= width - border,
            .top = top,
            .bottom = !top and point.y >= height - border,
        };
        if (!edges.is_none()) return .{ .resize = edges };
    }

    for (0..hit_test.len) |offset| {
        const region = hit_test.regions[hit_test.len - 1 - offset];
        if (!region.rect.contains(point)) continue;
        return switch (region.kind) {
            .draggable => .draggable,
            .not_draggable => .normal,
        };
    }
    return .normal;
}

test "edges and corners resize when resizable" {
    const hit_test: HitTest = .{ .resize_border = 4 };
    const top_left = classify(hit_test, 100, 80, .{ .x = 1, .y = 1 }, true);
    try std.testing.expect(top_left == .resize);
    try std.testing.expectEqual(@as(u32, 5), top_left.resize.bits());
    try std.testing.expectEqual(@as(u32, 10), classify(hit_test, 100, 80, .{ .x = 99, .y = 79 }, true).resize.bits());
    try std.testing.expectEqual(@as(u32, 2), classify(hit_test, 100, 80, .{ .x = 50, .y = 79 }, true).resize.bits());
    try std.testing.expectEqual(@as(u32, 8), classify(hit_test, 100, 80, .{ .x = 99, .y = 40 }, true).resize.bits());
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 100, 80, .{ .x = 50, .y = 40 }, true));
}

test "resize is ignored when not resizable" {
    const hit_test: HitTest = .{ .resize_border = 4 };
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 100, 80, .{ .x = 1, .y = 40 }, false));
}

test "regions: last added wins and not-draggable carves holes" {
    const header: Region = .{ .rect = .{ .x = 0, .y = 0, .width = 200, .height = 36 }, .kind = .draggable };
    const button: Region = .{ .rect = .{ .x = 150, .y = 0, .width = 46, .height = 36 }, .kind = .not_draggable };
    const hit_test = try HitTest.from_regions(0, &.{ header, button });
    try std.testing.expectEqual(Hit.draggable, classify(hit_test, 300, 200, .{ .x = 20, .y = 10 }, true));
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 300, 200, .{ .x = 160, .y = 10 }, true));
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 300, 200, .{ .x = 20, .y = 50 }, true));
}

test "points outside the window are ordinary" {
    const header: Region = .{ .rect = .{ .x = -10, .y = -10, .width = 500, .height = 500 }, .kind = .draggable };
    const hit_test = try HitTest.from_regions(4, &.{header});
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 100, 80, .{ .x = -1, .y = 40 }, true));
    try std.testing.expectEqual(Hit.normal, classify(hit_test, 100, 80, .{ .x = 100, .y = 40 }, true));
    try std.testing.expectEqual(Hit.normal, classify(.{}, 0, 0, .{ .x = 0, .y = 0 }, true));
}

test "capacity is enforced" {
    var hit_test: HitTest = .{};
    for (0..max_regions) |_| try hit_test.add(.{ .rect = .{ .x = 0, .y = 0, .width = 1, .height = 1 }, .kind = .draggable });
    try std.testing.expectError(error.TooManyRegions, hit_test.add(.{ .rect = .{ .x = 0, .y = 0, .width = 1, .height = 1 }, .kind = .draggable }));
    const one: Region = .{ .rect = .{ .x = 0, .y = 0, .width = 1, .height = 1 }, .kind = .draggable };
    var too_many: [max_regions + 1]Region = undefined;
    @memset(&too_many, one);
    try std.testing.expectError(error.TooManyRegions, HitTest.from_regions(0, &too_many));
}

test "a narrow window keeps one horizontal edge" {
    const hit_test: HitTest = .{ .resize_border = 6 };
    // Width 10 with a border of 6 leaves both bands overlapping; the left band wins.
    const hit = classify(hit_test, 10, 10, .{ .x = 5, .y = 5 }, true);
    try std.testing.expect(hit == .resize);
    try std.testing.expect(hit.resize.left and !hit.resize.right);
}
