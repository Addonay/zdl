//! Vector kernels for the JPEG decoder: stb's 8x8 integer IDCT, its fixed-point
//! YCbCr to RGB row conversion, and the vertical 2:1 chroma upsampler.
//!
//! stb_image's SSE2 and NEON paths evaluate the same integer formulas as its
//! scalar code. These kernels do the same in eight-lane `@Vector` arithmetic, so
//! the results are bit-identical to the scalar references kept beside them. The
//! IDCT's first pass transforms eight columns at once (one lane per column), a
//! transpose presents the rows to the second pass, and the output is clamped
//! per lane. The zero-AC column shortcut in stb's scalar code is not needed:
//! for an all-zero AC column the full butterfly yields `(4096 * a0 + 512) >> 10`
//! = `4 * a0`, the same value the shortcut stores directly.
//!
//! Every function here is scalar-free at its public entry: tails shorter than a
//! lane group fall back to the reference loop, so callers pass any count.
const std = @import("std");

/// Lanes per vector chunk: eight 32-bit lanes, two SSE or one AVX2 register.
pub const lanes = 8;
const Lanes = @Vector(lanes, i32);
const Bytes = @Vector(lanes, u8);

const splat_zero: Lanes = @splat(0);
const splat_255: Lanes = @splat(255);
const shift2: Lanes = @splat(2);
const shift10: Lanes = @splat(10);
const shift17: Lanes = @splat(17);
const shift20: Lanes = @splat(20);

/// Clamps to [0, 255], as stb's `stbi__clamp`.
pub fn clamp_u8(x: i32) u8 {
    // Explicit signed bounds avoid narrowing the interior [128,255] range
    // incorrectly when the scalar reference is optimized/vectorized.
    return @intCast(@min(@max(x, @as(i32, 0)), @as(i32, 255)));
}

/// Eight outputs of one 1-D IDCT pass (or of its even and odd halves).
fn Outputs(comptime T: type) type {
    return struct { x0: T, x1: T, x2: T, x3: T, t0: T, t1: T, t2: T, t3: T };
}

/// One 1-D pass of stb's IDCT, evaluated on lanes of `T` (`i32` or `Lanes`).
/// Constants are stb's `stbi__f2f` values, i.e. round(c * 4096). Wrapping
/// arithmetic matches the C code's two's-complement behaviour.
/// A comptime constant in lane type `T`: a scalar for `i32`, else a splat.
fn constant(comptime T: type, comptime value: i32) T {
    return if (T == i32) value else @splat(value);
}

fn idct_1d(comptime T: type, s0: T, s1: T, s2: T, s3: T, s4: T, s5: T, s6: T, s7: T) Outputs(T) {
    var p2 = s2;
    var p3 = s6;
    var p1 = (p2 +% p3) *% constant(T, 2217); // 0.5411961
    var t2 = p1 +% p3 *% constant(T, -7567); // -1.847759065
    var t3 = p1 +% p2 *% constant(T, 3135); // 0.765366865
    p2 = s0;
    p3 = s4;
    var t0 = (p2 +% p3) *% constant(T, 4096);
    var t1 = (p2 -% p3) *% constant(T, 4096);
    const x0 = t0 +% t3;
    const x3 = t0 -% t3;
    const x1 = t1 +% t2;
    const x2 = t1 -% t2;
    t0 = s7;
    t1 = s5;
    t2 = s3;
    t3 = s1;
    p3 = t0 +% t2;
    var p4 = t1 +% t3;
    p1 = t0 +% t3;
    p2 = t1 +% t2;
    const p5 = (p3 +% p4) *% constant(T, 4816); // 1.175875602
    t0 = t0 *% constant(T, 1223); // 0.298631336
    t1 = t1 *% constant(T, 8410); // 2.053119869
    t2 = t2 *% constant(T, 12586); // 3.072711026
    t3 = t3 *% constant(T, 6149); // 1.501321110
    p1 = p5 +% p1 *% constant(T, -3685); // -0.899976223
    p2 = p5 +% p2 *% constant(T, -10497); // -2.562915447
    p3 = p3 *% constant(T, -8034); // -1.961570560
    p4 = p4 *% constant(T, -1597); // -0.390180644
    t3 +%= p1 +% p4;
    t2 +%= p2 +% p3;
    t1 +%= p2 +% p4;
    t0 +%= p1 +% p3;
    return .{ .x0 = x0, .x1 = x1, .x2 = x2, .x3 = x3, .t0 = t0, .t1 = t1, .t2 = t2, .t3 = t3 };
}

