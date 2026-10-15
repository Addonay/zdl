//! Wide pixel formats: 10-bit packed 2101010 words, 16-bit integer channels,
//! half-float and f32 channels, plus per-pixel conversion through colorspaces.
//! Altered native port of the wide paths in SDL_pixels.c, SDL_blit.h (the
//! RGBA_FROM_ARGB2101010 / ARGB2101010_FROM_RGBAFLOAT macros) and
//! SDL_blit_slow.c (ReadFloatPixel, WriteFloatPixel, tonemapping).
//!
//! Numeric conventions:
//! - Normalized values are `Linear` components in [0,1] for integer formats.
//!   Floats are stored unclamped. Alpha of a 2101010 word is 2 bits (0..3).
//! - Integer writes clamp and round to nearest, as SDL does.
//! - Stored values are little-endian. SDL uses host order; on little-endian
//!   hosts both agree.
//!
//! Deliberate differences from SDL:
//! - Half floats use the compiler's IEEE binary16 conversion (round to nearest
//!   even). SDL's public-domain helper may differ in the last bit for some inputs.
//! - Colorspace conversion takes explicit options (white point, headroom and
//!   tone mapper) instead of surface property lookups.
const std = @import("std");
const pixels = @import("pixels.zig");
const colorspace = @import("colorspace.zig");
const surface = @import("surface.zig");

/// Storage layouts. Names follow SDL_PixelFormat wide formats.
pub const Layout = enum {
    xrgb2101010,
    xbgr2101010,
    argb2101010,
    abgr2101010,
    rgb48,
    rgba64,
    rgb48_float,
    rgba64_float,
    rgb96_float,
    rgba128_float,
    argb128_float,
    bgra128_float,
    abgr128_float,

    /// Storage size of one pixel in bytes.
    pub fn bytes_per_pixel(self: Layout) usize {
        return switch (self) {
            .xrgb2101010, .xbgr2101010, .argb2101010, .abgr2101010 => 4,
            .rgb48, .rgb48_float => 6,
            .rgba64, .rgba64_float => 8,
            .rgb96_float => 12,
            .rgba128_float, .argb128_float, .bgra128_float, .abgr128_float => 16,
        };
    }

    /// True when the layout carries an alpha component.
    pub fn has_alpha(self: Layout) bool {
        return switch (self) {
            .xrgb2101010, .xbgr2101010, .rgb48, .rgb48_float, .rgb96_float => false,
            else => true,
        };
    }

    /// True for 2101010 words, which pack all components into one u32.
    pub fn is_packed_2101010(self: Layout) bool {
        return switch (self) {
            .xrgb2101010, .xbgr2101010, .argb2101010, .abgr2101010 => true,
            else => false,
        };
    }

    /// Number of components stored per pixel in memory.
    fn component_count(self: Layout) usize {
        return if (self.has_alpha()) 4 else 3;
    }

    /// Memory slot order for component-array layouts. Entries are channel
    /// indices: 0 = red, 1 = green, 2 = blue, 3 = alpha.
    fn slots(self: Layout) [4]u8 {
        return switch (self) {
            .rgb48, .rgb48_float, .rgb96_float => .{ 0, 1, 2, 0 },
            .rgba64, .rgba64_float, .rgba128_float => .{ 0, 1, 2, 3 },
            .argb128_float => .{ 3, 0, 1, 2 },
            .bgra128_float => .{ 2, 1, 0, 3 },
            .abgr128_float => .{ 3, 2, 1, 0 },
            else => .{ 0, 1, 2, 3 },
        };
    }

    fn element(self: Layout) enum { u16, f16, f32 } {
        return switch (self) {
            .rgb48, .rgba64 => .u16,
            .rgb48_float, .rgba64_float => .f16,
            .rgb96_float, .rgba128_float, .argb128_float, .bgra128_float, .abgr128_float => .f32,
            else => unreachable,
        };
    }

    /// Reads one pixel into normalized linear components. No colorspace is applied.
    /// Sub-slices must hold at least `bytes_per_pixel` bytes.
    pub fn read(self: Layout, bytes: []const u8) pixels.Error!Linear {
        if (bytes.len < self.bytes_per_pixel()) return error.InvalidBuffer;
        if (self.is_packed_2101010()) {
            const word = std.mem.readInt(u32, bytes[0..4], .little);
            const shifts: [3]u5 = if (self == .xbgr2101010 or self == .abgr2101010) .{ 0, 10, 20 } else .{ 20, 10, 0 };
            const alpha: f32 = if (self.has_alpha()) @as(f32, @floatFromInt(word >> 30)) / 3.0 else 1.0;
            return .{
                .r = @as(f32, @floatFromInt((word >> shifts[0]) & 0x3ff)) / 1023.0,
                .g = @as(f32, @floatFromInt((word >> shifts[1]) & 0x3ff)) / 1023.0,
                .b = @as(f32, @floatFromInt((word >> shifts[2]) & 0x3ff)) / 1023.0,
                .a = alpha,
            };
        }
        var values = [4]f32{ 0, 0, 0, 1 };
        const count = self.component_count();
        const order = self.slots();
        for (0..count) |slot| {
            const channel = order[slot];
            values[channel] = switch (self.element()) {
                .u16 => @as(f32, @floatFromInt(std.mem.readInt(u16, bytes[slot * 2 ..][0..2], .little))) / 65535.0,
                .f16 => @floatCast(@as(f16, @bitCast(std.mem.readInt(u16, bytes[slot * 2 ..][0..2], .little)))),
                .f32 => @bitCast(std.mem.readInt(u32, bytes[slot * 4 ..][0..4], .little)),
            };
        }
        return .{ .r = values[0], .g = values[1], .b = values[2], .a = values[3] };
    }

    /// Writes one pixel. Integer layouts clamp to [0,1] and round to nearest.
    /// Float layouts store the value unclamped. Components a layout does not
    /// store (alpha of RGB-only layouts) are discarded.
    pub fn write(self: Layout, bytes: []u8, color: Linear) pixels.Error!void {
        if (bytes.len < self.bytes_per_pixel()) return error.InvalidBuffer;
        if (self.is_packed_2101010()) {
            const shifts: [3]u5 = if (self == .xbgr2101010 or self == .abgr2101010) .{ 0, 10, 20 } else .{ 20, 10, 0 };
            const r: u32 = quantize(color.r, 1023);
            const g: u32 = quantize(color.g, 1023);
            const b: u32 = quantize(color.b, 1023);
            const a: u32 = if (self.has_alpha()) quantize(color.a, 3) else 0;
            const word = (a << 30) | (r << shifts[0]) | (g << shifts[1]) | (b << shifts[2]);
            std.mem.writeInt(u32, bytes[0..4], word, .little);
            return;
        }
        const values = [4]f32{ color.r, color.g, color.b, color.a };
        const count = self.component_count();
        const order = self.slots();
        for (0..count) |slot| {
            const v = values[order[slot]];
            switch (self.element()) {
                .u16 => std.mem.writeInt(u16, bytes[slot * 2 ..][0..2], @intCast(quantize(v, 65535)), .little),
                .f16 => std.mem.writeInt(u16, bytes[slot * 2 ..][0..2], @bitCast(@as(f16, @floatCast(v))), .little),
                .f32 => std.mem.writeInt(u32, bytes[slot * 4 ..][0..4], @bitCast(v), .little),
            }
        }
    }
};

