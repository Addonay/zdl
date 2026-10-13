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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub inline fn SDL_size_mul_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.mul_overflow(a, b, ret))) == @as(c_int, 0);
}
pub inline fn SDL_size_add_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.add_overflow(a, b, ret))) == @as(c_int, 0);
}
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
pub const SDL_PIXELFORMAT_XBGR2101010: c_int = 374808580;
pub const SDL_PIXELFORMAT_RGB48: c_int = 403714054;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_I444: c_int = 875836489;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_RANGE_FULL: c_int = 2;
pub const enum_SDL_ColorRange = c_uint;
pub const SDL_ColorRange = enum_SDL_ColorRange;
pub const SDL_MATRIX_COEFFICIENTS_BT709: c_int = 1;
pub const SDL_MATRIX_COEFFICIENTS_UNSPECIFIED: c_int = 2;
pub const SDL_MATRIX_COEFFICIENTS_BT470BG: c_int = 5;
pub const SDL_MATRIX_COEFFICIENTS_BT601: c_int = 6;
pub const SDL_MATRIX_COEFFICIENTS_BT2020_NCL: c_int = 9;
pub const enum_SDL_MatrixCoefficients = c_uint;
pub const SDL_MatrixCoefficients = enum_SDL_MatrixCoefficients;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub extern fn SDL_GetPixelFormatName_REAL(format: SDL_PixelFormat) [*c]const u8;
pub extern fn SDL_ConvertPixels_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixelsAndColorspace_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_HasSSE2_REAL() bool;
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
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
pub const _mm_srli_epi16 = @import("simd")._mm_srli_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2997:19: warning: TODO implement function '__builtin_ia32_psrlw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2996:1: warning: unable to translate function, demoted to extern
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
pub inline fn _mm_set1_epi16(__w: c_short) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi16(__w, __w, __w, __w, __w, __w, __w, __w);
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
pub const YCBCR_601_FULL: c_int = 0;
pub const YCBCR_601_LIMITED: c_int = 1;
pub const YCBCR_709_FULL: c_int = 2;
pub const YCBCR_709_LIMITED: c_int = 3;
pub const YCBCR_2020_NCL_FULL: c_int = 4;
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
pub extern fn yuv444_rgba_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv444_bgra_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv444_argb_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv444_abgr_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb565_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb24_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgba_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_bgra_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_argb_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_abgr_std(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvp010_xbgr2101010_std(width: u32, height: u32, y: [*c]const u16, u: [*c]const u16, v: [*c]const u16, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvi0fl_rgb48_std(width: u32, height: u32, y: [*c]const u16, u: [*c]const u16, v: [*c]const u16, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvi4fl_rgb48_std(width: u32, height: u32, y: [*c]const u16, u: [*c]const u16, v: [*c]const u16, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_rgb565_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_rgb24_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_rgba_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_bgra_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_argb_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv420_abgr_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgb565_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgb24_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_rgba_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_bgra_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_argb_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuv422_abgr_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb565_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgb24_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_rgba_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_bgra_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_argb_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub extern fn yuvnv12_abgr_sseu(width: u32, height: u32, y: [*c]const u8, u: [*c]const u8, v: [*c]const u8, y_stride: u32, uv_stride: u32, rgb: [*c]u8, rgb_stride: u32, yuv_type: YCbCrType) void;
pub fn IsPlanar1x1Format(format: SDL_PixelFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL));
}
pub fn IsPlanar2x2Format(format: SDL_PixelFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL));
}
pub fn IsPacked4Format(format: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ((format == @as(Uint32, SDL_PIXELFORMAT_YUY2)) or (format == @as(Uint32, SDL_PIXELFORMAT_UYVY))) or (format == @as(Uint32, SDL_PIXELFORMAT_YVYU));
}
pub export fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    var sz_plane: c_int = undefined;
    _ = &sz_plane;
    var sz_plane_chroma: c_int = undefined;
    _ = &sz_plane_chroma;
    var sz_plane_packed: c_int = undefined;
    _ = &sz_plane_packed;
    var s1: usize = undefined;
    _ = &s1;
    var s1_1: usize = undefined;
    _ = &s1_1;
    var s1_2: usize = undefined;
    _ = &s1_2;
    var s2: usize = undefined;
    _ = &s2;
    var s3: usize = undefined;
    _ = &s3;
    var s1_3: usize = undefined;
    _ = &s1_3;
    var s2_4: usize = undefined;
    _ = &s2_4;
    var s1_5: usize = undefined;
    _ = &s1_5;
    var s2_6: usize = undefined;
    _ = &s2_6;
    var p1: usize = undefined;
    _ = &p1;
    var p2: usize = undefined;
    _ = &p2;
    var s1_7: usize = undefined;
    _ = &s1_7;
    var s1_8: usize = undefined;
    _ = &s1_8;
    var s2_9: usize = undefined;
    _ = &s2_9;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                sz_plane = 0;
                sz_plane_chroma = 0;
                sz_plane_packed = 0;
                if (IsPlanar1x1Format(format)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (!SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, w)), @bitCast(@as(c_long, h)), &s1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                if (IsPlanar2x2Format(format)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            3 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 78;
                        continue;
                    },
                    else => {
                        sdl_pc = 91;
                        continue;
                    },
                }
            },
            4 => {
                return SDL_SetError_REAL("width * height would overflow");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!SDL_size_mul_check_overflow_builtin(s1, @bitCast(@as(c_long, if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))), &s1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("width * height * bpp would overflow");
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                sz_plane = @bitCast(@as(c_uint, @truncate(s1)));
                sz_plane_chroma = sz_plane;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            10 => {
                if (!SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, w)), @bitCast(@as(c_long, h)), &s1_1)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                if (IsPacked4Format(format)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("width * height would overflow");
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (!SDL_size_mul_check_overflow_builtin(s1_1, @bitCast(@as(c_long, if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))), &s1_1)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return SDL_SetError_REAL("width * height * bpp would overflow");
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                sz_plane = @bitCast(@as(c_uint, @truncate(s1_1)));
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, w)), 1, &s1_2)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                return SDL_SetError_REAL("width + 1 would overflow");
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                s1_2 = s1_2 / @as(usize, 2);
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, h)), 1, &s2)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                return SDL_SetError_REAL("height + 1 would overflow");
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                s2 = s2 / @as(usize, 2);
                if (!SDL_size_mul_check_overflow_builtin(s1_2, s2, &s3)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return SDL_SetError_REAL("width * height would overflow");
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (!SDL_size_mul_check_overflow_builtin(s3, @bitCast(@as(c_long, if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))), &s3)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                return SDL_SetError_REAL("width * height * bpp would overflow");
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                sz_plane_chroma = @bitCast(@as(c_uint, @truncate(s3)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            31 => {
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, w)), 1, &s1_3)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            33 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            34 => {
                return SDL_SetError_REAL("width + 1 would overflow");
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                s1_3 = s1_3 / @as(usize, 2);
                if (!SDL_size_mul_check_overflow_builtin(s1_3, @bitCast(@as(c_long, h)), &s2_4)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                return SDL_SetError_REAL("width * height would overflow");
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                sz_plane_packed = @bitCast(@as(c_uint, @truncate(s2_4)));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            40 => {
                return @"true" != 0;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (pitch != null) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                pitch.* = @bitCast(@as(c_long, w * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                if (size != null) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, sz_plane)), @bitCast(@as(c_long, sz_plane_chroma)), &s1_5)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            52 => {
                return SDL_SetError_REAL("Y + U would overflow");
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (!SDL_size_add_check_overflow_builtin(s1_5, @bitCast(@as(c_long, sz_plane_chroma)), &s2_6)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                return SDL_SetError_REAL("Y + U + V would overflow");
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                size.* = @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(s2_6))))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if (pitch != null) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, w)), 1, &p1)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                if (size != null) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            64 => {
                return SDL_SetError_REAL("width + 1 would overflow");
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                p1 = p1 / @as(usize, 2);
                if (!SDL_size_mul_check_overflow_builtin(p1, 4, &p2)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                return SDL_SetError_REAL("width * 4 would overflow");
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                pitch.* = p2;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            70 => {
                if (!SDL_size_mul_check_overflow_builtin(@bitCast(@as(c_long, sz_plane_packed)), 4, &s1_7)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            73 => {
                return SDL_SetError_REAL("plane * 4 would overflow");
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                size.* = @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(s1_7))))));
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (pitch != null) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                pitch.* = @bitCast(@as(c_long, w * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))));
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if (size != null) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                if (!SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, sz_plane)), @bitCast(@as(c_long, sz_plane_chroma)), &s1_8)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            85 => {
                return SDL_SetError_REAL("Y + U would overflow");
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                if (!SDL_size_add_check_overflow_builtin(s1_8, @bitCast(@as(c_long, sz_plane_chroma)), &s2_9)) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                return SDL_SetError_REAL("Y + U + V would overflow");
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                size.* = @bitCast(@as(c_long, @as(c_int, @bitCast(@as(c_uint, @truncate(s2_9))))));
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            91 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub fn GetYUVConversionType(colorspace: SDL_Colorspace, _: c_int, arg_h: c_int, bits_per_pixel: c_int, yuv_type: [*c]YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var h = arg_h;
    _ = &h;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31)) == @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT601)) or (@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31)) == @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT470BG))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31)) == @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT709)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                yuv_type.* = YCBCR_601_LIMITED;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                yuv_type.* = YCBCR_601_FULL;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                return @"true" != 0;
            },
            7 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31)) == @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_BT2020_NCL)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                yuv_type.* = YCBCR_709_LIMITED;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                yuv_type.* = YCBCR_709_FULL;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                return @"true" != 0;
            },
            13 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) == @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (@as(SDL_MatrixCoefficients, colorspace & @as(SDL_Colorspace, 31)) == @as(SDL_MatrixCoefficients, SDL_MATRIX_COEFFICIENTS_UNSPECIFIED)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            16 => {
                yuv_type.* = YCBCR_2020_NCL_FULL;
                return @"true" != 0;
            },
            17 => {
                {
                    sdl_pc = 18;
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
                switch (bits_per_pixel) {
                    @as(c_int, 8) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 10) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 34;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                return SDL_SetError_REAL("Unsupported YUV colorspace");
            },
            22 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                if (h <= YUV_SD_THRESHOLD) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) != @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            26 => {
                return @"true" != 0;
            },
            27 => {
                yuv_type.* = YCBCR_601_LIMITED;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                yuv_type.* = YCBCR_601_FULL;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                yuv_type.* = YCBCR_709_LIMITED;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                yuv_type.* = YCBCR_709_FULL;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if (@as(SDL_ColorRange, (colorspace >> @intCast(@as(SDL_Colorspace, 24))) & @as(SDL_Colorspace, 15)) == @as(SDL_ColorRange, SDL_COLOR_RANGE_FULL)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                yuv_type.* = YCBCR_2020_NCL_FULL;
                return @"true" != 0;
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn GetYUVPlanes(width: c_int, height: c_int, format: SDL_PixelFormat, yuv: ?*const anyopaque, yuv_pitch: c_int, y: [*c][*c]const Uint8, u: [*c][*c]const Uint8, v: [*c][*c]const Uint8, y_stride: [*c]Uint32, uv_stride: [*c]Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var planes: [3][*c]const Uint8 = undefined;
    _ = &planes;
    var pitches: [3]c_int = undefined;
    _ = &pitches;
    var uv_width: c_int = undefined;
    _ = &uv_width;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                planes = [3][*c]const Uint8{
                    null,
                    null,
                    null,
                };
                pitches = [3]c_int{
                    0,
                    0,
                    0,
                };
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 13;
                        continue;
                    },
                }
            },
            1 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                pitches[@as(c_int, 0)] = yuv_pitch;
                pitches[@as(c_int, 1)] = @divTrunc(@divTrunc(pitches[@as(c_int, 0)], if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) + @as(c_int, 1), @as(c_int, 2)) * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
                pitches[@as(c_int, 2)] = pitches[@as(c_int, 1)];
                planes[@as(c_int, 0)] = @ptrCast(@alignCast(yuv));
                planes[@as(c_int, 1)] = planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 0)] * height))));
                planes[@as(c_int, 2)] = planes[@as(c_int, 1)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 1)] * @divTrunc(height + @as(c_int, 1), @as(c_int, 2))))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                pitches[@as(c_int, 0)] = yuv_pitch;
                planes[@as(c_int, 0)] = @ptrCast(@alignCast(yuv));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                pitches[@as(c_int, 0)] = yuv_pitch;
                pitches[@as(c_int, 1)] = @as(c_int, 2) * @divTrunc(pitches[@as(c_int, 0)] + @as(c_int, 1), @as(c_int, 2));
                planes[@as(c_int, 0)] = @ptrCast(@alignCast(yuv));
                planes[@as(c_int, 1)] = planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 0)] * height))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                pitches[@as(c_int, 0)] = yuv_pitch;
                uv_width = @divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
                pitches[@as(c_int, 1)] = if (pitches[@as(c_int, 0)] > @as(c_int, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, uv_width))) *% @sizeOf(Uint16)))))) pitches[@as(c_int, 0)] else @as(c_int, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, uv_width))) *% @sizeOf(Uint16)))));
                planes[@as(c_int, 0)] = @ptrCast(@alignCast(yuv));
                planes[@as(c_int, 1)] = planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 0)] * height))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                pitches[@as(c_int, 0)] = yuv_pitch;
                pitches[@as(c_int, 1)] = pitches[@as(c_int, 0)];
                pitches[@as(c_int, 2)] = pitches[@as(c_int, 1)];
                planes[@as(c_int, 0)] = @ptrCast(@alignCast(yuv));
                planes[@as(c_int, 1)] = planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 0)] * height))));
                planes[@as(c_int, 2)] = planes[@as(c_int, 1)] + @as(usize, @bitCast(@as(isize, @intCast(pitches[@as(c_int, 1)] * height))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("GetYUVPlanes(): Unsupported YUV format: %s", SDL_GetPixelFormatName_REAL(format));
            },
            14 => {
                return @"true" != 0;
            },
            15 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = planes[@as(c_int, 1)];
                u.* = planes[@as(c_int, 2)];
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 1)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = planes[@as(c_int, 2)];
                u.* = planes[@as(c_int, 1)];
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 1)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            20 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = y.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                u.* = y.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            21 => {
                y.* = planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = y.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                u.* = y.* - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            22 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = y.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                u.* = y.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            23 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                u.* = planes[@as(c_int, 1)];
                v.* = u.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 1)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            24 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                v.* = planes[@as(c_int, 1)];
                u.* = v.* + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 1)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            25 => {
                y.* = planes[@as(c_int, 0)];
                y_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 0)]));
                u.* = planes[@as(c_int, 1)];
                v.* = u.* + @sizeOf(Uint16);
                uv_stride.* = @bitCast(@as(c_int, pitches[@as(c_int, 1)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            26 => {
                return SDL_SetError_REAL("GetYUVPlanes[2]: Unsupported YUV format: %s", SDL_GetPixelFormatName_REAL(format));
            },
            else => unreachable,
        }
    }
}
pub fn yuv_rgb_sse(src_format: SDL_PixelFormat, dst_format: SDL_PixelFormat, width: Uint32, height: Uint32, y: [*c]const Uint8, u: [*c]const Uint8, v: [*c]const Uint8, y_stride: Uint32, uv_stride: Uint32, rgb: [*c]Uint8, rgb_stride: Uint32, yuv_type: YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_HasSSE2_REAL()) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                yuv420_rgb565_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            9 => {
                yuv420_rgb24_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                yuv420_rgba_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                yuv420_bgra_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                yuv420_argb_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                yuv420_abgr_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            18 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            19 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 32;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                yuv422_rgb565_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            24 => {
                yuv422_rgb24_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                yuv422_rgba_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                yuv422_bgra_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                yuv422_argb_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                yuv422_abgr_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            33 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            34 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 47;
                        continue;
                    },
                    else => {
                        sdl_pc = 48;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                return @"false" != 0;
            },
            37 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                yuvnv12_rgb565_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            39 => {
                yuvnv12_rgb24_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                yuvnv12_rgba_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                yuvnv12_bgra_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                yuvnv12_argb_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                yuvnv12_abgr_sseu(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            48 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn yuv_rgb_lsx(_: SDL_PixelFormat, _: SDL_PixelFormat, _: Uint32, _: Uint32, _: [*c]const Uint8, _: [*c]const Uint8, _: [*c]const Uint8, _: Uint32, _: Uint32, _: [*c]Uint8, _: Uint32, _: YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub fn yuv_rgb_std(src_format: SDL_PixelFormat, dst_format: SDL_PixelFormat, width: Uint32, height: Uint32, y: [*c]const Uint8, u: [*c]const Uint8, v: [*c]const Uint8, y_stride: Uint32, uv_stride: Uint32, rgb: [*c]Uint8, rgb_stride: Uint32, yuv_type: YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                yuv420_rgb565_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            6 => {
                yuv420_rgb24_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                yuv420_rgba_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                yuv420_bgra_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                yuv420_argb_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                yuv420_abgr_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            15 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            16 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 18;
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
                yuv444_rgba_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                yuv444_bgra_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                yuv444_argb_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                yuv444_abgr_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            28 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            29 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 43;
                        continue;
                    },
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            33 => {
                yuv422_rgb565_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            34 => {
                yuv422_rgb24_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                yuv422_rgba_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                yuv422_bgra_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                yuv422_argb_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                yuv422_abgr_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            43 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            44 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB565) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB24) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 57;
                        continue;
                    },
                    else => {
                        sdl_pc = 58;
                        continue;
                    },
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            48 => {
                yuvnv12_rgb565_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            49 => {
                yuvnv12_rgb24_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                yuvnv12_rgba_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                yuvnv12_bgra_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                yuvnv12_argb_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                yuvnv12_abgr_std(width, height, y, u, v, y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            58 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            59 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 63;
                        continue;
                    },
                    else => {
                        sdl_pc = 64;
                        continue;
                    },
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            63 => {
                yuvp010_xbgr2101010_std(width, height, @ptrCast(@alignCast(y)), @ptrCast(@alignCast(u)), @ptrCast(@alignCast(v)), y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            64 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            65 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB48) => {
                        sdl_pc = 69;
                        continue;
                    },
                    else => {
                        sdl_pc = 70;
                        continue;
                    },
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            69 => {
                yuvi0fl_rgb48_std(width, height, @ptrCast(@alignCast(y)), @ptrCast(@alignCast(u)), @ptrCast(@alignCast(v)), y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            70 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB48) => {
                        sdl_pc = 75;
                        continue;
                    },
                    else => {
                        sdl_pc = 76;
                        continue;
                    },
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                return @"false" != 0;
            },
            74 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            75 => {
                yuvi4fl_rgb48_std(width, height, @ptrCast(@alignCast(y)), @ptrCast(@alignCast(u)), @ptrCast(@alignCast(v)), y_stride, uv_stride, rgb, rgb_stride, yuv_type);
                return @"true" != 0;
            },
            76 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ConvertPixels_YUV_to_RGB(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var y: [*c]const Uint8 = null;
    _ = &y;
    var u: [*c]const Uint8 = null;
    _ = &u;
    var v: [*c]const Uint8 = null;
    _ = &v;
    var y_stride: Uint32 = 0;
    _ = &y_stride;
    var uv_stride: Uint32 = 0;
    _ = &uv_stride;
    var yuv_type: YCbCrType = YCBCR_601_LIMITED;
    _ = &yuv_type;
    if (!GetYUVPlanes(width, height, src_format, src, src_pitch, &y, &u, &v, &y_stride, &uv_stride)) {
        return @"false" != 0;
    }
    if (!GetYUVConversionType(src_colorspace, width, height, 8, &yuv_type)) {
        return @"false" != 0;
    }
    if (yuv_rgb_sse(src_format, dst_format, @bitCast(@as(c_int, width)), @bitCast(@as(c_int, height)), y, u, v, y_stride, uv_stride, @ptrCast(@alignCast(dst)), @bitCast(@as(c_int, dst_pitch)), yuv_type)) {
        return @"true" != 0;
    }
    if (yuv_rgb_lsx(src_format, dst_format, @bitCast(@as(c_int, width)), @bitCast(@as(c_int, height)), y, u, v, y_stride, uv_stride, @ptrCast(@alignCast(dst)), @bitCast(@as(c_int, dst_pitch)), yuv_type)) {
        return @"true" != 0;
    }
    if (yuv_rgb_std(src_format, dst_format, @bitCast(@as(c_int, width)), @bitCast(@as(c_int, height)), y, u, v, y_stride, uv_stride, @ptrCast(@alignCast(dst)), @bitCast(@as(c_int, dst_pitch)), yuv_type)) {
        return @"true" != 0;
    }
    if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) and (dst_format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010))) {
        var result: bool = undefined;
        _ = &result;
        var tmp: ?*anyopaque = undefined;
        _ = &tmp;
        var tmp_pitch: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, width))) *% @sizeOf(Uint32))));
        _ = &tmp_pitch;
        tmp = SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, tmp_pitch))) *% @as(usize, @bitCast(@as(c_long, height))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        result = SDL_ConvertPixels_YUV_to_RGB(width, height, src_format, src_colorspace, src_properties, src, src_pitch, SDL_PIXELFORMAT_XBGR2101010, src_colorspace, src_properties, tmp, tmp_pitch);
        if (!result) {
            SDL_free_REAL(tmp);
            return @"false" != 0;
        }
        result = SDL_ConvertPixelsAndColorspace_REAL(width, height, SDL_PIXELFORMAT_XBGR2101010, src_colorspace, src_properties, tmp, tmp_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
        SDL_free_REAL(tmp);
        return result;
    }
    if (((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) and (dst_format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGB48))) {
        var result: bool = undefined;
        _ = &result;
        var tmp: ?*anyopaque = undefined;
        _ = &tmp;
        var tmp_pitch: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, width * @as(c_int, 3)))) *% @sizeOf(Uint16))));
        _ = &tmp_pitch;
        tmp = SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, tmp_pitch))) *% @as(usize, @bitCast(@as(c_long, height))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        result = SDL_ConvertPixels_YUV_to_RGB(width, height, src_format, src_colorspace, src_properties, src, src_pitch, SDL_PIXELFORMAT_RGB48, src_colorspace, src_properties, tmp, tmp_pitch);
        if (!result) {
            SDL_free_REAL(tmp);
            return @"false" != 0;
        }
        result = SDL_ConvertPixelsAndColorspace_REAL(width, height, SDL_PIXELFORMAT_RGB48, src_colorspace, src_properties, tmp, tmp_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
        SDL_free_REAL(tmp);
        return result;
    }
    if (dst_format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
        var result: bool = undefined;
        _ = &result;
        var tmp: ?*anyopaque = undefined;
        _ = &tmp;
        var tmp_pitch: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, width))) *% @sizeOf(Uint32))));
        _ = &tmp_pitch;
        tmp = SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, tmp_pitch))) *% @as(usize, @bitCast(@as(c_long, height))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        result = SDL_ConvertPixels_YUV_to_RGB(width, height, src_format, src_colorspace, src_properties, src, src_pitch, SDL_PIXELFORMAT_ARGB8888, SDL_COLORSPACE_SRGB, 0, tmp, tmp_pitch);
        if (!result) {
            SDL_free_REAL(tmp);
            return @"false" != 0;
        }
        result = SDL_ConvertPixelsAndColorspace_REAL(width, height, SDL_PIXELFORMAT_ARGB8888, SDL_COLORSPACE_SRGB, 0, tmp, tmp_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
        SDL_free_REAL(tmp);
        return result;
    }
    return SDL_SetError_REAL("Unsupported YUV conversion");
}
pub const struct_RGB2YUVFactors = extern struct {
    y_offset: c_int = 0,
    y: [3]f32 = @import("std").mem.zeroes([3]f32),
    u: [3]f32 = @import("std").mem.zeroes([3]f32),
    v: [3]f32 = @import("std").mem.zeroes([3]f32),
};
pub var RGB2YUVFactorTables: [5]struct_RGB2YUVFactors = [5]struct_RGB2YUVFactors{
    struct_RGB2YUVFactors{
        .y_offset = 0,
        .y = [3]f32{
            0.299,
            0.587,
            0.114,
        },
        .u = [3]f32{
            -@as(f32, 0.1687),
            -@as(f32, 0.3313),
            0.5,
        },
        .v = [3]f32{
            0.5,
            -@as(f32, 0.4187),
            -@as(f32, 0.0813),
        },
    },
    struct_RGB2YUVFactors{
        .y_offset = 16,
        .y = [3]f32{
            0.2568,
            0.5041,
            0.0979,
        },
        .u = [3]f32{
            -@as(f32, 0.1482),
            -@as(f32, 0.291),
            0.4392,
        },
        .v = [3]f32{
            0.4392,
            -@as(f32, 0.3678),
            -@as(f32, 0.0714),
        },
    },
    struct_RGB2YUVFactors{
        .y_offset = 0,
        .y = [3]f32{
            0.2126,
            0.7152,
            0.0722,
        },
        .u = [3]f32{
            -@as(f32, 0.1141),
            -@as(f32, 0.3839),
            0.498,
        },
        .v = [3]f32{
            0.498,
            -@as(f32, 0.4524),
            -@as(f32, 0.0457),
        },
    },
    struct_RGB2YUVFactors{
        .y_offset = 16,
        .y = [3]f32{
            0.1826,
            0.6142,
            0.062,
        },
        .u = [3]f32{
            -@as(f32, 0.1006),
            -@as(f32, 0.3386),
            0.4392,
        },
        .v = [3]f32{
            0.4392,
            -@as(f32, 0.3989),
            -@as(f32, 0.0403),
        },
    },
    struct_RGB2YUVFactors{
        .y_offset = 0,
        .y = [3]f32{
            0.2627,
            0.678,
            0.0593,
        },
        .u = [3]f32{
            -@as(f32, 0.1395),
            -@as(f32, 0.36),
            0.4995,
        },
        .v = [3]f32{
            0.4995,
            -@as(f32, 0.4593),
            -@as(f32, 0.0402),
        },
    },
};
pub fn SDL_ConvertPixels_XRGB8888_to_YUV(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, yuv_type: YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src_pitch_x_2: c_int = undefined;
    _ = &src_pitch_x_2;
    var height_half: c_int = undefined;
    _ = &height_half;
    var height_remainder: c_int = undefined;
    _ = &height_remainder;
    var width_half: c_int = undefined;
    _ = &width_half;
    var width_remainder: c_int = undefined;
    _ = &width_remainder;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var cvt: [*c]const struct_RGB2YUVFactors = undefined;
    _ = &cvt;
    var curr_row: [*c]const Uint8 = undefined;
    _ = &curr_row;
    var next_row: [*c]const Uint8 = undefined;
    _ = &next_row;
    var plane_y: [*c]Uint8 = undefined;
    _ = &plane_y;
    var plane_u: [*c]Uint8 = undefined;
    _ = &plane_u;
    var plane_v: [*c]Uint8 = undefined;
    _ = &plane_v;
    var plane_interleaved_uv: [*c]Uint8 = undefined;
    _ = &plane_interleaved_uv;
    var y_stride: Uint32 = undefined;
    _ = &y_stride;
    var uv_stride: Uint32 = undefined;
    _ = &uv_stride;
    var y_skip: Uint32 = undefined;
    _ = &y_skip;
    var uv_skip: Uint32 = undefined;
    _ = &uv_skip;
    var p1: Uint32 = undefined;
    _ = &p1;
    var r: Uint32 = undefined;
    _ = &r;
    var g: Uint32 = undefined;
    _ = &g;
    var b: Uint32 = undefined;
    _ = &b;
    var p1_1: Uint32 = undefined;
    _ = &p1_1;
    var p2: Uint32 = undefined;
    _ = &p2;
    var p3: Uint32 = undefined;
    _ = &p3;
    var p4: Uint32 = undefined;
    _ = &p4;
    var r_2: Uint32 = undefined;
    _ = &r_2;
    var g_3: Uint32 = undefined;
    _ = &g_3;
    var b_4: Uint32 = undefined;
    _ = &b_4;
    var p1_5: Uint32 = undefined;
    _ = &p1_5;
    var p2_6: Uint32 = undefined;
    _ = &p2_6;
    var r_7: Uint32 = undefined;
    _ = &r_7;
    var g_8: Uint32 = undefined;
    _ = &g_8;
    var b_9: Uint32 = undefined;
    _ = &b_9;
    var p1_10: Uint32 = undefined;
    _ = &p1_10;
    var p2_11: Uint32 = undefined;
    _ = &p2_11;
    var r_12: Uint32 = undefined;
    _ = &r_12;
    var g_13: Uint32 = undefined;
    _ = &g_13;
    var b_14: Uint32 = undefined;
    _ = &b_14;
    var p: Uint32 = undefined;
    _ = &p;
    var r_15: Uint32 = undefined;
    _ = &r_15;
    var g_16: Uint32 = undefined;
    _ = &g_16;
    var b_17: Uint32 = undefined;
    _ = &b_17;
    var p1_18: Uint32 = undefined;
    _ = &p1_18;
    var r_19: Uint32 = undefined;
    _ = &r_19;
    var g_20: Uint32 = undefined;
    _ = &g_20;
    var b_21: Uint32 = undefined;
    _ = &b_21;
    var p1_22: Uint32 = undefined;
    _ = &p1_22;
    var p2_23: Uint32 = undefined;
    _ = &p2_23;
    var p3_24: Uint32 = undefined;
    _ = &p3_24;
    var p4_25: Uint32 = undefined;
    _ = &p4_25;
    var r_26: Uint32 = undefined;
    _ = &r_26;
    var g_27: Uint32 = undefined;
    _ = &g_27;
    var b_28: Uint32 = undefined;
    _ = &b_28;
    var p1_29: Uint32 = undefined;
    _ = &p1_29;
    var p2_30: Uint32 = undefined;
    _ = &p2_30;
    var r_31: Uint32 = undefined;
    _ = &r_31;
    var g_32: Uint32 = undefined;
    _ = &g_32;
    var b_33: Uint32 = undefined;
    _ = &b_33;
    var p1_34: Uint32 = undefined;
    _ = &p1_34;
    var p2_35: Uint32 = undefined;
    _ = &p2_35;
    var r_36: Uint32 = undefined;
    _ = &r_36;
    var g_37: Uint32 = undefined;
    _ = &g_37;
    var b_38: Uint32 = undefined;
    _ = &b_38;
    var p_39: Uint32 = undefined;
    _ = &p_39;
    var r_40: Uint32 = undefined;
    _ = &r_40;
    var g_41: Uint32 = undefined;
    _ = &g_41;
    var b_42: Uint32 = undefined;
    _ = &b_42;
    var p1_43: Uint32 = undefined;
    _ = &p1_43;
    var p2_44: Uint32 = undefined;
    _ = &p2_44;
    var p3_45: Uint32 = undefined;
    _ = &p3_45;
    var p4_46: Uint32 = undefined;
    _ = &p4_46;
    var r_47: Uint32 = undefined;
    _ = &r_47;
    var g_48: Uint32 = undefined;
    _ = &g_48;
    var b_49: Uint32 = undefined;
    _ = &b_49;
    var p1_50: Uint32 = undefined;
    _ = &p1_50;
    var p2_51: Uint32 = undefined;
    _ = &p2_51;
    var r_52: Uint32 = undefined;
    _ = &r_52;
    var g_53: Uint32 = undefined;
    _ = &g_53;
    var b_54: Uint32 = undefined;
    _ = &b_54;
    var p1_55: Uint32 = undefined;
    _ = &p1_55;
    var p2_56: Uint32 = undefined;
    _ = &p2_56;
    var r_57: Uint32 = undefined;
    _ = &r_57;
    var g_58: Uint32 = undefined;
    _ = &g_58;
    var b_59: Uint32 = undefined;
    _ = &b_59;
    var p_60: Uint32 = undefined;
    _ = &p_60;
    var r_61: Uint32 = undefined;
    _ = &r_61;
    var g_62: Uint32 = undefined;
    _ = &g_62;
    var b_63: Uint32 = undefined;
    _ = &b_63;
    var curr_row_64: [*c]const Uint8 = undefined;
    _ = &curr_row_64;
    var plane: [*c]Uint8 = undefined;
    _ = &plane;
    var row_size: c_int = undefined;
    _ = &row_size;
    var plane_skip: c_int = undefined;
    _ = &plane_skip;
    var p_65: Uint32 = undefined;
    _ = &p_65;
    var r_66: Uint32 = undefined;
    _ = &r_66;
    var g_67: Uint32 = undefined;
    _ = &g_67;
    var b_68: Uint32 = undefined;
    _ = &b_68;
    var p1_69: Uint32 = undefined;
    _ = &p1_69;
    var r1: Uint32 = undefined;
    _ = &r1;
    var g1: Uint32 = undefined;
    _ = &g1;
    var b1: Uint32 = undefined;
    _ = &b1;
    var R: Uint32 = undefined;
    _ = &R;
    var G: Uint32 = undefined;
    _ = &G;
    var B: Uint32 = undefined;
    _ = &B;
    var p_70: Uint32 = undefined;
    _ = &p_70;
    var r_71: Uint32 = undefined;
    _ = &r_71;
    var g_72: Uint32 = undefined;
    _ = &g_72;
    var b_73: Uint32 = undefined;
    _ = &b_73;
    var p_74: Uint32 = undefined;
    _ = &p_74;
    var r_75: Uint32 = undefined;
    _ = &r_75;
    var g_76: Uint32 = undefined;
    _ = &g_76;
    var b_77: Uint32 = undefined;
    _ = &b_77;
    var p1_78: Uint32 = undefined;
    _ = &p1_78;
    var r1_79: Uint32 = undefined;
    _ = &r1_79;
    var g1_80: Uint32 = undefined;
    _ = &g1_80;
    var b1_81: Uint32 = undefined;
    _ = &b1_81;
    var R_82: Uint32 = undefined;
    _ = &R_82;
    var G_83: Uint32 = undefined;
    _ = &G_83;
    var B_84: Uint32 = undefined;
    _ = &B_84;
    var p_85: Uint32 = undefined;
    _ = &p_85;
    var r_86: Uint32 = undefined;
    _ = &r_86;
    var g_87: Uint32 = undefined;
    _ = &g_87;
    var b_88: Uint32 = undefined;
    _ = &b_88;
    var p_89: Uint32 = undefined;
    _ = &p_89;
    var r_90: Uint32 = undefined;
    _ = &r_90;
    var g_91: Uint32 = undefined;
    _ = &g_91;
    var b_92: Uint32 = undefined;
    _ = &b_92;
    var p1_93: Uint32 = undefined;
    _ = &p1_93;
    var r1_94: Uint32 = undefined;
    _ = &r1_94;
    var g1_95: Uint32 = undefined;
    _ = &g1_95;
    var b1_96: Uint32 = undefined;
    _ = &b1_96;
    var R_97: Uint32 = undefined;
    _ = &R_97;
    var G_98: Uint32 = undefined;
    _ = &G_98;
    var B_99: Uint32 = undefined;
    _ = &B_99;
    var p_100: Uint32 = undefined;
    _ = &p_100;
    var r_101: Uint32 = undefined;
    _ = &r_101;
    var g_102: Uint32 = undefined;
    _ = &g_102;
    var b_103: Uint32 = undefined;
    _ = &b_103;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                src_pitch_x_2 = src_pitch * @as(c_int, 2);
                height_half = @divTrunc(height, @as(c_int, 2));
                height_remainder = height & @as(c_int, 1);
                width_half = @divTrunc(width, @as(c_int, 2));
                width_remainder = width & @as(c_int, 1);
                cvt = &RGB2YUVFactorTables[yuv_type];
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 100;
                        continue;
                    },
                    else => {
                        sdl_pc = 146;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
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
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!GetYUVPlanes(width, height, dst_format, dst, dst_pitch, @ptrCast(@alignCast(&plane_y)), @ptrCast(@alignCast(&plane_u)), @ptrCast(@alignCast(&plane_v)), &y_stride, &uv_stride)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return @"false" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                plane_interleaved_uv = plane_y + (@as(Uint32, @bitCast(@as(c_int, height))) *% y_stride);
                y_skip = y_stride -% @as(Uint32, @bitCast(@as(c_int, width)));
                curr_row = @ptrCast(@alignCast(src));
                j = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (j < height) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                i = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                j += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                curr_row = @ptrCast(@alignCast(src));
                next_row = @ptrCast(@alignCast(src));
                next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                if ((dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            14 => {
                if (i < width) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                p1 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(i)))];
                r = (p1 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g = (p1 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b = p1 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane_y;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                i += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                plane_y += y_skip;
                curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                uv_skip = uv_stride -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
                j = 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                if (j < height_half) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                i = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                j += 1;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                if (height_remainder != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            25 => {
                if (i < width_half) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                p1_1 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                p3 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p4 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_2 = ((((p1_1 & @as(Uint32, 16711680)) +% (p2 & @as(Uint32, 16711680))) +% (p3 & @as(Uint32, 16711680))) +% (p4 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 18));
                g_3 = ((((p1_1 & @as(Uint32, 65280)) +% (p2 & @as(Uint32, 65280))) +% (p3 & @as(Uint32, 65280))) +% (p4 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 10));
                b_4 = ((((p1_1 & @as(Uint32, 255)) +% (p2 & @as(Uint32, 255))) +% (p3 & @as(Uint32, 255))) +% (p4 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 2));
                (blk: {
                    const ref = &plane_u;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_v;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_2))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_3)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_4)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                i += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                if (width_remainder != 0) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                p1_5 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_6 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_7 = ((p1_5 & @as(Uint32, 16711680)) +% (p2_6 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_8 = ((p1_5 & @as(Uint32, 65280)) +% (p2_6 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_9 = ((p1_5 & @as(Uint32, 255)) +% (p2_6 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_u;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_v;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_7))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_8)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_9)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                plane_u += uv_skip;
                plane_v += uv_skip;
                curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            32 => {
                i = 0;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            35 => {
                if (i < width_half) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                p1_10 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_11 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_12 = ((p1_10 & @as(Uint32, 16711680)) +% (p2_11 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_13 = ((p1_10 & @as(Uint32, 65280)) +% (p2_11 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_14 = ((p1_10 & @as(Uint32, 255)) +% (p2_11 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_u;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_v;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_12))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_13)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_14)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                i += 1;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                if (width_remainder != 0) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                p = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_15 = (p & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_16 = (p & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_17 = p & @as(Uint32, 255);
                (blk: {
                    const ref = &plane_u;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_v;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_15))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_16)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_17)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                plane_u += uv_skip;
                plane_v += uv_skip;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            42 => {
                uv_skip = uv_stride -% @as(Uint32, @bitCast(@as(c_int, width)));
                j = 0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            45 => {
                if (j < height) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                i = 0;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                j += 1;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            49 => {
                if (i < width) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                p1_18 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(i)))];
                r_19 = (p1_18 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_20 = (p1_18 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_21 = p1_18 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane_u;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_v;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_19))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_20)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_21)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                i += 1;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            52 => {
                plane_u += uv_skip;
                plane_v += uv_skip;
                curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            53 => {
                uv_skip = uv_stride -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2))));
                j = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                uv_skip = uv_stride -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2))));
                j = 0;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            56 => {
                if (j < height_half) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                i = 0;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                j += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                if (height_remainder != 0) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            60 => {
                if (i < width_half) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                p1_22 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_23 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                p3_24 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p4_25 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_26 = ((((p1_22 & @as(Uint32, 16711680)) +% (p2_23 & @as(Uint32, 16711680))) +% (p3_24 & @as(Uint32, 16711680))) +% (p4_25 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 18));
                g_27 = ((((p1_22 & @as(Uint32, 65280)) +% (p2_23 & @as(Uint32, 65280))) +% (p3_24 & @as(Uint32, 65280))) +% (p4_25 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 10));
                b_28 = ((((p1_22 & @as(Uint32, 255)) +% (p2_23 & @as(Uint32, 255))) +% (p3_24 & @as(Uint32, 255))) +% (p4_25 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 2));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_26))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_27)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_28)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                i += 1;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                if (width_remainder != 0) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                p1_29 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_30 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_31 = ((p1_29 & @as(Uint32, 16711680)) +% (p2_30 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_32 = ((p1_29 & @as(Uint32, 65280)) +% (p2_30 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_33 = ((p1_29 & @as(Uint32, 255)) +% (p2_30 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_31))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_32)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_33)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                plane_interleaved_uv += uv_skip;
                curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            67 => {
                i = 0;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            70 => {
                if (i < width_half) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                p1_34 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_35 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_36 = ((p1_34 & @as(Uint32, 16711680)) +% (p2_35 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_37 = ((p1_34 & @as(Uint32, 65280)) +% (p2_35 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_38 = ((p1_34 & @as(Uint32, 255)) +% (p2_35 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_36))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_37)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_38)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                i += 1;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            73 => {
                if (width_remainder != 0) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                p_39 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_40 = (p_39 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_41 = (p_39 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_42 = p_39 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_40))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_41)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_42)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            77 => {
                if (j < height_half) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                i = 0;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            79 => {
                j += 1;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            80 => {
                if (height_remainder != 0) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            81 => {
                if (i < width_half) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                p1_43 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_44 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                p3_45 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p4_46 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_47 = ((((p1_43 & @as(Uint32, 16711680)) +% (p2_44 & @as(Uint32, 16711680))) +% (p3_45 & @as(Uint32, 16711680))) +% (p4_46 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 18));
                g_48 = ((((p1_43 & @as(Uint32, 65280)) +% (p2_44 & @as(Uint32, 65280))) +% (p3_45 & @as(Uint32, 65280))) +% (p4_46 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 10));
                b_49 = ((((p1_43 & @as(Uint32, 255)) +% (p2_44 & @as(Uint32, 255))) +% (p3_45 & @as(Uint32, 255))) +% (p4_46 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 2));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_47))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_48)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_49)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                i += 1;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            84 => {
                if (width_remainder != 0) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                p1_50 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_51 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_52 = ((p1_50 & @as(Uint32, 16711680)) +% (p2_51 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_53 = ((p1_50 & @as(Uint32, 65280)) +% (p2_51 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_54 = ((p1_50 & @as(Uint32, 255)) +% (p2_51 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_52))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_53)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_54)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                plane_interleaved_uv += uv_skip;
                curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            88 => {
                i = 0;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            91 => {
                if (i < width_half) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                p1_55 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                p2_56 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r_57 = ((p1_55 & @as(Uint32, 16711680)) +% (p2_56 & @as(Uint32, 16711680))) >> @intCast(@as(Uint32, 17));
                g_58 = ((p1_55 & @as(Uint32, 65280)) +% (p2_56 & @as(Uint32, 65280))) >> @intCast(@as(Uint32, 9));
                b_59 = ((p1_55 & @as(Uint32, 255)) +% (p2_56 & @as(Uint32, 255))) >> @intCast(@as(Uint32, 1));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_57))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_58)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_59)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                i += 1;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            94 => {
                if (width_remainder != 0) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                p_60 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_61 = (p_60 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_62 = (p_60 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_63 = p_60 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_61))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_62)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_63)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                curr_row_64 = @ptrCast(@alignCast(src));
                plane = @ptrCast(@alignCast(dst));
                row_size = @as(c_int, 4) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
                if (dst_pitch < row_size) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                return SDL_SetError_REAL("Destination pitch is too small, expected at least %d", row_size);
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                plane_skip = dst_pitch - row_size;
                if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                j = 0;
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            105 => {
                if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            107 => {
                if (j < height) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                i = 0;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            109 => {
                j += 1;
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            111 => {
                if (i < width_half) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                p_65 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_66 = (p_65 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_67 = (p_65 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_68 = p_65 & @as(Uint32, 255);
                p1_69 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r1 = (p1_69 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g1 = (p1_69 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b1 = p1_69 & @as(Uint32, 255);
                R = (r_66 +% r1) / @as(Uint32, 2);
                G = (g_67 +% g1) / @as(Uint32, 2);
                B = (b_68 +% b1) / @as(Uint32, 2);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_66))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_67)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_68)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_66))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_67)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_68)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_66))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_67)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_68)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                i += 1;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            114 => {
                if (width_remainder != 0) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                p_70 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_71 = (p_70 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_72 = (p_70 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_73 = p_70 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_71))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_72)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_73)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            117 => {
                plane += @as(usize, @bitCast(@as(isize, @intCast(plane_skip))));
                curr_row_64 += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            118 => {
                j = 0;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            119 => {
                if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU)) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            121 => {
                if (j < height) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            122 => {
                i = 0;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            123 => {
                j += 1;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            125 => {
                if (i < width_half) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            126 => {
                p_74 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_75 = (p_74 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_76 = (p_74 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_77 = p_74 & @as(Uint32, 255);
                p1_78 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r1_79 = (p1_78 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g1_80 = (p1_78 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b1_81 = p1_78 & @as(Uint32, 255);
                R_82 = (r_75 +% r1_79) / @as(Uint32, 2);
                G_83 = (g_76 +% g1_80) / @as(Uint32, 2);
                B_84 = (b_77 +% b1_81) / @as(Uint32, 2);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_75))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_76)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_77)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_75))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_76)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_77)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_75))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_76)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_77)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_82))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_83)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_84)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_79))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_80)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_81)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_79))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_80)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_81)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_79))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_80)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_81)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                i += 1;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            128 => {
                if (width_remainder != 0) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                p_85 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_86 = (p_85 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_87 = (p_85 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_88 = p_85 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_86))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_87)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_88)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                plane += @as(usize, @bitCast(@as(isize, @intCast(plane_skip))));
                curr_row_64 += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            132 => {
                j = 0;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            135 => {
                if (j < height) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            136 => {
                i = 0;
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                j += 1;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            139 => {
                if (i < width_half) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            140 => {
                p_89 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_90 = (p_89 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_91 = (p_89 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_92 = p_89 & @as(Uint32, 255);
                p1_93 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                r1_94 = (p1_93 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g1_95 = (p1_93 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b1_96 = p1_93 & @as(Uint32, 255);
                R_97 = (r_90 +% r1_94) / @as(Uint32, 2);
                G_98 = (g_91 +% g1_95) / @as(Uint32, 2);
                B_99 = (b_92 +% b1_96) / @as(Uint32, 2);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_90))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_91)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_92)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_90))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_91)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_92)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_90))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_91)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_92)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_94))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_95)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_96)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_94))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_95)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_96)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r1_94))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g1_95)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b1_96)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(R_97))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(G_98)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(B_99)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            141 => {
                i += 1;
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            142 => {
                if (width_remainder != 0) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            143 => {
                p_100 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row_64)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                r_101 = (p_100 & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                g_102 = (p_100 & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                b_103 = p_100 & @as(Uint32, 255);
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + cvt.*.y_offset)));
                (blk: {
                    const ref = &plane;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128)) < @as(c_int, 0)) @as(c_int, 0) else if ((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128)) > @as(c_int, 255)) @as(c_int, 255) else @as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r_101))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g_102)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b_103)))) + @as(f32, 0.5))) + @as(c_int, 128))));
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                plane += @as(usize, @bitCast(@as(isize, @intCast(plane_skip))));
                curr_row_64 += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            146 => {
                return SDL_SetError_REAL("Unsupported YUV destination format: %s", SDL_GetPixelFormatName_REAL(dst_format));
            },
            else => unreachable,
        }
    }
}
pub fn SDL_ConvertPixels_XBGR2101010_to_P010(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, yuv_type: YCbCrType) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const src_pitch_x_2: c_int = src_pitch * @as(c_int, 2);
    _ = &src_pitch_x_2;
    const height_half: c_int = @divTrunc(height, @as(c_int, 2));
    _ = &height_half;
    const height_remainder: c_int = height & @as(c_int, 1);
    _ = &height_remainder;
    const width_half: c_int = @divTrunc(width, @as(c_int, 2));
    _ = &width_half;
    const width_remainder: c_int = width & @as(c_int, 1);
    _ = &width_remainder;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var cvt: [*c]const struct_RGB2YUVFactors = &RGB2YUVFactorTables[yuv_type];
    _ = &cvt;
    var curr_row: [*c]const Uint8 = undefined;
    _ = &curr_row;
    var next_row: [*c]const Uint8 = undefined;
    _ = &next_row;
    var plane_y: [*c]Uint16 = undefined;
    _ = &plane_y;
    var plane_u: [*c]Uint16 = undefined;
    _ = &plane_u;
    var plane_v: [*c]Uint16 = undefined;
    _ = &plane_v;
    var plane_interleaved_uv: [*c]Uint16 = undefined;
    _ = &plane_interleaved_uv;
    var y_stride: Uint32 = undefined;
    _ = &y_stride;
    var uv_stride: Uint32 = undefined;
    _ = &uv_stride;
    var y_skip: Uint32 = undefined;
    _ = &y_skip;
    var uv_skip: Uint32 = undefined;
    _ = &uv_skip;
    if (!GetYUVPlanes(width, height, dst_format, dst, dst_pitch, @ptrCast(@alignCast(&plane_y)), @ptrCast(@alignCast(&plane_u)), @ptrCast(@alignCast(&plane_v)), &y_stride, &uv_stride)) {
        return @"false" != 0;
    }
    {
        const ref = &y_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(Uint16));
    }
    {
        const ref = &uv_stride;
        ref.* = @truncate(@as(c_ulong, ref.*) / @sizeOf(Uint16));
    }
    plane_interleaved_uv = plane_y + (@as(Uint32, @bitCast(@as(c_int, height))) *% y_stride);
    y_skip = y_stride -% @as(Uint32, @bitCast(@as(c_int, width)));
    curr_row = @ptrCast(@alignCast(src));
    {
        j = 0;
        while (j < height) : (j += 1) {
            {
                i = 0;
                while (i < width) : (i += 1) {
                    const p1: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(i)))];
                    _ = &p1;
                    const r: Uint32 = (p1 >> @intCast(@as(Uint32, 0))) & @as(Uint32, 1023);
                    _ = &r;
                    const g: Uint32 = (p1 >> @intCast(@as(Uint32, 10))) & @as(Uint32, 1023);
                    _ = &g;
                    const b: Uint32 = (p1 >> @intCast(@as(Uint32, 20))) & @as(Uint32, 1023);
                    _ = &b;
                    (blk: {
                        const ref = &plane_y;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.y[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.y[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.y[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + cvt.*.y_offset) << @intCast(@as(c_int, 6)))));
                }
            }
            plane_y += y_skip;
            curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
        }
    }
    curr_row = @ptrCast(@alignCast(src));
    next_row = @ptrCast(@alignCast(src));
    next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
    uv_skip = uv_stride -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2))));
    {
        j = 0;
        while (j < height_half) : (j += 1) {
            {
                i = 0;
                while (i < width_half) : (i += 1) {
                    const p1: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                    _ = &p1;
                    const p2: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                    _ = &p2;
                    const p3: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                    _ = &p3;
                    const p4: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                    _ = &p4;
                    const r: Uint32 = ((((p1 & @as(Uint32, 1023)) +% (p2 & @as(Uint32, 1023))) +% (p3 & @as(Uint32, 1023))) +% (p4 & @as(Uint32, 1023))) >> @intCast(@as(Uint32, 2));
                    _ = &r;
                    const g: Uint32 = ((((p1 & @as(Uint32, 1047552)) +% (p2 & @as(Uint32, 1047552))) +% (p3 & @as(Uint32, 1047552))) +% (p4 & @as(Uint32, 1047552))) >> @intCast(@as(Uint32, 12));
                    _ = &g;
                    const b: Uint32 = ((((p1 & @as(Uint32, 1072693248)) +% (p2 & @as(Uint32, 1072693248))) +% (p3 & @as(Uint32, 1072693248))) +% (p4 & @as(Uint32, 1072693248))) >> @intCast(@as(Uint32, 22));
                    _ = &b;
                    (blk: {
                        const ref = &plane_interleaved_uv;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
                    (blk: {
                        const ref = &plane_interleaved_uv;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
                }
            }
            if (width_remainder != 0) {
                const p1: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                _ = &p1;
                const p2: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(next_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                _ = &p2;
                const r: Uint32 = ((p1 & @as(Uint32, 1023)) +% (p2 & @as(Uint32, 1023))) >> @intCast(@as(Uint32, 1));
                _ = &r;
                const g: Uint32 = ((p1 & @as(Uint32, 1047552)) +% (p2 & @as(Uint32, 1047552))) >> @intCast(@as(Uint32, 11));
                _ = &g;
                const b: Uint32 = ((p1 & @as(Uint32, 1072693248)) +% (p2 & @as(Uint32, 1072693248))) >> @intCast(@as(Uint32, 21));
                _ = &b;
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
            }
            plane_interleaved_uv += uv_skip;
            curr_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
            next_row += @as(usize, @bitCast(@as(isize, @intCast(src_pitch_x_2))));
        }
    }
    if (height_remainder != 0) {
        {
            i = 0;
            while (i < width_half) : (i += 1) {
                const p1: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
                _ = &p1;
                const p2: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast((@as(c_int, 2) * i) + @as(c_int, 1))))];
                _ = &p2;
                const r: Uint32 = ((p1 & @as(Uint32, 1023)) +% (p2 & @as(Uint32, 1023))) >> @intCast(@as(Uint32, 1));
                _ = &r;
                const g: Uint32 = ((p1 & @as(Uint32, 1047552)) +% (p2 & @as(Uint32, 1047552))) >> @intCast(@as(Uint32, 11));
                _ = &g;
                const b: Uint32 = ((p1 & @as(Uint32, 1072693248)) +% (p2 & @as(Uint32, 1072693248))) >> @intCast(@as(Uint32, 21));
                _ = &b;
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
                (blk: {
                    const ref = &plane_interleaved_uv;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
            }
        }
        if (width_remainder != 0) {
            const p: Uint32 = @as([*c]const Uint32, @ptrCast(@alignCast(curr_row)))[@bitCast(@as(isize, @intCast(@as(c_int, 2) * i)))];
            _ = &p;
            const r: Uint32 = p & @as(Uint32, 1023);
            _ = &r;
            const g: Uint32 = (p & @as(Uint32, 1047552)) >> @intCast(@as(Uint32, 10));
            _ = &g;
            const b: Uint32 = (p & @as(Uint32, 1072693248)) >> @intCast(@as(Uint32, 20));
            _ = &b;
            (blk: {
                const ref = &plane_interleaved_uv;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.u[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.u[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.u[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
            (blk: {
                const ref = &plane_interleaved_uv;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = @bitCast(@as(c_short, @truncate((@as(c_int, @intFromFloat((((cvt.*.v[@as(c_int, 0)] * @as(f32, @floatFromInt(r))) + (cvt.*.v[@as(c_int, 1)] * @as(f32, @floatFromInt(g)))) + (cvt.*.v[@as(c_int, 2)] * @as(f32, @floatFromInt(b)))) + @as(f32, 0.5))) + @as(c_int, 512)) << @intCast(@as(c_int, 6)))));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_ConvertPixels_RGB_to_YUV(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var yuv_type: YCbCrType = YCBCR_601_LIMITED;
    _ = &yuv_type;
    if (!GetYUVConversionType(dst_colorspace, width, height, 8, &yuv_type)) {
        return @"false" != 0;
    }
    if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888))) {
        return SDL_ConvertPixels_XRGB8888_to_YUV(width, height, src, src_pitch, dst_format, dst, dst_pitch, yuv_type);
    }
    if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010)) {
        if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010)) {
            return SDL_ConvertPixels_XBGR2101010_to_P010(width, height, src, src_pitch, dst_format, dst, dst_pitch, yuv_type);
        }
        var result: bool = undefined;
        _ = &result;
        var tmp: ?*anyopaque = undefined;
        _ = &tmp;
        var tmp_pitch: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, width))) *% @sizeOf(Uint32))));
        _ = &tmp_pitch;
        tmp = SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, tmp_pitch))) *% @as(usize, @bitCast(@as(c_long, height))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        result = SDL_ConvertPixelsAndColorspace_REAL(width, height, src_format, src_colorspace, src_properties, src, src_pitch, SDL_PIXELFORMAT_XBGR2101010, dst_colorspace, dst_properties, tmp, tmp_pitch);
        if (!result) {
            SDL_free_REAL(tmp);
            return @"false" != 0;
        }
        result = SDL_ConvertPixels_XBGR2101010_to_P010(width, height, tmp, tmp_pitch, dst_format, dst, dst_pitch, yuv_type);
        SDL_free_REAL(tmp);
        return result;
    }
    {
        var result: bool = undefined;
        _ = &result;
        var tmp: ?*anyopaque = undefined;
        _ = &tmp;
        var tmp_pitch: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, width))) *% @sizeOf(Uint32))));
        _ = &tmp_pitch;
        tmp = SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, tmp_pitch))) *% @as(usize, @bitCast(@as(c_long, height))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        result = SDL_ConvertPixelsAndColorspace_REAL(width, height, src_format, src_colorspace, src_properties, src, src_pitch, SDL_PIXELFORMAT_XRGB8888, SDL_COLORSPACE_SRGB, 0, tmp, tmp_pitch);
        if (!result) {
            SDL_free_REAL(tmp);
            return @"false" != 0;
        }
        result = SDL_ConvertPixels_XRGB8888_to_YUV(width, height, tmp, tmp_pitch, dst_format, dst, dst_pitch, yuv_type);
        SDL_free_REAL(tmp);
        return result;
    }
}
pub fn SDL_ConvertPixels_YUV_to_YUV_Copy(arg_width: c_int, arg_height: c_int, format: SDL_PixelFormat, arg_src: ?*const anyopaque, arg_src_pitch: c_int, arg_dst: ?*anyopaque, arg_dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    var height = arg_height;
    _ = &height;
    var src = arg_src;
    _ = &src;
    var src_pitch = arg_src_pitch;
    _ = &src_pitch;
    var dst = arg_dst;
    _ = &dst;
    var dst_pitch = arg_dst_pitch;
    _ = &dst_pitch;
    var i: c_int = undefined;
    _ = &i;
    if (IsPlanar1x1Format(format)) {
        const length: usize = @bitCast(@as(c_long, width * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))));
        _ = &length;
        {
            i = height * @as(c_int, 3);
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                _ = memcpy(dst, src, length);
                src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
            }
        }
        return @"true" != 0;
    }
    if (IsPlanar2x2Format(format)) {
        const bpp: c_int = if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
        _ = &bpp;
        const length: usize = @bitCast(@as(c_long, width * bpp));
        _ = &length;
        {
            i = height;
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                _ = memcpy(dst, src, length);
                src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
            }
        }
        if (((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) {
            width = @divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * bpp;
            height = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
            src_pitch = @divTrunc(@divTrunc(src_pitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * bpp;
            dst_pitch = @divTrunc(@divTrunc(dst_pitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * bpp;
            {
                i = height * @as(c_int, 2);
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _ = memcpy(dst, src, @bitCast(@as(c_long, width)));
                    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
                }
            }
        } else if (((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) {
            width = (@divTrunc(width + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2)) * bpp;
            height = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
            src_pitch = (@divTrunc(@divTrunc(src_pitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2)) * bpp;
            dst_pitch = (@divTrunc(@divTrunc(dst_pitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2)) * bpp;
            {
                i = height;
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _ = memcpy(dst, src, @bitCast(@as(c_long, width)));
                    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
                }
            }
        }
        return @"true" != 0;
    }
    if (IsPacked4Format(format)) {
        width = @as(c_int, 4) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
        {
            i = height;
            while ((blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                _ = memcpy(dst, src, @bitCast(@as(c_long, width)));
                src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
            }
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("SDL_ConvertPixels_YUV_to_YUV_Copy: Unsupported YUV format: %s", SDL_GetPixelFormatName_REAL(format));
}
pub fn SDL_ConvertPixels_SwapUVPlanes(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    if (src == dst) {
        var UVpitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2));
        _ = &UVpitch;
        var tmp: [*c]Uint8 = undefined;
        _ = &tmp;
        var row1: [*c]Uint8 = @ptrCast(@alignCast(dst));
        _ = &row1;
        var row2: [*c]Uint8 = row1 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * UVpitch))));
        _ = &row2;
        tmp = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, UVwidth)))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        {
            y = 0;
            while (y < UVheight) : (y += 1) {
                _ = memcpy(@ptrCast(@alignCast(tmp)), @ptrCast(@alignCast(row1)), @bitCast(@as(c_long, UVwidth)));
                _ = memcpy(@ptrCast(@alignCast(row1)), @ptrCast(@alignCast(row2)), @bitCast(@as(c_long, UVwidth)));
                _ = memcpy(@ptrCast(@alignCast(row2)), @ptrCast(@alignCast(tmp)), @bitCast(@as(c_long, UVwidth)));
                row1 += @as(usize, @bitCast(@as(isize, @intCast(UVpitch))));
                row2 += @as(usize, @bitCast(@as(isize, @intCast(UVpitch))));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    } else {
        var srcUV: [*c]const Uint8 = undefined;
        _ = &srcUV;
        var dstUV: [*c]Uint8 = undefined;
        _ = &dstUV;
        var srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2));
        _ = &srcUVPitch;
        var dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2));
        _ = &dstUVPitch;
        srcUV = @ptrCast(@alignCast(src));
        dstUV = @as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(UVheight * dstUVPitch))));
        {
            y = 0;
            while (y < UVheight) : (y += 1) {
                _ = memcpy(@ptrCast(@alignCast(dstUV)), @ptrCast(@alignCast(srcUV)), @bitCast(@as(c_long, UVwidth)));
                srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitch))));
                dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitch))));
            }
        }
        dstUV = @ptrCast(@alignCast(dst));
        {
            y = 0;
            while (y < UVheight) : (y += 1) {
                _ = memcpy(@ptrCast(@alignCast(dstUV)), @ptrCast(@alignCast(srcUV)), @bitCast(@as(c_long, UVwidth)));
                srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitch))));
                dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitch))));
            }
        }
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_PackUVPlanes_to_NV_SSE2(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2));
    _ = &srcUVPitch;
    const srcUVPitchLeft: c_int = srcUVPitch - UVwidth;
    _ = &srcUVPitchLeft;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &dstUVPitch;
    const dstUVPitchLeft: c_int = dstUVPitch - (UVwidth * @as(c_int, 2));
    _ = &dstUVPitchLeft;
    var src1: [*c]const Uint8 = undefined;
    _ = &src1;
    var src2: [*c]const Uint8 = undefined;
    _ = &src2;
    var dstUV: [*c]Uint8 = undefined;
    _ = &dstUV;
    var tmp: [*c]Uint8 = null;
    _ = &tmp;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    if (src == dst) {
        tmp = @ptrCast(@alignCast(SDL_malloc_REAL((@as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) *% @as(usize, @bitCast(@as(c_long, UVheight)))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(tmp))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(tmp)), src, (@as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) *% @as(usize, @bitCast(@as(c_long, UVheight)))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))));
        src = @ptrCast(@alignCast(tmp));
    }
    if (reverseUV) {
        src2 = @ptrCast(@alignCast(src));
        src1 = src2 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * srcUVPitch))));
    } else {
        src1 = @ptrCast(@alignCast(src));
        src2 = src1 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * srcUVPitch))));
    }
    dstUV = @ptrCast(@alignCast(dst));
    y = UVheight;
    while ((blk: {
        const ref = &y;
        const tmp_1 = ref.*;
        ref.* -= 1;
        break :blk tmp_1;
    }) != 0) {
        x = UVwidth;
        while (x >= @as(c_int, 16)) {
            var u: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(src1)));
            _ = &u;
            var v: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(src2)));
            _ = &v;
            var uv1: __m128i = _mm_unpacklo_epi8(u, v);
            _ = &uv1;
            var uv2: __m128i = _mm_unpackhi_epi8(u, v);
            _ = &uv2;
            _mm_storeu_si128(@ptrCast(@alignCast(dstUV)), uv1);
            _mm_storeu_si128(@ptrCast(@alignCast(dstUV + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), uv2);
            src1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            src2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
            x -= 16;
        }
        while ((blk: {
            const ref = &x;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            (blk: {
                const ref = &dstUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &src1;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
            (blk: {
                const ref = &dstUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &src2;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
        }
        src1 += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        src2 += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
    }
    if (tmp != null) {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_SplitNV_to_UVPlanes_SSE2(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &srcUVPitch;
    const srcUVPitchLeft: c_int = srcUVPitch - (UVwidth * @as(c_int, 2));
    _ = &srcUVPitchLeft;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2));
    _ = &dstUVPitch;
    const dstUVPitchLeft: c_int = dstUVPitch - UVwidth;
    _ = &dstUVPitchLeft;
    var srcUV: [*c]const Uint8 = undefined;
    _ = &srcUV;
    var dst1: [*c]Uint8 = undefined;
    _ = &dst1;
    var dst2: [*c]Uint8 = undefined;
    _ = &dst2;
    var tmp: [*c]Uint8 = null;
    _ = &tmp;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    if (src == dst) {
        tmp = @ptrCast(@alignCast(SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, UVheight))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(tmp))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(tmp)), src, @as(usize, @bitCast(@as(c_long, UVheight))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))));
        src = @ptrCast(@alignCast(tmp));
    }
    if (reverseUV) {
        dst2 = @ptrCast(@alignCast(dst));
        dst1 = dst2 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * dstUVPitch))));
    } else {
        dst1 = @ptrCast(@alignCast(dst));
        dst2 = dst1 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * dstUVPitch))));
    }
    srcUV = @ptrCast(@alignCast(src));
    y = UVheight;
    while ((blk: {
        const ref = &y;
        const tmp_1 = ref.*;
        ref.* -= 1;
        break :blk tmp_1;
    }) != 0) {
        var mask: __m128i = _mm_set1_epi16(255);
        _ = &mask;
        x = UVwidth;
        while (x >= @as(c_int, 16)) {
            var uv1: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcUV)));
            _ = &uv1;
            var uv2: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcUV + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))));
            _ = &uv2;
            var @"u1": __m128i = _mm_and_si128(uv1, mask);
            _ = &@"u1";
            var @"u2": __m128i = _mm_and_si128(uv2, mask);
            _ = &@"u2";
            var u: __m128i = _mm_packus_epi16(@"u1", @"u2");
            _ = &u;
            var v1: __m128i = _mm_srli_epi16(uv1, 8);
            _ = &v1;
            var v2: __m128i = _mm_srli_epi16(uv2, 8);
            _ = &v2;
            var v: __m128i = _mm_packus_epi16(v1, v2);
            _ = &v;
            _mm_storeu_si128(@ptrCast(@alignCast(dst1)), u);
            _mm_storeu_si128(@ptrCast(@alignCast(dst2)), v);
            srcUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
            dst1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dst2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 16;
        }
        while ((blk: {
            const ref = &x;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            (blk: {
                const ref = &dst1;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &srcUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
            (blk: {
                const ref = &dst2;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &srcUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
        }
        srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        dst1 += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
        dst2 += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
    }
    if (tmp != null) {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_SwapNV_SSE2(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &srcUVPitch;
    const srcUVPitchLeft: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, srcUVPitch - (UVwidth * @as(c_int, 2))))) / @sizeOf(Uint16))));
    _ = &srcUVPitchLeft;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &dstUVPitch;
    const dstUVPitchLeft: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, dstUVPitch - (UVwidth * @as(c_int, 2))))) / @sizeOf(Uint16))));
    _ = &dstUVPitchLeft;
    var srcUV: [*c]const Uint16 = undefined;
    _ = &srcUV;
    var dstUV: [*c]Uint16 = undefined;
    _ = &dstUV;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    srcUV = @ptrCast(@alignCast(src));
    dstUV = @ptrCast(@alignCast(dst));
    y = UVheight;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = UVwidth;
        while (x >= @as(c_int, 8)) {
            var uv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcUV)));
            _ = &uv;
            var v: __m128i = _mm_slli_epi16(uv, 8);
            _ = &v;
            var u: __m128i = _mm_srli_epi16(uv, 8);
            _ = &u;
            var vu: __m128i = _mm_or_si128(v, u);
            _ = &vu;
            _mm_storeu_si128(@ptrCast(@alignCast(dstUV)), vu);
            srcUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            dstUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            x -= 8;
        }
        if (x > @as(c_int, 0)) {
            var srcUV8: [*c]const Uint8 = @ptrCast(@alignCast(srcUV));
            _ = &srcUV8;
            var dstUV8: [*c]Uint8 = @ptrCast(@alignCast(dstUV));
            _ = &dstUV8;
            srcUV += @as(usize, @bitCast(@as(isize, @intCast(x))));
            dstUV += @as(usize, @bitCast(@as(isize, @intCast(x))));
            while ((blk: {
                const ref = &x;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var u: Uint8 = (blk: {
                    const ref = &srcUV8;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &u;
                var v: Uint8 = (blk: {
                    const ref = &srcUV8;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &v;
                (blk: {
                    const ref = &dstUV8;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = v;
                (blk: {
                    const ref = &dstUV8;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = u;
            }
        }
        srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_PackUVPlanes_to_NV_std(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2));
    _ = &srcUVPitch;
    const srcUVPitchLeft: c_int = srcUVPitch - UVwidth;
    _ = &srcUVPitchLeft;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &dstUVPitch;
    const dstUVPitchLeft: c_int = dstUVPitch - (UVwidth * @as(c_int, 2));
    _ = &dstUVPitchLeft;
    var src1: [*c]const Uint8 = undefined;
    _ = &src1;
    var src2: [*c]const Uint8 = undefined;
    _ = &src2;
    var dstUV: [*c]Uint8 = undefined;
    _ = &dstUV;
    var tmp: [*c]Uint8 = null;
    _ = &tmp;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    if (src == dst) {
        tmp = @ptrCast(@alignCast(SDL_malloc_REAL((@as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) *% @as(usize, @bitCast(@as(c_long, UVheight)))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(tmp)), src, (@as(usize, @bitCast(@as(c_long, @as(c_int, 2)))) *% @as(usize, @bitCast(@as(c_long, UVheight)))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))));
        src = @ptrCast(@alignCast(tmp));
    }
    if (reverseUV) {
        src2 = @ptrCast(@alignCast(src));
        src1 = src2 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * srcUVPitch))));
    } else {
        src1 = @ptrCast(@alignCast(src));
        src2 = src1 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * srcUVPitch))));
    }
    dstUV = @ptrCast(@alignCast(dst));
    y = UVheight;
    while ((blk: {
        const ref = &y;
        const tmp_1 = ref.*;
        ref.* -= 1;
        break :blk tmp_1;
    }) != 0) {
        x = UVwidth;
        while ((blk: {
            const ref = &x;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            (blk: {
                const ref = &dstUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &src1;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
            (blk: {
                const ref = &dstUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &src2;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
        }
        src1 += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        src2 += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
    }
    SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_SplitNV_to_UVPlanes_std(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &srcUVPitch;
    const srcUVPitchLeft: c_int = srcUVPitch - (UVwidth * @as(c_int, 2));
    _ = &srcUVPitchLeft;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2));
    _ = &dstUVPitch;
    const dstUVPitchLeft: c_int = dstUVPitch - UVwidth;
    _ = &dstUVPitchLeft;
    var srcUV: [*c]const Uint8 = undefined;
    _ = &srcUV;
    var dst1: [*c]Uint8 = undefined;
    _ = &dst1;
    var dst2: [*c]Uint8 = undefined;
    _ = &dst2;
    var tmp: [*c]Uint8 = null;
    _ = &tmp;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    if (src == dst) {
        tmp = @ptrCast(@alignCast(SDL_malloc_REAL(@as(usize, @bitCast(@as(c_long, UVheight))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))))));
        if (!(tmp != null)) {
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(tmp)), src, @as(usize, @bitCast(@as(c_long, UVheight))) *% @as(usize, @bitCast(@as(c_long, srcUVPitch))));
        src = @ptrCast(@alignCast(tmp));
    }
    if (reverseUV) {
        dst2 = @ptrCast(@alignCast(dst));
        dst1 = dst2 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * dstUVPitch))));
    } else {
        dst1 = @ptrCast(@alignCast(dst));
        dst2 = dst1 + @as(usize, @bitCast(@as(isize, @intCast(UVheight * dstUVPitch))));
    }
    srcUV = @ptrCast(@alignCast(src));
    y = UVheight;
    while ((blk: {
        const ref = &y;
        const tmp_1 = ref.*;
        ref.* -= 1;
        break :blk tmp_1;
    }) != 0) {
        x = UVwidth;
        while ((blk: {
            const ref = &x;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            (blk: {
                const ref = &dst1;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &srcUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
            (blk: {
                const ref = &dst2;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).* = (blk: {
                const ref = &srcUV;
                const tmp_1 = ref.*;
                ref.* += 1;
                break :blk tmp_1;
            }).*;
        }
        srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
        dst1 += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
        dst2 += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
    }
    SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_SwapNV_std(width: c_int, height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const UVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &UVwidth;
    const UVheight: c_int = @divTrunc(height + @as(c_int, 1), @as(c_int, 2));
    _ = &UVheight;
    const srcUVPitch: c_int = @divTrunc(src_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &srcUVPitch;
    const dstUVPitch: c_int = @divTrunc(dst_pitch + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 2);
    _ = &dstUVPitch;
    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(height * src_pitch))))));
    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(height * dst_pitch))))));
    var aligned: bool = ((@as(usize, @intCast(@intFromPtr(src))) | @as(usize, @intCast(@intFromPtr(dst)))) & @as(usize, 1)) == @as(usize, 0);
    _ = &aligned;
    if (aligned) {
        const srcUVPitchLeft: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, srcUVPitch - (UVwidth * @as(c_int, 2))))) / @sizeOf(Uint16))));
        _ = &srcUVPitchLeft;
        const dstUVPitchLeft: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, dstUVPitch - (UVwidth * @as(c_int, 2))))) / @sizeOf(Uint16))));
        _ = &dstUVPitchLeft;
        var srcUV: [*c]const Uint16 = @ptrCast(@alignCast(src));
        _ = &srcUV;
        var dstUV: [*c]Uint16 = @ptrCast(@alignCast(dst));
        _ = &dstUV;
        y = UVheight;
        while ((blk: {
            const ref = &y;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            x = UVwidth;
            while ((blk: {
                const ref = &x;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                (blk: {
                    const ref = &dstUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @byteSwap(@as(Uint16, (blk: {
                    const ref = &srcUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*));
            }
            srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
            dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
        }
    } else {
        const srcUVPitchLeft: c_int = srcUVPitch - (UVwidth * @as(c_int, 2));
        _ = &srcUVPitchLeft;
        const dstUVPitchLeft: c_int = dstUVPitch - (UVwidth * @as(c_int, 2));
        _ = &dstUVPitchLeft;
        var srcUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
        _ = &srcUV;
        var dstUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
        _ = &dstUV;
        y = UVheight;
        while ((blk: {
            const ref = &y;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            x = UVwidth;
            while ((blk: {
                const ref = &x;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var u: Uint8 = (blk: {
                    const ref = &srcUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &u;
                var v: Uint8 = (blk: {
                    const ref = &srcUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &v;
                (blk: {
                    const ref = &dstUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = v;
                (blk: {
                    const ref = &dstUV;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = u;
            }
            srcUV += @as(usize, @bitCast(@as(isize, @intCast(srcUVPitchLeft))));
            dstUV += @as(usize, @bitCast(@as(isize, @intCast(dstUVPitchLeft))));
        }
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_PackUVPlanes_to_NV(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_PackUVPlanes_to_NV_SSE2(width, height, src, src_pitch, dst, dst_pitch, reverseUV);
    }
    return SDL_ConvertPixels_PackUVPlanes_to_NV_std(width, height, src, src_pitch, dst, dst_pitch, reverseUV);
}
pub fn SDL_ConvertPixels_SplitNV_to_UVPlanes(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int, reverseUV: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_SplitNV_to_UVPlanes_SSE2(width, height, src, src_pitch, dst, dst_pitch, reverseUV);
    }
    return SDL_ConvertPixels_SplitNV_to_UVPlanes_std(width, height, src, src_pitch, dst, dst_pitch, reverseUV);
}
pub fn SDL_ConvertPixels_SwapNV(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_SwapNV_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_SwapNV_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_Planar2x2_to_Planar2x2(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var srcY: [*c]const Uint8 = undefined;
    _ = &srcY;
    var dstY: [*c]Uint8 = undefined;
    _ = &dstY;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (src != dst) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                srcY = @ptrCast(@alignCast(src));
                dstY = @ptrCast(@alignCast(dst));
                i = height;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (src_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            4 => {
                if ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                _ = memcpy(@ptrCast(@alignCast(dstY)), @ptrCast(@alignCast(srcY)), @bitCast(@as(c_long, width)));
                srcY += @as(usize, @bitCast(@as(isize, @intCast(src_pitch))));
                dstY += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                return SDL_SetError_REAL("SDL_ConvertPixels_Planar2x2_to_Planar2x2: Unsupported YUV conversion: %s -> %s", SDL_GetPixelFormatName_REAL(src_format), SDL_GetPixelFormatName_REAL(dst_format));
            },
            9 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                return SDL_ConvertPixels_SwapUVPlanes(width, height, src, src_pitch, dst, dst_pitch);
            },
            12 => {
                return SDL_ConvertPixels_PackUVPlanes_to_NV(width, height, src, src_pitch, dst, dst_pitch, @"true" != 0);
            },
            13 => {
                return SDL_ConvertPixels_PackUVPlanes_to_NV(width, height, src, src_pitch, dst, dst_pitch, @"false" != 0);
            },
            14 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            16 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            17 => {
                return SDL_ConvertPixels_SwapUVPlanes(width, height, src, src_pitch, dst, dst_pitch);
            },
            18 => {
                return SDL_ConvertPixels_PackUVPlanes_to_NV(width, height, src, src_pitch, dst, dst_pitch, @"false" != 0);
            },
            19 => {
                return SDL_ConvertPixels_PackUVPlanes_to_NV(width, height, src, src_pitch, dst, dst_pitch, @"true" != 0);
            },
            20 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            22 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            23 => {
                return SDL_ConvertPixels_SplitNV_to_UVPlanes(width, height, src, src_pitch, dst, dst_pitch, @"true" != 0);
            },
            24 => {
                return SDL_ConvertPixels_SplitNV_to_UVPlanes(width, height, src, src_pitch, dst, dst_pitch, @"false" != 0);
            },
            25 => {
                return SDL_ConvertPixels_SwapNV(width, height, src, src_pitch, dst, dst_pitch);
            },
            26 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            28 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            29 => {
                return SDL_ConvertPixels_SplitNV_to_UVPlanes(width, height, src, src_pitch, dst, dst_pitch, @"false" != 0);
            },
            30 => {
                return SDL_ConvertPixels_SplitNV_to_UVPlanes(width, height, src, src_pitch, dst, dst_pitch, @"true" != 0);
            },
            31 => {
                return SDL_ConvertPixels_SwapNV(width, height, src, src_pitch, dst, dst_pitch);
            },
            32 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_ConvertPixels_YUY2_to_UYVY_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            U = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            V = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = U;
            dstYUV[@as(c_int, 1)] = Y1;
            dstYUV[@as(c_int, 2)] = V;
            dstYUV[@as(c_int, 3)] = Y2;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YUY2_to_YVYU_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            U = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            V = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = V;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = U;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_UYVY_to_YUY2_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            U = srcYUV[@as(c_int, 0)];
            Y1 = srcYUV[@as(c_int, 1)];
            V = srcYUV[@as(c_int, 2)];
            Y2 = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = U;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = V;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_UYVY_to_YVYU_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 0) << @intCast(@as(c_int, 6))) | (@as(c_int, 3) << @intCast(@as(c_int, 4)))) | (@as(c_int, 2) << @intCast(@as(c_int, 2)))) | @as(c_int, 1))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            U = srcYUV[@as(c_int, 0)];
            Y1 = srcYUV[@as(c_int, 1)];
            V = srcYUV[@as(c_int, 2)];
            Y2 = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = V;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = U;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YVYU_to_YUY2_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 1) << @intCast(@as(c_int, 6))) | (@as(c_int, 2) << @intCast(@as(c_int, 4)))) | (@as(c_int, 3) << @intCast(@as(c_int, 2)))) | @as(c_int, 0))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            V = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            U = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = U;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = V;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YVYU_to_UYVY_SSE2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    x = YUVwidth;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        while (x >= @as(c_int, 4)) {
            var yuv: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(srcYUV)));
            _ = &yuv;
            var lo: __m128i = _mm_unpacklo_epi8(yuv, _mm_setzero_si128());
            _ = &lo;
            var hi: __m128i = _mm_unpackhi_epi8(yuv, _mm_setzero_si128());
            _ = &hi;
            lo = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
            lo = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(lo)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
            hi = @as(__m128i, @bitCast(__builtin.pshuflw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
            hi = @as(__m128i, @bitCast(__builtin.pshufhw(@as(__v8hi, @bitCast(hi)), (((@as(c_int, 2) << @intCast(@as(c_int, 6))) | (@as(c_int, 1) << @intCast(@as(c_int, 4)))) | (@as(c_int, 0) << @intCast(@as(c_int, 2)))) | @as(c_int, 3))));
            yuv = _mm_packus_epi16(lo, hi);
            _mm_storeu_si128(@ptrCast(@alignCast(dstYUV)), yuv);
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            x -= 4;
        }
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            V = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            U = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = U;
            dstYUV[@as(c_int, 1)] = Y1;
            dstYUV[@as(c_int, 2)] = V;
            dstYUV[@as(c_int, 3)] = Y2;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
        x = YUVwidth;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YUY2_to_UYVY_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            U = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            V = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = U;
            dstYUV[@as(c_int, 1)] = Y1;
            dstYUV[@as(c_int, 2)] = V;
            dstYUV[@as(c_int, 3)] = Y2;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YUY2_to_YVYU_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            U = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            V = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = V;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = U;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_UYVY_to_YUY2_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            U = srcYUV[@as(c_int, 0)];
            Y1 = srcYUV[@as(c_int, 1)];
            V = srcYUV[@as(c_int, 2)];
            Y2 = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = U;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = V;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_UYVY_to_YVYU_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            U = srcYUV[@as(c_int, 0)];
            Y1 = srcYUV[@as(c_int, 1)];
            V = srcYUV[@as(c_int, 2)];
            Y2 = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = V;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = U;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YVYU_to_YUY2_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            V = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            U = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = Y1;
            dstYUV[@as(c_int, 1)] = U;
            dstYUV[@as(c_int, 2)] = Y2;
            dstYUV[@as(c_int, 3)] = V;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YVYU_to_UYVY_std(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    const YUVwidth: c_int = @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    _ = &YUVwidth;
    const srcYUVPitchLeft: c_int = src_pitch - (YUVwidth * @as(c_int, 4));
    _ = &srcYUVPitchLeft;
    const dstYUVPitchLeft: c_int = dst_pitch - (YUVwidth * @as(c_int, 4));
    _ = &dstYUVPitchLeft;
    var srcYUV: [*c]const Uint8 = @ptrCast(@alignCast(src));
    _ = &srcYUV;
    var dstYUV: [*c]Uint8 = @ptrCast(@alignCast(dst));
    _ = &dstYUV;
    y = height;
    while ((blk: {
        const ref = &y;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        x = YUVwidth;
        while ((blk: {
            const ref = &x;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var Y1: Uint8 = undefined;
            _ = &Y1;
            var U: Uint8 = undefined;
            _ = &U;
            var Y2: Uint8 = undefined;
            _ = &Y2;
            var V: Uint8 = undefined;
            _ = &V;
            Y1 = srcYUV[@as(c_int, 0)];
            V = srcYUV[@as(c_int, 1)];
            Y2 = srcYUV[@as(c_int, 2)];
            U = srcYUV[@as(c_int, 3)];
            srcYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstYUV[@as(c_int, 0)] = U;
            dstYUV[@as(c_int, 1)] = Y1;
            dstYUV[@as(c_int, 2)] = V;
            dstYUV[@as(c_int, 3)] = Y2;
            dstYUV += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        srcYUV += @as(usize, @bitCast(@as(isize, @intCast(srcYUVPitchLeft))));
        dstYUV += @as(usize, @bitCast(@as(isize, @intCast(dstYUVPitchLeft))));
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_YUY2_to_UYVY(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_YUY2_to_UYVY_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_YUY2_to_UYVY_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_YUY2_to_YVYU(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_YUY2_to_YVYU_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_YUY2_to_YVYU_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_UYVY_to_YUY2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_UYVY_to_YUY2_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_UYVY_to_YUY2_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_UYVY_to_YVYU(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_UYVY_to_YVYU_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_UYVY_to_YVYU_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_YVYU_to_YUY2(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_YVYU_to_YUY2_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_YVYU_to_YUY2_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_YVYU_to_UYVY(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasSSE2_REAL()) {
        return SDL_ConvertPixels_YVYU_to_UYVY_SSE2(width, height, src, src_pitch, dst, dst_pitch);
    }
    return SDL_ConvertPixels_YVYU_to_UYVY_std(width, height, src, src_pitch, dst, dst_pitch);
}
pub fn SDL_ConvertPixels_Packed4_to_Packed4(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (src_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 12;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            1 => {
                return SDL_SetError_REAL("SDL_ConvertPixels_Packed4_to_Packed4: Unsupported YUV conversion: %s -> %s", SDL_GetPixelFormatName_REAL(src_format), SDL_GetPixelFormatName_REAL(dst_format));
            },
            2 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            3 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                return SDL_ConvertPixels_YUY2_to_UYVY(width, height, src, src_pitch, dst, dst_pitch);
            },
            5 => {
                return SDL_ConvertPixels_YUY2_to_YVYU(width, height, src, src_pitch, dst, dst_pitch);
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                return SDL_ConvertPixels_UYVY_to_YUY2(width, height, src, src_pitch, dst, dst_pitch);
            },
            10 => {
                return SDL_ConvertPixels_UYVY_to_YVYU(width, height, src, src_pitch, dst, dst_pitch);
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                switch (dst_format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            13 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                return SDL_ConvertPixels_YVYU_to_YUY2(width, height, src, src_pitch, dst, dst_pitch);
            },
            15 => {
                return SDL_ConvertPixels_YVYU_to_UYVY(width, height, src, src_pitch, dst, dst_pitch);
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_ConvertPixels_Planar2x2_to_Packed4(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var srcY1: [*c]const Uint8 = undefined;
    _ = &srcY1;
    var srcY2: [*c]const Uint8 = undefined;
    _ = &srcY2;
    var srcU: [*c]const Uint8 = undefined;
    _ = &srcU;
    var srcV: [*c]const Uint8 = undefined;
    _ = &srcV;
    var srcY_pitch: Uint32 = undefined;
    _ = &srcY_pitch;
    var srcUV_pitch: Uint32 = undefined;
    _ = &srcUV_pitch;
    var srcY_pitch_left: Uint32 = undefined;
    _ = &srcY_pitch_left;
    var srcUV_pitch_left: Uint32 = undefined;
    _ = &srcUV_pitch_left;
    var srcUV_pixel_stride: Uint32 = undefined;
    _ = &srcUV_pixel_stride;
    var dstY1: [*c]Uint8 = undefined;
    _ = &dstY1;
    var dstY2: [*c]Uint8 = undefined;
    _ = &dstY2;
    var dstU1: [*c]Uint8 = undefined;
    _ = &dstU1;
    var dstU2: [*c]Uint8 = undefined;
    _ = &dstU2;
    var dstV1: [*c]Uint8 = undefined;
    _ = &dstV1;
    var dstV2: [*c]Uint8 = undefined;
    _ = &dstV2;
    var dstY_pitch: Uint32 = undefined;
    _ = &dstY_pitch;
    var dstUV_pitch: Uint32 = undefined;
    _ = &dstUV_pitch;
    var dst_pitch_left: Uint32 = undefined;
    _ = &dst_pitch_left;
    if (src == dst) {
        return SDL_SetError_REAL("Can't change YUV plane types in-place");
    }
    if (!GetYUVPlanes(width, height, src_format, src, src_pitch, &srcY1, &srcU, &srcV, &srcY_pitch, &srcUV_pitch)) {
        return @"false" != 0;
    }
    srcY2 = srcY1 + srcY_pitch;
    srcY_pitch_left = srcY_pitch -% @as(Uint32, @bitCast(@as(c_int, width)));
    if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
        srcUV_pixel_stride = 2;
        srcUV_pitch_left = srcUV_pitch -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    } else {
        srcUV_pixel_stride = 1;
        srcUV_pitch_left = srcUV_pitch -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    }
    if (!GetYUVPlanes(width, height, dst_format, dst, dst_pitch, @ptrCast(@alignCast(&dstY1)), @ptrCast(@alignCast(&dstU1)), @ptrCast(@alignCast(&dstV1)), &dstY_pitch, &dstUV_pitch)) {
        return @"false" != 0;
    }
    dstY2 = dstY1 + dstY_pitch;
    dstU2 = dstU1 + dstUV_pitch;
    dstV2 = dstV1 + dstUV_pitch;
    dst_pitch_left = dstY_pitch -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    {
        y = 0;
        while (y < (height - @as(c_int, 1))) : (y += 2) {
            {
                x = 0;
                while (x < (width - @as(c_int, 1))) : (x += 2) {
                    dstY1.* = (blk: {
                        const ref = &srcY1;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                    dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    dstY1.* = (blk: {
                        const ref = &srcY1;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                    dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    dstU1.* = srcU.*;
                    dstV1.* = srcV.*;
                    dstY2.* = (blk: {
                        const ref = &srcY2;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                    dstY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    dstY2.* = (blk: {
                        const ref = &srcY2;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                    dstY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    dstU2.* = srcU.*;
                    dstV2.* = srcV.*;
                    srcU += srcUV_pixel_stride;
                    srcV += srcUV_pixel_stride;
                    dstU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    dstU2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    dstV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    dstV2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                }
            }
            if (x == (width - @as(c_int, 1))) {
                dstY1.* = srcY1.*;
                dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstY1.* = (blk: {
                    const ref = &srcY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstU1.* = srcU.*;
                dstV1.* = srcV.*;
                dstY2.* = srcY2.*;
                dstY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstY2.* = (blk: {
                    const ref = &srcY2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                dstY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstU2.* = srcU.*;
                dstV2.* = srcV.*;
                srcU += srcUV_pixel_stride;
                srcV += srcUV_pixel_stride;
                dstU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstU2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstV2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
            srcY1 += srcY_pitch_left +% srcY_pitch;
            srcY2 += srcY_pitch_left +% srcY_pitch;
            srcU += srcUV_pitch_left;
            srcV += srcUV_pitch_left;
            dstY1 += dst_pitch_left +% dstY_pitch;
            dstY2 += dst_pitch_left +% dstY_pitch;
            dstU1 += dst_pitch_left +% dstUV_pitch;
            dstU2 += dst_pitch_left +% dstUV_pitch;
            dstV1 += dst_pitch_left +% dstUV_pitch;
            dstV2 += dst_pitch_left +% dstUV_pitch;
        }
    }
    if (y == (height - @as(c_int, 1))) {
        {
            x = 0;
            while (x < (width - @as(c_int, 1))) : (x += 2) {
                dstY1.* = (blk: {
                    const ref = &srcY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstY1.* = (blk: {
                    const ref = &srcY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstU1.* = srcU.*;
                dstV1.* = srcV.*;
                srcU += srcUV_pixel_stride;
                srcV += srcUV_pixel_stride;
                dstU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
        if (x == (width - @as(c_int, 1))) {
            dstY1.* = srcY1.*;
            dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dstY1.* = (blk: {
                const ref = &srcY1;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).*;
            dstY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            dstU1.* = srcU.*;
            dstV1.* = srcV.*;
            srcU += srcUV_pixel_stride;
            srcV += srcUV_pixel_stride;
            dstU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dstV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
    return @"true" != 0;
}
pub fn SDL_ConvertPixels_Packed4_to_Planar2x2(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var srcY1: [*c]const Uint8 = undefined;
    _ = &srcY1;
    var srcY2: [*c]const Uint8 = undefined;
    _ = &srcY2;
    var srcU1: [*c]const Uint8 = undefined;
    _ = &srcU1;
    var srcU2: [*c]const Uint8 = undefined;
    _ = &srcU2;
    var srcV1: [*c]const Uint8 = undefined;
    _ = &srcV1;
    var srcV2: [*c]const Uint8 = undefined;
    _ = &srcV2;
    var srcY_pitch: Uint32 = undefined;
    _ = &srcY_pitch;
    var srcUV_pitch: Uint32 = undefined;
    _ = &srcUV_pitch;
    var src_pitch_left: Uint32 = undefined;
    _ = &src_pitch_left;
    var dstY1: [*c]Uint8 = undefined;
    _ = &dstY1;
    var dstY2: [*c]Uint8 = undefined;
    _ = &dstY2;
    var dstU: [*c]Uint8 = undefined;
    _ = &dstU;
    var dstV: [*c]Uint8 = undefined;
    _ = &dstV;
    var dstY_pitch: Uint32 = undefined;
    _ = &dstY_pitch;
    var dstUV_pitch: Uint32 = undefined;
    _ = &dstUV_pitch;
    var dstY_pitch_left: Uint32 = undefined;
    _ = &dstY_pitch_left;
    var dstUV_pitch_left: Uint32 = undefined;
    _ = &dstUV_pitch_left;
    var dstUV_pixel_stride: Uint32 = undefined;
    _ = &dstUV_pixel_stride;
    if (src == dst) {
        return SDL_SetError_REAL("Can't change YUV plane types in-place");
    }
    if (!GetYUVPlanes(width, height, src_format, src, src_pitch, &srcY1, &srcU1, &srcV1, &srcY_pitch, &srcUV_pitch)) {
        return @"false" != 0;
    }
    srcY2 = srcY1 + srcY_pitch;
    srcU2 = srcU1 + srcUV_pitch;
    srcV2 = srcV1 + srcUV_pitch;
    src_pitch_left = srcY_pitch -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, 4) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    if (!GetYUVPlanes(width, height, dst_format, dst, dst_pitch, @ptrCast(@alignCast(&dstY1)), @ptrCast(@alignCast(&dstU)), @ptrCast(@alignCast(&dstV)), &dstY_pitch, &dstUV_pitch)) {
        return @"false" != 0;
    }
    dstY2 = dstY1 + dstY_pitch;
    dstY_pitch_left = dstY_pitch -% @as(Uint32, @bitCast(@as(c_int, width)));
    if ((dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) {
        dstUV_pixel_stride = 2;
        dstUV_pitch_left = dstUV_pitch -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, 2) * @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    } else {
        dstUV_pixel_stride = 1;
        dstUV_pitch_left = dstUV_pitch -% @as(Uint32, @bitCast(@as(c_int, @divTrunc(width + @as(c_int, 1), @as(c_int, 2)))));
    }
    {
        y = 0;
        while (y < (height - @as(c_int, 1))) : (y += 2) {
            {
                x = 0;
                while (x < (width - @as(c_int, 1))) : (x += 2) {
                    (blk: {
                        const ref = &dstY1;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcY1.*;
                    srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    (blk: {
                        const ref = &dstY1;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcY1.*;
                    srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    (blk: {
                        const ref = &dstY2;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcY2.*;
                    srcY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    (blk: {
                        const ref = &dstY2;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = srcY2.*;
                    srcY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                    dstU.* = @truncate((@as(Uint32, srcU1.*) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, srcU2.*))))) / @as(Uint32, 2));
                    dstV.* = @truncate((@as(Uint32, srcV1.*) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, srcV2.*))))) / @as(Uint32, 2));
                    srcU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    srcU2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    srcV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    srcV2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    dstU += dstUV_pixel_stride;
                    dstV += dstUV_pixel_stride;
                }
            }
            if (x == (width - @as(c_int, 1))) {
                dstY1.* = srcY1.*;
                srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                (blk: {
                    const ref = &dstY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = srcY1.*;
                srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstY2.* = srcY2.*;
                srcY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                (blk: {
                    const ref = &dstY2;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = srcY2.*;
                srcY2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstU.* = @truncate((@as(Uint32, srcU1.*) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, srcU2.*))))) / @as(Uint32, 2));
                dstV.* = @truncate((@as(Uint32, srcV1.*) +% @as(Uint32, @bitCast(@as(c_int, @as(c_int, srcV2.*))))) / @as(Uint32, 2));
                srcU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                srcU2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                srcV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                srcV2 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstU += dstUV_pixel_stride;
                dstV += dstUV_pixel_stride;
            }
            srcY1 += src_pitch_left +% srcY_pitch;
            srcY2 += src_pitch_left +% srcY_pitch;
            srcU1 += src_pitch_left +% srcUV_pitch;
            srcU2 += src_pitch_left +% srcUV_pitch;
            srcV1 += src_pitch_left +% srcUV_pitch;
            srcV2 += src_pitch_left +% srcUV_pitch;
            dstY1 += dstY_pitch_left +% dstY_pitch;
            dstY2 += dstY_pitch_left +% dstY_pitch;
            dstU += dstUV_pitch_left;
            dstV += dstUV_pitch_left;
        }
    }
    if (y == (height - @as(c_int, 1))) {
        {
            x = 0;
            while (x < (width - @as(c_int, 1))) : (x += 2) {
                (blk: {
                    const ref = &dstY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = srcY1.*;
                srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                (blk: {
                    const ref = &dstY1;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = srcY1.*;
                srcY1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstU.* = srcU1.*;
                dstV.* = srcV1.*;
                srcU1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                srcV1 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dstU += dstUV_pixel_stride;
                dstV += dstUV_pixel_stride;
            }
        }
        if (x == (width - @as(c_int, 1))) {
            dstY1.* = srcY1.*;
            dstU.* = srcU1.*;
            dstV.* = srcV1.*;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_ConvertPixels_YUV_to_YUV(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, _: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, _: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    if (src_colorspace != dst_colorspace) {
        return SDL_SetError_REAL("SDL_ConvertPixels_YUV_to_YUV: colorspace conversion not supported");
    }
    if (src_format == dst_format) {
        if (src == dst) {
            return @"true" != 0;
        }
        return SDL_ConvertPixels_YUV_to_YUV_Copy(width, height, src_format, src, src_pitch, dst, dst_pitch);
    }
    if (IsPlanar2x2Format(src_format) and IsPlanar2x2Format(dst_format)) {
        return SDL_ConvertPixels_Planar2x2_to_Planar2x2(width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch);
    } else if (IsPacked4Format(src_format) and IsPacked4Format(dst_format)) {
        return SDL_ConvertPixels_Packed4_to_Packed4(width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch);
    } else if (IsPlanar2x2Format(src_format) and IsPacked4Format(dst_format)) {
        return SDL_ConvertPixels_Planar2x2_to_Packed4(width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch);
    } else if (IsPacked4Format(src_format) and IsPlanar2x2Format(dst_format)) {
        return SDL_ConvertPixels_Packed4_to_Planar2x2(width, height, src_format, src, src_pitch, dst_format, dst, dst_pitch);
    } else {
        return SDL_SetError_REAL("SDL_ConvertPixels_YUV_to_YUV: Unsupported YUV conversion: %s -> %s", SDL_GetPixelFormatName_REAL(src_format), SDL_GetPixelFormatName_REAL(dst_format));
    }
}

pub const SDL_ConvertPixels = SDL_ConvertPixels_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const YUV_SD_THRESHOLD = @as(c_int, 576);
