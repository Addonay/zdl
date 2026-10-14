//! Pixel conversion between byte, wide-float and YUV storage, with explicit
//! source and destination colorspaces and SDR white / HDR headroom options.
//!
//! Altered native port of SDL_surface.c (SDL_ConvertPixelsAndColorspace,
//! SDL_PremultiplyAlpha / SDL_PremultiplySurfaceAlpha, SDL_ClearSurface,
//! SDL_FlipSurface, SDL_ScaleSurface) and the routing of SDL_yuv.c
//! (SDL_ConvertPixels_YUV_to_RGB, RGB_to_YUV and YUV_to_YUV).
//!
//! Path selection, following SDL:
//! - Same FOURCC or same-colorspace repacks use `yuv_more.zig` (plane copies and
//!   8-bit 4:2:0/4:2:2 repacks). Other YUV pairs with equal colorspaces go
//!   through RGB, which SDL does not do for every pair.
//! - Identical byte or wide layouts with identical colorspaces are row copies.
//! - 8-bit YUV decodes with SDL's integer scalar coefficients (`yuv.to_rgb`) when
//!   the colorspace names an explicit matrix; otherwise it uses the float matrix
//!   from `colorspace.ycbcr_matrix`. P010 always uses the float matrix.
//! - Colorspace transfers and primaries apply through `pixels_wide.Pipeline`.
//!   As in SDL, 8-bit YUV and 8-bit RGB pass through an sRGB intermediate, while
//!   P010 and wide formats keep their own colorspace.
//!
//! Deliberate differences from SDL:
//! - Colorspaces are passed explicitly and optional; `null` selects SDL's default
//!   for the format (`Format.default_colorspace`), so no surface properties are read.
//! - 8-bit RGB -> YUV uses the float forward matrix (inverse of the decode
//!   matrix), not SDL's integer RGB2YUV tables. Expect differences of one code.
//! - Chroma for RGB -> YUV is the average of the block's per-pixel chroma values,
//!   the same rule SDL uses for 4:2:0 and 4:2:2 targets.
//! - Premultiplied 8-bit alpha uses SDL's integer formula
//!   `(alpha * channel) / 255` only when both colorspaces are sRGB; otherwise it
//!   computes in floats through a temporary RGBA float buffer.
//! - Unsupported FOURCC pairs fall back to RGB instead of failing. I0FL and I4FL
//!   (16-bit float planar YUV) are not implemented; see the porting notes.
const std = @import("std");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");
const colorspace = @import("colorspace.zig");
const pixels_wide = @import("pixels_wide.zig");
const yuv = @import("yuv.zig");
const yuv_more = @import("yuv_more.zig");

/// SDL FOURCC formats; see `yuv_more.Fourcc` for the memory order of planes.
pub const Fourcc = yuv_more.Fourcc;
/// Colorspace descriptor from `colorspace.zig`.
pub const Colorspace = colorspace.Colorspace;
/// Normalized floating-point pixel in encoded (transfer-applied) components.
pub const Linear = pixels_wide.Linear;
/// Pipeline options: SDR white point, HDR headroom and tone mapper overrides.
pub const Options = pixels_wide.Pipeline.Options;

/// Invalid geometry, storage, palette or colorspace, plus allocation failure.
pub const Error = pixels.Error || surface.Error || yuv_more.Error || std.mem.Allocator.Error || error{
    UnsupportedColorspace,
    UnsupportedFormat,
    InvalidSize,
};

/// Storage kind of a conversion endpoint.
pub const Format = union(enum) {
    bytes: pixels.Format,
    wide: pixels_wide.Layout,
    yuv: Fourcc,

    /// The colorspace SDL assigns when none is given (SDL_GetDefaultColorspaceForFormat).
    pub fn default_colorspace(self: Format) Colorspace {
        return switch (self) {
            .bytes => colorspace.srgb,
            .wide => |layout| wide_default(layout),
            .yuv => |fourcc| yuv_default(fourcc),
        };
    }
};

fn wide_default(layout: pixels_wide.Layout) Colorspace {
    return switch (layout) {
        .xrgb2101010, .xbgr2101010, .argb2101010, .abgr2101010 => colorspace.hdr10,
        .rgb48_float, .rgba64_float, .rgb96_float, .rgba128_float, .argb128_float, .bgra128_float, .abgr128_float => colorspace.srgb_linear,
        .rgb48, .rgba64 => colorspace.srgb,
    };
}

fn yuv_default(fourcc: Fourcc) Colorspace {
    // SDL: P010 defaults to HDR10; every 8-bit FOURCC defaults to BT.601 limited.
    return if (fourcc == .p010) colorspace.hdr10 else colorspace.bt601_limited;
}

