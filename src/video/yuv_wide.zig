//! Ten- and sixteen-bit semi-planar YCbCr (P010 and P016): borrowed plane views,
//! owned images, and conversion to RGB through the BT.2020 (and other) matrices
//! from `colorspace.zig`.
//! Altered native port of the P010 paths of SDL_yuv.c and the 16-bit scalar
//! routines in yuv2rgb (yuv_rgb_std.c, YUV_BITS = 10). Built beside `yuv.zig`,
//! not inside it, because samples here are 16-bit containers.
//!
//! Layout: one luma plane of `u16` samples and one interleaved chroma plane
//! holding U then V per 2x2 block. P010 keeps the ten significant bits in the
//! top bits of each container (value << 6), as SDL does; P016 uses all sixteen.
//!
//! Deliberate differences from SDL:
//! - Samples are little-endian explicitly; SDL uses host order.
//! - P016 codes are requantized to ten bits (round to nearest) and then use the
//!   ten-bit matrices. SDL has no P016 path; this keeps one set of coefficients.
//! - Chroma is sampled at the co-located 2x2 block origin (nearest). No
//!   chroma-siting filter is applied, even when `Colorspace.chroma` says so.
//! - BT.601/BT.709 use the 8-bit tables in normalized units, so 10-bit codes
//!   differ from exact 10-bit coefficients by less than one code step.
//! - The colorspace must describe YCbCr with a known matrix; RGB or identity
//!   matrices are rejected with `UnsupportedColorspace`.
const std = @import("std");
const pixels = @import("pixels.zig");
const colorspace = @import("colorspace.zig");
const pixels_wide = @import("pixels_wide.zig");
const surface = @import("surface.zig");

/// Sample container layout.
pub const Layout = enum {
    /// Ten significant bits in the top of each 16-bit container.
    p010,
    /// Sixteen significant bits.
    p016,

    /// Bytes per luma or chroma sample container.
    pub fn sample_bytes(self: Layout) usize {
        _ = self;
        return 2;
    }
};

pub const Error = pixels.Error || surface.Error || error{ UnsupportedColorspace, Overflow };

/// Raw sample containers at one pixel location.
pub const Sample = struct { y: u16, u: u16, v: u16 };

