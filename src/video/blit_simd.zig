//! Vector row kernels for eight-bit, byte-addressed RGB and RGBA blits.
//!
//! The formats `rgba8`, `bgra8`, `argb8`, `abgr8`, `rgb8` and `bgr8` blit eight
//! pixels at a time in `@Vector` lanes. Each source/destination kind pair is
//! comptime-specialized, so channel gathers and scatters become byte shuffles.
//! The blend arithmetic is shared runtime code over i32 lanes. Indexed and
//! packed-mask formats never reach this module and keep the scalar path.
//!
//! The lane arithmetic is the same integer computation as `surface.Blend.apply`:
//! normalized factors, a clamp to [0, 65025] and one truncating division by 255.
//! Results are therefore bit-identical to the scalar path, which the tests below
//! check. SDL's SSE, NEON and AltiVec blitters use approximate shift-based alpha
//! formulas instead; this port does not reproduce those rounding rules.
//!
//! Pixels that do not fill a whole lane group are left to the caller's scalar
//! loop. `blit_row` reports how many leading pixels it consumed.
const std = @import("std");
const pixels = @import("pixels.zig");
const surface = @import("surface.zig");

/// Pixels per vector chunk.
pub const lanes = 8;
const Lanes = @Vector(lanes, i32);
const Mask = @Vector(lanes, bool);

const splat_zero: Lanes = @splat(0);
const splat_opaque: Lanes = @splat(255);
const splat_max_product: Lanes = @splat(65025);
const splat_divisor: Lanes = @splat(255);

/// Byte-addressed storage kinds handled by the vector path.
pub const Kind = enum {
    rgba8,
    bgra8,
    argb8,
    abgr8,
    rgb8,
    bgr8,

    /// Maps a pixel format to its vector kind. Other formats return null.
    pub fn of(format: pixels.Format) ?Kind {
        return switch (format) {
            .rgba8 => .rgba8,
            .bgra8 => .bgra8,
            .argb8 => .argb8,
            .abgr8 => .abgr8,
            .rgb8 => .rgb8,
            .bgr8 => .bgr8,
            else => null,
        };
    }

    /// Bytes per pixel.
    pub fn bytes(self: Kind) usize {
        return switch (self) {
            .rgb8, .bgr8 => 3,
            else => 4,
        };
    }

    /// Byte offsets of each channel within one pixel. `null` alpha means the
    /// format stores no alpha; reads yield opaque and writes discard it.
    const Offsets = struct { r: usize, g: usize, b: usize, a: ?usize };

    fn offsets(self: Kind) Offsets {
        return switch (self) {
            .rgba8 => .{ .r = 0, .g = 1, .b = 2, .a = 3 },
            .bgra8 => .{ .r = 2, .g = 1, .b = 0, .a = 3 },
            .argb8 => .{ .r = 1, .g = 2, .b = 3, .a = 0 },
            .abgr8 => .{ .r = 3, .g = 2, .b = 1, .a = 0 },
            .rgb8 => .{ .r = 0, .g = 1, .b = 2, .a = null },
            .bgr8 => .{ .r = 2, .g = 1, .b = 0, .a = null },
        };
    }
};

/// One channel for `lanes` consecutive pixels. Values are in [0, 255].
const Planes = struct { r: Lanes, g: Lanes, b: Lanes, a: Lanes };

/// Blit state for one row run. Mirrors the relevant fields of
/// `surface.BlitOptions`, without the region and clipping parts.
pub const Params = struct {
    blend: surface.Blend,
    modulation: pixels.Color,
    color_key: ?pixels.Color,
};