/// Reference IDCT: stb's loop structure with the zero-AC column shortcut, one
/// column or row at a time. Kept as the oracle for `idct_block`.
pub fn idct_block_scalar(out: []u8, out_stride: usize, data: *const [64]i16) void {
    var val: [64]i32 = undefined;
    for (0..8) |i| {
        const d = data[i..];
        if (d[8] == 0 and d[16] == 0 and d[24] == 0 and d[32] == 0 and d[40] == 0 and d[48] == 0 and d[56] == 0) {
            const dcterm: i32 = @as(i32, d[0]) *% 4;
            inline for (0..8) |r| val[i + 8 * r] = dcterm;
        } else {
            const t = idct_1d(i32, d[0], d[8], d[16], d[24], d[32], d[40], d[48], d[56]);
            const x0 = t.x0 +% 512;
            const x1 = t.x1 +% 512;
            const x2 = t.x2 +% 512;
            const x3 = t.x3 +% 512;
            val[i + 0] = (x0 +% t.t3) >> 10;
            val[i + 56] = (x0 -% t.t3) >> 10;
            val[i + 8] = (x1 +% t.t2) >> 10;
            val[i + 48] = (x1 -% t.t2) >> 10;
            val[i + 16] = (x2 +% t.t1) >> 10;
            val[i + 40] = (x2 -% t.t1) >> 10;
            val[i + 24] = (x3 +% t.t0) >> 10;
            val[i + 32] = (x3 -% t.t0) >> 10;
        }
    }
    for (0..8) |i| {
        const v = val[i * 8 ..][0..8];
        const t = idct_1d(i32, v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7]);
        const bias: i32 = 65536 + (128 << 17);
        const x0 = t.x0 +% bias;
        const x1 = t.x1 +% bias;
        const x2 = t.x2 +% bias;
        const x3 = t.x3 +% bias;
        const o = out[i * out_stride ..][0..8];
        o[0] = clamp_u8((x0 +% t.t3) >> 17);
        o[7] = clamp_u8((x0 -% t.t3) >> 17);
        o[1] = clamp_u8((x1 +% t.t2) >> 17);
        o[6] = clamp_u8((x1 -% t.t2) >> 17);
        o[2] = clamp_u8((x2 +% t.t1) >> 17);
        o[5] = clamp_u8((x2 -% t.t1) >> 17);
        o[3] = clamp_u8((x3 +% t.t0) >> 17);
        o[4] = clamp_u8((x3 -% t.t0) >> 17);
    }
}

