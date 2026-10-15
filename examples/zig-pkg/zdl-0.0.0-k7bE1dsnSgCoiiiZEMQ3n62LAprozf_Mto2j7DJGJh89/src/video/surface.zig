//! Owned raster storage and explicitly borrowed pixel views.
//! This module has no SDL surface ABI, reference counts, global registrations or
//! hidden palette ownership. Scalar blits/blends, sampling and BMP integration
//! share this raster contract. Byte RGB/RGBA blits use the vector kernels in
//! `blit_simd.zig`, validated against the scalar path. RLE surfaces, YUV/HDR and
//! colorspace-aware blit paths remain pending.
// Ported from video/SDL_surface.c and SDL_fillrect.c; native ownership and errors replace the C ABI.
const std = @import("std");
const pixels = @import("pixels.zig");
const geometry = @import("geometry.zig");
/// Vector row kernels for byte RGB/RGBA blits; `View.blit` uses them when eligible.
pub const blit_simd = @import("blit_simd.zig");

/// BMP slice decoding/encoding with explicitly owned surface/palette results.
pub const bmp = @import("bmp.zig");

/// Bounds, shape and allocation failures are returned instead of last-error text.
pub const Error = pixels.Error || std.mem.Allocator.Error || error{InvalidSize};

/// Mutable borrowed raster storage. The buffer and any palette must outlive the
/// view. Copying a View creates another borrow; neither copy frees its memory.
/// Its validated dimensions fit the integer geometry API without narrowing.
pub const View = struct {
    data: []u8,
    width: u31,
    height: u31,
    stride: usize,
    format: pixels.Format,
    palette: ?[]const pixels.Color,

    /// Validates row stride, final-row capacity and palette before returning a
    /// view. The last row need not include trailing padding. Zero-size rasters
    /// are valid and have no readable pixels. Storage need not be aligned.
    pub fn init(data: []u8, width: u31, height: u31, stride: usize, format: pixels.Format, palette: ?[]const pixels.Color) Error!View {
        try format.validate_palette(palette);
        const row_size = try format.row_bytes(width);
        if (stride < row_size) return error.InvalidBuffer;
        const prefix = if (height == 0 or width == 0) 0 else std.math.mul(usize, height - 1, stride) catch return error.Overflow;
        const required = if (height == 0 or width == 0) 0 else std.math.add(usize, prefix, row_size) catch return error.Overflow;
        if (data.len < required) return error.InvalidBuffer;
        return .{ .data = data, .width = width, .height = height, .stride = stride, .format = format, .palette = palette };
    }

    /// Pixel-coordinate bounds. Empty dimensions remain empty integer rectangles.
    pub fn bounds(self: View) geometry.Rect(i32) {
        return .{ .x = 0, .y = 0, .width = self.width, .height = self.height };
    }

    /// Borrows the meaningful row bytes, excluding its padding. Only a valid
    /// row index is accepted; callers must not outlive the view's buffer owner.
    pub fn row(self: View, y: usize) Error![]u8 {
        if (y >= self.height) return error.OutOfBounds;
        if (self.width == 0) return self.data[0..0];
        const start = y * self.stride;
        const length = try self.format.row_bytes(self.width);
        return self.data[start..][0..length];
    }

    /// Reads a color through the format descriptor and any borrowed palette.
    pub fn read(self: View, x: usize, y: usize) Error!pixels.Color {
        if (x >= self.width) return error.OutOfBounds;
        return self.format.read(try self.row(y), x, self.palette);
    }

    /// Writes a color without affecting row padding or neighbouring packed
    /// palette indices. RGB-only formats discard alpha by definition.
    pub fn write(self: View, x: usize, y: usize, color: pixels.Color) Error!void {
        if (x >= self.width) return error.OutOfBounds;
        try self.format.write(try self.row(y), x, color, self.palette);
    }

    /// Fills the clipped rectangle, or the complete raster when region is null.
    /// Integer clipping discards negative/outside coordinates before indexing.
    /// This scalar path supports every implemented format, including sub-byte
    /// palettes, and leaves bytes outside the clipped pixels untouched.
    pub fn fill(self: View, color: pixels.Color, region: ?geometry.Rect(i32)) (Error || geometry.GeometryError)!void {
        const rectangle = if (region) |requested| (try self.bounds().intersection(requested)) orelse return else self.bounds();
        if (rectangle.is_empty()) return;
        const start_x: usize = @intCast(rectangle.x);
        const start_y: usize = @intCast(rectangle.y);
        const end_x = start_x + @as(usize, @intCast(rectangle.width));
        const end_y = start_y + @as(usize, @intCast(rectangle.height));
        for (start_y..end_y) |y| {
            const bytes = try self.row(y);
            for (start_x..end_x) |x| try self.format.write(bytes, x, color, self.palette);
        }
    }
    /// Copies/composites the requested source area into a clipped destination.
    /// Returns the admitted destination region, or null when nothing is in bounds.
    /// Overlapping storage is snapshotted before mutation; allocation failure
    /// leaves the destination unchanged. Normal non-overlapping blits allocate
    /// nothing. Color math uses eight-bit RGBA, not an implicit HDR transform.
    /// Byte RGB/RGBA rows use the vector kernels in `blit_simd.zig`, which give
    /// the same results as `blit_scalar`.
    pub fn blit(self: View, allocator: std.mem.Allocator, source: View, options: BlitOptions) (Error || geometry.GeometryError)!?geometry.Rect(i32) {
        return self.blit_with(allocator, source, options, true);
    }

    /// The same operation as `blit`, always through the per-pixel scalar path.
    /// It is the reference the vector kernels are validated against.
    pub fn blit_scalar(self: View, allocator: std.mem.Allocator, source: View, options: BlitOptions) (Error || geometry.GeometryError)!?geometry.Rect(i32) {
        return self.blit_with(allocator, source, options, false);
    }

    fn blit_with(self: View, allocator: std.mem.Allocator, source: View, options: BlitOptions, accelerate: bool) (Error || geometry.GeometryError)!?geometry.Rect(i32) {
        const requested = options.source_region orelse source.bounds();
        const selected = (try source.bounds().intersection(requested)) orelse return null;
        const clip = if (options.clip) |region| (try self.bounds().intersection(region)) orelse return null else self.bounds();
        if (clip.is_empty()) return null;
        var source_x: i64 = selected.x;
        var source_y: i64 = selected.y;
        var destination_x = @as(i64, options.destination.x) + @as(i64, selected.x) - requested.x;
        var destination_y = @as(i64, options.destination.y) + @as(i64, selected.y) - requested.y;
        var width: i64 = selected.width;
        var height: i64 = selected.height;
        if (destination_x < clip.x) {
            const skipped = @as(i64, clip.x) - destination_x;
            source_x += skipped;
            width -= skipped;
            destination_x = clip.x;
        }
        if (destination_y < clip.y) {
            const skipped = @as(i64, clip.y) - destination_y;
            source_y += skipped;
            height -= skipped;
            destination_y = clip.y;
        }
        width = @min(width, @as(i64, clip.x) + clip.width - destination_x);
        height = @min(height, @as(i64, clip.y) + clip.height - destination_y);
        if (width <= 0 or height <= 0) return null;
        const region: geometry.Rect(i32) = .{ .x = @intCast(destination_x), .y = @intCast(destination_y), .width = @intCast(width), .height = @intCast(height) };
        var input = source;
        var snapshot: ?Surface = null;
        defer if (snapshot) |*saved| saved.deinit();
        if (overlaps(self.data, source.data)) {
            snapshot = try Surface.copy(allocator, source);
            input = snapshot.?.view;
        }
        const same_palette = if (self.palette) |palette|
            (if (input.palette) |other| palette.ptr == other.ptr and palette.len == other.len else false)
        else
            input.palette == null;
        const raw_copy = std.meta.eql(self.format, input.format) and same_palette and
            std.meta.eql(options.blend, Blend.REPLACE) and options.color_key == null and
            std.meta.eql(options.modulation, pixels.Color{ .r = 255, .g = 255, .b = 255 }) and self.format.bits_per_pixel() % 8 == 0;
        const sx: usize = @intCast(source_x);
        const sy: usize = @intCast(source_y);
        const dx: usize = @intCast(destination_x);
        const dy: usize = @intCast(destination_y);
        const count: usize = @intCast(width);
        const vector_source = if (accelerate) blit_simd.Kind.of(input.format) else null;
        const vector_destination = if (accelerate) blit_simd.Kind.of(self.format) else null;
        const vector_params: blit_simd.Params = .{ .blend = options.blend, .modulation = options.modulation, .color_key = options.color_key };
        for (0..@as(usize, @intCast(height))) |row_index| {
            const source_row = try input.row(sy + row_index);
            const destination_row = try self.row(dy + row_index);
            if (raw_copy) {
                const bytes = self.format.bits_per_pixel() / 8;
                @memcpy(destination_row[dx * bytes ..][0 .. count * bytes], source_row[sx * bytes ..][0 .. count * bytes]);
                continue;
            }
            var first: usize = 0;
            if (vector_source) |source_kind| if (vector_destination) |destination_kind| {
                first = blit_simd.blit_row(source_kind, destination_kind, vector_params, source_row, sx, destination_row, dx, count);
            };
            for (first..count) |column| {
                var color = try input.format.read(source_row, sx + column, input.palette);
                if (options.color_key) |key| if (color.r == key.r and color.g == key.g and color.b == key.b) continue;
                color = modulate(color, options.modulation);
                const result = if (std.meta.eql(options.blend, Blend.REPLACE)) color else options.blend.apply(color, try self.format.read(destination_row, dx + column, self.palette));
                try self.format.write(destination_row, dx + column, result, self.palette);
            }
        }
        return region;
    }
};