/// Blends whole lane groups of one row and returns how many pixels were
/// consumed, starting at the given indices. The caller blends the remainder.
/// Both rows must already be checked to hold the requested pixels. Source and
/// destination must not alias; `surface.View.blit` snapshots overlapping input.
pub fn blit_row(
    source_kind: Kind,
    destination_kind: Kind,
    params: Params,
    source_row: []const u8,
    source_x: usize,
    destination_row: []u8,
    destination_x: usize,
    count: usize,
) usize {
    return switch (source_kind) {
        inline else => |source| switch (destination_kind) {
            inline else => |destination| blit_groups(source, destination, params, source_row, source_x, destination_row, destination_x, count),
        },
    };
}

fn blit_groups(
    comptime source: Kind,
    comptime destination: Kind,
    params: Params,
    source_row: []const u8,
    source_x: usize,
    destination_row: []u8,
    destination_x: usize,
    count: usize,
) usize {
    var done: usize = 0;
    while (done + lanes <= count) : (done += lanes) {
        const input = load(source, source_row, source_x + done);
        const existing = load(destination, destination_row, destination_x + done);
        const result = combine(params, input, existing);
        store(destination, destination_row, destination_x + done, result);
    }
    return done;
}

/// Reads `lanes` pixels into channel vectors. The block load is one checked
/// slice; each channel is then extracted by a comptime shuffle mask.
fn load(comptime kind: Kind, row: []const u8, first: usize) Planes {
    const pixel_bytes = comptime kind.bytes();
    const block_len = lanes * pixel_bytes;
    const block: @Vector(block_len, u8) = row[first * pixel_bytes ..][0..block_len].*;
    const offsets = comptime kind.offsets();
    return .{
        .r = gather(pixel_bytes, offsets.r, block),
        .g = gather(pixel_bytes, offsets.g, block),
        .b = gather(pixel_bytes, offsets.b, block),
        .a = if (comptime offsets.a) |offset| gather(pixel_bytes, offset, block) else splat_opaque,
    };
}

fn gather(comptime pixel_bytes: usize, comptime offset: usize, block: anytype) Lanes {
    const mask = comptime channel_mask(pixel_bytes, offset);
    const picked: @Vector(lanes, u8) = @shuffle(u8, block, block, mask);
    return @as(Lanes, picked);
}

fn channel_mask(comptime pixel_bytes: usize, comptime offset: usize) @Vector(lanes, i32) {
    var mask: @Vector(lanes, i32) = undefined;
    for (0..lanes) |lane| mask[lane] = @intCast(lane * pixel_bytes + offset);
    return mask;
}

/// Writes `lanes` pixels from channel vectors. Values are already in [0, 255];
/// alpha is written only when the destination kind stores it.
fn store(comptime kind: Kind, row: []u8, first: usize, planes: Planes) void {
    const pixel_bytes = comptime kind.bytes();
    const offsets = comptime kind.offsets();
    // Vectors cannot be indexed by a runtime lane, so the bytes move as arrays.
    const red: [lanes]u8 = @as(@Vector(lanes, u8), @intCast(planes.r));
    const green: [lanes]u8 = @as(@Vector(lanes, u8), @intCast(planes.g));
    const blue: [lanes]u8 = @as(@Vector(lanes, u8), @intCast(planes.b));
    const alpha: [lanes]u8 = @as(@Vector(lanes, u8), @intCast(planes.a));
    for (0..lanes) |lane| {
        const at = (first + lane) * pixel_bytes;
        row[at + offsets.r] = red[lane];
        row[at + offsets.g] = green[lane];
        row[at + offsets.b] = blue[lane];
        if (comptime offsets.a) |offset| row[at + offset] = alpha[lane];
    }
}

