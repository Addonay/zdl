//! Camera frame conversion into surfaces: packed YUV (YUY2, UYVY, YVYU), semi-planar
//! YUV (NV12, NV21), planar 4:2:0 YUV (YV12, IYUV) and RGBX32, with nearest-neighbor
//! scaling to a destination size.
//! Altered native port of the camera frame conversion path in SDL's pixel
//! conversion (SDL_convert / SDL_yuv / SDL_stretch.c nearest mode) for the formats
//! camera backends produce. Frames are borrowed; no conversion allocates except
//! `to_surface`, which allocates only its destination raster.
//!
//! Deliberate differences from SDL:
//! - MJPG frames are not decoded here. They are reported as `UnsupportedFormat`,
//!   because a JPEG decoder is outside this slice.
//! - The YCbCr matrix and range are an explicit `yuv.Encoding` in every frame.
//!   SDL infers them from the camera colorspace; `encoding_for` gives that mapping
//!   and returns null when the colorspace does not describe YCbCr.
//! - Scaling is nearest-neighbor only, sampling each destination pixel center
//!   (floor((i + 0.5) * source / destination)). Bilinear scaling is not included.
//! - Chroma is sampled at the nearest block, as in yuv.zig; there is no centered or
//!   interpolated chroma siting.
//!
//! Plane layout (planes are not necessarily tightly packed; `stride` is the luma
//! row pitch in bytes):
//! - YUY2/UYVY/YVYU: one interleaved plane, four bytes per two pixels, row pitch `stride`.
//! - NV12/NV21: luma plane of `stride * height`, then interleaved chroma rows of
//!   pitch `stride`.
//! - YV12/IYUV: luma plane of `stride * height`, then two chroma planes of pitch
//!   `(stride + 1) / 2` and `ceil(height / 2)` rows each. YV12 stores V before U.
//! - RGBX32: four bytes per pixel in memory order R, G, B, X; X is ignored.
//!
//! Packed and semi-planar chroma rows hold a pair of luma samples per chroma
//! sample, so odd widths need a stride of at least `2 * ceil(width / 2)` bytes per
//! row (four times that for packed formats). Narrower strides are rejected with
//! `InvalidBuffer` by yuv.zig rather than read past the row.
const std = @import("std");
const camera = @import("../camera/camera.zig");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const yuv = @import("yuv.zig");

/// Conversion errors: layout and buffer validation from yuv.zig and surface.zig,
/// plus unsupported camera formats and empty destinations.
pub const Error = yuv.Error || error{ UnsupportedFormat, InvalidBuffer, InvalidSize };

/// One camera frame borrowed from a backend. The buffer must outlive every
/// conversion call that reads it. For RGBX32 the `encoding` field is ignored.
pub const Frame = struct {
    format: camera.Format,
    width: u31,
    height: u31,
    /// Row pitch in bytes of the luma plane, or of the RGBX rows.
    stride: usize,
    data: []const u8,
    /// Matrix and range of YCbCr data.
    encoding: yuv.Encoding,
};

/// Eight-bit RGBX rows borrowed from a frame. Alpha is always opaque.
pub const Rgbx32 = struct {
    width: u31,
    height: u31,
    stride: usize,
    data: []const u8,

    /// Reads one pixel. Coordinates are checked against the raster bounds.
    pub fn read(self: Rgbx32, x: usize, y: usize) Error!pixels.Color {
        if (x >= self.width or y >= self.height) return error.OutOfBounds;
        const offset = y * self.stride + x * 4;
        return .{ .r = self.data[offset], .g = self.data[offset + 1], .b = self.data[offset + 2], .a = 255 };
    }
};

/// A validated, read-only source image: either YCbCr with an encoding, or RGBX.
pub const Source = union(enum) {
    ycbcr: struct { view: yuv.View, encoding: yuv.Encoding },
    rgbx32: Rgbx32,

    /// Source width in pixels.
    pub fn width(self: Source) usize {
        return switch (self) {
            .ycbcr => |value| value.view.width,
            .rgbx32 => |value| value.width,
        };
    }

    /// Source height in pixels.
    pub fn height(self: Source) usize {
        return switch (self) {
            .ycbcr => |value| value.view.height,
            .rgbx32 => |value| value.height,
        };
    }

    /// Decodes one pixel to opaque RGB.
    pub fn read(self: Source, x: usize, y: usize) Error!pixels.Color {
        return switch (self) {
            .ycbcr => |value| value.view.read(x, y, value.encoding),
            .rgbx32 => |value| value.read(x, y),
        };
    }
};