/// Raster buffer ownership. Do not copy after initialization; borrow its View
/// instead and deinit before the allocator is destroyed. Palettes stay borrowed.
pub const Surface = struct {
    allocator: std.mem.Allocator,
    view: View,

    /// Allocates zeroed storage with four-byte row alignment, matching SDL's
    /// ordinary surface pitch convention. All products/alignment are checked.
    /// Indexed zero bits select palette entry zero; they do not imply black.
    pub fn init(allocator: std.mem.Allocator, width: u31, height: u31, format: pixels.Format, palette: ?[]const pixels.Color) Error!Surface {
        try format.validate_palette(palette);
        const minimal = try format.row_bytes(width);
        const padded = std.math.add(usize, minimal, 3) catch return error.Overflow;
        const stride = padded & ~@as(usize, 3);
        const size = std.math.mul(usize, stride, height) catch return error.Overflow;
        const data = try allocator.alloc(u8, size);
        errdefer allocator.free(data);
        @memset(data, 0);
        return .{ .allocator = allocator, .view = try View.init(data, width, height, stride, format, palette) };
    }

    /// Copies an existing view into independent storage. Encoded pixel bits are
    /// preserved, including higher precision packed components and palette
    /// indices. Row padding is newly initialized; the palette remains borrowed.
    pub fn copy(allocator: std.mem.Allocator, source: View) Error!Surface {
        var result = try Surface.init(allocator, source.width, source.height, source.format, source.palette);
        errdefer result.deinit();
        for (0..source.height) |y| @memcpy(try result.view.row(y), try source.row(y));
        return result;
    }

    /// Converts through eight-bit RGBA into a new format/palette. Matching
    /// formats and palette borrows use a bit-preserving copy. Other conversions
    /// have the byte-color API's precision, not an implied HDR/colorspace change.
    /// Allocation or pixel errors release the incomplete result automatically.
    pub fn convert(allocator: std.mem.Allocator, source: View, format: pixels.Format, palette: ?[]const pixels.Color) Error!Surface {
        const same_palette = if (source.palette) |previous|
            (if (palette) |next| previous.ptr == next.ptr and previous.len == next.len else false)
        else
            palette == null;
        if (std.meta.eql(source.format, format) and same_palette) return Surface.copy(allocator, source);
        var result = try Surface.init(allocator, source.width, source.height, format, palette);
        errdefer result.deinit();
        for (0..source.height) |y| {
            const input = try source.row(y);
            const output = try result.view.row(y);
            for (0..source.width) |x| try format.write(output, x, try source.format.read(input, x, source.palette), palette);
        }
        return result;
    }

    /// Creates an independently owned scaled raster. Nearest sampling preserves
    /// encoded bits/indices. Linear sampling follows SDL's scalar seven-bit,
    /// vertical-then-horizontal interpolation and edge clamping. Palettes force
    /// nearest, as SDL does; interpolating indices has no color meaning.
    pub fn scaled(allocator: std.mem.Allocator, source: View, width: u31, height: u31, mode: ScaleMode) Error!Surface {
        if (source.width == 0 or source.height == 0 or width == 0 or height == 0) return error.InvalidSize;
        var output = try Surface.init(allocator, width, height, source.format, source.palette);
        errdefer output.deinit();
        const nearest = mode != .linear or source.format == .indexed;
        const x_step = (@as(u64, source.width) << 16) / width;
        const y_step = (@as(u64, source.height) << 16) / height;
        for (0..height) |y| {
            const destination = try output.view.row(y);
            if (nearest) {
                const source_y: usize = @intCast(@min(@as(u64, source.height - 1), (y_step / 2 + @as(u64, y) * y_step) >> 16));
                const input = try source.row(source_y);
                for (0..width) |x| {
                    const source_x: usize = @intCast(@min(@as(u64, source.width - 1), (x_step / 2 + @as(u64, x) * x_step) >> 16));
                    if (source.format == .indexed) {
                        const indexed = source.format.indexed;
                        try indexed.write_index(destination, x, try indexed.read_index(input, source_x));
                    } else {
                        const bytes = source.format.bits_per_pixel() / 8;
                        @memcpy(destination[x * bytes ..][0..bytes], input[source_x * bytes ..][0..bytes]);
                    }
                }
            } else {
                const vertical = linear_axis(source.height, y_step, y);
                const top = try source.row(vertical.first);
                const bottom = try source.row(vertical.second);
                for (0..width) |x| {
                    const horizontal = linear_axis(source.width, x_step, x);
                    const left = interpolate_colors(try source.format.read(top, horizontal.first, source.palette), try source.format.read(bottom, horizontal.first, source.palette), vertical.fraction);
                    const right = interpolate_colors(try source.format.read(top, horizontal.second, source.palette), try source.format.read(bottom, horizontal.second, source.palette), vertical.fraction);
                    try source.format.write(destination, x, interpolate_colors(left, right, horizontal.fraction), source.palette);
                }
            }
        }
        return output;
    }

    /// Releases the owned pixel buffer; borrowed views become invalid. Palette
    /// storage belongs to its separate owner and is never released here.
    pub fn deinit(self: *Surface) void {
        self.allocator.free(self.view.data);
        self.* = undefined;
    }
};

