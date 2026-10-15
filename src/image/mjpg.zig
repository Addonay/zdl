//! The MJPG camera-frame bridge.
//!
//! V4L2 and UVC cameras deliver motion JPEG, which the JPEG decoder already
//! understands; these functions turn one frame into the plane layouts the rest
//! of the library consumes without decoding it twice. Colorspace metadata is not
//! converted: the YCbCr matrix and range stay the frame's `encoding`, which the
//! caller pairs with the returned planes, because that is the frame's real
//! colorimetry and re-deriving it from the JPEG headers would lose the camera's
//! choice.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");
const yuv = @import("../video/yuv.zig");
const blit_yuv = @import("../video/blit_yuv.zig");
const jpeg = @import("jpeg.zig");

pub const Error = jpeg.Error || surface.Error || yuv.Error || blit_yuv.Error || error{ SizeMismatch, UnsupportedFormat };

/// Decodes an MJPG frame directly into a freshly allocated NV12 image.
///
/// `width` and `height` are the frame size the camera reported; the JPEG must
/// match them exactly. The returned image is owned by the caller.
pub fn frame_to_nv12(allocator: std.mem.Allocator, bytes: []const u8, width: u31, height: u31) Error!yuv.Image {
    var image = try yuv.Image.init(allocator, width, height, .nv12);
    errdefer image.deinit();
    const chroma_w = (@as(usize, width) + 1) / 2;
    try jpeg.decode_nv12(allocator, bytes, .{
        .width = width,
        .height = height,
        .y = image.writable[0],
        .y_stride = width,
        .uv = image.writable[1],
        .uv_stride = 2 * chroma_w,
    });
    return image;
}

/// NV12 conversion of an `.mjpg` frame from `blit_yuv.zig`. Other formats are
/// rejected so callers can route frames by format without a second decode.
pub fn frame_to_nv12_from(allocator: std.mem.Allocator, frame: blit_yuv.Frame) Error!yuv.Image {
    if (frame.format != .mjpg) return error.UnsupportedFormat;
    return frame_to_nv12(allocator, frame.data, frame.width, frame.height);
}

/// Decodes an MJPG frame to RGB and converts it to `format` (with `palette` for
/// indexed targets). The frame dimensions must match the JPEG.
pub fn frame_to_surface(
    allocator: std.mem.Allocator,
    frame: blit_yuv.Frame,
    format: pixels.Format,
    palette: ?[]const pixels.Color,
) Error!surface.Surface {
    if (frame.format != .mjpg) return error.UnsupportedFormat;
    var rgb = try jpeg.decode(allocator, frame.data, .rgb);
    defer rgb.deinit();
    if (rgb.width != frame.width or rgb.height != frame.height) return error.SizeMismatch;
    const source = try surface.View.init(rgb.data, rgb.width, rgb.height, @as(usize, rgb.width) * 3, .rgb8, null);
    return surface.Surface.convert(allocator, source, format, palette);
}