/// Borrowed wide-float or 2101010 raster. Generic over the byte slice constness.
fn WideView(comptime Bytes: type) type {
    return struct {
        layout: pixels_wide.Layout,
        width: u31,
        height: u31,
        data: Bytes,
        stride: usize,

        const Self = @This();

        /// Validates stride and the extent of the last row, as surface.View does.
        pub fn init(layout: pixels_wide.Layout, width: u31, height: u31, data: Bytes, stride: usize) Error!Self {
            const row = std.math.mul(usize, width, layout.bytes_per_pixel()) catch return error.Overflow;
            if (width != 0 and height != 0) {
                if (stride < row) return error.InvalidBuffer;
                const prefix = std.math.mul(usize, height - 1, stride) catch return error.Overflow;
                const required = std.math.add(usize, prefix, row) catch return error.Overflow;
                if (data.len < required) return error.InvalidBuffer;
            }
            return .{ .layout = layout, .width = width, .height = height, .data = data, .stride = stride };
        }

        fn offset(self: Self, x: usize, y: usize) usize {
            return y * self.stride + x * self.layout.bytes_per_pixel();
        }

        /// Reads one pixel as normalized linear components in its own colorspace.
        pub fn read(self: Self, x: usize, y: usize) Error!Linear {
            if (x >= self.width or y >= self.height) return error.OutOfBounds;
            const start = self.offset(x, y);
            return self.layout.read(self.data[start..]);
        }

        /// Writes one pixel, clamping integer components as the layout does.
        /// Only instances with mutable storage may call this.
        pub fn write(self: Self, x: usize, y: usize, value: Linear) Error!void {
            if (x >= self.width or y >= self.height) return error.OutOfBounds;
            const start = self.offset(x, y);
            try self.layout.write(self.data[start..], value);
        }
    };
}

/// Borrowed YUV image whose planes are in SDL's memory order (see `yuv_more`).
fn YuvBuffer(comptime Plane: type) type {
    return struct {
        fourcc: Fourcc,
        width: u31,
        height: u31,
        planes: [3]Plane,

        const Self = @This();

        /// Checks plane strides and lengths against the FOURCC's geometry.
        pub fn init(fourcc: Fourcc, width: u31, height: u31, planes: [3]Plane) Error!Self {
            try yuv_more.validate_lengths(fourcc, width, height, strides_of(planes), lengths_of(planes));
            return .{ .fourcc = fourcc, .width = width, .height = height, .planes = planes };
        }

        fn strides(self: Self) [3]usize {
            return strides_of(self.planes);
        }
    };
}

fn strides_of(planes: anytype) [3]usize {
    return .{ planes[0].stride, planes[1].stride, planes[2].stride };
}

fn lengths_of(planes: anytype) [3]usize {
    return .{ planes[0].data.len, planes[1].data.len, planes[2].data.len };
}

/// Read-only wide-float or 2101010 raster.
pub const WideSource = WideView([]const u8);
/// Writable wide-float or 2101010 raster.
pub const WideTarget = WideView([]u8);
/// Read-only YUV image.
pub const YuvSource = YuvBuffer(yuv_more.ConstPlane);
/// Writable YUV image.
pub const YuvTarget = YuvBuffer(yuv_more.Plane);

/// Where pixels come from. `solid` is a uniform color used by `clear`; it has no
/// extent and needs the destination's size.
pub const Source = union(enum) {
    bytes: surface.View,
    wide: WideSource,
    yuv: YuvSource,
    solid: Linear,

    fn size(self: Source) ?Dims {
        return switch (self) {
            .bytes => |view| .{ .width = view.width, .height = view.height },
            .wide => |view| .{ .width = view.width, .height = view.height },
            .yuv => |view| .{ .width = view.width, .height = view.height },
            .solid => null,
        };
    }

    fn default_colorspace(self: Source) Colorspace {
        return switch (self) {
            .bytes => colorspace.srgb,
            .wide => |view| wide_default(view.layout),
            .yuv => |view| yuv_default(view.fourcc),
            .solid => colorspace.srgb_linear,
        };
    }

    /// Storage slices for alias checks. Unused entries are empty.
    fn storage(self: Source) [3][]const u8 {
        return switch (self) {
            .bytes => |view| .{ view.data, &.{}, &.{} },
            .wide => |view| .{ view.data, &.{}, &.{} },
            .yuv => |view| .{ view.planes[0].data, view.planes[1].data, view.planes[2].data },
            .solid => .{ &.{}, &.{}, &.{} },
        };
    }
};