// Blend equations follow SDL_blendmode.h's normalized-factor contract. Native
// structs replace encoded integer bit fields. One scalar implementation covers
// custom equations as well as the predefined modes; specialized GPU/packed blit
// acceleration and byte-exact parity with old approximate integer paths remain
// later work, not a hidden dispatch table in this API.

/// Component multiplication factors used before the blend operation.
pub const Factor = enum { zero, one, source_color, inverse_source_color, source_alpha, inverse_source_alpha, destination_color, inverse_destination_color, destination_alpha, inverse_destination_alpha };
/// Operation on the two weighted source/destination components.
pub const Operation = enum { add, subtract, reverse_subtract, minimum, maximum };
/// One independent color/alpha equation.
pub const Equation = struct { source: Factor, destination: Factor, operation: Operation = .add };
/// Explicit blend state. Color and alpha equations are independently configurable.
pub const Blend = struct {
    color: Equation,
    alpha: Equation,
    pub const REPLACE: Blend = .{ .color = .{ .source = .one, .destination = .zero }, .alpha = .{ .source = .one, .destination = .zero } };
    pub const ALPHA: Blend = .{ .color = .{ .source = .source_alpha, .destination = .inverse_source_alpha }, .alpha = .{ .source = .one, .destination = .inverse_source_alpha } };
    pub const PREMULTIPLIED: Blend = .{ .color = .{ .source = .one, .destination = .inverse_source_alpha }, .alpha = .{ .source = .one, .destination = .inverse_source_alpha } };
    pub const ADD: Blend = .{ .color = .{ .source = .source_alpha, .destination = .one }, .alpha = .{ .source = .zero, .destination = .one } };
    pub const MODULATE: Blend = .{ .color = .{ .source = .zero, .destination = .source_color }, .alpha = .{ .source = .zero, .destination = .one } };
    pub const MULTIPLY: Blend = .{ .color = .{ .source = .destination_color, .destination = .inverse_source_alpha }, .alpha = .{ .source = .zero, .destination = .one } };

    /// Applies normalized eight-bit factors, clamps the result and truncates once
    /// at the final byte boundary, matching scalar unorm division by 255. Alpha is not gamma-converted implicitly.
    pub fn apply(self: Blend, source: pixels.Color, destination: pixels.Color) pixels.Color {
        const src = [_]u8{ source.r, source.g, source.b, source.a };
        const dst = [_]u8{ destination.r, destination.g, destination.b, destination.a };
        var result: [4]u8 = undefined;
        for (&result, 0..) |*component, index| {
            const equation = if (index == 3) self.alpha else self.color;
            const left = @as(i32, src[index]) * factor(equation.source, src, dst, index);
            const right = @as(i32, dst[index]) * factor(equation.destination, src, dst, index);
            const value = switch (equation.operation) {
                .add => left + right,
                .subtract => left - right,
                .reverse_subtract => right - left,
                .minimum => @min(left, right),
                .maximum => @max(left, right),
            };
            component.* = @intCast(@divTrunc(std.math.clamp(value, 0, 65025), 255));
        }
        return .{ .r = result[0], .g = result[1], .b = result[2], .a = result[3] };
    }
};
/// Blit state is passed to each operation; no hidden surface-global modulation
/// or clipping state survives between calls. Color keys compare RGB only.
pub const BlitOptions = struct {
    source_region: ?geometry.Rect(i32) = null,
    destination: geometry.Point(i32) = .{ .x = 0, .y = 0 },
    clip: ?geometry.Rect(i32) = null,
    blend: Blend = Blend.REPLACE,
    modulation: pixels.Color = .{ .r = 255, .g = 255, .b = 255 },
    color_key: ?pixels.Color = null,
};

