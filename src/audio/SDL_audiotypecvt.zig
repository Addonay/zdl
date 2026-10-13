// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
// 
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
// 
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
// 
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub const SDL_AUDIO_U8: c_int = 8;
pub const SDL_AUDIO_S8: c_int = 32776;
pub const SDL_AUDIO_S16: c_int = 32784;
pub const SDL_AUDIO_S32: c_int = 32800;
pub const SDL_AUDIO_F32: c_int = 33056;
pub const enum_SDL_AudioFormat = c_uint;
pub const SDL_AudioFormat = enum_SDL_AudioFormat;
pub extern fn SDL_HasSSE2_REAL() bool;
pub extern fn SDL_HasSSE41_REAL() bool;
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v4si = @Vector(4, c_int);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __v4sf = @Vector(4, f32);
pub const __m128 = @Vector(4, f32);
pub const __m128_u = @Vector(4, f32);
pub const __v4su = @Vector(4, c_uint);
pub inline fn _mm_add_ss(input: __m128, __b: __m128) __m128 {
    var __a = input;
    @setEvalBranchQuota(100000);
    __a[@as(c_int, 0)] += __b[@as(c_int, 0)];
    return __a;
}
pub inline fn _mm_add_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return __a + __b;
}
pub inline fn _mm_mul_ss(input: __m128, __b: __m128) __m128 {
    var __a = input;
    @setEvalBranchQuota(100000);
    __a[@as(c_int, 0)] *= __b[@as(c_int, 0)];
    return __a;
}
pub inline fn _mm_mul_ps(__a: __m128, __b: __m128) __m128 {
    @setEvalBranchQuota(100000);
    return __a * __b;
}
pub const _mm_cmpge_ss = @import("simd")._mm_cmpge_ss;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/xmmintrin.h:723:18: warning: TODO implement function '__builtin_ia32_cmpleps' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/xmmintrin.h:721:1: warning: unable to translate function, demoted to extern
pub const _mm_cmpge_ps = @import("simd")._mm_cmpge_ps;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/xmmintrin.h:749:18: warning: TODO implement function '__builtin_ia32_cmpneqss' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/xmmintrin.h:747:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_cvtsi32_ss(input: __m128, __b: c_int) __m128 {
    var __a = input;
    @setEvalBranchQuota(100000);
    __a[@as(c_int, 0)] = @floatFromInt(__b);
    return __a;
}
pub inline fn _mm_cvt_si2ss(__a: __m128, __b: c_int) __m128 {
    @setEvalBranchQuota(100000);
    return _mm_cvtsi32_ss(__a, __b);
}
pub inline fn _mm_load_ss(__p: [*c]const f32) __m128 {
    @setEvalBranchQuota(100000);
    const struct___mm_load_ss_struct = extern struct {
        __u: f32 align(1) = 0,
    };
    _ = &struct___mm_load_ss_struct;
    var __u: f32 = @as([*c]const struct___mm_load_ss_struct, @ptrCast(@alignCast(__p))).*.__u;
    _ = &__u;
    return [4]f32{
        __u,
        @floatFromInt(@as(c_int, 0)),
        @floatFromInt(@as(c_int, 0)),
        @floatFromInt(@as(c_int, 0)),
    };
}
pub inline fn _mm_loadu_ps(__p: [*c]const f32) __m128 {
    @setEvalBranchQuota(100000);
    const struct___loadu_ps = extern struct {
        __v: [4]f32 align(1) = @import("std").mem.zeroes(__m128_u),
    };
    _ = &struct___loadu_ps;
    return @as([*c]const struct___loadu_ps, @ptrCast(@alignCast(__p))).*.__v;
}
pub inline fn _mm_set1_ps(__w: f32) __m128 {
    @setEvalBranchQuota(100000);
    return [4]f32{
        __w,
        __w,
        __w,
        __w,
    };
}
pub inline fn _mm_setzero_ps() __m128 {
    @setEvalBranchQuota(100000);
    return [4]f32{
        0.0,
        0.0,
        0.0,
        0.0,
    };
}
pub inline fn _mm_store_ss(__p: [*c]f32, __a: __m128) void {
    @setEvalBranchQuota(100000);
    const struct___mm_store_ss_struct = extern struct {
        __u: f32 align(1) = 0,
    };
    _ = &struct___mm_store_ss_struct;
    @as([*c]struct___mm_store_ss_struct, @ptrCast(@alignCast(__p))).*.__u = __a[@as(c_int, 0)];
}
pub inline fn _mm_store_ps(__p: [*c]f32, __a: __m128) void {
    @setEvalBranchQuota(100000);
    @as([*c]__m128, @ptrCast(@alignCast(__p))).* = __a;
}
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
pub inline fn _mm_sub_epi32(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4su, @bitCast(__a)) - @as(__v4su, @bitCast(__b)));
}
pub inline fn _mm_and_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) & @as(__v2du, @bitCast(__b)));
}
pub inline fn _mm_xor_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) ^ @as(__v2du, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2770:19: warning: TODO implement function '__builtin_ia32_psllwi128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2769:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_cvtepi32_ps(__a: __m128i) __m128 {
    @setEvalBranchQuota(100000);
    return blk: {
        const tmp = @as(__v4si, @bitCast(__a));
        break :blk __v4sf{
            @floatFromInt(tmp[0]),
            @floatFromInt(tmp[1]),
            @floatFromInt(tmp[2]),
            @floatFromInt(tmp[3]),
        };
    };
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3344:19: warning: TODO implement function '__builtin_ia32_cvtps2dq' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3343:46: warning: unable to translate function, demoted to extern
pub const _mm_cvttps_epi32 = @import("simd")._mm_cvttps_epi32;
pub inline fn _mm_cvtsi32_si128(__a: c_int) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4si, [4]c_int{
        __a,
        0,
        0,
        0,
    }));
}
pub inline fn _mm_cvtsi128_si32(__a: __m128i) c_int {
    @setEvalBranchQuota(100000);
    var __b: __v4si = @bitCast(__a);
    _ = &__b;
    return __b[@as(c_int, 0)];
}
pub inline fn _mm_loadu_si128(__p: [*c]align(1) const __m128i_u) __m128i {
    @setEvalBranchQuota(100000);
    const struct___loadu_si128 = extern struct {
        __v: [2]c_longlong align(1) = @import("std").mem.zeroes(__m128i_u),
    };
    _ = &struct___loadu_si128;
    return @as([*c]const struct___loadu_si128, @ptrCast(@alignCast(__p))).*.__v;
}
pub inline fn _mm_set_epi16(__w7: c_short, __w6: c_short, __w5: c_short, __w4: c_short, __w3: c_short, __w2: c_short, __w1: c_short, __w0: c_short) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hi, [8]c_short{
        __w0,
        __w1,
        __w2,
        __w3,
        __w4,
        __w5,
        __w6,
        __w7,
    }));
}
pub inline fn _mm_set_epi8(__b15: u8, __b14: u8, __b13: u8, __b12: u8, __b11: u8, __b10: u8, __b9: u8, __b8: u8, __b7: u8, __b6: u8, __b5: u8, __b4: u8, __b3: u8, __b2: u8, __b1: u8, __b0: u8) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v16qi, [16]u8{
        __b0,
        __b1,
        __b2,
        __b3,
        __b4,
        __b5,
        __b6,
        __b7,
        __b8,
        __b9,
        __b10,
        __b11,
        __b12,
        __b13,
        __b14,
        __b15,
    }));
}
pub inline fn _mm_set1_epi16(__w: c_short) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi16(__w, __w, __w, __w, __w, __w, __w, __w);
}
pub inline fn _mm_set1_epi8(__b: u8) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi8(__b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b);
}
pub inline fn _mm_setzero_si128() __m128i {
    @setEvalBranchQuota(100000);
    return @as(__v2di, [2]c_longlong{
        0,
        0,
    });
}
pub inline fn _mm_store_si128(__p: [*c]__m128i, __b: __m128i) void {
    @setEvalBranchQuota(100000);
    __p.* = __b;
}
pub const _mm_packs_epi16 = @import("simd")._mm_packs_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4187:19: warning: TODO implement function '__builtin_ia32_packssdw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4186:1: warning: unable to translate function, demoted to extern
pub const _mm_packs_epi32 = @import("simd")._mm_packs_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4210:19: warning: TODO implement function '__builtin_ia32_packuswb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4209:1: warning: unable to translate function, demoted to extern
pub const _mm_packus_epi16 = @import("simd")._mm_packus_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4285:10: warning: TODO implement function '__builtin_ia32_pmovmskb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4284:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_unpackhi_epi8(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.child, @as(__v16qi, @bitCast(__a)), @as(__v16qi, @bitCast(__b)), @Vector(16, i32){
        __helpers.shuffleVectorIndex(8, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 8), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(9, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 9), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(10, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 10), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(11, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 11), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(12, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 12), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(13, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 13), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(14, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 14), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(15, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 15), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm_unpackhi_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.child, @as(__v8hi, @bitCast(__a)), @as(__v8hi, @bitCast(__b)), @Vector(8, i32){
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 4), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 5), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(6, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 6), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(7, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 7), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm_unpacklo_epi8(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.child, @as(__v16qi, @bitCast(__a)), @as(__v16qi, @bitCast(__b)), @Vector(16, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 0), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 1), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 2), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(3, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 3), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 4), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 5), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(6, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 6), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(7, @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 16) + @as(c_int, 7), @typeInfo(@TypeOf(@as(__v16qi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm_unpacklo_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.child, @as(__v8hi, @bitCast(__a)), @as(__v8hi, @bitCast(__b)), @Vector(8, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 0), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 1), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 2), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(3, @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 8) + @as(c_int, 3), @typeInfo(@TypeOf(@as(__v8hi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm_castps_si128(__a: __m128) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(__a);
}
pub inline fn _mm_castsi128_ps(__a: __m128i) __m128 {
    @setEvalBranchQuota(100000);
    return @bitCast(__a);
}
pub const _mm_shuffle_epi8 = @import("simd")._mm_shuffle_epi8;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:615:20: warning: TODO implement function '__builtin_ia32_pshufb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:614:1: warning: unable to translate function, demoted to extern
pub const union_float_bits = extern union {
    u32: Uint32,
    f32: f32,
};
pub fn SDL_Convert_S8_to_F32_Scalar(dst: [*c]f32, src: [*c]const Sint8, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_samples - @as(c_int, 1);
        while (i >= @as(c_int, 0)) : (i -= 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.u32 = @as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint8, @bitCast(@as(i8, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1199571072);
            dst[@bitCast(@as(isize, @intCast(i)))] = x.f32 - @as(f32, 65537.0);
        }
    }
}
pub fn SDL_Convert_U8_to_F32_Scalar(dst: [*c]f32, src: [*c]const Uint8, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_samples - @as(c_int, 1);
        while (i >= @as(c_int, 0)) : (i -= 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.u32 = @as(c_uint, @bitCast(@as(c_int, @as(c_int, src[@bitCast(@as(isize, @intCast(i)))])))) ^ @as(c_uint, 1199570944);
            dst[@bitCast(@as(isize, @intCast(i)))] = x.f32 - @as(f32, 65537.0);
        }
    }
}
pub fn SDL_Convert_S16_to_F32_Scalar(dst: [*c]f32, src: [*c]const Sint16, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_samples - @as(c_int, 1);
        while (i >= @as(c_int, 0)) : (i -= 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.u32 = @as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1132494848);
            dst[@bitCast(@as(isize, @intCast(i)))] = x.f32 - @as(f32, 257.0);
        }
    }
}
pub fn SDL_Convert_S32_to_F32_Scalar(dst: [*c]f32, src: [*c]const Sint32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = num_samples - @as(c_int, 1);
        while (i >= @as(c_int, 0)) : (i -= 1) {
            dst[@bitCast(@as(isize, @intCast(i)))] = @as(f32, @floatFromInt(src[@bitCast(@as(isize, @intCast(i)))])) * DIVBY2147483648;
        }
    }
}
pub fn SDL_Convert_F32_to_S8_Scalar(dst: [*c]Sint8, src: [*c]const f32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.f32 = src[@bitCast(@as(isize, @intCast(i)))] + @as(f32, 98304.0);
            var y: Uint32 = x.u32 -% @as(c_uint, 1203765248);
            _ = &y;
            var z: Uint32 = @as(c_uint, 127) -% (y ^ (@as(c_uint, 0) -% (y >> @intCast(@as(Uint32, 31)))));
            _ = &z;
            y = y ^ (z & (@as(c_uint, 0) -% (z >> @intCast(@as(Uint32, 31)))));
            dst[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(u8, @truncate(y & @as(Uint32, 255))));
        }
    }
}
pub fn SDL_Convert_F32_to_U8_Scalar(dst: [*c]Uint8, src: [*c]const f32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.f32 = src[@bitCast(@as(isize, @intCast(i)))] + @as(f32, 98304.0);
            var y: Uint32 = x.u32 -% @as(c_uint, 1203765248);
            _ = &y;
            var z: Uint32 = @as(c_uint, 127) -% (y ^ (@as(c_uint, 0) -% (y >> @intCast(@as(Uint32, 31)))));
            _ = &z;
            y = (y ^ @as(c_uint, 128)) ^ (z & (@as(c_uint, 0) -% (z >> @intCast(@as(Uint32, 31)))));
            dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(y & @as(Uint32, 255));
        }
    }
}
pub fn SDL_Convert_F32_to_S16_Scalar(dst: [*c]Sint16, src: [*c]const f32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.f32 = src[@bitCast(@as(isize, @intCast(i)))] + @as(f32, 384.0);
            var y: Uint32 = x.u32 -% @as(c_uint, 1136656384);
            _ = &y;
            var z: Uint32 = @as(c_uint, 32767) -% (y ^ (@as(c_uint, 0) -% (y >> @intCast(@as(Uint32, 31)))));
            _ = &z;
            y = y ^ (z & (@as(c_uint, 0) -% (z >> @intCast(@as(Uint32, 31)))));
            dst[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(c_ushort, @truncate(y & @as(Uint32, 65535))));
        }
    }
}
pub fn SDL_Convert_F32_to_S32_Scalar(dst: [*c]Sint32, src: [*c]const f32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            var x: union_float_bits = undefined;
            _ = &x;
            x.f32 = src[@bitCast(@as(isize, @intCast(i)))];
            var y: Uint32 = x.u32 +% @as(c_uint, 260046848);
            _ = &y;
            var z: Uint32 = y -% @as(c_uint, 3472883712);
            _ = &z;
            z &= @as(c_uint, 0) -% ((y ^ z) >> @intCast(@as(Uint32, 31)));
            x.u32 = y -% z;
            dst[@bitCast(@as(isize, @intCast(i)))] = @as(Sint32, @intFromFloat(x.f32)) ^ @as(Sint32, @bitCast(@as(c_uint, @truncate(@as(c_uint, 0) -% (z >> @intCast(@as(Uint32, 31)))))));
        }
    }
}
pub fn SDL_Convert_Swap16_Scalar(dst: [*c]Uint16, src: [*c]const Uint16, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint16, src[@bitCast(@as(isize, @intCast(i)))]));
        }
    }
}
pub fn SDL_Convert_Swap32_Scalar(dst: [*c]Uint32, src: [*c]const Uint32, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < num_samples) : (i += 1) {
            dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint32, src[@bitCast(@as(isize, @intCast(i)))]));
        }
    }
}
pub fn SDL_Convert_S8_to_F32_SSE2(dst: [*c]f32, src: [*c]const Sint8, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const zero: __m128i = _mm_setzero_si128();
    _ = &zero;
    const flipper: __m128i = _mm_set1_epi8(@bitCast(@as(i8, @truncate(-@as(c_int, 128)))));
    _ = &flipper;
    const caster: __m128i = _mm_set1_epi16(18304);
    _ = &caster;
    const offset: __m128 = _mm_set1_ps(@floatCast(-@as(f64, 65537.0)));
    _ = &offset;
    var i: c_int = num_samples;
    _ = &i;
    if (i >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            i -= 1;
            {
                _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint8, @bitCast(@as(i8, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1199571072)))))), offset));
            }
        }
        while (i >= @as(c_int, 16)) {
            i -= 16;
            {
                const bytes: __m128i = _mm_xor_si128(_mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))]))), flipper);
                _ = &bytes;
                const shorts0: __m128i = _mm_unpacklo_epi8(bytes, zero);
                _ = &shorts0;
                const shorts1: __m128i = _mm_unpackhi_epi8(bytes, zero);
                _ = &shorts1;
                const floats0: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts0, caster)), offset);
                _ = &floats0;
                const floats1: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts0, caster)), offset);
                _ = &floats1;
                const floats2: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts1, caster)), offset);
                _ = &floats2;
                const floats3: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts1, caster)), offset);
                _ = &floats3;
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i)))], floats0);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))], floats1);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))], floats2);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))], floats3);
            }
        }
    }
    while (i > @as(c_int, 0)) {
        i -= 1;
        {
            _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint8, @bitCast(@as(i8, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1199571072)))))), offset));
        }
    }
}
pub fn SDL_Convert_U8_to_F32_SSE2(dst: [*c]f32, src: [*c]const Uint8, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const zero: __m128i = _mm_setzero_si128();
    _ = &zero;
    const caster: __m128i = _mm_set1_epi16(18304);
    _ = &caster;
    const offset: __m128 = _mm_set1_ps(@floatCast(-@as(f64, 65537.0)));
    _ = &offset;
    var i: c_int = num_samples;
    _ = &i;
    if (i >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            i -= 1;
            {
                _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, src[@bitCast(@as(isize, @intCast(i)))])))) ^ @as(c_uint, 1199570944)))))), offset));
            }
        }
        while (i >= @as(c_int, 16)) {
            i -= 16;
            {
                const bytes: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))])));
                _ = &bytes;
                const shorts0: __m128i = _mm_unpacklo_epi8(bytes, zero);
                _ = &shorts0;
                const shorts1: __m128i = _mm_unpackhi_epi8(bytes, zero);
                _ = &shorts1;
                const floats0: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts0, caster)), offset);
                _ = &floats0;
                const floats1: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts0, caster)), offset);
                _ = &floats1;
                const floats2: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts1, caster)), offset);
                _ = &floats2;
                const floats3: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts1, caster)), offset);
                _ = &floats3;
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i)))], floats0);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))], floats1);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))], floats2);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))], floats3);
            }
        }
    }
    while (i > @as(c_int, 0)) {
        i -= 1;
        {
            _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, src[@bitCast(@as(isize, @intCast(i)))])))) ^ @as(c_uint, 1199570944)))))), offset));
        }
    }
}
pub fn SDL_Convert_S16_to_F32_SSE2(dst: [*c]f32, src: [*c]const Sint16, num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const flipper: __m128i = _mm_set1_epi16(@truncate(-@as(c_int, 32768)));
    _ = &flipper;
    const caster: __m128i = _mm_set1_epi16(17280);
    _ = &caster;
    const offset: __m128 = _mm_set1_ps(-@as(f32, 257.0));
    _ = &offset;
    var i: c_int = num_samples;
    _ = &i;
    if (i >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            i -= 1;
            {
                _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1132494848)))))), offset));
            }
        }
        while (i >= @as(c_int, 16)) {
            i -= 16;
            {
                const shorts0: __m128i = _mm_xor_si128(_mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))]))), flipper);
                _ = &shorts0;
                const shorts1: __m128i = _mm_xor_si128(_mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]))), flipper);
                _ = &shorts1;
                const floats0: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts0, caster)), offset);
                _ = &floats0;
                const floats1: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts0, caster)), offset);
                _ = &floats1;
                const floats2: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpacklo_epi16(shorts1, caster)), offset);
                _ = &floats2;
                const floats3: __m128 = _mm_add_ps(_mm_castsi128_ps(_mm_unpackhi_epi16(shorts1, caster)), offset);
                _ = &floats3;
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i)))], floats0);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))], floats1);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))], floats2);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))], floats3);
            }
        }
    }
    while (i > @as(c_int, 0)) {
        i -= 1;
        {
            _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_add_ss(_mm_castsi128_ps(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, @as(Uint16, @bitCast(@as(c_short, src[@bitCast(@as(isize, @intCast(i)))]))))))) ^ @as(c_uint, 1132494848)))))), offset));
        }
    }
}
pub fn SDL_Convert_S32_to_F32_SSE2(dst: [*c]f32, src: [*c]const Sint32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const scaler: __m128 = _mm_set1_ps(DIVBY2147483648);
    _ = &scaler;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_mul_ss(_mm_cvt_si2ss(_mm_setzero_ps(), src[@bitCast(@as(isize, @intCast(i)))]), scaler));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                const ints0: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))])));
                _ = &ints0;
                const ints1: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))])));
                _ = &ints1;
                const ints2: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])));
                _ = &ints2;
                const ints3: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))])));
                _ = &ints3;
                const floats0: __m128 = _mm_mul_ps(_mm_cvtepi32_ps(ints0), scaler);
                _ = &floats0;
                const floats1: __m128 = _mm_mul_ps(_mm_cvtepi32_ps(ints1), scaler);
                _ = &floats1;
                const floats2: __m128 = _mm_mul_ps(_mm_cvtepi32_ps(ints2), scaler);
                _ = &floats2;
                const floats3: __m128 = _mm_mul_ps(_mm_cvtepi32_ps(ints3), scaler);
                _ = &floats3;
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i)))], floats0);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))], floats1);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))], floats2);
                _mm_store_ps(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))], floats3);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            _mm_store_ss(&dst[@bitCast(@as(isize, @intCast(i)))], _mm_mul_ss(_mm_cvt_si2ss(_mm_setzero_ps(), src[@bitCast(@as(isize, @intCast(i)))]), scaler));
        }
        i += 1;
    }
}
pub fn SDL_Convert_F32_to_S8_SSE2(dst: [*c]Sint8, src: [*c]const f32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const offset: __m128 = _mm_set1_ps(98304.0);
    _ = &offset;
    const mask: __m128i = _mm_set1_epi16(255);
    _ = &mask;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                const ints: __m128i = _mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset));
                _ = &ints;
                dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(_mm_cvtsi128_si32(_mm_packs_epi16(ints, ints)) & @as(c_int, 255));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                const floats0: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i)))]);
                _ = &floats0;
                const floats1: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))]);
                _ = &floats1;
                const floats2: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]);
                _ = &floats2;
                const floats3: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))]);
                _ = &floats3;
                const ints0: __m128i = _mm_castps_si128(_mm_add_ps(floats0, offset));
                _ = &ints0;
                const ints1: __m128i = _mm_castps_si128(_mm_add_ps(floats1, offset));
                _ = &ints1;
                const ints2: __m128i = _mm_castps_si128(_mm_add_ps(floats2, offset));
                _ = &ints2;
                const ints3: __m128i = _mm_castps_si128(_mm_add_ps(floats3, offset));
                _ = &ints3;
                const shorts0: __m128i = _mm_and_si128(_mm_packs_epi16(ints0, ints1), mask);
                _ = &shorts0;
                const shorts1: __m128i = _mm_and_si128(_mm_packs_epi16(ints2, ints3), mask);
                _ = &shorts1;
                const bytes: __m128i = _mm_packus_epi16(shorts0, shorts1);
                _ = &bytes;
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), bytes);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            const ints: __m128i = _mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset));
            _ = &ints;
            dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(_mm_cvtsi128_si32(_mm_packs_epi16(ints, ints)) & @as(c_int, 255));
        }
        i += 1;
    }
}
pub fn SDL_Convert_F32_to_U8_SSE2(dst: [*c]Uint8, src: [*c]const f32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const offset: __m128 = _mm_set1_ps(98305.0);
    _ = &offset;
    const mask: __m128i = _mm_set1_epi16(255);
    _ = &mask;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                const ints: __m128i = _mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset));
                _ = &ints;
                dst[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate(_mm_cvtsi128_si32(_mm_packus_epi16(ints, ints)) & @as(c_int, 255))));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                const floats0: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i)))]);
                _ = &floats0;
                const floats1: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))]);
                _ = &floats1;
                const floats2: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]);
                _ = &floats2;
                const floats3: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))]);
                _ = &floats3;
                const ints0: __m128i = _mm_castps_si128(_mm_add_ps(floats0, offset));
                _ = &ints0;
                const ints1: __m128i = _mm_castps_si128(_mm_add_ps(floats1, offset));
                _ = &ints1;
                const ints2: __m128i = _mm_castps_si128(_mm_add_ps(floats2, offset));
                _ = &ints2;
                const ints3: __m128i = _mm_castps_si128(_mm_add_ps(floats3, offset));
                _ = &ints3;
                const shorts0: __m128i = _mm_and_si128(_mm_packus_epi16(ints0, ints1), mask);
                _ = &shorts0;
                const shorts1: __m128i = _mm_and_si128(_mm_packus_epi16(ints2, ints3), mask);
                _ = &shorts1;
                const bytes: __m128i = _mm_packus_epi16(shorts0, shorts1);
                _ = &bytes;
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), bytes);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            const ints: __m128i = _mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset));
            _ = &ints;
            dst[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate(_mm_cvtsi128_si32(_mm_packus_epi16(ints, ints)) & @as(c_int, 255))));
        }
        i += 1;
    }
}
pub fn SDL_Convert_F32_to_S16_SSE2(dst: [*c]Sint16, src: [*c]const f32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const offset: __m128 = _mm_set1_ps(257.0);
    _ = &offset;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                const ints: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset)), _mm_castps_si128(offset));
                _ = &ints;
                dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(_mm_cvtsi128_si32(_mm_packs_epi32(ints, ints)) & @as(c_int, 65535));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                const floats0: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i)))]);
                _ = &floats0;
                const floats1: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))]);
                _ = &floats1;
                const floats2: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]);
                _ = &floats2;
                const floats3: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))]);
                _ = &floats3;
                const ints0: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ps(floats0, offset)), _mm_castps_si128(offset));
                _ = &ints0;
                const ints1: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ps(floats1, offset)), _mm_castps_si128(offset));
                _ = &ints1;
                const ints2: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ps(floats2, offset)), _mm_castps_si128(offset));
                _ = &ints2;
                const ints3: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ps(floats3, offset)), _mm_castps_si128(offset));
                _ = &ints3;
                const shorts0: __m128i = _mm_packs_epi32(ints0, ints1);
                _ = &shorts0;
                const shorts1: __m128i = _mm_packs_epi32(ints2, ints3);
                _ = &shorts1;
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), shorts0);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])), shorts1);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            const ints: __m128i = _mm_sub_epi32(_mm_castps_si128(_mm_add_ss(_mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]), offset)), _mm_castps_si128(offset));
            _ = &ints;
            dst[@bitCast(@as(isize, @intCast(i)))] = @truncate(_mm_cvtsi128_si32(_mm_packs_epi32(ints, ints)) & @as(c_int, 65535));
        }
        i += 1;
    }
}
pub fn SDL_Convert_F32_to_S32_SSE2(dst: [*c]Sint32, src: [*c]const f32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const limit: __m128 = _mm_set1_ps(2147483648.0);
    _ = &limit;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                const floats: __m128 = _mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]);
                _ = &floats;
                const values: __m128 = _mm_mul_ss(floats, limit);
                _ = &values;
                const ints: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values), _mm_castps_si128(_mm_cmpge_ss(values, limit)));
                _ = &ints;
                dst[@bitCast(@as(isize, @intCast(i)))] = _mm_cvtsi128_si32(ints);
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                const floats0: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i)))]);
                _ = &floats0;
                const floats1: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))]);
                _ = &floats1;
                const floats2: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]);
                _ = &floats2;
                const floats3: __m128 = _mm_loadu_ps(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))]);
                _ = &floats3;
                const values1: __m128 = _mm_mul_ps(floats0, limit);
                _ = &values1;
                const values2: __m128 = _mm_mul_ps(floats1, limit);
                _ = &values2;
                const values3: __m128 = _mm_mul_ps(floats2, limit);
                _ = &values3;
                const values4: __m128 = _mm_mul_ps(floats3, limit);
                _ = &values4;
                const ints0: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values1), _mm_castps_si128(_mm_cmpge_ps(values1, limit)));
                _ = &ints0;
                const ints1: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values2), _mm_castps_si128(_mm_cmpge_ps(values2, limit)));
                _ = &ints1;
                const ints2: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values3), _mm_castps_si128(_mm_cmpge_ps(values3, limit)));
                _ = &ints2;
                const ints3: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values4), _mm_castps_si128(_mm_cmpge_ps(values4, limit)));
                _ = &ints3;
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), ints0);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))])), ints1);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])), ints2);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))])), ints3);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            const floats: __m128 = _mm_load_ss(&src[@bitCast(@as(isize, @intCast(i)))]);
            _ = &floats;
            const values: __m128 = _mm_mul_ss(floats, limit);
            _ = &values;
            const ints: __m128i = _mm_xor_si128(_mm_cvttps_epi32(values), _mm_castps_si128(_mm_cmpge_ss(values, limit)));
            _ = &ints;
            dst[@bitCast(@as(isize, @intCast(i)))] = _mm_cvtsi128_si32(ints);
        }
        i += 1;
    }
}
pub fn SDL_Convert_Swap16_SSSE3(dst: [*c]Uint16, src: [*c]const Uint16, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const shuffle: __m128i = _mm_set_epi8(14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1);
    _ = &shuffle;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint16, src[@bitCast(@as(isize, @intCast(i)))]));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                var ints0: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))])));
                _ = &ints0;
                var ints1: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])));
                _ = &ints1;
                ints0 = _mm_shuffle_epi8(ints0, shuffle);
                ints1 = _mm_shuffle_epi8(ints1, shuffle);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), ints0);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])), ints1);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint16, src[@bitCast(@as(isize, @intCast(i)))]));
        }
        i += 1;
    }
}
pub fn SDL_Convert_Swap32_SSSE3(dst: [*c]Uint32, src: [*c]const Uint32, arg_num_samples: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var num_samples = arg_num_samples;
    _ = &num_samples;
    const shuffle: __m128i = _mm_set_epi8(12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3);
    _ = &shuffle;
    var i: c_int = 0;
    _ = &i;
    if (num_samples >= @as(c_int, 16)) {
        while ((@as(usize, @intCast(@intFromPtr(&dst[@bitCast(@as(isize, @intCast(i)))]))) & @as(usize, 15)) != 0) {
            {
                dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint32, src[@bitCast(@as(isize, @intCast(i)))]));
            }
            i += 1;
        }
        while ((i + @as(c_int, 16)) <= num_samples) {
            {
                var ints0: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i)))])));
                _ = &ints0;
                var ints1: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))])));
                _ = &ints1;
                var ints2: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])));
                _ = &ints2;
                var ints3: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(&src[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))])));
                _ = &ints3;
                ints0 = _mm_shuffle_epi8(ints0, shuffle);
                ints1 = _mm_shuffle_epi8(ints1, shuffle);
                ints2 = _mm_shuffle_epi8(ints2, shuffle);
                ints3 = _mm_shuffle_epi8(ints3, shuffle);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i)))])), ints0);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 4))))])), ints1);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])), ints2);
                _mm_store_si128(@ptrCast(@alignCast(&dst[@bitCast(@as(isize, @intCast(i + @as(c_int, 12))))])), ints3);
            }
            i += 16;
        }
    }
    while (i < num_samples) {
        {
            dst[@bitCast(@as(isize, @intCast(i)))] = @byteSwap(@as(Uint32, src[@bitCast(@as(isize, @intCast(i)))]));
        }
        i += 1;
    }
}
pub var SDL_Convert_S8_to_F32: ?*const fn (dst: [*c]f32, src: [*c]const Sint8, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_U8_to_F32: ?*const fn (dst: [*c]f32, src: [*c]const Uint8, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_S16_to_F32: ?*const fn (dst: [*c]f32, src: [*c]const Sint16, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_S32_to_F32: ?*const fn (dst: [*c]f32, src: [*c]const Sint32, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_F32_to_S8: ?*const fn (dst: [*c]Sint8, src: [*c]const f32, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_F32_to_U8: ?*const fn (dst: [*c]Uint8, src: [*c]const f32, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_F32_to_S16: ?*const fn (dst: [*c]Sint16, src: [*c]const f32, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_F32_to_S32: ?*const fn (dst: [*c]Sint32, src: [*c]const f32, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_Swap16: ?*const fn (dst: [*c]Uint16, src: [*c]const Uint16, num_samples: c_int) callconv(.c) void = null;
pub var SDL_Convert_Swap32: ?*const fn (dst: [*c]Uint32, src: [*c]const Uint32, num_samples: c_int) callconv(.c) void = null;
pub export fn ConvertAudioToFloat(dst: [*c]f32, src: ?*const anyopaque, num_samples: c_int, src_fmt: SDL_AudioFormat) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "ConvertAudioToFloat".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unexpected audio format!\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (src_fmt) {
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_S16) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_S32) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_F32) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                SDL_Convert_S8_to_F32.?(dst, @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_Convert_U8_to_F32.?(dst, @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                SDL_Convert_S16_to_F32.?(dst, @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                SDL_Convert_Swap16.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                SDL_Convert_S16_to_F32.?(dst, @ptrCast(@alignCast(dst)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                SDL_Convert_S32_to_F32.?(dst, @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                SDL_Convert_Swap32.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                SDL_Convert_S32_to_F32.?(dst, @ptrCast(@alignCast(dst)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                SDL_Convert_Swap32.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                if (!!(@intFromPtr("Unexpected audio format!") != 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiotypecvt.c", 882);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn ConvertAudioFromFloat(dst: ?*anyopaque, src: [*c]const f32, num_samples: c_int, dst_fmt: SDL_AudioFormat) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "ConvertAudioFromFloat".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unexpected audio format!\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (dst_fmt) {
                    @as(SDL_AudioFormat, SDL_AUDIO_S8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_U8) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S16) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_S16) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_AudioFormat, SDL_AUDIO_S32) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_S32) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_uint, SDL_AUDIO_F32) ^ (@as(c_uint, 1) << @intCast(@as(c_uint, 12))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                SDL_Convert_F32_to_S8.?(@ptrCast(@alignCast(dst)), src, num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_Convert_F32_to_U8.?(@ptrCast(@alignCast(dst)), src, num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                SDL_Convert_F32_to_S16.?(@ptrCast(@alignCast(dst)), src, num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                SDL_Convert_F32_to_S16.?(@ptrCast(@alignCast(dst)), src, num_samples);
                SDL_Convert_Swap16.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(dst)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                SDL_Convert_F32_to_S32.?(@ptrCast(@alignCast(dst)), src, num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                SDL_Convert_F32_to_S32.?(@ptrCast(@alignCast(dst)), src, num_samples);
                SDL_Convert_Swap32.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(dst)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                SDL_Convert_Swap32.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                if (!!(@intFromPtr("Unexpected audio format!") != 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiotypecvt.c", 919);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn ConvertAudioSwapEndian(dst: ?*anyopaque, src: ?*const anyopaque, num_samples: c_int, bitsize: c_int) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "ConvertAudioSwapEndian".*;
    };
    _ = &static_local___func__;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"Unexpected audio format!\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (bitsize) {
                    @as(c_int, 16) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                SDL_Convert_Swap16.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_Convert_Swap32.?(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), num_samples);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                if (!!(@intFromPtr("Unexpected audio format!") != 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_audiotypecvt.c", 928);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ChooseAudioConverters() void {
    @setEvalBranchQuota(100000);
    const static_local_converters_chosen = struct {
        var converters_chosen: bool = @"false" != 0;
    };
    _ = &static_local_converters_chosen;
    if (static_local_converters_chosen.converters_chosen) {
        return;
    }
    if (SDL_HasSSE41_REAL()) {
        SDL_Convert_Swap16 = SDL_Convert_Swap16_SSSE3;
        SDL_Convert_Swap32 = SDL_Convert_Swap32_SSSE3;
    } else {
        SDL_Convert_Swap16 = SDL_Convert_Swap16_Scalar;
        SDL_Convert_Swap32 = SDL_Convert_Swap32_Scalar;
    }
    if (SDL_HasSSE2_REAL()) {
        SDL_Convert_S8_to_F32 = SDL_Convert_S8_to_F32_SSE2;
        SDL_Convert_U8_to_F32 = SDL_Convert_U8_to_F32_SSE2;
        SDL_Convert_S16_to_F32 = SDL_Convert_S16_to_F32_SSE2;
        SDL_Convert_S32_to_F32 = SDL_Convert_S32_to_F32_SSE2;
        SDL_Convert_F32_to_S8 = SDL_Convert_F32_to_S8_SSE2;
        SDL_Convert_F32_to_U8 = SDL_Convert_F32_to_U8_SSE2;
        SDL_Convert_F32_to_S16 = SDL_Convert_F32_to_S16_SSE2;
        SDL_Convert_F32_to_S32 = SDL_Convert_F32_to_S32_SSE2;
    } else {
        SDL_Convert_S8_to_F32 = SDL_Convert_S8_to_F32_Scalar;
        SDL_Convert_U8_to_F32 = SDL_Convert_U8_to_F32_Scalar;
        SDL_Convert_S16_to_F32 = SDL_Convert_S16_to_F32_Scalar;
        SDL_Convert_S32_to_F32 = SDL_Convert_S32_to_F32_Scalar;
        SDL_Convert_F32_to_S8 = SDL_Convert_F32_to_S8_Scalar;
        SDL_Convert_F32_to_U8 = SDL_Convert_F32_to_U8_Scalar;
        SDL_Convert_F32_to_S16 = SDL_Convert_F32_to_S16_Scalar;
        SDL_Convert_F32_to_S32 = SDL_Convert_F32_to_S32_Scalar;
    }
    static_local_converters_chosen.converters_chosen = @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const DIVBY2147483648 = @as(f32, 0.0000000004656612873077392578125);
