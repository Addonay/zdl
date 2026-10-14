//! Checked eight-bit YCbCr planes and scalar RGB conversion.
//! Altered native port of SDL_yuv.c and yuv2rgb's scalar conversion routines.
//! Fixed coefficients preserve the reference six-bit precision, without a clamp
//! lookup table or one generated function per RGB/YUV storage combination.
//! No transfer-function / primaries / HDR conversion is implied by a matrix.
// Coefficient tables and scalar math: Copyright (c) 2016 Adrien Descamps.
// BSD 3-Clause license; complete notice is in docs/licenses/yuv2rgb.txt.
const std = @import("std");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");

pub const Error = surface.Error || error{ InvalidLayout, OverlappingBuffers };
/// Byte storage organization. Planar U/V order is expressed by their slices,
/// so IYUV/YV12 need no separate semantic format. Packed pairs include storage
/// for both lumas even when the final image width is odd.
pub const Layout = enum {
    planar420,
    planar422,
    planar444,
    nv12,
    nv21,
    yuy2,
    uyvy,
    yvyu,
    fn horizontal(self: Layout) usize {
        return if (self == .planar444) 1 else 2;
    }
    fn vertical(self: Layout) usize {
        return switch (self) {
            .planar420, .nv12, .nv21 => 2,
            else => 1,
        };
    }
    fn is_packed(self: Layout) bool {
        return self == .yuy2 or self == .uyvy or self == .yvyu;
    }
    fn semiplanar(self: Layout) bool {
        return self == .nv12 or self == .nv21;
    }
};
/// Explicit matrix/range choice; never guessed from resolution or global hints.
/// BT.2020 here is non-constant-luminance coefficient math on eight-bit samples,
/// not ten-bit/HDR storage or transfer-function conversion.
pub const Encoding = enum { bt601_full, bt601_limited, bt709_full, bt709_limited, bt2020_ncl_full };
/// One encoded pixel and its shared chroma. This is not RGB color.
pub const Sample = struct { y: u8, u: u8, v: u8 };
/// Read-only borrowed plane, with an independent byte stride. Final-row padding
/// need not be present. Plane buffers must outlive every view derived from them.
pub const Plane = struct {
    data: []const u8,
    stride: usize,
    fn validate(self: Plane, row_bytes: usize, rows: usize) Error!void {
        if (self.stride < row_bytes) return error.InvalidBuffer;
        const prefix = if (rows == 0 or row_bytes == 0) 0 else try multiply(rows - 1, self.stride);
        const required = if (rows == 0 or row_bytes == 0) 0 else std.math.add(usize, prefix, row_bytes) catch return error.Overflow;
        if (self.data.len < required) return error.InvalidBuffer;
    }
};
/// Native storage variants, checked against Layout at View.init.
pub const Storage = union(enum) {
    planar: struct { y: Plane, u: Plane, v: Plane },
    semiplanar: struct { y: Plane, uv: Plane },
    interleaved: Plane,
};