/// Normalized linear RGBA. Alpha is not gamma-encoded in any layout.
pub const Linear = struct {
    r: f32,
    g: f32,
    b: f32,
    a: f32 = 1.0,

    /// Expands an eight-bit color to [0,1]; alpha is linear.
    pub fn from_color(color: pixels.Color) Linear {
        return .{
            .r = @as(f32, @floatFromInt(color.r)) / 255.0,
            .g = @as(f32, @floatFromInt(color.g)) / 255.0,
            .b = @as(f32, @floatFromInt(color.b)) / 255.0,
            .a = @as(f32, @floatFromInt(color.a)) / 255.0,
        };
    }

    /// Quantizes to eight bits with clamping and round-to-nearest, as SDL's
    /// WriteFloatPixel does for RGB output.
    pub fn to_color(self: Linear) pixels.Color {
        return .{
            .r = @intCast(quantize(self.r, 255)),
            .g = @intCast(quantize(self.g, 255)),
            .b = @intCast(quantize(self.b, 255)),
            .a = @intCast(quantize(self.a, 255)),
        };
    }
};

/// Clamps to [0, maximum] and rounds to the nearest integer.
fn quantize(value: f32, maximum: u32) u32 {
    const clamped = std.math.clamp(value, 0.0, 1.0);
    return @intFromFloat(@round(clamped * @as(f32, @floatFromInt(maximum))));
}

