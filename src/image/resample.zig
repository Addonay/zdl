//! Separable image resampling with cache-friendly weight tables.
//!
//! The same kernel machinery shrinks and enlarges: when the destination is
//! smaller the kernel is stretched by the scale factor and its taps are
//! averaged, which is the area-average behavior correct minifiers need and the
//! reason a Lanczos3 downscale does not alias. Filters are evaluated once per
//! output sample into a flat tap table, then applied in a horizontal pass into
//! a bounded band of floating-point rows and a vertical pass into the output,
//! so temporary memory is a few megabytes even for very large images.
//!
//! Sources are converted to RGBA8 unless they already are, which keeps the
//! inner loop a plain four-float vector operation.
const std = @import("std");
const builtin = @import("builtin");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const options = @import("options.zig");

pub const Filter = options.Filter;
pub const Error = surface.Error || std.mem.Allocator.Error || error{InvalidSize};

/// Rows of intermediate floating-point samples held at once. Bands keep peak
/// memory at a few megabytes without hurting cache reuse: a band is written
/// once horizontally and read once vertically.
const band_rows = 32;

/// One source sample and its weight for an output sample.
const Tap = struct { index: u32, weight: f32 };

/// Flattened tap table for one axis: `offsets[i]` is the first tap of output
/// sample `i`, `counts[i]` how many taps it has.
const Weights = struct {
    offsets: []u32,
    counts: []u32,
    taps: []Tap,
    storage: []f32,

    fn deinit(self: *Weights, allocator: std.mem.Allocator) void {
        allocator.free(self.offsets);
        allocator.free(self.counts);
        allocator.free(self.taps);
        allocator.free(self.storage);
    }
};

/// Half-width of the kernel's support in source samples before scaling.
fn supportRadius(filter: Filter) f32 {
    return switch (filter) {
        .nearest => 0.5,
        .box => 0.5,
        .bilinear => 1.0,
        .bicubic => 2.0,
        .lanczos3 => 3.0,
    };
}

fn kernel(filter: Filter, x: f32) f32 {
    const ax = @abs(x);
    return switch (filter) {
        // Nearest is handled by index selection, not by a continuous kernel.
        .nearest => 0,
        // A box kernel is exactly the pixel footprint; stretching it by the
        // minification factor turns it into an area average.
        .box => if (ax <= 0.5) 1 else 0,
        .bilinear => if (ax < 1) 1 - ax else 0,
        .bicubic => cubic(ax),
        .lanczos3 => if (ax < 3) sinc(ax) * sinc(ax / 3) else 0,
    };
}

/// Mitchell-Netravali with B = C = 1/3.
fn cubic(x: f32) f32 {
    if (x < 1) return (7 * x * x * x - 12 * x * x + 16.0 / 3.0) / 6;
    if (x < 2) return (-7.0 / 3.0 * x * x * x + 12 * x * x - 20 * x + 32.0 / 3.0) / 6;
    return 0;
}

/// sinc window for Lanczos, normalized so the kernel integrates to one.
fn sinc(x: f32) f32 {
    if (x == 0) return 1;
    const pix = std.math.pi * x;
    return @sin(pix) / pix;
}

/// Builds the tap table for one axis. Taps are clamped to the source extent,
/// which reproduces the edge behavior of common image libraries.
fn buildWeights(allocator: std.mem.Allocator, filter: Filter, src_len: usize, dst_len: usize) Error!Weights {
    if (src_len == 0 or dst_len == 0) return error.InvalidSize;
    const scale = @as(f32, @floatFromInt(dst_len)) / @as(f32, @floatFromInt(src_len));
    // Minification stretches the kernel; magnification keeps its natural width.
    const filter_scale: f32 = if (scale < 1) 1 / scale else 1;
    const support = supportRadius(filter) * filter_scale;
    const filter_support: f32 = if (filter == .nearest) 0.5 else support;
    // Taps per output sample, rounded up, plus a margin for edge clamping.
    const max_taps: usize = @as(usize, @intFromFloat(@ceil(filter_support * 2))) + 2;

    const offsets = try allocator.alloc(u32, dst_len);
    errdefer allocator.free(offsets);
    const counts = try allocator.alloc(u32, dst_len);
    errdefer allocator.free(counts);
    const taps = try allocator.alloc(Tap, dst_len * max_taps);
    errdefer allocator.free(taps);
    const storage = try allocator.alloc(f32, dst_len * max_taps);
    errdefer allocator.free(storage);

    var count: usize = 0;
    for (0..dst_len) |i| {
        offsets[i] = @intCast(count);
        const center = (@as(f32, @floatFromInt(i)) + 0.5) / scale;
        if (filter == .nearest) {
            const index = clampIndex(@as(usize, @intFromFloat(@floor(center))), src_len);
            taps[count] = .{ .index = @intCast(index), .weight = 1 };
            storage[count] = 1;
            count += 1;
            counts[i] = 1;
            continue;
        }
        const first: i64 = @intFromFloat(@ceil(center - support - 0.5));
        const last: i64 = @intFromFloat(@floor(center + support - 0.5));
        var sum: f32 = 0;
        var taps_here: usize = 0;
        var j = first;
        while (j <= last) : (j += 1) {
            const sample: f32 = @floatFromInt(j);
            const distance = (sample + 0.5 - center) / filter_scale;
            const weight = if (filter == .box)
                @max(0, @min(sample + 1, center + filter_scale * 0.5) - @max(sample, center - filter_scale * 0.5))
            else
                kernel(filter, distance);
            if (weight == 0) continue;
            const index: u32 = @intCast(@max(0, @min(j, @as(i64, @intCast(src_len - 1)))));
            storage[count] = weight;
            taps[count] = .{ .index = index, .weight = weight };
            sum += weight;
            count += 1;
            taps_here += 1;
        }
        if (taps_here == 0 or @abs(sum) < 1e-8) {
            count = offsets[i];
            const index = clampIndex(@as(usize, @intFromFloat(@floor(center))), src_len);
            storage[count] = 1;
            taps[count] = .{ .index = @intCast(index), .weight = 1 };
            sum = 1;
            count += 1;
            taps_here = 1;
        }
        // Normalize so constant regions stay constant.
        if (sum != 0) {
            const inv: f32 = 1 / sum;
            for (0..taps_here) |k| {
                const slot = offsets[i] + k;
                taps[slot].weight *= inv;
                storage[slot] *= inv;
            }
        }
        counts[i] = @intCast(taps_here);
    }
    return .{ .offsets = offsets, .counts = counts, .taps = taps, .storage = storage };
}