/// Validated, read-only image borrow. Plane strides can differ and subsampled
/// extents round upwards, admitting odd dimensions without pointer underflow.
pub const View = struct {
    width: u31,
    height: u31,
    layout: Layout,
    storage: Storage,

    /// Validates storage kind, plane extents, capacities and strides.
    pub fn init(width: u31, height: u31, layout: Layout, storage: Storage) Error!View {
        const cw = chroma_width(width, layout);
        const ch = chroma_height(height, layout);
        switch (storage) {
            .interleaved => |plane| {
                if (!layout.is_packed()) return error.InvalidLayout;
                try plane.validate(try multiply(cw, 4), height);
            },
            .semiplanar => |planes| {
                if (!layout.semiplanar()) return error.InvalidLayout;
                try planes.y.validate(width, height);
                try planes.uv.validate(try multiply(cw, 2), ch);
            },
            .planar => |planes| {
                if (layout.is_packed() or layout.semiplanar()) return error.InvalidLayout;
                try planes.y.validate(width, height);
                try planes.u.validate(cw, ch);
                try planes.v.validate(cw, ch);
            },
        }
        return .{ .width = width, .height = height, .layout = layout, .storage = storage };
    }

    /// Reads encoded components. Chroma uses nearest block membership; no
    /// implicit centered/cosited interpolation is performed.
    pub fn sample(self: View, x: usize, y: usize) Error!Sample {
        if (x >= self.width or y >= self.height) return error.OutOfBounds;
        const cx = x / self.layout.horizontal();
        const cy = y / self.layout.vertical();
        return switch (self.storage) {
            .planar => |planes| .{ .y = planes.y.data[y * planes.y.stride + x], .u = planes.u.data[cy * planes.u.stride + cx], .v = planes.v.data[cy * planes.v.stride + cx] },
            .semiplanar => |planes| blk: {
                const pair = planes.uv.data[cy * planes.uv.stride + cx * 2 ..][0..2];
                break :blk .{ .y = planes.y.data[y * planes.y.stride + x], .u = pair[if (self.layout == .nv12) 0 else 1], .v = pair[if (self.layout == .nv12) 1 else 0] };
            },
            .interleaved => |plane| blk: {
                const pair = plane.data[y * plane.stride + cx * 4 ..][0..4];
                const second = x % 2;
                break :blk switch (self.layout) {
                    .yuy2 => .{ .y = pair[second * 2], .u = pair[1], .v = pair[3] },
                    .uyvy => .{ .y = pair[second * 2 + 1], .u = pair[0], .v = pair[2] },
                    .yvyu => .{ .y = pair[second * 2], .u = pair[3], .v = pair[1] },
                    else => unreachable,
                };
            },
        };
    }

    /// Decodes one pixel to opaque RGB using explicit scalar coefficients.
    pub fn read(self: View, x: usize, y: usize, encoding: Encoding) Error!pixels.Color {
        return to_rgb(try self.sample(x, y), encoding);
    }

    /// Converts into a matching-size raster, including packed/indexed targets.
    /// Source/destination byte overlap is rejected before writes; no allocation
    /// occurs. Padding is untouched. Pixel errors can leave a partial conversion.
    pub fn convert_into(self: View, destination: surface.View, encoding: Encoding) Error!void {
        if (destination.width != self.width or destination.height != self.height) return error.InvalidSize;
        const planes = self.plane_list();
        for (planes) |plane| if (overlaps(destination.data, plane.data)) return error.OverlappingBuffers;
        for (0..self.height) |y| for (0..self.width) |x| try destination.write(x, y, try self.read(x, y, encoding));
    }

    /// Allocates a raster in the requested native RGB representation. Palette
    /// ownership follows Surface's borrowing contract. Failed conversion frees
    /// the incomplete raster; YCbCr planes remain borrowed and unchanged.
    pub fn to_surface(self: View, allocator: std.mem.Allocator, encoding: Encoding, format: pixels.Format, palette: ?[]const pixels.Color) Error!surface.Surface {
        var result = try surface.Surface.init(allocator, self.width, self.height, format, palette);
        errdefer result.deinit();
        try self.convert_into(result.view, encoding);
        return result;
    }

    fn plane_list(self: View) [3]Plane {
        const empty: Plane = .{ .data = &.{}, .stride = 0 };
        return switch (self.storage) {
            .planar => |value| .{ value.y, value.u, value.v },
            .semiplanar => |value| .{ value.y, value.uv, empty },
            .interleaved => |value| .{ value, empty, empty },
        };
    }
};

