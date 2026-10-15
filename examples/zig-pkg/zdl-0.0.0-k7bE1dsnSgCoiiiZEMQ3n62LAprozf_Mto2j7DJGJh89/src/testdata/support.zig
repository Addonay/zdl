//! Helpers shared by the ported SDL automation tests (SDLTest_CompareSurfaces
//! and the 9-grid reference painter from testautomation_render.c).
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");

/// SDLTest_CompareSurfaces: every RGBA component must differ by at most
/// `allowable_error`. Prints the first mismatch.
pub fn compare_surfaces(actual: surface.View, expected: surface.View, allowable_error: u8) !void {
    try std.testing.expectEqual(expected.width, actual.width);
    try std.testing.expectEqual(expected.height, actual.height);
    for (0..actual.height) |y| for (0..actual.width) |x| {
        const a = try actual.read(x, y);
        const e = try expected.read(x, y);
        const diffs = [4]u16{ diff(a.r, e.r), diff(a.g, e.g), diff(a.b, e.b), diff(a.a, e.a) };
        for (diffs) |d| if (d > allowable_error) {
            std.debug.print("surfaces differ at {d},{d}: actual {any}, expected {any}\n", .{ x, y, a, e });
            return error.SurfacesDiffer;
        };
    };
}

fn diff(a: u8, b: u8) u16 {
    return if (a > b) a - b else b - a;
}

pub const color_separation: u8 = 85;

/// Fill9GridReferenceSurface from testautomation_surface.c / _render.c.
pub fn fill_9grid_reference(view: surface.View, left: i32, right: i32, top: i32, bottom: i32) !void {
    const w: i32 = view.width;
    const h: i32 = view.height;
    const cs: u8 = color_separation;
    const xs = [3]i32{ 0, left, w - right };
    const ws = [3]i32{ left, w - left - right, right };
    const ys = [3]i32{ 0, top, h - bottom };
    const hs = [3]i32{ top, h - top - bottom, bottom };
    for (0..3) |row| for (0..3) |col| {
        const color: pixels.Color = .{ .r = @intCast((col + 1) * cs), .g = @intCast((row + 1) * cs), .b = 0 };
        try view.fill(color, .{ .x = xs[col], .y = ys[row], .width = ws[col], .height = hs[row] });
    };
}