/// Computes the stored result for one lane group. Modulation and the color
/// key use the same order as the scalar loop: key test on the raw source,
/// then modulation, then the blend equations against the destination.
fn combine(params: Params, input: Planes, existing: Planes) Planes {
    const skip: Mask = if (params.color_key) |key|
        (input.r == @as(Lanes, @splat(key.r))) & (input.g == @as(Lanes, @splat(key.g))) & (input.b == @as(Lanes, @splat(key.b)))
    else
        @splat(false);

    const modulated = modulate(input, params.modulation);
    const replaced: Planes = if (std.meta.eql(params.blend, surface.Blend.REPLACE)) modulated else .{
        .r = equation(params.blend.color, modulated.r, existing.r, modulated.a, existing.a),
        .g = equation(params.blend.color, modulated.g, existing.g, modulated.a, existing.a),
        .b = equation(params.blend.color, modulated.b, existing.b, modulated.a, existing.a),
        .a = equation(params.blend.alpha, modulated.a, existing.a, modulated.a, existing.a),
    };

    return .{
        .r = @select(i32, skip, existing.r, replaced.r),
        .g = @select(i32, skip, existing.g, replaced.g),
        .b = @select(i32, skip, existing.b, replaced.b),
        .a = @select(i32, skip, existing.a, replaced.a),
    };
}

/// `(channel * multiplier) / 255` with truncation, as `surface.modulate`.
fn modulate(planes: Planes, multiplier: pixels.Color) Planes {
    return .{
        .r = @divTrunc(planes.r * @as(Lanes, @splat(multiplier.r)), splat_divisor),
        .g = @divTrunc(planes.g * @as(Lanes, @splat(multiplier.g)), splat_divisor),
        .b = @divTrunc(planes.b * @as(Lanes, @splat(multiplier.b)), splat_divisor),
        .a = @divTrunc(planes.a * @as(Lanes, @splat(multiplier.a)), splat_divisor),
    };
}

/// One channel's equation, identical to `surface.Blend.apply` for that index.
fn equation(eq: surface.Equation, source: Lanes, destination: Lanes, source_alpha: Lanes, destination_alpha: Lanes) Lanes {
    const left = source * factor(eq.source, source, destination, source_alpha, destination_alpha);
    const right = destination * factor(eq.destination, source, destination, source_alpha, destination_alpha);
    const value = switch (eq.operation) {
        .add => left + right,
        .subtract => left - right,
        .reverse_subtract => right - left,
        .minimum => @min(left, right),
        .maximum => @max(left, right),
    };
    const clamped = @min(@max(value, splat_zero), splat_max_product);
    return @divTrunc(clamped, splat_divisor);
}

fn factor(kind: surface.Factor, source: Lanes, destination: Lanes, source_alpha: Lanes, destination_alpha: Lanes) Lanes {
    return switch (kind) {
        .zero => splat_zero,
        .one => splat_opaque,
        .source_color => source,
        .inverse_source_color => splat_opaque - source,
        .source_alpha => source_alpha,
        .inverse_source_alpha => splat_opaque - source_alpha,
        .destination_color => destination,
        .inverse_destination_color => splat_opaque - destination,
        .destination_alpha => destination_alpha,
        .inverse_destination_alpha => splat_opaque - destination_alpha,
    };
}

