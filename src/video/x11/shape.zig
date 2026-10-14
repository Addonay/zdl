//! Window input shapes through libXext's XShape, as SDL_x11shape.c does. A
//! surface's alpha channel becomes a one-bit mask: pixels with zero alpha are
//! outside the shape. The mask is sent with XShapeCombineMask as an input shape
//! (ShapeInput), which is what SDL applies in this revision.
//!
//! Mask layout follows XCreateBitmapFromData (XBM): rows of (width + 7) / 8
//! bytes, least significant bit first, so pixel x is bit x % 8 of byte x / 8.
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

/// Shapes the input region of `xid` (a window of `size`) from `view`, or clears
/// the shape when `view` is null. The view's bounds may differ from `size`.
pub fn set_input_shape(
    connection: *window.Connection,
    allocator: std.mem.Allocator,
    xid: xlib.Window,
    size: window.Size,
    view: ?surface.View,
) window.Error!void {
    const xshape = connection.library.xshape orelse return error.ShapeUnavailable;
    const api = &connection.library.functions;
    var event_base: c_int = 0;
    var error_base: c_int = 0;
    if (xshape.XShapeQueryExtension(connection.display, &event_base, &error_base) == 0) return error.ShapeUnavailable;

    const source = view orelse {
        xshape.XShapeCombineMask(connection.display, xid, xlib.shape_input, 0, 0, xlib.none, xlib.shape_set);
        try connection.flush();
        return;
    };
    if (source.width == 0 or source.height == 0) return error.InvalidSize;

    const width: usize = size.width;
    const height: usize = size.height;
    const row_bytes = (width + 7) / 8;
    const mask = try allocator.alloc(u8, row_bytes * height);
    defer allocator.free(mask);
    @memset(mask, 0);
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

    const pixmap = api.XCreateBitmapFromData(connection.display, xid, mask.ptr, size.width, size.height);
    if (pixmap == xlib.none) return error.ShapeUnavailable;
    defer _ = api.XFreePixmap(connection.display, pixmap);
    xshape.XShapeCombineMask(connection.display, xid, xlib.shape_input, 0, 0, pixmap, xlib.shape_set);
    try connection.flush();
}