fn factor(kind: Factor, source: [4]u8, destination: [4]u8, index: usize) i32 {
    return switch (kind) {
        .zero => 0,
        .one => 255,
        .source_color => source[index],
        .inverse_source_color => 255 - @as(i32, source[index]),
        .source_alpha => source[3],
        .inverse_source_alpha => 255 - @as(i32, source[3]),
        .destination_color => destination[index],
        .inverse_destination_color => 255 - @as(i32, destination[index]),
        .destination_alpha => destination[3],
        .inverse_destination_alpha => 255 - @as(i32, destination[3]),
    };
}
fn modulate(color: pixels.Color, multiplier: pixels.Color) pixels.Color {
    return .{
        .r = @intCast((@as(u32, color.r) * multiplier.r) / 255),
        .g = @intCast((@as(u32, color.g) * multiplier.g) / 255),
        .b = @intCast((@as(u32, color.b) * multiplier.b) / 255),
        .a = @intCast((@as(u32, color.a) * multiplier.a) / 255),
    };
}
fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const x = @intFromPtr(a.ptr);
    const y = @intFromPtr(b.ptr);
    return if (x <= y) y - x < a.len else x - y < b.len;
}

/// Raster sampling policy; pixel_art currently uses nearest like SDL_StretchSurface.
pub const ScaleMode = enum { nearest, linear, pixel_art };
const Axis = struct { first: usize, second: usize, fraction: u8 };
fn linear_axis(source_length: u31, step: u64, index: usize) Axis {
    // Center-to-center mapping, with pixman's rounded half step used by SDL.
    // i64 safely covers u31 dimensions shifted by sixteen fractional bits.
    const position = @as(i64, @intCast((step + 1) / 2)) - 32768 + @as(i64, @intCast(@as(u64, index) * step));
    if (position <= 0) return .{ .first = 0, .second = 0, .fraction = 0 };
    const first: usize = @intCast(position >> 16);
    if (first >= source_length - 1) return .{ .first = source_length - 1, .second = source_length - 1, .fraction = 0 };
    return .{ .first = first, .second = first + 1, .fraction = @intCast((position >> 9) & 127) };
}
fn interpolate_colors(first: pixels.Color, second: pixels.Color, fraction: u8) pixels.Color {
    const inverse: u32 = 128 - @as(u32, fraction);
    return .{
        .r = @intCast((@as(u32, first.r) * inverse + @as(u32, second.r) * fraction) >> 7),
        .g = @intCast((@as(u32, first.g) * inverse + @as(u32, second.g) * fraction) >> 7),
        .b = @intCast((@as(u32, first.b) * inverse + @as(u32, second.b) * fraction) >> 7),
        .a = @intCast((@as(u32, first.a) * inverse + @as(u32, second.a) * fraction) >> 7),
    };
}