test "vector blit matches the scalar reference" {
    const allocator = std.testing.allocator;
    const formats = [_]pixels.Format{ .rgba8, .bgra8, .argb8, .abgr8, .rgb8, .bgr8 };
    const factors = std.meta.tags(surface.Factor);
    const operations = std.meta.tags(surface.Operation);
    const variants = [_]struct { modulation: pixels.Color, key: ?pixels.Color }{
        .{ .modulation = .{ .r = 255, .g = 255, .b = 255 }, .key = null },
        .{ .modulation = .{ .r = 128, .g = 200, .b = 64, .a = 180 }, .key = null },
        .{ .modulation = .{ .r = 255, .g = 255, .b = 255 }, .key = .{ .r = 32, .g = 32, .b = 32 } },
        .{ .modulation = .{ .r = 255, .g = 0, .b = 77, .a = 128 }, .key = .{ .r = 0, .g = 0, .b = 0 } },
    };
    const widths = [_]u31{ 1, 7, 8, 9, 17 };
    const predefined = [_]surface.Blend{ surface.Blend.REPLACE, surface.Blend.ALPHA, surface.Blend.PREMULTIPLIED, surface.Blend.ADD, surface.Blend.MODULATE, surface.Blend.MULTIPLY };

    var prng = std.Random.DefaultPrng.init(0x5d1f_7a3c);
    const random = prng.random();
    // Choosing from few byte values makes exact color-key matches common.
    const sparse = [_]u8{ 0, 32, 128, 255 };

    for (formats) |source_format| {
        for (formats) |destination_format| {
            for (widths, 0..) |width, width_index| {
                for (0..predefined.len + factors.len * factors.len) |blend_index| {
                    const blend: surface.Blend = if (blend_index < predefined.len) predefined[blend_index] else blk: {
                        const pair = blend_index - predefined.len;
                        const source_factor = factors[pair / factors.len];
                        const destination_factor = factors[pair % factors.len];
                        break :blk .{
                            .color = .{ .source = source_factor, .destination = destination_factor, .operation = operations[pair % operations.len] },
                            .alpha = .{ .source = factors[(pair + 1) % factors.len], .destination = factors[(pair + 3) % factors.len], .operation = operations[(pair / 2) % operations.len] },
                        };
                    };
                    const variant = variants[(blend_index + width_index) % variants.len];

                    var source = try surface.Surface.init(allocator, width + 3, 3, source_format, null);
                    defer source.deinit();
                    for (source.view.data) |*byte| byte.* = sparse[random.uintLessThan(usize, sparse.len)];

                    var destination = try surface.Surface.init(allocator, width + 2, 3, destination_format, null);
                    defer destination.deinit();
                    random.bytes(destination.view.data);
                    var reference = try surface.Surface.init(allocator, width + 2, 3, destination_format, null);
                    defer reference.deinit();
                    @memcpy(reference.view.data, destination.view.data);

                    const options: surface.BlitOptions = .{
                        .source_region = .{ .x = 1, .y = 0, .width = width, .height = 3 },
                        .destination = .{ .x = 1, .y = 0 },
                        .blend = blend,
                        .modulation = variant.modulation,
                        .color_key = variant.key,
                    };
                    _ = try destination.view.blit(allocator, source.view, options);
                    _ = try reference.view.blit_scalar(allocator, source.view, options);
                    try std.testing.expectEqualSlices(u8, reference.view.data, destination.view.data);

                    // Overlapping self-blit exercises the snapshot path on both sides.
                    @memcpy(reference.view.data, destination.view.data);
                    const overlapping: surface.BlitOptions = .{
                        .source_region = .{ .x = 0, .y = 0, .width = width + 1, .height = 3 },
                        .destination = .{ .x = 1, .y = 0 },
                        .blend = blend,
                        .modulation = variant.modulation,
                        .color_key = variant.key,
                    };
                    if (std.meta.eql(source_format, destination_format)) {
                        _ = try destination.view.blit(allocator, destination.view, overlapping);
                        _ = try reference.view.blit_scalar(allocator, reference.view, overlapping);
                        try std.testing.expectEqualSlices(u8, reference.view.data, destination.view.data);
                    }
                }
            }
        }
    }
}

test "vector blit reports consumed pixels in whole lane groups" {
    var source: [9 * 4]u8 = undefined;
    for (&source, 0..) |*byte, index| byte.* = @intCast(index + 1);
    var destination = std.mem.zeroes([9 * 4]u8);
    const options: Params = .{ .blend = surface.Blend.REPLACE, .modulation = .{ .r = 255, .g = 255, .b = 255 }, .color_key = null };
    const consumed = blit_row(.rgba8, .rgba8, options, &source, 0, &destination, 0, 9);
    try std.testing.expectEqual(@as(usize, lanes), consumed);
    try std.testing.expectEqualSlices(u8, source[0 .. lanes * 4], destination[0 .. lanes * 4]);
    try std.testing.expectEqual(@as(u8, 0), destination[lanes * 4]);
}