fn clampIndex(index: usize, len: usize) usize {
    return if (index >= len) len - 1 else index;
}

/// Resamples `source` into a new RGBA8 surface of the requested size.
pub fn resize(
    allocator: std.mem.Allocator,
    source: surface.View,
    width: u31,
    height: u31,
    filter: Filter,
) Error!surface.Surface {
    return resizeFormat(allocator, source, width, height, filter, .rgba8, null);
}

/// Resamples into any eight-bit surface format, converting the source first when
/// its layout cannot be read as RGBA8.
pub fn resizeFormat(
    allocator: std.mem.Allocator,
    source: surface.View,
    width: u31,
    height: u31,
    filter: Filter,
    format: pixels.Format,
    palette: ?[]const pixels.Color,
) Error!surface.Surface {
    if (width == 0 or height == 0) return error.InvalidSize;
    var owned: ?surface.Surface = null;
    defer if (owned) |*temporary| temporary.deinit();
    var input = source;
    if (!std.meta.eql(source.format, .rgba8)) {
        // Two conversions (indexed source, indexed target) need the ramp.
        const converted = try surface.Surface.convert(allocator, source, .rgba8, null);
        owned = converted;
        input = converted.view;
    }
    var horizontal = try buildWeights(allocator, filter, input.width, width);
    defer horizontal.deinit(allocator);
    var vertical = try buildWeights(allocator, filter, input.height, height);
    defer vertical.deinit(allocator);

    var result = try surface.Surface.init(allocator, width, height, .rgba8, null);
    errdefer result.deinit();

    const band_stride = @as(usize, width) * 4;
    var cache_rows: usize = @min(band_rows, input.height);
    for (vertical.counts) |count| cache_rows = @max(cache_rows, count);
    const band = try allocator.alloc(f32, cache_rows * band_stride);
    defer allocator.free(band);
    const cached = try allocator.alloc(u32, cache_rows);
    defer allocator.free(cached);
    @memset(cached, std.math.maxInt(u32));
    for (0..height) |y| {
        const first = vertical.offsets[y];
        const taps = vertical.taps[first..][0..vertical.counts[y]];
        for (taps) |tap| {
            const slot = tap.index % cache_rows;
            if (cached[slot] != tap.index) {
                applyHorizontal(try input.row(tap.index), band[slot * band_stride ..][0..band_stride], horizontal, width);
                cached[slot] = tap.index;
            }
        }
        applyVertical(band, try result.view.row(y), taps, band_stride, cache_rows);
    }
    if (!std.meta.eql(format, .rgba8)) {
        const converted = try surface.Surface.convert(allocator, result.view, format, palette);
        result.deinit();
        return converted;
    }
    return result;
}

/// Four floats at a time keeps the horizontal inner loop in vector registers.
fn applyHorizontal(src: []const u8, dst: []f32, weights: Weights, dst_width: usize) void {
    const V = @Vector(4, f32);
    for (0..dst_width) |x| {
        const first = weights.offsets[x];
        const taps = weights.taps[first..][0..weights.counts[x]];
        var acc: V = @splat(0);
        for (taps) |tap| {
            const bytes: @Vector(4, u8) = src[tap.index * 4 ..][0..4].*;
            const p: V = @floatFromInt(bytes);
            acc += p * @as(V, @splat(tap.weight));
        }
        dst[x * 4 ..][0..4].* = acc;
    }
}