/// stb's 8x8 integer IDCT over lanes. `data` is row-major coefficients; output
/// rows are written at `out_stride` intervals, each clamped to eight bits.
pub fn idct_block(out: []u8, out_stride: usize, data: *const [64]i16) void {
    // Pass one: lane c of coefficient row k is the coefficient at (k, c). A
    // column transform then produces row k of the intermediate, one lane per column.
    var coefficient_rows: [8]Lanes = undefined;
    inline for (0..8) |k| {
        const row: @Vector(lanes, i16) = data[k * 8 ..][0..8].*;
        coefficient_rows[k] = @as(Lanes, row);
    }
    const t = idct_1d(Lanes, coefficient_rows[0], coefficient_rows[1], coefficient_rows[2], coefficient_rows[3], coefficient_rows[4], coefficient_rows[5], coefficient_rows[6], coefficient_rows[7]);
    const bias: Lanes = @splat(512);
    const x0 = t.x0 +% bias;
    const x1 = t.x1 +% bias;
    const x2 = t.x2 +% bias;
    const x3 = t.x3 +% bias;
    // Intermediate rows r = 0..7, each an eight-lane vector indexed by column.
    var intermediate: [8][lanes]i32 = undefined;
    intermediate[0] = @as(Lanes, (x0 +% t.t3) >> shift10);
    intermediate[7] = @as(Lanes, (x0 -% t.t3) >> shift10);
    intermediate[1] = @as(Lanes, (x1 +% t.t2) >> shift10);
    intermediate[6] = @as(Lanes, (x1 -% t.t2) >> shift10);
    intermediate[2] = @as(Lanes, (x2 +% t.t1) >> shift10);
    intermediate[5] = @as(Lanes, (x2 -% t.t1) >> shift10);
    intermediate[3] = @as(Lanes, (x3 +% t.t0) >> shift10);
    intermediate[4] = @as(Lanes, (x3 -% t.t0) >> shift10);

    // Pass two: lane i is output row i. Column c of each intermediate row feeds
    // the transform's input c, so transpose: input c has lane r = intermediate[r][c].
    var inputs: [8]Lanes = undefined;
    inline for (0..8) |c| {
        var column: [lanes]i32 = undefined;
        inline for (0..8) |r| column[r] = intermediate[r][c];
        inputs[c] = column;
    }
    const u = idct_1d(Lanes, inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
    const output_bias: Lanes = @splat(65536 + (128 << 17));
    const y0 = u.x0 +% output_bias;
    const y1 = u.x1 +% output_bias;
    const y2 = u.x2 +% output_bias;
    const y3 = u.x3 +% output_bias;
    // Output column k is produced by the lane-wise sum or difference below.
    const columns = [8]Lanes{
        (y0 +% u.t3) >> shift17,
        (y1 +% u.t2) >> shift17,
        (y2 +% u.t1) >> shift17,
        (y3 +% u.t0) >> shift17,
        (y3 -% u.t0) >> shift17,
        (y2 -% u.t1) >> shift17,
        (y1 -% u.t2) >> shift17,
        (y0 -% u.t3) >> shift17,
    };
    inline for (0..8) |k| {
        const clamped = @min(@max(columns[k], splat_zero), splat_255);
        const bytes: [lanes]u8 = @as(Bytes, @intCast(clamped));
        for (0..lanes) |i| out[i * out_stride + k] = bytes[i];
    }
}

/// Reference YCbCr to RGB conversion, one pixel at a time.
pub fn ycbcr_to_rgb_scalar(out: []u8, y: []const u8, pcb: []const u8, pcr: []const u8, count: usize, step: u8) void {
    for (0..count) |i| {
        const y_fixed: i32 = (@as(i32, y[i]) << 20) + (1 << 19);
        const cr: i32 = @as(i32, pcr[i]) - 128;
        const cb: i32 = @as(i32, pcb[i]) - 128;
        // stb masks the Cb term to its upper 16 bits so the same bits hold on SIMD paths.
        var r = y_fixed +% cr *% 1470208;
        var g = y_fixed +% (cr *% -748800) +% ((cb *% -360960) & cb_mask);
        var b = y_fixed +% cb *% 1858048;
        r >>= 20;
        g >>= 20;
        b >>= 20;
        const base = i * step;
        out[base + 0] = clamp_u8(r);
        out[base + 1] = clamp_u8(g);
        out[base + 2] = clamp_u8(b);
        if (step == 4) out[base + 3] = 255;
    }
}

const cb_mask: i32 = @bitCast(@as(u32, 0xffff0000));

/// Reduced-precision YCbCr to RGB, stb's fixed-point constants in a 20-bit
/// fraction with rounding. Writes `step` channels per pixel; alpha is written
/// only for four-channel output. Lanes cover whole groups; the tail is scalar.
pub fn ycbcr_to_rgb_row(out: []u8, y: []const u8, pcb: []const u8, pcr: []const u8, count: usize, step: u8) void {
    var i: usize = 0;
    const splat_128: Lanes = @splat(128);
    while (i + lanes <= count) : (i += lanes) {
        const yb: Bytes = y[i..][0..lanes].*;
        const crb: Bytes = pcr[i..][0..lanes].*;
        const cbb: Bytes = pcb[i..][0..lanes].*;
        const y_fixed = (@as(Lanes, yb) << shift20) + @as(Lanes, @splat(1 << 19));
        const cr = @as(Lanes, crb) - splat_128;
        const cb = @as(Lanes, cbb) - splat_128;
        var r = y_fixed +% cr *% @as(Lanes, @splat(1470208));
        var g = y_fixed +% (cr *% @as(Lanes, @splat(-748800))) +% ((cb *% @as(Lanes, @splat(-360960))) & @as(Lanes, @splat(cb_mask)));
        var b = y_fixed +% cb *% @as(Lanes, @splat(1858048));
        r >>= @splat(20);
        g >>= @splat(20);
        b >>= @splat(20);
        const red: [lanes]u8 = @as(Bytes, @intCast(@min(@max(r, splat_zero), splat_255)));
        const green: [lanes]u8 = @as(Bytes, @intCast(@min(@max(g, splat_zero), splat_255)));
        const blue: [lanes]u8 = @as(Bytes, @intCast(@min(@max(b, splat_zero), splat_255)));
        for (0..lanes) |lane| {
            const base = (i + lane) * step;
            out[base + 0] = red[lane];
            out[base + 1] = green[lane];
            out[base + 2] = blue[lane];
            if (step == 4) out[base + 3] = 255;
        }
    }
    if (i < count) ycbcr_to_rgb_scalar(out[i * step ..], y[i..], pcb[i..], pcr[i..], count - i, step);
}

/// Reference vertical 2:1 upsampling: (3 * near + far + 2) / 4 per sample.
pub fn resample_v2_scalar(out: []u8, near: []const u8, far: []const u8, width: usize) void {
    for (0..width) |i| out[i] = @intCast((3 * @as(u32, near[i]) + far[i] + 2) >> 2);
}

/// Vertical 2:1 upsampling over lanes, bit-identical to `resample_v2_scalar`.
pub fn resample_v2(out: []u8, near: []const u8, far: []const u8, width: usize) void {
    var i: usize = 0;
    const splat_two: Lanes = @splat(2);
    while (i + lanes <= width) : (i += lanes) {
        const near_lanes: Lanes = @as(Bytes, near[i..][0..lanes].*);
        const far_lanes: Lanes = @as(Bytes, far[i..][0..lanes].*);
        const value = (near_lanes *% @as(Lanes, @splat(3)) +% far_lanes +% splat_two) >> shift2;
        const bytes: [lanes]u8 = @as(Bytes, @intCast(value));
        @memcpy(out[i..][0..lanes], &bytes);
    }
    if (i < width) resample_v2_scalar(out[i..], near[i..], far[i..], width - i);
}

test "vector IDCT matches the scalar reference" {
    var prng = std.Random.DefaultPrng.init(0x1dc7_0a11);
    const random = prng.random();
    var expected: [8 * 13]u8 = undefined;
    var actual: [8 * 13]u8 = undefined;
    for (0..2000) |trial| {
        var block: [64]i16 = undefined;
        // Mix dense blocks, sparse blocks (zero AC columns) and extreme magnitudes.
        for (&block, 0..) |*coefficient, index| {
            const sparse = trial % 3 == 1 and index % 8 != 0 and random.uintLessThan(u8, 4) != 0;
            coefficient.* = if (sparse) 0 else switch (trial % 4) {
                0 => random.int(i16),
                1 => random.intRangeAtMost(i16, -1024, 1024),
                2 => if (random.boolean()) std.math.minInt(i16) else std.math.maxInt(i16),
                else => random.intRangeAtMost(i16, -64, 64),
            };
        }
        @memset(&expected, 0xaa);
        @memset(&actual, 0xaa);
        idct_block_scalar(expected[0..], 13, &block);
        idct_block(actual[0..], 13, &block);
        try std.testing.expectEqualSlices(u8, &expected, &actual);
    }
}

test "vector YCbCr conversion matches the scalar reference" {
    var prng = std.Random.DefaultPrng.init(0x7c0b_d1ce);
    const random = prng.random();
    var y: [41]u8 = undefined;
    var cb: [41]u8 = undefined;
    var cr: [41]u8 = undefined;
    for (0..2) |trial_step_index| {
        const step: u8 = if (trial_step_index == 0) 3 else 4;
        for (1..42) |count| {
            random.bytes(&y);
            random.bytes(&cb);
            random.bytes(&cr);
            var expected: [41 * 4]u8 = undefined;
            var actual: [41 * 4]u8 = undefined;
            @memset(&expected, 0x5a);
            @memset(&actual, 0x5a);
            ycbcr_to_rgb_scalar(expected[0..], &y, &cb, &cr, count, step);
            ycbcr_to_rgb_row(actual[0..], &y, &cb, &cr, count, step);
            try std.testing.expectEqualSlices(u8, expected[0 .. count * step], actual[0 .. count * step]);
        }
    }
}

test "vector vertical upsampling matches the scalar reference" {
    var prng = std.Random.DefaultPrng.init(0x2b1d);
    const random = prng.random();
    var near: [37]u8 = undefined;
    var far: [37]u8 = undefined;
    for (1..38) |width| {
        random.bytes(&near);
        random.bytes(&far);
        var expected: [37]u8 = undefined;
        var actual: [37]u8 = undefined;
        resample_v2_scalar(expected[0..width], &near, &far, width);
        resample_v2(actual[0..width], &near, &far, width);
        try std.testing.expectEqualSlices(u8, expected[0..width], actual[0..width]);
    }
}

test "unsigned byte clamp retains the upper half of the byte range" {
    const values = [_]i32{ std.math.minInt(i32), -1, 0, 127, 128, 129, 200, 254, 255, 256, std.math.maxInt(i32) };
    const expected = [_]u8{ 0, 0, 0, 127, 128, 129, 200, 254, 255, 255, 255 };
    var actual: [values.len]u8 = undefined;
    for (values, &actual) |value, *out| out.* = clamp_u8(value);
    try std.testing.expectEqualSlices(u8, &expected, &actual);
}