/// Borrowed plane storage. Strides are in bytes. Each luma row needs `width`
/// samples; each chroma row needs `ceil(width/2)` U/V pairs. The buffers and
/// strides are checked once in `init`.
pub const View = struct {
    layout: Layout,
    width: u31,
    height: u31,
    y: []const u8,
    y_stride: usize,
    uv: []const u8,
    uv_stride: usize,

    /// Validates strides, final-row capacity and sizes. Zero-sized views are valid.
    pub fn init(layout: Layout, width: u31, height: u31, y: []const u8, y_stride: usize, uv: []const u8, uv_stride: usize) Error!View {
        const luma_row = std.math.mul(usize, width, 2) catch return error.Overflow;
        const chroma_row = std.math.mul(usize, (@as(usize, width) + 1) / 2, 4) catch return error.Overflow;
        const chroma_rows = (@as(usize, height) + 1) / 2;
        if (width != 0 and height != 0) {
            if (y_stride < luma_row or uv_stride < chroma_row) return error.InvalidBuffer;
            const luma_size = std.math.add(usize, std.math.mul(usize, height - 1, y_stride) catch return error.Overflow, luma_row) catch return error.Overflow;
            const chroma_size = std.math.add(usize, std.math.mul(usize, chroma_rows - 1, uv_stride) catch return error.Overflow, chroma_row) catch return error.Overflow;
            if (y.len < luma_size or uv.len < chroma_size) return error.InvalidBuffer;
        }
        return .{ .layout = layout, .width = width, .height = height, .y = y, .y_stride = y_stride, .uv = uv, .uv_stride = uv_stride };
    }

    /// Reads raw containers for the pixel at (x, y); chroma is the 2x2 block's origin.
    pub fn sample(self: View, x: usize, y: usize) Error!Sample {
        if (x >= self.width or y >= self.height) return error.OutOfBounds;
        const luma_offset = y * self.y_stride + x * 2;
        const chroma_offset = (y / 2) * self.uv_stride + (x / 2) * 4;
        return .{
            .y = std.mem.readInt(u16, self.y[luma_offset..][0..2], .little),
            .u = std.mem.readInt(u16, self.uv[chroma_offset..][0..2], .little),
            .v = std.mem.readInt(u16, self.uv[chroma_offset + 2 ..][0..2], .little),
        };
    }

    /// Normalizes one container to a ten-bit code. P010 drops the six unused
    /// low bits; P016 rounds `value * 1023 / 65535` to nearest.
    fn code10(self: View, value: u16) u16 {
        return switch (self.layout) {
            .p010 => value >> 6,
            .p016 => @intCast((@as(u32, value) * 1023 + 32767) / 65535),
        };
    }

    /// Converts the pixel at (x, y) to RGB in the encoded domain of the matrix
    /// (gamma/PQ values are not decoded). Results are clamped to [0,1].
    pub fn read_rgb(self: View, x: usize, y: usize, space: colorspace.Colorspace) Error![3]f32 {
        const matrix = colorspace.ycbcr_matrix(space, self.height, 10) orelse return error.UnsupportedColorspace;
        const s = try self.sample(x, y);
        const ycc = [3]f32{
            @as(f32, @floatFromInt(self.code10(s.y))) / 1023.0,
            @as(f32, @floatFromInt(self.code10(s.u))) / 1023.0,
            @as(f32, @floatFromInt(self.code10(s.v))) / 1023.0,
        };
        const rgb = matrix.apply(ycc);
        return .{ std.math.clamp(rgb[0], 0.0, 1.0), std.math.clamp(rgb[1], 0.0, 1.0), std.math.clamp(rgb[2], 0.0, 1.0) };
    }

    /// Writes every pixel as eight-bit RGB into a byte-format surface view.
    /// Extents must match exactly. Alpha is written as opaque.
    pub fn convert_into(self: View, destination: surface.View, space: colorspace.Colorspace) Error!void {
        if (destination.width != self.width or destination.height != self.height) return error.InvalidSize;
        for (0..self.height) |y| {
            for (0..self.width) |x| {
                const rgb = try self.read_rgb(x, y, space);
                try destination.write(x, y, .{
                    .r = @intFromFloat(@round(rgb[0] * 255.0)),
                    .g = @intFromFloat(@round(rgb[1] * 255.0)),
                    .b = @intFromFloat(@round(rgb[2] * 255.0)),
                    .a = 255,
                });
            }
        }
    }

    /// Writes every pixel into a wide RGB layout (e.g. XBGR2101010, RGB48-like
    /// float layouts). `bytes` must hold `height` rows of `stride` bytes.
    pub fn convert_into_wide(self: View, layout: pixels_wide.Layout, bytes: []u8, stride: usize, space: colorspace.Colorspace) Error!void {
        const row = std.math.mul(usize, self.width, layout.bytes_per_pixel()) catch return error.Overflow;
        if (self.width != 0 and self.height != 0) {
            if (stride < row) return error.InvalidBuffer;
            const size = std.math.add(usize, std.math.mul(usize, self.height - 1, stride) catch return error.Overflow, row) catch return error.Overflow;
            if (bytes.len < size) return error.InvalidBuffer;
        }
        for (0..self.height) |y| {
            for (0..self.width) |x| {
                const rgb = try self.read_rgb(x, y, space);
                const offset = y * stride + x * layout.bytes_per_pixel();
                try layout.write(bytes[offset..], .{ .r = rgb[0], .g = rgb[1], .b = rgb[2] });
            }
        }
    }
};

/// Owned P010/P016 storage with tightly packed rows (stride = width * 2 for
/// luma, ceil(width/2) * 4 for chroma).
pub const Image = struct {
    allocator: std.mem.Allocator,
    layout: Layout,
    width: u31,
    height: u31,
    y: []u8,
    uv: []u8,

    /// Allocates zeroed planes; zero-size images allocate nothing.
    pub fn init(allocator: std.mem.Allocator, layout: Layout, width: u31, height: u31) Error!Image {
        const luma_size = std.math.mul(usize, std.math.mul(usize, width, 2) catch return error.Overflow, height) catch return error.Overflow;
        const chroma_row = std.math.mul(usize, (@as(usize, width) + 1) / 2, 4) catch return error.Overflow;
        const chroma_size = std.math.mul(usize, chroma_row, (@as(usize, height) + 1) / 2) catch return error.Overflow;
        const y = try allocator.alloc(u8, luma_size);
        errdefer allocator.free(y);
        const uv = try allocator.alloc(u8, chroma_size);
        @memset(y, 0);
        @memset(uv, 0);
        return .{ .allocator = allocator, .layout = layout, .width = width, .height = height, .y = y, .uv = uv };
    }

    /// Borrows the planes as a checked view. The view must not outlive the image.
    pub fn view(self: Image) Error!View {
        const luma_row = @as(usize, self.width) * 2;
        const chroma_row = ((@as(usize, self.width) + 1) / 2) * 4;
        return View.init(self.layout, self.width, self.height, self.y, luma_row, self.uv, chroma_row);
    }

    /// Frees both planes.
    pub fn deinit(self: *Image) void {
        self.allocator.free(self.y);
        self.allocator.free(self.uv);
        self.* = undefined;
    }
};