/// Owns tightly packed YCbCr storage in one allocation. The read-only view and
/// writable plane slices borrow that allocation. Do not copy the owner; views
/// expire at deinit. Zero dimensions are valid, with no accessible pixels.
pub const Image = struct {
    allocator: std.mem.Allocator,
    data: []u8,
    view: View,
    writable: [3][]u8,

    /// Allocates a zeroed image. To initialize neutral chroma / legal black,
    /// encode a raster; zero bytes alone do not mean black in every encoding.
    pub fn init(allocator: std.mem.Allocator, width: u31, height: u31, layout: Layout) Error!Image {
        const cw = chroma_width(width, layout);
        const ch = chroma_height(height, layout);
        const strides = [3]usize{ if (layout.is_packed()) try multiply(cw, 4) else width, if (layout.is_packed()) 0 else if (layout.semiplanar()) try multiply(cw, 2) else cw, if (layout.is_packed() or layout.semiplanar()) 0 else cw };
        const lengths = [3]usize{ try multiply(strides[0], height), try multiply(strides[1], ch), try multiply(strides[2], ch) };
        const first_two = std.math.add(usize, lengths[0], lengths[1]) catch return error.Overflow;
        const total = std.math.add(usize, first_two, lengths[2]) catch return error.Overflow;
        const data = try allocator.alloc(u8, total);
        errdefer allocator.free(data);
        @memset(data, 0);
        const writable = [3][]u8{ data[0..lengths[0]], data[lengths[0]..first_two], data[first_two..] };
        const planes = [3]Plane{ .{ .data = writable[0], .stride = strides[0] }, .{ .data = writable[1], .stride = strides[1] }, .{ .data = writable[2], .stride = strides[2] } };
        const storage: Storage = if (layout.is_packed()) .{ .interleaved = planes[0] } else if (layout.semiplanar()) .{ .semiplanar = .{ .y = planes[0], .uv = planes[1] } } else .{ .planar = .{ .y = planes[0], .u = planes[1], .v = planes[2] } };
        return .{ .allocator = allocator, .data = data, .view = try View.init(width, height, layout, storage), .writable = writable };
    }

    /// Copies plane bytes into tightly packed owned storage, preserving encoded
    /// values and subsampling. Independent source row padding is not copied.
    pub fn copy(allocator: std.mem.Allocator, source: View) Error!Image {
        var result = try Image.init(allocator, source.width, source.height, source.layout);
        errdefer result.deinit();
        const inputs = source.plane_list();
        const outputs = result.view.plane_list();
        for (inputs, outputs, result.writable) |input, output, bytes| {
            if (output.stride == 0) continue;
            const rows = bytes.len / output.stride;
            for (0..rows) |row| @memcpy(bytes[row * output.stride ..][0..output.stride], input.data[row * input.stride ..][0..output.stride]);
        }
        return result;
    }

    /// Encodes RGB byte colors into an owned YCbCr image. Alpha is discarded;
    /// callers composite beforehand if required. Chroma averages the actual
    /// available pixels in each subsampling block, including odd final edges.
    /// Fixed coefficient products are averaged before clamping/quantization.
    pub fn from_surface(allocator: std.mem.Allocator, source: surface.View, layout: Layout, encoding: Encoding) Error!Image {
        var result = try Image.init(allocator, source.width, source.height, layout);
        errdefer result.deinit();
        const factors = encode_factors(encoding);
        const bw = layout.horizontal();
        const bh = layout.vertical();
        var y: usize = 0;
        while (y < source.height) : (y += bh) {
            var x: usize = 0;
            while (x < source.width) : (x += bw) {
                var sum_u: i32 = 0;
                var sum_v: i32 = 0;
                var count: i32 = 0;
                const rows = @min(bh, @as(usize, source.height) - y);
                const columns = @min(bw, @as(usize, source.width) - x);
                for (0..rows) |dy| for (0..columns) |dx| {
                    const color = try source.read(x + dx, y + dy);
                    const luma = product(factors.matrix[0], color);
                    sum_u += product(factors.matrix[1], color);
                    sum_v += product(factors.matrix[2], color);
                    count += 1;
                    result.write_y(x + dx, y + dy, clamp(luma + @as(i32, factors.offset) * 64));
                };
                result.write_uv(x / bw, y / bh, clamp(@divTrunc(sum_u, count) + 128 * 64), clamp(@divTrunc(sum_v, count) + 128 * 64));
                // The last packed pair has a non-image luma slot. Repeat its
                // visible partner rather than exposing arbitrary uninitialized
                // data to consumers that upload complete packed pairs.
                if (layout.is_packed() and columns == 1) {
                    const color = try source.read(x, y);
                    result.write_y(x + 1, y, clamp(product(factors.matrix[0], color) + @as(i32, factors.offset) * 64));
                }
            }
        }
        return result;
    }

    /// Releases every plane in the single owned allocation and invalidates self.
    pub fn deinit(self: *Image) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }

    fn write_y(self: *Image, x: usize, y: usize, value: u8) void {
        const plane = self.view.plane_list()[0];
        const offset = if (self.view.layout.is_packed()) y * plane.stride + (x / 2) * 4 + (x % 2) * 2 + @as(usize, if (self.view.layout == .uyvy) 1 else 0) else y * plane.stride + x;
        self.writable[0][offset] = value;
    }
    fn write_uv(self: *Image, x: usize, y: usize, u: u8, v: u8) void {
        const layout = self.view.layout;
        const planes = self.view.plane_list();
        if (layout.is_packed()) {
            const offset = y * planes[0].stride + x * 4;
            self.writable[0][offset + @as(usize, if (layout == .uyvy) 0 else if (layout == .yuy2) 1 else 3)] = u;
            self.writable[0][offset + @as(usize, if (layout == .uyvy) 2 else if (layout == .yuy2) 3 else 1)] = v;
        } else if (layout.semiplanar()) {
            const offset = y * planes[1].stride + x * 2;
            self.writable[1][offset + @as(usize, if (layout == .nv12) 0 else 1)] = u;
            self.writable[1][offset + @as(usize, if (layout == .nv12) 1 else 0)] = v;
        } else {
            self.writable[1][y * planes[1].stride + x] = u;
            self.writable[2][y * planes[2].stride + x] = v;
        }
    }
};

