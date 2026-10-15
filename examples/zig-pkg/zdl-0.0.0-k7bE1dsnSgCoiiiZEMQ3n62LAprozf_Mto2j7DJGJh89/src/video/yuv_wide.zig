//! Sixteen-bit YCbCr: semi-planar P010 and P016 (one interleaved chroma plane),
//! and planar I0FL and I4FL (separate U and V planes). Borrowed plane views,
//! owned images and conversion to RGB through the matrices from `colorspace.zig`.
//! Altered native port of the P010 paths of SDL_yuv.c and the 16-bit scalar
//! routines in yuv2rgb (yuv_rgb_std.c, YUV_BITS = 16 for I0FL/I4FL and 10 for
//! P010). Built beside `yuv.zig`, not inside it, because samples here are 16-bit
//! containers.
//!
//! Layout: P010 and P016 keep one luma plane of `u16` samples and one interleaved
//! chroma plane holding U then V per 2x2 block. P010 keeps the ten significant
//! bits in the top bits of each container (value << 6), as SDL does; P016 uses
//! all sixteen. I0FL (4:2:0) and I4FL (4:4:4) store full-width `u16` Y, U and V
//! planes. SDL's "FL" suffix names these 16-bit integer containers; they are not
//! half-float samples.
//!
//! Deliberate differences from SDL:
//! - Samples are little-endian explicitly; SDL uses host order.
//! - P016 and I0FL/I4FL codes are normalized by 65535 and use the float matrices
//!   from `colorspace.ycbcr_matrix_for_depth`: offsets are the exact sixteen-bit
//!   levels, and limited-range gains are rescaled from the 8- or 10-bit table.
//!   SDL has no P016 path, and its 16-bit scalar routine applies the 8-bit black
//!   level to 16-bit codes before clamping.
//! - P010 uses the same depth-aware matrix. Earlier code used the 8-bit BT.601/709
//!   tables with 10-bit codes, shifting neutral chroma by about 0.002.
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

    /// Normalizes one container to [0, 1]. P010 drops the six unused low bits and
    /// divides by 1023; P016 divides the full sixteen-bit code by 65535.
    fn normalize(self: View, value: u16) f32 {
        return switch (self.layout) {
            .p010 => @as(f32, @floatFromInt(value >> 6)) / 1023.0,
            .p016 => @as(f32, @floatFromInt(value)) / 65535.0,
        };
    }

    /// Converts the pixel at (x, y) to RGB in the encoded domain of the matrix
    /// (gamma/PQ values are not decoded). Results are clamped to [0,1].
    pub fn read_rgb(self: View, x: usize, y: usize, space: colorspace.Colorspace) Error![3]f32 {
        const bits: u8 = switch (self.layout) {
            .p010 => 10,
            .p016 => 16,
        };
        const matrix = colorspace.ycbcr_matrix_for_depth(space, self.height, bits) orelse return error.UnsupportedColorspace;
        const s = try self.sample(x, y);
        const ycc = [3]f32{ self.normalize(s.y), self.normalize(s.u), self.normalize(s.v) };
        return clamp_rgb(matrix.apply(ycc));
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

fn clamp_rgb(rgb: [3]f32) [3]f32 {
    return .{ std.math.clamp(rgb[0], 0.0, 1.0), std.math.clamp(rgb[1], 0.0, 1.0), std.math.clamp(rgb[2], 0.0, 1.0) };
}

/// Checks one plane: `rows` rows of `row_bytes` meaningful bytes at `stride`.
/// Zero-size planes need no storage.
fn check_plane(len: usize, row_bytes: usize, rows: usize, stride: usize) Error!void {
    if (row_bytes == 0 or rows == 0) return;
    if (stride < row_bytes) return error.InvalidBuffer;
    const size = std.math.add(usize, std.math.mul(usize, rows - 1, stride) catch return error.Overflow, row_bytes) catch return error.Overflow;
    if (len < size) return error.InvalidBuffer;
}

/// Planar sixteen-bit subsampling: I0FL is 4:2:0 and I4FL is 4:4:4.
pub const PlanarFormat = enum {
    i0fl,
    i4fl,

    /// Chroma samples per row for a luma width.
    pub fn chroma_width(self: PlanarFormat, width: usize) usize {
        return switch (self) {
            .i0fl => (width + 1) / 2,
            .i4fl => width,
        };
    }

    /// Chroma rows for a luma height.
    pub fn chroma_height(self: PlanarFormat, height: usize) usize {
        return switch (self) {
            .i0fl => (height + 1) / 2,
            .i4fl => height,
        };
    }
};

/// Borrowed planar 16-bit storage. Y, U and V each have an independent byte
/// stride, and every sample is a little-endian `u16`. The strides and buffer
/// sizes are checked once in `init`.
pub const Planar = struct {
    format: PlanarFormat,
    width: u31,
    height: u31,
    y: []const u8,
    y_stride: usize,
    u: []const u8,
    u_stride: usize,
    v: []const u8,
    v_stride: usize,

    /// Validates every plane's row stride and extent. Zero-sized views are valid.
    pub fn init(format: PlanarFormat, width: u31, height: u31, y: []const u8, y_stride: usize, u: []const u8, u_stride: usize, v: []const u8, v_stride: usize) Error!Planar {
        const luma_row = std.math.mul(usize, width, 2) catch return error.Overflow;
        const chroma_row = std.math.mul(usize, format.chroma_width(width), 2) catch return error.Overflow;
        try check_plane(y.len, luma_row, height, y_stride);
        try check_plane(u.len, chroma_row, format.chroma_height(height), u_stride);
        try check_plane(v.len, chroma_row, format.chroma_height(height), v_stride);
        return .{ .format = format, .width = width, .height = height, .y = y, .y_stride = y_stride, .u = u, .u_stride = u_stride, .v = v, .v_stride = v_stride };
    }

    /// Reads raw containers for pixel (x, y). I0FL chroma is the 2x2 block origin.
    pub fn sample(self: Planar, x: usize, y: usize) Error!Sample {
        if (x >= self.width or y >= self.height) return error.OutOfBounds;
        const chroma_x = switch (self.format) {
            .i0fl => x / 2,
            .i4fl => x,
        };
        const chroma_y = switch (self.format) {
            .i0fl => y / 2,
            .i4fl => y,
        };
        return .{
            .y = std.mem.readInt(u16, self.y[y * self.y_stride + x * 2 ..][0..2], .little),
            .u = std.mem.readInt(u16, self.u[chroma_y * self.u_stride + chroma_x * 2 ..][0..2], .little),
            .v = std.mem.readInt(u16, self.v[chroma_y * self.v_stride + chroma_x * 2 ..][0..2], .little),
        };
    }

    /// Converts the pixel at (x, y) to RGB in the matrix's encoded domain, using
    /// codes normalized by 65535 and clamped to [0,1].
    pub fn read_rgb(self: Planar, x: usize, y: usize, space: colorspace.Colorspace) Error![3]f32 {
        const matrix = colorspace.ycbcr_matrix_for_depth(space, self.height, 16) orelse return error.UnsupportedColorspace;
        const s = try self.sample(x, y);
        const ycc = [3]f32{
            @as(f32, @floatFromInt(s.y)) / 65535.0,
            @as(f32, @floatFromInt(s.u)) / 65535.0,
            @as(f32, @floatFromInt(s.v)) / 65535.0,
        };
        return clamp_rgb(matrix.apply(ycc));
    }

    /// Writes every pixel as eight-bit RGB into a byte-format surface view.
    /// Extents must match exactly. Alpha is written as opaque.
    pub fn convert_into(self: Planar, destination: surface.View, space: colorspace.Colorspace) Error!void {
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
};

/// Owned I0FL or I4FL storage with tightly packed rows (each sample two bytes).
pub const PlanarImage = struct {
    allocator: std.mem.Allocator,
    format: PlanarFormat,
    width: u31,
    height: u31,
    y: []u8,
    u: []u8,
    v: []u8,

    /// Allocates zeroed planes; zero-size images allocate nothing.
    pub fn init(allocator: std.mem.Allocator, format: PlanarFormat, width: u31, height: u31) Error!PlanarImage {
        const luma_size = std.math.mul(usize, std.math.mul(usize, width, 2) catch return error.Overflow, height) catch return error.Overflow;
        const chroma_row = std.math.mul(usize, format.chroma_width(width), 2) catch return error.Overflow;
        const chroma_size = std.math.mul(usize, chroma_row, format.chroma_height(height)) catch return error.Overflow;
        const y = try allocator.alloc(u8, luma_size);
        errdefer allocator.free(y);
        const u = try allocator.alloc(u8, chroma_size);
        errdefer allocator.free(u);
        const v = try allocator.alloc(u8, chroma_size);
        @memset(y, 0);
        @memset(u, 0);
        @memset(v, 0);
        return .{ .allocator = allocator, .format = format, .width = width, .height = height, .y = y, .u = u, .v = v };
    }

    /// Borrows the three planes as a checked view. The view must not outlive the image.
    pub fn view(self: PlanarImage) Error!Planar {
        const luma_row = @as(usize, self.width) * 2;
        const chroma_row = self.format.chroma_width(self.width) * 2;
        return Planar.init(self.format, self.width, self.height, self.y, luma_row, self.u, chroma_row, self.v, chroma_row);
    }

    /// Frees all three planes.
    pub fn deinit(self: *PlanarImage) void {
        self.allocator.free(self.y);
        self.allocator.free(self.u);
        self.allocator.free(self.v);
        self.* = undefined;
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

fn put_u16(bytes: []u8, offset: usize, value: u16) void {
    std.mem.writeInt(u16, bytes[offset..][0..2], value, .little);
}

test "P016 normalizes all sixteen bits" {
    const gpa = std.testing.allocator;
    var image = try Image.init(gpa, .p016, 4, 2);
    defer image.deinit();
    @memset(image.y, 0);
    for (0..2) |row| for (0..4) |x| put_u16(image.y, row * 8 + x * 2, 0x8000);
    for (0..1) |row| for (0..2) |pair| {
        put_u16(image.uv, row * 8 + pair * 4, 0x8000);
        put_u16(image.uv, row * 8 + pair * 4 + 2, 0x8000);
    };
    const view = try image.view();
    // Mid-gray luma and chroma stay mid-gray under BT.709 full range.
    const gray = try view.read_rgb(3, 1, colorspace.bt709_full);
    for (gray) |component| try std.testing.expectApproxEqAbs(@as(f32, 0.5), component, 0.002);

    // Full-scale luma is 1.0 in every channel after clamping.
    put_u16(image.y, 0, 0xffff);
    const white = try (try image.view()).read_rgb(0, 0, colorspace.bt709_full);
    for (white) |component| try std.testing.expectApproxEqAbs(@as(f32, 1.0), component, 0.002);
}

test "I0FL and I4FL sample addressing uses independent planes" {
    const gpa = std.testing.allocator;
    var image = try PlanarImage.init(gpa, .i0fl, 5, 3);
    defer image.deinit();
    for (0..3) |y| for (0..5) |x| put_u16(image.y, y * 10 + x * 2, @intCast(y * 5 + x));
    for (0..2) |cy| for (0..3) |cx| {
        put_u16(image.u, cy * 6 + cx * 2, @intCast(100 + cx + 10 * cy));
        put_u16(image.v, cy * 6 + cx * 2, @intCast(200 + cx + 10 * cy));
    };
    const view = try image.view();
    const far = try view.sample(4, 2);
    try std.testing.expectEqual(@as(u16, 14), far.y);
    try std.testing.expectEqual(@as(u16, 112), far.u);
    try std.testing.expectEqual(@as(u16, 212), far.v);
    const shared = try view.sample(3, 0);
    try std.testing.expectEqual(@as(u16, 3), shared.y);
    try std.testing.expectEqual(@as(u16, 101), shared.u);

    var full = try PlanarImage.init(gpa, .i4fl, 5, 3);
    defer full.deinit();
    for (0..3) |y| for (0..5) |x| {
        put_u16(full.u, y * 10 + x * 2, @intCast(50 + x + 10 * y));
        put_u16(full.v, y * 10 + x * 2, @intCast(60 + x + 10 * y));
    };
    const full_view = try full.view();
    const corner = try full_view.sample(4, 2);
    try std.testing.expectEqual(@as(u16, 74), corner.u);
    try std.testing.expectEqual(@as(u16, 84), corner.v);
}

test "planar 16-bit matches semi-planar on uniform frames" {
    const gpa = std.testing.allocator;
    var semi = try Image.init(gpa, .p016, 5, 3);
    defer semi.deinit();
    const luma: u16 = 0x3c00;
    const chroma_u: u16 = 0x9000;
    const chroma_v: u16 = 0x6800;
    for (0..semi.y.len / 2) |index| put_u16(semi.y, index * 2, luma);
    for (0..semi.uv.len / 4) |index| {
        put_u16(semi.uv, index * 4, chroma_u);
        put_u16(semi.uv, index * 4 + 2, chroma_v);
    }
    var planar = try PlanarImage.init(gpa, .i0fl, 5, 3);
    defer planar.deinit();
    for (0..planar.y.len / 2) |index| put_u16(planar.y, index * 2, luma);
    for (0..planar.u.len / 2) |index| {
        put_u16(planar.u, index * 2, chroma_u);
        put_u16(planar.v, index * 2, chroma_v);
    }
    const semi_view = try semi.view();
    const planar_view = try planar.view();
    for (0..3) |y| for (0..5) |x| {
        const expected = try semi_view.read_rgb(x, y, colorspace.bt2020_full);
        const actual = try planar_view.read_rgb(x, y, colorspace.bt2020_full);
        try std.testing.expectEqual(expected, actual);
    };

    var surface_out = try surface.Surface.init(gpa, 5, 3, .rgba8, null);
    defer surface_out.deinit();
    try planar_view.convert_into(surface_out.view, colorspace.bt2020_full);
    try std.testing.expectEqual(@as(u8, 255), (try surface_out.view.read(0, 0)).a);
}

test "zero-sized planar images need no storage" {
    const gpa = std.testing.allocator;
    var image = try PlanarImage.init(gpa, .i4fl, 0, 0);
    defer image.deinit();
    const view = try image.view();
    try std.testing.expectEqual(@as(u31, 0), view.width);
    try std.testing.expectError(error.OutOfBounds, view.sample(0, 0));
}

test "limited-range black and white are exact at 10 and 16 bits" {
    const gpa = std.testing.allocator;
    // 16-bit limited levels are 16 << 8 (black) and 235 << 8 (white).
    var semi = try Image.init(gpa, .p016, 2, 2);
    defer semi.deinit();
    @memset(semi.uv, 0);
    for (0..semi.uv.len / 2) |index| put_u16(semi.uv, index * 2, 0x8000);
    for (0..semi.y.len / 2) |index| put_u16(semi.y, index * 2, 4096);
    var view = try semi.view();
    const black = try view.read_rgb(0, 0, colorspace.bt709_limited);
    for (black) |component| try std.testing.expectApproxEqAbs(@as(f32, 0.0), component, 1e-5);
    for (0..semi.y.len / 2) |index| put_u16(semi.y, index * 2, 60160);
    view = try semi.view();
    const white = try view.read_rgb(1, 1, colorspace.bt709_limited);
    for (white) |component| try std.testing.expectApproxEqAbs(@as(f32, 1.0), component, 1e-5);

    // 10-bit limited levels are 64 and 940 in P010's six-bit-shifted containers.
    var ten = try Image.init(gpa, .p010, 2, 2);
    defer ten.deinit();
    @memset(ten.uv, 0);
    for (0..ten.uv.len / 2) |index| put_u16(ten.uv, index * 2, 512 << 6);
    for (0..ten.y.len / 2) |index| put_u16(ten.y, index * 2, 64 << 6);
    const ten_view = try ten.view();
    const ten_black = try ten_view.read_rgb(0, 0, colorspace.bt709_limited);
    for (ten_black) |component| try std.testing.expectApproxEqAbs(@as(f32, 0.0), component, 1e-5);
    for (0..ten.y.len / 2) |index| put_u16(ten.y, index * 2, 940 << 6);
    const ten_white = try (try ten.view()).read_rgb(0, 0, colorspace.bt709_limited);
    for (ten_white) |component| try std.testing.expectApproxEqAbs(@as(f32, 1.0), component, 1e-5);
}

test "neutral chroma stays gray for BT.709 at 10 bits" {
    const gpa = std.testing.allocator;
    var ten = try Image.init(gpa, .p010, 2, 2);
    defer ten.deinit();
    for (0..ten.y.len / 2) |index| put_u16(ten.y, index * 2, 512 << 6);
    for (0..ten.uv.len / 2) |index| put_u16(ten.uv, index * 2, 512 << 6);
    const rgb = try (try ten.view()).read_rgb(1, 1, colorspace.bt709_full);
    const expected: f32 = 512.0 / 1023.0;
    for (rgb) |component| try std.testing.expectApproxEqAbs(expected, component, 1e-5);
}
