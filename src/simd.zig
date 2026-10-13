//! SDL's x86 vector operations, preserving the intrinsic lane and saturation rules.
const std = @import("std");
const M128 = @Vector(4, f32);
const M128i = @Vector(2, c_longlong);
const M256i = @Vector(4, c_longlong);
const M64 = @Vector(1, c_longlong);

pub inline fn _mm_hadd_ps(a: M128, b: M128) M128 {
    return .{ a[0] + a[1], a[2] + a[3], b[0] + b[1], b[2] + b[3] };
}
pub inline fn _mm_shuffle_epi8(a: M128i, b: M128i) M128i {
    const values: [16]u8 = @bitCast(a);
    const control: [16]u8 = @bitCast(b);
    var result: [16]u8 = undefined;
    for (&result, 0..) |*v, i| v.* = if (control[i] & 128 != 0) 0 else values[control[i] & 15];
    return @bitCast(result);
}
pub inline fn _mm256_shuffle_epi8(a: M256i, b: M256i) M256i {
    const values: [32]u8 = @bitCast(a);
    const control: [32]u8 = @bitCast(b);
    var result: [32]u8 = undefined;
    for (&result, 0..) |*v, i| v.* = if (control[i] & 128 != 0) 0 else values[(i & 16) + (control[i] & 15)];
    return @bitCast(result);
}
pub inline fn _mm_cvttps_epi32(a: M128) M128i {
    const values: [4]f32 = @bitCast(a);
    var result: [4]i32 = undefined;
    for (&result, 0..) |*v, i| v.* = if (std.math.isNan(values[i]) or values[i] >= 2147483648.0 or values[i] < -2147483648.0) std.math.minInt(i32) else @intFromFloat(values[i]);
    return @bitCast(result);
}
pub inline fn _mm_cmpge_ps(a: M128, b: M128) M128 {
    const x: [4]f32 = @bitCast(a);
    const y: [4]f32 = @bitCast(b);
    var result: [4]u32 = undefined;
    for (&result, 0..) |*v, i| v.* = if (x[i] >= y[i]) std.math.maxInt(u32) else 0;
    return @bitCast(result);
}
pub inline fn _mm_cmpge_ss(a: M128, b: M128) M128 {
    var result: [4]u32 = @bitCast(a);
    result[0] = if (a[0] >= b[0]) std.math.maxInt(u32) else 0;
    return @bitCast(result);
}
fn saturate(comptime T: type, value: anytype) T {
    return @intCast(@max(std.math.minInt(T), @min(std.math.maxInt(T), value)));
}
pub inline fn _mm_packs_epi32(a: M128i, b: M128i) M128i {
    const x: [4]i32 = @bitCast(a);
    const y: [4]i32 = @bitCast(b);
    var result: [8]i16 = undefined;
    for (0..4) |i| {
        result[i] = saturate(i16, x[i]);
        result[i + 4] = saturate(i16, y[i]);
    }
    return @bitCast(result);
}
pub inline fn _mm_packs_epi16(a: M128i, b: M128i) M128i {
    const x: [8]i16 = @bitCast(a);
    const y: [8]i16 = @bitCast(b);
    var result: [16]i8 = undefined;
    for (0..8) |i| {
        result[i] = saturate(i8, x[i]);
        result[i + 8] = saturate(i8, y[i]);
    }
    return @bitCast(result);
}
pub inline fn _mm_packus_epi16(a: M128i, b: M128i) M128i {
    const x: [8]i16 = @bitCast(a);
    const y: [8]i16 = @bitCast(b);
    var result: [16]u8 = undefined;
    for (0..8) |i| {
        result[i] = saturate(u8, x[i]);
        result[i + 8] = saturate(u8, y[i]);
    }
    return @bitCast(result);
}
pub inline fn _mm256_packus_epi16(a: M256i, b: M256i) M256i {
    const x: [16]i16 = @bitCast(a);
    const y: [16]i16 = @bitCast(b);
    var result: [32]u8 = undefined;
    for (0..2) |lane| for (0..8) |i| {
        result[lane * 16 + i] = saturate(u8, x[lane * 8 + i]);
        result[lane * 16 + 8 + i] = saturate(u8, y[lane * 8 + i]);
    };
    return @bitCast(result);
}
fn shift(comptime T: type, comptime N: usize, a: anytype, count: c_int, comptime operation: enum { left, right, arithmetic }) @TypeOf(a) {
    const values: [N]T = @bitCast(a);
    const bits = @bitSizeOf(T);
    const unsigned_count: u32 = @bitCast(count);
    var result: [N]T = undefined;
    for (&result, 0..) |*v, i| {
        if (unsigned_count >= bits) {
            v.* = if (operation == .arithmetic and values[i] < 0) -1 else 0;
        } else {
            const amount: std.math.Log2Int(T) = @intCast(unsigned_count);
            v.* = switch (operation) {
                .left => values[i] << amount,
                .right, .arithmetic => values[i] >> amount,
            };
        }
    }
    return @bitCast(result);
}
pub inline fn _mm_slli_epi16(a: M128i, count: c_int) M128i {
    return shift(u16, 8, a, count, .left);
}
pub inline fn _mm_srli_epi16(a: M128i, count: c_int) M128i {
    return shift(u16, 8, a, count, .right);
}
pub inline fn _mm_srai_epi16(a: M128i, count: c_int) M128i {
    return shift(i16, 8, a, count, .arithmetic);
}
pub inline fn _mm_slli_epi32(a: M128i, count: c_int) M128i {
    return shift(u32, 4, a, count, .left);
}
pub inline fn _mm_srli_epi32(a: M128i, count: c_int) M128i {
    return shift(u32, 4, a, count, .right);
}
pub inline fn _mm_srai_epi32(a: M128i, count: c_int) M128i {
    return shift(i32, 4, a, count, .arithmetic);
}
pub inline fn _mm_slli_si64(a: M64, count: c_int) M64 {
    return shift(u64, 1, a, count, .left);
}
pub inline fn _mm_slli_pi16(a: M64, count: c_int) M64 {
    return shift(u16, 4, a, count, .left);
}
pub inline fn _mm_srli_pi16(a: M64, count: c_int) M64 {
    return shift(u16, 4, a, count, .right);
}
fn multiplyHigh(comptime T: type, comptime W: type, comptime N: usize, a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    const x: [N]T = @bitCast(a);
    const y: [N]T = @bitCast(b);
    var result: [N]T = undefined;
    for (&result, 0..) |*v, i| v.* = @intCast((@as(W, x[i]) * @as(W, y[i])) >> 16);
    return @bitCast(result);
}
pub inline fn _mm_mulhi_epi16(a: M128i, b: M128i) M128i {
    return multiplyHigh(i16, i32, 8, a, b);
}
pub inline fn _mm_mulhi_pi16(a: M64, b: M64) M64 {
    return multiplyHigh(i16, i32, 4, a, b);
}
pub inline fn _mm_mulhi_epu16(a: M128i, b: M128i) M128i {
    return multiplyHigh(u16, u32, 8, a, b);
}
pub inline fn _mm256_mulhi_epu16(a: M256i, b: M256i) M256i {
    return multiplyHigh(u16, u32, 16, a, b);
}
pub inline fn _mm_madd_epi16(a: M128i, b: M128i) M128i {
    const x: [8]i16 = @bitCast(a);
    const y: [8]i16 = @bitCast(b);
    var result: [4]i32 = undefined;
    for (&result, 0..) |*v, i| v.* = (@as(i32, x[i * 2]) * y[i * 2]) +% (@as(i32, x[i * 2 + 1]) * y[i * 2 + 1]);
    return @bitCast(result);
}
fn multiplyAddBytes(comptime N: usize, a: anytype, b: @TypeOf(a)) @TypeOf(a) {
    const x: [N]u8 = @bitCast(a);
    const y: [N]i8 = @bitCast(b);
    var result: [N / 2]i16 = undefined;
    for (&result, 0..) |*v, i| v.* = saturate(i16, (@as(i32, x[i * 2]) * y[i * 2]) + (@as(i32, x[i * 2 + 1]) * y[i * 2 + 1]));
    return @bitCast(result);
}
pub inline fn _mm_maddubs_epi16(a: M128i, b: M128i) M128i {
    return multiplyAddBytes(16, a, b);
}
pub inline fn _mm256_maddubs_epi16(a: M256i, b: M256i) M256i {
    return multiplyAddBytes(32, a, b);
}
pub inline fn _mm_empty() void {
    asm volatile ("emms");
}
pub inline fn _mm_stream_ps(destination: [*c]f32, value: M128) void {
    asm volatile ("movntps %[value], (%[destination])"
        :
        : [value] "x" (value),
          [destination] "r" (destination),
        : .{ .memory = true });
}
