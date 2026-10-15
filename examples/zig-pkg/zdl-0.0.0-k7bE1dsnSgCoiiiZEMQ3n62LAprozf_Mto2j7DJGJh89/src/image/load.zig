//! Image loading into owned surfaces, and the MJPG camera-frame bridge.
//!
//! `load_jpg` and `load_png` follow SDL's `SDL_LoadJPG_IO` / `SDL_LoadPNG_IO`
//! pixel-format choices, which come from stb_image's output channel count:
//! - one channel (grey JPEG, grey PNG, or PNG palette indices) becomes an
//!   INDEX8 surface; grey uses a 256-entry grey ramp, PNG palettes their table;
//! - three channels become RGB24 (`rgb8`);
//! - four channels become RGBA32 (`rgba8`);
//! - grey with alpha is expanded to RGBA32, as SDL does.
//!
//! Transparency is reported with `Transparency`, which mirrors SDL's palette rule:
//! partial or repeated transparent entries select blending, and a single fully
//! transparent entry becomes the color key. The caller applies it; a surface
//! carries no blend mode or color key of its own here.
//!
//! The MJPG functions decode a JPEG camera frame into NV12 (for `yuv.Image`
//! and the YUV paths in `blit_yuv.zig`) or into a surface. `blit_yuv.zig` reports
//! MJPG as unsupported; these functions are the bridge it lacks. Colorspace
//! metadata is not converted: the YCbCr matrix and range are the frame's
//! `encoding`, which the caller pairs with the returned NV12 image, as SDL infers
//! the frame's colorspace separately.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const surface = @import("../video/surface.zig");
const yuv = @import("../video/yuv.zig");
const blit_yuv = @import("../video/blit_yuv.zig");
const jpeg = @import("jpeg.zig");
const png = @import("png.zig");

/// Loading and conversion failures from the decoders and surface storage.
pub const Error = jpeg.Error || png.Error || surface.Error || yuv.Error || blit_yuv.Error;

/// Color-key or blend information for a palette image, as SDL reports it.
pub const Transparency = union(enum) {
    none,
    /// Palette index whose entry is fully transparent. The index is not
    /// otherwise special, so the caller decides how to use it.
    color_key: u8,
    /// At least one entry has partial opacity, or several are transparent.
    blend,
};

/// An owned surface and any palette it borrows. Pixel data and palette are both
/// released by `deinit`.
pub const Image = struct {
    allocator: std.mem.Allocator,
    surface: surface.Surface,
    /// Storage behind an indexed surface's palette, when there is one.
    palette: ?[]pixels.Color,
    transparency: Transparency = .none,

    /// Releases the surface and its palette storage.
    pub fn deinit(self: *Image) void {
        self.surface.deinit();
        if (self.palette) |colors| self.allocator.free(colors);
        self.* = undefined;
    }
};

/// Decodes a JPEG into an RGB, grey or indexed surface, as `SDL_LoadJPG` does.
pub fn load_jpg(allocator: std.mem.Allocator, bytes: []const u8) Error!Image {
    if (!jpeg.is_jpeg(bytes)) return error.NotJpeg;
    var decoded = try jpeg.decode(allocator, bytes, .automatic);
    defer decoded.deinit();
    return from_samples(allocator, decoded.width, decoded.height, decoded.channels, decoded.data, null);
}

/// Decodes a PNG into a surface, as `SDL_LoadPNG` does. Palette images keep
/// their indices, and the palette is transferred to the returned image.
pub fn load_png(allocator: std.mem.Allocator, bytes: []const u8) Error!Image {
    if (!png.is_png(bytes)) return error.NotPng;
    var decoded = try png.decode(allocator, bytes);
    defer decoded.deinit();
    if (decoded.palette) |colors| {
        // Ownership moves to the returned image; `decoded.deinit` must not free it.
        decoded.palette = null;
        errdefer allocator.free(colors);
        var image = try from_samples(allocator, decoded.width, decoded.height, decoded.channels, decoded.data, colors);
        image.transparency = palette_transparency(colors);
        return image;
    }
    return from_samples(allocator, decoded.width, decoded.height, decoded.channels, decoded.data, null);
}