/// Where pixels go. Chroma of YUV targets is written per block, so YUV targets
/// are filled from whole blocks rather than single pixels.
pub const Target = union(enum) {
    bytes: surface.View,
    wide: WideTarget,
    yuv: YuvTarget,

    fn size(self: Target) Dims {
        return switch (self) {
            .bytes => |view| .{ .width = view.width, .height = view.height },
            .wide => |view| .{ .width = view.width, .height = view.height },
            .yuv => |view| .{ .width = view.width, .height = view.height },
        };
    }

    /// The colorspace SDL assigns to this destination when none is given.
    pub fn default_colorspace(self: Target) Colorspace {
        return switch (self) {
            .bytes => colorspace.srgb,
            .wide => |view| wide_default(view.layout),
            .yuv => |view| yuv_default(view.fourcc),
        };
    }

    fn storage(self: Target) [3][]const u8 {
        return switch (self) {
            .bytes => |view| .{ view.data, &.{}, &.{} },
            .wide => |view| .{ view.data, &.{}, &.{} },
            .yuv => |view| .{ view.planes[0].data, view.planes[1].data, view.planes[2].data },
        };
    }
};

const Dims = struct { width: u31, height: u31 };

/// Owned storage for a wide or YUV result. Byte results are `surface.Surface`.
/// Create with `convert_owned`; `target` borrows the storage until `deinit`.
pub const Owned = struct {
    allocator: std.mem.Allocator,
    data: []u8,
    format: Format,
    width: u31,
    height: u31,
    /// Stride of each plane (for YUV) or of the single raster in plane 0.
    strides: [3]usize,
    /// Start of each plane inside `data`.
    offsets: [3]usize,
    /// Byte length of each plane.
    lengths: [3]usize,

    /// Releases the storage. Targets obtained from this value become invalid.
    pub fn deinit(self: *Owned) void {
        self.allocator.free(self.data);
        self.* = undefined;
    }

    /// A writable target over the owned storage, for use with `convert_pixels`.
    pub fn target(self: Owned) Target {
        return switch (self.format) {
            .wide => |layout| .{ .wide = .{ .layout = layout, .width = self.width, .height = self.height, .data = self.data, .stride = self.strides[0] } },
            .yuv => |fourcc| blk: {
                var planes: [3]yuv_more.Plane = undefined;
                for (0..3) |p| {
                    planes[p] = .{ .data = self.data[self.offsets[p]..][0..self.lengths[p]], .stride = self.strides[p] };
                }
                break :blk .{ .yuv = .{ .fourcc = fourcc, .width = self.width, .height = self.height, .planes = planes } };
            },
            // Byte formats are created as surface.Surface, never as Owned.
            .bytes => unreachable,
        };
    }
};

/// Colorspace inference shared by every entry point: null means the format's default.
fn resolve(explicit: ?Colorspace, fallback: Colorspace) Colorspace {
    return explicit orelse fallback;
}

/// Converts `source` into `target`, filling every pixel of the target. Both
/// extents must match. Source and target storage may only coincide when they
/// are the same view, format and colorspace (then the call is a no-op);
/// partially overlapping storage returns `OverlappingBuffers`.
///
/// `source_colorspace` and `target_colorspace` may be null for the default of
/// the format (`Format.default_colorspace`). `options` controls SDR white and
/// HDR headroom; `Options{}` uses SDL's defaults.
pub fn convert_pixels(source: Source, source_colorspace: ?Colorspace, target: Target, target_colorspace: ?Colorspace, options: Options) Error!void {
    const dims = source.size() orelse return error.InvalidSize;
    const target_dims = target.size();
    if (dims.width != target_dims.width or dims.height != target_dims.height) return error.InvalidSize;
    const src_cs = resolve(source_colorspace, source.default_colorspace());
    const dst_cs = resolve(target_colorspace, target.default_colorspace());
    try convert_rect(dims.width, dims.height, source, src_cs, target, dst_cs, options);
}

