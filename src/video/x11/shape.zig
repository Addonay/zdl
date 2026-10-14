//! Window input shapes through libXext's XShape, as SDL_x11shape.c does. A
//! surface's alpha channel becomes a one-bit mask: pixels with zero alpha are
//! outside the shape. The mask is sent with XShapeCombineMask as an input shape
//! (ShapeInput), which is what SDL applies in this revision.
//!
//! Mask layout follows XCreateBitmapFromData (XBM): rows of (width + 7) / 8
//! bytes, least significant bit first, so pixel x is bit x % 8 of byte x / 8.
//!
//! Bounding shapes (`set_bounding_shape`) use the same mask with ShapeBounding:
//! the window is clipped visually, and the clipped area also stops receiving
//! pointer input. SDL's X11 backend never sets a bounding shape (its shapes are
//! input-only in this revision), so this is an addition for translucent or
//! non-rectangular windows on servers without a compositor.
//!
//! Deliberate differences from SDL: the source is scaled to the window size by
//! nearest-neighbour sampling, where SDL stretches it with a linear filter before
//! thresholding alpha. A null view clears the shape with XShapeCombineMask and no
//! pixmap, where SDL combines a rectangle covering the window; both leave the
//! whole window receiving input.
const std = @import("std");
const surface = @import("../surface.zig");
const window = @import("window.zig");
const xlib = @import("xlib.zig");

/// Which region of the window a mask replaces.
pub const Kind = enum {
    /// Where the window receives pointer input (ShapeInput).
    input,
    /// What is visible of the window, and so also what receives input (ShapeBounding).
    bounding,

    fn code(self: Kind) c_int {
        return switch (self) {
            .input => xlib.shape_input,
            .bounding => xlib.shape_bounding,
        };
    }
};

/// Shapes the input region of `xid` (a window of `size`) from `view`, or clears
/// the shape when `view` is null. The view's bounds may differ from `size`.
pub fn set_input_shape(
    connection: *window.Connection,
    allocator: std.mem.Allocator,
    xid: xlib.Window,
    size: window.Size,
    view: ?surface.View,
) window.Error!void {
    return set_shape(connection, allocator, xid, size, view, .input);
}

/// Clips the visible region of `xid` to the opaque pixels of `view`, or restores
/// the whole window when `view` is null.
pub fn set_bounding_shape(
    connection: *window.Connection,
    allocator: std.mem.Allocator,
    xid: xlib.Window,
    size: window.Size,
    view: ?surface.View,
) window.Error!void {
    return set_shape(connection, allocator, xid, size, view, .bounding);
}

/// Bitmask row length in bytes (XBM): one bit per pixel, rows padded to bytes.
pub fn mask_row_bytes(width: usize) usize {
    return (width + 7) / 8;
}

/// Fills `mask` (rows of `mask_row_bytes(width)`) from the alpha channel of
/// `source`, scaled to `width` x `height` by nearest-neighbour sampling.
pub fn build_mask(mask: []u8, width: usize, height: usize, source: surface.View) !void {
    const row_bytes = mask_row_bytes(width);
    std.debug.assert(mask.len >= row_bytes * height);
    @memset(mask[0 .. row_bytes * height], 0);
    const source_width: usize = source.width;
    const source_height: usize = source.height;
    for (0..height) |y| {
        const source_y = y * source_height / height;
        for (0..width) |x| {
            const source_x = x * source_width / width;
            const color = try source.read(source_x, source_y);
            if (color.a == 0) continue;
            mask[y * row_bytes + x / 8] |= @as(u8, 1) << @intCast(x % 8);
        }
    }
}

fn set_shape(
    connection: *window.Connection,
    allocator: std.mem.Allocator,
    xid: xlib.Window,
    size: window.Size,
    view: ?surface.View,
    kind: Kind,
) window.Error!void {
    const xshape = connection.library.xshape orelse return error.ShapeUnavailable;
    const api = &connection.library.functions;
    var event_base: c_int = 0;
    var error_base: c_int = 0;
    if (xshape.XShapeQueryExtension(connection.display, &event_base, &error_base) == 0) return error.ShapeUnavailable;

    const source = view orelse {
        xshape.XShapeCombineMask(connection.display, xid, kind.code(), 0, 0, xlib.none, xlib.shape_set);
        try connection.flush();
        return;
    };
    if (source.width == 0 or source.height == 0) return error.InvalidSize;

    const width: usize = size.width;
    const height: usize = size.height;
    const mask = try allocator.alloc(u8, mask_row_bytes(width) * height);
    defer allocator.free(mask);
    try build_mask(mask, width, height, source);

    const pixmap = api.XCreateBitmapFromData(connection.display, xid, mask.ptr, size.width, size.height);
    if (pixmap == xlib.none) return error.ShapeUnavailable;
    defer _ = api.XFreePixmap(connection.display, pixmap);
    xshape.XShapeCombineMask(connection.display, xid, kind.code(), 0, 0, pixmap, xlib.shape_set);
    try connection.flush();
}

test "mask follows alpha with LSB-first rows and nearest scaling" {
    // 2x1 source: opaque, transparent. Scaled to 10x2 the left five columns stay set.
    var data = [_]u8{ 1, 2, 3, 255, 1, 2, 3, 0 };
    const view = try surface.View.init(&data, 2, 1, 8, .rgba8, null);
    var mask: [4]u8 = undefined;
    try build_mask(&mask, 10, 2, view);
    try std.testing.expectEqual(@as(usize, 2), mask_row_bytes(10));
    try std.testing.expectEqualSlices(u8, &.{ 0x1f, 0x00, 0x1f, 0x00 }, &mask);
    // Eight columns: the left four are set.
    var narrow: [2]u8 = undefined;
    try build_mask(&narrow, 8, 2, view);
    try std.testing.expectEqualSlices(u8, &.{ 0x0f, 0x0f }, &narrow);
}