/// Decodes an MJPG camera frame into a freshly allocated NV12 image.
///
/// `width` and `height` are the frame size reported by the camera; the JPEG must
/// match them exactly. The returned image is owned by the caller. Pair its
/// planes with the frame's `encoding` when converting to RGB.
pub fn convert_mjpg_to_nv12(allocator: std.mem.Allocator, bytes: []const u8, width: u31, height: u31) Error!yuv.Image {
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
/// rejected, so callers can route frames by format without decoding twice.
pub fn convert_mjpg_frame_to_nv12(allocator: std.mem.Allocator, frame: blit_yuv.Frame) Error!yuv.Image {
    if (frame.format != .mjpg) return error.UnsupportedFormat;
    return convert_mjpg_to_nv12(allocator, frame.data, frame.width, frame.height);
}

/// Decodes an MJPG frame to RGB and converts it to `format` (and `palette`,
/// for indexed targets). Frame dimensions must match the JPEG.
pub fn convert_mjpg_frame_to_surface(allocator: std.mem.Allocator, frame: blit_yuv.Frame, format: pixels.Format, palette: ?[]const pixels.Color) Error!surface.Surface {
    if (frame.format != .mjpg) return error.UnsupportedFormat;
    var rgb = try jpeg.decode(allocator, frame.data, .rgb);
    defer rgb.deinit();
    if (rgb.width != frame.width or rgb.height != frame.height) return error.SizeMismatch;
    const source = try surface.View.init(rgb.data, rgb.width, rgb.height, @as(usize, rgb.width) * 3, .rgb8, null);
    return surface.Surface.convert(allocator, source, format, palette);
}

/// Builds the surface for `channels` interleaved samples, using SDL's format
/// choice. `palette` is consumed by the image when given (its owner is then the
/// returned Image); a null palette is replaced by a grey ramp for one channel.
fn from_samples(allocator: std.mem.Allocator, width: u31, height: u31, channels: u8, data: []const u8, palette: ?[]pixels.Color) Error!Image {
    const w: usize = width;
    const h: usize = height;
    switch (channels) {
        1 => {
            // A caller-supplied palette stays owned by the caller on failure.
            const colors = palette orelse try grey_palette(allocator);
            var result = surface.Surface.init(allocator, width, height, .{ .indexed = .{ .bits = 8 } }, colors) catch |err| {
                if (palette == null) allocator.free(colors);
                return err;
            };
            errdefer result.deinit();
            try copy_rows(result.view, data, w, h, 1);
            return .{ .allocator = allocator, .surface = result, .palette = colors };
        },
        2 => {
            var result = try surface.Surface.init(allocator, width, height, .rgba8, null);
            errdefer result.deinit();
            for (0..h) |y| {
                const row = try result.view.row(y);
                for (0..w) |x| {
                    const grey = data[(y * w + x) * 2];
                    const alpha = data[(y * w + x) * 2 + 1];
                    row[x * 4 + 0] = grey;
                    row[x * 4 + 1] = grey;
                    row[x * 4 + 2] = grey;
                    row[x * 4 + 3] = alpha;
                }
            }
            return .{ .allocator = allocator, .surface = result, .palette = null };
        },
        3, 4 => {
            const format: pixels.Format = if (channels == 3) .rgb8 else .rgba8;
            var result = try surface.Surface.init(allocator, width, height, format, null);
            errdefer result.deinit();
            try copy_rows(result.view, data, w, h, channels);
            return .{ .allocator = allocator, .surface = result, .palette = null };
        },
        else => return error.UnsupportedPng,
    }
}

/// Copies tightly packed rows into a surface whose rows are `samples` bytes per pixel.
fn copy_rows(view: surface.View, data: []const u8, width: usize, height: usize, samples: usize) Error!void {
    for (0..height) |y| {
        const row = try view.row(y);
        @memcpy(row[0 .. width * samples], data[y * width * samples ..][0 .. width * samples]);
    }
}

/// A 256-entry grey ramp, the palette SDL gives grey images.
fn grey_palette(allocator: std.mem.Allocator) std.mem.Allocator.Error![]pixels.Color {
    const colors = try allocator.alloc(pixels.Color, 256);
    for (colors, 0..) |*color, i| {
        const value: u8 = @intCast(i);
        color.* = .{ .r = value, .g = value, .b = value, .a = 255 };
    }
    return colors;
}

/// SDL's palette rule: one fully transparent entry is a color key; any partial
/// alpha, or a second transparent entry, selects blending instead.
fn palette_transparency(colors: []const pixels.Color) Transparency {
    var has_colorkey = false;
    var colorkey_index: u8 = 0;
    var has_alpha = false;
    for (colors, 0..) |color, i| {
        if (color.a != 255) {
            if (color.a == 0 and !has_colorkey) {
                has_colorkey = true;
                colorkey_index = @intCast(i);
            } else {
                has_alpha = true;
            }
        }
    }
    if (has_alpha) return .blend;
    if (has_colorkey) return .{ .color_key = colorkey_index };
    return .none;
}