/// Validates a frame and returns a borrowed source. Storage is checked here,
/// once, so conversion loops only perform bounds-checked reads.
pub fn source_from_frame(frame: Frame) Error!Source {
    const w = frame.width;
    const h = frame.height;
    switch (frame.format) {
        .rgbx32 => {
            const row = std.math.mul(usize, w, 4) catch return error.Overflow;
            if (frame.stride < row) return error.InvalidBuffer;
            if (w != 0 and h != 0) {
                const prefix = std.math.mul(usize, h - 1, frame.stride) catch return error.Overflow;
                const required = std.math.add(usize, prefix, row) catch return error.Overflow;
                if (frame.data.len < required) return error.InvalidBuffer;
            }
            return .{ .rgbx32 = .{ .width = w, .height = h, .stride = frame.stride, .data = frame.data } };
        },
        .yuy2, .uyvy, .yvyu => {
            const layout: yuv.Layout = switch (frame.format) {
                .yuy2 => .yuy2,
                .uyvy => .uyvy,
                else => .yvyu,
            };
            const view = try yuv.View.init(w, h, layout, .{ .interleaved = .{ .data = frame.data, .stride = frame.stride } });
            return .{ .ycbcr = .{ .view = view, .encoding = frame.encoding } };
        },
        .nv12, .nv21 => {
            const luma_bytes = std.math.mul(usize, frame.stride, h) catch return error.Overflow;
            if (frame.data.len < luma_bytes) return error.InvalidBuffer;
            const layout: yuv.Layout = if (frame.format == .nv12) .nv12 else .nv21;
            const view = try yuv.View.init(w, h, layout, .{ .semiplanar = .{
                .y = .{ .data = frame.data, .stride = frame.stride },
                .uv = .{ .data = frame.data[luma_bytes..], .stride = frame.stride },
            } });
            return .{ .ycbcr = .{ .view = view, .encoding = frame.encoding } };
        },
        .yv12, .iyuv => {
            const chroma_stride = (frame.stride + 1) / 2;
            const chroma_rows = (@as(usize, h) + 1) / 2;
            const luma_bytes = std.math.mul(usize, frame.stride, h) catch return error.Overflow;
            const plane_bytes = std.math.mul(usize, chroma_stride, chroma_rows) catch return error.Overflow;
            const second_offset = std.math.add(usize, luma_bytes, plane_bytes) catch return error.Overflow;
            if (frame.data.len < luma_bytes) return error.InvalidBuffer;
            if (frame.data.len < second_offset) return error.InvalidBuffer;
            const first: yuv.Plane = .{ .data = frame.data[luma_bytes..], .stride = chroma_stride };
            const second: yuv.Plane = .{ .data = frame.data[second_offset..], .stride = chroma_stride };
            // YV12 stores V before U; IYUV stores U before V.
            const planes: struct { u: yuv.Plane, v: yuv.Plane } = if (frame.format == .yv12)
                .{ .u = second, .v = first }
            else
                .{ .u = first, .v = second };
            const view = try yuv.View.init(w, h, .planar420, .{ .planar = .{
                .y = .{ .data = frame.data, .stride = frame.stride },
                .u = planes.u,
                .v = planes.v,
            } });
            return .{ .ycbcr = .{ .view = view, .encoding = frame.encoding } };
        },
        // Compressed frames need a JPEG decoder, which is not part of this slice.
        .mjpg, .unknown => return error.UnsupportedFormat,
    }
}

/// Maps a camera colorspace to a YCbCr encoding. Returns null when the colorspace
/// does not describe YCbCr samples (full-range sRGB, or unknown), so the caller
/// must choose an encoding explicitly.
pub fn encoding_for(colorspace: camera.Colorspace) ?yuv.Encoding {
    return switch (colorspace) {
        .bt709_limited => .bt709_limited,
        .srgb, .unknown => null,
    };
}

/// Converts `frame` into `destination`, scaling with nearest-neighbor sampling when
/// the sizes differ. The destination must be non-empty whenever the source is.
/// An empty destination is a no-op. Writes stop at the first error, leaving the
/// destination partially written.
pub fn convert_into(destination: surface.View, frame: Frame) Error!void {
    const source = try source_from_frame(frame);
    try scale_into(destination, source);
}

/// Nearest-neighbor scaling of `source` into every pixel of `destination`. Each
/// destination pixel samples the source at its center, so identical sizes map
/// one-to-one, and enlargement repeats source pixels evenly.
pub fn scale_into(destination: surface.View, source: Source) Error!void {
    const destination_width: usize = destination.width;
    const destination_height: usize = destination.height;
    if (destination_width == 0 or destination_height == 0) return;
    const source_width = source.width();
    const source_height = source.height();
    if (source_width == 0 or source_height == 0) return error.InvalidSize;
    for (0..destination_height) |dy| {
        const sy = nearest_index(dy, destination_height, source_height);
        for (0..destination_width) |dx| {
            const sx = nearest_index(dx, destination_width, source_width);
            try destination.write(dx, dy, try source.read(sx, sy));
        }
    }
}

/// Source index for destination index `index`, using the center of the destination
/// pixel: floor((2i + 1) * source / (2 * destination)), clamped to the last pixel.
/// The product is at most about 2^33 for u31 dimensions, so it cannot overflow usize.
fn nearest_index(index: usize, destination: usize, source: usize) usize {
    return @min(((2 * index + 1) * source) / (2 * destination), source - 1);
}

/// Allocates a surface of the requested size and format, then converts `frame`
/// into it with `convert_into`. Frees the surface if conversion fails. The
/// palette follows surface.zig's borrowing rules.
pub fn to_surface(allocator: std.mem.Allocator, frame: Frame, width: u31, height: u31, format: pixels.Format, palette: ?[]const pixels.Color) Error!surface.Surface {
    var result = try surface.Surface.init(allocator, width, height, format, palette);
    errdefer result.deinit();
    try convert_into(result.view, frame);
    return result;
}