fn convert_rect(width: u31, height: u31, source: Source, src_cs: Colorspace, target: Target, dst_cs: Colorspace, options: Options) Error!void {
    if (width == 0 or height == 0) return;

    if (storage_overlaps(source, target)) {
        // Only an identical view with an identical colorspace is a valid in-place no-op.
        if (!same_view(source, target) or !std.meta.eql(src_cs, dst_cs)) return error.OverlappingBuffers;
        return;
    }

    // Same colorspace YUV repacks stay in the plane domain, as SDL does.
    if (source == .yuv and target == .yuv and std.meta.eql(src_cs, dst_cs)) {
        const from = source.yuv;
        const to = target.yuv;
        if (yuv_more.convert(width, height, from.fourcc, from.planes, to.fourcc, to.planes)) |_| {
            return;
        } else |err| switch (err) {
            // Outside the 8-bit repack family (I444, P010 across formats): use RGB below.
            error.UnsupportedConversion => {},
            else => return err,
        }
    }

    // Identical byte or wide layouts with identical colorspaces copy rows directly.
    if (source == .bytes and target == .bytes and std.meta.eql(src_cs, dst_cs)) {
        const from = source.bytes;
        const to = target.bytes;
        if (std.meta.eql(from.format, to.format) and palettes_equal(from.palette, to.palette)) {
            for (0..height) |y| @memcpy(try to.row(y), try from.row(y));
            return;
        }
    }
    if (source == .wide and target == .wide and source.wide.layout == target.wide.layout and std.meta.eql(src_cs, dst_cs)) {
        const from = source.wide;
        const to = target.wide;
        const bytes = std.math.mul(usize, width, from.layout.bytes_per_pixel()) catch return error.Overflow;
        for (0..height) |y| @memcpy(to.data[y * to.stride ..][0..bytes], from.data[y * from.stride ..][0..bytes]);
        return;
    }

    const ctx = Context.init(source, src_cs, height, target, dst_cs, options);
    switch (target) {
        .yuv => |buffer| try convert_to_yuv(&ctx, width, height, source, buffer),
        .bytes, .wide => try convert_pixelwise(&ctx, width, height, source, target),
    }
}

fn palettes_equal(a: ?[]const pixels.Color, b: ?[]const pixels.Color) bool {
    const first = a orelse return b == null;
    const second = b orelse return false;
    return first.len == second.len and std.mem.eql(u8, std.mem.sliceAsBytes(first), std.mem.sliceAsBytes(second));
}

fn storage_overlaps(source: Source, target: Target) bool {
    const from = source.storage();
    const to = target.storage();
    for (from) |a| for (to) |b| if (yuv_more.overlaps(a, b)) return true;
    return false;
}

/// True when both endpoints are the same borrowed storage with the same layout,
/// so per-pixel read-then-write is a no-op.
fn same_view(source: Source, target: Target) bool {
    return switch (source) {
        .bytes => |from| switch (target) {
            .bytes => |to| from.data.ptr == to.data.ptr and from.data.len == to.data.len and from.stride == to.stride and std.meta.eql(from.format, to.format),
            else => false,
        },
        .wide => |from| switch (target) {
            .wide => |to| from.data.ptr == to.data.ptr and from.stride == to.stride and from.layout == to.layout,
            else => false,
        },
        .yuv => |from| switch (target) {
            .yuv => |to| from.fourcc == to.fourcc and from.planes[0].data.ptr == to.planes[0].data.ptr and from.planes[1].data.ptr == to.planes[1].data.ptr and from.planes[2].data.ptr == to.planes[2].data.ptr,
            else => false,
        },
        .solid => false,
    };
}

// ---------------------------------------------------------------- YUV math

/// Normalizes a YCbCr colorspace: sets the YCbCr type and replaces an identity
/// or unsupported matrix with SDL's default for the sample depth.
fn normalize_ycbcr(space: Colorspace, bits: u8) Colorspace {
    var result = space;
    result.color_type = .ycbcr;
    result.matrix = switch (space.matrix) {
        .bt601, .bt470bg, .bt709, .bt2020_ncl, .unspecified => space.matrix,
        else => if (bits > 8) .bt2020_ncl else .bt601,
    };
    return result;
}

/// Decode matrix for a YCbCr colorspace at a sample depth and frame height.
fn ycbcr_for(space: Colorspace, height: usize, bits: u8) colorspace.YcbcrToRgb {
    // Every normalized matrix/depth pair is accepted by ycbcr_matrix, so null is unreachable.
    return colorspace.ycbcr_matrix(normalize_ycbcr(space, bits), height, bits) orelse unreachable;
}

/// Explicit integer-coefficient path for 8-bit sources whose matrix SDL tabulates
/// without the height rule. Unspecified matrices use the float matrix.
fn encoding_for(space: Colorspace) ?yuv.Encoding {
    const full = space.range == .full;
    return switch (space.matrix) {
        .bt601, .bt470bg => if (full) .bt601_full else .bt601_limited,
        .bt709 => if (full) .bt709_full else .bt709_limited,
        .bt2020_ncl => if (full) .bt2020_ncl_full else null,
        else => null,
    };
}