/// Converts encoded components to opaque byte RGB. Products use the reference
/// six fractional bits, floor division, and explicit saturation. Replacing its
/// clamp LUT also handles extreme matrix values without wrapping LUT indices.
pub fn to_rgb(sample: Sample, encoding: Encoding) pixels.Color {
    const factors = decode_factors(encoding);
    const y = (@as(i32, sample.y) - factors[0]) * factors[1];
    const u = @as(i32, sample.u) - 128;
    const v = @as(i32, sample.v) - 128;
    return .{ .r = clamp(y + v * factors[2]), .g = clamp(y + u * factors[3] + v * factors[4]), .b = clamp(y + u * factors[5]) };
}

// Original YUV2RGB and RGB2YUV coefficients from yuv_rgb_internal.h. Preserve
// V(x)=trunc(x*64+0.5) and apply negative signs outside V, as the source does.
fn coefficient(comptime value: comptime_float) i32 {
    return @intFromFloat(value * 64 + 0.5);
}
fn decode_factors(encoding: Encoding) [6]i32 {
    return switch (encoding) {
        .bt601_full => .{ 0, 64, coefficient(1.402), -coefficient(0.3441), -coefficient(0.7141), coefficient(1.772) },
        .bt601_limited => .{ 16, coefficient(1.1644), coefficient(1.596), -coefficient(0.3918), -coefficient(0.813), coefficient(2.0172) },
        .bt709_full => .{ 0, 64, coefficient(1.581), -coefficient(0.1881), -coefficient(0.47), coefficient(1.8629) },
        .bt709_limited => .{ 16, coefficient(1.1644), coefficient(1.7927), -coefficient(0.2132), -coefficient(0.5329), coefficient(2.1124) },
        .bt2020_ncl_full => .{ 0, 64, coefficient(1.4760), -coefficient(0.1647), -coefficient(0.5719), coefficient(1.8832) },
    };
}
const EncodeFactors = struct { offset: u8, matrix: [3][3]i32 };
fn encode_factors(encoding: Encoding) EncodeFactors {
    return switch (encoding) {
        .bt601_full => .{ .offset = 0, .matrix = .{ .{ coefficient(0.299), coefficient(0.587), coefficient(0.114) }, .{ -coefficient(0.1687), -coefficient(0.3313), coefficient(0.5) }, .{ coefficient(0.5), -coefficient(0.4187), -coefficient(0.0813) } } },
        .bt601_limited => .{ .offset = 16, .matrix = .{ .{ coefficient(0.2568), coefficient(0.5041), coefficient(0.0979) }, .{ -coefficient(0.1482), -coefficient(0.291), coefficient(0.4392) }, .{ coefficient(0.4392), -coefficient(0.3678), -coefficient(0.0714) } } },
        .bt709_full => .{ .offset = 0, .matrix = .{ .{ coefficient(0.2126), coefficient(0.7152), coefficient(0.0722) }, .{ -coefficient(0.1141), -coefficient(0.3839), coefficient(0.498) }, .{ coefficient(0.498), -coefficient(0.4524), -coefficient(0.0457) } } },
        .bt709_limited => .{ .offset = 16, .matrix = .{ .{ coefficient(0.1826), coefficient(0.6142), coefficient(0.062) }, .{ -coefficient(0.1006), -coefficient(0.3386), coefficient(0.4392) }, .{ coefficient(0.4392), -coefficient(0.3989), -coefficient(0.0403) } } },
        .bt2020_ncl_full => .{ .offset = 0, .matrix = .{ .{ coefficient(0.2627), coefficient(0.6780), coefficient(0.0593) }, .{ -coefficient(0.1395), -coefficient(0.3600), coefficient(0.4995) }, .{ coefficient(0.4995), -coefficient(0.4593), -coefficient(0.0402) } } },
    };
}
fn product(matrix: [3]i32, color: pixels.Color) i32 {
    return matrix[0] * color.r + matrix[1] * color.g + matrix[2] * color.b;
}
fn clamp(value: i32) u8 {
    return @intCast(std.math.clamp(@divFloor(value, 64), 0, 255));
}
fn chroma_width(width: u31, layout: Layout) usize {
    return (@as(usize, width) + layout.horizontal() - 1) / layout.horizontal();
}
fn chroma_height(height: u31, layout: Layout) usize {
    return (@as(usize, height) + layout.vertical() - 1) / layout.vertical();
}
fn multiply(a: usize, b: usize) Error!usize {
    return std.math.mul(usize, a, b) catch error.Overflow;
}
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const first = @intFromPtr(a.ptr);
    const second = @intFromPtr(b.ptr);
    return if (first <= second) second - first < a.len else first - second < b.len;
}
