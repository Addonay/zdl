// SDL implementation ported to Zig; generated scaffolding removed.
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __v8hu = @Vector(8, c_ushort);
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
pub inline fn _mm_add_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) + @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_mullo_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) * @as(__v8hu, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2446:20: warning: TODO implement function '__builtin_ia32_pmuludq128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2444:54: warning: unable to translate function, demoted to extern
pub inline fn _mm_sub_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) - @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_and_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) & @as(__v2du, @bitCast(__b)));
}
pub inline fn _mm_or_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) | @as(__v2du, @bitCast(__b)));
}
pub const _mm_slli_epi16 = @import("simd")._mm_slli_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2788:19: warning: TODO implement function '__builtin_ia32_psllw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2787:1: warning: unable to translate function, demoted to extern
pub const _mm_slli_epi32 = @import("simd")._mm_slli_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2824:19: warning: TODO implement function '__builtin_ia32_pslld128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2823:1: warning: unable to translate function, demoted to extern
pub const _mm_srai_epi16 = @import("simd")._mm_srai_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2898:19: warning: TODO implement function '__builtin_ia32_psraw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2897:1: warning: unable to translate function, demoted to extern
pub const _mm_srli_epi16 = @import("simd")._mm_srli_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2997:19: warning: TODO implement function '__builtin_ia32_psrlw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2996:1: warning: unable to translate function, demoted to extern
pub const _mm_srli_epi32 = @import("simd")._mm_srli_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3033:19: warning: TODO implement function '__builtin_ia32_psrld128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3032:1: warning: unable to translate function, demoted to extern
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
pub inline fn _mm_storeu_si128(__p: [*c]align(1) __m128i_u, __b: __m128i) void {
    @setEvalBranchQuota(100000);
    const struct___storeu_si128 = extern struct {
        __v: [2]c_longlong align(1) = @import("std").mem.zeroes(__m128i_u),
    };
    _ = &struct___storeu_si128;
    @as([*c]struct___storeu_si128, @ptrCast(@alignCast(__p))).*.__v = __b;
}
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
pub const YCbCrType = c_uint;
pub extern fn yuv420_rgb565_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_rgb24_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_rgba_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_bgra_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_argb_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_abgr_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgb565_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgb24_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgba_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_bgra_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_argb_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_abgr_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb565_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb24_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgba_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_bgra_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_argb_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_abgr_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn rgb24_yuv420_sse(width: u32, height: u32, rgb: [*c]const u8, rgb_stride: u32, y: [*c]u8, u: [*c]u8, v: [*c]u8, y_stride: u32, uv_stride: u32, yuv_type: YCbCrType) void;
pub extern fn rgb24_yuv420_sseu(width: u32, height: u32, rgb: [*c]const u8, rgb_stride: u32, y: [*c]u8, u: [*c]u8, v: [*c]u8, y_stride: u32, uv_stride: u32, yuv_type: YCbCrType) void;
pub const YUV2RGBParam = extern struct {
    y_shift: u8 = 0,
    y_factor: i16 = 0,
    v_r_factor: i16 = 0,
    u_g_factor: i16 = 0,
    v_g_factor: i16 = 0,
    u_b_factor: i16 = 0,
};
pub const YUV2RGB: [5]YUV2RGBParam = [5]YUV2RGBParam{
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.402) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3441) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.7141) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.772) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 16,
        .y_factor = @intFromFloat((@as(f64, 1.1644) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.596) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.3918) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.813) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 2.0172) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.581) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1881) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.47) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.8629) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 16,
        .y_factor = @intFromFloat((@as(f64, 1.1644) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.7927) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.2132) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.5329) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 2.1124) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
    YUV2RGBParam{
        .y_shift = 0,
        .y_factor = @intFromFloat((@as(f64, 1.0) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .v_r_factor = @intFromFloat((@as(f64, 1.476) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
        .u_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.1647) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .v_g_factor = @truncate(-@as(c_int, @as(i16, @intFromFloat((@as(f64, 0.5719) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5))))),
        .u_b_factor = @intFromFloat((@as(f64, 1.8832) * @as(f64, @floatFromInt(@as(c_int, 1) << @intCast(PRECISION)))) + @as(f64, 0.5)),
    },
};
pub export fn yuv420_rgb565_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 2;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_1 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_2 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_3 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                rgb_4 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_12, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_12, _mm_setzero_si128()), 3);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                            }
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_5 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_6 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_7 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                rgb_8 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_22, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_22, _mm_setzero_si128()), 3);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_5);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_6);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_8);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_rgb565_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv420_rgb24_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 3;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_8);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_12);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_rgb24_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv420_rgba_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, r_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, r_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, r_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, r_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, r_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, r_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, r_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, r_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_rgba_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv420_bgra_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, b_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, b_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, b_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, b_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, b_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, b_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, b_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, b_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_bgra_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv420_argb_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(b_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(r_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(b_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(r_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(b_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(r_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(b_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(r_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_argb_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv420_abgr_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 1;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        u = _mm_loadu_si128(@ptrCast(@alignCast(u_ptr)));
                        v = _mm_loadu_si128(@ptrCast(@alignCast(v_ptr)));
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(r_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(b_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(r_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(b_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(r_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(b_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(r_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(b_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv420_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv420_abgr_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_rgb565_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 2;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_1 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_2 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_3 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                rgb_4 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_12, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_12, _mm_setzero_si128()), 3);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                            }
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_5 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_6 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_7 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                rgb_8 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_22, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_22, _mm_setzero_si128()), 3);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_5);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_6);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_8);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_rgb565_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_rgb24_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 3;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_8);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_12);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_rgb24_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_rgba_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, r_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, r_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, r_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, r_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, r_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, r_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, r_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, r_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_rgba_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_bgra_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, b_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, b_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, b_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, b_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, b_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, b_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, b_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, b_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_bgra_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_argb_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(b_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(r_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(b_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(r_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(b_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(r_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(b_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(r_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_argb_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuv422_abgr_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 2;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 4;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 1;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = 0;
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 1;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var @"u3": __m128i = undefined;
                            _ = &@"u3";
                            var @"u4": __m128i = undefined;
                            _ = &@"u4";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            var v3: __m128i = undefined;
                            _ = &v3;
                            var v4: __m128i = undefined;
                            _ = &v4;
                            @"u1" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 24), 24);
                            @"u2" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            @"u3" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            @"u4" = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            u = _mm_packus_epi16(_mm_packs_epi32(@"u1", @"u2"), _mm_packs_epi32(@"u3", @"u4"));
                            v1 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 24), 24);
                            v2 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 24), 24);
                            v3 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))), 24), 24);
                            v4 = _mm_srli_epi32(_mm_slli_epi32(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))), 24), 24);
                            v = _mm_packus_epi16(_mm_packs_epi32(v1, v2), _mm_packs_epi32(v3, v4));
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        {
                            var y1_1: __m128i = undefined;
                            _ = &y1_1;
                            var y2: __m128i = undefined;
                            _ = &y2;
                            y1_1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))))), 8), 8);
                            y2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast((y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            y = _mm_packus_epi16(y1_1, y2);
                        }
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(r_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(b_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(r_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(b_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(r_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(b_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(r_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(b_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuv422_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuv422_abgr_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_rgb565_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 2;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_1 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_2 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_11), red_mask);
                                rgb_3 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                rgb_4 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_12), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_11, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_12, _mm_setzero_si128()), 2), 5);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_11, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_12, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_12, _mm_setzero_si128()), 3);
                                rgb_1 = _mm_or_si128(rgb_1, tmp1);
                                rgb_2 = _mm_or_si128(rgb_2, tmp2);
                                rgb_3 = _mm_or_si128(rgb_3, tmp3);
                                rgb_4 = _mm_or_si128(rgb_4, tmp4);
                            }
                            {
                                var red_mask: __m128i = undefined;
                                _ = &red_mask;
                                var tmp1: __m128i = undefined;
                                _ = &tmp1;
                                var tmp2: __m128i = undefined;
                                _ = &tmp2;
                                var tmp3: __m128i = undefined;
                                _ = &tmp3;
                                var tmp4: __m128i = undefined;
                                _ = &tmp4;
                                red_mask = _mm_set1_epi16(@bitCast(@as(c_ushort, @truncate(@as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 63488)))))))));
                                rgb_5 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_6 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_21), red_mask);
                                rgb_7 = _mm_and_si128(_mm_unpacklo_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                rgb_8 = _mm_and_si128(_mm_unpackhi_epi8(_mm_setzero_si128(), r_8_22), red_mask);
                                tmp1 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp2 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_21, _mm_setzero_si128()), 2), 5);
                                tmp3 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpacklo_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                tmp4 = _mm_slli_epi16(_mm_srli_epi16(_mm_unpackhi_epi8(g_8_22, _mm_setzero_si128()), 2), 5);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                                tmp1 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp2 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_21, _mm_setzero_si128()), 3);
                                tmp3 = _mm_srli_epi16(_mm_unpacklo_epi8(b_8_22, _mm_setzero_si128()), 3);
                                tmp4 = _mm_srli_epi16(_mm_unpackhi_epi8(b_8_22, _mm_setzero_si128()), 3);
                                rgb_5 = _mm_or_si128(rgb_5, tmp1);
                                rgb_6 = _mm_or_si128(rgb_6, tmp2);
                                rgb_7 = _mm_or_si128(rgb_7, tmp3);
                                rgb_8 = _mm_or_si128(rgb_8, tmp4);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_5);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_6);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_8);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgb565_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_rgb565_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_rgb24_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 3;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            r_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_1, _mm_set1_epi16(255)), _mm_and_si128(rgb_2, _mm_set1_epi16(255)));
                            r_8_12 = _mm_packus_epi16(_mm_and_si128(rgb_3, _mm_set1_epi16(255)), _mm_and_si128(rgb_4, _mm_set1_epi16(255)));
                            g_8_11 = _mm_packus_epi16(_mm_and_si128(rgb_5, _mm_set1_epi16(255)), _mm_and_si128(rgb_6, _mm_set1_epi16(255)));
                            g_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_1, 8), _mm_srli_epi16(rgb_2, 8));
                            b_8_11 = _mm_packus_epi16(_mm_srli_epi16(rgb_3, 8), _mm_srli_epi16(rgb_4, 8));
                            b_8_12 = _mm_packus_epi16(_mm_srli_epi16(rgb_5, 8), _mm_srli_epi16(rgb_6, 8));
                            rgb_1 = _mm_packus_epi16(_mm_and_si128(r_8_11, _mm_set1_epi16(255)), _mm_and_si128(r_8_12, _mm_set1_epi16(255)));
                            rgb_2 = _mm_packus_epi16(_mm_and_si128(g_8_11, _mm_set1_epi16(255)), _mm_and_si128(g_8_12, _mm_set1_epi16(255)));
                            rgb_3 = _mm_packus_epi16(_mm_and_si128(b_8_11, _mm_set1_epi16(255)), _mm_and_si128(b_8_12, _mm_set1_epi16(255)));
                            rgb_4 = _mm_packus_epi16(_mm_srli_epi16(r_8_11, 8), _mm_srli_epi16(r_8_12, 8));
                            rgb_5 = _mm_packus_epi16(_mm_srli_epi16(g_8_11, 8), _mm_srli_epi16(g_8_12, 8));
                            rgb_6 = _mm_packus_epi16(_mm_srli_epi16(b_8_11, 8), _mm_srli_epi16(b_8_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            r_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_7, _mm_set1_epi16(255)), _mm_and_si128(rgb_8, _mm_set1_epi16(255)));
                            r_8_22 = _mm_packus_epi16(_mm_and_si128(rgb_9, _mm_set1_epi16(255)), _mm_and_si128(rgb_10, _mm_set1_epi16(255)));
                            g_8_21 = _mm_packus_epi16(_mm_and_si128(rgb_11, _mm_set1_epi16(255)), _mm_and_si128(rgb_12, _mm_set1_epi16(255)));
                            g_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_7, 8), _mm_srli_epi16(rgb_8, 8));
                            b_8_21 = _mm_packus_epi16(_mm_srli_epi16(rgb_9, 8), _mm_srli_epi16(rgb_10, 8));
                            b_8_22 = _mm_packus_epi16(_mm_srli_epi16(rgb_11, 8), _mm_srli_epi16(rgb_12, 8));
                            rgb_7 = _mm_packus_epi16(_mm_and_si128(r_8_21, _mm_set1_epi16(255)), _mm_and_si128(r_8_22, _mm_set1_epi16(255)));
                            rgb_8 = _mm_packus_epi16(_mm_and_si128(g_8_21, _mm_set1_epi16(255)), _mm_and_si128(g_8_22, _mm_set1_epi16(255)));
                            rgb_9 = _mm_packus_epi16(_mm_and_si128(b_8_21, _mm_set1_epi16(255)), _mm_and_si128(b_8_22, _mm_set1_epi16(255)));
                            rgb_10 = _mm_packus_epi16(_mm_srli_epi16(r_8_21, 8), _mm_srli_epi16(r_8_22, 8));
                            rgb_11 = _mm_packus_epi16(_mm_srli_epi16(g_8_21, 8), _mm_srli_epi16(g_8_22, 8));
                            rgb_12 = _mm_packus_epi16(_mm_srli_epi16(b_8_21, 8), _mm_srli_epi16(b_8_22, 8));
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_7);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_8);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_12);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgb24_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_rgb24_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_rgba_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, r_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, r_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, r_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, r_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, b_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, r_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, r_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, b_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, b_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, r_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, r_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_rgba_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_rgba_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_bgra_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_11);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_11);
                                lo_gr = _mm_unpacklo_epi8(g_8_11, b_8_11);
                                hi_gr = _mm_unpackhi_epi8(g_8_11, b_8_11);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_12);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_12);
                                lo_gr = _mm_unpacklo_epi8(g_8_12, b_8_12);
                                hi_gr = _mm_unpackhi_epi8(g_8_12, b_8_12);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(a, r_8_21);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_21);
                                lo_gr = _mm_unpacklo_epi8(g_8_21, b_8_21);
                                hi_gr = _mm_unpackhi_epi8(g_8_21, b_8_21);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(a, r_8_22);
                                hi_ab = _mm_unpackhi_epi8(a, r_8_22);
                                lo_gr = _mm_unpacklo_epi8(g_8_22, b_8_22);
                                hi_gr = _mm_unpackhi_epi8(g_8_22, b_8_22);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_bgra_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_bgra_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_argb_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(b_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(r_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(b_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(r_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(b_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(b_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(r_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(b_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(b_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(r_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(r_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_argb_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_argb_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}
pub export fn yuvnv12_abgr_sseu(arg_width: u32, height: u32, Y: [*c]const u8, U: [*c]const u8, V_1: [*c]const u8, Y_stride: u32, UV_stride: u32, RGB: [*c]u8, RGB_stride: u32, yuv_type: YCbCrType) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    const param: [*c]const YUV2RGBParam = &YUV2RGB[yuv_type];
    _ = &param;
    const y_pixel_stride: c_int = 1;
    _ = &y_pixel_stride;
    const uv_pixel_stride: c_int = 2;
    _ = &uv_pixel_stride;
    const uv_x_sample_interval: c_int = 2;
    _ = &uv_x_sample_interval;
    const uv_y_sample_interval: c_int = 2;
    _ = &uv_y_sample_interval;
    const rgb_pixel_stride: c_int = 4;
    _ = &rgb_pixel_stride;
    const fix_read_nv12: c_int = @intFromBool((width & @as(u32, 31)) == @as(u32, 0));
    _ = &fix_read_nv12;
    const fix_read_422: c_int = 0;
    _ = &fix_read_422;
    if (width >= @as(u32, 32)) {
        var xpos: u32 = undefined;
        _ = &xpos;
        var ypos: u32 = undefined;
        _ = &ypos;
        {
            ypos = 0;
            while (ypos < ((height -% @as(u32, @bitCast(@as(c_int, uv_y_sample_interval - @as(c_int, 1))))) -% @as(u32, @bitCast(@as(c_int, fix_read_422))))) : (ypos +%= @bitCast(@as(c_int, uv_y_sample_interval))) {
                var y_ptr1: [*c]const u8 = Y + (ypos *% Y_stride);
                _ = &y_ptr1;
                var y_ptr2: [*c]const u8 = Y + ((ypos +% @as(u32, 1)) *% Y_stride);
                _ = &y_ptr2;
                var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &u_ptr;
                var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
                _ = &v_ptr;
                var rgb_ptr1: [*c]u8 = RGB + (ypos *% RGB_stride);
                _ = &rgb_ptr1;
                var rgb_ptr2: [*c]u8 = RGB + ((ypos +% @as(u32, 1)) *% RGB_stride);
                _ = &rgb_ptr2;
                {
                    xpos = 0;
                    while (xpos < ((width -% @as(u32, 31)) -% @as(u32, @bitCast(@as(c_int, fix_read_nv12))))) : (xpos +%= 32) {
                        var r_tmp: __m128i = undefined;
                        _ = &r_tmp;
                        var g_tmp: __m128i = undefined;
                        _ = &g_tmp;
                        var b_tmp: __m128i = undefined;
                        _ = &b_tmp;
                        var r_16_1: __m128i = undefined;
                        _ = &r_16_1;
                        var g_16_1: __m128i = undefined;
                        _ = &g_16_1;
                        var b_16_1: __m128i = undefined;
                        _ = &b_16_1;
                        var r_16_2: __m128i = undefined;
                        _ = &r_16_2;
                        var g_16_2: __m128i = undefined;
                        _ = &g_16_2;
                        var b_16_2: __m128i = undefined;
                        _ = &b_16_2;
                        var r_uv_16_1: __m128i = undefined;
                        _ = &r_uv_16_1;
                        var g_uv_16_1: __m128i = undefined;
                        _ = &g_uv_16_1;
                        var b_uv_16_1: __m128i = undefined;
                        _ = &b_uv_16_1;
                        var r_uv_16_2: __m128i = undefined;
                        _ = &r_uv_16_2;
                        var g_uv_16_2: __m128i = undefined;
                        _ = &g_uv_16_2;
                        var b_uv_16_2: __m128i = undefined;
                        _ = &b_uv_16_2;
                        var y_16_1: __m128i = undefined;
                        _ = &y_16_1;
                        var y_16_2: __m128i = undefined;
                        _ = &y_16_2;
                        var y: __m128i = undefined;
                        _ = &y;
                        var u: __m128i = undefined;
                        _ = &u;
                        var v: __m128i = undefined;
                        _ = &v;
                        var u_16: __m128i = undefined;
                        _ = &u_16;
                        var v_16: __m128i = undefined;
                        _ = &v_16;
                        var r_8_11: __m128i = undefined;
                        _ = &r_8_11;
                        var g_8_11: __m128i = undefined;
                        _ = &g_8_11;
                        var b_8_11: __m128i = undefined;
                        _ = &b_8_11;
                        var r_8_21: __m128i = undefined;
                        _ = &r_8_21;
                        var g_8_21: __m128i = undefined;
                        _ = &g_8_21;
                        var b_8_21: __m128i = undefined;
                        _ = &b_8_21;
                        var r_8_12: __m128i = undefined;
                        _ = &r_8_12;
                        var g_8_12: __m128i = undefined;
                        _ = &g_8_12;
                        var b_8_12: __m128i = undefined;
                        _ = &b_8_12;
                        var r_8_22: __m128i = undefined;
                        _ = &r_8_22;
                        var g_8_22: __m128i = undefined;
                        _ = &g_8_22;
                        var b_8_22: __m128i = undefined;
                        _ = &b_8_22;
                        {
                            var @"u1": __m128i = undefined;
                            _ = &@"u1";
                            var @"u2": __m128i = undefined;
                            _ = &@"u2";
                            var v1: __m128i = undefined;
                            _ = &v1;
                            var v2: __m128i = undefined;
                            _ = &v2;
                            @"u1" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr))), 8), 8);
                            @"u2" = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(u_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            u = _mm_packus_epi16(@"u1", @"u2");
                            v1 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr))), 8), 8);
                            v2 = _mm_srli_epi16(_mm_slli_epi16(_mm_loadu_si128(@ptrCast(@alignCast(v_ptr + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))), 8), 8);
                            v = _mm_packus_epi16(v1, v2);
                        }
                        u_16 = _mm_unpacklo_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpacklo_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_11 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_11 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_11 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2)));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_21 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_21 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_21 = _mm_packus_epi16(b_16_1, b_16_2);
                        u_16 = _mm_unpackhi_epi8(u, _mm_setzero_si128());
                        v_16 = _mm_unpackhi_epi8(v, _mm_setzero_si128());
                        u_16 = _mm_add_epi16(u_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        v_16 = _mm_add_epi16(v_16, _mm_set1_epi16(@truncate(-@as(c_int, 128))));
                        r_tmp = _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_r_factor));
                        g_tmp = _mm_add_epi16(_mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_g_factor)), _mm_mullo_epi16(v_16, _mm_set1_epi16(param.*.v_g_factor)));
                        b_tmp = _mm_mullo_epi16(u_16, _mm_set1_epi16(param.*.u_b_factor));
                        r_16_1 = _mm_unpacklo_epi16(r_tmp, r_tmp);
                        g_16_1 = _mm_unpacklo_epi16(g_tmp, g_tmp);
                        b_16_1 = _mm_unpacklo_epi16(b_tmp, b_tmp);
                        r_16_2 = _mm_unpackhi_epi16(r_tmp, r_tmp);
                        g_16_2 = _mm_unpackhi_epi16(g_tmp, g_tmp);
                        b_16_2 = _mm_unpackhi_epi16(b_tmp, b_tmp);
                        r_uv_16_1 = r_16_1;
                        g_uv_16_1 = g_16_1;
                        b_uv_16_1 = b_16_1;
                        r_uv_16_2 = r_16_2;
                        g_uv_16_2 = g_16_2;
                        b_uv_16_2 = b_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_12 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_12 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_12 = _mm_packus_epi16(b_16_1, b_16_2);
                        r_16_1 = r_uv_16_1;
                        g_16_1 = g_uv_16_1;
                        b_16_1 = b_uv_16_1;
                        r_16_2 = r_uv_16_2;
                        g_16_2 = g_uv_16_2;
                        b_16_2 = b_uv_16_2;
                        y = _mm_loadu_si128(@ptrCast(@alignCast(y_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16) * y_pixel_stride)))))));
                        y_16_1 = _mm_unpacklo_epi8(y, _mm_setzero_si128());
                        y_16_2 = _mm_unpackhi_epi8(y, _mm_setzero_si128());
                        y_16_1 = _mm_mullo_epi16(_mm_sub_epi16(y_16_1, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        y_16_2 = _mm_mullo_epi16(_mm_sub_epi16(y_16_2, _mm_set1_epi16(param.*.y_shift)), _mm_set1_epi16(param.*.y_factor));
                        r_16_1 = _mm_srai_epi16(_mm_add_epi16(r_16_1, y_16_1), PRECISION);
                        g_16_1 = _mm_srai_epi16(_mm_add_epi16(g_16_1, y_16_1), PRECISION);
                        b_16_1 = _mm_srai_epi16(_mm_add_epi16(b_16_1, y_16_1), PRECISION);
                        r_16_2 = _mm_srai_epi16(_mm_add_epi16(r_16_2, y_16_2), PRECISION);
                        g_16_2 = _mm_srai_epi16(_mm_add_epi16(g_16_2, y_16_2), PRECISION);
                        b_16_2 = _mm_srai_epi16(_mm_add_epi16(b_16_2, y_16_2), PRECISION);
                        r_8_22 = _mm_packus_epi16(r_16_1, r_16_2);
                        g_8_22 = _mm_packus_epi16(g_16_1, g_16_2);
                        b_8_22 = _mm_packus_epi16(b_16_1, b_16_2);
                        {
                            var rgb_1: __m128i = undefined;
                            _ = &rgb_1;
                            var rgb_2: __m128i = undefined;
                            _ = &rgb_2;
                            var rgb_3: __m128i = undefined;
                            _ = &rgb_3;
                            var rgb_4: __m128i = undefined;
                            _ = &rgb_4;
                            var rgb_5: __m128i = undefined;
                            _ = &rgb_5;
                            var rgb_6: __m128i = undefined;
                            _ = &rgb_6;
                            var rgb_7: __m128i = undefined;
                            _ = &rgb_7;
                            var rgb_8: __m128i = undefined;
                            _ = &rgb_8;
                            var rgb_9: __m128i = undefined;
                            _ = &rgb_9;
                            var rgb_10: __m128i = undefined;
                            _ = &rgb_10;
                            var rgb_11: __m128i = undefined;
                            _ = &rgb_11;
                            var rgb_12: __m128i = undefined;
                            _ = &rgb_12;
                            var rgb_13: __m128i = undefined;
                            _ = &rgb_13;
                            var rgb_14: __m128i = undefined;
                            _ = &rgb_14;
                            var rgb_15: __m128i = undefined;
                            _ = &rgb_15;
                            var rgb_16: __m128i = undefined;
                            _ = &rgb_16;
                            var a: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255)))))));
                            _ = &a;
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_11, g_8_11);
                                hi_ab = _mm_unpackhi_epi8(r_8_11, g_8_11);
                                lo_gr = _mm_unpacklo_epi8(b_8_11, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_11, a);
                                rgb_1 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_2 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_3 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_4 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_12, g_8_12);
                                hi_ab = _mm_unpackhi_epi8(r_8_12, g_8_12);
                                lo_gr = _mm_unpacklo_epi8(b_8_12, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_12, a);
                                rgb_5 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_6 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_7 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_8 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            {
                                var lo_ab: __m128i = undefined;
                                _ = &lo_ab;
                                var hi_ab: __m128i = undefined;
                                _ = &hi_ab;
                                var lo_gr: __m128i = undefined;
                                _ = &lo_gr;
                                var hi_gr: __m128i = undefined;
                                _ = &hi_gr;
                                lo_ab = _mm_unpacklo_epi8(r_8_21, g_8_21);
                                hi_ab = _mm_unpackhi_epi8(r_8_21, g_8_21);
                                lo_gr = _mm_unpacklo_epi8(b_8_21, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_21, a);
                                rgb_9 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_10 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_11 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_12 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                                lo_ab = _mm_unpacklo_epi8(r_8_22, g_8_22);
                                hi_ab = _mm_unpackhi_epi8(r_8_22, g_8_22);
                                lo_gr = _mm_unpacklo_epi8(b_8_22, a);
                                hi_gr = _mm_unpackhi_epi8(b_8_22, a);
                                rgb_13 = _mm_unpacklo_epi16(lo_ab, lo_gr);
                                rgb_14 = _mm_unpackhi_epi16(lo_ab, lo_gr);
                                rgb_15 = _mm_unpacklo_epi16(hi_ab, hi_gr);
                                rgb_16 = _mm_unpackhi_epi16(hi_ab, hi_gr);
                            }
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1)), rgb_1);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_2);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_3);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_4);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_5);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_6);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_7);
                            _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_8);
                            if (uv_y_sample_interval > @as(c_int, 1)) {
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2)), rgb_9);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), rgb_10);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))), rgb_11);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))), rgb_12);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64))))))), rgb_13);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 80))))))), rgb_14);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 96))))))), rgb_15);
                                _mm_storeu_si128(@ptrCast(@alignCast(rgb_ptr2 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 112))))))), rgb_16);
                            }
                        }
                        y_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        y_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * y_pixel_stride))));
                        u_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        v_ptr += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, 32) * uv_pixel_stride, uv_x_sample_interval)))));
                        rgb_ptr1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                        rgb_ptr2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32) * rgb_pixel_stride))));
                    }
                }
            }
        }
        if (fix_read_422 != 0) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
            ypos +%= @bitCast(@as(c_int, uv_y_sample_interval));
        }
        if ((uv_y_sample_interval == @as(c_int, 2)) and (ypos == (height -% @as(u32, 1)))) {
            var y_ptr: [*c]const u8 = Y + (ypos *% Y_stride);
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((ypos / @as(u32, @bitCast(@as(c_int, uv_y_sample_interval)))) *% UV_stride);
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (ypos *% RGB_stride);
            _ = &rgb_ptr;
            yuvnv12_abgr_std(width, 1, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
    {
        var converted: u32 = width & @as(u32, @bitCast(@as(c_int, ~@as(c_int, 31))));
        _ = &converted;
        if (fix_read_nv12 != 0) {
            converted -%= 32;
        }
        if (converted != width) {
            var y_ptr: [*c]const u8 = Y + (converted *% @as(u32, @bitCast(@as(c_int, y_pixel_stride))));
            _ = &y_ptr;
            var u_ptr: [*c]const u8 = U + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &u_ptr;
            var v_ptr: [*c]const u8 = V_1 + ((converted *% @as(u32, @bitCast(@as(c_int, uv_pixel_stride)))) / @as(u32, @bitCast(@as(c_int, uv_x_sample_interval))));
            _ = &v_ptr;
            var rgb_ptr: [*c]u8 = RGB + (converted *% @as(u32, @bitCast(@as(c_int, rgb_pixel_stride))));
            _ = &rgb_ptr;
            yuvnv12_abgr_std(width -% converted, height, y_ptr, u_ptr, v_ptr, Y_stride, UV_stride, rgb_ptr, RGB_stride, yuv_type);
        }
    }
}

pub const PRECISION = @as(c_int, 6);