/// Inverse of a 3x3 matrix by the adjugate; the decode matrix is never singular.
fn inverse3(m: [3][3]f32) [3][3]f32 {
    const a = m[0][0];
    const b = m[0][1];
    const c = m[0][2];
    const d = m[1][0];
    const e = m[1][1];
    const f = m[1][2];
    const g = m[2][0];
    const h = m[2][1];
    const i = m[2][2];
    const inv_det = 1.0 / (a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g));
    return .{
        .{ (e * i - f * h) * inv_det, (c * h - b * i) * inv_det, (b * f - c * e) * inv_det },
        .{ (f * g - d * i) * inv_det, (a * i - c * g) * inv_det, (c * d - a * f) * inv_det },
        .{ (d * h - e * g) * inv_det, (b * g - a * h) * inv_det, (a * e - b * d) * inv_det },
    };
}

fn clamp_unit(value: f32) f32 {
    return std.math.clamp(value, 0.0, 1.0);
}

fn rgb_linear(rgb: [3]f32) Linear {
    return .{ .r = clamp_unit(rgb[0]), .g = clamp_unit(rgb[1]), .b = clamp_unit(rgb[2]), .a = 1.0 };
}

/// Reads a sample container; P010 keeps ten significant bits in its top bits.
fn read_code(fourcc: Fourcc, data: []const u8, offset: usize) u16 {
    if (fourcc == .p010) return std.mem.readInt(u16, data[offset..][0..2], .little) >> 6;
    return data[offset];
}

/// Writes a code value; P010 stores ten bits in the top bits of a little-endian u16.
fn write_code(fourcc: Fourcc, data: []u8, offset: usize, code: u16) void {
    if (fourcc == .p010) {
        std.mem.writeInt(u16, data[offset..][0..2], code << 6, .little);
    } else {
        data[offset] = @intCast(code);
    }
}

fn quantize(value: f32, max: f32) u16 {
    return @intFromFloat(@round(clamp_unit(value) * max));
}

fn sample_bits(fourcc: Fourcc) u8 {
    return if (fourcc == .p010) 10 else 8;
}

/// Everything the per-pixel loops need, derived once per call.
const Context = struct {
    /// Transfer and primaries conversion between the effective colorspaces.
    pipeline: pixels_wide.Pipeline,
    /// True when the effective source and destination colorspaces are equal.
    identity: bool,
    src_ycc: colorspace.YcbcrToRgb,
    src_encoding: ?yuv.Encoding,
    dst_ycc: colorspace.YcbcrToRgb,
    dst_inverse: [3][3]f32,

    fn init(source: Source, src_cs: Colorspace, height: u31, target: Target, dst_cs: Colorspace, options: Options) Context {
        // SDL routes 8-bit YUV and RGB through an sRGB intermediate; P010 keeps its colorspace.
        const src_yuv_bits: u8 = if (source == .yuv) sample_bits(source.yuv.fourcc) else 8;
        const dst_yuv_bits: u8 = if (target == .yuv) sample_bits(target.yuv.fourcc) else 8;
        const src_effective = if (source == .yuv and src_yuv_bits == 8) colorspace.srgb else src_cs;
        const dst_effective = if (target == .yuv and dst_yuv_bits == 8) colorspace.srgb else dst_cs;

        const src_norm = normalize_ycbcr(src_cs, src_yuv_bits);
        const dst_ycc = ycbcr_for(dst_cs, height, dst_yuv_bits);
        return .{
            .pipeline = pixels_wide.Pipeline.init(src_effective, dst_effective, options),
            .identity = std.meta.eql(src_effective, dst_effective),
            .src_ycc = ycbcr_for(src_cs, height, src_yuv_bits),
            .src_encoding = if (src_yuv_bits == 8) encoding_for(src_norm) else null,
            .dst_ycc = dst_ycc,
            .dst_inverse = inverse3(dst_ycc.m),
        };
    }

    /// Converts a source value through the pipeline unless the colorspaces match.
    fn to_destination(self: *const Context, value: Linear) Linear {
        return if (self.identity) value else self.pipeline.apply(value);
    }

    /// Forward YCbCr from encoded RGB: ycc = M^-1 * rgb - offset, the inverse of the decode step.
    fn encode_ycc(self: *const Context, rgb: [3]f32) [3]f32 {
        var out: [3]f32 = undefined;
        for (0..3) |i| {
            out[i] = self.dst_inverse[i][0] * rgb[0] + self.dst_inverse[i][1] * rgb[1] + self.dst_inverse[i][2] * rgb[2] - self.dst_ycc.offset[i];
        }
        return out;
    }
};