/// Applies a colorspace conversion from source to destination encoded values.
/// Built once per surface pair: decode, optional tone map, primaries change,
/// encode. Matches the order of SDL_blit_slow.c's float path.
pub const Pipeline = struct {
    src: colorspace.Colorspace,
    dst: colorspace.Colorspace,
    src_white: f32,
    dst_white: f32,
    tonemap: Stage,
    /// Source-to-BT.2020 matrix applied before the Chrome scale.
    chrome_primaries: ?colorspace.Matrix3,
    /// Primaries change after tone mapping; null when none is needed.
    primaries: ?colorspace.Matrix3,

    const Stage = union(enum) { none, linear: f32, chrome: colorspace.Chrome };

    /// Options that override surface properties of SDL. Null values use the
    /// colorspace defaults from `colorspace.sdr_white_point` / `hdr_headroom`.
    pub const Options = struct {
        src_sdr_white: ?f32 = null,
        dst_sdr_white: ?f32 = null,
        src_headroom: ?f32 = null,
        /// Zero after defaults means "same as the source", as in SDL.
        dst_headroom: ?f32 = null,
        /// Used only when the source headroom exceeds the destination headroom.
        tonemap: colorspace.Tonemap = .chrome,
    };

    /// Computes white points, headroom rules, tone-map operator and primaries
    /// matrices. Equal headroom (or none) leaves the color untouched.
    pub fn init(src: colorspace.Colorspace, dst: colorspace.Colorspace, options: Options) Pipeline {
        const src_white = colorspace.sdr_white_point(src, options.src_sdr_white);
        const dst_white = colorspace.sdr_white_point(dst, options.dst_sdr_white);
        const src_headroom = colorspace.hdr_headroom(src, options.src_headroom);
        var dst_headroom = colorspace.hdr_headroom(dst, options.dst_headroom);
        if (dst_headroom == 0.0) dst_headroom = src_headroom;

        var pipeline: Pipeline = .{
            .src = src,
            .dst = dst,
            .src_white = src_white,
            .dst_white = dst_white,
            .tonemap = .none,
            .chrome_primaries = null,
            .primaries = null,
        };
        var source_primaries = src.primaries;
        if (src_headroom > dst_headroom and src_headroom > 0.0 and dst_headroom > 0.0) {
            switch (options.tonemap) {
                .none => {},
                .linear => |scale| pipeline.tonemap = .{ .linear = scale },
                .chrome => {
                    pipeline.tonemap = .{ .chrome = colorspace.Chrome.init(src_headroom, dst_headroom) };
                    // Chrome's operator works in BT.2020; SDL converts there first when a matrix exists.
                    if (colorspace.primaries_matrix(source_primaries, .bt2020)) |m| {
                        pipeline.chrome_primaries = m;
                        source_primaries = .bt2020;
                    }
                },
            }
        }
        if (source_primaries != dst.primaries) {
            pipeline.primaries = colorspace.primaries_matrix(source_primaries, dst.primaries);
        }
        return pipeline;
    }

    /// Converts one pixel of normalized encoded components (as `Layout.read`
    /// or `Linear.from_color` produce) into destination-encoded components.
    /// Alpha passes through unchanged.
    pub fn apply(self: Pipeline, value: Linear) Linear {
        var rgb = [3]f32{
            colorspace.decode(self.src.transfer, value.r, self.src_white),
            colorspace.decode(self.src.transfer, value.g, self.src_white),
            colorspace.decode(self.src.transfer, value.b, self.src_white),
        };
        switch (self.tonemap) {
            .none => {},
            .linear => |scale| rgb = .{ rgb[0] * scale, rgb[1] * scale, rgb[2] * scale },
            .chrome => |chrome| {
                if (self.chrome_primaries) |m| rgb = colorspace.convert_primaries(rgb, m);
                rgb = chrome.apply(rgb);
            },
        }
        if (self.primaries) |m| rgb = colorspace.convert_primaries(rgb, m);
        return .{
            .r = colorspace.encode(self.dst.transfer, rgb[0], self.dst_white),
            .g = colorspace.encode(self.dst.transfer, rgb[1], self.dst_white),
            .b = colorspace.encode(self.dst.transfer, rgb[2], self.dst_white),
            .a = value.a,
        };
    }

    /// Converts an eight-bit color through the pipeline. The result is quantized
    /// to eight bits with clamping, as SDL's byte-format writes do.
    pub fn apply_color(self: Pipeline, color: pixels.Color) pixels.Color {
        return self.apply(Linear.from_color(color)).to_color();
    }
};

/// Converts one wide pixel to another wide layout through a pipeline.
pub fn convert_pixel(pipeline: Pipeline, src_layout: Layout, src: []const u8, dst_layout: Layout, dst: []u8) pixels.Error!void {
    try dst_layout.write(dst, pipeline.apply(try src_layout.read(src)));
}

/// Converts a byte-format view into another byte-format view, applying the
/// pipeline to each pixel. Both views must have the same extent. Source and
/// destination may be the same storage only when the views are identical; the
/// function reads each source pixel before writing the destination pixel.
pub fn convert_view(pipeline: Pipeline, source: surface.View, destination: surface.View) (pixels.Error || surface.Error)!void {
    if (source.width != destination.width or source.height != destination.height) return error.InvalidSize;
    for (0..source.height) |y| {
        for (0..source.width) |x| {
            const color = try source.read(x, y);
            try destination.write(x, y, pipeline.apply_color(color));
        }
    }
}

/// Reads one wide-layout pixel and returns the destination-encoded eight-bit color.
pub fn wide_to_color(pipeline: Pipeline, layout: Layout, bytes: []const u8) pixels.Error!pixels.Color {
    return pipeline.apply(try layout.read(bytes)).to_color();
}

/// Writes an eight-bit color into a wide layout after a pipeline conversion.
pub fn color_to_wide(pipeline: Pipeline, color: pixels.Color, layout: Layout, bytes: []u8) pixels.Error!void {
    try layout.write(bytes, pipeline.apply(Linear.from_color(color)));
}