fn applyVertical(band: []const f32, dst: []u8, taps: []const Tap, band_stride: usize, cache_rows: usize) void {
    const V = @Vector(4, f32);
    var x: usize = 0;
    while (x < dst.len) : (x += 4) {
        var acc: V = @splat(0);
        for (taps) |tap| {
            const offset = (tap.index % cache_rows) * band_stride + x;
            const value: V = band[offset..][0..4].*;
            acc += value * @as(V, @splat(tap.weight));
        }
        const clamped: V = @min(@max(acc, @as(V, @splat(0))), @as(V, @splat(255)));
        const bytes: @Vector(4, u8) = @intFromFloat(clamped + @as(V, @splat(0.5)));
        dst[x..][0..4].* = bytes;
    }
}

/// Size both axes to fit a box while preserving the aspect ratio, returning null
/// when no change is needed. `max_dimension` only shrinks.
pub fn fitDimensions(src_width: u32, src_height: u32, settings: options.Resize) ?struct { width: u32, height: u32 } {
    if (!settings.isRequested()) return null;
    var width = src_width;
    var height = src_height;
    if (settings.width) |w| width = w;
    if (settings.height) |h| height = h;
    if (src_width == 0 or src_height == 0) return null;
    if (settings.width != null and settings.height == null)
        height = @intCast(@min(std.math.maxInt(u31), @max(1, @as(u64, src_height) * width / src_width)));
    if (settings.height != null and settings.width == null)
        width = @intCast(@min(std.math.maxInt(u31), @max(1, @as(u64, src_width) * height / src_height)));
    if (settings.max_dimension) |limit| {
        const longest = @max(width, height);
        if (longest > limit) {
            // Scale the axis that is not pinned; with neither pinned, fit the
            // longer edge and derive the other from the aspect ratio.
            width = @intCast(@max(1, @as(u64, width) * limit / longest));
            height = @intCast(@max(1, @as(u64, height) * limit / longest));
        }
    }
    if (settings.width == null and settings.height == null and settings.max_dimension != null) {
        const longest = @max(src_width, src_height);
        if (longest <= settings.max_dimension.?) return null;
    }
    width = @max(1, @min(width, std.math.maxInt(u31)));
    height = @max(1, @min(height, std.math.maxInt(u31)));
    if (width == src_width and height == src_height) return null;
    return .{ .width = width, .height = height };
}

test "resampling preserves flat color and averages a box" {
    const allocator = std.testing.allocator;
    var source = try surface.Surface.init(allocator, 4, 4, .rgba8, null);
    defer source.deinit();
    for (0..4) |y| for (0..4) |x| {
        const value: u8 = if (x < 2) 0 else 255;
        try source.view.write(x, y, .{ .r = value, .g = value, .b = value, .a = 255 });
    };
    var same = try resize(allocator, source.view, 4, 4, .lanczos3);
    defer same.deinit();
    for (0..4) |y| for (0..4) |x| {
        try std.testing.expectEqual(@as(u8, if (x < 2) 0 else 255), (try same.view.read(x, y)).r);
    };
    var half = try resize(allocator, source.view, 2, 2, .box);
    defer half.deinit();
    for (0..2) |y| for (0..2) |x| {
        const color = try half.view.read(x, y);
        // Each two-pixel footprint lies wholly within one flat region.
        try std.testing.expectEqual(@as(u8, if (x == 0) 0 else 255), color.r);
    };
    var big = try resize(allocator, source.view, 8, 8, .bilinear);
    defer big.deinit();
    try std.testing.expectEqual(@as(u32, 8), big.view.width);
}

test "fitDimensions honors boxes, limits and the no-op case" {
    try std.testing.expect((fitDimensions(100, 50, .{})) == null);
    const box = (fitDimensions(100, 50, .{ .width = 25 })).?;
    try std.testing.expectEqual(@TypeOf(box){ .width = 25, .height = 12 }, box);
    const pinned = (fitDimensions(100, 50, .{ .height = 100 })).?;
    try std.testing.expectEqual(@TypeOf(pinned){ .width = 200, .height = 100 }, pinned);
    const limited = (fitDimensions(800, 400, .{ .max_dimension = 100 })).?;
    try std.testing.expectEqual(@TypeOf(limited){ .width = 100, .height = 50 }, limited);
    // A limit larger than the image must not enlarge it.
    try std.testing.expect((fitDimensions(80, 40, .{ .max_dimension = 100 })) == null);
}

test "resampler handles deep minification, tall output and RGB source rows" {
    const a = std.testing.allocator;
    var striped = try surface.Surface.init(a, 3, 96, .rgb8, null);
    defer striped.deinit();
    for (0..96) |y| for (0..3) |x| {
        const value: u8 = if (y % 2 == 0) 0 else 255;
        try striped.view.write(x, y, .{ .r = value, .g = value, .b = value, .a = 255 });
    };
    var small = try resize(a, striped.view, 1, 1, .box);
    defer small.deinit();
    try std.testing.expectEqual(@as(u8, 128), (try small.view.read(0, 0)).r);
    var large = try resize(a, striped.view, 7, 160, .bilinear);
    defer large.deinit();
    for (0..large.view.height) |y| for (0..large.view.width) |x| {
        const c = try large.view.read(x, y);
        try std.testing.expectEqual(c.r, c.g);
        try std.testing.expectEqual(@as(u8, 255), c.a);
    };
}