/// Reads one source pixel in its own colorspace (encoded components).
fn source_value(ctx: *const Context, source: Source, x: usize, y: usize) Error!Linear {
    return switch (source) {
        .bytes => |view| Linear.from_color(try view.read(x, y)),
        .wide => |view| try view.read(x, y),
        .yuv => |view| read_yuv(ctx, view, x, y),
        .solid => |value| value,
    };
}

/// Decodes one YUV sample pair to encoded RGB. 8-bit uses SDL's integer
/// coefficients when the colorspace allows; otherwise the float matrix.
fn read_yuv(ctx: *const Context, view: YuvSource, x: usize, y: usize) Linear {
    const fourcc = view.fourcc;
    const strides = view.strides();
    const luma = yuv_more.luma_index(fourcc, strides[0], x, y);
    const cx = x / yuv_more.subsample_x(fourcc);
    const cy = y / yuv_more.subsample_y(fourcc);
    const u = yuv_more.chroma_index(fourcc, strides, cx, cy, .u);
    const v = yuv_more.chroma_index(fourcc, strides, cx, cy, .v);
    const y_code = read_code(fourcc, view.planes[luma.plane].data, luma.offset);
    const u_code = read_code(fourcc, view.planes[u.plane].data, u.offset);
    const v_code = read_code(fourcc, view.planes[v.plane].data, v.offset);

    if (fourcc != .p010) {
        if (ctx.src_encoding) |encoding| {
            const sample: yuv.Sample = .{ .y = @intCast(y_code), .u = @intCast(u_code), .v = @intCast(v_code) };
            return Linear.from_color(yuv.to_rgb(sample, encoding));
        }
    }
    const max: f32 = @floatFromInt(if (fourcc == .p010) @as(u16, 1023) else @as(u16, 255));
    const ycc = [3]f32{
        @as(f32, @floatFromInt(y_code)) / max,
        @as(f32, @floatFromInt(u_code)) / max,
        @as(f32, @floatFromInt(v_code)) / max,
    };
    return rgb_linear(ctx.src_ycc.apply(ycc));
}

/// Per-pixel conversion for byte and wide destinations.
fn convert_pixelwise(ctx: *const Context, width: u31, height: u31, source: Source, target: Target) Error!void {
    for (0..height) |y| {
        for (0..width) |x| {
            const value = ctx.to_destination(try source_value(ctx, source, x, y));
            switch (target) {
                .bytes => |view| try view.write(x, y, value.to_color()),
                .wide => |view| try view.write(x, y, value),
                .yuv => unreachable,
            }
        }
    }
}

/// Converts into a YUV destination. Each chroma sample is the average of the
/// per-pixel chroma of its block (2x2 for 4:2:0, 2x1 for 4:2:2, 1x1 for 4:4:4),
/// as SDL does. Luma is written per pixel.
fn convert_to_yuv(ctx: *const Context, width: u31, height: u31, source: Source, target: YuvTarget) Error!void {
    const fourcc = target.fourcc;
    const strides = target.strides();
    const sx = yuv_more.subsample_x(fourcc);
    const sy = yuv_more.subsample_y(fourcc);
    const max: f32 = if (fourcc == .p010) 1023.0 else 255.0;

    for (0..yuv_more.chroma_rows(fourcc, height)) |cy| {
        for (0..yuv_more.chroma_width(fourcc, width)) |cx| {
            var sum_u: f32 = 0.0;
            var sum_v: f32 = 0.0;
            var count: f32 = 0.0;
            for (0..sy) |dy| {
                const y = cy * sy + dy;
                if (y >= height) break;
                for (0..sx) |dx| {
                    const x = cx * sx + dx;
                    if (x >= width) break;
                    const value = ctx.to_destination(try source_value(ctx, source, x, y));
                    const ycc = ctx.encode_ycc(.{ clamp_unit(value.r), clamp_unit(value.g), clamp_unit(value.b) });
                    const luma = yuv_more.luma_index(fourcc, strides[0], x, y);
                    write_code(fourcc, target.planes[luma.plane].data, luma.offset, quantize(ycc[0], max));
                    sum_u += ycc[1];
                    sum_v += ycc[2];
                    count += 1.0;
                }
            }
            const u = yuv_more.chroma_index(fourcc, strides, cx, cy, .u);
            const v = yuv_more.chroma_index(fourcc, strides, cx, cy, .v);
            write_code(fourcc, target.planes[u.plane].data, u.offset, quantize(sum_u / count, max));
            write_code(fourcc, target.planes[v.plane].data, v.offset, quantize(sum_v / count, max));
        }
    }
}

// ---------------------------------------------------------------- public helpers

/// Converts into a newly allocated byte surface in `format`/`palette`. The
/// result is owned by the caller and released with `surface.Surface.deinit`.
pub fn convert_surface(
    allocator: std.mem.Allocator,
    source: surface.View,
    source_colorspace: ?Colorspace,
    format: pixels.Format,
    palette: ?[]const pixels.Color,
    target_colorspace: ?Colorspace,
    options: Options,
) Error!surface.Surface {
    var result = try surface.Surface.init(allocator, source.width, source.height, format, palette);
    errdefer result.deinit();
    try convert_pixels(.{ .bytes = source }, source_colorspace, .{ .bytes = result.view }, target_colorspace, options);
    return result;
}

/// Converts into a newly allocated wide or YUV raster. Planes of a YUV result
/// are tightly packed (stride = row bytes) inside one allocation.
/// Byte formats return `UnsupportedFormat`; use `convert_surface` for those.
pub fn convert_owned(
    allocator: std.mem.Allocator,
    source: Source,
    source_colorspace: ?Colorspace,
    format: Format,
    target_colorspace: ?Colorspace,
    options: Options,
) Error!Owned {
    const dims = source.size() orelse return error.InvalidSize;
    var strides: [3]usize = .{ 0, 0, 0 };
    var offsets: [3]usize = .{ 0, 0, 0 };
    var lengths: [3]usize = .{ 0, 0, 0 };
    var total: usize = 0;
    switch (format) {
        .bytes => return error.UnsupportedFormat,
        .wide => |layout| {
            strides[0] = std.math.mul(usize, dims.width, layout.bytes_per_pixel()) catch return error.Overflow;
            lengths[0] = std.math.mul(usize, strides[0], dims.height) catch return error.Overflow;
            total = lengths[0];
        },
        .yuv => |fourcc| {
            for (0..yuv_more.plane_count(fourcc)) |p| {
                strides[p] = yuv_more.row_bytes(fourcc, p, dims.width);
                lengths[p] = std.math.mul(usize, strides[p], yuv_more.plane_rows(fourcc, p, dims.height)) catch return error.Overflow;
                offsets[p] = total;
                total = std.math.add(usize, total, lengths[p]) catch return error.Overflow;
            }
        },
    }
    const data = try allocator.alloc(u8, total);
    errdefer allocator.free(data);
    @memset(data, 0);
    var owned: Owned = .{
        .allocator = allocator,
        .data = data,
        .format = format,
        .width = dims.width,
        .height = dims.height,
        .strides = strides,
        .offsets = offsets,
        .lengths = lengths,
    };
    try convert_pixels(source, source_colorspace, owned.target(), target_colorspace, options);
    return owned;
}

/// Fills every pixel of `target` with a color. Byte targets map the color
/// directly to their format (no colorspace change, as SDL_ClearSurface does).
/// Wide targets convert from `colorspace` (default: the target's own colorspace).
/// YUV targets are cleared through an sRGB 8-bit color, as SDL does.
pub fn clear(target: Target, color: [4]f32, source_colorspace: ?Colorspace) Error!void {
    const dims = target.size();
    switch (target) {
        .bytes => |view| {
            const mapped = pixels.Color{
                .r = @intFromFloat(@round(clamp_unit(color[0]) * 255.0)),
                .g = @intFromFloat(@round(clamp_unit(color[1]) * 255.0)),
                .b = @intFromFloat(@round(clamp_unit(color[2]) * 255.0)),
                .a = @intFromFloat(@round(clamp_unit(color[3]) * 255.0)),
            };
            for (0..dims.height) |y| for (0..dims.width) |x| try view.write(x, y, mapped);
        },
        .wide => {
            const value: Linear = .{ .r = color[0], .g = color[1], .b = color[2], .a = color[3] };
            const space = source_colorspace orelse target.default_colorspace();
            try convert_rect(dims.width, dims.height, .{ .solid = value }, space, target, target.default_colorspace(), .{});
        },
        .yuv => {
            const quantized = pixels.Color{
                .r = @intFromFloat(@round(clamp_unit(color[0]) * 255.0)),
                .g = @intFromFloat(@round(clamp_unit(color[1]) * 255.0)),
                .b = @intFromFloat(@round(clamp_unit(color[2]) * 255.0)),
                .a = 255,
            };
            const value = Linear.from_color(quantized);
            try convert_rect(dims.width, dims.height, .{ .solid = value }, colorspace.srgb, target, target.default_colorspace(), .{});
        },
    }
}

/// Multiplies each color channel by alpha. With `linear` false and byte storage
/// in sRGB, this uses SDL's integer `(alpha * channel) / 255` on the encoded
/// values. Otherwise the pixels are converted to sRGB (or linear sRGB when
/// `linear` is true), premultiplied in floats through a temporary RGBA float
/// buffer, and converted to the destination colorspace. The buffer uses `allocator`.
pub fn premultiply_alpha(
    allocator: std.mem.Allocator,
    source: Source,
    source_colorspace: ?Colorspace,
    target: Target,
    target_colorspace: ?Colorspace,
    linear: bool,
    options: Options,
) Error!void {
    const dims = source.size() orelse return error.InvalidSize;
    const target_dims = target.size();
    if (dims.width != target_dims.width or dims.height != target_dims.height) return error.InvalidSize;
    const src_cs = resolve(source_colorspace, source.default_colorspace());
    const dst_cs = resolve(target_colorspace, target.default_colorspace());

    if (!linear and source == .bytes and target == .bytes and std.meta.eql(src_cs, colorspace.srgb) and std.meta.eql(dst_cs, colorspace.srgb)) {
        for (0..dims.height) |y| {
            for (0..dims.width) |x| {
                const color = premultiply_color(try source.bytes.read(x, y));
                try target.bytes.write(x, y, color);
            }
        }
        return;
    }

    const tmp_space = if (linear) colorspace.srgb_linear else colorspace.srgb;
    const layout: pixels_wide.Layout = .rgba128_float;
    const stride = std.math.mul(usize, dims.width, layout.bytes_per_pixel()) catch return error.Overflow;
    const size = std.math.mul(usize, stride, dims.height) catch return error.Overflow;
    const buffer = try allocator.alloc(u8, size);
    defer allocator.free(buffer);
    const tmp = try WideTarget.init(layout, dims.width, dims.height, buffer, stride);
    try convert_pixels(source, src_cs, .{ .wide = tmp }, tmp_space, options);

    for (0..dims.height) |y| {
        for (0..dims.width) |x| {
            var value = try tmp.read(x, y);
            value.r *= value.a;
            value.g *= value.a;
            value.b *= value.a;
            try tmp.write(x, y, value);
        }
    }

    const tmp_source = try WideSource.init(layout, dims.width, dims.height, buffer, stride);
    try convert_pixels(.{ .wide = tmp_source }, tmp_space, target, dst_cs, options);
}

/// SDL's integer premultiply for one 8-bit color: channels scale by alpha / 255, rounded down.
fn premultiply_color(color: pixels.Color) pixels.Color {
    const a: u32 = color.a;
    return .{
        .r = @intCast((a * color.r) / 255),
        .g = @intCast((a * color.g) / 255),
        .b = @intCast((a * color.b) / 255),
        .a = color.a,
    };
}

/// Flip axes for `flip`.
pub const Flip = struct {
    horizontal: bool = false,
    vertical: bool = false,
};

/// Mirrors a byte surface in place. Horizontal flips of sub-byte indexed rows
/// move individual indices; byte-aligned pixels swap whole pixel blocks.
pub fn flip(view: surface.View, mode: Flip) surface.Error!void {
    if (mode.vertical) {
        for (0..view.height / 2) |y| {
            const top = try view.row(y);
            const bottom = try view.row(view.height - 1 - y);
            for (top, bottom) |*a, *b| std.mem.swap(u8, a, b);
        }
    }
    if (mode.horizontal and view.width > 1) {
        for (0..view.height) |y| {
            const row = try view.row(y);
            switch (view.format) {
                .indexed => |indexed| {
                    for (0..view.width / 2) |x| {
                        const mirror = view.width - 1 - x;
                        const a = try indexed.read_index(row, x);
                        const b = try indexed.read_index(row, mirror);
                        try indexed.write_index(row, x, b);
                        try indexed.write_index(row, mirror, a);
                    }
                },
                else => {
                    const bpp = view.format.bits_per_pixel() / 8;
                    for (0..view.width / 2) |x| {
                        const left = row[x * bpp ..][0..bpp];
                        const right = row[(view.width - 1 - x) * bpp ..][0..bpp];
                        for (left, right) |*a, *b| std.mem.swap(u8, a, b);
                    }
                },
            }
        }
    }
}

/// Creates a scaled copy with nearest or linear sampling (see surface.Surface.scaled).
pub fn scale(allocator: std.mem.Allocator, source: surface.View, width: u31, height: u31, mode: surface.ScaleMode) surface.Error!surface.Surface {
    return surface.Surface.scaled(allocator, source, width, height, mode);
}
