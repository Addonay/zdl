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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_IO_STATUS_EOF: c_int = 2;
pub const enum_SDL_IOStatus = c_uint;
pub const SDL_IOStatus = enum_SDL_IOStatus;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const SDL_IO_SEEK_CUR: c_int = 1;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_GetIOStatus_REAL(context: ?*SDL_IOStream) SDL_IOStatus;
pub extern fn SDL_SeekIO_REAL(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_TellIO_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub const SDL_BlendMode = Uint32;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_CreateSurfacePalette_REAL(surface: [*c]SDL_Surface) [*c]SDL_Palette;
pub extern fn SDL_SetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, enabled: bool, key: Uint32) bool;
pub extern fn SDL_SetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_ConvertPixelsAndColorspace_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_HasSSE2_REAL() bool;
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v4si = @Vector(4, c_int);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __v4su = @Vector(4, c_uint);
pub const __v8hu = @Vector(8, c_ushort);
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
pub inline fn _mm_add_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) + @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_add_epi32(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4su, @bitCast(__a)) + @as(__v4su, @bitCast(__b)));
}
pub const _mm_madd_epi16 = @import("simd")._mm_madd_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2314:19: warning: TODO implement function '__builtin_elementwise_max' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2313:1: warning: unable to translate function, demoted to extern
pub const _mm_mulhi_epi16 = @import("simd")._mm_mulhi_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2409:19: warning: TODO implement function '__builtin_ia32_pmulhuw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2408:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_sub_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) - @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_sub_epi32(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4su, @bitCast(__a)) - @as(__v4su, @bitCast(__b)));
}
pub inline fn _mm_xor_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) ^ @as(__v2du, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2770:19: warning: TODO implement function '__builtin_ia32_psllwi128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2769:1: warning: unable to translate function, demoted to extern
pub const _mm_slli_epi16 = @import("simd")._mm_slli_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2788:19: warning: TODO implement function '__builtin_ia32_psllw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2787:1: warning: unable to translate function, demoted to extern
pub const _mm_srai_epi16 = @import("simd")._mm_srai_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2898:19: warning: TODO implement function '__builtin_ia32_psraw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2897:1: warning: unable to translate function, demoted to extern
pub const _mm_srai_epi32 = @import("simd")._mm_srai_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2936:19: warning: TODO implement function '__builtin_ia32_psrad128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2935:1: warning: unable to translate function, demoted to extern
pub const _mm_srli_epi16 = @import("simd")._mm_srli_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2997:19: warning: TODO implement function '__builtin_ia32_psrlw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2996:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_load_si128(__p: [*c]const __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return __p.*;
}
pub inline fn _mm_loadl_epi64(__p: [*c]align(1) const __m128i_u) __m128i {
    @setEvalBranchQuota(100000);
    const struct___mm_loadl_epi64_struct = extern struct {
        __u: c_longlong align(1) = 0,
    };
    _ = &struct___mm_loadl_epi64_struct;
    return [2]c_longlong{
        @as([*c]const struct___mm_loadl_epi64_struct, @ptrCast(@alignCast(__p))).*.__u,
        0,
    };
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3494:19: warning: TODO implement function '__builtin_ia32_undef128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3493:46: warning: unable to translate function, demoted to extern
pub inline fn _mm_set_epi32(__i3: c_int, __i2: c_int, __i1: c_int, __i0: c_int) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4si, [4]c_int{
        __i0,
        __i1,
        __i2,
        __i3,
    }));
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
pub inline fn _mm_set1_epi32(__i: c_int) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi32(__i, __i, __i, __i);
}
pub inline fn _mm_set1_epi16(__w: c_short) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi16(__w, __w, __w, __w, __w, __w, __w, __w);
}
pub inline fn _mm_set1_epi8(__b: u8) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi8(__b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b);
}
pub inline fn _mm_setr_epi16(__w0: c_short, __w1: c_short, __w2: c_short, __w3: c_short, __w4: c_short, __w5: c_short, __w6: c_short, __w7: c_short) __m128i {
    @setEvalBranchQuota(100000);
    return _mm_set_epi16(__w7, __w6, __w5, __w4, __w3, __w2, __w1, __w0);
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
pub inline fn _mm_storel_epi64(__p: [*c]align(1) __m128i_u, __a: __m128i) void {
    @setEvalBranchQuota(100000);
    const struct___mm_storel_epi64_struct = extern struct {
        __u: c_longlong align(1) = 0,
    };
    _ = &struct___mm_storel_epi64_struct;
    @as([*c]struct___mm_storel_epi64_struct, @ptrCast(@alignCast(__p))).*.__u = __a[@as(c_int, 0)];
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4041:3: warning: TODO implement function '__builtin_nontemporal_store' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4039:43: warning: unable to translate function, demoted to extern
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
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub extern fn SDL_SurfaceValid(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool;
pub const STBI_default: c_int = 0;
pub const STBI_grey: c_int = 1;
pub const STBI_grey_alpha: c_int = 2;
pub const STBI_rgb: c_int = 3;
pub const STBI_rgb_alpha: c_int = 4;
pub const stbi_uc = Uint8;
pub const stbi_io_callbacks = extern struct {
    read: ?*const fn (user: ?*anyopaque, data: [*c]u8, size: c_int) callconv(.c) c_int = null,
    skip: ?*const fn (user: ?*anyopaque, n: c_int) callconv(.c) void = null,
    eof: ?*const fn (user: ?*anyopaque) callconv(.c) c_int = null,
};
pub const stbi__uint16 = Uint16;
pub const stbi__int16 = Sint16;
pub const stbi__uint32 = Uint32;
pub fn stbi__sse2_available() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(SDL_HasSSE2_REAL());
}
pub const stbi__context = extern struct {
    img_x: stbi__uint32 = 0,
    img_y: stbi__uint32 = 0,
    img_n: c_int = 0,
    img_out_n: c_int = 0,
    io: stbi_io_callbacks = @import("std").mem.zeroes(stbi_io_callbacks),
    io_user_data: ?*anyopaque = null,
    read_from_callbacks: c_int = 0,
    buflen: c_int = 0,
    buffer_start: [128]stbi_uc = @import("std").mem.zeroes([128]stbi_uc),
    callback_already_read: c_int = 0,
    img_buffer: [*c]stbi_uc = null,
    img_buffer_end: [*c]stbi_uc = null,
    img_buffer_original: [*c]stbi_uc = null,
    img_buffer_original_end: [*c]stbi_uc = null,
};
pub fn stbi__start_mem(s: [*c]stbi__context, buffer: [*c]const stbi_uc, len: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    s.*.io.read = null;
    s.*.io.skip = null;
    s.*.io.eof = null;
    s.*.read_from_callbacks = 0;
    s.*.callback_already_read = 0;
    s.*.img_buffer = blk: {
        const tmp = @as([*c]stbi_uc, @ptrCast(@alignCast(@constCast(buffer))));
        s.*.img_buffer_original = tmp;
        break :blk tmp;
    };
    s.*.img_buffer_end = blk: {
        const tmp = @as([*c]stbi_uc, @ptrCast(@alignCast(@constCast(buffer)))) + @as(usize, @bitCast(@as(isize, @intCast(len))));
        s.*.img_buffer_original_end = tmp;
        break :blk tmp;
    };
}
pub fn stbi__start_callbacks(s: [*c]stbi__context, c: [*c]stbi_io_callbacks, user: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    s.*.io = c.*;
    s.*.io_user_data = user;
    s.*.buflen = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(s.*.buffer_start)))));
    s.*.read_from_callbacks = 1;
    s.*.callback_already_read = 0;
    s.*.img_buffer = blk: {
        const tmp = @as([*c]stbi_uc, @ptrCast(@alignCast(&s.*.buffer_start)));
        s.*.img_buffer_original = tmp;
        break :blk tmp;
    };
    stbi__refill_buffer(s);
    s.*.img_buffer_original_end = s.*.img_buffer_end;
}
pub fn stbi__rewind(s: [*c]stbi__context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    s.*.img_buffer = s.*.img_buffer_original;
    s.*.img_buffer_end = s.*.img_buffer_original_end;
}
pub const STBI_ORDER_RGB: c_int = 0;
pub const stbi__nv12 = extern struct {
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    y: [*c]stbi_uc = null,
    uv: [*c]stbi_uc = null,
};
pub const stbi__result_info = extern struct {
    bits_per_channel: c_int = 0,
    num_channels: c_int = 0,
    channel_order: c_int = 0,
};
pub fn stbi__err(str: [*c]const u8) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("%s", str);
    return 0;
}
pub fn stbi__malloc(size: usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_malloc_REAL(size);
}
pub fn stbi__addsizes_valid(arg_a: c_int, b: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    if (b < @as(c_int, 0)) return 0;
    return @intFromBool(a <= (@as(c_int, 2147483647) - b));
}
pub fn stbi__mul2sizes_valid(arg_a: c_int, b: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    if ((a < @as(c_int, 0)) or (b < @as(c_int, 0))) return 0;
    if (b == @as(c_int, 0)) return 1;
    return @intFromBool(a <= @divTrunc(@as(c_int, 2147483647), b));
}
pub fn stbi__mad2sizes_valid(a: c_int, b: c_int, add: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((stbi__mul2sizes_valid(a, b) != 0) and (stbi__addsizes_valid(a * b, add) != 0));
}
pub fn stbi__mad3sizes_valid(a: c_int, b: c_int, c: c_int, add: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(((stbi__mul2sizes_valid(a, b) != 0) and (stbi__mul2sizes_valid(a * b, c) != 0)) and (stbi__addsizes_valid((a * b) * c, add) != 0));
}
pub fn stbi__mad4sizes_valid(a: c_int, b: c_int, c: c_int, d: c_int, add: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool((((stbi__mul2sizes_valid(a, b) != 0) and (stbi__mul2sizes_valid(a * b, c) != 0)) and (stbi__mul2sizes_valid((a * b) * c, d) != 0)) and (stbi__addsizes_valid(((a * b) * c) * d, add) != 0));
}
pub fn stbi__malloc_mad2(a: c_int, b: c_int, add: c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!(stbi__mad2sizes_valid(a, b, add) != 0)) return null;
    return stbi__malloc(@bitCast(@as(c_long, (a * b) + add)));
}
pub fn stbi__malloc_mad3(a: c_int, b: c_int, c: c_int, add: c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!(stbi__mad3sizes_valid(a, b, c, add) != 0)) return null;
    return stbi__malloc(@bitCast(@as(c_long, ((a * b) * c) + add)));
}
pub fn stbi__malloc_mad4(a: c_int, b: c_int, c: c_int, d: c_int, add: c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!(stbi__mad4sizes_valid(a, b, c, d, add) != 0)) return null;
    return stbi__malloc(@bitCast(@as(c_long, (((a * b) * c) * d) + add)));
}
pub fn stbi__addints_valid(arg_a: c_int, arg_b: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    if (@intFromBool(a >= @as(c_int, 0)) != @intFromBool(b >= @as(c_int, 0))) return 1;
    if ((a < @as(c_int, 0)) and (b < @as(c_int, 0))) return @intFromBool(a >= (~@as(c_int, 2147483647) - b));
    return @intFromBool(a <= (@as(c_int, 2147483647) - b));
}
pub fn stbi__mul2shorts_valid(arg_a: c_int, arg_b: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    if ((b == @as(c_int, 0)) or (b == -@as(c_int, 1))) return 1;
    if (@intFromBool(a >= @as(c_int, 0)) == @intFromBool(b >= @as(c_int, 0))) return @intFromBool(a <= @divTrunc(@as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))), b));
    if (b < @as(c_int, 0)) return @intFromBool(a <= @divTrunc(@as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))), b));
    return @intFromBool(a >= @divTrunc(@as(c_int, @as(Sint16, @truncate(~@as(c_int, 32767)))), b));
}
pub fn stbi_image_free(retval_from_stbi_load: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(retval_from_stbi_load);
}
pub var stbi__vertically_flip_on_load_global: c_int = 0;
pub fn stbi__load_main(s: [*c]stbi__context, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int, ri: [*c]stbi__result_info, bpc: c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(ri)), 0, @sizeOf(@TypeOf(ri.*)));
    ri.*.bits_per_channel = 8;
    ri.*.channel_order = STBI_ORDER_RGB;
    ri.*.num_channels = 0;
    if (stbi__png_test(s) != 0) return stbi__png_load(s, x, y, comp, req_comp, palette_buffer, palette_buffer_len, ri);
    _ = @sizeOf(@TypeOf(bpc));
    if (stbi__jpeg_test(s) != 0) return stbi__jpeg_load(s, x, y, comp, req_comp, null, ri);
    return @ptrCast(@alignCast(@as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Image not of any known type, or corrupt") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))))));
}
pub fn stbi__convert_16_to_8(orig: [*c]stbi__uint16, w: c_int, h: c_int, channels: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var img_len: c_int = (w * h) * channels;
    _ = &img_len;
    var reduced: [*c]stbi_uc = undefined;
    _ = &reduced;
    reduced = @ptrCast(@alignCast(stbi__malloc(@bitCast(@as(c_long, img_len)))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(reduced))) == @as(?*anyopaque, null)) return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
    {
        i = 0;
        while (i < img_len) : (i += 1) {
            reduced[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate((@as(c_int, orig[@bitCast(@as(isize, @intCast(i)))]) >> @intCast(@as(c_int, 8))) & @as(c_int, 255))));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(orig)));
    return reduced;
}
pub fn stbi__vertical_flip(image: ?*anyopaque, w: c_int, h: c_int, bytes_per_pixel: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var row: c_int = undefined;
    _ = &row;
    var bytes_per_row: usize = @as(usize, @bitCast(@as(c_long, w))) *% @as(usize, @bitCast(@as(c_long, bytes_per_pixel)));
    _ = &bytes_per_row;
    var temp: [2048]stbi_uc = undefined;
    _ = &temp;
    var bytes: [*c]stbi_uc = @ptrCast(@alignCast(image));
    _ = &bytes;
    {
        row = 0;
        while (row < (h >> @intCast(@as(c_int, 1)))) : (row += 1) {
            var row0: [*c]stbi_uc = bytes + (@as(usize, @bitCast(@as(c_long, row))) *% bytes_per_row);
            _ = &row0;
            var row1: [*c]stbi_uc = bytes + (@as(usize, @bitCast(@as(c_long, (h - row) - @as(c_int, 1)))) *% bytes_per_row);
            _ = &row1;
            var bytes_left: usize = bytes_per_row;
            _ = &bytes_left;
            while (bytes_left != 0) {
                var bytes_copy: usize = if (bytes_left < @sizeOf(@TypeOf(temp))) bytes_left else @sizeOf(@TypeOf(temp));
                _ = &bytes_copy;
                _ = memcpy(@ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&temp))))), @ptrCast(@alignCast(row0)), bytes_copy);
                _ = memcpy(@ptrCast(@alignCast(row0)), @ptrCast(@alignCast(row1)), bytes_copy);
                _ = memcpy(@ptrCast(@alignCast(row1)), @ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&temp))))), bytes_copy);
                row0 += bytes_copy;
                row1 += bytes_copy;
                bytes_left -%= bytes_copy;
            }
        }
    }
}
pub fn stbi__load_indexed(s: [*c]stbi__context, x: [*c]c_int, y: [*c]c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var ri: stbi__result_info = undefined;
    _ = &ri;
    var comp: c_int = undefined;
    _ = &comp;
    var result: ?*anyopaque = undefined;
    _ = &result;
    if (!(palette_buffer != null)) return null;
    result = stbi__load_main(s, x, y, &comp, 1, &ri, 8, palette_buffer, palette_buffer_len);
    if (result == @as(?*anyopaque, null)) return null;
    if (comp != @as(c_int, 1)) {
        stbi_image_free(result);
        return null;
    }
    if (ri.bits_per_channel != @as(c_int, 8)) {
        stbi_image_free(result);
        return null;
    }
    if (stbi__vertically_flip_on_load_global != 0) {
        var channels: c_int = 1;
        _ = &channels;
        stbi__vertical_flip(result, x.*, y.*, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, channels))) *% @sizeOf(stbi_uc)))));
    }
    return @ptrCast(@alignCast(result));
}
pub fn stbi__load_and_postprocess_8bit(s: [*c]stbi__context, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "stbi__load_and_postprocess_8bit".*;
    };
    _ = &static_local___func__;
    var ri: stbi__result_info = undefined;
    _ = &ri;
    var result: ?*anyopaque = stbi__load_main(s, x, y, comp, req_comp, &ri, 8, null, 0);
    _ = &result;
    if (result == @as(?*anyopaque, null)) return null;
    while (true) {
        while (!((ri.bits_per_channel == @as(c_int, 8)) or (ri.bits_per_channel == @as(c_int, 16)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "ri.bits_per_channel == 8 || ri.bits_per_channel == 16",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 1405);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    if (ri.bits_per_channel != @as(c_int, 8)) {
        result = @ptrCast(@alignCast(stbi__convert_16_to_8(@ptrCast(@alignCast(result)), x.*, y.*, if (req_comp == @as(c_int, 0)) comp.* else req_comp)));
        ri.bits_per_channel = 8;
    }
    if (stbi__vertically_flip_on_load_global != 0) {
        var channels: c_int = if (req_comp != 0) req_comp else comp.*;
        _ = &channels;
        stbi__vertical_flip(result, x.*, y.*, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, channels))) *% @sizeOf(stbi_uc)))));
    }
    return @ptrCast(@alignCast(result));
}
pub fn stbi_load_from_memory(buffer: [*c]const stbi_uc, len: c_int, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var s: stbi__context = undefined;
    _ = &s;
    stbi__start_mem(&s, buffer, len);
    return stbi__load_and_postprocess_8bit(&s, x, y, comp, req_comp);
}
pub fn stbi_load_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*anyopaque, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var s: stbi__context = undefined;
    _ = &s;
    stbi__start_callbacks(&s, @ptrCast(@alignCast(@constCast(clbk))), user);
    return stbi__load_and_postprocess_8bit(&s, x, y, comp, req_comp);
}
pub fn stbi_load_from_callbacks_with_palette(clbk: [*c]const stbi_io_callbacks, user: ?*anyopaque, x: [*c]c_int, y: [*c]c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var s: stbi__context = undefined;
    _ = &s;
    stbi__start_callbacks(&s, @ptrCast(@alignCast(@constCast(clbk))), user);
    return stbi__load_indexed(&s, x, y, palette_buffer, palette_buffer_len);
}
pub const STBI__SCAN_load: c_int = 0;
pub const STBI__SCAN_type: c_int = 1;
pub const STBI__SCAN_header: c_int = 2;
pub fn stbi__refill_buffer(s: [*c]stbi__context) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var n: c_int = s.*.io.read.?(s.*.io_user_data, @ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&s.*.buffer_start))))), s.*.buflen);
    _ = &n;
    s.*.callback_already_read += @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(s.*.img_buffer) -% @intFromPtr(s.*.img_buffer_original))), @sizeOf(stbi_uc)));
    if (n == @as(c_int, 0)) {
        s.*.read_from_callbacks = 0;
        s.*.img_buffer = @ptrCast(@alignCast(&s.*.buffer_start));
        s.*.img_buffer_end = @as([*c]stbi_uc, @ptrCast(@alignCast(&s.*.buffer_start))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
        s.*.img_buffer.* = 0;
    } else {
        s.*.img_buffer = @ptrCast(@alignCast(&s.*.buffer_start));
        s.*.img_buffer_end = @as([*c]stbi_uc, @ptrCast(@alignCast(&s.*.buffer_start))) + @as(usize, @bitCast(@as(isize, @intCast(n))));
    }
}
pub fn stbi__get8(s: [*c]stbi__context) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    if (s.*.img_buffer < s.*.img_buffer_end) return (blk: {
        const ref = &s.*.img_buffer;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).*;
    if (s.*.read_from_callbacks != 0) {
        stbi__refill_buffer(s);
        return (blk: {
            const ref = &s.*.img_buffer;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
    }
    return 0;
}
pub fn stbi__at_eof(s: [*c]stbi__context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (s.*.io.read != null) {
        if (!(s.*.io.eof.?(s.*.io_user_data) != 0)) return 0;
        if (s.*.read_from_callbacks == @as(c_int, 0)) return 1;
    }
    return @intFromBool(s.*.img_buffer >= s.*.img_buffer_end);
}
pub fn stbi__skip(s: [*c]stbi__context, n: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (n == @as(c_int, 0)) return;
    if (n < @as(c_int, 0)) {
        s.*.img_buffer = s.*.img_buffer_end;
        return;
    }
    if (s.*.io.read != null) {
        var blen: c_int = @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(s.*.img_buffer_end) -% @intFromPtr(s.*.img_buffer))), @sizeOf(stbi_uc)));
        _ = &blen;
        if (blen < n) {
            s.*.img_buffer = s.*.img_buffer_end;
            s.*.io.skip.?(s.*.io_user_data, n - blen);
            return;
        }
    }
    s.*.img_buffer += @as(usize, @bitCast(@as(isize, @intCast(n))));
}
pub fn stbi__getn(s: [*c]stbi__context, buffer: [*c]stbi_uc, n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (s.*.io.read != null) {
        var blen: c_int = @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(s.*.img_buffer_end) -% @intFromPtr(s.*.img_buffer))), @sizeOf(stbi_uc)));
        _ = &blen;
        if (blen < n) {
            var res: c_int = undefined;
            _ = &res;
            var count: c_int = undefined;
            _ = &count;
            _ = memcpy(@ptrCast(@alignCast(buffer)), @ptrCast(@alignCast(s.*.img_buffer)), @bitCast(@as(c_long, blen)));
            count = s.*.io.read.?(s.*.io_user_data, @as([*c]u8, @ptrCast(@alignCast(buffer))) + @as(usize, @bitCast(@as(isize, @intCast(blen)))), n - blen);
            res = @intFromBool(count == (n - blen));
            s.*.img_buffer = s.*.img_buffer_end;
            return res;
        }
    }
    if ((s.*.img_buffer + @as(usize, @bitCast(@as(isize, @intCast(n))))) <= s.*.img_buffer_end) {
        _ = memcpy(@ptrCast(@alignCast(buffer)), @ptrCast(@alignCast(s.*.img_buffer)), @bitCast(@as(c_long, n)));
        s.*.img_buffer += @as(usize, @bitCast(@as(isize, @intCast(n))));
        return 1;
    } else return 0;
}
pub fn stbi__get16be(s: [*c]stbi__context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var z: c_int = stbi__get8(s);
    _ = &z;
    return (z << @intCast(@as(c_int, 8))) + @as(c_int, stbi__get8(s));
}
pub fn stbi__get32be(s: [*c]stbi__context) callconv(.c) stbi__uint32 {
    @setEvalBranchQuota(100000);
    var z: stbi__uint32 = @bitCast(@as(c_int, stbi__get16be(s)));
    _ = &z;
    return (z << @intCast(@as(stbi__uint32, 16))) +% @as(stbi__uint32, @bitCast(@as(c_int, stbi__get16be(s))));
}
pub fn stbi__compute_y(r: c_int, g: c_int, b: c_int) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(i8, @truncate((((r * @as(c_int, 77)) + (g * @as(c_int, 150))) + (@as(c_int, 29) * b)) >> @intCast(@as(c_int, 8)))));
}
pub fn stbi__convert_format(data: [*c]u8, img_n: c_int, arg_req_comp: c_int, x: c_uint, y: c_uint) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var req_comp = arg_req_comp;
    _ = &req_comp;
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "stbi__convert_format".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var good: [*c]u8 = undefined;
    _ = &good;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "req_comp >= 1 && req_comp <= 4",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var src: [*c]u8 = undefined;
    _ = &src;
    var dest: [*c]u8 = undefined;
    _ = &dest;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(data))) == @as(?*anyopaque, null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return data;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (req_comp == img_n) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return data;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                good = @ptrCast(@alignCast(stbi__malloc_mad3(req_comp, @bitCast(@as(c_uint, @truncate(x))), @bitCast(@as(c_uint, @truncate(y))), 0)));
                if (@as(?*anyopaque, @ptrCast(@alignCast(good))) == @as(?*anyopaque, null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            10 => {
                if (!((req_comp >= @as(c_int, 1)) and (req_comp <= @as(c_int, 4)))) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 1924);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 8;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 18;
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
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                j = 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (j < @as(c_int, @bitCast(@as(c_uint, @truncate(y))))) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                src = data + ((@as(c_uint, @bitCast(@as(c_int, j))) *% x) *% @as(c_uint, @bitCast(@as(c_int, img_n))));
                dest = good + ((@as(c_uint, @bitCast(@as(c_int, j))) *% x) *% @as(c_uint, @bitCast(@as(c_int, req_comp))));
                switch ((img_n * @as(c_int, 8)) + req_comp) {
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 27;
                        continue;
                    },
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 32;
                        continue;
                    },
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 37;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 42;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 47;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 52;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 57;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 62;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 67;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 72;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 77;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 82;
                        continue;
                    },
                    else => {
                        sdl_pc = 87;
                        continue;
                    },
                }
            },
            24 => {
                j += 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return good;
            },
            26 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = 255;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            32 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            37 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                dest[@as(c_int, 3)] = 255;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            42 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            47 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            49 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            52 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                dest[@as(c_int, 3)] = src[@as(c_int, 1)];
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            57 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = src[@as(c_int, 1)];
                dest[@as(c_int, 2)] = src[@as(c_int, 2)];
                dest[@as(c_int, 3)] = 255;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            62 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                dest[@as(c_int, 0)] = stbi__compute_y(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            67 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                dest[@as(c_int, 0)] = stbi__compute_y(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                dest[@as(c_int, 1)] = 255;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            72 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                dest[@as(c_int, 0)] = stbi__compute_y(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            77 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            79 => {
                dest[@as(c_int, 0)] = stbi__compute_y(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                dest[@as(c_int, 1)] = src[@as(c_int, 3)];
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            82 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            84 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = src[@as(c_int, 1)];
                dest[@as(c_int, 2)] = src[@as(c_int, 2)];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                SDL_free_REAL(@ptrCast(@alignCast(good)));
                return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Unsupported format conversion") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
            },
            91 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 1953);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            95 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            97 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 99;
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
                    sdl_pc = 96;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn stbi__compute_y_16(r: c_int, g: c_int, b: c_int) callconv(.c) stbi__uint16 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_short, @truncate((((r * @as(c_int, 77)) + (g * @as(c_int, 150))) + (@as(c_int, 29) * b)) >> @intCast(@as(c_int, 8)))));
}
pub fn stbi__convert_format16(data: [*c]stbi__uint16, img_n: c_int, arg_req_comp: c_int, x: c_uint, y: c_uint) callconv(.c) [*c]stbi__uint16 {
    @setEvalBranchQuota(100000);
    var req_comp = arg_req_comp;
    _ = &req_comp;
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "stbi__convert_format16".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var good: [*c]stbi__uint16 = undefined;
    _ = &good;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "req_comp >= 1 && req_comp <= 4",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var src: [*c]stbi__uint16 = undefined;
    _ = &src;
    var dest: [*c]stbi__uint16 = undefined;
    _ = &dest;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    i -= 1;
    src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (req_comp == img_n) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return data;
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
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                good = @ptrCast(@alignCast(stbi__malloc_mad4(req_comp, @bitCast(@as(c_uint, @truncate(x))), @bitCast(@as(c_uint, @truncate(y))), 2, 0)));
                if (@as(?*anyopaque, @ptrCast(@alignCast(good))) == @as(?*anyopaque, null)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            7 => {
                if (!((req_comp >= @as(c_int, 1)) and (req_comp <= @as(c_int, 4)))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 1981);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return @ptrCast(@alignCast(@as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))))));
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                j = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (j < @as(c_int, @bitCast(@as(c_uint, @truncate(y))))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                src = data + ((@as(c_uint, @bitCast(@as(c_int, j))) *% x) *% @as(c_uint, @bitCast(@as(c_int, img_n))));
                dest = good + ((@as(c_uint, @bitCast(@as(c_int, j))) *% x) *% @as(c_uint, @bitCast(@as(c_int, req_comp))));
                switch ((img_n * @as(c_int, 8)) + req_comp) {
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 24;
                        continue;
                    },
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 29;
                        continue;
                    },
                    (@as(c_int, 1) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 34;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 39;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 44;
                        continue;
                    },
                    (@as(c_int, 2) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 49;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 4) => {
                        sdl_pc = 54;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 59;
                        continue;
                    },
                    (@as(c_int, 3) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 64;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 1) => {
                        sdl_pc = 69;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    (@as(c_int, 4) * @as(c_int, 8)) + @as(c_int, 3) => {
                        sdl_pc = 79;
                        continue;
                    },
                    else => {
                        sdl_pc = 84;
                        continue;
                    },
                }
            },
            21 => {
                j += 1;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                return good;
            },
            23 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = 65535;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            29 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            34 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                dest[@as(c_int, 3)] = 65535;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            39 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            44 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            49 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                dest[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = src[@as(c_int, 0)];
                        dest[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dest[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                dest[@as(c_int, 3)] = src[@as(c_int, 1)];
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            54 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = src[@as(c_int, 1)];
                dest[@as(c_int, 2)] = src[@as(c_int, 2)];
                dest[@as(c_int, 3)] = 65535;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            59 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                dest[@as(c_int, 0)] = stbi__compute_y_16(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            64 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                dest[@as(c_int, 0)] = stbi__compute_y_16(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                dest[@as(c_int, 1)] = 65535;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            69 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                dest[@as(c_int, 0)] = stbi__compute_y_16(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            74 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            76 => {
                dest[@as(c_int, 0)] = stbi__compute_y_16(src[@as(c_int, 0)], src[@as(c_int, 1)], src[@as(c_int, 2)]);
                dest[@as(c_int, 1)] = src[@as(c_int, 3)];
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            79 => {
                i = @bitCast(@as(c_uint, @truncate(x -% @as(c_uint, 1))));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                if (i >= @as(c_int, 0)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                dest[@as(c_int, 0)] = src[@as(c_int, 0)];
                dest[@as(c_int, 1)] = src[@as(c_int, 1)];
                dest[@as(c_int, 2)] = src[@as(c_int, 2)];
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                dest += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                SDL_free_REAL(@ptrCast(@alignCast(good)));
                return @ptrCast(@alignCast(@as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Unsupported format conversion") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))))));
            },
            88 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 2010);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            94 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const stbi__huffman = extern struct {
    fast: [512]stbi_uc = @import("std").mem.zeroes([512]stbi_uc),
    code: [256]stbi__uint16 = @import("std").mem.zeroes([256]stbi__uint16),
    values: [256]stbi_uc = @import("std").mem.zeroes([256]stbi_uc),
    size: [257]stbi_uc = @import("std").mem.zeroes([257]stbi_uc),
    maxcode: [18]c_uint = @import("std").mem.zeroes([18]c_uint),
    delta: [17]c_int = @import("std").mem.zeroes([17]c_int),
};
const struct_unnamed_17 = extern struct {
    id: c_int = 0,
    h: c_int = 0,
    v: c_int = 0,
    tq: c_int = 0,
    hd: c_int = 0,
    ha: c_int = 0,
    dc_pred: c_int = 0,
    x: c_int = 0,
    y: c_int = 0,
    w2: c_int = 0,
    h2: c_int = 0,
    data: [*c]stbi_uc = null,
    raw_data: ?*anyopaque = null,
    raw_coeff: ?*anyopaque = null,
    linebuf: [*c]stbi_uc = null,
    coeff: [*c]c_short = null,
    coeff_w: c_int = 0,
    coeff_h: c_int = 0,
};
pub const stbi__jpeg = extern struct {
    s: [*c]stbi__context = null,
    huff_dc: [4]stbi__huffman = @import("std").mem.zeroes([4]stbi__huffman),
    huff_ac: [4]stbi__huffman = @import("std").mem.zeroes([4]stbi__huffman),
    dequant: [4][64]stbi__uint16 = @import("std").mem.zeroes([4][64]stbi__uint16),
    fast_ac: [4][512]stbi__int16 = @import("std").mem.zeroes([4][512]stbi__int16),
    img_h_max: c_int = 0,
    img_v_max: c_int = 0,
    img_mcu_x: c_int = 0,
    img_mcu_y: c_int = 0,
    img_mcu_w: c_int = 0,
    img_mcu_h: c_int = 0,
    img_comp: [4]struct_unnamed_17 = @import("std").mem.zeroes([4]struct_unnamed_17),
    code_buffer: stbi__uint32 = 0,
    code_bits: c_int = 0,
    marker: u8 = 0,
    nomore: c_int = 0,
    progressive: c_int = 0,
    spec_start: c_int = 0,
    spec_end: c_int = 0,
    succ_high: c_int = 0,
    succ_low: c_int = 0,
    eob_run: c_int = 0,
    jfif: c_int = 0,
    app14_color_transform: c_int = 0,
    rgb: c_int = 0,
    scan_n: c_int = 0,
    order: [4]c_int = @import("std").mem.zeroes([4]c_int),
    restart_interval: c_int = 0,
    todo: c_int = 0,
    idct_block_kernel: ?*const fn (out: [*c]stbi_uc, out_stride: c_int, data: [*c]c_short) callconv(.c) void = null,
    YCbCr_to_RGB_kernel: ?*const fn (out: [*c]stbi_uc, y: [*c]const stbi_uc, pcb: [*c]const stbi_uc, pcr: [*c]const stbi_uc, count: c_int, step: c_int) callconv(.c) void = null,
    resample_row_hv_2_kernel: ?*const fn (out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc = null,
};
pub fn stbi__build_huffman(h: [*c]stbi__huffman, count: [*c]c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var k: c_int = 0;
    _ = &k;
    var code: c_uint = undefined;
    _ = &code;
    {
        i = 0;
        while (i < @as(c_int, 16)) : (i += 1) {
            {
                j = 0;
                while (j < count[@bitCast(@as(isize, @intCast(i)))]) : (j += 1) {
                    h.*.size[
                        @bitCast(@as(isize, @intCast(blk: {
                            const ref = &k;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        })))
                    ] = @bitCast(@as(i8, @truncate(i + @as(c_int, 1))));
                    if (k >= @as(c_int, 257)) return stbi__err("Corrupt JPEG");
                }
            }
        }
    }
    h.*.size[@bitCast(@as(isize, @intCast(k)))] = 0;
    code = 0;
    k = 0;
    {
        j = 1;
        while (j <= @as(c_int, 16)) : (j += 1) {
            h.*.delta[@bitCast(@as(isize, @intCast(j)))] = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, k))) -% code)));
            if (@as(c_int, h.*.size[@bitCast(@as(isize, @intCast(k)))]) == j) {
                while (@as(c_int, h.*.size[@bitCast(@as(isize, @intCast(k)))]) == j) {
                    h.*.code[
                        @bitCast(@as(isize, @intCast(blk: {
                            const ref = &k;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        })))
                    ] = @truncate(blk: {
                        const ref = &code;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    });
                }
                if ((code -% @as(c_uint, 1)) >= (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, j)))))) return stbi__err("Corrupt JPEG");
            }
            h.*.maxcode[@bitCast(@as(isize, @intCast(j)))] = code << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 16) - j))));
            code <<= @intCast(@as(c_uint, 1));
        }
    }
    h.*.maxcode[@bitCast(@as(isize, @intCast(j)))] = 4294967295;
    _ = memset(@ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&h.*.fast))))), 255, @bitCast(@as(c_long, @as(c_int, 1) << @intCast(FAST_BITS))));
    {
        i = 0;
        while (i < k) : (i += 1) {
            var s: c_int = h.*.size[@bitCast(@as(isize, @intCast(i)))];
            _ = &s;
            if (s <= FAST_BITS) {
                var c: c_int = @as(c_int, h.*.code[@bitCast(@as(isize, @intCast(i)))]) << @intCast(FAST_BITS - s);
                _ = &c;
                var m: c_int = @as(c_int, 1) << @intCast(FAST_BITS - s);
                _ = &m;
                {
                    j = 0;
                    while (j < m) : (j += 1) {
                        h.*.fast[@bitCast(@as(isize, @intCast(c + j)))] = @bitCast(@as(i8, @truncate(i)));
                    }
                }
            }
        }
    }
    return 1;
}
pub fn stbi__build_fast_ac(fast_ac: [*c]stbi__int16, h: [*c]stbi__huffman) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < (@as(c_int, 1) << @intCast(FAST_BITS))) : (i += 1) {
            var fast: stbi_uc = h.*.fast[@bitCast(@as(isize, @intCast(i)))];
            _ = &fast;
            fast_ac[@bitCast(@as(isize, @intCast(i)))] = 0;
            if (@as(c_int, fast) < @as(c_int, 255)) {
                var rs: c_int = h.*.values[fast];
                _ = &rs;
                var run: c_int = (rs >> @intCast(@as(c_int, 4))) & @as(c_int, 15);
                _ = &run;
                var magbits: c_int = rs & @as(c_int, 15);
                _ = &magbits;
                var len: c_int = h.*.size[fast];
                _ = &len;
                if ((magbits != 0) and ((len + magbits) <= FAST_BITS)) {
                    var k: c_int = ((i << @intCast(len)) & ((@as(c_int, 1) << @intCast(FAST_BITS)) - @as(c_int, 1))) >> @intCast(FAST_BITS - magbits);
                    _ = &k;
                    var m: c_int = @as(c_int, 1) << @intCast(magbits - @as(c_int, 1));
                    _ = &m;
                    if (k < m) {
                        {
                            const ref = &k;
                            ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% ((~@as(c_uint, 0) << @intCast(@as(c_uint, @bitCast(@as(c_int, magbits))))) +% @as(c_uint, 1)))));
                        }
                    }
                    if ((k >= -@as(c_int, 128)) and (k <= @as(c_int, 127))) {
                        fast_ac[@bitCast(@as(isize, @intCast(i)))] = @truncate(((k * @as(c_int, 256)) + (run * @as(c_int, 16))) + (len + magbits));
                    }
                }
            }
        }
    }
}
pub fn stbi__grow_buffer_unsafe(j: [*c]stbi__jpeg) callconv(.c) void {
    @setEvalBranchQuota(100000);
    while (true) {
        var b: c_uint = @bitCast(@as(c_int, if (j.*.nomore != 0) @as(c_int, 0) else @as(c_int, stbi__get8(j.*.s))));
        _ = &b;
        if (b == @as(c_uint, 255)) {
            var c: c_int = stbi__get8(j.*.s);
            _ = &c;
            while (c == @as(c_int, 255)) {
                c = stbi__get8(j.*.s);
            }
            if (c != @as(c_int, 0)) {
                j.*.marker = @bitCast(@as(i8, @truncate(c)));
                j.*.nomore = 1;
                return;
            }
        }
        j.*.code_buffer |= b << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 24) - j.*.code_bits))));
        j.*.code_bits += 8;
        if (!(j.*.code_bits <= @as(c_int, 24))) break;
    }
}
pub const stbi__bmask: [17]stbi__uint32 = [17]stbi__uint32{
    0,
    1,
    3,
    7,
    15,
    31,
    63,
    127,
    255,
    511,
    1023,
    2047,
    4095,
    8191,
    16383,
    32767,
    65535,
};
pub fn stbi__jpeg_huff_decode(j: [*c]stbi__jpeg, h: [*c]stbi__huffman) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "stbi__jpeg_huff_decode".*;
    };
    _ = &static_local___func__;
    var temp: c_uint = undefined;
    _ = &temp;
    var c: c_int = undefined;
    _ = &c;
    var k: c_int = undefined;
    _ = &k;
    if (j.*.code_bits < @as(c_int, 16)) {
        stbi__grow_buffer_unsafe(j);
    }
    c = @bitCast(@as(c_uint, @truncate((j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 32) - FAST_BITS))))) & @as(stbi__uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(FAST_BITS)) - @as(c_int, 1)))))));
    k = h.*.fast[@bitCast(@as(isize, @intCast(c)))];
    if (k < @as(c_int, 255)) {
        var s: c_int = h.*.size[@bitCast(@as(isize, @intCast(k)))];
        _ = &s;
        if (s > j.*.code_bits) return -@as(c_int, 1);
        j.*.code_buffer <<= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, s))));
        j.*.code_bits -= s;
        return h.*.values[@bitCast(@as(isize, @intCast(k)))];
    }
    temp = j.*.code_buffer >> @intCast(@as(stbi__uint32, 16));
    {
        k = FAST_BITS + @as(c_int, 1);
        while (true) : (k += 1) if (temp < h.*.maxcode[@bitCast(@as(isize, @intCast(k)))]) break;
    }
    if (k == @as(c_int, 17)) {
        j.*.code_bits -= 16;
        return -@as(c_int, 1);
    }
    if (k > j.*.code_bits) return -@as(c_int, 1);
    c = @bitCast(@as(c_uint, @truncate(((j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 32) - k))))) & stbi__bmask[@bitCast(@as(isize, @intCast(k)))]) +% @as(stbi__uint32, @bitCast(@as(c_int, h.*.delta[@bitCast(@as(isize, @intCast(k)))]))))));
    if ((c < @as(c_int, 0)) or (c >= @as(c_int, 256))) return -@as(c_int, 1);
    while (true) {
        while (!(((j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 32) - @as(c_int, h.*.size[@bitCast(@as(isize, @intCast(c)))])))))) & stbi__bmask[h.*.size[@bitCast(@as(isize, @intCast(c)))]]) == @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, h.*.code[@bitCast(@as(isize, @intCast(c)))])))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(((j->code_buffer) >> (32 - h->size[c])) & stbi__bmask[h->size[c]]) == h->code[c]",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 2303);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    j.*.code_bits -= k;
    j.*.code_buffer <<= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, k))));
    return h.*.values[@bitCast(@as(isize, @intCast(c)))];
}
pub const stbi__jbias: [16]c_int = [16]c_int{
    0,
    -@as(c_int, 1),
    -@as(c_int, 3),
    -@as(c_int, 7),
    -@as(c_int, 15),
    -@as(c_int, 31),
    -@as(c_int, 63),
    -@as(c_int, 127),
    -@as(c_int, 255),
    -@as(c_int, 511),
    -@as(c_int, 1023),
    -@as(c_int, 2047),
    -@as(c_int, 4095),
    -@as(c_int, 8191),
    -@as(c_int, 16383),
    -@as(c_int, 32767),
};
pub fn stbi__extend_receive(j: [*c]stbi__jpeg, n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var k: c_uint = undefined;
    _ = &k;
    var sgn: c_int = undefined;
    _ = &sgn;
    if (j.*.code_bits < n) {
        stbi__grow_buffer_unsafe(j);
    }
    if (j.*.code_bits < n) return 0;
    sgn = @bitCast(@as(c_uint, @truncate(j.*.code_buffer >> @intCast(@as(stbi__uint32, 31)))));
    k = (j.*.code_buffer << @intCast(@as(stbi__uint32, @bitCast(@as(c_int, n))))) | (j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, -n & @as(c_int, 31))))));
    j.*.code_buffer = k & ~stbi__bmask[@bitCast(@as(isize, @intCast(n)))];
    k &= stbi__bmask[@bitCast(@as(isize, @intCast(n)))];
    j.*.code_bits -= n;
    return @bitCast(@as(c_uint, @truncate(k +% @as(c_uint, @bitCast(@as(c_int, stbi__jbias[@bitCast(@as(isize, @intCast(n)))] & (sgn - @as(c_int, 1))))))));
}
pub fn stbi__jpeg_get_bits(j: [*c]stbi__jpeg, n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var k: c_uint = undefined;
    _ = &k;
    if (j.*.code_bits < n) {
        stbi__grow_buffer_unsafe(j);
    }
    if (j.*.code_bits < n) return 0;
    k = (j.*.code_buffer << @intCast(@as(stbi__uint32, @bitCast(@as(c_int, n))))) | (j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, -n & @as(c_int, 31))))));
    j.*.code_buffer = k & ~stbi__bmask[@bitCast(@as(isize, @intCast(n)))];
    k &= stbi__bmask[@bitCast(@as(isize, @intCast(n)))];
    j.*.code_bits -= n;
    return @bitCast(@as(c_uint, @truncate(k)));
}
pub fn stbi__jpeg_get_bit(j: [*c]stbi__jpeg) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var k: c_uint = undefined;
    _ = &k;
    if (j.*.code_bits < @as(c_int, 1)) {
        stbi__grow_buffer_unsafe(j);
    }
    if (j.*.code_bits < @as(c_int, 1)) return 0;
    k = j.*.code_buffer;
    j.*.code_buffer <<= @intCast(@as(stbi__uint32, 1));
    j.*.code_bits -= 1;
    return @bitCast(@as(c_uint, @truncate(k & @as(c_uint, 2147483648))));
}
pub const stbi__jpeg_dezigzag: [79]stbi_uc = [79]stbi_uc{
    0,
    1,
    8,
    16,
    9,
    2,
    3,
    10,
    17,
    24,
    32,
    25,
    18,
    11,
    4,
    5,
    12,
    19,
    26,
    33,
    40,
    48,
    41,
    34,
    27,
    20,
    13,
    6,
    7,
    14,
    21,
    28,
    35,
    42,
    49,
    56,
    57,
    50,
    43,
    36,
    29,
    22,
    15,
    23,
    30,
    37,
    44,
    51,
    58,
    59,
    52,
    45,
    38,
    31,
    39,
    46,
    53,
    60,
    61,
    54,
    47,
    55,
    62,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
    63,
};
pub fn stbi__jpeg_decode_block(j: [*c]stbi__jpeg, data: [*c]c_short, hdc: [*c]stbi__huffman, hac: [*c]stbi__huffman, fac: [*c]stbi__int16, b: c_int, dequant: [*c]stbi__uint16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var diff: c_int = undefined;
    _ = &diff;
    var dc: c_int = undefined;
    _ = &dc;
    var k: c_int = undefined;
    _ = &k;
    var t: c_int = undefined;
    _ = &t;
    if (j.*.code_bits < @as(c_int, 16)) {
        stbi__grow_buffer_unsafe(j);
    }
    t = stbi__jpeg_huff_decode(j, hdc);
    if ((t < @as(c_int, 0)) or (t > @as(c_int, 15))) return stbi__err("Corrupt JPEG");
    _ = memset(@ptrCast(@alignCast(data)), 0, @as(c_ulong, 64) *% @sizeOf(@TypeOf(data[@as(c_int, 0)])));
    diff = if (t != 0) stbi__extend_receive(j, t) else @as(c_int, 0);
    if (!(stbi__addints_valid(j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred, diff) != 0)) return stbi__err("Corrupt JPEG");
    dc = j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred + diff;
    j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred = dc;
    if (!(stbi__mul2shorts_valid(dc, dequant[@as(c_int, 0)]) != 0)) return stbi__err("Corrupt JPEG");
    data[@as(c_int, 0)] = @truncate(dc * @as(c_int, dequant[@as(c_int, 0)]));
    k = 1;
    while (true) {
        var zig: c_uint = undefined;
        _ = &zig;
        var c: c_int = undefined;
        _ = &c;
        var r: c_int = undefined;
        _ = &r;
        var s: c_int = undefined;
        _ = &s;
        if (j.*.code_bits < @as(c_int, 16)) {
            stbi__grow_buffer_unsafe(j);
        }
        c = @bitCast(@as(c_uint, @truncate((j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 32) - FAST_BITS))))) & @as(stbi__uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(FAST_BITS)) - @as(c_int, 1)))))));
        r = fac[@bitCast(@as(isize, @intCast(c)))];
        if (r != 0) {
            k += (r >> @intCast(@as(c_int, 4))) & @as(c_int, 15);
            s = r & @as(c_int, 15);
            if (s > j.*.code_bits) return stbi__err("Combined length longer than code bits available");
            j.*.code_buffer <<= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, s))));
            j.*.code_bits -= s;
            zig = stbi__jpeg_dezigzag[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &k;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ];
            data[zig] = @truncate((r >> @intCast(@as(c_int, 8))) * @as(c_int, dequant[zig]));
        } else {
            var rs: c_int = stbi__jpeg_huff_decode(j, hac);
            _ = &rs;
            if (rs < @as(c_int, 0)) return stbi__err("Corrupt JPEG");
            s = rs & @as(c_int, 15);
            r = rs >> @intCast(@as(c_int, 4));
            if (s == @as(c_int, 0)) {
                if (rs != @as(c_int, 240)) break;
                k += 16;
            } else {
                k += r;
                zig = stbi__jpeg_dezigzag[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &k;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                data[zig] = @truncate(stbi__extend_receive(j, s) * @as(c_int, dequant[zig]));
            }
        }
        if (!(k < @as(c_int, 64))) break;
    }
    return 1;
}
pub fn stbi__jpeg_decode_block_prog_dc(j: [*c]stbi__jpeg, data: [*c]c_short, hdc: [*c]stbi__huffman, b: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var diff: c_int = undefined;
    _ = &diff;
    var dc: c_int = undefined;
    _ = &dc;
    var t: c_int = undefined;
    _ = &t;
    if (j.*.spec_end != @as(c_int, 0)) return stbi__err("Corrupt JPEG");
    if (j.*.code_bits < @as(c_int, 16)) {
        stbi__grow_buffer_unsafe(j);
    }
    if (j.*.succ_high == @as(c_int, 0)) {
        _ = memset(@ptrCast(@alignCast(data)), 0, @as(c_ulong, 64) *% @sizeOf(@TypeOf(data[@as(c_int, 0)])));
        t = stbi__jpeg_huff_decode(j, hdc);
        if ((t < @as(c_int, 0)) or (t > @as(c_int, 15))) return stbi__err("Corrupt JPEG");
        diff = if (t != 0) stbi__extend_receive(j, t) else @as(c_int, 0);
        if (!(stbi__addints_valid(j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred, diff) != 0)) return stbi__err("Corrupt JPEG");
        dc = j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred + diff;
        j.*.img_comp[@bitCast(@as(isize, @intCast(b)))].dc_pred = dc;
        if (!(stbi__mul2shorts_valid(dc, @as(c_int, 1) << @intCast(j.*.succ_low)) != 0)) return stbi__err("Corrupt JPEG");
        data[@as(c_int, 0)] = @truncate(dc * (@as(c_int, 1) << @intCast(j.*.succ_low)));
    } else {
        if (stbi__jpeg_get_bit(j) != 0) {
            {
                const ref = &data[@as(c_int, 0)];
                ref.* = @truncate(@as(c_int, ref.*) + @as(c_int, @as(c_short, @truncate(@as(c_int, 1) << @intCast(j.*.succ_low)))));
            }
        }
    }
    return 1;
}
pub fn stbi__jpeg_decode_block_prog_ac(j: [*c]stbi__jpeg, data: [*c]c_short, hac: [*c]stbi__huffman, fac: [*c]stbi__int16) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var k: c_int = undefined;
    _ = &k;
    if (j.*.spec_start == @as(c_int, 0)) return stbi__err("Corrupt JPEG");
    if (j.*.succ_high == @as(c_int, 0)) {
        var shift: c_int = j.*.succ_low;
        _ = &shift;
        if (j.*.eob_run != 0) {
            j.*.eob_run -= 1;
            return 1;
        }
        k = j.*.spec_start;
        while (true) {
            var zig: c_uint = undefined;
            _ = &zig;
            var c: c_int = undefined;
            _ = &c;
            var r: c_int = undefined;
            _ = &r;
            var s: c_int = undefined;
            _ = &s;
            if (j.*.code_bits < @as(c_int, 16)) {
                stbi__grow_buffer_unsafe(j);
            }
            c = @bitCast(@as(c_uint, @truncate((j.*.code_buffer >> @intCast(@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 32) - FAST_BITS))))) & @as(stbi__uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(FAST_BITS)) - @as(c_int, 1)))))));
            r = fac[@bitCast(@as(isize, @intCast(c)))];
            if (r != 0) {
                k += (r >> @intCast(@as(c_int, 4))) & @as(c_int, 15);
                s = r & @as(c_int, 15);
                if (s > j.*.code_bits) return stbi__err("Combined length longer than code bits available");
                j.*.code_buffer <<= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, s))));
                j.*.code_bits -= s;
                zig = stbi__jpeg_dezigzag[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &k;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                data[zig] = @truncate((r >> @intCast(@as(c_int, 8))) * (@as(c_int, 1) << @intCast(shift)));
            } else {
                var rs: c_int = stbi__jpeg_huff_decode(j, hac);
                _ = &rs;
                if (rs < @as(c_int, 0)) return stbi__err("Corrupt JPEG");
                s = rs & @as(c_int, 15);
                r = rs >> @intCast(@as(c_int, 4));
                if (s == @as(c_int, 0)) {
                    if (r < @as(c_int, 15)) {
                        j.*.eob_run = @as(c_int, 1) << @intCast(r);
                        if (r != 0) {
                            j.*.eob_run += stbi__jpeg_get_bits(j, r);
                        }
                        j.*.eob_run -= 1;
                        break;
                    }
                    k += 16;
                } else {
                    k += r;
                    zig = stbi__jpeg_dezigzag[
                        @bitCast(@as(isize, @intCast(blk: {
                            const ref = &k;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        })))
                    ];
                    data[zig] = @truncate(stbi__extend_receive(j, s) * (@as(c_int, 1) << @intCast(shift)));
                }
            }
            if (!(k <= j.*.spec_end)) break;
        }
    } else {
        var bit: c_short = @truncate(@as(c_int, 1) << @intCast(j.*.succ_low));
        _ = &bit;
        if (j.*.eob_run != 0) {
            j.*.eob_run -= 1;
            {
                k = j.*.spec_start;
                while (k <= j.*.spec_end) : (k += 1) {
                    var p: [*c]c_short = &data[stbi__jpeg_dezigzag[@bitCast(@as(isize, @intCast(k)))]];
                    _ = &p;
                    if (@as(c_int, p.*) != @as(c_int, 0)) if (stbi__jpeg_get_bit(j) != 0) if ((@as(c_int, p.*) & @as(c_int, bit)) == @as(c_int, 0)) {
                        if (@as(c_int, p.*) > @as(c_int, 0)) {
                            {
                                const ref = &p.*;
                                ref.* = @truncate(@as(c_int, ref.*) + @as(c_int, bit));
                            }
                        } else {
                            {
                                const ref = &p.*;
                                ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, bit));
                            }
                        }
                    };
                }
            }
        } else {
            k = j.*.spec_start;
            while (true) {
                var r: c_int = undefined;
                _ = &r;
                var s: c_int = undefined;
                _ = &s;
                var rs: c_int = stbi__jpeg_huff_decode(j, hac);
                _ = &rs;
                if (rs < @as(c_int, 0)) return stbi__err("Corrupt JPEG");
                s = rs & @as(c_int, 15);
                r = rs >> @intCast(@as(c_int, 4));
                if (s == @as(c_int, 0)) {
                    if (r < @as(c_int, 15)) {
                        j.*.eob_run = (@as(c_int, 1) << @intCast(r)) - @as(c_int, 1);
                        if (r != 0) {
                            j.*.eob_run += stbi__jpeg_get_bits(j, r);
                        }
                        r = 64;
                    } else {}
                } else {
                    if (s != @as(c_int, 1)) return stbi__err("Corrupt JPEG");
                    if (stbi__jpeg_get_bit(j) != 0) {
                        s = bit;
                    } else {
                        s = -@as(c_int, bit);
                    }
                }
                while (k <= j.*.spec_end) {
                    var p: [*c]c_short = &data[
                        stbi__jpeg_dezigzag[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &k;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ]
                    ];
                    _ = &p;
                    if (@as(c_int, p.*) != @as(c_int, 0)) {
                        if (stbi__jpeg_get_bit(j) != 0) if ((@as(c_int, p.*) & @as(c_int, bit)) == @as(c_int, 0)) {
                            if (@as(c_int, p.*) > @as(c_int, 0)) {
                                {
                                    const ref = &p.*;
                                    ref.* = @truncate(@as(c_int, ref.*) + @as(c_int, bit));
                                }
                            } else {
                                {
                                    const ref = &p.*;
                                    ref.* = @truncate(@as(c_int, ref.*) - @as(c_int, bit));
                                }
                            }
                        };
                    } else {
                        if (r == @as(c_int, 0)) {
                            p.* = @truncate(s);
                            break;
                        }
                        r -= 1;
                    }
                }
                if (!(k <= j.*.spec_end)) break;
            }
        }
    }
    return 1;
}
pub fn stbi__clamp(x: c_int) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    if (@as(c_uint, @bitCast(@as(c_int, x))) > @as(c_uint, 255)) {
        if (x < @as(c_int, 0)) return 0;
        if (x > @as(c_int, 255)) return 255;
    }
    return @bitCast(@as(i8, @truncate(x)));
}
pub fn stbi__idct_block(out: [*c]stbi_uc, out_stride: c_int, data: [*c]c_short) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var val: [64]c_int = undefined;
    _ = &val;
    var v: [*c]c_int = @ptrCast(@alignCast(&val));
    _ = &v;
    var o: [*c]stbi_uc = undefined;
    _ = &o;
    var d: [*c]c_short = data;
    _ = &d;
    {
        i = 0;
        while (i < @as(c_int, 8)) : ({
            i += 1;
            d += 1;
            v += 1;
        }) {
            if (((((((@as(c_int, d[@as(c_int, 8)]) == @as(c_int, 0)) and (@as(c_int, d[@as(c_int, 16)]) == @as(c_int, 0))) and (@as(c_int, d[@as(c_int, 24)]) == @as(c_int, 0))) and (@as(c_int, d[@as(c_int, 32)]) == @as(c_int, 0))) and (@as(c_int, d[@as(c_int, 40)]) == @as(c_int, 0))) and (@as(c_int, d[@as(c_int, 48)]) == @as(c_int, 0))) and (@as(c_int, d[@as(c_int, 56)]) == @as(c_int, 0))) {
                var dcterm: c_int = @as(c_int, d[@as(c_int, 0)]) * @as(c_int, 4);
                _ = &dcterm;
                v[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = blk_3: {
                                const tmp_4 = blk_4: {
                                    const tmp_5 = blk_5: {
                                        const tmp_6 = blk_6: {
                                            const tmp_7 = dcterm;
                                            v[@as(c_int, 56)] = tmp_7;
                                            break :blk_6 tmp_7;
                                        };
                                        v[@as(c_int, 48)] = tmp_6;
                                        break :blk_5 tmp_6;
                                    };
                                    v[@as(c_int, 40)] = tmp_5;
                                    break :blk_4 tmp_5;
                                };
                                v[@as(c_int, 32)] = tmp_4;
                                break :blk_3 tmp_4;
                            };
                            v[@as(c_int, 24)] = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        v[@as(c_int, 16)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    v[@as(c_int, 8)] = tmp;
                    break :blk tmp;
                };
            } else {
                var t0: c_int = undefined;
                _ = &t0;
                var t1: c_int = undefined;
                _ = &t1;
                var t2: c_int = undefined;
                _ = &t2;
                var t3: c_int = undefined;
                _ = &t3;
                var p1: c_int = undefined;
                _ = &p1;
                var p2: c_int = undefined;
                _ = &p2;
                var p3: c_int = undefined;
                _ = &p3;
                var p4: c_int = undefined;
                _ = &p4;
                var p5: c_int = undefined;
                _ = &p5;
                var x0: c_int = undefined;
                _ = &x0;
                var x1: c_int = undefined;
                _ = &x1;
                var x2: c_int = undefined;
                _ = &x2;
                var x3: c_int = undefined;
                _ = &x3;
                p2 = d[@as(c_int, 16)];
                p3 = d[@as(c_int, 48)];
                p1 = (p2 + p3) * @as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t2 = p1 + (p3 * @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
                t3 = p1 + (p2 * @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
                p2 = d[@as(c_int, 0)];
                p3 = d[@as(c_int, 32)];
                t0 = (p2 + p3) * @as(c_int, 4096);
                t1 = (p2 - p3) * @as(c_int, 4096);
                x0 = t0 + t3;
                x3 = t0 - t3;
                x1 = t1 + t2;
                x2 = t1 - t2;
                t0 = d[@as(c_int, 56)];
                t1 = d[@as(c_int, 40)];
                t2 = d[@as(c_int, 24)];
                t3 = d[@as(c_int, 8)];
                p3 = t0 + t2;
                p4 = t1 + t3;
                p1 = t0 + t3;
                p2 = t1 + t2;
                p5 = (p3 + p4) * @as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t0 = t0 * @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t1 = t1 * @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t2 = t2 * @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t3 = t3 * @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                p1 = p5 + (p1 * @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
                p2 = p5 + (p2 * @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
                p3 = p3 * @as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                p4 = p4 * @as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
                t3 += p1 + p4;
                t2 += p2 + p3;
                t1 += p2 + p4;
                t0 += p1 + p3;
                x0 += 512;
                x1 += 512;
                x2 += 512;
                x3 += 512;
                v[@as(c_int, 0)] = (x0 + t3) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 56)] = (x0 - t3) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 8)] = (x1 + t2) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 48)] = (x1 - t2) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 16)] = (x2 + t1) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 40)] = (x2 - t1) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 24)] = (x3 + t0) >> @intCast(@as(c_int, 10));
                v[@as(c_int, 32)] = (x3 - t0) >> @intCast(@as(c_int, 10));
            }
        }
    }
    {
        i = 0;
        v = @ptrCast(@alignCast(&val));
        o = out;
        while (i < @as(c_int, 8)) : ({
            i += 1;
            v += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            o += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        }) {
            var t0: c_int = undefined;
            _ = &t0;
            var t1: c_int = undefined;
            _ = &t1;
            var t2: c_int = undefined;
            _ = &t2;
            var t3: c_int = undefined;
            _ = &t3;
            var p1: c_int = undefined;
            _ = &p1;
            var p2: c_int = undefined;
            _ = &p2;
            var p3: c_int = undefined;
            _ = &p3;
            var p4: c_int = undefined;
            _ = &p4;
            var p5: c_int = undefined;
            _ = &p5;
            var x0: c_int = undefined;
            _ = &x0;
            var x1: c_int = undefined;
            _ = &x1;
            var x2: c_int = undefined;
            _ = &x2;
            var x3: c_int = undefined;
            _ = &x3;
            p2 = v[@as(c_int, 2)];
            p3 = v[@as(c_int, 6)];
            p1 = (p2 + p3) * @as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t2 = p1 + (p3 * @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
            t3 = p1 + (p2 * @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
            p2 = v[@as(c_int, 0)];
            p3 = v[@as(c_int, 4)];
            t0 = (p2 + p3) * @as(c_int, 4096);
            t1 = (p2 - p3) * @as(c_int, 4096);
            x0 = t0 + t3;
            x3 = t0 - t3;
            x1 = t1 + t2;
            x2 = t1 - t2;
            t0 = v[@as(c_int, 7)];
            t1 = v[@as(c_int, 5)];
            t2 = v[@as(c_int, 3)];
            t3 = v[@as(c_int, 1)];
            p3 = t0 + t2;
            p4 = t1 + t3;
            p1 = t0 + t3;
            p2 = t1 + t2;
            p5 = (p3 + p4) * @as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t0 = t0 * @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t1 = t1 * @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t2 = t2 * @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t3 = t3 * @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            p1 = p5 + (p1 * @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
            p2 = p5 + (p2 * @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))));
            p3 = p3 * @as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            p4 = p4 * @as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)));
            t3 += p1 + p4;
            t2 += p2 + p3;
            t1 += p2 + p4;
            t0 += p1 + p3;
            x0 += @as(c_int, 65536) + (@as(c_int, 128) << @intCast(@as(c_int, 17)));
            x1 += @as(c_int, 65536) + (@as(c_int, 128) << @intCast(@as(c_int, 17)));
            x2 += @as(c_int, 65536) + (@as(c_int, 128) << @intCast(@as(c_int, 17)));
            x3 += @as(c_int, 65536) + (@as(c_int, 128) << @intCast(@as(c_int, 17)));
            o[@as(c_int, 0)] = stbi__clamp((x0 + t3) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 7)] = stbi__clamp((x0 - t3) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 1)] = stbi__clamp((x1 + t2) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 6)] = stbi__clamp((x1 - t2) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 2)] = stbi__clamp((x2 + t1) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 5)] = stbi__clamp((x2 - t1) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 3)] = stbi__clamp((x3 + t0) >> @intCast(@as(c_int, 17)));
            o[@as(c_int, 4)] = stbi__clamp((x3 - t0) >> @intCast(@as(c_int, 17)));
        }
    }
}
pub fn stbi__idct_simd(arg_out: [*c]stbi_uc, out_stride: c_int, data: [*c]c_short) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var out = arg_out;
    _ = &out;
    var row0: __m128i = undefined;
    _ = &row0;
    var row1: __m128i = undefined;
    _ = &row1;
    var row2: __m128i = undefined;
    _ = &row2;
    var row3: __m128i = undefined;
    _ = &row3;
    var row4: __m128i = undefined;
    _ = &row4;
    var row5: __m128i = undefined;
    _ = &row5;
    var row6: __m128i = undefined;
    _ = &row6;
    var row7: __m128i = undefined;
    _ = &row7;
    var tmp: __m128i = undefined;
    _ = &tmp;
    var rot0_0: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 1.847759) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot0_0;
    var rot0_1: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.765367) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 0.541196) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot0_1;
    var rot1_0: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 0.899976) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot1_0;
    var rot1_1: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((@as(f32, 1.175876) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((-@as(f32, 2.562916) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot1_1;
    var rot2_0: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 0.298631) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot2_0;
    var rot2_1: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 1.961571) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 3.072711) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot2_1;
    var rot3_0: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 2.05312) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot3_0;
    var rot3_1: __m128i = _mm_setr_epi16(@truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))), @truncate(@as(c_int, @intFromFloat((-@as(f32, 0.390181) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5))) + @as(c_int, @intFromFloat((@as(f32, 1.501321) * @as(f32, @floatFromInt(@as(c_int, 4096)))) + @as(f32, 0.5)))));
    _ = &rot3_1;
    var bias_0: __m128i = _mm_set1_epi32(512);
    _ = &bias_0;
    var bias_1: __m128i = _mm_set1_epi32(@as(c_int, 65536) + (@as(c_int, 128) << @intCast(@as(c_int, 17))));
    _ = &bias_1;
    row0 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0) * @as(c_int, 8))))))));
    row1 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1) * @as(c_int, 8))))))));
    row2 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @as(c_int, 8))))))));
    row3 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3) * @as(c_int, 8))))))));
    row4 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4) * @as(c_int, 8))))))));
    row5 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5) * @as(c_int, 8))))))));
    row6 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6) * @as(c_int, 8))))))));
    row7 = _mm_load_si128(@ptrCast(@alignCast(data + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 7) * @as(c_int, 8))))))));
    while (true) {
        var rot0_0lo: __m128i = _mm_unpacklo_epi16(row2, row6);
        _ = &rot0_0lo;
        var rot0_0hi: __m128i = _mm_unpackhi_epi16(row2, row6);
        _ = &rot0_0hi;
        var t2e_l: __m128i = _mm_madd_epi16(rot0_0lo, rot0_0);
        _ = &t2e_l;
        var t2e_h: __m128i = _mm_madd_epi16(rot0_0hi, rot0_0);
        _ = &t2e_h;
        var t3e_l: __m128i = _mm_madd_epi16(rot0_0lo, rot0_1);
        _ = &t3e_l;
        var t3e_h: __m128i = _mm_madd_epi16(rot0_0hi, rot0_1);
        _ = &t3e_h;
        var sum04: __m128i = _mm_add_epi16(row0, row4);
        _ = &sum04;
        var dif04: __m128i = _mm_sub_epi16(row0, row4);
        _ = &dif04;
        var t0e_l: __m128i = _mm_srai_epi32(_mm_unpacklo_epi16(_mm_setzero_si128(), sum04), 4);
        _ = &t0e_l;
        var t0e_h: __m128i = _mm_srai_epi32(_mm_unpackhi_epi16(_mm_setzero_si128(), sum04), 4);
        _ = &t0e_h;
        var t1e_l: __m128i = _mm_srai_epi32(_mm_unpacklo_epi16(_mm_setzero_si128(), dif04), 4);
        _ = &t1e_l;
        var t1e_h: __m128i = _mm_srai_epi32(_mm_unpackhi_epi16(_mm_setzero_si128(), dif04), 4);
        _ = &t1e_h;
        var x0_l: __m128i = _mm_add_epi32(t0e_l, t3e_l);
        _ = &x0_l;
        var x0_h: __m128i = _mm_add_epi32(t0e_h, t3e_h);
        _ = &x0_h;
        var x3_l: __m128i = _mm_sub_epi32(t0e_l, t3e_l);
        _ = &x3_l;
        var x3_h: __m128i = _mm_sub_epi32(t0e_h, t3e_h);
        _ = &x3_h;
        var x1_l: __m128i = _mm_add_epi32(t1e_l, t2e_l);
        _ = &x1_l;
        var x1_h: __m128i = _mm_add_epi32(t1e_h, t2e_h);
        _ = &x1_h;
        var x2_l: __m128i = _mm_sub_epi32(t1e_l, t2e_l);
        _ = &x2_l;
        var x2_h: __m128i = _mm_sub_epi32(t1e_h, t2e_h);
        _ = &x2_h;
        var rot2_0lo: __m128i = _mm_unpacklo_epi16(row7, row3);
        _ = &rot2_0lo;
        var rot2_0hi: __m128i = _mm_unpackhi_epi16(row7, row3);
        _ = &rot2_0hi;
        var y0o_l: __m128i = _mm_madd_epi16(rot2_0lo, rot2_0);
        _ = &y0o_l;
        var y0o_h: __m128i = _mm_madd_epi16(rot2_0hi, rot2_0);
        _ = &y0o_h;
        var y2o_l: __m128i = _mm_madd_epi16(rot2_0lo, rot2_1);
        _ = &y2o_l;
        var y2o_h: __m128i = _mm_madd_epi16(rot2_0hi, rot2_1);
        _ = &y2o_h;
        var rot3_0lo: __m128i = _mm_unpacklo_epi16(row5, row1);
        _ = &rot3_0lo;
        var rot3_0hi: __m128i = _mm_unpackhi_epi16(row5, row1);
        _ = &rot3_0hi;
        var y1o_l: __m128i = _mm_madd_epi16(rot3_0lo, rot3_0);
        _ = &y1o_l;
        var y1o_h: __m128i = _mm_madd_epi16(rot3_0hi, rot3_0);
        _ = &y1o_h;
        var y3o_l: __m128i = _mm_madd_epi16(rot3_0lo, rot3_1);
        _ = &y3o_l;
        var y3o_h: __m128i = _mm_madd_epi16(rot3_0hi, rot3_1);
        _ = &y3o_h;
        var sum17: __m128i = _mm_add_epi16(row1, row7);
        _ = &sum17;
        var sum35: __m128i = _mm_add_epi16(row3, row5);
        _ = &sum35;
        var rot1_0lo: __m128i = _mm_unpacklo_epi16(sum17, sum35);
        _ = &rot1_0lo;
        var rot1_0hi: __m128i = _mm_unpackhi_epi16(sum17, sum35);
        _ = &rot1_0hi;
        var y4o_l: __m128i = _mm_madd_epi16(rot1_0lo, rot1_0);
        _ = &y4o_l;
        var y4o_h: __m128i = _mm_madd_epi16(rot1_0hi, rot1_0);
        _ = &y4o_h;
        var y5o_l: __m128i = _mm_madd_epi16(rot1_0lo, rot1_1);
        _ = &y5o_l;
        var y5o_h: __m128i = _mm_madd_epi16(rot1_0hi, rot1_1);
        _ = &y5o_h;
        var x4_l: __m128i = _mm_add_epi32(y0o_l, y4o_l);
        _ = &x4_l;
        var x4_h: __m128i = _mm_add_epi32(y0o_h, y4o_h);
        _ = &x4_h;
        var x5_l: __m128i = _mm_add_epi32(y1o_l, y5o_l);
        _ = &x5_l;
        var x5_h: __m128i = _mm_add_epi32(y1o_h, y5o_h);
        _ = &x5_h;
        var x6_l: __m128i = _mm_add_epi32(y2o_l, y5o_l);
        _ = &x6_l;
        var x6_h: __m128i = _mm_add_epi32(y2o_h, y5o_h);
        _ = &x6_h;
        var x7_l: __m128i = _mm_add_epi32(y3o_l, y4o_l);
        _ = &x7_l;
        var x7_h: __m128i = _mm_add_epi32(y3o_h, y4o_h);
        _ = &x7_h;
        {
            var abiased_l: __m128i = _mm_add_epi32(x0_l, bias_0);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x0_h, bias_0);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x7_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x7_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x7_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x7_h);
            _ = &dif_h;
            row0 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 10), _mm_srai_epi32(sum_h, 10));
            row7 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 10), _mm_srai_epi32(dif_h, 10));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x1_l, bias_0);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x1_h, bias_0);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x6_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x6_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x6_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x6_h);
            _ = &dif_h;
            row1 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 10), _mm_srai_epi32(sum_h, 10));
            row6 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 10), _mm_srai_epi32(dif_h, 10));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x2_l, bias_0);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x2_h, bias_0);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x5_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x5_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x5_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x5_h);
            _ = &dif_h;
            row2 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 10), _mm_srai_epi32(sum_h, 10));
            row5 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 10), _mm_srai_epi32(dif_h, 10));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x3_l, bias_0);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x3_h, bias_0);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x4_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x4_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x4_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x4_h);
            _ = &dif_h;
            row3 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 10), _mm_srai_epi32(sum_h, 10));
            row4 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 10), _mm_srai_epi32(dif_h, 10));
        }
        if (!false) break;
    }
    {
        tmp = row0;
        row0 = _mm_unpacklo_epi16(row0, row4);
        row4 = _mm_unpackhi_epi16(tmp, row4);
        tmp = row1;
        row1 = _mm_unpacklo_epi16(row1, row5);
        row5 = _mm_unpackhi_epi16(tmp, row5);
        tmp = row2;
        row2 = _mm_unpacklo_epi16(row2, row6);
        row6 = _mm_unpackhi_epi16(tmp, row6);
        tmp = row3;
        row3 = _mm_unpacklo_epi16(row3, row7);
        row7 = _mm_unpackhi_epi16(tmp, row7);
        tmp = row0;
        row0 = _mm_unpacklo_epi16(row0, row2);
        row2 = _mm_unpackhi_epi16(tmp, row2);
        tmp = row1;
        row1 = _mm_unpacklo_epi16(row1, row3);
        row3 = _mm_unpackhi_epi16(tmp, row3);
        tmp = row4;
        row4 = _mm_unpacklo_epi16(row4, row6);
        row6 = _mm_unpackhi_epi16(tmp, row6);
        tmp = row5;
        row5 = _mm_unpacklo_epi16(row5, row7);
        row7 = _mm_unpackhi_epi16(tmp, row7);
        tmp = row0;
        row0 = _mm_unpacklo_epi16(row0, row1);
        row1 = _mm_unpackhi_epi16(tmp, row1);
        tmp = row2;
        row2 = _mm_unpacklo_epi16(row2, row3);
        row3 = _mm_unpackhi_epi16(tmp, row3);
        tmp = row4;
        row4 = _mm_unpacklo_epi16(row4, row5);
        row5 = _mm_unpackhi_epi16(tmp, row5);
        tmp = row6;
        row6 = _mm_unpacklo_epi16(row6, row7);
        row7 = _mm_unpackhi_epi16(tmp, row7);
    }
    while (true) {
        var rot0_0lo: __m128i = _mm_unpacklo_epi16(row2, row6);
        _ = &rot0_0lo;
        var rot0_0hi: __m128i = _mm_unpackhi_epi16(row2, row6);
        _ = &rot0_0hi;
        var t2e_l: __m128i = _mm_madd_epi16(rot0_0lo, rot0_0);
        _ = &t2e_l;
        var t2e_h: __m128i = _mm_madd_epi16(rot0_0hi, rot0_0);
        _ = &t2e_h;
        var t3e_l: __m128i = _mm_madd_epi16(rot0_0lo, rot0_1);
        _ = &t3e_l;
        var t3e_h: __m128i = _mm_madd_epi16(rot0_0hi, rot0_1);
        _ = &t3e_h;
        var sum04: __m128i = _mm_add_epi16(row0, row4);
        _ = &sum04;
        var dif04: __m128i = _mm_sub_epi16(row0, row4);
        _ = &dif04;
        var t0e_l: __m128i = _mm_srai_epi32(_mm_unpacklo_epi16(_mm_setzero_si128(), sum04), 4);
        _ = &t0e_l;
        var t0e_h: __m128i = _mm_srai_epi32(_mm_unpackhi_epi16(_mm_setzero_si128(), sum04), 4);
        _ = &t0e_h;
        var t1e_l: __m128i = _mm_srai_epi32(_mm_unpacklo_epi16(_mm_setzero_si128(), dif04), 4);
        _ = &t1e_l;
        var t1e_h: __m128i = _mm_srai_epi32(_mm_unpackhi_epi16(_mm_setzero_si128(), dif04), 4);
        _ = &t1e_h;
        var x0_l: __m128i = _mm_add_epi32(t0e_l, t3e_l);
        _ = &x0_l;
        var x0_h: __m128i = _mm_add_epi32(t0e_h, t3e_h);
        _ = &x0_h;
        var x3_l: __m128i = _mm_sub_epi32(t0e_l, t3e_l);
        _ = &x3_l;
        var x3_h: __m128i = _mm_sub_epi32(t0e_h, t3e_h);
        _ = &x3_h;
        var x1_l: __m128i = _mm_add_epi32(t1e_l, t2e_l);
        _ = &x1_l;
        var x1_h: __m128i = _mm_add_epi32(t1e_h, t2e_h);
        _ = &x1_h;
        var x2_l: __m128i = _mm_sub_epi32(t1e_l, t2e_l);
        _ = &x2_l;
        var x2_h: __m128i = _mm_sub_epi32(t1e_h, t2e_h);
        _ = &x2_h;
        var rot2_0lo: __m128i = _mm_unpacklo_epi16(row7, row3);
        _ = &rot2_0lo;
        var rot2_0hi: __m128i = _mm_unpackhi_epi16(row7, row3);
        _ = &rot2_0hi;
        var y0o_l: __m128i = _mm_madd_epi16(rot2_0lo, rot2_0);
        _ = &y0o_l;
        var y0o_h: __m128i = _mm_madd_epi16(rot2_0hi, rot2_0);
        _ = &y0o_h;
        var y2o_l: __m128i = _mm_madd_epi16(rot2_0lo, rot2_1);
        _ = &y2o_l;
        var y2o_h: __m128i = _mm_madd_epi16(rot2_0hi, rot2_1);
        _ = &y2o_h;
        var rot3_0lo: __m128i = _mm_unpacklo_epi16(row5, row1);
        _ = &rot3_0lo;
        var rot3_0hi: __m128i = _mm_unpackhi_epi16(row5, row1);
        _ = &rot3_0hi;
        var y1o_l: __m128i = _mm_madd_epi16(rot3_0lo, rot3_0);
        _ = &y1o_l;
        var y1o_h: __m128i = _mm_madd_epi16(rot3_0hi, rot3_0);
        _ = &y1o_h;
        var y3o_l: __m128i = _mm_madd_epi16(rot3_0lo, rot3_1);
        _ = &y3o_l;
        var y3o_h: __m128i = _mm_madd_epi16(rot3_0hi, rot3_1);
        _ = &y3o_h;
        var sum17: __m128i = _mm_add_epi16(row1, row7);
        _ = &sum17;
        var sum35: __m128i = _mm_add_epi16(row3, row5);
        _ = &sum35;
        var rot1_0lo: __m128i = _mm_unpacklo_epi16(sum17, sum35);
        _ = &rot1_0lo;
        var rot1_0hi: __m128i = _mm_unpackhi_epi16(sum17, sum35);
        _ = &rot1_0hi;
        var y4o_l: __m128i = _mm_madd_epi16(rot1_0lo, rot1_0);
        _ = &y4o_l;
        var y4o_h: __m128i = _mm_madd_epi16(rot1_0hi, rot1_0);
        _ = &y4o_h;
        var y5o_l: __m128i = _mm_madd_epi16(rot1_0lo, rot1_1);
        _ = &y5o_l;
        var y5o_h: __m128i = _mm_madd_epi16(rot1_0hi, rot1_1);
        _ = &y5o_h;
        var x4_l: __m128i = _mm_add_epi32(y0o_l, y4o_l);
        _ = &x4_l;
        var x4_h: __m128i = _mm_add_epi32(y0o_h, y4o_h);
        _ = &x4_h;
        var x5_l: __m128i = _mm_add_epi32(y1o_l, y5o_l);
        _ = &x5_l;
        var x5_h: __m128i = _mm_add_epi32(y1o_h, y5o_h);
        _ = &x5_h;
        var x6_l: __m128i = _mm_add_epi32(y2o_l, y5o_l);
        _ = &x6_l;
        var x6_h: __m128i = _mm_add_epi32(y2o_h, y5o_h);
        _ = &x6_h;
        var x7_l: __m128i = _mm_add_epi32(y3o_l, y4o_l);
        _ = &x7_l;
        var x7_h: __m128i = _mm_add_epi32(y3o_h, y4o_h);
        _ = &x7_h;
        {
            var abiased_l: __m128i = _mm_add_epi32(x0_l, bias_1);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x0_h, bias_1);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x7_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x7_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x7_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x7_h);
            _ = &dif_h;
            row0 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 17), _mm_srai_epi32(sum_h, 17));
            row7 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 17), _mm_srai_epi32(dif_h, 17));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x1_l, bias_1);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x1_h, bias_1);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x6_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x6_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x6_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x6_h);
            _ = &dif_h;
            row1 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 17), _mm_srai_epi32(sum_h, 17));
            row6 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 17), _mm_srai_epi32(dif_h, 17));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x2_l, bias_1);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x2_h, bias_1);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x5_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x5_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x5_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x5_h);
            _ = &dif_h;
            row2 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 17), _mm_srai_epi32(sum_h, 17));
            row5 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 17), _mm_srai_epi32(dif_h, 17));
        }
        {
            var abiased_l: __m128i = _mm_add_epi32(x3_l, bias_1);
            _ = &abiased_l;
            var abiased_h: __m128i = _mm_add_epi32(x3_h, bias_1);
            _ = &abiased_h;
            var sum_l: __m128i = _mm_add_epi32(abiased_l, x4_l);
            _ = &sum_l;
            var sum_h: __m128i = _mm_add_epi32(abiased_h, x4_h);
            _ = &sum_h;
            var dif_l: __m128i = _mm_sub_epi32(abiased_l, x4_l);
            _ = &dif_l;
            var dif_h: __m128i = _mm_sub_epi32(abiased_h, x4_h);
            _ = &dif_h;
            row3 = _mm_packs_epi32(_mm_srai_epi32(sum_l, 17), _mm_srai_epi32(sum_h, 17));
            row4 = _mm_packs_epi32(_mm_srai_epi32(dif_l, 17), _mm_srai_epi32(dif_h, 17));
        }
        if (!false) break;
    }
    {
        var p0: __m128i = _mm_packus_epi16(row0, row1);
        _ = &p0;
        var p1: __m128i = _mm_packus_epi16(row2, row3);
        _ = &p1;
        var p2: __m128i = _mm_packus_epi16(row4, row5);
        _ = &p2;
        var p3: __m128i = _mm_packus_epi16(row6, row7);
        _ = &p3;
        tmp = p0;
        p0 = _mm_unpacklo_epi8(p0, p2);
        p2 = _mm_unpackhi_epi8(tmp, p2);
        tmp = p1;
        p1 = _mm_unpacklo_epi8(p1, p3);
        p3 = _mm_unpackhi_epi8(tmp, p3);
        tmp = p0;
        p0 = _mm_unpacklo_epi8(p0, p1);
        p1 = _mm_unpackhi_epi8(tmp, p1);
        tmp = p2;
        p2 = _mm_unpacklo_epi8(p2, p3);
        p3 = _mm_unpackhi_epi8(tmp, p3);
        tmp = p0;
        p0 = _mm_unpacklo_epi8(p0, p2);
        p2 = _mm_unpackhi_epi8(tmp, p2);
        tmp = p1;
        p1 = _mm_unpacklo_epi8(p1, p3);
        p3 = _mm_unpackhi_epi8(tmp, p3);
        _mm_storel_epi64(@ptrCast(@alignCast(out)), p0);
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(p0)), @as(c_int, 78)))));
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), p2);
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(p2)), @as(c_int, 78)))));
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), p1);
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(p1)), @as(c_int, 78)))));
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), p3);
        out += @as(usize, @bitCast(@as(isize, @intCast(out_stride))));
        _mm_storel_epi64(@ptrCast(@alignCast(out)), @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(p3)), @as(c_int, 78)))));
    }
}
pub fn stbi__get_marker(j: [*c]stbi__jpeg) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    var x: stbi_uc = undefined;
    _ = &x;
    if (@as(c_int, j.*.marker) != STBI__MARKER_none) {
        x = j.*.marker;
        j.*.marker = STBI__MARKER_none;
        return x;
    }
    x = stbi__get8(j.*.s);
    if (@as(c_int, x) != @as(c_int, 255)) return STBI__MARKER_none;
    while (@as(c_int, x) == @as(c_int, 255)) {
        x = stbi__get8(j.*.s);
    }
    return x;
}
pub fn stbi__jpeg_reset(j: [*c]stbi__jpeg) callconv(.c) void {
    @setEvalBranchQuota(100000);
    j.*.code_bits = 0;
    j.*.code_buffer = 0;
    j.*.nomore = 0;
    j.*.img_comp[@as(c_int, 0)].dc_pred = blk: {
        const tmp = blk_1: {
            const tmp_2 = blk_2: {
                const tmp_3 = @as(c_int, 0);
                j.*.img_comp[@as(c_int, 3)].dc_pred = tmp_3;
                break :blk_2 tmp_3;
            };
            j.*.img_comp[@as(c_int, 2)].dc_pred = tmp_2;
            break :blk_1 tmp_2;
        };
        j.*.img_comp[@as(c_int, 1)].dc_pred = tmp;
        break :blk tmp;
    };
    j.*.marker = STBI__MARKER_none;
    j.*.todo = if (j.*.restart_interval != 0) j.*.restart_interval else @as(c_int, 2147483647);
    j.*.eob_run = 0;
}
pub fn stbi__parse_entropy_coded_data(z: [*c]stbi__jpeg) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    stbi__jpeg_reset(z);
    if (!(z.*.progressive != 0)) {
        if (z.*.scan_n == @as(c_int, 1)) {
            var i: c_int = undefined;
            _ = &i;
            var j: c_int = undefined;
            _ = &j;
            var data: [64]c_short align(16) = undefined;
            _ = &data;
            var n: c_int = z.*.order[@as(c_int, 0)];
            _ = &n;
            var w: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].x + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
            _ = &w;
            var h: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].y + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
            _ = &h;
            {
                j = 0;
                while (j < h) : (j += 1) {
                    {
                        i = 0;
                        while (i < w) : (i += 1) {
                            var ha: c_int = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].ha;
                            _ = &ha;
                            if (!(stbi__jpeg_decode_block(z, @ptrCast(@alignCast(&data)), @as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_dc))) + @as(usize, @bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].hd)))), @as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_ac))) + @as(usize, @bitCast(@as(isize, @intCast(ha)))), @ptrCast(@alignCast(&z.*.fast_ac[@bitCast(@as(isize, @intCast(ha)))])), n, @ptrCast(@alignCast(&z.*.dequant[@bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].tq)))]))) != 0)) return 0;
                            z.*.idct_block_kernel.?((z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].data + @as(usize, @bitCast(@as(isize, @intCast((z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2 * j) * @as(c_int, 8)))))) + @as(usize, @bitCast(@as(isize, @intCast(i * @as(c_int, 8))))), z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2, @ptrCast(@alignCast(&data)));
                            if ((blk: {
                                const ref = &z.*.todo;
                                ref.* -= 1;
                                break :blk ref.*;
                            }) <= @as(c_int, 0)) {
                                if (z.*.code_bits < @as(c_int, 24)) {
                                    stbi__grow_buffer_unsafe(z);
                                }
                                if (!((@as(c_int, z.*.marker) >= @as(c_int, 208)) and (@as(c_int, z.*.marker) <= @as(c_int, 215)))) return 1;
                                stbi__jpeg_reset(z);
                            }
                        }
                    }
                }
            }
            return 1;
        } else {
            var i: c_int = undefined;
            _ = &i;
            var j: c_int = undefined;
            _ = &j;
            var k: c_int = undefined;
            _ = &k;
            var x: c_int = undefined;
            _ = &x;
            var y: c_int = undefined;
            _ = &y;
            var data: [64]c_short align(16) = undefined;
            _ = &data;
            {
                j = 0;
                while (j < z.*.img_mcu_y) : (j += 1) {
                    {
                        i = 0;
                        while (i < z.*.img_mcu_x) : (i += 1) {
                            {
                                k = 0;
                                while (k < z.*.scan_n) : (k += 1) {
                                    var n: c_int = z.*.order[@bitCast(@as(isize, @intCast(k)))];
                                    _ = &n;
                                    {
                                        y = 0;
                                        while (y < z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].v) : (y += 1) {
                                            {
                                                x = 0;
                                                while (x < z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].h) : (x += 1) {
                                                    var x2: c_int = ((i * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].h) + x) * @as(c_int, 8);
                                                    _ = &x2;
                                                    var y2: c_int = ((j * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].v) + y) * @as(c_int, 8);
                                                    _ = &y2;
                                                    var ha: c_int = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].ha;
                                                    _ = &ha;
                                                    if (!(stbi__jpeg_decode_block(z, @ptrCast(@alignCast(&data)), @as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_dc))) + @as(usize, @bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].hd)))), @as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_ac))) + @as(usize, @bitCast(@as(isize, @intCast(ha)))), @ptrCast(@alignCast(&z.*.fast_ac[@bitCast(@as(isize, @intCast(ha)))])), n, @ptrCast(@alignCast(&z.*.dequant[@bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].tq)))]))) != 0)) return 0;
                                                    z.*.idct_block_kernel.?((z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].data + @as(usize, @bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2 * y2))))) + @as(usize, @bitCast(@as(isize, @intCast(x2)))), z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2, @ptrCast(@alignCast(&data)));
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((blk: {
                                const ref = &z.*.todo;
                                ref.* -= 1;
                                break :blk ref.*;
                            }) <= @as(c_int, 0)) {
                                if (z.*.code_bits < @as(c_int, 24)) {
                                    stbi__grow_buffer_unsafe(z);
                                }
                                if (!((@as(c_int, z.*.marker) >= @as(c_int, 208)) and (@as(c_int, z.*.marker) <= @as(c_int, 215)))) return 1;
                                stbi__jpeg_reset(z);
                            }
                        }
                    }
                }
            }
            return 1;
        }
    } else {
        if (z.*.scan_n == @as(c_int, 1)) {
            var i: c_int = undefined;
            _ = &i;
            var j: c_int = undefined;
            _ = &j;
            var n: c_int = z.*.order[@as(c_int, 0)];
            _ = &n;
            var w: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].x + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
            _ = &w;
            var h: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].y + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
            _ = &h;
            {
                j = 0;
                while (j < h) : (j += 1) {
                    {
                        i = 0;
                        while (i < w) : (i += 1) {
                            var data: [*c]c_short = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64) * (i + (j * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff_w))))));
                            _ = &data;
                            if (z.*.spec_start == @as(c_int, 0)) {
                                if (!(stbi__jpeg_decode_block_prog_dc(z, data, &z.*.huff_dc[@bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].hd)))], n) != 0)) return 0;
                            } else {
                                var ha: c_int = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].ha;
                                _ = &ha;
                                if (!(stbi__jpeg_decode_block_prog_ac(z, data, &z.*.huff_ac[@bitCast(@as(isize, @intCast(ha)))], @ptrCast(@alignCast(&z.*.fast_ac[@bitCast(@as(isize, @intCast(ha)))]))) != 0)) return 0;
                            }
                            if ((blk: {
                                const ref = &z.*.todo;
                                ref.* -= 1;
                                break :blk ref.*;
                            }) <= @as(c_int, 0)) {
                                if (z.*.code_bits < @as(c_int, 24)) {
                                    stbi__grow_buffer_unsafe(z);
                                }
                                if (!((@as(c_int, z.*.marker) >= @as(c_int, 208)) and (@as(c_int, z.*.marker) <= @as(c_int, 215)))) return 1;
                                stbi__jpeg_reset(z);
                            }
                        }
                    }
                }
            }
            return 1;
        } else {
            var i: c_int = undefined;
            _ = &i;
            var j: c_int = undefined;
            _ = &j;
            var k: c_int = undefined;
            _ = &k;
            var x: c_int = undefined;
            _ = &x;
            var y: c_int = undefined;
            _ = &y;
            {
                j = 0;
                while (j < z.*.img_mcu_y) : (j += 1) {
                    {
                        i = 0;
                        while (i < z.*.img_mcu_x) : (i += 1) {
                            {
                                k = 0;
                                while (k < z.*.scan_n) : (k += 1) {
                                    var n: c_int = z.*.order[@bitCast(@as(isize, @intCast(k)))];
                                    _ = &n;
                                    {
                                        y = 0;
                                        while (y < z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].v) : (y += 1) {
                                            {
                                                x = 0;
                                                while (x < z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].h) : (x += 1) {
                                                    var x2: c_int = (i * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].h) + x;
                                                    _ = &x2;
                                                    var y2: c_int = (j * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].v) + y;
                                                    _ = &y2;
                                                    var data: [*c]c_short = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64) * (x2 + (y2 * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff_w))))));
                                                    _ = &data;
                                                    if (!(stbi__jpeg_decode_block_prog_dc(z, data, &z.*.huff_dc[@bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].hd)))], n) != 0)) return 0;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((blk: {
                                const ref = &z.*.todo;
                                ref.* -= 1;
                                break :blk ref.*;
                            }) <= @as(c_int, 0)) {
                                if (z.*.code_bits < @as(c_int, 24)) {
                                    stbi__grow_buffer_unsafe(z);
                                }
                                if (!((@as(c_int, z.*.marker) >= @as(c_int, 208)) and (@as(c_int, z.*.marker) <= @as(c_int, 215)))) return 1;
                                stbi__jpeg_reset(z);
                            }
                        }
                    }
                }
            }
            return 1;
        }
    }
    return undefined;
}
pub fn stbi__jpeg_dequantize(data: [*c]c_short, dequant: [*c]stbi__uint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < @as(c_int, 64)) : (i += 1) {
            {
                const ref = &data[@bitCast(@as(isize, @intCast(i)))];
                ref.* = @truncate(@as(c_int, ref.*) * @as(c_int, dequant[@bitCast(@as(isize, @intCast(i)))]));
            }
        }
    }
}
pub fn stbi__jpeg_finish(z: [*c]stbi__jpeg) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (z.*.progressive != 0) {
        var i: c_int = undefined;
        _ = &i;
        var j: c_int = undefined;
        _ = &j;
        var n: c_int = undefined;
        _ = &n;
        {
            n = 0;
            while (n < z.*.s.*.img_n) : (n += 1) {
                var w: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].x + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
                _ = &w;
                var h: c_int = (z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].y + @as(c_int, 7)) >> @intCast(@as(c_int, 3));
                _ = &h;
                {
                    j = 0;
                    while (j < h) : (j += 1) {
                        {
                            i = 0;
                            while (i < w) : (i += 1) {
                                var data: [*c]c_short = z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64) * (i + (j * z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].coeff_w))))));
                                _ = &data;
                                stbi__jpeg_dequantize(data, @ptrCast(@alignCast(&z.*.dequant[@bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].tq)))])));
                                z.*.idct_block_kernel.?((z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].data + @as(usize, @bitCast(@as(isize, @intCast((z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2 * j) * @as(c_int, 8)))))) + @as(usize, @bitCast(@as(isize, @intCast(i * @as(c_int, 8))))), z.*.img_comp[@bitCast(@as(isize, @intCast(n)))].w2, data);
                            }
                        }
                    }
                }
            }
        }
    }
}
pub fn stbi__process_marker(z: [*c]stbi__jpeg, arg_m: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var m = arg_m;
    _ = &m;
    var L: c_int = undefined;
    _ = &L;
    var q: c_int = undefined;
    _ = &q;
    var p: c_int = undefined;
    _ = &p;
    var sixteen: c_int = undefined;
    _ = &sixteen;
    var t: c_int = undefined;
    _ = &t;
    var i: c_int = undefined;
    _ = &i;
    var v: [*c]stbi_uc = undefined;
    _ = &v;
    var sizes: [16]c_int = undefined;
    _ = &sizes;
    var i_1: c_int = undefined;
    _ = &i_1;
    var n: c_int = undefined;
    _ = &n;
    var q_2: c_int = undefined;
    _ = &q_2;
    var tc: c_int = undefined;
    _ = &tc;
    var th: c_int = undefined;
    _ = &th;
    const static_local_tag = struct {
        const tag: [5]u8 = [5]u8{
            'J',
            'F',
            'I',
            'F',
            '\x00',
        };
    };
    _ = &static_local_tag;
    var ok: c_int = undefined;
    _ = &ok;
    var i_3: c_int = undefined;
    _ = &i_3;
    const static_local_tag_4 = struct {
        const tag: [6]u8 = [6]u8{
            'A',
            'd',
            'o',
            'b',
            'e',
            '\x00',
        };
    };
    _ = &static_local_tag_4;
    var ok_5: c_int = undefined;
    _ = &ok_5;
    var i_6: c_int = undefined;
    _ = &i_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (m) {
                    STBI__MARKER_none => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 221) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(c_int, 219) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 196) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                if (((m >= @as(c_int, 224)) and (m <= @as(c_int, 239))) or (m == @as(c_int, 254))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            2 => {
                return stbi__err("Corrupt JPEG");
            },
            3 => {
                if (stbi__get16be(z.*.s) != @as(c_int, 4)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return stbi__err("Corrupt JPEG");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                z.*.restart_interval = stbi__get16be(z.*.s);
                return 1;
            },
            7 => {
                L = stbi__get16be(z.*.s) - @as(c_int, 2);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (L > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                q = stbi__get8(z.*.s);
                p = q >> @intCast(@as(c_int, 4));
                sixteen = @intFromBool(p != @as(c_int, 0));
                t = q & @as(c_int, 15);
                if ((p != @as(c_int, 0)) and (p != @as(c_int, 1))) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                return @intFromBool(L == @as(c_int, 0));
            },
            11 => {
                return stbi__err("Corrupt JPEG");
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (t > @as(c_int, 3)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return stbi__err("Corrupt JPEG");
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                i = 0;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if (i < @as(c_int, 64)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                z.*.dequant[@bitCast(@as(isize, @intCast(t)))][stbi__jpeg_dezigzag[@bitCast(@as(isize, @intCast(i)))]] = @bitCast(@as(c_short, @truncate(if (sixteen != 0) stbi__get16be(z.*.s) else @as(c_int, stbi__get8(z.*.s)))));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                i += 1;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                L -= if (sixteen != 0) @as(c_int, 129) else @as(c_int, 65);
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            21 => {
                L = stbi__get16be(z.*.s) - @as(c_int, 2);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (L > @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                n = 0;
                q_2 = stbi__get8(z.*.s);
                tc = q_2 >> @intCast(@as(c_int, 4));
                th = q_2 & @as(c_int, 15);
                if ((tc > @as(c_int, 1)) or (th > @as(c_int, 3))) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                return @intFromBool(L == @as(c_int, 0));
            },
            25 => {
                return stbi__err("Corrupt JPEG");
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                i_1 = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (i_1 < @as(c_int, 16)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                sizes[@bitCast(@as(isize, @intCast(i_1)))] = stbi__get8(z.*.s);
                n += sizes[@bitCast(@as(isize, @intCast(i_1)))];
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                i_1 += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                if (n > @as(c_int, 256)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                return stbi__err("Corrupt JPEG");
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                L -= 17;
                if (tc == @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                if (!(stbi__build_huffman(@as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_dc))) + @as(usize, @bitCast(@as(isize, @intCast(th)))), @ptrCast(@alignCast(&sizes))) != 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if (!(stbi__build_huffman(@as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_ac))) + @as(usize, @bitCast(@as(isize, @intCast(th)))), @ptrCast(@alignCast(&sizes))) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            37 => {
                i_1 = 0;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            38 => {
                return 0;
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                v = @ptrCast(@alignCast(&z.*.huff_dc[@bitCast(@as(isize, @intCast(th)))].values));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                return 0;
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                v = @ptrCast(@alignCast(&z.*.huff_ac[@bitCast(@as(isize, @intCast(th)))].values));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            44 => {
                if (i_1 < n) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                v[@bitCast(@as(isize, @intCast(i_1)))] = stbi__get8(z.*.s);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                i_1 += 1;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            47 => {
                if (tc != @as(c_int, 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                stbi__build_fast_ac(@ptrCast(@alignCast(&z.*.fast_ac[@bitCast(@as(isize, @intCast(th)))])), @as([*c]stbi__huffman, @ptrCast(@alignCast(&z.*.huff_ac))) + @as(usize, @bitCast(@as(isize, @intCast(th)))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                L -= n;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            51 => {
                L = stbi__get16be(z.*.s);
                if (L < @as(c_int, 2)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                return stbi__err("Corrupt JPEG");
            },
            54 => {
                if (m == @as(c_int, 254)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                L -= 2;
                if ((m == @as(c_int, 224)) and (L >= @as(c_int, 5))) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            57 => {
                return stbi__err("Corrupt JPEG");
            },
            58 => {
                return stbi__err("Corrupt JPEG");
            },
            59 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                ok = 1;
                i_3 = 0;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                if ((m == @as(c_int, 238)) and (L >= @as(c_int, 12))) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            62 => {
                stbi__skip(z.*.s, L);
                return 1;
            },
            63 => {
                if (i_3 < @as(c_int, 5)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                if (@as(c_int, stbi__get8(z.*.s)) != @as(c_int, static_local_tag.tag[@bitCast(@as(isize, @intCast(i_3)))])) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            65 => {
                i_3 += 1;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                L -= 5;
                if (ok != 0) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            67 => {
                ok = 0;
                {
                    sdl_pc = 69;
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
                    sdl_pc = 65;
                    continue;
                }
            },
            70 => {
                z.*.jfif = 1;
                {
                    sdl_pc = 72;
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
                    sdl_pc = 62;
                    continue;
                }
            },
            73 => {
                ok_5 = 1;
                i_6 = 0;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            76 => {
                if (i_6 < @as(c_int, 6)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            77 => {
                if (@as(c_int, stbi__get8(z.*.s)) != @as(c_int, static_local_tag_4.tag[@bitCast(@as(isize, @intCast(i_6)))])) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            78 => {
                i_6 += 1;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            79 => {
                L -= 6;
                if (ok_5 != 0) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            80 => {
                ok_5 = 0;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            83 => {
                _ = stbi__get8(z.*.s);
                _ = stbi__get16be(z.*.s);
                _ = stbi__get16be(z.*.s);
                z.*.app14_color_transform = stbi__get8(z.*.s);
                L -= 6;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn stbi__process_scan_header(z: [*c]stbi__jpeg) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var Ls: c_int = stbi__get16be(z.*.s);
    _ = &Ls;
    z.*.scan_n = stbi__get8(z.*.s);
    if (((z.*.scan_n < @as(c_int, 1)) or (z.*.scan_n > @as(c_int, 4))) or (z.*.scan_n > z.*.s.*.img_n)) return stbi__err("Corrupt JPEG");
    if (Ls != (@as(c_int, 6) + (@as(c_int, 2) * z.*.scan_n))) return stbi__err("Corrupt JPEG");
    {
        i = 0;
        while (i < z.*.scan_n) : (i += 1) {
            var id: c_int = stbi__get8(z.*.s);
            _ = &id;
            var which: c_int = undefined;
            _ = &which;
            var q: c_int = stbi__get8(z.*.s);
            _ = &q;
            {
                which = 0;
                while (which < z.*.s.*.img_n) : (which += 1) if (z.*.img_comp[@bitCast(@as(isize, @intCast(which)))].id == id) break;
            }
            if (which == z.*.s.*.img_n) return 0;
            z.*.img_comp[@bitCast(@as(isize, @intCast(which)))].hd = q >> @intCast(@as(c_int, 4));
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(which)))].hd > @as(c_int, 3)) return stbi__err("Corrupt JPEG");
            z.*.img_comp[@bitCast(@as(isize, @intCast(which)))].ha = q & @as(c_int, 15);
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(which)))].ha > @as(c_int, 3)) return stbi__err("Corrupt JPEG");
            z.*.order[@bitCast(@as(isize, @intCast(i)))] = which;
        }
    }
    {
        var aa: c_int = undefined;
        _ = &aa;
        z.*.spec_start = stbi__get8(z.*.s);
        z.*.spec_end = stbi__get8(z.*.s);
        aa = stbi__get8(z.*.s);
        z.*.succ_high = aa >> @intCast(@as(c_int, 4));
        z.*.succ_low = aa & @as(c_int, 15);
        if (z.*.progressive != 0) {
            if (((((z.*.spec_start > @as(c_int, 63)) or (z.*.spec_end > @as(c_int, 63))) or (z.*.spec_start > z.*.spec_end)) or (z.*.succ_high > @as(c_int, 13))) or (z.*.succ_low > @as(c_int, 13))) return stbi__err("Corrupt JPEG");
        } else {
            if (z.*.spec_start != @as(c_int, 0)) return stbi__err("Corrupt JPEG");
            if ((z.*.succ_high != @as(c_int, 0)) or (z.*.succ_low != @as(c_int, 0))) return stbi__err("Corrupt JPEG");
            z.*.spec_end = 63;
        }
    }
    return 1;
}
pub fn stbi__free_jpeg_components(z: [*c]stbi__jpeg, ncomp: c_int, why: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < ncomp) : (i += 1) {
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data != null) {
                SDL_free_REAL(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data);
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data = null;
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].data = null;
            }
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff != null) {
                SDL_free_REAL(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff);
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff = null;
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].coeff = null;
            }
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].linebuf != null) {
                SDL_free_REAL(@ptrCast(@alignCast(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].linebuf)));
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].linebuf = null;
            }
        }
    }
    return why;
}
pub fn stbi__process_frame_header(z: [*c]stbi__jpeg, scan: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var s: [*c]stbi__context = z.*.s;
    _ = &s;
    var Lf: c_int = undefined;
    _ = &Lf;
    var p: c_int = undefined;
    _ = &p;
    var i: c_int = undefined;
    _ = &i;
    var q: c_int = undefined;
    _ = &q;
    var h_max: c_int = 1;
    _ = &h_max;
    var v_max: c_int = 1;
    _ = &v_max;
    var c: c_int = undefined;
    _ = &c;
    Lf = stbi__get16be(s);
    if (Lf < @as(c_int, 11)) return stbi__err("Corrupt JPEG");
    p = stbi__get8(s);
    if (p != @as(c_int, 8)) return stbi__err("JPEG format not supported: 8-bit only");
    s.*.img_y = @bitCast(@as(c_int, stbi__get16be(s)));
    if (s.*.img_y == @as(stbi__uint32, 0)) return stbi__err("JPEG format not supported: delayed height");
    s.*.img_x = @bitCast(@as(c_int, stbi__get16be(s)));
    if (s.*.img_x == @as(stbi__uint32, 0)) return stbi__err("Corrupt JPEG");
    if (s.*.img_y > @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 24)))))) return stbi__err("Very large image (corrupt?)");
    if (s.*.img_x > @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 24)))))) return stbi__err("Very large image (corrupt?)");
    c = stbi__get8(s);
    if (((c != @as(c_int, 3)) and (c != @as(c_int, 1))) and (c != @as(c_int, 4))) return stbi__err("Corrupt JPEG");
    s.*.img_n = c;
    {
        i = 0;
        while (i < c) : (i += 1) {
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].data = null;
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].linebuf = null;
        }
    }
    if (Lf != (@as(c_int, 8) + (@as(c_int, 3) * s.*.img_n))) return stbi__err("Corrupt JPEG");
    z.*.rgb = 0;
    {
        i = 0;
        while (i < s.*.img_n) : (i += 1) {
            const static_local_rgb = struct {
                const rgb: [3]u8 = [3]u8{
                    'R',
                    'G',
                    'B',
                };
            };
            _ = &static_local_rgb;
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].id = stbi__get8(s);
            if ((s.*.img_n == @as(c_int, 3)) and (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].id == @as(c_int, static_local_rgb.rgb[@bitCast(@as(isize, @intCast(i)))]))) {
                z.*.rgb += 1;
            }
            q = stbi__get8(s);
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h = q >> @intCast(@as(c_int, 4));
            if (!(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h != 0) or (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h > @as(c_int, 4))) return stbi__err("Corrupt JPEG");
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v = q & @as(c_int, 15);
            if (!(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v != 0) or (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v > @as(c_int, 4))) return stbi__err("Corrupt JPEG");
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].tq = stbi__get8(s);
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].tq > @as(c_int, 3)) return stbi__err("Corrupt JPEG");
        }
    }
    if (scan != STBI__SCAN_load) return 1;
    if (!(stbi__mad3sizes_valid(@bitCast(@as(c_uint, @truncate(s.*.img_x))), @bitCast(@as(c_uint, @truncate(s.*.img_y))), s.*.img_n, 0) != 0)) return stbi__err("Image too large to decode");
    {
        i = 0;
        while (i < s.*.img_n) : (i += 1) {
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h > h_max) {
                h_max = z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h;
            }
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v > v_max) {
                v_max = z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v;
            }
        }
    }
    {
        i = 0;
        while (i < s.*.img_n) : (i += 1) {
            if (__helpers.signedRemainder(h_max, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h) != @as(c_int, 0)) return stbi__err("Corrupt JPEG");
            if (__helpers.signedRemainder(v_max, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v) != @as(c_int, 0)) return stbi__err("Corrupt JPEG");
        }
    }
    z.*.img_h_max = h_max;
    z.*.img_v_max = v_max;
    z.*.img_mcu_w = h_max * @as(c_int, 8);
    z.*.img_mcu_h = v_max * @as(c_int, 8);
    z.*.img_mcu_x = @bitCast(@as(c_uint, @truncate(((s.*.img_x +% @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_mcu_w)))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_mcu_w))))));
    z.*.img_mcu_y = @bitCast(@as(c_uint, @truncate(((s.*.img_y +% @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_mcu_h)))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_mcu_h))))));
    {
        i = 0;
        while (i < s.*.img_n) : (i += 1) {
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].x = @bitCast(@as(c_uint, @truncate((((s.*.img_x *% @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h)))) +% @as(stbi__uint32, @bitCast(@as(c_int, h_max)))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, h_max))))));
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].y = @bitCast(@as(c_uint, @truncate((((s.*.img_y *% @as(stbi__uint32, @bitCast(@as(c_int, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v)))) +% @as(stbi__uint32, @bitCast(@as(c_int, v_max)))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, v_max))))));
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].w2 = (z.*.img_mcu_x * z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h) * @as(c_int, 8);
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h2 = (z.*.img_mcu_y * z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].v) * @as(c_int, 8);
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].coeff = null;
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff = null;
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].linebuf = null;
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data = stbi__malloc_mad2(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].w2, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h2, 15);
            if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data == @as(?*anyopaque, null)) return stbi__free_jpeg_components(z, i + @as(c_int, 1), stbi__err("Out of memory"));
            z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].data = @ptrFromInt((@as(usize, @intCast(@intFromPtr(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_data))) +% @as(usize, 15)) & @as(usize, @bitCast(@as(c_long, ~@as(c_int, 15)))));
            if (z.*.progressive != 0) {
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].coeff_w = @divTrunc(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].w2, @as(c_int, 8));
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].coeff_h = @divTrunc(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h2, @as(c_int, 8));
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff = stbi__malloc_mad3(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].w2, z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].h2, @bitCast(@as(c_uint, @truncate(@sizeOf(c_short)))), 15);
                if (z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff == @as(?*anyopaque, null)) return stbi__free_jpeg_components(z, i + @as(c_int, 1), stbi__err("Out of memory"));
                z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].coeff = @ptrFromInt((@as(usize, @intCast(@intFromPtr(z.*.img_comp[@bitCast(@as(isize, @intCast(i)))].raw_coeff))) +% @as(usize, 15)) & @as(usize, @bitCast(@as(c_long, ~@as(c_int, 15)))));
            }
        }
    }
    return 1;
}
pub fn stbi__decode_jpeg_header(z: [*c]stbi__jpeg, scan: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var m: c_int = undefined;
    _ = &m;
    z.*.jfif = 0;
    z.*.app14_color_transform = -@as(c_int, 1);
    z.*.marker = STBI__MARKER_none;
    m = stbi__get_marker(z);
    if (!(m == @as(c_int, 216))) return stbi__err("Corrupt JPEG");
    if (scan == STBI__SCAN_type) return 1;
    m = stbi__get_marker(z);
    while (!(((m == @as(c_int, 192)) or (m == @as(c_int, 193))) or (m == @as(c_int, 194)))) {
        if (!(stbi__process_marker(z, m) != 0)) return 0;
        m = stbi__get_marker(z);
        while (m == STBI__MARKER_none) {
            if (stbi__at_eof(z.*.s) != 0) return stbi__err("Corrupt JPEG");
            m = stbi__get_marker(z);
        }
    }
    z.*.progressive = @intFromBool(m == @as(c_int, 194));
    if (!(stbi__process_frame_header(z, scan) != 0)) return 0;
    return 1;
}
pub fn stbi__skip_jpeg_junk_at_end(j: [*c]stbi__jpeg) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    while (!(stbi__at_eof(j.*.s) != 0)) {
        var x: stbi_uc = stbi__get8(j.*.s);
        _ = &x;
        while (@as(c_int, x) == @as(c_int, 255)) {
            if (stbi__at_eof(j.*.s) != 0) return STBI__MARKER_none;
            x = stbi__get8(j.*.s);
            if ((@as(c_int, x) != @as(c_int, 0)) and (@as(c_int, x) != @as(c_int, 255))) {
                return x;
            }
        }
    }
    return STBI__MARKER_none;
}
pub fn stbi__decode_jpeg_image(j: [*c]stbi__jpeg) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var m: c_int = undefined;
    _ = &m;
    {
        m = 0;
        while (m < @as(c_int, 4)) : (m += 1) {
            j.*.img_comp[@bitCast(@as(isize, @intCast(m)))].raw_data = null;
            j.*.img_comp[@bitCast(@as(isize, @intCast(m)))].raw_coeff = null;
        }
    }
    j.*.restart_interval = 0;
    if (!(stbi__decode_jpeg_header(j, STBI__SCAN_load) != 0)) return 0;
    m = stbi__get_marker(j);
    while (!(m == @as(c_int, 217))) {
        if (m == @as(c_int, 218)) {
            if (!(stbi__process_scan_header(j) != 0)) return 0;
            if (!(stbi__parse_entropy_coded_data(j) != 0)) return 0;
            if (@as(c_int, j.*.marker) == STBI__MARKER_none) {
                j.*.marker = stbi__skip_jpeg_junk_at_end(j);
            }
            m = stbi__get_marker(j);
            if ((m >= @as(c_int, 208)) and (m <= @as(c_int, 215))) {
                m = stbi__get_marker(j);
            }
        } else if (m == @as(c_int, 220)) {
            var Ld: c_int = stbi__get16be(j.*.s);
            _ = &Ld;
            var NL: stbi__uint32 = @bitCast(@as(c_int, stbi__get16be(j.*.s)));
            _ = &NL;
            if (Ld != @as(c_int, 4)) return stbi__err("Corrupt JPEG");
            if (NL != j.*.s.*.img_y) return stbi__err("Corrupt JPEG");
            m = stbi__get_marker(j);
        } else {
            if (!(stbi__process_marker(j, m) != 0)) return 1;
            m = stbi__get_marker(j);
        }
    }
    if (j.*.progressive != 0) {
        stbi__jpeg_finish(j);
    }
    return 1;
}
pub const resample_row_func = ?*const fn (out: [*c]stbi_uc, in0: [*c]stbi_uc, in1: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc;
pub fn resample_row_1(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    _ = @sizeOf(@TypeOf(out));
    _ = @sizeOf(@TypeOf(in_far));
    _ = @sizeOf(@TypeOf(w));
    _ = @sizeOf(@TypeOf(hs));
    return in_near;
}
pub fn stbi__resample_row_v_2(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    _ = @sizeOf(@TypeOf(hs));
    {
        i = 0;
        while (i < w) : (i += 1) {
            out[@bitCast(@as(isize, @intCast(i)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
        }
    }
    return out;
}
pub fn stbi__resample_row_h_2(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var input: [*c]stbi_uc = in_near;
    _ = &input;
    if (w == @as(c_int, 1)) {
        out[@as(c_int, 0)] = blk: {
            const tmp = input[@as(c_int, 0)];
            out[@as(c_int, 1)] = tmp;
            break :blk tmp;
        };
        return out;
    }
    out[@as(c_int, 0)] = input[@as(c_int, 0)];
    out[@as(c_int, 1)] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, input[@as(c_int, 0)]) * @as(c_int, 3)) + @as(c_int, input[@as(c_int, 1)])) + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
    {
        i = 1;
        while (i < (w - @as(c_int, 1))) : (i += 1) {
            var n: c_int = (@as(c_int, 3) * @as(c_int, input[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, 2);
            _ = &n;
            out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 0))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((n + @as(c_int, input[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))])) >> @intCast(@as(c_int, 2))))));
            out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 1))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((n + @as(c_int, input[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])) >> @intCast(@as(c_int, 2))))));
        }
    }
    out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 0))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, input[@bitCast(@as(isize, @intCast(w - @as(c_int, 2))))]) * @as(c_int, 3)) + @as(c_int, input[@bitCast(@as(isize, @intCast(w - @as(c_int, 1))))])) + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
    out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 1))))] = input[@bitCast(@as(isize, @intCast(w - @as(c_int, 1))))];
    _ = @sizeOf(@TypeOf(in_far));
    _ = @sizeOf(@TypeOf(hs));
    return out;
}
pub fn stbi__resample_row_hv_2(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var t0: c_int = undefined;
    _ = &t0;
    var t1: c_int = undefined;
    _ = &t1;
    if (w == @as(c_int, 1)) {
        out[@as(c_int, 0)] = blk: {
            const tmp = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * @as(c_int, in_near[@as(c_int, 0)])) + @as(c_int, in_far[@as(c_int, 0)])) + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
            out[@as(c_int, 1)] = tmp;
            break :blk tmp;
        };
        return out;
    }
    t1 = (@as(c_int, 3) * @as(c_int, in_near[@as(c_int, 0)])) + @as(c_int, in_far[@as(c_int, 0)]);
    out[@as(c_int, 0)] = @as(stbi_uc, @bitCast(@as(i8, @truncate((t1 + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
    {
        i = 1;
        while (i < w) : (i += 1) {
            t0 = t1;
            t1 = (@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i)))]);
            out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) - @as(c_int, 1))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * t0) + t1) + @as(c_int, 8)) >> @intCast(@as(c_int, 4))))));
            out[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * t1) + t0) + @as(c_int, 8)) >> @intCast(@as(c_int, 4))))));
        }
    }
    out[@bitCast(@as(isize, @intCast((w * @as(c_int, 2)) - @as(c_int, 1))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((t1 + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
    _ = @sizeOf(@TypeOf(hs));
    return out;
}
pub fn stbi__resample_row_hv_2_simd(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = 0;
    _ = &i;
    var t0: c_int = undefined;
    _ = &t0;
    var t1: c_int = undefined;
    _ = &t1;
    if (w == @as(c_int, 1)) {
        out[@as(c_int, 0)] = blk: {
            const tmp = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * @as(c_int, in_near[@as(c_int, 0)])) + @as(c_int, in_far[@as(c_int, 0)])) + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
            out[@as(c_int, 1)] = tmp;
            break :blk tmp;
        };
        return out;
    }
    t1 = (@as(c_int, 3) * @as(c_int, in_near[@as(c_int, 0)])) + @as(c_int, in_far[@as(c_int, 0)]);
    while (i < ((w - @as(c_int, 1)) & ~@as(c_int, 7))) : (i += 8) {
        var zero: __m128i = _mm_setzero_si128();
        _ = &zero;
        var farb: __m128i = _mm_loadl_epi64(@ptrCast(@alignCast(in_far + @as(usize, @bitCast(@as(isize, @intCast(i)))))));
        _ = &farb;
        var nearb: __m128i = _mm_loadl_epi64(@ptrCast(@alignCast(in_near + @as(usize, @bitCast(@as(isize, @intCast(i)))))));
        _ = &nearb;
        var farw: __m128i = _mm_unpacklo_epi8(farb, zero);
        _ = &farw;
        var nearw: __m128i = _mm_unpacklo_epi8(nearb, zero);
        _ = &nearw;
        var diff: __m128i = _mm_sub_epi16(farw, nearw);
        _ = &diff;
        var nears: __m128i = _mm_slli_epi16(nearw, 2);
        _ = &nears;
        var curr: __m128i = _mm_add_epi16(nears, diff);
        _ = &curr;
        var prv0: __m128i = @as(__m128i, @bitCast(__builtin.byte_shift_left(@as(__v16qi, @bitCast(curr)), @as(c_int, 2))));
        _ = &prv0;
        var nxt0: __m128i = @as(__m128i, @bitCast(__builtin.byte_shift_right(@as(__v16qi, @bitCast(curr)), @as(c_int, 2))));
        _ = &nxt0;
        var prev: __m128i = @as(__m128i, @bitCast(__builtin.insert_i16(@as(__v8hi, @bitCast(prv0)), @as(c_short, @truncate(t1)), @as(c_int, 0))));
        _ = &prev;
        var next: __m128i = @as(__m128i, @bitCast(__builtin.insert_i16(@as(__v8hi, @bitCast(nxt0)), @as(c_short, @truncate((@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i + @as(c_int, 8))))]))), @as(c_int, 7))));
        _ = &next;
        var bias: __m128i = _mm_set1_epi16(8);
        _ = &bias;
        var curs: __m128i = _mm_slli_epi16(curr, 2);
        _ = &curs;
        var prvd: __m128i = _mm_sub_epi16(prev, curr);
        _ = &prvd;
        var nxtd: __m128i = _mm_sub_epi16(next, curr);
        _ = &nxtd;
        var curb: __m128i = _mm_add_epi16(curs, bias);
        _ = &curb;
        var even: __m128i = _mm_add_epi16(prvd, curb);
        _ = &even;
        var odd: __m128i = _mm_add_epi16(nxtd, curb);
        _ = &odd;
        var int0: __m128i = _mm_unpacklo_epi16(even, odd);
        _ = &int0;
        var int1: __m128i = _mm_unpackhi_epi16(even, odd);
        _ = &int1;
        var de0: __m128i = _mm_srli_epi16(int0, 4);
        _ = &de0;
        var de1: __m128i = _mm_srli_epi16(int1, 4);
        _ = &de1;
        var outv: __m128i = _mm_packus_epi16(de0, de1);
        _ = &outv;
        _mm_storeu_si128(@ptrCast(@alignCast(out + @as(usize, @bitCast(@as(isize, @intCast(i * @as(c_int, 2))))))), outv);
        t1 = (@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i + @as(c_int, 7))))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i + @as(c_int, 7))))]);
    }
    t0 = t1;
    t1 = (@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i)))]);
    out[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * t1) + t0) + @as(c_int, 8)) >> @intCast(@as(c_int, 4))))));
    {
        i += 1;
        while (i < w) : (i += 1) {
            t0 = t1;
            t1 = (@as(c_int, 3) * @as(c_int, in_near[@bitCast(@as(isize, @intCast(i)))])) + @as(c_int, in_far[@bitCast(@as(isize, @intCast(i)))]);
            out[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) - @as(c_int, 1))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * t0) + t1) + @as(c_int, 8)) >> @intCast(@as(c_int, 4))))));
            out[@bitCast(@as(isize, @intCast(i * @as(c_int, 2))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((((@as(c_int, 3) * t1) + t0) + @as(c_int, 8)) >> @intCast(@as(c_int, 4))))));
        }
    }
    out[@bitCast(@as(isize, @intCast((w * @as(c_int, 2)) - @as(c_int, 1))))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((t1 + @as(c_int, 2)) >> @intCast(@as(c_int, 2))))));
    _ = @sizeOf(@TypeOf(hs));
    return out;
}
pub fn stbi__resample_row_generic(out: [*c]stbi_uc, in_near: [*c]stbi_uc, in_far: [*c]stbi_uc, w: c_int, hs: c_int) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    _ = @sizeOf(@TypeOf(in_far));
    {
        i = 0;
        while (i < w) : (i += 1) {
            j = 0;
            while (j < hs) : (j += 1) {
                out[@bitCast(@as(isize, @intCast((i * hs) + j)))] = in_near[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    return out;
}
pub fn stbi__YCbCr_to_RGB_row(arg_out: [*c]stbi_uc, y: [*c]const stbi_uc, pcb: [*c]const stbi_uc, pcr: [*c]const stbi_uc, count: c_int, step: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var out = arg_out;
    _ = &out;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < count) : (i += 1) {
            var y_fixed: c_int = (@as(c_int, y[@bitCast(@as(isize, @intCast(i)))]) << @intCast(@as(c_int, 20))) + (@as(c_int, 1) << @intCast(@as(c_int, 19)));
            _ = &y_fixed;
            var r: c_int = undefined;
            _ = &r;
            var g: c_int = undefined;
            _ = &g;
            var b: c_int = undefined;
            _ = &b;
            var cr: c_int = @as(c_int, pcr[@bitCast(@as(isize, @intCast(i)))]) - @as(c_int, 128);
            _ = &cr;
            var cb: c_int = @as(c_int, pcb[@bitCast(@as(isize, @intCast(i)))]) - @as(c_int, 128);
            _ = &cb;
            r = y_fixed + (cr * (@as(c_int, @intFromFloat((@as(f32, 1.402) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))));
            g = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, y_fixed + (cr * -(@as(c_int, @intFromFloat((@as(f32, 0.71414) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))))))) +% (@as(c_uint, @bitCast(@as(c_int, cb * -(@as(c_int, @intFromFloat((@as(f32, 0.34414) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8)))))) & @as(c_uint, 4294901760)))));
            b = y_fixed + (cb * (@as(c_int, @intFromFloat((@as(f32, 1.772) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))));
            r >>= @intCast(@as(c_int, 20));
            g >>= @intCast(@as(c_int, 20));
            b >>= @intCast(@as(c_int, 20));
            if (@as(c_uint, @bitCast(@as(c_int, r))) > @as(c_uint, 255)) {
                if (r < @as(c_int, 0)) {
                    r = 0;
                } else {
                    r = 255;
                }
            }
            if (@as(c_uint, @bitCast(@as(c_int, g))) > @as(c_uint, 255)) {
                if (g < @as(c_int, 0)) {
                    g = 0;
                } else {
                    g = 255;
                }
            }
            if (@as(c_uint, @bitCast(@as(c_int, b))) > @as(c_uint, 255)) {
                if (b < @as(c_int, 0)) {
                    b = 0;
                } else {
                    b = 255;
                }
            }
            out[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(r)));
            out[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(g)));
            out[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(b)));
            out[@as(c_int, 3)] = 255;
            out += @as(usize, @bitCast(@as(isize, @intCast(step))));
        }
    }
}
pub fn stbi__YCbCr_to_RGB_simd(arg_out: [*c]stbi_uc, y: [*c]const stbi_uc, pcb: [*c]const stbi_uc, pcr: [*c]const stbi_uc, count: c_int, step: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var out = arg_out;
    _ = &out;
    var i: c_int = 0;
    _ = &i;
    if (step == @as(c_int, 4)) {
        var signflip: __m128i = _mm_set1_epi8(@bitCast(@as(i8, @truncate(-@as(c_int, 128)))));
        _ = &signflip;
        var cr_const0: __m128i = _mm_set1_epi16(@intFromFloat((@as(f32, 1.402) * @as(f32, 4096.0)) + @as(f32, 0.5)));
        _ = &cr_const0;
        var cr_const1: __m128i = _mm_set1_epi16(@truncate(-@as(c_int, @as(c_short, @intFromFloat((@as(f32, 0.71414) * @as(f32, 4096.0)) + @as(f32, 0.5))))));
        _ = &cr_const1;
        var cb_const0: __m128i = _mm_set1_epi16(@truncate(-@as(c_int, @as(c_short, @intFromFloat((@as(f32, 0.34414) * @as(f32, 4096.0)) + @as(f32, 0.5))))));
        _ = &cb_const0;
        var cb_const1: __m128i = _mm_set1_epi16(@intFromFloat((@as(f32, 1.772) * @as(f32, 4096.0)) + @as(f32, 0.5)));
        _ = &cb_const1;
        var y_bias: __m128i = _mm_set1_epi8(@truncate(@as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 128)))))));
        _ = &y_bias;
        var xw: __m128i = _mm_set1_epi16(255);
        _ = &xw;
        while ((i + @as(c_int, 7)) < count) : (i += 8) {
            var y_bytes: __m128i = _mm_loadl_epi64(@ptrCast(@alignCast(y + @as(usize, @bitCast(@as(isize, @intCast(i)))))));
            _ = &y_bytes;
            var cr_bytes: __m128i = _mm_loadl_epi64(@ptrCast(@alignCast(pcr + @as(usize, @bitCast(@as(isize, @intCast(i)))))));
            _ = &cr_bytes;
            var cb_bytes: __m128i = _mm_loadl_epi64(@ptrCast(@alignCast(pcb + @as(usize, @bitCast(@as(isize, @intCast(i)))))));
            _ = &cb_bytes;
            var cr_biased: __m128i = _mm_xor_si128(cr_bytes, signflip);
            _ = &cr_biased;
            var cb_biased: __m128i = _mm_xor_si128(cb_bytes, signflip);
            _ = &cb_biased;
            var yw: __m128i = _mm_unpacklo_epi8(y_bias, y_bytes);
            _ = &yw;
            var crw: __m128i = _mm_unpacklo_epi8(_mm_setzero_si128(), cr_biased);
            _ = &crw;
            var cbw: __m128i = _mm_unpacklo_epi8(_mm_setzero_si128(), cb_biased);
            _ = &cbw;
            var yws: __m128i = _mm_srli_epi16(yw, 4);
            _ = &yws;
            var cr0: __m128i = _mm_mulhi_epi16(cr_const0, crw);
            _ = &cr0;
            var cb0: __m128i = _mm_mulhi_epi16(cb_const0, cbw);
            _ = &cb0;
            var cb1: __m128i = _mm_mulhi_epi16(cbw, cb_const1);
            _ = &cb1;
            var cr1: __m128i = _mm_mulhi_epi16(crw, cr_const1);
            _ = &cr1;
            var rws: __m128i = _mm_add_epi16(cr0, yws);
            _ = &rws;
            var gwt: __m128i = _mm_add_epi16(cb0, yws);
            _ = &gwt;
            var bws: __m128i = _mm_add_epi16(yws, cb1);
            _ = &bws;
            var gws: __m128i = _mm_add_epi16(gwt, cr1);
            _ = &gws;
            var rw: __m128i = _mm_srai_epi16(rws, 4);
            _ = &rw;
            var bw: __m128i = _mm_srai_epi16(bws, 4);
            _ = &bw;
            var gw: __m128i = _mm_srai_epi16(gws, 4);
            _ = &gw;
            var brb: __m128i = _mm_packus_epi16(rw, bw);
            _ = &brb;
            var gxb: __m128i = _mm_packus_epi16(gw, xw);
            _ = &gxb;
            var t0: __m128i = _mm_unpacklo_epi8(brb, gxb);
            _ = &t0;
            var t1: __m128i = _mm_unpackhi_epi8(brb, gxb);
            _ = &t1;
            var o0: __m128i = _mm_unpacklo_epi16(t0, t1);
            _ = &o0;
            var o1: __m128i = _mm_unpackhi_epi16(t0, t1);
            _ = &o1;
            _mm_storeu_si128(@ptrCast(@alignCast(out + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0))))))), o0);
            _mm_storeu_si128(@ptrCast(@alignCast(out + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))), o1);
            out += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
        }
    }
    while (i < count) : (i += 1) {
        var y_fixed: c_int = (@as(c_int, y[@bitCast(@as(isize, @intCast(i)))]) << @intCast(@as(c_int, 20))) + (@as(c_int, 1) << @intCast(@as(c_int, 19)));
        _ = &y_fixed;
        var r: c_int = undefined;
        _ = &r;
        var g: c_int = undefined;
        _ = &g;
        var b: c_int = undefined;
        _ = &b;
        var cr: c_int = @as(c_int, pcr[@bitCast(@as(isize, @intCast(i)))]) - @as(c_int, 128);
        _ = &cr;
        var cb: c_int = @as(c_int, pcb[@bitCast(@as(isize, @intCast(i)))]) - @as(c_int, 128);
        _ = &cb;
        r = y_fixed + (cr * (@as(c_int, @intFromFloat((@as(f32, 1.402) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))));
        g = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, y_fixed + (cr * -(@as(c_int, @intFromFloat((@as(f32, 0.71414) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))))))) +% (@as(c_uint, @bitCast(@as(c_int, cb * -(@as(c_int, @intFromFloat((@as(f32, 0.34414) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8)))))) & @as(c_uint, 4294901760)))));
        b = y_fixed + (cb * (@as(c_int, @intFromFloat((@as(f32, 1.772) * @as(f32, 4096.0)) + @as(f32, 0.5))) << @intCast(@as(c_int, 8))));
        r >>= @intCast(@as(c_int, 20));
        g >>= @intCast(@as(c_int, 20));
        b >>= @intCast(@as(c_int, 20));
        if (@as(c_uint, @bitCast(@as(c_int, r))) > @as(c_uint, 255)) {
            if (r < @as(c_int, 0)) {
                r = 0;
            } else {
                r = 255;
            }
        }
        if (@as(c_uint, @bitCast(@as(c_int, g))) > @as(c_uint, 255)) {
            if (g < @as(c_int, 0)) {
                g = 0;
            } else {
                g = 255;
            }
        }
        if (@as(c_uint, @bitCast(@as(c_int, b))) > @as(c_uint, 255)) {
            if (b < @as(c_int, 0)) {
                b = 0;
            } else {
                b = 255;
            }
        }
        out[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(r)));
        out[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(g)));
        out[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(b)));
        out[@as(c_int, 3)] = 255;
        out += @as(usize, @bitCast(@as(isize, @intCast(step))));
    }
}
pub fn stbi__setup_jpeg(j: [*c]stbi__jpeg) callconv(.c) void {
    @setEvalBranchQuota(100000);
    j.*.idct_block_kernel = stbi__idct_block;
    j.*.YCbCr_to_RGB_kernel = stbi__YCbCr_to_RGB_row;
    j.*.resample_row_hv_2_kernel = stbi__resample_row_hv_2;
    if (stbi__sse2_available() != 0) {
        j.*.idct_block_kernel = stbi__idct_simd;
        j.*.YCbCr_to_RGB_kernel = stbi__YCbCr_to_RGB_simd;
        j.*.resample_row_hv_2_kernel = stbi__resample_row_hv_2_simd;
    }
}
pub fn stbi__cleanup_jpeg(j: [*c]stbi__jpeg) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = stbi__free_jpeg_components(j, j.*.s.*.img_n, 0);
}
pub const stbi__resample = extern struct {
    resample: resample_row_func = null,
    line0: [*c]stbi_uc = null,
    line1: [*c]stbi_uc = null,
    hs: c_int = 0,
    vs: c_int = 0,
    w_lores: c_int = 0,
    ystep: c_int = 0,
    ypos: c_int = 0,
};
pub fn stbi__blinn_8x8(x: stbi_uc, y: stbi_uc) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    var t: c_uint = @bitCast(@as(c_int, (@as(c_int, x) * @as(c_int, y)) + @as(c_int, 128)));
    _ = &t;
    return @truncate((t +% (t >> @intCast(@as(c_uint, 8)))) >> @intCast(@as(c_uint, 8)));
}
pub fn output_jpeg_nv12(z: [*c]stbi__jpeg, nv12: [*c]stbi__nv12) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var j: c_uint = undefined;
    _ = &j;
    if (nv12.*.pitch == @as(c_int, @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))))) {
        _ = memcpy(@ptrCast(@alignCast(nv12.*.y)), @ptrCast(@alignCast(z.*.img_comp[@as(c_int, 0)].data)), z.*.s.*.img_y *% z.*.s.*.img_x);
    } else {
        {
            i = 0;
            while (i < z.*.s.*.img_y) : (i +%= 1) {
                _ = memcpy(@ptrCast(@alignCast(nv12.*.y + (i *% @as(c_uint, @bitCast(@as(c_int, nv12.*.pitch)))))), @ptrCast(@alignCast(z.*.img_comp[@as(c_int, 0)].data + (i *% z.*.s.*.img_x))), z.*.s.*.img_x);
            }
        }
    }
    if (z.*.s.*.img_n == @as(c_int, 3)) {
        const nv12_hs: c_int = 2;
        _ = &nv12_hs;
        const nv12_vs: c_int = 2;
        _ = &nv12_vs;
        const u_hs: c_int = @divTrunc(z.*.img_h_max, z.*.img_comp[@as(c_int, 1)].h);
        _ = &u_hs;
        const u_vs: c_int = @divTrunc(z.*.img_v_max, z.*.img_comp[@as(c_int, 1)].v);
        _ = &u_vs;
        const v_hs: c_int = @divTrunc(z.*.img_h_max, z.*.img_comp[@as(c_int, 2)].h);
        _ = &v_hs;
        const v_vs: c_int = @divTrunc(z.*.img_v_max, z.*.img_comp[@as(c_int, 2)].v);
        _ = &v_vs;
        {
            i = 0;
            while (i < ((z.*.s.*.img_y +% @as(stbi__uint32, 1)) / @as(stbi__uint32, 2))) : (i +%= 1) {
                var src_u: [*c]stbi_uc = z.*.img_comp[@as(c_int, 1)].data + ((i *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) + (nv12_vs - u_vs))))) *% @as(c_uint, @bitCast(@as(c_int, z.*.img_comp[@as(c_int, 1)].x))));
                _ = &src_u;
                var src_v: [*c]stbi_uc = z.*.img_comp[@as(c_int, 2)].data + ((i *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 1) + (nv12_vs - v_vs))))) *% @as(c_uint, @bitCast(@as(c_int, z.*.img_comp[@as(c_int, 2)].x))));
                _ = &src_v;
                var dst: [*c]stbi_uc = nv12.*.uv + (i *% @as(c_uint, @bitCast(@as(c_int, nv12.*.pitch))));
                _ = &dst;
                {
                    j = 0;
                    while (j < ((z.*.s.*.img_x +% @as(stbi__uint32, 1)) / @as(stbi__uint32, 2))) : (j +%= 1) {
                        (blk: {
                            const ref = &dst;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = src_u.*;
                        src_u += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1) + (nv12_hs - u_hs)))));
                        (blk: {
                            const ref = &dst;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = src_v.*;
                        src_v += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1) + (nv12_hs - v_hs)))));
                    }
                }
            }
        }
    } else {
        {
            i = 0;
            while (i < ((z.*.s.*.img_y +% @as(stbi__uint32, 1)) / @as(stbi__uint32, 2))) : (i +%= 1) {
                _ = memset(@ptrCast(@alignCast(nv12.*.uv + (i *% @as(c_uint, @bitCast(@as(c_int, nv12.*.pitch)))))), @bitCast(@as(c_uint, @truncate(@as(c_uint, 2155905152)))), ((z.*.s.*.img_x +% @as(stbi__uint32, 1)) / @as(stbi__uint32, 2)) *% @as(stbi__uint32, 2));
            }
        }
    }
    return nv12.*.y;
}
pub fn load_jpeg_image(z: [*c]stbi__jpeg, out_x: [*c]c_int, out_y: [*c]c_int, comp: [*c]c_int, req_comp: c_int, nv12: [*c]stbi__nv12) callconv(.c) [*c]stbi_uc {
    @setEvalBranchQuota(100000);
    var n: c_int = undefined;
    _ = &n;
    var decode_n: c_int = undefined;
    _ = &decode_n;
    var is_rgb: c_int = undefined;
    _ = &is_rgb;
    z.*.s.*.img_n = 0;
    if ((req_comp < @as(c_int, 0)) or (req_comp > @as(c_int, 4))) return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Internal error") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
    if (!(stbi__decode_jpeg_image(z) != 0)) {
        stbi__cleanup_jpeg(z);
        return null;
    }
    n = if (req_comp != 0) req_comp else if (z.*.s.*.img_n >= @as(c_int, 3)) @as(c_int, 3) else @as(c_int, 1);
    is_rgb = @intFromBool((z.*.s.*.img_n == @as(c_int, 3)) and ((z.*.rgb == @as(c_int, 3)) or ((z.*.app14_color_transform == @as(c_int, 0)) and !(z.*.jfif != 0))));
    if (((z.*.s.*.img_n == @as(c_int, 3)) and (n < @as(c_int, 3))) and !(is_rgb != 0)) {
        decode_n = 1;
    } else {
        decode_n = z.*.s.*.img_n;
    }
    if (decode_n <= @as(c_int, 0)) {
        stbi__cleanup_jpeg(z);
        return null;
    }
    {
        var k: c_int = undefined;
        _ = &k;
        var i: c_uint = undefined;
        _ = &i;
        var j: c_uint = undefined;
        _ = &j;
        var output: [*c]stbi_uc = undefined;
        _ = &output;
        var coutput: [4][*c]stbi_uc = [4][*c]stbi_uc{
            null,
            null,
            null,
            null,
        };
        _ = &coutput;
        var res_comp: [4]stbi__resample = undefined;
        _ = &res_comp;
        if (nv12 != null) {
            if ((nv12.*.w != @as(c_int, @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))))) or (nv12.*.h != @as(c_int, @bitCast(@as(c_uint, @truncate(z.*.s.*.img_y)))))) {
                stbi__cleanup_jpeg(z);
                return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Unexpected size") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
            }
            if (is_rgb != 0) {
                stbi__cleanup_jpeg(z);
                return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Can't convert RGB to NV12") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
            }
            output = output_jpeg_nv12(z, nv12);
        } else {
            {
                k = 0;
                while (k < decode_n) : (k += 1) {
                    var r: [*c]stbi__resample = &res_comp[@bitCast(@as(isize, @intCast(k)))];
                    _ = &r;
                    z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].linebuf = @ptrCast(@alignCast(stbi__malloc(z.*.s.*.img_x +% @as(stbi__uint32, 3))));
                    if (!(z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].linebuf != null)) {
                        stbi__cleanup_jpeg(z);
                        return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
                    }
                    r.*.hs = @divTrunc(z.*.img_h_max, z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].h);
                    r.*.vs = @divTrunc(z.*.img_v_max, z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].v);
                    r.*.ystep = r.*.vs >> @intCast(@as(c_int, 1));
                    r.*.w_lores = @bitCast(@as(c_uint, @truncate(((z.*.s.*.img_x +% @as(stbi__uint32, @bitCast(@as(c_int, r.*.hs)))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, r.*.hs))))));
                    r.*.ypos = 0;
                    r.*.line0 = blk: {
                        const tmp = z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].data;
                        r.*.line1 = tmp;
                        break :blk tmp;
                    };
                    if ((r.*.hs == @as(c_int, 1)) and (r.*.vs == @as(c_int, 1))) {
                        r.*.resample = resample_row_1;
                    } else if ((r.*.hs == @as(c_int, 1)) and (r.*.vs == @as(c_int, 2))) {
                        r.*.resample = stbi__resample_row_v_2;
                    } else if ((r.*.hs == @as(c_int, 2)) and (r.*.vs == @as(c_int, 1))) {
                        r.*.resample = stbi__resample_row_h_2;
                    } else if ((r.*.hs == @as(c_int, 2)) and (r.*.vs == @as(c_int, 2))) {
                        r.*.resample = z.*.resample_row_hv_2_kernel;
                    } else {
                        r.*.resample = stbi__resample_row_generic;
                    }
                }
            }
            output = @ptrCast(@alignCast(stbi__malloc_mad3(n, @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))), @bitCast(@as(c_uint, @truncate(z.*.s.*.img_y))), 1)));
            if (!(output != null)) {
                stbi__cleanup_jpeg(z);
                return @as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))));
            }
            {
                j = 0;
                while (j < z.*.s.*.img_y) : (j +%= 1) {
                    var out: [*c]stbi_uc = output + ((@as(stbi__uint32, @bitCast(@as(c_int, n))) *% z.*.s.*.img_x) *% j);
                    _ = &out;
                    {
                        k = 0;
                        while (k < decode_n) : (k += 1) {
                            var r: [*c]stbi__resample = &res_comp[@bitCast(@as(isize, @intCast(k)))];
                            _ = &r;
                            var y_bot: c_int = @intFromBool(r.*.ystep >= (r.*.vs >> @intCast(@as(c_int, 1))));
                            _ = &y_bot;
                            coutput[@bitCast(@as(isize, @intCast(k)))] = r.*.resample.?(z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].linebuf, if (y_bot != 0) r.*.line1 else r.*.line0, if (y_bot != 0) r.*.line0 else r.*.line1, r.*.w_lores, r.*.hs);
                            if ((blk: {
                                const ref = &r.*.ystep;
                                ref.* += 1;
                                break :blk ref.*;
                            }) >= r.*.vs) {
                                r.*.ystep = 0;
                                r.*.line0 = r.*.line1;
                                if ((blk: {
                                    const ref = &r.*.ypos;
                                    ref.* += 1;
                                    break :blk ref.*;
                                }) < z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].y) {
                                    r.*.line1 += @as(usize, @bitCast(@as(isize, @intCast(z.*.img_comp[@bitCast(@as(isize, @intCast(k)))].w2))));
                                }
                            }
                        }
                    }
                    if (n >= @as(c_int, 3)) {
                        var y: [*c]stbi_uc = coutput[@as(c_int, 0)];
                        _ = &y;
                        if (z.*.s.*.img_n == @as(c_int, 3)) {
                            if (is_rgb != 0) {
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : (i +%= 1) {
                                        out[@as(c_int, 0)] = y[i];
                                        out[@as(c_int, 1)] = coutput[@as(c_int, 1)][i];
                                        out[@as(c_int, 2)] = coutput[@as(c_int, 2)][i];
                                        out[@as(c_int, 3)] = 255;
                                        out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                                    }
                                }
                            } else {
                                z.*.YCbCr_to_RGB_kernel.?(out, y, coutput[@as(c_int, 1)], coutput[@as(c_int, 2)], @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))), n);
                            }
                        } else if (z.*.s.*.img_n == @as(c_int, 4)) {
                            if (z.*.app14_color_transform == @as(c_int, 0)) {
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : (i +%= 1) {
                                        var m: stbi_uc = coutput[@as(c_int, 3)][i];
                                        _ = &m;
                                        out[@as(c_int, 0)] = stbi__blinn_8x8(coutput[@as(c_int, 0)][i], m);
                                        out[@as(c_int, 1)] = stbi__blinn_8x8(coutput[@as(c_int, 1)][i], m);
                                        out[@as(c_int, 2)] = stbi__blinn_8x8(coutput[@as(c_int, 2)][i], m);
                                        out[@as(c_int, 3)] = 255;
                                        out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                                    }
                                }
                            } else if (z.*.app14_color_transform == @as(c_int, 2)) {
                                z.*.YCbCr_to_RGB_kernel.?(out, y, coutput[@as(c_int, 1)], coutput[@as(c_int, 2)], @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))), n);
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : (i +%= 1) {
                                        var m: stbi_uc = coutput[@as(c_int, 3)][i];
                                        _ = &m;
                                        out[@as(c_int, 0)] = stbi__blinn_8x8(@bitCast(@as(i8, @truncate(@as(c_int, 255) - @as(c_int, out[@as(c_int, 0)])))), m);
                                        out[@as(c_int, 1)] = stbi__blinn_8x8(@bitCast(@as(i8, @truncate(@as(c_int, 255) - @as(c_int, out[@as(c_int, 1)])))), m);
                                        out[@as(c_int, 2)] = stbi__blinn_8x8(@bitCast(@as(i8, @truncate(@as(c_int, 255) - @as(c_int, out[@as(c_int, 2)])))), m);
                                        out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                                    }
                                }
                            } else {
                                z.*.YCbCr_to_RGB_kernel.?(out, y, coutput[@as(c_int, 1)], coutput[@as(c_int, 2)], @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x))), n);
                            }
                        } else {
                            i = 0;
                            while (i < z.*.s.*.img_x) : (i +%= 1) {
                                out[@as(c_int, 0)] = blk: {
                                    const tmp = blk_1: {
                                        const tmp_2 = y[i];
                                        out[@as(c_int, 2)] = tmp_2;
                                        break :blk_1 tmp_2;
                                    };
                                    out[@as(c_int, 1)] = tmp;
                                    break :blk tmp;
                                };
                                out[@as(c_int, 3)] = 255;
                                out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                            }
                        }
                    } else {
                        if (is_rgb != 0) {
                            if (n == @as(c_int, 1)) {
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : (i +%= 1) {
                                        (blk: {
                                            const ref = &out;
                                            const tmp = ref.*;
                                            ref.* += 1;
                                            break :blk tmp;
                                        }).* = stbi__compute_y(coutput[@as(c_int, 0)][i], coutput[@as(c_int, 1)][i], coutput[@as(c_int, 2)][i]);
                                    }
                                }
                            } else {
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : ({
                                        i +%= 1;
                                        out += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                                    }) {
                                        out[@as(c_int, 0)] = stbi__compute_y(coutput[@as(c_int, 0)][i], coutput[@as(c_int, 1)][i], coutput[@as(c_int, 2)][i]);
                                        out[@as(c_int, 1)] = 255;
                                    }
                                }
                            }
                        } else if ((z.*.s.*.img_n == @as(c_int, 4)) and (z.*.app14_color_transform == @as(c_int, 0))) {
                            {
                                i = 0;
                                while (i < z.*.s.*.img_x) : (i +%= 1) {
                                    var m: stbi_uc = coutput[@as(c_int, 3)][i];
                                    _ = &m;
                                    var r: stbi_uc = stbi__blinn_8x8(coutput[@as(c_int, 0)][i], m);
                                    _ = &r;
                                    var g: stbi_uc = stbi__blinn_8x8(coutput[@as(c_int, 1)][i], m);
                                    _ = &g;
                                    var b: stbi_uc = stbi__blinn_8x8(coutput[@as(c_int, 2)][i], m);
                                    _ = &b;
                                    out[@as(c_int, 0)] = stbi__compute_y(r, g, b);
                                    out[@as(c_int, 1)] = 255;
                                    out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                                }
                            }
                        } else if ((z.*.s.*.img_n == @as(c_int, 4)) and (z.*.app14_color_transform == @as(c_int, 2))) {
                            {
                                i = 0;
                                while (i < z.*.s.*.img_x) : (i +%= 1) {
                                    out[@as(c_int, 0)] = stbi__blinn_8x8(@bitCast(@as(i8, @truncate(@as(c_int, 255) - @as(c_int, coutput[@as(c_int, 0)][i])))), coutput[@as(c_int, 3)][i]);
                                    out[@as(c_int, 1)] = 255;
                                    out += @as(usize, @bitCast(@as(isize, @intCast(n))));
                                }
                            }
                        } else {
                            var y: [*c]stbi_uc = coutput[@as(c_int, 0)];
                            _ = &y;
                            if (n == @as(c_int, 1)) {
                                {
                                    i = 0;
                                    while (i < z.*.s.*.img_x) : (i +%= 1) {
                                        out[i] = y[i];
                                    }
                                }
                            } else {
                                i = 0;
                                while (i < z.*.s.*.img_x) : (i +%= 1) {
                                    (blk: {
                                        const ref = &out;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = y[i];
                                    (blk: {
                                        const ref = &out;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = 255;
                                }
                            }
                        }
                    }
                }
            }
        }
        stbi__cleanup_jpeg(z);
        out_x.* = @bitCast(@as(c_uint, @truncate(z.*.s.*.img_x)));
        out_y.* = @bitCast(@as(c_uint, @truncate(z.*.s.*.img_y)));
        if (comp != null) {
            comp.* = if (z.*.s.*.img_n >= @as(c_int, 3)) @as(c_int, 3) else @as(c_int, 1);
        }
        return output;
    }
}
pub fn stbi__jpeg_load(s: [*c]stbi__context, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int, nv12: [*c]stbi__nv12, ri: [*c]stbi__result_info) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var result: [*c]u8 = undefined;
    _ = &result;
    var j: [*c]stbi__jpeg = @ptrCast(@alignCast(stbi__malloc(@sizeOf(stbi__jpeg))));
    _ = &j;
    if (!(j != null)) return @ptrCast(@alignCast(@as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("Out of memory") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))))));
    _ = memset(@ptrCast(@alignCast(j)), 0, @sizeOf(stbi__jpeg));
    _ = @sizeOf(@TypeOf(ri));
    j.*.s = s;
    stbi__setup_jpeg(j);
    result = load_jpeg_image(j, x, y, comp, req_comp, nv12);
    SDL_free_REAL(@ptrCast(@alignCast(j)));
    return @ptrCast(@alignCast(result));
}
pub fn stbi__jpeg_test(s: [*c]stbi__context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var r: c_int = undefined;
    _ = &r;
    var j: [*c]stbi__jpeg = @ptrCast(@alignCast(stbi__malloc(@sizeOf(stbi__jpeg))));
    _ = &j;
    if (!(j != null)) return stbi__err("Out of memory");
    _ = memset(@ptrCast(@alignCast(j)), 0, @sizeOf(stbi__jpeg));
    j.*.s = s;
    stbi__setup_jpeg(j);
    r = stbi__decode_jpeg_header(j, STBI__SCAN_type);
    stbi__rewind(s);
    SDL_free_REAL(@ptrCast(@alignCast(j)));
    return r;
}
pub const stbi__zhuffman = extern struct {
    fast: [512]stbi__uint16 = @import("std").mem.zeroes([512]stbi__uint16),
    firstcode: [16]stbi__uint16 = @import("std").mem.zeroes([16]stbi__uint16),
    maxcode: [17]c_int = @import("std").mem.zeroes([17]c_int),
    firstsymbol: [16]stbi__uint16 = @import("std").mem.zeroes([16]stbi__uint16),
    size: [288]stbi_uc = @import("std").mem.zeroes([288]stbi_uc),
    value: [288]stbi__uint16 = @import("std").mem.zeroes([288]stbi__uint16),
};
pub fn stbi__bitreverse16(arg_n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var n = arg_n;
    _ = &n;
    n = ((n & @as(c_int, 43690)) >> @intCast(@as(c_int, 1))) | ((n & @as(c_int, 21845)) << @intCast(@as(c_int, 1)));
    n = ((n & @as(c_int, 52428)) >> @intCast(@as(c_int, 2))) | ((n & @as(c_int, 13107)) << @intCast(@as(c_int, 2)));
    n = ((n & @as(c_int, 61680)) >> @intCast(@as(c_int, 4))) | ((n & @as(c_int, 3855)) << @intCast(@as(c_int, 4)));
    n = ((n & @as(c_int, 65280)) >> @intCast(@as(c_int, 8))) | ((n & @as(c_int, 255)) << @intCast(@as(c_int, 8)));
    return n;
}
pub fn stbi__bit_reverse(v: c_int, arg_bits: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var bits = arg_bits;
    _ = &bits;
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "stbi__bit_reverse".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(bits <= @as(c_int, 16))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "bits <= 16",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 4346);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    return stbi__bitreverse16(v) >> @intCast(@as(c_int, 16) - bits);
}
pub fn stbi__zbuild_huffman(z: [*c]stbi__zhuffman, sizelist: [*c]const stbi_uc, num: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var k: c_int = 0;
    _ = &k;
    var code: c_int = undefined;
    _ = &code;
    var next_code: [16]c_int = undefined;
    _ = &next_code;
    var sizes: [17]c_int = undefined;
    _ = &sizes;
    _ = memset(@ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(&sizes))))), 0, @sizeOf(@TypeOf(sizes)));
    _ = memset(@ptrCast(@alignCast(@as([*c]stbi__uint16, @ptrCast(@alignCast(&z.*.fast))))), 0, @sizeOf(@TypeOf(z.*.fast)));
    {
        i = 0;
        while (i < num) : (i += 1) {
            sizes[sizelist[@bitCast(@as(isize, @intCast(i)))]] += 1;
        }
    }
    sizes[@as(c_int, 0)] = 0;
    {
        i = 1;
        while (i < @as(c_int, 16)) : (i += 1) if (sizes[@bitCast(@as(isize, @intCast(i)))] > (@as(c_int, 1) << @intCast(i))) return stbi__err("Corrupt PNG");
    }
    code = 0;
    {
        i = 1;
        while (i < @as(c_int, 16)) : (i += 1) {
            next_code[@bitCast(@as(isize, @intCast(i)))] = code;
            z.*.firstcode[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(c_short, @truncate(code)));
            z.*.firstsymbol[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(c_short, @truncate(k)));
            code = code + sizes[@bitCast(@as(isize, @intCast(i)))];
            if (sizes[@bitCast(@as(isize, @intCast(i)))] != 0) if ((code - @as(c_int, 1)) >= (@as(c_int, 1) << @intCast(i))) return stbi__err("Corrupt PNG");
            z.*.maxcode[@bitCast(@as(isize, @intCast(i)))] = code << @intCast(@as(c_int, 16) - i);
            code <<= @intCast(@as(c_int, 1));
            k += sizes[@bitCast(@as(isize, @intCast(i)))];
        }
    }
    z.*.maxcode[@as(c_int, 16)] = 65536;
    {
        i = 0;
        while (i < num) : (i += 1) {
            var s: c_int = sizelist[@bitCast(@as(isize, @intCast(i)))];
            _ = &s;
            if (s != 0) {
                var c: c_int = (next_code[@bitCast(@as(isize, @intCast(s)))] - @as(c_int, z.*.firstcode[@bitCast(@as(isize, @intCast(s)))])) + @as(c_int, z.*.firstsymbol[@bitCast(@as(isize, @intCast(s)))]);
                _ = &c;
                var fastv: stbi__uint16 = @bitCast(@as(c_short, @truncate((s << @intCast(@as(c_int, 9))) | i)));
                _ = &fastv;
                z.*.size[@bitCast(@as(isize, @intCast(c)))] = @bitCast(@as(i8, @truncate(s)));
                z.*.value[@bitCast(@as(isize, @intCast(c)))] = @bitCast(@as(c_short, @truncate(i)));
                if (s <= STBI__ZFAST_BITS) {
                    var j: c_int = stbi__bit_reverse(next_code[@bitCast(@as(isize, @intCast(s)))], s);
                    _ = &j;
                    while (j < (@as(c_int, 1) << @intCast(STBI__ZFAST_BITS))) {
                        z.*.fast[@bitCast(@as(isize, @intCast(j)))] = fastv;
                        j += @as(c_int, 1) << @intCast(s);
                    }
                }
                next_code[@bitCast(@as(isize, @intCast(s)))] += 1;
            }
        }
    }
    return 1;
}
pub const stbi__zbuf = extern struct {
    zbuffer: [*c]stbi_uc = null,
    zbuffer_end: [*c]stbi_uc = null,
    num_bits: c_int = 0,
    hit_zeof_once: c_int = 0,
    code_buffer: stbi__uint32 = 0,
    zout: [*c]u8 = null,
    zout_start: [*c]u8 = null,
    zout_end: [*c]u8 = null,
    z_expandable: c_int = 0,
    z_length: stbi__zhuffman = @import("std").mem.zeroes(stbi__zhuffman),
    z_distance: stbi__zhuffman = @import("std").mem.zeroes(stbi__zhuffman),
};
pub fn stbi__zeof(z: [*c]stbi__zbuf) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(z.*.zbuffer >= z.*.zbuffer_end);
}
pub fn stbi__zget8(z: [*c]stbi__zbuf) callconv(.c) stbi_uc {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(i8, @truncate(if (stbi__zeof(z) != 0) @as(c_int, 0) else @as(c_int, (blk: {
        const ref = &z.*.zbuffer;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).*))));
}
pub fn stbi__fill_bits(z: [*c]stbi__zbuf) callconv(.c) void {
    @setEvalBranchQuota(100000);
    while (true) {
        if (z.*.code_buffer >= (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, z.*.num_bits)))))) {
            z.*.zbuffer = z.*.zbuffer_end;
            return;
        }
        z.*.code_buffer |= @as(c_uint, stbi__zget8(z)) << @intCast(@as(c_uint, @bitCast(@as(c_int, z.*.num_bits))));
        z.*.num_bits += 8;
        if (!(z.*.num_bits <= @as(c_int, 24))) break;
    }
}
pub fn stbi__zreceive(z: [*c]stbi__zbuf, n: c_int) callconv(.c) c_uint {
    @setEvalBranchQuota(100000);
    var k: c_uint = undefined;
    _ = &k;
    if (z.*.num_bits < n) {
        stbi__fill_bits(z);
    }
    k = z.*.code_buffer & @as(stbi__uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(n)) - @as(c_int, 1))));
    z.*.code_buffer >>= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, n))));
    z.*.num_bits -= n;
    return k;
}
pub fn stbi__zhuffman_decode_slowpath(a: [*c]stbi__zbuf, z: [*c]stbi__zhuffman) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var b: c_int = undefined;
    _ = &b;
    var s: c_int = undefined;
    _ = &s;
    var k: c_int = undefined;
    _ = &k;
    k = stbi__bit_reverse(@bitCast(@as(c_uint, @truncate(a.*.code_buffer))), 16);
    {
        s = STBI__ZFAST_BITS + @as(c_int, 1);
        while (true) : (s += 1) if (k < z.*.maxcode[@bitCast(@as(isize, @intCast(s)))]) break;
    }
    if (s >= @as(c_int, 16)) return -@as(c_int, 1);
    b = ((k >> @intCast(@as(c_int, 16) - s)) - @as(c_int, z.*.firstcode[@bitCast(@as(isize, @intCast(s)))])) + @as(c_int, z.*.firstsymbol[@bitCast(@as(isize, @intCast(s)))]);
    if (b >= STBI__ZNSYMS) return -@as(c_int, 1);
    if (@as(c_int, z.*.size[@bitCast(@as(isize, @intCast(b)))]) != s) return -@as(c_int, 1);
    a.*.code_buffer >>= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, s))));
    a.*.num_bits -= s;
    return z.*.value[@bitCast(@as(isize, @intCast(b)))];
}
pub fn stbi__zhuffman_decode(a: [*c]stbi__zbuf, z: [*c]stbi__zhuffman) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var b: c_int = undefined;
    _ = &b;
    var s: c_int = undefined;
    _ = &s;
    if (a.*.num_bits < @as(c_int, 16)) {
        if (stbi__zeof(a) != 0) {
            if (!(a.*.hit_zeof_once != 0)) {
                a.*.hit_zeof_once = 1;
                a.*.num_bits += 16;
            } else {
                return -@as(c_int, 1);
            }
        } else {
            stbi__fill_bits(a);
        }
    }
    b = z.*.fast[a.*.code_buffer & @as(stbi__uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(STBI__ZFAST_BITS)) - @as(c_int, 1))))];
    if (b != 0) {
        s = b >> @intCast(@as(c_int, 9));
        a.*.code_buffer >>= @intCast(@as(stbi__uint32, @bitCast(@as(c_int, s))));
        a.*.num_bits -= s;
        return b & @as(c_int, 511);
    }
    return stbi__zhuffman_decode_slowpath(a, z);
}
pub fn stbi__zexpand(z: [*c]stbi__zbuf, zout: [*c]u8, n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var q: [*c]u8 = undefined;
    _ = &q;
    var cur: c_uint = undefined;
    _ = &cur;
    var limit: c_uint = undefined;
    _ = &limit;
    var old_limit: c_uint = undefined;
    _ = &old_limit;
    z.*.zout = zout;
    if (!(z.*.z_expandable != 0)) return stbi__err("Corrupt PNG");
    cur = @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(z.*.zout) -% @intFromPtr(z.*.zout_start))), @sizeOf(u8)))));
    limit = blk: {
        const tmp = @as(c_uint, @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(z.*.zout_end) -% @intFromPtr(z.*.zout_start))), @sizeOf(u8))))));
        old_limit = tmp;
        break :blk tmp;
    };
    if ((@as(c_uint, 4294967295) -% cur) < @as(c_uint, @bitCast(@as(c_int, n)))) return stbi__err("Out of memory");
    while ((cur +% @as(c_uint, @bitCast(@as(c_int, n)))) > limit) {
        if (limit > (@as(c_uint, 4294967295) / @as(Uint32, 2))) return stbi__err("Out of memory");
        limit *%= 2;
    }
    q = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(z.*.zout_start)), limit)));
    _ = @sizeOf(@TypeOf(old_limit));
    if (@as(?*anyopaque, @ptrCast(@alignCast(q))) == @as(?*anyopaque, null)) return stbi__err("Out of memory");
    z.*.zout_start = q;
    z.*.zout = q + cur;
    z.*.zout_end = q + limit;
    return 1;
}
pub const stbi__zlength_base: [31]c_int = [31]c_int{
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    13,
    15,
    17,
    19,
    23,
    27,
    31,
    35,
    43,
    51,
    59,
    67,
    83,
    99,
    115,
    131,
    163,
    195,
    227,
    258,
    0,
    0,
};
pub const stbi__zlength_extra: [31]c_int = [31]c_int{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    3,
    3,
    3,
    3,
    4,
    4,
    4,
    4,
    5,
    5,
    5,
    5,
    0,
    0,
    0,
};
pub const stbi__zdist_base: [32]c_int = [32]c_int{
    1,
    2,
    3,
    4,
    5,
    7,
    9,
    13,
    17,
    25,
    33,
    49,
    65,
    97,
    129,
    193,
    257,
    385,
    513,
    769,
    1025,
    1537,
    2049,
    3073,
    4097,
    6145,
    8193,
    12289,
    16385,
    24577,
    0,
    0,
};
pub const stbi__zdist_extra: [32]c_int = [30]c_int{
    0,
    0,
    0,
    0,
    1,
    1,
    2,
    2,
    3,
    3,
    4,
    4,
    5,
    5,
    6,
    6,
    7,
    7,
    8,
    8,
    9,
    9,
    10,
    10,
    11,
    11,
    12,
    12,
    13,
    13,
} ++ @as([2]c_int, @splat(0));
pub fn stbi__parse_huffman_block(a: [*c]stbi__zbuf) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var zout: [*c]u8 = a.*.zout;
    _ = &zout;
    while (true) {
        var z: c_int = stbi__zhuffman_decode(a, &a.*.z_length);
        _ = &z;
        if (z < @as(c_int, 256)) {
            if (z < @as(c_int, 0)) return stbi__err("Corrupt PNG");
            if (zout >= a.*.zout_end) {
                if (!(stbi__zexpand(a, zout, 1) != 0)) return 0;
                zout = a.*.zout;
            }
            (blk: {
                const ref = &zout;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = @bitCast(@as(i8, @truncate(z)));
        } else {
            var p: [*c]stbi_uc = undefined;
            _ = &p;
            var len: c_int = undefined;
            _ = &len;
            var dist: c_int = undefined;
            _ = &dist;
            if (z == @as(c_int, 256)) {
                a.*.zout = zout;
                if ((a.*.hit_zeof_once != 0) and (a.*.num_bits < @as(c_int, 16))) {
                    return stbi__err("Corrupt PNG");
                }
                return 1;
            }
            if (z >= @as(c_int, 286)) return stbi__err("Corrupt PNG");
            z -= 257;
            len = stbi__zlength_base[@bitCast(@as(isize, @intCast(z)))];
            if (stbi__zlength_extra[@bitCast(@as(isize, @intCast(z)))] != 0) {
                {
                    const ref = &len;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% stbi__zreceive(a, stbi__zlength_extra[@bitCast(@as(isize, @intCast(z)))]))));
                }
            }
            z = stbi__zhuffman_decode(a, &a.*.z_distance);
            if ((z < @as(c_int, 0)) or (z >= @as(c_int, 30))) return stbi__err("Corrupt PNG");
            dist = stbi__zdist_base[@bitCast(@as(isize, @intCast(z)))];
            if (stbi__zdist_extra[@bitCast(@as(isize, @intCast(z)))] != 0) {
                {
                    const ref = &dist;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_uint, @bitCast(@as(c_int, ref.*))) +% stbi__zreceive(a, stbi__zdist_extra[@bitCast(@as(isize, @intCast(z)))]))));
                }
            }
            if (@divExact(@as(c_long, @bitCast(@intFromPtr(zout) -% @intFromPtr(a.*.zout_start))), @sizeOf(u8)) < @as(c_long, dist)) return stbi__err("Corrupt PNG");
            if (@as(c_long, len) > @divExact(@as(c_long, @bitCast(@intFromPtr(a.*.zout_end) -% @intFromPtr(zout))), @sizeOf(u8))) {
                if (!(stbi__zexpand(a, zout, len) != 0)) return 0;
                zout = a.*.zout;
            }
            p = @ptrCast(@alignCast(zout - @as(usize, @bitCast(@as(isize, @intCast(dist))))));
            if (dist == @as(c_int, 1)) {
                var v: stbi_uc = p.*;
                _ = &v;
                if (len != 0) {
                    while (true) {
                        (blk: {
                            const ref = &zout;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(v);
                        if (!((blk: {
                            const ref = &len;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) != 0)) break;
                    }
                }
            } else {
                if (len != 0) {
                    while (true) {
                        (blk: {
                            const ref = &zout;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate((blk: {
                            const ref = &p;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*);
                        if (!((blk: {
                            const ref = &len;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) != 0)) break;
                    }
                }
            }
        }
    }
    return undefined;
}
pub fn stbi__compute_huffman_codes(a: [*c]stbi__zbuf) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_length_dezigzag = struct {
        const length_dezigzag: [19]stbi_uc = [19]stbi_uc{
            16,
            17,
            18,
            0,
            8,
            7,
            9,
            6,
            10,
            5,
            11,
            4,
            12,
            3,
            13,
            2,
            14,
            1,
            15,
        };
    };
    _ = &static_local_length_dezigzag;
    var z_codelength: stbi__zhuffman = undefined;
    _ = &z_codelength;
    var lencodes: [455]stbi_uc = undefined;
    _ = &lencodes;
    var codelength_sizes: [19]stbi_uc = undefined;
    _ = &codelength_sizes;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    var hlit: c_int = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 5) +% @as(c_uint, 257))));
    _ = &hlit;
    var hdist: c_int = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 5) +% @as(c_uint, 1))));
    _ = &hdist;
    var hclen: c_int = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 4) +% @as(c_uint, 4))));
    _ = &hclen;
    var ntot: c_int = hlit + hdist;
    _ = &ntot;
    _ = memset(@ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&codelength_sizes))))), 0, @sizeOf(@TypeOf(codelength_sizes)));
    {
        i = 0;
        while (i < hclen) : (i += 1) {
            var s: c_int = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 3))));
            _ = &s;
            codelength_sizes[static_local_length_dezigzag.length_dezigzag[@bitCast(@as(isize, @intCast(i)))]] = @bitCast(@as(i8, @truncate(s)));
        }
    }
    if (!(stbi__zbuild_huffman(&z_codelength, @ptrCast(@alignCast(&codelength_sizes)), 19) != 0)) return 0;
    n = 0;
    while (n < ntot) {
        var c: c_int = stbi__zhuffman_decode(a, &z_codelength);
        _ = &c;
        if ((c < @as(c_int, 0)) or (c >= @as(c_int, 19))) return stbi__err("Corrupt PNG");
        if (c < @as(c_int, 16)) {
            lencodes[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &n;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = @bitCast(@as(i8, @truncate(c)));
        } else {
            var fill: stbi_uc = 0;
            _ = &fill;
            if (c == @as(c_int, 16)) {
                c = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 2) +% @as(c_uint, 3))));
                if (n == @as(c_int, 0)) return stbi__err("Corrupt PNG");
                fill = lencodes[@bitCast(@as(isize, @intCast(n - @as(c_int, 1))))];
            } else if (c == @as(c_int, 17)) {
                c = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 3) +% @as(c_uint, 3))));
            } else if (c == @as(c_int, 18)) {
                c = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 7) +% @as(c_uint, 11))));
            } else {
                return stbi__err("Corrupt PNG");
            }
            if ((ntot - n) < c) return stbi__err("Corrupt PNG");
            _ = memset(@ptrCast(@alignCast(@as([*c]stbi_uc, @ptrCast(@alignCast(&lencodes))) + @as(usize, @bitCast(@as(isize, @intCast(n)))))), fill, @bitCast(@as(c_long, c)));
            n += c;
        }
    }
    if (n != ntot) return stbi__err("Corrupt PNG");
    if (!(stbi__zbuild_huffman(&a.*.z_length, @ptrCast(@alignCast(&lencodes)), hlit) != 0)) return 0;
    if (!(stbi__zbuild_huffman(&a.*.z_distance, @as([*c]stbi_uc, @ptrCast(@alignCast(&lencodes))) + @as(usize, @bitCast(@as(isize, @intCast(hlit)))), hdist) != 0)) return 0;
    return 1;
}
pub fn stbi__parse_uncompressed_block(a: [*c]stbi__zbuf) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var header: [4]stbi_uc = undefined;
    _ = &header;
    var len: c_int = undefined;
    _ = &len;
    var nlen: c_int = undefined;
    _ = &nlen;
    var k: c_int = undefined;
    _ = &k;
    if ((a.*.num_bits & @as(c_int, 7)) != 0) {
        _ = stbi__zreceive(a, a.*.num_bits & @as(c_int, 7));
    }
    k = 0;
    while (a.*.num_bits > @as(c_int, 0)) {
        header[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &k;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = @truncate(a.*.code_buffer & @as(stbi__uint32, 255));
        a.*.code_buffer >>= @intCast(@as(stbi__uint32, 8));
        a.*.num_bits -= 8;
    }
    if (a.*.num_bits < @as(c_int, 0)) return stbi__err("Corrupt PNG");
    while (k < @as(c_int, 4)) {
        header[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &k;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = stbi__zget8(a);
    }
    len = (@as(c_int, header[@as(c_int, 1)]) * @as(c_int, 256)) + @as(c_int, header[@as(c_int, 0)]);
    nlen = (@as(c_int, header[@as(c_int, 3)]) * @as(c_int, 256)) + @as(c_int, header[@as(c_int, 2)]);
    if (nlen != (len ^ @as(c_int, 65535))) return stbi__err("Corrupt PNG");
    if ((a.*.zbuffer + @as(usize, @bitCast(@as(isize, @intCast(len))))) > a.*.zbuffer_end) return stbi__err("Corrupt PNG");
    if ((a.*.zout + @as(usize, @bitCast(@as(isize, @intCast(len))))) > a.*.zout_end) if (!(stbi__zexpand(a, a.*.zout, len) != 0)) return 0;
    _ = memcpy(@ptrCast(@alignCast(a.*.zout)), @ptrCast(@alignCast(a.*.zbuffer)), @bitCast(@as(c_long, len)));
    a.*.zbuffer += @as(usize, @bitCast(@as(isize, @intCast(len))));
    a.*.zout += @as(usize, @bitCast(@as(isize, @intCast(len))));
    return 1;
}
pub fn stbi__parse_zlib_header(a: [*c]stbi__zbuf) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var cmf: c_int = stbi__zget8(a);
    _ = &cmf;
    var cm: c_int = cmf & @as(c_int, 15);
    _ = &cm;
    var flg: c_int = stbi__zget8(a);
    _ = &flg;
    if (stbi__zeof(a) != 0) return stbi__err("Corrupt PNG");
    if (__helpers.signedRemainder((cmf * @as(c_int, 256)) + flg, @as(c_int, 31)) != @as(c_int, 0)) return stbi__err("Corrupt PNG");
    if ((flg & @as(c_int, 32)) != 0) return stbi__err("Corrupt PNG");
    if (cm != @as(c_int, 8)) return stbi__err("Corrupt PNG");
    return 1;
}
pub const stbi__zdefault_length: [288]stbi_uc = [288]stbi_uc{
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
};
pub const stbi__zdefault_distance: [32]stbi_uc = [32]stbi_uc{
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
};
pub fn stbi__parse_zlib(a: [*c]stbi__zbuf, parse_header: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var final: c_int = undefined;
    _ = &final;
    var @"type": c_int = undefined;
    _ = &@"type";
    if (parse_header != 0) if (!(stbi__parse_zlib_header(a) != 0)) return 0;
    a.*.num_bits = 0;
    a.*.code_buffer = 0;
    a.*.hit_zeof_once = 0;
    while (true) {
        final = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 1))));
        @"type" = @bitCast(@as(c_uint, @truncate(stbi__zreceive(a, 2))));
        if (@"type" == @as(c_int, 0)) {
            if (!(stbi__parse_uncompressed_block(a) != 0)) return 0;
        } else if (@"type" == @as(c_int, 3)) {
            return 0;
        } else {
            if (@"type" == @as(c_int, 1)) {
                if (!(stbi__zbuild_huffman(&a.*.z_length, @ptrCast(@alignCast(&stbi__zdefault_length)), STBI__ZNSYMS) != 0)) return 0;
                if (!(stbi__zbuild_huffman(&a.*.z_distance, @ptrCast(@alignCast(&stbi__zdefault_distance)), 32) != 0)) return 0;
            } else {
                if (!(stbi__compute_huffman_codes(a) != 0)) return 0;
            }
            if (!(stbi__parse_huffman_block(a) != 0)) return 0;
        }
        if (!!(final != 0)) break;
    }
    return 1;
}
pub fn stbi__do_zlib(a: [*c]stbi__zbuf, obuf: [*c]u8, olen: c_int, exp_1: c_int, parse_header: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    a.*.zout_start = obuf;
    a.*.zout = obuf;
    a.*.zout_end = obuf + @as(usize, @bitCast(@as(isize, @intCast(olen))));
    a.*.z_expandable = exp_1;
    return stbi__parse_zlib(a, parse_header);
}
pub fn stbi_zlib_decode_malloc_guesssize_headerflag(buffer: [*c]const u8, len: c_int, initial_size: c_int, outlen: [*c]c_int, parse_header: c_int) callconv(.c) [*c]u8 {
    @setEvalBranchQuota(100000);
    var a: stbi__zbuf = undefined;
    _ = &a;
    var p: [*c]u8 = @ptrCast(@alignCast(stbi__malloc(@bitCast(@as(c_long, initial_size)))));
    _ = &p;
    if (@as(?*anyopaque, @ptrCast(@alignCast(p))) == @as(?*anyopaque, null)) return null;
    a.zbuffer = @ptrCast(@alignCast(@constCast(buffer)));
    a.zbuffer_end = @as([*c]stbi_uc, @ptrCast(@alignCast(@constCast(buffer)))) + @as(usize, @bitCast(@as(isize, @intCast(len))));
    if (stbi__do_zlib(&a, p, initial_size, 1, parse_header) != 0) {
        if (outlen != null) {
            outlen.* = @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(a.zout) -% @intFromPtr(a.zout_start))), @sizeOf(u8)));
        }
        return a.zout_start;
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(a.zout_start)));
        return null;
    }
}
pub const stbi__pngchunk = extern struct {
    length: stbi__uint32 = 0,
    type: stbi__uint32 = 0,
};
pub fn stbi__get_chunk_header(s: [*c]stbi__context) callconv(.c) stbi__pngchunk {
    @setEvalBranchQuota(100000);
    var c: stbi__pngchunk = undefined;
    _ = &c;
    c.length = stbi__get32be(s);
    c.type = stbi__get32be(s);
    return c;
}
pub fn stbi__check_png_header(s: [*c]stbi__context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_png_sig = struct {
        const png_sig: [8]stbi_uc = [8]stbi_uc{
            137,
            80,
            78,
            71,
            13,
            10,
            26,
            10,
        };
    };
    _ = &static_local_png_sig;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < @as(c_int, 8)) : (i += 1) if (@as(c_int, stbi__get8(s)) != @as(c_int, static_local_png_sig.png_sig[@bitCast(@as(isize, @intCast(i)))])) return stbi__err("Not a PNG");
    }
    return 1;
}
pub const stbi__png = extern struct {
    s: [*c]stbi__context = null,
    idata: [*c]stbi_uc = null,
    expanded: [*c]stbi_uc = null,
    out: [*c]stbi_uc = null,
    depth: c_int = 0,
};
pub const STBI__F_none: c_int = 0;
pub const STBI__F_sub: c_int = 1;
pub const STBI__F_up: c_int = 2;
pub const STBI__F_avg: c_int = 3;
pub const STBI__F_paeth: c_int = 4;
pub const STBI__F_avg_first: c_int = 5;
pub var first_row_filter: [5]stbi_uc = [5]stbi_uc{
    STBI__F_none,
    STBI__F_sub,
    STBI__F_none,
    STBI__F_avg_first,
    STBI__F_sub,
};
pub fn stbi__paeth(a: c_int, b: c_int, c: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var thresh: c_int = (c * @as(c_int, 3)) - (a + b);
    _ = &thresh;
    var lo: c_int = if (a < b) a else b;
    _ = &lo;
    var hi: c_int = if (a < b) b else a;
    _ = &hi;
    var t0: c_int = if (hi <= thresh) lo else c;
    _ = &t0;
    var t1: c_int = if (thresh <= lo) hi else t0;
    _ = &t1;
    return t1;
}
pub const stbi__depth_scale_table: [9]stbi_uc = [9]stbi_uc{
    0,
    255,
    85,
    0,
    17,
    0,
    0,
    0,
    1,
};
pub fn stbi__create_png_alpha_expand8(dest: [*c]stbi_uc, src: [*c]stbi_uc, x: stbi__uint32, img_n: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [30:0]u8 = "stbi__create_png_alpha_expand8".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    if (img_n == @as(c_int, 1)) {
        {
            i = @bitCast(@as(c_uint, @truncate(x -% @as(stbi__uint32, 1))));
            while (i >= @as(c_int, 0)) : (i -= 1) {
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 1))))] = 255;
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 2)) + @as(c_int, 0))))] = src[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    } else {
        while (true) {
            while (!(img_n == @as(c_int, 3))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "img_n == 3",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 4917);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        {
            i = @bitCast(@as(c_uint, @truncate(x -% @as(stbi__uint32, 1))));
            while (i >= @as(c_int, 0)) : (i -= 1) {
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 4)) + @as(c_int, 3))))] = 255;
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 4)) + @as(c_int, 2))))] = src[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 2))))];
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 4)) + @as(c_int, 1))))] = src[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 1))))];
                dest[@bitCast(@as(isize, @intCast((i * @as(c_int, 4)) + @as(c_int, 0))))] = src[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 0))))];
            }
        }
    }
}
pub fn stbi__create_png_image_raw(a: [*c]stbi__png, arg_raw: [*c]stbi_uc, raw_len: stbi__uint32, out_n: c_int, x: stbi__uint32, y: stbi__uint32, depth: c_int, color: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var raw = arg_raw;
    _ = &raw;
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "stbi__create_png_image_raw".*;
    };
    _ = &static_local___func__;
    var bytes: c_int = undefined;
    _ = &bytes;
    var s: [*c]stbi__context = undefined;
    _ = &s;
    var i: stbi__uint32 = undefined;
    _ = &i;
    var j: stbi__uint32 = undefined;
    _ = &j;
    var stride: stbi__uint32 = undefined;
    _ = &stride;
    var img_len: stbi__uint32 = undefined;
    _ = &img_len;
    var img_width_bytes: stbi__uint32 = undefined;
    _ = &img_width_bytes;
    var filter_buf: [*c]stbi_uc = undefined;
    _ = &filter_buf;
    var all_ok: c_int = undefined;
    _ = &all_ok;
    var k: c_int = undefined;
    _ = &k;
    var img_n: c_int = undefined;
    _ = &img_n;
    var output_bytes: c_int = undefined;
    _ = &output_bytes;
    var filter_bytes: c_int = undefined;
    _ = &filter_bytes;
    var width: c_int = undefined;
    _ = &width;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "out_n == s->img_n || out_n == s->img_n+1",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var cur: [*c]stbi_uc = undefined;
    _ = &cur;
    var prior: [*c]stbi_uc = undefined;
    _ = &prior;
    var dest: [*c]stbi_uc = undefined;
    _ = &dest;
    var nk: c_int = undefined;
    _ = &nk;
    var filter: c_int = undefined;
    _ = &filter;
    var scale: stbi_uc = undefined;
    _ = &scale;
    var in: [*c]stbi_uc = undefined;
    _ = &in;
    var out: [*c]stbi_uc = undefined;
    _ = &out;
    var inb: stbi_uc = undefined;
    _ = &inb;
    var nsmp: stbi__uint32 = undefined;
    _ = &nsmp;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "depth == 1",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var dest16: [*c]stbi__uint16 = undefined;
    _ = &dest16;
    var nsmp_3: stbi__uint32 = undefined;
    _ = &nsmp_3;
    const static_local_sdl_assert_data_4 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "img_n+1 == out_n",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_4;
    var sdl_assert_state_5: SDL_AssertState = undefined;
    _ = &sdl_assert_state_5;
    const static_local_sdl_assert_data_6 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "img_n == 3",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_6;
    var sdl_assert_state_7: SDL_AssertState = undefined;
    _ = &sdl_assert_state_7;
    i +%= 1;
    dest16 += 1;
    i +%= 1;
    dest16 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
    i +%= 1;
    dest16 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                bytes = if (depth == @as(c_int, 16)) @as(c_int, 2) else @as(c_int, 1);
                s = a.*.s;
                stride = (x *% @as(stbi__uint32, @bitCast(@as(c_int, out_n)))) *% @as(stbi__uint32, @bitCast(@as(c_int, bytes)));
                all_ok = 1;
                img_n = s.*.img_n;
                output_bytes = out_n * bytes;
                filter_bytes = img_n * bytes;
                width = @bitCast(@as(c_uint, @truncate(x)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                a.*.out = @ptrCast(@alignCast(stbi__malloc_mad3(@bitCast(@as(c_uint, @truncate(x))), @bitCast(@as(c_uint, @truncate(y))), output_bytes, 0)));
                if (!(a.*.out != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            4 => {
                if (!((out_n == s.*.img_n) or (out_n == (s.*.img_n + @as(c_int, 1))))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 4943);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                return stbi__err("Out of memory");
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (!(stbi__mad3sizes_valid(img_n, @bitCast(@as(c_uint, @truncate(x))), depth, 7) != 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                return stbi__err("Corrupt PNG");
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                img_width_bytes = (((@as(stbi__uint32, @bitCast(@as(c_int, img_n))) *% x) *% @as(stbi__uint32, @bitCast(@as(c_int, depth)))) +% @as(stbi__uint32, 7)) >> @intCast(@as(stbi__uint32, 3));
                if (!(stbi__mad2sizes_valid(@bitCast(@as(c_uint, @truncate(img_width_bytes))), @bitCast(@as(c_uint, @truncate(y))), @bitCast(@as(c_uint, @truncate(img_width_bytes)))) != 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                return stbi__err("Corrupt PNG");
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                img_len = (img_width_bytes +% @as(stbi__uint32, 1)) *% y;
                if (raw_len < img_len) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                return stbi__err("Corrupt PNG");
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                filter_buf = @ptrCast(@alignCast(stbi__malloc_mad2(@bitCast(@as(c_uint, @truncate(img_width_bytes))), 2, 0)));
                if (!(filter_buf != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return stbi__err("Out of memory");
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (depth < @as(c_int, 8)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                filter_bytes = 1;
                width = @bitCast(@as(c_uint, @truncate(img_width_bytes)));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                j = 0;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (j < y) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                cur = filter_buf + ((j & @as(stbi__uint32, 1)) *% img_width_bytes);
                prior = filter_buf + ((~j & @as(stbi__uint32, 1)) *% img_width_bytes);
                dest = a.*.out + (stride *% j);
                nk = width * filter_bytes;
                filter = (blk: {
                    const ref = &raw;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                if (filter > @as(c_int, 4)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                j +%= 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                SDL_free_REAL(@ptrCast(@alignCast(filter_buf)));
                if (!(all_ok != 0)) {
                    sdl_pc = 172;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            35 => {
                all_ok = stbi__err("Corrupt PNG");
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (j == @as(stbi__uint32, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                filter = first_row_filter[@bitCast(@as(isize, @intCast(filter)))];
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                switch (filter) {
                    STBI__F_none => {
                        sdl_pc = 42;
                        continue;
                    },
                    STBI__F_sub => {
                        sdl_pc = 43;
                        continue;
                    },
                    STBI__F_up => {
                        sdl_pc = 48;
                        continue;
                    },
                    STBI__F_avg => {
                        sdl_pc = 53;
                        continue;
                    },
                    STBI__F_paeth => {
                        sdl_pc = 62;
                        continue;
                    },
                    STBI__F_avg_first => {
                        sdl_pc = 71;
                        continue;
                    },
                    else => {
                        sdl_pc = 41;
                        continue;
                    },
                }
            },
            41 => {
                raw += @as(usize, @bitCast(@as(isize, @intCast(nk))));
                if (depth < @as(c_int, 8)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            42 => {
                _ = memcpy(@ptrCast(@alignCast(cur)), @ptrCast(@alignCast(raw)), @bitCast(@as(c_long, nk)));
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            43 => {
                _ = memcpy(@ptrCast(@alignCast(cur)), @ptrCast(@alignCast(raw)), @bitCast(@as(c_long, filter_bytes)));
                k = filter_bytes;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                if (k < nk) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + @as(c_int, cur[@bitCast(@as(isize, @intCast(k - filter_bytes)))])) & @as(c_int, 255)))));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                k += 1;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            48 => {
                k = 0;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                if (k < nk) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + @as(c_int, prior[@bitCast(@as(isize, @intCast(k)))])) & @as(c_int, 255)))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                k += 1;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            53 => {
                k = 0;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (k < filter_bytes) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + (@as(c_int, prior[@bitCast(@as(isize, @intCast(k)))]) >> @intCast(@as(c_int, 1)))) & @as(c_int, 255)))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                k += 1;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                k = filter_bytes;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (k < nk) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            59 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + ((@as(c_int, prior[@bitCast(@as(isize, @intCast(k)))]) + @as(c_int, cur[@bitCast(@as(isize, @intCast(k - filter_bytes)))])) >> @intCast(@as(c_int, 1)))) & @as(c_int, 255)))));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                k += 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            62 => {
                k = 0;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                if (k < filter_bytes) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + @as(c_int, prior[@bitCast(@as(isize, @intCast(k)))])) & @as(c_int, 255)))));
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                k += 1;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                k = filter_bytes;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (k < nk) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + stbi__paeth(cur[@bitCast(@as(isize, @intCast(k - filter_bytes)))], prior[@bitCast(@as(isize, @intCast(k)))], prior[@bitCast(@as(isize, @intCast(k - filter_bytes)))])) & @as(c_int, 255)))));
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                k += 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            71 => {
                _ = memcpy(@ptrCast(@alignCast(cur)), @ptrCast(@alignCast(raw)), @bitCast(@as(c_long, filter_bytes)));
                k = filter_bytes;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                if (k < nk) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                cur[@bitCast(@as(isize, @intCast(k)))] = @as(stbi_uc, @bitCast(@as(i8, @truncate((@as(c_int, raw[@bitCast(@as(isize, @intCast(k)))]) + (@as(c_int, cur[@bitCast(@as(isize, @intCast(k - filter_bytes)))]) >> @intCast(@as(c_int, 1)))) & @as(c_int, 255)))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                k += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            76 => {
                scale = @bitCast(@as(i8, @truncate(if (color == @as(c_int, 0)) @as(c_int, stbi__depth_scale_table[@bitCast(@as(isize, @intCast(depth)))]) else @as(c_int, 1))));
                in = cur;
                out = dest;
                inb = 0;
                nsmp = x *% @as(stbi__uint32, @bitCast(@as(c_int, img_n)));
                if (depth == @as(c_int, 4)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            77 => {
                if (depth == @as(c_int, 8)) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            79 => {
                i = 0;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            80 => {
                if (depth == @as(c_int, 2)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            81 => {
                if (img_n != out_n) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            82 => {
                if (i < nsmp) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            83 => {
                if ((i & @as(stbi__uint32, 1)) == @as(stbi__uint32, 0)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            84 => {
                i +%= 1;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            86 => {
                inb = (blk: {
                    const ref = &in;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                (blk: {
                    const ref = &out;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(@as(c_int, scale) * (@as(c_int, inb) >> @intCast(@as(c_int, 4))))));
                {
                    const ref = &inb;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 4)))));
                }
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            89 => {
                i = 0;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            92 => {
                if (i < nsmp) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                if ((i & @as(stbi__uint32, 3)) == @as(stbi__uint32, 0)) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            94 => {
                i +%= 1;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            96 => {
                inb = (blk: {
                    const ref = &in;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                (blk: {
                    const ref = &out;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(@as(c_int, scale) * (@as(c_int, inb) >> @intCast(@as(c_int, 6))))));
                {
                    const ref = &inb;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 2)))));
                }
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            100 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                i = 0;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            102 => {
                if (!(depth == @as(c_int, 1))) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5043);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            108 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            111 => {
                if (i < nsmp) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                if ((i & @as(stbi__uint32, 7)) == @as(stbi__uint32, 0)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            113 => {
                i +%= 1;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            115 => {
                inb = (blk: {
                    const ref = &in;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                (blk: {
                    const ref = &out;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(i8, @truncate(@as(c_int, scale) * (@as(c_int, inb) >> @intCast(@as(c_int, 7))))));
                {
                    const ref = &inb;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 1)))));
                }
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            118 => {
                stbi__create_png_alpha_expand8(dest, dest, x, img_n);
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            121 => {
                if (img_n == out_n) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            122 => {
                if (depth == @as(c_int, 16)) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            124 => {
                _ = memcpy(@ptrCast(@alignCast(dest)), @ptrCast(@alignCast(cur)), x *% @as(stbi__uint32, @bitCast(@as(c_int, img_n))));
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            125 => {
                stbi__create_png_alpha_expand8(dest, cur, x, img_n);
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            127 => {
                dest16 = @ptrCast(@alignCast(dest));
                nsmp_3 = x *% @as(stbi__uint32, @bitCast(@as(c_int, img_n)));
                if (img_n == out_n) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            130 => {
                i = 0;
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            133 => {
                if (i < nsmp_3) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            134 => {
                dest16.* = @bitCast(@as(c_short, @truncate((@as(c_int, cur[@as(c_int, 0)]) << @intCast(@as(c_int, 8))) | @as(c_int, cur[@as(c_int, 1)]))));
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                cur += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            138 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                if (img_n == @as(c_int, 1)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            140 => {
                if (!((img_n + @as(c_int, 1)) == out_n)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                sdl_assert_state_5 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_4.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5068);
                if (sdl_assert_state_5 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            144 => {
                if (sdl_assert_state_5 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            146 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            149 => {
                i = 0;
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            152 => {
                if (i < x) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            153 => {
                dest16[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate((@as(c_int, cur[@as(c_int, 0)]) << @intCast(@as(c_int, 8))) | @as(c_int, cur[@as(c_int, 1)]))));
                dest16[@as(c_int, 1)] = 65535;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                cur += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            155 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            156 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            157 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                i = 0;
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            159 => {
                if (!(img_n == @as(c_int, 3))) {
                    sdl_pc = 160;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                sdl_assert_state_7 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_6.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5075);
                if (sdl_assert_state_7 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            162 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            163 => {
                if (sdl_assert_state_7 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            165 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            166 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            168 => {
                if (i < x) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            169 => {
                dest16[@as(c_int, 0)] = @bitCast(@as(c_short, @truncate((@as(c_int, cur[@as(c_int, 0)]) << @intCast(@as(c_int, 8))) | @as(c_int, cur[@as(c_int, 1)]))));
                dest16[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate((@as(c_int, cur[@as(c_int, 2)]) << @intCast(@as(c_int, 8))) | @as(c_int, cur[@as(c_int, 3)]))));
                dest16[@as(c_int, 2)] = @bitCast(@as(c_short, @truncate((@as(c_int, cur[@as(c_int, 4)]) << @intCast(@as(c_int, 8))) | @as(c_int, cur[@as(c_int, 5)]))));
                dest16[@as(c_int, 3)] = 65535;
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                cur += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 6)))));
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            172 => {
                return 0;
            },
            173 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            174 => {
                return 1;
            },
            else => unreachable,
        }
    }
}
pub fn stbi__create_png_image(a: [*c]stbi__png, arg_image_data: [*c]stbi_uc, arg_image_data_len: stbi__uint32, out_n: c_int, depth: c_int, color: c_int, interlaced: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var image_data = arg_image_data;
    _ = &image_data;
    var image_data_len = arg_image_data_len;
    _ = &image_data_len;
    var bytes: c_int = if (depth == @as(c_int, 16)) @as(c_int, 2) else @as(c_int, 1);
    _ = &bytes;
    var out_bytes: c_int = out_n * bytes;
    _ = &out_bytes;
    var final: [*c]stbi_uc = undefined;
    _ = &final;
    var p: c_int = undefined;
    _ = &p;
    if (!(interlaced != 0)) return stbi__create_png_image_raw(a, image_data, image_data_len, out_n, a.*.s.*.img_x, a.*.s.*.img_y, depth, color);
    final = @ptrCast(@alignCast(stbi__malloc_mad3(@bitCast(@as(c_uint, @truncate(a.*.s.*.img_x))), @bitCast(@as(c_uint, @truncate(a.*.s.*.img_y))), out_bytes, 0)));
    if (!(final != null)) return stbi__err("Out of memory");
    {
        p = 0;
        while (p < @as(c_int, 7)) : (p += 1) {
            var xorig: [7]c_int = [7]c_int{
                0,
                4,
                0,
                2,
                0,
                1,
                0,
            };
            _ = &xorig;
            var yorig: [7]c_int = [7]c_int{
                0,
                0,
                4,
                0,
                2,
                0,
                1,
            };
            _ = &yorig;
            var xspc: [7]c_int = [7]c_int{
                8,
                8,
                4,
                4,
                2,
                2,
                1,
            };
            _ = &xspc;
            var yspc: [7]c_int = [7]c_int{
                8,
                8,
                8,
                4,
                4,
                2,
                2,
            };
            _ = &yspc;
            var i: c_int = undefined;
            _ = &i;
            var j: c_int = undefined;
            _ = &j;
            var x: c_int = undefined;
            _ = &x;
            var y: c_int = undefined;
            _ = &y;
            x = @bitCast(@as(c_uint, @truncate((((a.*.s.*.img_x -% @as(stbi__uint32, @bitCast(@as(c_int, xorig[@bitCast(@as(isize, @intCast(p)))])))) +% @as(stbi__uint32, @bitCast(@as(c_int, xspc[@bitCast(@as(isize, @intCast(p)))])))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, xspc[@bitCast(@as(isize, @intCast(p)))]))))));
            y = @bitCast(@as(c_uint, @truncate((((a.*.s.*.img_y -% @as(stbi__uint32, @bitCast(@as(c_int, yorig[@bitCast(@as(isize, @intCast(p)))])))) +% @as(stbi__uint32, @bitCast(@as(c_int, yspc[@bitCast(@as(isize, @intCast(p)))])))) -% @as(stbi__uint32, 1)) / @as(stbi__uint32, @bitCast(@as(c_int, yspc[@bitCast(@as(isize, @intCast(p)))]))))));
            if ((x != 0) and (y != 0)) {
                var img_len: stbi__uint32 = @bitCast(@as(c_int, (((((a.*.s.*.img_n * x) * depth) + @as(c_int, 7)) >> @intCast(@as(c_int, 3))) + @as(c_int, 1)) * y));
                _ = &img_len;
                if (!(stbi__create_png_image_raw(a, image_data, image_data_len, out_n, @bitCast(@as(c_int, x)), @bitCast(@as(c_int, y)), depth, color) != 0)) {
                    SDL_free_REAL(@ptrCast(@alignCast(final)));
                    return 0;
                }
                {
                    j = 0;
                    while (j < y) : (j += 1) {
                        {
                            i = 0;
                            while (i < x) : (i += 1) {
                                var out_y: c_int = (j * yspc[@bitCast(@as(isize, @intCast(p)))]) + yorig[@bitCast(@as(isize, @intCast(p)))];
                                _ = &out_y;
                                var out_x: c_int = (i * xspc[@bitCast(@as(isize, @intCast(p)))]) + xorig[@bitCast(@as(isize, @intCast(p)))];
                                _ = &out_x;
                                _ = memcpy(@ptrCast(@alignCast((final + ((@as(stbi__uint32, @bitCast(@as(c_int, out_y))) *% a.*.s.*.img_x) *% @as(stbi__uint32, @bitCast(@as(c_int, out_bytes))))) + @as(usize, @bitCast(@as(isize, @intCast(out_x * out_bytes)))))), @ptrCast(@alignCast(a.*.out + @as(usize, @bitCast(@as(isize, @intCast(((j * x) + i) * out_bytes)))))), @bitCast(@as(c_long, out_bytes)));
                            }
                        }
                    }
                }
                SDL_free_REAL(@ptrCast(@alignCast(a.*.out)));
                image_data += img_len;
                image_data_len -%= img_len;
            }
        }
    }
    a.*.out = final;
    return 1;
}
pub fn stbi__compute_transparency(z: [*c]stbi__png, tc: [*c]stbi_uc, out_n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [26:0]u8 = "stbi__compute_transparency".*;
    };
    _ = &static_local___func__;
    var s: [*c]stbi__context = z.*.s;
    _ = &s;
    var i: stbi__uint32 = undefined;
    _ = &i;
    var pixel_count: stbi__uint32 = s.*.img_x *% s.*.img_y;
    _ = &pixel_count;
    var p: [*c]stbi_uc = z.*.out;
    _ = &p;
    while (true) {
        while (!((out_n == @as(c_int, 2)) or (out_n == @as(c_int, 4)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "out_n == 2 || out_n == 4",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5146);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    if (out_n == @as(c_int, 2)) {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                p[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(if (@as(c_int, p[@as(c_int, 0)]) == @as(c_int, tc[@as(c_int, 0)])) @as(c_int, 0) else @as(c_int, 255))));
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
    } else {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                if (((@as(c_int, p[@as(c_int, 0)]) == @as(c_int, tc[@as(c_int, 0)])) and (@as(c_int, p[@as(c_int, 1)]) == @as(c_int, tc[@as(c_int, 1)]))) and (@as(c_int, p[@as(c_int, 2)]) == @as(c_int, tc[@as(c_int, 2)]))) {
                    p[@as(c_int, 3)] = 0;
                }
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    return 1;
}
pub fn stbi__compute_transparency16(z: [*c]stbi__png, tc: [*c]stbi__uint16, out_n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "stbi__compute_transparency16".*;
    };
    _ = &static_local___func__;
    var s: [*c]stbi__context = z.*.s;
    _ = &s;
    var i: stbi__uint32 = undefined;
    _ = &i;
    var pixel_count: stbi__uint32 = s.*.img_x *% s.*.img_y;
    _ = &pixel_count;
    var p: [*c]stbi__uint16 = @ptrCast(@alignCast(z.*.out));
    _ = &p;
    while (true) {
        while (!((out_n == @as(c_int, 2)) or (out_n == @as(c_int, 4)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "out_n == 2 || out_n == 4",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5171);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    if (out_n == @as(c_int, 2)) {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                p[@as(c_int, 1)] = @bitCast(@as(c_short, @truncate(if (@as(c_int, p[@as(c_int, 0)]) == @as(c_int, tc[@as(c_int, 0)])) @as(c_int, 0) else @as(c_int, 65535))));
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
    } else {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                if (((@as(c_int, p[@as(c_int, 0)]) == @as(c_int, tc[@as(c_int, 0)])) and (@as(c_int, p[@as(c_int, 1)]) == @as(c_int, tc[@as(c_int, 1)]))) and (@as(c_int, p[@as(c_int, 2)]) == @as(c_int, tc[@as(c_int, 2)]))) {
                    p[@as(c_int, 3)] = 0;
                }
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    return 1;
}
pub fn stbi__expand_png_palette(a: [*c]stbi__png, palette: [*c]stbi_uc, len: c_int, pal_img_n: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: stbi__uint32 = undefined;
    _ = &i;
    var pixel_count: stbi__uint32 = a.*.s.*.img_x *% a.*.s.*.img_y;
    _ = &pixel_count;
    var p: [*c]stbi_uc = undefined;
    _ = &p;
    var temp_out: [*c]stbi_uc = undefined;
    _ = &temp_out;
    var orig: [*c]stbi_uc = a.*.out;
    _ = &orig;
    p = @ptrCast(@alignCast(stbi__malloc_mad2(@bitCast(@as(c_uint, @truncate(pixel_count))), pal_img_n, 0)));
    if (@as(?*anyopaque, @ptrCast(@alignCast(p))) == @as(?*anyopaque, null)) return stbi__err("Out of memory");
    temp_out = p;
    if (pal_img_n == @as(c_int, 3)) {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                var n: c_int = @as(c_int, orig[i]) * @as(c_int, 4);
                _ = &n;
                p[@as(c_int, 0)] = palette[@bitCast(@as(isize, @intCast(n)))];
                p[@as(c_int, 1)] = palette[@bitCast(@as(isize, @intCast(n + @as(c_int, 1))))];
                p[@as(c_int, 2)] = palette[@bitCast(@as(isize, @intCast(n + @as(c_int, 2))))];
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
        }
    } else {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                var n: c_int = @as(c_int, orig[i]) * @as(c_int, 4);
                _ = &n;
                p[@as(c_int, 0)] = palette[@bitCast(@as(isize, @intCast(n)))];
                p[@as(c_int, 1)] = palette[@bitCast(@as(isize, @intCast(n + @as(c_int, 1))))];
                p[@as(c_int, 2)] = palette[@bitCast(@as(isize, @intCast(n + @as(c_int, 2))))];
                p[@as(c_int, 3)] = palette[@bitCast(@as(isize, @intCast(n + @as(c_int, 3))))];
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(a.*.out)));
    a.*.out = temp_out;
    _ = @sizeOf(@TypeOf(len));
    return 1;
}
pub var stbi__unpremultiply_on_load_global: c_int = 0;
pub var stbi__de_iphone_flag_global: c_int = 0;
pub fn stbi__de_iphone(z: [*c]stbi__png) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "stbi__de_iphone".*;
    };
    _ = &static_local___func__;
    var s: [*c]stbi__context = z.*.s;
    _ = &s;
    var i: stbi__uint32 = undefined;
    _ = &i;
    var pixel_count: stbi__uint32 = s.*.img_x *% s.*.img_y;
    _ = &pixel_count;
    var p: [*c]stbi_uc = z.*.out;
    _ = &p;
    if (s.*.img_out_n == @as(c_int, 3)) {
        {
            i = 0;
            while (i < pixel_count) : (i +%= 1) {
                var t: stbi_uc = p[@as(c_int, 0)];
                _ = &t;
                p[@as(c_int, 0)] = p[@as(c_int, 2)];
                p[@as(c_int, 2)] = t;
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
        }
    } else {
        while (true) {
            while (!(s.*.img_out_n == @as(c_int, 4))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "s->img_out_n == 4",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "stb_image.h", 5281);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        if (stbi__unpremultiply_on_load_global != 0) {
            {
                i = 0;
                while (i < pixel_count) : (i +%= 1) {
                    var a: stbi_uc = p[@as(c_int, 3)];
                    _ = &a;
                    var t: stbi_uc = p[@as(c_int, 0)];
                    _ = &t;
                    if (@as(c_int, a) != 0) {
                        var half: stbi_uc = @bitCast(@as(i8, @truncate(@divTrunc(@as(c_int, a), @as(c_int, 2)))));
                        _ = &half;
                        p[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(@divTrunc((@as(c_int, p[@as(c_int, 2)]) * @as(c_int, 255)) + @as(c_int, half), @as(c_int, a)))));
                        p[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(@divTrunc((@as(c_int, p[@as(c_int, 1)]) * @as(c_int, 255)) + @as(c_int, half), @as(c_int, a)))));
                        p[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@divTrunc((@as(c_int, t) * @as(c_int, 255)) + @as(c_int, half), @as(c_int, a)))));
                    } else {
                        p[@as(c_int, 0)] = p[@as(c_int, 2)];
                        p[@as(c_int, 2)] = t;
                    }
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                }
            }
        } else {
            {
                i = 0;
                while (i < pixel_count) : (i +%= 1) {
                    var t: stbi_uc = p[@as(c_int, 0)];
                    _ = &t;
                    p[@as(c_int, 0)] = p[@as(c_int, 2)];
                    p[@as(c_int, 2)] = t;
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                }
            }
        }
    }
}
pub fn stbi__parse_png_file(z: [*c]stbi__png, scan: c_int, arg_req_comp: c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var req_comp = arg_req_comp;
    _ = &req_comp;
    var _palette: [1024]stbi_uc = undefined;
    _ = &_palette;
    var pal_img_n: stbi_uc = undefined;
    _ = &pal_img_n;
    var palette: [*c]stbi_uc = undefined;
    _ = &palette;
    var has_trans: stbi_uc = undefined;
    _ = &has_trans;
    var tc: [3]stbi_uc = undefined;
    _ = &tc;
    var tc16: [3]stbi__uint16 = undefined;
    _ = &tc16;
    var ioff: stbi__uint32 = undefined;
    _ = &ioff;
    var idata_limit: stbi__uint32 = undefined;
    _ = &idata_limit;
    var i: stbi__uint32 = undefined;
    _ = &i;
    var pal_len: stbi__uint32 = undefined;
    _ = &pal_len;
    var first: c_int = undefined;
    _ = &first;
    var k: c_int = undefined;
    _ = &k;
    var interlace: c_int = undefined;
    _ = &interlace;
    var color: c_int = undefined;
    _ = &color;
    var is_iphone: c_int = undefined;
    _ = &is_iphone;
    var s: [*c]stbi__context = undefined;
    _ = &s;
    var c: stbi__pngchunk = undefined;
    _ = &c;
    var comp: c_int = undefined;
    _ = &comp;
    var filter: c_int = undefined;
    _ = &filter;
    var idata_limit_old: stbi__uint32 = undefined;
    _ = &idata_limit_old;
    var p: [*c]stbi_uc = undefined;
    _ = &p;
    var raw_len: stbi__uint32 = undefined;
    _ = &raw_len;
    var bpl: stbi__uint32 = undefined;
    _ = &bpl;
    const static_local_invalid_chunk = struct {
        var invalid_chunk: [24:0]u8 = "XXXX PNG chunk not known".*;
    };
    _ = &static_local_invalid_chunk;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _palette = [1]stbi_uc{
                    0,
                } ++ @as([1023]stbi_uc, @splat(0));
                pal_img_n = 0;
                palette = @ptrCast(@alignCast(&_palette));
                has_trans = 0;
                tc = [1]stbi_uc{
                    0,
                } ++ @as([2]stbi_uc, @splat(0));
                tc16 = [1]stbi__uint16{
                    0,
                } ++ @as([2]stbi__uint16, @splat(0));
                ioff = 0;
                idata_limit = 0;
                pal_len = 0;
                first = 1;
                interlace = 0;
                color = 0;
                is_iphone = 0;
                s = z.*.s;
                if (palette_buffer != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (palette_buffer_len < @as(c_int, 256)) {
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
                z.*.expanded = null;
                z.*.idata = null;
                z.*.out = null;
                if (!(stbi__check_png_header(s) != 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            4 => {
                return stbi__err("palette buffer len must be 256");
            },
            5 => {
                if (req_comp != @as(c_int, 1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                return stbi__err("req_comp must be 1 when loading paletted");
            },
            8 => {
                palette = @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(@alignCast(palette_buffer)))));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                return 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (scan == STBI__SCAN_type) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return 1;
            },
            14 => {
                {
                    sdl_pc = 15;
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
                if (true) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                c = stbi__get_chunk_header(s);
                switch (c.type) {
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'C')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'g')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'I')))) => {
                        sdl_pc = 21;
                        continue;
                    },
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'I')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'H')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'D')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'R')))) => {
                        sdl_pc = 22;
                        continue;
                    },
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'P')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'L')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'T')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E')))) => {
                        sdl_pc = 71;
                        continue;
                    },
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 't')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'N')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'S')))) => {
                        sdl_pc = 85;
                        continue;
                    },
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'I')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'D')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'T')))) => {
                        sdl_pc = 128;
                        continue;
                    },
                    (((@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'I')))) << @intCast(@as(c_uint, 24))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E')))) << @intCast(@as(c_uint, 16)))) +% (@as(c_uint, @bitCast(@as(c_int, @as(c_int, 'N')))) << @intCast(@as(c_uint, 8)))) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'D')))) => {
                        sdl_pc = 162;
                        continue;
                    },
                    else => {
                        sdl_pc = 214;
                        continue;
                    },
                }
            },
            18 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                return undefined;
            },
            20 => {
                _ = stbi__get32be(s);
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                is_iphone = 1;
                stbi__skip(s, @bitCast(@as(c_uint, @truncate(c.length))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            22 => {
                if (!(first != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return stbi__err("Corrupt PNG");
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                first = 0;
                if (c.length != @as(stbi__uint32, 13)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                return stbi__err("Corrupt PNG");
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                s.*.img_x = stbi__get32be(s);
                s.*.img_y = stbi__get32be(s);
                if (s.*.img_y > @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 24)))))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                return stbi__err("Very large image (corrupt?)");
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (s.*.img_x > @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 24)))))) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                return stbi__err("Very large image (corrupt?)");
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                z.*.depth = stbi__get8(s);
                if (((((z.*.depth != @as(c_int, 1)) and (z.*.depth != @as(c_int, 2))) and (z.*.depth != @as(c_int, 4))) and (z.*.depth != @as(c_int, 8))) and (z.*.depth != @as(c_int, 16))) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                return stbi__err("PNG not supported: 1/2/4/8/16-bit only");
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                color = stbi__get8(s);
                if (color > @as(c_int, 6)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                return stbi__err("Corrupt PNG");
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if ((color == @as(c_int, 3)) and (z.*.depth == @as(c_int, 16))) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                return stbi__err("Corrupt PNG");
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (color == @as(c_int, 3)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                pal_img_n = 3;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if ((color & @as(c_int, 1)) != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                comp = stbi__get8(s);
                if (comp != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                return stbi__err("Corrupt PNG");
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                return stbi__err("Corrupt PNG");
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                filter = stbi__get8(s);
                if (filter != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                return stbi__err("Corrupt PNG");
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                interlace = stbi__get8(s);
                if (interlace > @as(c_int, 1)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                return stbi__err("Corrupt PNG");
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (!(s.*.img_x != 0) or !(s.*.img_y != 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                return stbi__err("Corrupt PNG");
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if (!(@as(c_int, pal_img_n) != 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                s.*.img_n = (if ((color & @as(c_int, 2)) != 0) @as(c_int, 3) else @as(c_int, 1)) + (if ((color & @as(c_int, 4)) != 0) @as(c_int, 1) else @as(c_int, 0));
                if (((@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 30))))) / s.*.img_x) / @as(stbi__uint32, @bitCast(@as(c_int, s.*.img_n)))) < s.*.img_y) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                s.*.img_n = 1;
                if (((@as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 30))))) / s.*.img_x) / @as(stbi__uint32, 4)) < s.*.img_y) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            65 => {
                return stbi__err("Image too large to decode");
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            68 => {
                return stbi__err("Corrupt PNG");
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            71 => {
                if (first != 0) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                return stbi__err("Corrupt PNG");
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                if (c.length > @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 256) * @as(c_int, 3))))) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                return stbi__err("Corrupt PNG");
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                pal_len = c.length / @as(stbi__uint32, 3);
                if ((pal_len *% @as(stbi__uint32, 3)) != c.length) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                return stbi__err("Corrupt PNG");
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                i = 0;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if (i < pal_len) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                palette[(i *% @as(stbi__uint32, 4)) +% @as(stbi__uint32, 0)] = stbi__get8(s);
                palette[(i *% @as(stbi__uint32, 4)) +% @as(stbi__uint32, 1)] = stbi__get8(s);
                palette[(i *% @as(stbi__uint32, 4)) +% @as(stbi__uint32, 2)] = stbi__get8(s);
                palette[(i *% @as(stbi__uint32, 4)) +% @as(stbi__uint32, 3)] = 255;
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                i +%= 1;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            85 => {
                if (first != 0) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                return stbi__err("Corrupt PNG");
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                if (z.*.idata != null) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                return stbi__err("Corrupt PNG");
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                if (@as(c_int, pal_img_n) != 0) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                if (scan == STBI__SCAN_header) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            93 => {
                if (!((s.*.img_n & @as(c_int, 1)) != 0)) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            95 => {
                s.*.img_n = 4;
                return 1;
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                if (pal_len == @as(stbi__uint32, 0)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                return stbi__err("Corrupt PNG");
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                if (c.length > pal_len) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                return stbi__err("Corrupt PNG");
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                pal_img_n = 4;
                i = 0;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                if (i < c.length) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            105 => {
                palette[(i *% @as(stbi__uint32, 4)) +% @as(stbi__uint32, 3)] = stbi__get8(s);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                i +%= 1;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            108 => {
                return stbi__err("Corrupt PNG");
            },
            109 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                if (c.length != (@as(stbi__uint32, @bitCast(@as(c_int, s.*.img_n))) *% @as(stbi__uint32, 2))) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                return stbi__err("Corrupt PNG");
            },
            112 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                has_trans = 1;
                if (scan == STBI__SCAN_header) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                s.*.img_n += 1;
                return 1;
            },
            115 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                if (z.*.depth == @as(c_int, 16)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                k = 0;
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            118 => {
                k = 0;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            120 => {
                if ((k < s.*.img_n) and (k < @as(c_int, 3))) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            121 => {
                tc16[@bitCast(@as(isize, @intCast(k)))] = @bitCast(@as(c_short, @truncate(stbi__get16be(s))));
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                k += 1;
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            124 => {
                if ((k < s.*.img_n) and (k < @as(c_int, 3))) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            125 => {
                tc[@bitCast(@as(isize, @intCast(k)))] = @bitCast(@as(i8, @truncate(@as(c_int, @as(stbi_uc, @bitCast(@as(i8, @truncate(stbi__get16be(s) & @as(c_int, 255)))))) * @as(c_int, stbi__depth_scale_table[@bitCast(@as(isize, @intCast(z.*.depth)))]))));
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                k += 1;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            128 => {
                if (first != 0) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                return stbi__err("Corrupt PNG");
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                if ((@as(c_int, pal_img_n) != 0) and !(pal_len != 0)) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                return stbi__err("Corrupt PNG");
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                if (scan == STBI__SCAN_header) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                if (@as(c_int, pal_img_n) != 0) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                if (c.length > (@as(c_uint, 1) << @intCast(@as(c_uint, 30)))) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            138 => {
                s.*.img_n = pal_img_n;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                return 1;
            },
            141 => {
                return stbi__err("IDAT section larger than 2^30 bytes");
            },
            142 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            143 => {
                if (@as(c_int, @bitCast(@as(c_uint, @truncate(ioff +% c.length)))) < @as(c_int, @bitCast(@as(c_uint, @truncate(ioff))))) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                return 0;
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                if ((ioff +% c.length) > idata_limit) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                idata_limit_old = idata_limit;
                if (idata_limit == @as(stbi__uint32, 0)) {
                    sdl_pc = 150;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                if (!(stbi__getn(s, z.*.idata + ioff, @bitCast(@as(c_uint, @truncate(c.length)))) != 0)) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            150 => {
                idata_limit = if (c.length > @as(stbi__uint32, 4096)) c.length else @as(stbi__uint32, 4096);
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            153 => {
                if ((ioff +% c.length) > idata_limit) {
                    sdl_pc = 154;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                idata_limit *%= 2;
                {
                    sdl_pc = 153;
                    continue;
                }
            },
            155 => {
                _ = @sizeOf(@TypeOf(idata_limit_old));
                p = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(z.*.idata)), idata_limit)));
                if (@as(?*anyopaque, @ptrCast(@alignCast(p))) == @as(?*anyopaque, null)) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                return stbi__err("Out of memory");
            },
            157 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                z.*.idata = p;
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            159 => {
                return stbi__err("Corrupt PNG");
            },
            160 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                ioff +%= c.length;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            162 => {
                if (first != 0) {
                    sdl_pc = 163;
                    continue;
                } else {
                    sdl_pc = 164;
                    continue;
                }
            },
            163 => {
                return stbi__err("Corrupt PNG");
            },
            164 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                if (scan != STBI__SCAN_load) {
                    sdl_pc = 166;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            166 => {
                return 1;
            },
            167 => {
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                if (@as(?*anyopaque, @ptrCast(@alignCast(z.*.idata))) == @as(?*anyopaque, null)) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            169 => {
                return stbi__err("Corrupt PNG");
            },
            170 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                bpl = ((s.*.img_x *% @as(stbi__uint32, @bitCast(@as(c_int, z.*.depth)))) +% @as(stbi__uint32, 7)) / @as(stbi__uint32, 8);
                raw_len = ((bpl *% s.*.img_y) *% @as(stbi__uint32, @bitCast(@as(c_int, s.*.img_n)))) +% s.*.img_y;
                z.*.expanded = @ptrCast(@alignCast(stbi_zlib_decode_malloc_guesssize_headerflag(@ptrCast(@alignCast(z.*.idata)), @bitCast(@as(c_uint, @truncate(ioff))), @bitCast(@as(c_uint, @truncate(raw_len))), @ptrCast(@alignCast(&raw_len)), @intFromBool(!(is_iphone != 0)))));
                if (@as(?*anyopaque, @ptrCast(@alignCast(z.*.expanded))) == @as(?*anyopaque, null)) {
                    sdl_pc = 172;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            172 => {
                return 0;
            },
            173 => {
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            174 => {
                SDL_free_REAL(@ptrCast(@alignCast(z.*.idata)));
                z.*.idata = null;
                if ((((req_comp == (s.*.img_n + @as(c_int, 1))) and (req_comp != @as(c_int, 3))) and !(@as(c_int, pal_img_n) != 0)) or (@as(c_int, has_trans) != 0)) {
                    sdl_pc = 175;
                    continue;
                } else {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                s.*.img_out_n = s.*.img_n + @as(c_int, 1);
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            176 => {
                s.*.img_out_n = s.*.img_n;
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                if (!(stbi__create_png_image(z, z.*.expanded, raw_len, s.*.img_out_n, z.*.depth, color, interlace) != 0)) {
                    sdl_pc = 178;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            178 => {
                return 0;
            },
            179 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                if (@as(c_int, has_trans) != 0) {
                    sdl_pc = 181;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            181 => {
                if (z.*.depth == @as(c_int, 16)) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 185;
                    continue;
                }
            },
            182 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                if (((is_iphone != 0) and (stbi__de_iphone_flag_global != 0)) and (s.*.img_out_n > @as(c_int, 2))) {
                    sdl_pc = 193;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            184 => {
                if (!(stbi__compute_transparency16(z, @ptrCast(@alignCast(&tc16)), s.*.img_out_n) != 0)) {
                    sdl_pc = 187;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            185 => {
                if (!(stbi__compute_transparency(z, @ptrCast(@alignCast(&tc)), s.*.img_out_n) != 0)) {
                    sdl_pc = 190;
                    continue;
                } else {
                    sdl_pc = 191;
                    continue;
                }
            },
            186 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            187 => {
                return 0;
            },
            188 => {
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            190 => {
                return 0;
            },
            191 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            193 => {
                stbi__de_iphone(z);
                {
                    sdl_pc = 195;
                    continue;
                }
            },
            194 => {
                {
                    sdl_pc = 195;
                    continue;
                }
            },
            195 => {
                if (@as(c_int, pal_img_n) != 0) {
                    sdl_pc = 196;
                    continue;
                } else {
                    sdl_pc = 197;
                    continue;
                }
            },
            196 => {
                s.*.img_n = pal_img_n;
                s.*.img_out_n = pal_img_n;
                if (req_comp >= @as(c_int, 3)) {
                    sdl_pc = 199;
                    continue;
                } else {
                    sdl_pc = 200;
                    continue;
                }
            },
            197 => {
                if (@as(c_int, has_trans) != 0) {
                    sdl_pc = 208;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            198 => {
                SDL_free_REAL(@ptrCast(@alignCast(z.*.expanded)));
                z.*.expanded = null;
                _ = stbi__get32be(s);
                if ((s.*.io.skip != null) and (s.*.img_buffer_end > s.*.img_buffer)) {
                    sdl_pc = 211;
                    continue;
                } else {
                    sdl_pc = 212;
                    continue;
                }
            },
            199 => {
                s.*.img_out_n = req_comp;
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            201 => {
                if (!(palette_buffer != null)) {
                    sdl_pc = 202;
                    continue;
                } else {
                    sdl_pc = 203;
                    continue;
                }
            },
            202 => {
                if (!(stbi__expand_png_palette(z, palette, @bitCast(@as(c_uint, @truncate(pal_len))), s.*.img_out_n) != 0)) {
                    sdl_pc = 205;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            203 => {
                {
                    sdl_pc = 204;
                    continue;
                }
            },
            204 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            205 => {
                return 0;
            },
            206 => {
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            207 => {
                {
                    sdl_pc = 204;
                    continue;
                }
            },
            208 => {
                s.*.img_n += 1;
                {
                    sdl_pc = 210;
                    continue;
                }
            },
            209 => {
                {
                    sdl_pc = 210;
                    continue;
                }
            },
            210 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            211 => {
                s.*.io.skip.?(s.*.io_user_data, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(s.*.img_buffer) -% @intFromPtr(s.*.img_buffer_end))), @sizeOf(stbi_uc))));
                {
                    sdl_pc = 213;
                    continue;
                }
            },
            212 => {
                {
                    sdl_pc = 213;
                    continue;
                }
            },
            213 => {
                return 1;
            },
            214 => {
                if (first != 0) {
                    sdl_pc = 215;
                    continue;
                } else {
                    sdl_pc = 216;
                    continue;
                }
            },
            215 => {
                return stbi__err("Corrupt PNG");
            },
            216 => {
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            217 => {
                if ((c.type & @as(stbi__uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 29)))))) == @as(stbi__uint32, 0)) {
                    sdl_pc = 218;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            218 => {
                static_local_invalid_chunk.invalid_chunk[@as(c_int, 0)] = @truncate(@as(stbi_uc, @truncate((c.type >> @intCast(@as(stbi__uint32, 24))) & @as(stbi__uint32, 255))));
                static_local_invalid_chunk.invalid_chunk[@as(c_int, 1)] = @truncate(@as(stbi_uc, @truncate((c.type >> @intCast(@as(stbi__uint32, 16))) & @as(stbi__uint32, 255))));
                static_local_invalid_chunk.invalid_chunk[@as(c_int, 2)] = @truncate(@as(stbi_uc, @truncate((c.type >> @intCast(@as(stbi__uint32, 8))) & @as(stbi__uint32, 255))));
                static_local_invalid_chunk.invalid_chunk[@as(c_int, 3)] = @truncate(@as(stbi_uc, @truncate((c.type >> @intCast(@as(stbi__uint32, 0))) & @as(stbi__uint32, 255))));
                _ = static_local_invalid_chunk.invalid_chunk;
                return stbi__err("PNG not supported: unknown PNG chunk type");
            },
            219 => {
                {
                    sdl_pc = 220;
                    continue;
                }
            },
            220 => {
                stbi__skip(s, @bitCast(@as(c_uint, @truncate(c.length))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn stbi__do_png(p: [*c]stbi__png, x: [*c]c_int, y: [*c]c_int, n: [*c]c_int, req_comp: c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int, ri: [*c]stbi__result_info) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var result: ?*anyopaque = null;
    _ = &result;
    if ((palette_buffer != null) and (req_comp != @as(c_int, 1))) {
        _ = stbi__err("req_comp must be 1 if loading paletted image without expansion");
        return null;
    }
    if ((req_comp < @as(c_int, 0)) or (req_comp > @as(c_int, 4))) {
        _ = stbi__err("Internal error");
        return null;
    }
    if (stbi__parse_png_file(p, STBI__SCAN_load, req_comp, palette_buffer, palette_buffer_len) != 0) {
        if (p.*.depth <= @as(c_int, 8)) {
            ri.*.bits_per_channel = 8;
        } else if (p.*.depth == @as(c_int, 16)) {
            ri.*.bits_per_channel = 16;
        } else return @ptrCast(@alignCast(@as([*c]u8, @ptrFromInt(@as(usize, @intCast(@intFromPtr(if (stbi__err("PNG not supported: unsupported color depth") != 0) @as(?*anyopaque, null) else @as(?*anyopaque, null))))))));
        result = @ptrCast(@alignCast(p.*.out));
        p.*.out = null;
        if ((req_comp != 0) and (req_comp != p.*.s.*.img_out_n)) {
            if (palette_buffer != null) {} else if (ri.*.bits_per_channel == @as(c_int, 8)) {
                result = @ptrCast(@alignCast(stbi__convert_format(@ptrCast(@alignCast(result)), p.*.s.*.img_out_n, req_comp, p.*.s.*.img_x, p.*.s.*.img_y)));
            } else {
                result = @ptrCast(@alignCast(stbi__convert_format16(@ptrCast(@alignCast(result)), p.*.s.*.img_out_n, req_comp, p.*.s.*.img_x, p.*.s.*.img_y)));
            }
            p.*.s.*.img_out_n = req_comp;
            if (result == @as(?*anyopaque, null)) return result;
        }
        x.* = @bitCast(@as(c_uint, @truncate(p.*.s.*.img_x)));
        y.* = @bitCast(@as(c_uint, @truncate(p.*.s.*.img_y)));
        if (n != null) {
            if (palette_buffer != null) {
                n.* = 1;
            } else {
                n.* = p.*.s.*.img_n;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(p.*.out)));
    p.*.out = null;
    SDL_free_REAL(@ptrCast(@alignCast(p.*.expanded)));
    p.*.expanded = null;
    SDL_free_REAL(@ptrCast(@alignCast(p.*.idata)));
    p.*.idata = null;
    return result;
}
pub fn stbi__png_load(s: [*c]stbi__context, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int, req_comp: c_int, palette_buffer: [*c]c_uint, palette_buffer_len: c_int, ri: [*c]stbi__result_info) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var p: stbi__png = undefined;
    _ = &p;
    p.s = s;
    return stbi__do_png(&p, x, y, comp, req_comp, palette_buffer, palette_buffer_len, ri);
}
pub fn stbi__png_test(s: [*c]stbi__context) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var r: c_int = undefined;
    _ = &r;
    r = stbi__check_png_header(s);
    stbi__rewind(s);
    return r;
}
pub const mz_ulong = c_ulong;
pub const mz_uint8 = u8;
pub const mz_uint16 = c_ushort;
pub const mz_uint32 = c_uint;
pub const mz_uint = c_uint;
pub const mz_bool = c_int;
pub const TDEFL_WRITE_ZLIB_HEADER: c_int = 4096;
pub const TDEFL_COMPUTE_ADLER32: c_int = 8192;
pub const TDEFL_GREEDY_PARSING_FLAG: c_int = 16384;
pub const TDEFL_NONDETERMINISTIC_PARSING_FLAG: c_int = 32768;
pub const TDEFL_RLE_MATCHES: c_int = 65536;
pub const TDEFL_FILTER_MATCHES: c_int = 131072;
pub const TDEFL_FORCE_ALL_STATIC_BLOCKS: c_int = 262144;
pub const TDEFL_FORCE_ALL_RAW_BLOCKS: c_int = 524288;
pub const tdefl_put_buf_func_ptr = ?*const fn (pBuf: ?*const anyopaque, len: c_int, pUser: ?*anyopaque) callconv(.c) mz_bool;
pub const TDEFL_LZ_CODE_BUF_SIZE: c_int = 65536;
pub const TDEFL_OUT_BUF_SIZE: c_int = 85196;
pub const TDEFL_LZ_HASH_SHIFT: c_int = 5;
pub const TDEFL_LZ_HASH_SIZE: c_int = 32768;
pub const TDEFL_STATUS_BAD_PARAM: c_int = -2;
pub const TDEFL_STATUS_PUT_BUF_FAILED: c_int = -1;
pub const TDEFL_STATUS_OKAY: c_int = 0;
pub const TDEFL_STATUS_DONE: c_int = 1;
pub const tdefl_status = c_int;
pub const TDEFL_NO_FLUSH: c_int = 0;
pub const TDEFL_FULL_FLUSH: c_int = 3;
pub const TDEFL_FINISH: c_int = 4;
pub const tdefl_flush = c_uint;
pub const tdefl_compressor = extern struct {
    m_pPut_buf_func: tdefl_put_buf_func_ptr = null,
    m_pPut_buf_user: ?*anyopaque = null,
    m_flags: mz_uint = 0,
    m_max_probes: [2]mz_uint = @import("std").mem.zeroes([2]mz_uint),
    m_greedy_parsing: c_int = 0,
    m_adler32: mz_uint = 0,
    m_lookahead_pos: mz_uint = 0,
    m_lookahead_size: mz_uint = 0,
    m_dict_size: mz_uint = 0,
    m_pLZ_code_buf: [*c]mz_uint8 = null,
    m_pLZ_flags: [*c]mz_uint8 = null,
    m_pOutput_buf: [*c]mz_uint8 = null,
    m_pOutput_buf_end: [*c]mz_uint8 = null,
    m_num_flags_left: mz_uint = 0,
    m_total_lz_bytes: mz_uint = 0,
    m_lz_code_buf_dict_pos: mz_uint = 0,
    m_bits_in: mz_uint = 0,
    m_bit_buffer: mz_uint = 0,
    m_saved_match_dist: mz_uint = 0,
    m_saved_match_len: mz_uint = 0,
    m_saved_lit: mz_uint = 0,
    m_output_flush_ofs: mz_uint = 0,
    m_output_flush_remaining: mz_uint = 0,
    m_finished: mz_uint = 0,
    m_block_index: mz_uint = 0,
    m_wants_to_finish: mz_uint = 0,
    m_prev_return_status: tdefl_status = @import("std").mem.zeroes(tdefl_status),
    m_pIn_buf: ?*const anyopaque = null,
    m_pOut_buf: ?*anyopaque = null,
    m_pIn_buf_size: [*c]usize = null,
    m_pOut_buf_size: [*c]usize = null,
    m_flush: tdefl_flush = @import("std").mem.zeroes(tdefl_flush),
    m_pSrc: [*c]const mz_uint8 = null,
    m_src_buf_left: usize = 0,
    m_out_buf_ofs: usize = 0,
    m_dict: [33025]mz_uint8 = @import("std").mem.zeroes([33025]mz_uint8),
    m_huff_count: [3][288]mz_uint16 = @import("std").mem.zeroes([3][288]mz_uint16),
    m_huff_codes: [3][288]mz_uint16 = @import("std").mem.zeroes([3][288]mz_uint16),
    m_huff_code_sizes: [3][288]mz_uint8 = @import("std").mem.zeroes([3][288]mz_uint8),
    m_lz_code_buf: [65536]mz_uint8 = @import("std").mem.zeroes([65536]mz_uint8),
    m_next: [32768]mz_uint16 = @import("std").mem.zeroes([32768]mz_uint16),
    m_hash: [32768]mz_uint16 = @import("std").mem.zeroes([32768]mz_uint16),
    m_output_buf: [85196]mz_uint8 = @import("std").mem.zeroes([85196]mz_uint8),
};
pub export fn mz_adler32(adler: mz_ulong, arg_ptr: [*c]const u8, arg_buf_len: usize) mz_ulong {
    @setEvalBranchQuota(100000);
    var ptr = arg_ptr;
    _ = &ptr;
    var buf_len = arg_buf_len;
    _ = &buf_len;
    var i: mz_uint32 = undefined;
    _ = &i;
    var s1: mz_uint32 = @truncate(adler & @as(mz_ulong, 65535));
    _ = &s1;
    var s2: mz_uint32 = @truncate(adler >> @intCast(@as(mz_ulong, 16)));
    _ = &s2;
    var block_len: usize = buf_len % @as(usize, 5552);
    _ = &block_len;
    if (!(ptr != null)) return @bitCast(@as(c_long, @as(c_int, 1)));
    while (buf_len != 0) {
        {
            i = 0;
            while (@as(usize, i +% @as(mz_uint32, 7)) < block_len) : ({
                i +%= 8;
                ptr += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
            }) {
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 0)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 1)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 2)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 3)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 4)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 5)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 6)])));
                s2 +%= s1;
                s1 +%= @bitCast(@as(c_int, @as(c_int, ptr[@as(c_int, 7)])));
                s2 +%= s1;
            }
        }
        while (@as(usize, i) < block_len) : (i +%= 1) {
            s1 +%= @bitCast(@as(c_int, @as(c_int, (blk: {
                const ref = &ptr;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).*)));
            s2 +%= s1;
        }
        s1 %= 65521;
        s2 %= 65521;
        buf_len -%= block_len;
        block_len = 5552;
    }
    return (s2 << @intCast(@as(mz_uint32, 16))) +% s1;
}
pub export fn mz_crc32(crc: mz_ulong, arg_ptr: [*c]const mz_uint8, arg_buf_len: usize) mz_ulong {
    @setEvalBranchQuota(100000);
    var ptr = arg_ptr;
    _ = &ptr;
    var buf_len = arg_buf_len;
    _ = &buf_len;
    const static_local_s_crc32 = struct {
        const s_crc32: [16]mz_uint32 = [16]mz_uint32{
            0,
            498536548,
            997073096,
            651767980,
            1994146192,
            1802195444,
            1303535960,
            1342533948,
            3988292384,
            4027552580,
            3604390888,
            3412177804,
            2607071920,
            2262029012,
            2685067896,
            3183342108,
        };
    };
    _ = &static_local_s_crc32;
    var crcu32: mz_uint32 = @truncate(crc);
    _ = &crcu32;
    if (!(ptr != null)) return @bitCast(@as(c_long, @as(c_int, 0)));
    crcu32 = ~crcu32;
    while ((blk: {
        const ref = &buf_len;
        const tmp = ref.*;
        ref.* -%= 1;
        break :blk tmp;
    }) != 0) {
        var b: mz_uint8 = (blk: {
            const ref = &ptr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*;
        _ = &b;
        crcu32 = (crcu32 >> @intCast(@as(mz_uint32, 4))) ^ static_local_s_crc32.s_crc32[(crcu32 & @as(mz_uint32, 15)) ^ @as(mz_uint32, @bitCast(@as(c_int, @as(c_int, b) & @as(c_int, 15))))];
        crcu32 = (crcu32 >> @intCast(@as(mz_uint32, 4))) ^ static_local_s_crc32.s_crc32[(crcu32 & @as(mz_uint32, 15)) ^ @as(mz_uint32, @bitCast(@as(c_int, @as(c_int, b) >> @intCast(@as(c_int, 4)))))];
    }
    return ~crcu32;
}
pub fn mz_free(p: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(p);
}
pub const s_tdefl_len_sym: [256]mz_uint16 = [256]mz_uint16{
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    265,
    266,
    266,
    267,
    267,
    268,
    268,
    269,
    269,
    269,
    269,
    270,
    270,
    270,
    270,
    271,
    271,
    271,
    271,
    272,
    272,
    272,
    272,
    273,
    273,
    273,
    273,
    273,
    273,
    273,
    273,
    274,
    274,
    274,
    274,
    274,
    274,
    274,
    274,
    275,
    275,
    275,
    275,
    275,
    275,
    275,
    275,
    276,
    276,
    276,
    276,
    276,
    276,
    276,
    276,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    277,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    278,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    279,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    280,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    281,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    282,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    283,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    284,
    285,
};
pub const s_tdefl_len_extra: [256]mz_uint8 = [256]mz_uint8{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    0,
};
pub const s_tdefl_small_dist_sym: [512]mz_uint8 = [512]mz_uint8{
    0,
    1,
    2,
    3,
    4,
    4,
    5,
    5,
    6,
    6,
    6,
    6,
    7,
    7,
    7,
    7,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    8,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    9,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    14,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    15,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
    17,
};
pub const s_tdefl_small_dist_extra: [512]mz_uint8 = [512]mz_uint8{
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    6,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
};
pub const s_tdefl_large_dist_sym: [128]mz_uint8 = [128]mz_uint8{
    0,
    0,
    18,
    19,
    20,
    20,
    21,
    21,
    22,
    22,
    22,
    22,
    23,
    23,
    23,
    23,
    24,
    24,
    24,
    24,
    24,
    24,
    24,
    24,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    26,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    27,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    28,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
    29,
};
pub const s_tdefl_large_dist_extra: [128]mz_uint8 = [128]mz_uint8{
    0,
    0,
    8,
    8,
    9,
    9,
    9,
    9,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    11,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
    13,
};
pub const tdefl_sym_freq = extern struct {
    m_key: mz_uint16 = 0,
    m_sym_index: mz_uint16 = 0,
};
pub fn tdefl_radix_sort_syms(num_syms: mz_uint, pSyms0: [*c]tdefl_sym_freq, pSyms1: [*c]tdefl_sym_freq) callconv(.c) [*c]tdefl_sym_freq {
    @setEvalBranchQuota(100000);
    var total_passes: mz_uint32 = 2;
    _ = &total_passes;
    var pass_shift: mz_uint32 = undefined;
    _ = &pass_shift;
    var pass: mz_uint32 = undefined;
    _ = &pass;
    var i: mz_uint32 = undefined;
    _ = &i;
    var hist: [512]mz_uint32 = undefined;
    _ = &hist;
    var pCur_syms: [*c]tdefl_sym_freq = pSyms0;
    _ = &pCur_syms;
    var pNew_syms: [*c]tdefl_sym_freq = pSyms1;
    _ = &pNew_syms;
    _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint32, @ptrCast(@alignCast(&hist))))), 0, @sizeOf(@TypeOf(hist)));
    {
        i = 0;
        while (i < num_syms) : (i +%= 1) {
            var freq: mz_uint = pSyms0[i].m_key;
            _ = &freq;
            hist[freq & @as(mz_uint, 255)] +%= 1;
            hist[@as(mz_uint, 256) +% ((freq >> @intCast(@as(mz_uint, 8))) & @as(mz_uint, 255))] +%= 1;
        }
    }
    while ((total_passes > @as(mz_uint32, 1)) and (num_syms == hist[(total_passes -% @as(mz_uint32, 1)) *% @as(mz_uint32, 256)])) {
        total_passes -%= 1;
    }
    {
        pass_shift = 0;
        pass = 0;
        while (pass < total_passes) : ({
            pass +%= 1;
            pass_shift +%= 8;
        }) {
            var pHist: [*c]const mz_uint32 = &hist[pass << @intCast(@as(mz_uint32, 8))];
            _ = &pHist;
            var offsets: [256]mz_uint = undefined;
            _ = &offsets;
            var cur_ofs: mz_uint = 0;
            _ = &cur_ofs;
            {
                i = 0;
                while (i < @as(mz_uint32, 256)) : (i +%= 1) {
                    offsets[i] = cur_ofs;
                    cur_ofs +%= pHist[i];
                }
            }
            {
                i = 0;
                while (i < num_syms) : (i +%= 1) {
                    pNew_syms[
                        blk: {
                            const ref = &offsets[(@as(mz_uint32, @bitCast(@as(c_int, @as(c_int, pCur_syms[i].m_key)))) >> @intCast(pass_shift)) & @as(mz_uint32, 255)];
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = pCur_syms[i];
                }
            }
            {
                var t: [*c]tdefl_sym_freq = pCur_syms;
                _ = &t;
                pCur_syms = pNew_syms;
                pNew_syms = t;
            }
        }
    }
    return pCur_syms;
}
pub fn tdefl_calculate_minimum_redundancy(A: [*c]tdefl_sym_freq, n: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var root: c_int = undefined;
    _ = &root;
    var leaf: c_int = undefined;
    _ = &leaf;
    var next: c_int = undefined;
    _ = &next;
    var avbl: c_int = undefined;
    _ = &avbl;
    var used: c_int = undefined;
    _ = &used;
    var dpth: c_int = undefined;
    _ = &dpth;
    if (n == @as(c_int, 0)) return else if (n == @as(c_int, 1)) {
        A[@as(c_int, 0)].m_key = 1;
        return;
    }
    {
        const ref = &A[@as(c_int, 0)].m_key;
        ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + @as(c_int, A[@as(c_int, 1)].m_key))));
    }
    root = 0;
    leaf = 2;
    {
        next = 1;
        while (next < (n - @as(c_int, 1))) : (next += 1) {
            if ((leaf >= n) or (@as(c_int, A[@bitCast(@as(isize, @intCast(root)))].m_key) < @as(c_int, A[@bitCast(@as(isize, @intCast(leaf)))].m_key))) {
                A[@bitCast(@as(isize, @intCast(next)))].m_key = A[@bitCast(@as(isize, @intCast(root)))].m_key;
                A[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &root;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ].m_key = @bitCast(@as(c_short, @truncate(next)));
            } else {
                A[@bitCast(@as(isize, @intCast(next)))].m_key = A[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &leaf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ].m_key;
            }
            if ((leaf >= n) or ((root < next) and (@as(c_int, A[@bitCast(@as(isize, @intCast(root)))].m_key) < @as(c_int, A[@bitCast(@as(isize, @intCast(leaf)))].m_key)))) {
                A[@bitCast(@as(isize, @intCast(next)))].m_key = @bitCast(@as(c_short, @truncate(@as(c_int, A[@bitCast(@as(isize, @intCast(next)))].m_key) + @as(c_int, A[@bitCast(@as(isize, @intCast(root)))].m_key))));
                A[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &root;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ].m_key = @bitCast(@as(c_short, @truncate(next)));
            } else {
                A[@bitCast(@as(isize, @intCast(next)))].m_key = @bitCast(@as(c_short, @truncate(@as(c_int, A[@bitCast(@as(isize, @intCast(next)))].m_key) + @as(c_int, A[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &leaf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ].m_key))));
            }
        }
    }
    A[@bitCast(@as(isize, @intCast(n - @as(c_int, 2))))].m_key = 0;
    {
        next = n - @as(c_int, 3);
        while (next >= @as(c_int, 0)) : (next -= 1) {
            A[@bitCast(@as(isize, @intCast(next)))].m_key = @bitCast(@as(c_short, @truncate(@as(c_int, A[A[@bitCast(@as(isize, @intCast(next)))].m_key].m_key) + @as(c_int, 1))));
        }
    }
    avbl = 1;
    used = blk: {
        const tmp = @as(c_int, 0);
        dpth = tmp;
        break :blk tmp;
    };
    root = n - @as(c_int, 2);
    next = n - @as(c_int, 1);
    while (avbl > @as(c_int, 0)) {
        while ((root >= @as(c_int, 0)) and (@as(c_int, A[@bitCast(@as(isize, @intCast(root)))].m_key) == dpth)) {
            used += 1;
            root -= 1;
        }
        while (avbl > used) {
            A[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &next;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                })))
            ].m_key = @bitCast(@as(c_short, @truncate(dpth)));
            avbl -= 1;
        }
        avbl = @as(c_int, 2) * used;
        dpth += 1;
        used = 0;
    }
}
pub const TDEFL_MAX_SUPPORTED_HUFF_CODESIZE: c_int = 32;
pub fn tdefl_huffman_enforce_max_code_size(pNum_codes: [*c]c_int, arg_code_list_len: c_int, max_code_size: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var code_list_len = arg_code_list_len;
    _ = &code_list_len;
    var i: c_int = undefined;
    _ = &i;
    var total: mz_uint32 = 0;
    _ = &total;
    if (code_list_len <= @as(c_int, 1)) return;
    {
        i = max_code_size + @as(c_int, 1);
        while (i <= TDEFL_MAX_SUPPORTED_HUFF_CODESIZE) : (i += 1) {
            pNum_codes[@bitCast(@as(isize, @intCast(max_code_size)))] += pNum_codes[@bitCast(@as(isize, @intCast(i)))];
        }
    }
    {
        i = max_code_size;
        while (i > @as(c_int, 0)) : (i -= 1) {
            total +%= @as(mz_uint32, @bitCast(@as(c_int, pNum_codes[@bitCast(@as(isize, @intCast(i)))]))) << @intCast(@as(mz_uint32, @bitCast(@as(c_int, max_code_size - i))));
        }
    }
    while (@as(c_ulong, total) != (@as(c_ulong, 1) << @intCast(@as(c_ulong, @bitCast(@as(c_long, max_code_size)))))) {
        pNum_codes[@bitCast(@as(isize, @intCast(max_code_size)))] -= 1;
        {
            i = max_code_size - @as(c_int, 1);
            while (i > @as(c_int, 0)) : (i -= 1) if (pNum_codes[@bitCast(@as(isize, @intCast(i)))] != 0) {
                pNum_codes[@bitCast(@as(isize, @intCast(i)))] -= 1;
                pNum_codes[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))] += 2;
                break;
            };
        }
        total -%= 1;
    }
}
pub fn tdefl_optimize_huffman_table(d: [*c]tdefl_compressor, table_num: c_int, table_len: c_int, code_size_limit: c_int, static_table: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var l: c_int = undefined;
    _ = &l;
    var num_codes: [33]c_int = undefined;
    _ = &num_codes;
    var next_code: [33]mz_uint = undefined;
    _ = &next_code;
    _ = memset(@ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(&num_codes))))), 0, @sizeOf(@TypeOf(num_codes)));
    if (static_table != 0) {
        {
            i = 0;
            while (i < table_len) : (i += 1) {
                num_codes[d.*.m_huff_code_sizes[@bitCast(@as(isize, @intCast(table_num)))][@bitCast(@as(isize, @intCast(i)))]] += 1;
            }
        }
    } else {
        var syms0: [288]tdefl_sym_freq = undefined;
        _ = &syms0;
        var syms1: [288]tdefl_sym_freq = undefined;
        _ = &syms1;
        var pSyms: [*c]tdefl_sym_freq = undefined;
        _ = &pSyms;
        var num_used_syms: c_int = 0;
        _ = &num_used_syms;
        var pSym_count: [*c]const mz_uint16 = &d.*.m_huff_count[@bitCast(@as(isize, @intCast(table_num)))][@as(c_int, 0)];
        _ = &pSym_count;
        {
            i = 0;
            while (i < table_len) : (i += 1) if (@as(c_int, pSym_count[@bitCast(@as(isize, @intCast(i)))]) != 0) {
                syms0[@bitCast(@as(isize, @intCast(num_used_syms)))].m_key = pSym_count[@bitCast(@as(isize, @intCast(i)))];
                syms0[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &num_used_syms;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ].m_sym_index = @bitCast(@as(c_short, @truncate(i)));
            };
        }
        pSyms = tdefl_radix_sort_syms(@bitCast(@as(c_int, num_used_syms)), @ptrCast(@alignCast(&syms0)), @ptrCast(@alignCast(&syms1)));
        tdefl_calculate_minimum_redundancy(pSyms, num_used_syms);
        {
            i = 0;
            while (i < num_used_syms) : (i += 1) {
                num_codes[pSyms[@bitCast(@as(isize, @intCast(i)))].m_key] += 1;
            }
        }
        tdefl_huffman_enforce_max_code_size(@ptrCast(@alignCast(&num_codes)), num_used_syms, code_size_limit);
        _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_huff_code_sizes[@bitCast(@as(isize, @intCast(table_num)))]))))), 0, @sizeOf(@TypeOf(d.*.m_huff_code_sizes[@bitCast(@as(isize, @intCast(table_num)))])));
        _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint16, @ptrCast(@alignCast(&d.*.m_huff_codes[@bitCast(@as(isize, @intCast(table_num)))]))))), 0, @sizeOf(@TypeOf(d.*.m_huff_codes[@bitCast(@as(isize, @intCast(table_num)))])));
        {
            i = 1;
            j = num_used_syms;
            while (i <= code_size_limit) : (i += 1) {
                l = num_codes[@bitCast(@as(isize, @intCast(i)))];
                while (l > @as(c_int, 0)) : (l -= 1) {
                    d.*.m_huff_code_sizes[@bitCast(@as(isize, @intCast(table_num)))][
                        pSyms[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &j;
                                ref.* -= 1;
                                break :blk ref.*;
                            })))
                        ].m_sym_index
                    ] = @bitCast(@as(i8, @truncate(i)));
                }
            }
        }
    }
    next_code[@as(c_int, 1)] = 0;
    {
        j = 0;
        i = 2;
        while (i <= code_size_limit) : (i += 1) {
            next_code[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(c_int, blk: {
                const tmp = (j + num_codes[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))]) << @intCast(@as(c_int, 1));
                j = tmp;
                break :blk tmp;
            }));
        }
    }
    {
        i = 0;
        while (i < table_len) : (i += 1) {
            var rev_code: mz_uint = 0;
            _ = &rev_code;
            var code: mz_uint = undefined;
            _ = &code;
            var code_size: mz_uint = undefined;
            _ = &code_size;
            if ((blk: {
                const tmp = @as(mz_uint, d.*.m_huff_code_sizes[@bitCast(@as(isize, @intCast(table_num)))][@bitCast(@as(isize, @intCast(i)))]);
                code_size = tmp;
                break :blk tmp;
            }) == @as(mz_uint, 0)) continue;
            code = blk: {
                const ref = &next_code[code_size];
                const tmp = ref.*;
                ref.* +%= 1;
                break :blk tmp;
            };
            {
                l = @bitCast(@as(c_uint, @truncate(code_size)));
                while (l > @as(c_int, 0)) : ({
                    l -= 1;
                    code >>= @intCast(@as(mz_uint, 1));
                }) {
                    rev_code = (rev_code << @intCast(@as(mz_uint, 1))) | (code & @as(mz_uint, 1));
                }
            }
            d.*.m_huff_codes[@bitCast(@as(isize, @intCast(table_num)))][@bitCast(@as(isize, @intCast(i)))] = @truncate(rev_code);
        }
    }
}
pub var s_tdefl_packed_code_size_syms_swizzle: [19]mz_uint8 = [19]mz_uint8{
    16,
    17,
    18,
    0,
    8,
    7,
    9,
    6,
    10,
    5,
    11,
    4,
    12,
    3,
    13,
    2,
    14,
    1,
    15,
};
pub fn tdefl_start_dynamic_block(d: [*c]tdefl_compressor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "tdefl_start_dynamic_block".*;
    };
    _ = &static_local___func__;
    var num_lit_codes: c_int = undefined;
    _ = &num_lit_codes;
    var num_dist_codes: c_int = undefined;
    _ = &num_dist_codes;
    var num_bit_lengths: c_int = undefined;
    _ = &num_bit_lengths;
    var i: mz_uint = undefined;
    _ = &i;
    var total_code_sizes_to_pack: mz_uint = undefined;
    _ = &total_code_sizes_to_pack;
    var num_packed_code_sizes: mz_uint = undefined;
    _ = &num_packed_code_sizes;
    var rle_z_count: mz_uint = undefined;
    _ = &rle_z_count;
    var rle_repeat_count: mz_uint = undefined;
    _ = &rle_repeat_count;
    var packed_code_sizes_index: mz_uint = undefined;
    _ = &packed_code_sizes_index;
    var code_sizes_to_pack: [320]mz_uint8 = undefined;
    _ = &code_sizes_to_pack;
    var packed_code_sizes: [320]mz_uint8 = undefined;
    _ = &packed_code_sizes;
    var prev_code_size: mz_uint8 = 255;
    _ = &prev_code_size;
    d.*.m_huff_count[@as(c_int, 0)][@as(c_int, 256)] = 1;
    tdefl_optimize_huffman_table(d, 0, TDEFL_MAX_HUFF_SYMBOLS_0, 15, @as(c_int, 0));
    tdefl_optimize_huffman_table(d, 1, TDEFL_MAX_HUFF_SYMBOLS_1, 15, @as(c_int, 0));
    {
        num_lit_codes = 286;
        while (num_lit_codes > @as(c_int, 257)) : (num_lit_codes -= 1) if (@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 0)][@bitCast(@as(isize, @intCast(num_lit_codes - @as(c_int, 1))))]) != 0) break;
    }
    {
        num_dist_codes = 30;
        while (num_dist_codes > @as(c_int, 1)) : (num_dist_codes -= 1) if (@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 1)][@bitCast(@as(isize, @intCast(num_dist_codes - @as(c_int, 1))))]) != 0) break;
    }
    _ = memcpy(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&code_sizes_to_pack))))), @ptrCast(@alignCast(&d.*.m_huff_code_sizes[@as(c_int, 0)][@as(c_int, 0)])), @bitCast(@as(c_long, num_lit_codes)));
    _ = memcpy(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&code_sizes_to_pack))) + @as(usize, @bitCast(@as(isize, @intCast(num_lit_codes)))))), @ptrCast(@alignCast(&d.*.m_huff_code_sizes[@as(c_int, 1)][@as(c_int, 0)])), @bitCast(@as(c_long, num_dist_codes)));
    total_code_sizes_to_pack = @bitCast(@as(c_int, num_lit_codes + num_dist_codes));
    num_packed_code_sizes = 0;
    rle_z_count = 0;
    rle_repeat_count = 0;
    _ = memset(@ptrCast(@alignCast(&d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)])), 0, @sizeOf(@TypeOf(d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)])) *% @as(c_ulong, TDEFL_MAX_HUFF_SYMBOLS_2));
    {
        i = 0;
        while (i < total_code_sizes_to_pack) : (i +%= 1) {
            var code_size: mz_uint8 = code_sizes_to_pack[i];
            _ = &code_size;
            if (!(@as(c_int, code_size) != 0)) {
                while (true) {
                    if (rle_repeat_count != 0) {
                        if (rle_repeat_count < @as(mz_uint, 3)) {
                            d.*.m_huff_count[@as(c_int, 2)][prev_code_size] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][prev_code_size])))) +% rle_repeat_count);
                            while ((blk: {
                                const ref = &rle_repeat_count;
                                const tmp = ref.*;
                                ref.* -%= 1;
                                break :blk tmp;
                            }) != 0) {
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = prev_code_size;
                            }
                        } else {
                            d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)]) + @as(c_int, 1))));
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = 16;
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = @truncate(rle_repeat_count -% @as(mz_uint, 3));
                        }
                        rle_repeat_count = 0;
                    }
                    if (!false) break;
                }
                if ((blk: {
                    const ref = &rle_z_count;
                    ref.* +%= 1;
                    break :blk ref.*;
                }) == @as(mz_uint, 138)) {
                    while (true) {
                        if (rle_z_count != 0) {
                            if (rle_z_count < @as(mz_uint, 3)) {
                                d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)])))) +% rle_z_count);
                                while ((blk: {
                                    const ref = &rle_z_count;
                                    const tmp = ref.*;
                                    ref.* -%= 1;
                                    break :blk tmp;
                                }) != 0) {
                                    packed_code_sizes[
                                        blk: {
                                            const ref = &num_packed_code_sizes;
                                            const tmp = ref.*;
                                            ref.* +%= 1;
                                            break :blk tmp;
                                        }
                                    ] = 0;
                                }
                            } else if (rle_z_count <= @as(mz_uint, 10)) {
                                d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)]) + @as(c_int, 1))));
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = 17;
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = @truncate(rle_z_count -% @as(mz_uint, 3));
                            } else {
                                d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)]) + @as(c_int, 1))));
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = 18;
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = @truncate(rle_z_count -% @as(mz_uint, 11));
                            }
                            rle_z_count = 0;
                        }
                        if (!false) break;
                    }
                }
            } else {
                while (true) {
                    if (rle_z_count != 0) {
                        if (rle_z_count < @as(mz_uint, 3)) {
                            d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)])))) +% rle_z_count);
                            while ((blk: {
                                const ref = &rle_z_count;
                                const tmp = ref.*;
                                ref.* -%= 1;
                                break :blk tmp;
                            }) != 0) {
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = 0;
                            }
                        } else if (rle_z_count <= @as(mz_uint, 10)) {
                            d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)]) + @as(c_int, 1))));
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = 17;
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = @truncate(rle_z_count -% @as(mz_uint, 3));
                        } else {
                            d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)]) + @as(c_int, 1))));
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = 18;
                            packed_code_sizes[
                                blk: {
                                    const ref = &num_packed_code_sizes;
                                    const tmp = ref.*;
                                    ref.* +%= 1;
                                    break :blk tmp;
                                }
                            ] = @truncate(rle_z_count -% @as(mz_uint, 11));
                        }
                        rle_z_count = 0;
                    }
                    if (!false) break;
                }
                if (@as(c_int, code_size) != @as(c_int, prev_code_size)) {
                    while (true) {
                        if (rle_repeat_count != 0) {
                            if (rle_repeat_count < @as(mz_uint, 3)) {
                                d.*.m_huff_count[@as(c_int, 2)][prev_code_size] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][prev_code_size])))) +% rle_repeat_count);
                                while ((blk: {
                                    const ref = &rle_repeat_count;
                                    const tmp = ref.*;
                                    ref.* -%= 1;
                                    break :blk tmp;
                                }) != 0) {
                                    packed_code_sizes[
                                        blk: {
                                            const ref = &num_packed_code_sizes;
                                            const tmp = ref.*;
                                            ref.* +%= 1;
                                            break :blk tmp;
                                        }
                                    ] = prev_code_size;
                                }
                            } else {
                                d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)]) + @as(c_int, 1))));
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = 16;
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = @truncate(rle_repeat_count -% @as(mz_uint, 3));
                            }
                            rle_repeat_count = 0;
                        }
                        if (!false) break;
                    }
                    d.*.m_huff_count[@as(c_int, 2)][code_size] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][code_size]) + @as(c_int, 1))));
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = code_size;
                } else if ((blk: {
                    const ref = &rle_repeat_count;
                    ref.* +%= 1;
                    break :blk ref.*;
                }) == @as(mz_uint, 6)) {
                    while (true) {
                        if (rle_repeat_count != 0) {
                            if (rle_repeat_count < @as(mz_uint, 3)) {
                                d.*.m_huff_count[@as(c_int, 2)][prev_code_size] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][prev_code_size])))) +% rle_repeat_count);
                                while ((blk: {
                                    const ref = &rle_repeat_count;
                                    const tmp = ref.*;
                                    ref.* -%= 1;
                                    break :blk tmp;
                                }) != 0) {
                                    packed_code_sizes[
                                        blk: {
                                            const ref = &num_packed_code_sizes;
                                            const tmp = ref.*;
                                            ref.* +%= 1;
                                            break :blk tmp;
                                        }
                                    ] = prev_code_size;
                                }
                            } else {
                                d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)]) + @as(c_int, 1))));
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = 16;
                                packed_code_sizes[
                                    blk: {
                                        const ref = &num_packed_code_sizes;
                                        const tmp = ref.*;
                                        ref.* +%= 1;
                                        break :blk tmp;
                                    }
                                ] = @truncate(rle_repeat_count -% @as(mz_uint, 3));
                            }
                            rle_repeat_count = 0;
                        }
                        if (!false) break;
                    }
                }
            }
            prev_code_size = code_size;
        }
    }
    if (rle_repeat_count != 0) {
        while (true) {
            if (rle_repeat_count != 0) {
                if (rle_repeat_count < @as(mz_uint, 3)) {
                    d.*.m_huff_count[@as(c_int, 2)][prev_code_size] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][prev_code_size])))) +% rle_repeat_count);
                    while ((blk: {
                        const ref = &rle_repeat_count;
                        const tmp = ref.*;
                        ref.* -%= 1;
                        break :blk tmp;
                    }) != 0) {
                        packed_code_sizes[
                            blk: {
                                const ref = &num_packed_code_sizes;
                                const tmp = ref.*;
                                ref.* +%= 1;
                                break :blk tmp;
                            }
                        ] = prev_code_size;
                    }
                } else {
                    d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 16)]) + @as(c_int, 1))));
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = 16;
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = @truncate(rle_repeat_count -% @as(mz_uint, 3));
                }
                rle_repeat_count = 0;
            }
            if (!false) break;
        }
    } else {
        while (true) {
            if (rle_z_count != 0) {
                if (rle_z_count < @as(mz_uint, 3)) {
                    d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)] = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 0)])))) +% rle_z_count);
                    while ((blk: {
                        const ref = &rle_z_count;
                        const tmp = ref.*;
                        ref.* -%= 1;
                        break :blk tmp;
                    }) != 0) {
                        packed_code_sizes[
                            blk: {
                                const ref = &num_packed_code_sizes;
                                const tmp = ref.*;
                                ref.* +%= 1;
                                break :blk tmp;
                            }
                        ] = 0;
                    }
                } else if (rle_z_count <= @as(mz_uint, 10)) {
                    d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 17)]) + @as(c_int, 1))));
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = 17;
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = @truncate(rle_z_count -% @as(mz_uint, 3));
                } else {
                    d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)] = @bitCast(@as(c_short, @truncate(@as(c_int, d.*.m_huff_count[@as(c_int, 2)][@as(c_int, 18)]) + @as(c_int, 1))));
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = 18;
                    packed_code_sizes[
                        blk: {
                            const ref = &num_packed_code_sizes;
                            const tmp = ref.*;
                            ref.* +%= 1;
                            break :blk tmp;
                        }
                    ] = @truncate(rle_z_count -% @as(mz_uint, 11));
                }
                rle_z_count = 0;
            }
            if (!false) break;
        }
    }
    tdefl_optimize_huffman_table(d, 2, TDEFL_MAX_HUFF_SYMBOLS_2, 7, @as(c_int, 0));
    while (true) {
        var bits: mz_uint = 2;
        _ = &bits;
        var len: mz_uint = 2;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2079);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    while (true) {
        var bits: mz_uint = @bitCast(@as(c_int, num_lit_codes - @as(c_int, 257)));
        _ = &bits;
        var len: mz_uint = 5;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2081);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    while (true) {
        var bits: mz_uint = @bitCast(@as(c_int, num_dist_codes - @as(c_int, 1)));
        _ = &bits;
        var len: mz_uint = 5;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2082);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    {
        num_bit_lengths = 18;
        while (num_bit_lengths >= @as(c_int, 0)) : (num_bit_lengths -= 1) if (@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 2)][s_tdefl_packed_code_size_syms_swizzle[@bitCast(@as(isize, @intCast(num_bit_lengths)))]]) != 0) break;
    }
    num_bit_lengths = if (@as(c_int, 4) > (num_bit_lengths + @as(c_int, 1))) @as(c_int, 4) else num_bit_lengths + @as(c_int, 1);
    while (true) {
        var bits: mz_uint = @bitCast(@as(c_int, num_bit_lengths - @as(c_int, 4)));
        _ = &bits;
        var len: mz_uint = 4;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2085);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    {
        i = 0;
        while (@as(c_int, @bitCast(@as(c_uint, @truncate(i)))) < num_bit_lengths) : (i +%= 1) while (true) {
            var bits: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 2)][s_tdefl_packed_code_size_syms_swizzle[i]];
            _ = &bits;
            var len: mz_uint = 3;
            _ = &len;
            while (true) {
                while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bits <= ((1U << len) - 1U)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2086);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
            d.*.m_bits_in +%= len;
            while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                    (blk: {
                        const ref = &d.*.m_pOutput_buf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @truncate(d.*.m_bit_buffer);
                }
                d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                d.*.m_bits_in -%= 8;
            }
            if (!false) break;
        };
    }
    {
        packed_code_sizes_index = 0;
        while (packed_code_sizes_index < num_packed_code_sizes) {
            var code: mz_uint = packed_code_sizes[
                blk: {
                    const ref = &packed_code_sizes_index;
                    const tmp = ref.*;
                    ref.* +%= 1;
                    break :blk tmp;
                }
            ];
            _ = &code;
            while (true) {
                while (!(code < @as(mz_uint, TDEFL_MAX_HUFF_SYMBOLS_2))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "code < 19",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2090);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            while (true) {
                var bits: mz_uint = d.*.m_huff_codes[@as(c_int, 2)][code];
                _ = &bits;
                var len: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 2)][code];
                _ = &len;
                while (true) {
                    while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "bits <= ((1U << len) - 1U)",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2091);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                d.*.m_bits_in +%= len;
                while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                    if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                        (blk: {
                            const ref = &d.*.m_pOutput_buf;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d.*.m_bit_buffer);
                    }
                    d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                    d.*.m_bits_in -%= 8;
                }
                if (!false) break;
            }
            if (code >= @as(mz_uint, 16)) while (true) {
                var bits: mz_uint = packed_code_sizes[
                    blk: {
                        const ref = &packed_code_sizes_index;
                        const tmp = ref.*;
                        ref.* +%= 1;
                        break :blk tmp;
                    }
                ];
                _ = &bits;
                var len: mz_uint = "\x02\x03\x07"[code -% @as(mz_uint, 16)];
                _ = &len;
                while (true) {
                    while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "bits <= ((1U << len) - 1U)",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2092);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                d.*.m_bits_in +%= len;
                while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                    if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                        (blk: {
                            const ref = &d.*.m_pOutput_buf;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d.*.m_bit_buffer);
                    }
                    d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                    d.*.m_bits_in -%= 8;
                }
                if (!false) break;
            };
        }
    }
}
pub fn tdefl_start_static_block(d: [*c]tdefl_compressor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "tdefl_start_static_block".*;
    };
    _ = &static_local___func__;
    var i: mz_uint = undefined;
    _ = &i;
    var p: [*c]mz_uint8 = &d.*.m_huff_code_sizes[@as(c_int, 0)][@as(c_int, 0)];
    _ = &p;
    {
        i = 0;
        while (i <= @as(mz_uint, 143)) : (i +%= 1) {
            (blk: {
                const ref = &p;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = 8;
        }
    }
    while (i <= @as(mz_uint, 255)) : (i +%= 1) {
        (blk: {
            const ref = &p;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = 9;
    }
    while (i <= @as(mz_uint, 279)) : (i +%= 1) {
        (blk: {
            const ref = &p;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = 7;
    }
    while (i <= @as(mz_uint, 287)) : (i +%= 1) {
        (blk: {
            const ref = &p;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).* = 8;
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_huff_code_sizes[@as(c_int, 1)]))))), 5, 32);
    tdefl_optimize_huffman_table(d, 0, 288, 15, @as(c_int, 1));
    tdefl_optimize_huffman_table(d, 1, 32, 15, @as(c_int, 1));
    while (true) {
        var bits: mz_uint = 1;
        _ = &bits;
        var len: mz_uint = 2;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2111);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
}
pub const mz_bitmasks: [17]mz_uint = [17]mz_uint{
    0,
    1,
    3,
    7,
    15,
    31,
    63,
    127,
    255,
    511,
    1023,
    2047,
    4095,
    8191,
    16383,
    32767,
    65535,
};
pub fn tdefl_compress_lz_codes(d: [*c]tdefl_compressor) callconv(.c) mz_bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "tdefl_compress_lz_codes".*;
    };
    _ = &static_local___func__;
    var flags: mz_uint = undefined;
    _ = &flags;
    var pLZ_codes: [*c]mz_uint8 = undefined;
    _ = &pLZ_codes;
    flags = 1;
    {
        pLZ_codes = @ptrCast(@alignCast(&d.*.m_lz_code_buf));
        while (pLZ_codes < d.*.m_pLZ_code_buf) : (flags >>= @intCast(@as(mz_uint, 1))) {
            if (flags == @as(mz_uint, 1)) {
                flags = @bitCast(@as(c_int, @as(c_int, (blk: {
                    const ref = &pLZ_codes;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*) | @as(c_int, 256)));
            }
            if ((flags & @as(mz_uint, 1)) != 0) {
                var sym: mz_uint = undefined;
                _ = &sym;
                var num_extra_bits: mz_uint = undefined;
                _ = &num_extra_bits;
                var match_len: mz_uint = pLZ_codes[@as(c_int, 0)];
                _ = &match_len;
                var match_dist: mz_uint = @bitCast(@as(c_int, @as(c_int, pLZ_codes[@as(c_int, 1)]) | (@as(c_int, pLZ_codes[@as(c_int, 2)]) << @intCast(@as(c_int, 8)))));
                _ = &match_dist;
                pLZ_codes += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                while (true) {
                    while (!(@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 0)][s_tdefl_len_sym[match_len]]) != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "d->m_huff_code_sizes[0][s_tdefl_len_sym[match_len]]",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2221);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                while (true) {
                    var bits: mz_uint = d.*.m_huff_codes[@as(c_int, 0)][s_tdefl_len_sym[match_len]];
                    _ = &bits;
                    var len: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 0)][s_tdefl_len_sym[match_len]];
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2222);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
                while (true) {
                    var bits: mz_uint = match_len & mz_bitmasks[s_tdefl_len_extra[match_len]];
                    _ = &bits;
                    var len: mz_uint = s_tdefl_len_extra[match_len];
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2223);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
                if (match_dist < @as(mz_uint, 512)) {
                    sym = s_tdefl_small_dist_sym[match_dist];
                    num_extra_bits = s_tdefl_small_dist_extra[match_dist];
                } else {
                    sym = s_tdefl_large_dist_sym[match_dist >> @intCast(@as(mz_uint, 8))];
                    num_extra_bits = s_tdefl_large_dist_extra[match_dist >> @intCast(@as(mz_uint, 8))];
                }
                while (true) {
                    while (!(@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 1)][sym]) != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "d->m_huff_code_sizes[1][sym]",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2233);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                while (true) {
                    var bits: mz_uint = d.*.m_huff_codes[@as(c_int, 1)][sym];
                    _ = &bits;
                    var len: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 1)][sym];
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2234);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
                while (true) {
                    var bits: mz_uint = match_dist & mz_bitmasks[num_extra_bits];
                    _ = &bits;
                    var len: mz_uint = num_extra_bits;
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2235);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            } else {
                var lit: mz_uint = (blk: {
                    const ref = &pLZ_codes;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &lit;
                while (true) {
                    while (!(@as(c_int, d.*.m_huff_code_sizes[@as(c_int, 0)][lit]) != 0)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "d->m_huff_code_sizes[0][lit]",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2240);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                while (true) {
                    var bits: mz_uint = d.*.m_huff_codes[@as(c_int, 0)][lit];
                    _ = &bits;
                    var len: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 0)][lit];
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2241);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            }
        }
    }
    while (true) {
        var bits: mz_uint = d.*.m_huff_codes[@as(c_int, 0)][@as(c_int, 256)];
        _ = &bits;
        var len: mz_uint = d.*.m_huff_code_sizes[@as(c_int, 0)][@as(c_int, 256)];
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2245);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    return @intFromBool(d.*.m_pOutput_buf < d.*.m_pOutput_buf_end);
}
pub fn tdefl_compress_block(d: [*c]tdefl_compressor, static_block: mz_bool) callconv(.c) mz_bool {
    @setEvalBranchQuota(100000);
    if (static_block != 0) {
        tdefl_start_static_block(d);
    } else {
        tdefl_start_dynamic_block(d);
    }
    return tdefl_compress_lz_codes(d);
}
pub fn tdefl_flush_block(d: [*c]tdefl_compressor, flush: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "tdefl_flush_block".*;
    };
    _ = &static_local___func__;
    var saved_bit_buf: mz_uint = undefined;
    _ = &saved_bit_buf;
    var saved_bits_in: mz_uint = undefined;
    _ = &saved_bits_in;
    var pSaved_output_buf: [*c]mz_uint8 = undefined;
    _ = &pSaved_output_buf;
    var comp_block_succeeded: mz_bool = @as(c_int, 0);
    _ = &comp_block_succeeded;
    var n: c_int = undefined;
    _ = &n;
    var use_raw_block: c_int = @intFromBool(((d.*.m_flags & @as(mz_uint, TDEFL_FORCE_ALL_RAW_BLOCKS)) != @as(mz_uint, 0)) and ((d.*.m_lookahead_pos -% d.*.m_lz_code_buf_dict_pos) <= d.*.m_dict_size));
    _ = &use_raw_block;
    var pOutput_buf_start: [*c]mz_uint8 = if ((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(d.*.m_pPut_buf_func)))) == @as(?*anyopaque, null)) and ((d.*.m_pOut_buf_size.* -% d.*.m_out_buf_ofs) >= @as(usize, TDEFL_OUT_BUF_SIZE))) @as([*c]mz_uint8, @ptrCast(@alignCast(d.*.m_pOut_buf))) + d.*.m_out_buf_ofs else @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_output_buf)));
    _ = &pOutput_buf_start;
    d.*.m_pOutput_buf = pOutput_buf_start;
    d.*.m_pOutput_buf_end = (d.*.m_pOutput_buf + @as(usize, @bitCast(@as(isize, @intCast(TDEFL_OUT_BUF_SIZE))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
    while (true) {
        while (!!(d.*.m_output_flush_remaining != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!d->m_output_flush_remaining",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2271);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    d.*.m_output_flush_ofs = 0;
    d.*.m_output_flush_remaining = 0;
    d.*.m_pLZ_flags.* = @truncate(@as(mz_uint, @bitCast(@as(c_int, @as(c_int, d.*.m_pLZ_flags.*)))) >> @intCast(d.*.m_num_flags_left));
    d.*.m_pLZ_code_buf -= @as(usize, @bitCast(@as(isize, @intCast(@intFromBool(d.*.m_num_flags_left == @as(mz_uint, 8))))));
    if (((d.*.m_flags & @as(mz_uint, TDEFL_WRITE_ZLIB_HEADER)) != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(!(d.*.m_block_index != 0))))) != 0)) {
        while (true) {
            var bits: mz_uint = 120;
            _ = &bits;
            var len: mz_uint = 8;
            _ = &len;
            while (true) {
                while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bits <= ((1U << len) - 1U)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2280);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
            d.*.m_bits_in +%= len;
            while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                    (blk: {
                        const ref = &d.*.m_pOutput_buf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @truncate(d.*.m_bit_buffer);
                }
                d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                d.*.m_bits_in -%= 8;
            }
            if (!false) break;
        }
        while (true) {
            var bits: mz_uint = 1;
            _ = &bits;
            var len: mz_uint = 8;
            _ = &len;
            while (true) {
                while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bits <= ((1U << len) - 1U)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2280);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
            d.*.m_bits_in +%= len;
            while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                    (blk: {
                        const ref = &d.*.m_pOutput_buf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @truncate(d.*.m_bit_buffer);
                }
                d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                d.*.m_bits_in -%= 8;
            }
            if (!false) break;
        }
    }
    while (true) {
        var bits: mz_uint = @bitCast(@as(c_int, @intFromBool(flush == TDEFL_FINISH)));
        _ = &bits;
        var len: mz_uint = 1;
        _ = &len;
        while (true) {
            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "bits <= ((1U << len) - 1U)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2283);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
        d.*.m_bits_in +%= len;
        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                (blk: {
                    const ref = &d.*.m_pOutput_buf;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d.*.m_bit_buffer);
            }
            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
            d.*.m_bits_in -%= 8;
        }
        if (!false) break;
    }
    pSaved_output_buf = d.*.m_pOutput_buf;
    saved_bit_buf = d.*.m_bit_buffer;
    saved_bits_in = d.*.m_bits_in;
    if (!(use_raw_block != 0)) {
        comp_block_succeeded = tdefl_compress_block(d, @intFromBool(((d.*.m_flags & @as(mz_uint, TDEFL_FORCE_ALL_STATIC_BLOCKS)) != 0) or (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(d.*.m_total_lz_bytes < @as(mz_uint, 48))))) != 0)));
    }
    if (((use_raw_block != 0) or ((d.*.m_total_lz_bytes != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool((@divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pOutput_buf) -% @intFromPtr(pSaved_output_buf))), @sizeOf(mz_uint8)) + @as(c_long, 1)) >= @as(c_long, d.*.m_total_lz_bytes))))) != 0))) and ((d.*.m_lookahead_pos -% d.*.m_lz_code_buf_dict_pos) <= d.*.m_dict_size)) {
        var i: mz_uint = undefined;
        _ = &i;
        d.*.m_pOutput_buf = pSaved_output_buf;
        d.*.m_bit_buffer = saved_bit_buf;
        d.*.m_bits_in = saved_bits_in;
        while (true) {
            var bits: mz_uint = 0;
            _ = &bits;
            var len: mz_uint = 2;
            _ = &len;
            while (true) {
                while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "bits <= ((1U << len) - 1U)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2295);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
            d.*.m_bits_in +%= len;
            while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                    (blk: {
                        const ref = &d.*.m_pOutput_buf;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = @truncate(d.*.m_bit_buffer);
                }
                d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                d.*.m_bits_in -%= 8;
            }
            if (!false) break;
        }
        if (d.*.m_bits_in != 0) {
            while (true) {
                var bits: mz_uint = 0;
                _ = &bits;
                var len: mz_uint = @as(mz_uint, 8) -% d.*.m_bits_in;
                _ = &len;
                while (true) {
                    while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "bits <= ((1U << len) - 1U)",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2296);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                d.*.m_bits_in +%= len;
                while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                    if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                        (blk: {
                            const ref = &d.*.m_pOutput_buf;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d.*.m_bit_buffer);
                    }
                    d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                    d.*.m_bits_in -%= 8;
                }
                if (!false) break;
            }
        }
        {
            i = 2;
            while (i != 0) : ({
                i -%= 1;
                d.*.m_total_lz_bytes ^= 65535;
            }) {
                while (true) {
                    var bits: mz_uint = d.*.m_total_lz_bytes & @as(mz_uint, 65535);
                    _ = &bits;
                    var len: mz_uint = 16;
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2299);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            }
        }
        {
            i = 0;
            while (i < d.*.m_total_lz_bytes) : (i +%= 1) {
                while (true) {
                    var bits: mz_uint = d.*.m_dict[(d.*.m_lz_code_buf_dict_pos +% i) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))];
                    _ = &bits;
                    var len: mz_uint = 8;
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2303);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            }
        }
    } else if (!(comp_block_succeeded != 0)) {
        d.*.m_pOutput_buf = pSaved_output_buf;
        d.*.m_bit_buffer = saved_bit_buf;
        d.*.m_bits_in = saved_bits_in;
        _ = tdefl_compress_block(d, @as(c_int, 1));
    }
    if (flush != 0) {
        if (flush == TDEFL_FINISH) {
            if (d.*.m_bits_in != 0) {
                while (true) {
                    var bits: mz_uint = 0;
                    _ = &bits;
                    var len: mz_uint = @as(mz_uint, 8) -% d.*.m_bits_in;
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2317);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            }
            if ((d.*.m_flags & @as(mz_uint, TDEFL_WRITE_ZLIB_HEADER)) != 0) {
                var i: mz_uint = undefined;
                _ = &i;
                var a: mz_uint = d.*.m_adler32;
                _ = &a;
                {
                    i = 0;
                    while (i < @as(mz_uint, 4)) : (i +%= 1) {
                        while (true) {
                            var bits: mz_uint = (a >> @intCast(@as(mz_uint, 24))) & @as(mz_uint, 255);
                            _ = &bits;
                            var len: mz_uint = 8;
                            _ = &len;
                            while (true) {
                                while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                                    const static_local_sdl_assert_data = struct {
                                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                            .always_ignore = @"false" != 0,
                                            .trigger_count = 0,
                                            .condition = "bits <= ((1U << len) - 1U)",
                                            .filename = null,
                                            .linenum = 0,
                                            .function = null,
                                            .next = null,
                                        };
                                    };
                                    _ = &static_local_sdl_assert_data;
                                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2318);
                                    _ = &sdl_assert_state;
                                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                        continue;
                                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                        __builtin.debugtrap();
                                    }
                                    break;
                                }
                                if (!(@as(c_int, 0) != 0)) break;
                            }
                            d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                            d.*.m_bits_in +%= len;
                            while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                                if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                                    (blk: {
                                        const ref = &d.*.m_pOutput_buf;
                                        const tmp = ref.*;
                                        ref.* += 1;
                                        break :blk tmp;
                                    }).* = @truncate(d.*.m_bit_buffer);
                                }
                                d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                                d.*.m_bits_in -%= 8;
                            }
                            if (!false) break;
                        }
                        a <<= @intCast(@as(mz_uint, 8));
                    }
                }
            }
        } else {
            var i: mz_uint = undefined;
            _ = &i;
            var z: mz_uint = 0;
            _ = &z;
            while (true) {
                var bits: mz_uint = 0;
                _ = &bits;
                var len: mz_uint = 3;
                _ = &len;
                while (true) {
                    while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "bits <= ((1U << len) - 1U)",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2322);
                        _ = &sdl_assert_state;
                        if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                            continue;
                        } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                            __builtin.debugtrap();
                        }
                        break;
                    }
                    if (!(@as(c_int, 0) != 0)) break;
                }
                d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                d.*.m_bits_in +%= len;
                while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                    if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                        (blk: {
                            const ref = &d.*.m_pOutput_buf;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d.*.m_bit_buffer);
                    }
                    d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                    d.*.m_bits_in -%= 8;
                }
                if (!false) break;
            }
            if (d.*.m_bits_in != 0) {
                while (true) {
                    var bits: mz_uint = 0;
                    _ = &bits;
                    var len: mz_uint = @as(mz_uint, 8) -% d.*.m_bits_in;
                    _ = &len;
                    while (true) {
                        while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "bits <= ((1U << len) - 1U)",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2322);
                            _ = &sdl_assert_state;
                            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                continue;
                            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                __builtin.debugtrap();
                            }
                            break;
                        }
                        if (!(@as(c_int, 0) != 0)) break;
                    }
                    d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                    d.*.m_bits_in +%= len;
                    while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                        if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                            (blk: {
                                const ref = &d.*.m_pOutput_buf;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @truncate(d.*.m_bit_buffer);
                        }
                        d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                        d.*.m_bits_in -%= 8;
                    }
                    if (!false) break;
                }
            }
            {
                i = 2;
                while (i != 0) : ({
                    i -%= 1;
                    z ^= 65535;
                }) {
                    while (true) {
                        var bits: mz_uint = z & @as(mz_uint, 65535);
                        _ = &bits;
                        var len: mz_uint = 16;
                        _ = &len;
                        while (true) {
                            while (!(bits <= ((@as(c_uint, 1) << @intCast(len)) -% @as(c_uint, 1)))) {
                                const static_local_sdl_assert_data = struct {
                                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                        .always_ignore = @"false" != 0,
                                        .trigger_count = 0,
                                        .condition = "bits <= ((1U << len) - 1U)",
                                        .filename = null,
                                        .linenum = 0,
                                        .function = null,
                                        .next = null,
                                    };
                                };
                                _ = &static_local_sdl_assert_data;
                                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2322);
                                _ = &sdl_assert_state;
                                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                                    continue;
                                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                                    __builtin.debugtrap();
                                }
                                break;
                            }
                            if (!(@as(c_int, 0) != 0)) break;
                        }
                        d.*.m_bit_buffer |= bits << @intCast(d.*.m_bits_in);
                        d.*.m_bits_in +%= len;
                        while (d.*.m_bits_in >= @as(mz_uint, 8)) {
                            if (d.*.m_pOutput_buf < d.*.m_pOutput_buf_end) {
                                (blk: {
                                    const ref = &d.*.m_pOutput_buf;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = @truncate(d.*.m_bit_buffer);
                            }
                            d.*.m_bit_buffer >>= @intCast(@as(mz_uint, 8));
                            d.*.m_bits_in -%= 8;
                        }
                        if (!false) break;
                    }
                }
            }
        }
    }
    while (true) {
        while (!(d.*.m_pOutput_buf < d.*.m_pOutput_buf_end)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "d->m_pOutput_buf < d->m_pOutput_buf_end",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2326);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    _ = memset(@ptrCast(@alignCast(&d.*.m_huff_count[@as(c_int, 0)][@as(c_int, 0)])), 0, @sizeOf(@TypeOf(d.*.m_huff_count[@as(c_int, 0)][@as(c_int, 0)])) *% @as(c_ulong, TDEFL_MAX_HUFF_SYMBOLS_0));
    _ = memset(@ptrCast(@alignCast(&d.*.m_huff_count[@as(c_int, 1)][@as(c_int, 0)])), 0, @sizeOf(@TypeOf(d.*.m_huff_count[@as(c_int, 1)][@as(c_int, 0)])) *% @as(c_ulong, TDEFL_MAX_HUFF_SYMBOLS_1));
    d.*.m_pLZ_code_buf = @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_lz_code_buf))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    d.*.m_pLZ_flags = @ptrCast(@alignCast(&d.*.m_lz_code_buf));
    d.*.m_num_flags_left = 8;
    d.*.m_lz_code_buf_dict_pos +%= d.*.m_total_lz_bytes;
    d.*.m_total_lz_bytes = 0;
    d.*.m_block_index +%= 1;
    if ((blk: {
        const tmp = @as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pOutput_buf) -% @intFromPtr(pOutput_buf_start))), @sizeOf(mz_uint8))));
        n = tmp;
        break :blk tmp;
    }) != @as(c_int, 0)) {
        if (d.*.m_pPut_buf_func != null) {
            d.*.m_pIn_buf_size.* = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pSrc) -% @intFromPtr(@as([*c]const mz_uint8, @ptrCast(@alignCast(d.*.m_pIn_buf)))))), @sizeOf(mz_uint8))));
            if (!(d.*.m_pPut_buf_func.?(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_output_buf))))), n, d.*.m_pPut_buf_user) != 0)) return blk: {
                const tmp = TDEFL_STATUS_PUT_BUF_FAILED;
                d.*.m_prev_return_status = tmp;
                break :blk tmp;
            };
        } else if (pOutput_buf_start == @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_output_buf)))) {
            var bytes_to_copy: c_int = @bitCast(@as(c_uint, @truncate(if (@as(usize, @bitCast(@as(c_long, n))) < (d.*.m_pOut_buf_size.* -% d.*.m_out_buf_ofs)) @as(usize, @bitCast(@as(c_long, n))) else d.*.m_pOut_buf_size.* -% d.*.m_out_buf_ofs)));
            _ = &bytes_to_copy;
            _ = memcpy(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(d.*.m_pOut_buf))) + d.*.m_out_buf_ofs)), @ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_output_buf))))), @bitCast(@as(c_long, bytes_to_copy)));
            d.*.m_out_buf_ofs +%= @bitCast(@as(c_long, bytes_to_copy));
            if ((blk: {
                const ref = &n;
                ref.* -= bytes_to_copy;
                break :blk ref.*;
            }) != @as(c_int, 0)) {
                d.*.m_output_flush_ofs = @bitCast(@as(c_int, bytes_to_copy));
                d.*.m_output_flush_remaining = @bitCast(@as(c_int, n));
            }
        } else {
            d.*.m_out_buf_ofs +%= @bitCast(@as(c_long, n));
        }
    }
    return @bitCast(@as(c_uint, @truncate(d.*.m_output_flush_remaining)));
}
pub inline fn tdefl_find_match(d: [*c]tdefl_compressor, lookahead_pos: mz_uint, max_dist: mz_uint, arg_max_match_len: mz_uint, pMatch_dist: [*c]mz_uint, pMatch_len: [*c]mz_uint) void {
    @setEvalBranchQuota(100000);
    var max_match_len = arg_max_match_len;
    _ = &max_match_len;
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "tdefl_find_match".*;
    };
    _ = &static_local___func__;
    var dist: mz_uint = undefined;
    _ = &dist;
    var pos: mz_uint = lookahead_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
    _ = &pos;
    var match_len: mz_uint = pMatch_len.*;
    _ = &match_len;
    var probe_pos: mz_uint = pos;
    _ = &probe_pos;
    var next_probe_pos: mz_uint = undefined;
    _ = &next_probe_pos;
    var probe_len: mz_uint = undefined;
    _ = &probe_len;
    var num_probes_left: mz_uint = d.*.m_max_probes[@bitCast(@as(isize, @intCast(@intFromBool(match_len >= @as(mz_uint, 32)))))];
    _ = &num_probes_left;
    var s: [*c]const mz_uint8 = @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_dict))) + pos;
    _ = &s;
    var p: [*c]const mz_uint8 = undefined;
    _ = &p;
    var q: [*c]const mz_uint8 = undefined;
    _ = &q;
    var c0: mz_uint8 = d.*.m_dict[pos +% match_len];
    _ = &c0;
    var c1: mz_uint8 = d.*.m_dict[(pos +% match_len) -% @as(mz_uint, 1)];
    _ = &c1;
    while (true) {
        while (!(max_match_len <= @as(mz_uint, TDEFL_MAX_MATCH_LEN))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "max_match_len <= 258",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2408);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    if (max_match_len <= match_len) return;
    while (true) {
        while (true) {
            if ((blk: {
                const ref = &num_probes_left;
                ref.* -%= 1;
                break :blk ref.*;
            }) == @as(mz_uint, 0)) return;
            next_probe_pos = d.*.m_next[probe_pos];
            if (!(next_probe_pos != 0) or ((blk: {
                const tmp = @as(mz_uint, @as(mz_uint16, @truncate(lookahead_pos -% next_probe_pos)));
                dist = tmp;
                break :blk tmp;
            }) > max_dist)) return;
            probe_pos = next_probe_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
            if ((@as(c_int, d.*.m_dict[probe_pos +% match_len]) == @as(c_int, c0)) and (@as(c_int, d.*.m_dict[(probe_pos +% match_len) -% @as(mz_uint, 1)]) == @as(c_int, c1))) break;
            next_probe_pos = d.*.m_next[probe_pos];
            if (!(next_probe_pos != 0) or ((blk: {
                const tmp = @as(mz_uint, @as(mz_uint16, @truncate(lookahead_pos -% next_probe_pos)));
                dist = tmp;
                break :blk tmp;
            }) > max_dist)) return;
            probe_pos = next_probe_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
            if ((@as(c_int, d.*.m_dict[probe_pos +% match_len]) == @as(c_int, c0)) and (@as(c_int, d.*.m_dict[(probe_pos +% match_len) -% @as(mz_uint, 1)]) == @as(c_int, c1))) break;
            next_probe_pos = d.*.m_next[probe_pos];
            if (!(next_probe_pos != 0) or ((blk: {
                const tmp = @as(mz_uint, @as(mz_uint16, @truncate(lookahead_pos -% next_probe_pos)));
                dist = tmp;
                break :blk tmp;
            }) > max_dist)) return;
            probe_pos = next_probe_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
            if ((@as(c_int, d.*.m_dict[probe_pos +% match_len]) == @as(c_int, c0)) and (@as(c_int, d.*.m_dict[(probe_pos +% match_len) -% @as(mz_uint, 1)]) == @as(c_int, c1))) break;
        }
        if (!(dist != 0)) break;
        p = s;
        q = @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_dict))) + probe_pos;
        {
            probe_len = 0;
            while (probe_len < max_match_len) : (probe_len +%= 1) {
                if (@as(c_int, (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*) != @as(c_int, (blk: {
                    const ref = &q;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*)) break;
            }
        }
        if (probe_len > match_len) {
            pMatch_dist.* = dist;
            if ((blk: {
                const tmp = blk_1: {
                    const tmp_2 = probe_len;
                    match_len = tmp_2;
                    break :blk_1 tmp_2;
                };
                pMatch_len.* = tmp;
                break :blk tmp;
            }) == max_match_len) return;
            c0 = d.*.m_dict[pos +% match_len];
            c1 = d.*.m_dict[(pos +% match_len) -% @as(mz_uint, 1)];
        }
    }
}
pub inline fn tdefl_record_literal(d: [*c]tdefl_compressor, lit: mz_uint8) void {
    @setEvalBranchQuota(100000);
    d.*.m_total_lz_bytes +%= 1;
    (blk: {
        const ref = &d.*.m_pLZ_code_buf;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = lit;
    d.*.m_pLZ_flags.* = @bitCast(@as(i8, @truncate(@as(c_int, d.*.m_pLZ_flags.*) >> @intCast(@as(c_int, 1)))));
    if ((blk: {
        const ref = &d.*.m_num_flags_left;
        ref.* -%= 1;
        break :blk ref.*;
    }) == @as(mz_uint, 0)) {
        d.*.m_num_flags_left = 8;
        d.*.m_pLZ_flags = blk: {
            const ref = &d.*.m_pLZ_code_buf;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        };
    }
    d.*.m_huff_count[@as(c_int, 0)][lit] +%= 1;
}
pub inline fn tdefl_record_match(d: [*c]tdefl_compressor, arg_match_len: mz_uint, arg_match_dist: mz_uint) void {
    @setEvalBranchQuota(100000);
    var match_len = arg_match_len;
    _ = &match_len;
    var match_dist = arg_match_dist;
    _ = &match_dist;
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "tdefl_record_match".*;
    };
    _ = &static_local___func__;
    var s0: mz_uint32 = undefined;
    _ = &s0;
    var s1: mz_uint32 = undefined;
    _ = &s1;
    while (true) {
        while (!(((match_len >= @as(mz_uint, TDEFL_MIN_MATCH_LEN)) and (match_dist >= @as(mz_uint, 1))) and (match_dist <= @as(mz_uint, TDEFL_LZ_DICT_SIZE)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(match_len >= 3) && (match_dist >= 1) && (match_dist <= 32768)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2589);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    d.*.m_total_lz_bytes +%= match_len;
    d.*.m_pLZ_code_buf[@as(c_int, 0)] = @truncate(match_len -% @as(mz_uint, TDEFL_MIN_MATCH_LEN));
    match_dist -%= 1;
    d.*.m_pLZ_code_buf[@as(c_int, 1)] = @truncate(match_dist & @as(mz_uint, 255));
    d.*.m_pLZ_code_buf[@as(c_int, 2)] = @truncate(match_dist >> @intCast(@as(mz_uint, 8)));
    d.*.m_pLZ_code_buf += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
    d.*.m_pLZ_flags.* = @bitCast(@as(i8, @truncate((@as(c_int, d.*.m_pLZ_flags.*) >> @intCast(@as(c_int, 1))) | @as(c_int, 128))));
    if ((blk: {
        const ref = &d.*.m_num_flags_left;
        ref.* -%= 1;
        break :blk ref.*;
    }) == @as(mz_uint, 0)) {
        d.*.m_num_flags_left = 8;
        d.*.m_pLZ_flags = blk: {
            const ref = &d.*.m_pLZ_code_buf;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        };
    }
    s0 = s_tdefl_small_dist_sym[match_dist & @as(mz_uint, 511)];
    s1 = s_tdefl_large_dist_sym[(match_dist >> @intCast(@as(mz_uint, 8))) & @as(mz_uint, 127)];
    d.*.m_huff_count[@as(c_int, 1)][if (match_dist < @as(mz_uint, 512)) s0 else s1] +%= 1;
    if (match_len >= @as(mz_uint, TDEFL_MIN_MATCH_LEN)) {
        d.*.m_huff_count[@as(c_int, 0)][s_tdefl_len_sym[match_len -% @as(mz_uint, TDEFL_MIN_MATCH_LEN)]] +%= 1;
    }
}
pub fn tdefl_compress_normal(d: [*c]tdefl_compressor) callconv(.c) mz_bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "tdefl_compress_normal".*;
    };
    _ = &static_local___func__;
    var pSrc: [*c]const mz_uint8 = d.*.m_pSrc;
    _ = &pSrc;
    var src_buf_left: usize = d.*.m_src_buf_left;
    _ = &src_buf_left;
    var flush: tdefl_flush = d.*.m_flush;
    _ = &flush;
    while ((src_buf_left != 0) or (@as(usize, @bitCast(@as(c_long, @intFromBool((flush != 0) and (d.*.m_lookahead_size != 0))))) != 0)) {
        var len_to_move: mz_uint = undefined;
        _ = &len_to_move;
        var cur_match_dist: mz_uint = undefined;
        _ = &cur_match_dist;
        var cur_match_len: mz_uint = undefined;
        _ = &cur_match_len;
        var cur_pos: mz_uint = undefined;
        _ = &cur_pos;
        if ((d.*.m_lookahead_size +% d.*.m_dict_size) >= @as(mz_uint, @bitCast(@as(c_int, TDEFL_MIN_MATCH_LEN - @as(c_int, 1))))) {
            var dst_pos: mz_uint = (d.*.m_lookahead_pos +% d.*.m_lookahead_size) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
            _ = &dst_pos;
            var ins_pos: mz_uint = (d.*.m_lookahead_pos +% d.*.m_lookahead_size) -% @as(mz_uint, 2);
            _ = &ins_pos;
            var hash: mz_uint = @bitCast(@as(c_int, (@as(c_int, d.*.m_dict[ins_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))]) << @intCast(TDEFL_LZ_HASH_SHIFT)) ^ @as(c_int, d.*.m_dict[(ins_pos +% @as(mz_uint, 1)) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))])));
            _ = &hash;
            var num_bytes_to_process: mz_uint = @truncate(if (src_buf_left < @as(usize, @as(mz_uint, TDEFL_MAX_MATCH_LEN) -% d.*.m_lookahead_size)) src_buf_left else @as(usize, @as(mz_uint, TDEFL_MAX_MATCH_LEN) -% d.*.m_lookahead_size));
            _ = &num_bytes_to_process;
            var pSrc_end: [*c]const mz_uint8 = @ptrCast(@alignCast(if (pSrc != null) @as(?*const anyopaque, @ptrCast(@alignCast(pSrc + num_bytes_to_process))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
            _ = &pSrc_end;
            src_buf_left -%= num_bytes_to_process;
            d.*.m_lookahead_size +%= num_bytes_to_process;
            while (pSrc != pSrc_end) {
                var c: mz_uint8 = (blk: {
                    const ref = &pSrc;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &c;
                d.*.m_dict[dst_pos] = c;
                if (dst_pos < @as(mz_uint, @bitCast(@as(c_int, TDEFL_MAX_MATCH_LEN - @as(c_int, 1))))) {
                    d.*.m_dict[@as(mz_uint, TDEFL_LZ_DICT_SIZE) +% dst_pos] = c;
                }
                hash = ((hash << @intCast(@as(mz_uint, TDEFL_LZ_HASH_SHIFT))) ^ @as(mz_uint, @bitCast(@as(c_int, @as(c_int, c))))) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_HASH_SIZE - @as(c_int, 1))));
                d.*.m_next[ins_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))] = d.*.m_hash[hash];
                d.*.m_hash[hash] = @truncate(ins_pos);
                dst_pos = (dst_pos +% @as(mz_uint, 1)) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
                ins_pos +%= 1;
            }
        } else {
            while ((src_buf_left != 0) and (@as(usize, @bitCast(@as(c_long, @intFromBool(d.*.m_lookahead_size < @as(mz_uint, TDEFL_MAX_MATCH_LEN))))) != 0)) {
                var c: mz_uint8 = (blk: {
                    const ref = &pSrc;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                _ = &c;
                var dst_pos: mz_uint = (d.*.m_lookahead_pos +% d.*.m_lookahead_size) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
                _ = &dst_pos;
                src_buf_left -%= 1;
                d.*.m_dict[dst_pos] = c;
                if (dst_pos < @as(mz_uint, @bitCast(@as(c_int, TDEFL_MAX_MATCH_LEN - @as(c_int, 1))))) {
                    d.*.m_dict[@as(mz_uint, TDEFL_LZ_DICT_SIZE) +% dst_pos] = c;
                }
                if (((blk: {
                    const ref = &d.*.m_lookahead_size;
                    ref.* +%= 1;
                    break :blk ref.*;
                }) +% d.*.m_dict_size) >= @as(mz_uint, TDEFL_MIN_MATCH_LEN)) {
                    var ins_pos: mz_uint = (d.*.m_lookahead_pos +% (d.*.m_lookahead_size -% @as(mz_uint, 1))) -% @as(mz_uint, 2);
                    _ = &ins_pos;
                    var hash: mz_uint = @bitCast(@as(c_int, (((@as(c_int, d.*.m_dict[ins_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))]) << @intCast(TDEFL_LZ_HASH_SHIFT * @as(c_int, 2))) ^ (@as(c_int, d.*.m_dict[(ins_pos +% @as(mz_uint, 1)) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))]) << @intCast(TDEFL_LZ_HASH_SHIFT))) ^ @as(c_int, c)) & (TDEFL_LZ_HASH_SIZE - @as(c_int, 1))));
                    _ = &hash;
                    d.*.m_next[ins_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))] = d.*.m_hash[hash];
                    d.*.m_hash[hash] = @truncate(ins_pos);
                }
            }
        }
        d.*.m_dict_size = if ((@as(mz_uint, TDEFL_LZ_DICT_SIZE) -% d.*.m_lookahead_size) < d.*.m_dict_size) @as(mz_uint, TDEFL_LZ_DICT_SIZE) -% d.*.m_lookahead_size else d.*.m_dict_size;
        if (!(flush != 0) and (d.*.m_lookahead_size < @as(mz_uint, TDEFL_MAX_MATCH_LEN))) break;
        len_to_move = 1;
        cur_match_dist = 0;
        cur_match_len = if (d.*.m_saved_match_len != 0) d.*.m_saved_match_len else @as(mz_uint, @bitCast(@as(c_int, TDEFL_MIN_MATCH_LEN - @as(c_int, 1))));
        cur_pos = d.*.m_lookahead_pos & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))));
        if ((d.*.m_flags & @as(mz_uint, @bitCast(@as(c_int, TDEFL_RLE_MATCHES | TDEFL_FORCE_ALL_RAW_BLOCKS)))) != 0) {
            if ((d.*.m_dict_size != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(!((d.*.m_flags & @as(mz_uint, TDEFL_FORCE_ALL_RAW_BLOCKS)) != 0))))) != 0)) {
                var c: mz_uint8 = d.*.m_dict[(cur_pos -% @as(mz_uint, 1)) & @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE - @as(c_int, 1))))];
                _ = &c;
                cur_match_len = 0;
                while (cur_match_len < d.*.m_lookahead_size) {
                    if (@as(c_int, d.*.m_dict[cur_pos +% cur_match_len]) != @as(c_int, c)) break;
                    cur_match_len +%= 1;
                }
                if (cur_match_len < @as(mz_uint, TDEFL_MIN_MATCH_LEN)) {
                    cur_match_len = 0;
                } else {
                    cur_match_dist = 1;
                }
            }
        } else {
            tdefl_find_match(d, d.*.m_lookahead_pos, d.*.m_dict_size, d.*.m_lookahead_size, &cur_match_dist, &cur_match_len);
        }
        if ((((cur_match_len == @as(mz_uint, TDEFL_MIN_MATCH_LEN)) and (cur_match_dist >= (@as(c_uint, 8) *% @as(c_uint, 1024)))) or (cur_pos == cur_match_dist)) or (((d.*.m_flags & @as(mz_uint, TDEFL_FILTER_MATCHES)) != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(cur_match_len <= @as(mz_uint, 5))))) != 0))) {
            cur_match_dist = blk: {
                const tmp = @as(mz_uint, 0);
                cur_match_len = tmp;
                break :blk tmp;
            };
        }
        if (d.*.m_saved_match_len != 0) {
            if (cur_match_len > d.*.m_saved_match_len) {
                tdefl_record_literal(d, @truncate(d.*.m_saved_lit));
                if (cur_match_len >= @as(mz_uint, 128)) {
                    tdefl_record_match(d, cur_match_len, cur_match_dist);
                    d.*.m_saved_match_len = 0;
                    len_to_move = cur_match_len;
                } else {
                    d.*.m_saved_lit = d.*.m_dict[cur_pos];
                    d.*.m_saved_match_dist = cur_match_dist;
                    d.*.m_saved_match_len = cur_match_len;
                }
            } else {
                tdefl_record_match(d, d.*.m_saved_match_len, d.*.m_saved_match_dist);
                len_to_move = d.*.m_saved_match_len -% @as(mz_uint, 1);
                d.*.m_saved_match_len = 0;
            }
        } else if (!(cur_match_dist != 0)) {
            tdefl_record_literal(d, d.*.m_dict[if (@as(c_ulong, cur_pos) < (@sizeOf(@TypeOf(d.*.m_dict)) -% @as(c_ulong, 1))) @as(c_ulong, cur_pos) else @sizeOf(@TypeOf(d.*.m_dict)) -% @as(c_ulong, 1)]);
        } else if (((@as(mz_uint, @bitCast(@as(c_int, d.*.m_greedy_parsing))) != 0) or ((d.*.m_flags & @as(mz_uint, TDEFL_RLE_MATCHES)) != 0)) or (cur_match_len >= @as(mz_uint, 128))) {
            tdefl_record_match(d, cur_match_len, cur_match_dist);
            len_to_move = cur_match_len;
        } else {
            d.*.m_saved_lit = d.*.m_dict[if (@as(c_ulong, cur_pos) < (@sizeOf(@TypeOf(d.*.m_dict)) -% @as(c_ulong, 1))) @as(c_ulong, cur_pos) else @sizeOf(@TypeOf(d.*.m_dict)) -% @as(c_ulong, 1)];
            d.*.m_saved_match_dist = cur_match_dist;
            d.*.m_saved_match_len = cur_match_len;
        }
        d.*.m_lookahead_pos +%= len_to_move;
        while (true) {
            while (!(d.*.m_lookahead_size >= len_to_move)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "d->m_lookahead_size >= len_to_move",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2707);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        d.*.m_lookahead_size -%= len_to_move;
        d.*.m_dict_size = if ((d.*.m_dict_size +% len_to_move) < @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE)))) d.*.m_dict_size +% len_to_move else @as(mz_uint, @bitCast(@as(c_int, TDEFL_LZ_DICT_SIZE)));
        if ((d.*.m_pLZ_code_buf > (&d.*.m_lz_code_buf[TDEFL_LZ_CODE_BUF_SIZE - @as(c_int, 8)])) or ((d.*.m_total_lz_bytes > @as(mz_uint, @bitCast(@as(c_int, @as(c_int, 31) * @as(c_int, 1024))))) and ((@as(mz_uint, @bitCast(@as(c_int, @intFromBool(((@as(mz_uint, @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pLZ_code_buf) -% @intFromPtr(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_lz_code_buf)))))), @sizeOf(mz_uint8)))))) *% @as(mz_uint, 115)) >> @intCast(@as(mz_uint, 7))) >= d.*.m_total_lz_bytes)))) != 0) or ((d.*.m_flags & @as(mz_uint, TDEFL_FORCE_ALL_RAW_BLOCKS)) != 0)))) {
            var n: c_int = undefined;
            _ = &n;
            d.*.m_pSrc = pSrc;
            d.*.m_src_buf_left = src_buf_left;
            if ((blk: {
                const tmp = tdefl_flush_block(d, 0);
                n = tmp;
                break :blk tmp;
            }) != @as(c_int, 0)) return if (n < @as(c_int, 0)) @as(c_int, 0) else @as(c_int, 1);
        }
    }
    d.*.m_pSrc = pSrc;
    d.*.m_src_buf_left = src_buf_left;
    return @as(c_int, 1);
}
pub fn tdefl_flush_output_buffer(d: [*c]tdefl_compressor) callconv(.c) tdefl_status {
    @setEvalBranchQuota(100000);
    if (d.*.m_pIn_buf_size != null) {
        d.*.m_pIn_buf_size.* = @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pSrc) -% @intFromPtr(@as([*c]const mz_uint8, @ptrCast(@alignCast(d.*.m_pIn_buf)))))), @sizeOf(mz_uint8))));
    }
    if (d.*.m_pOut_buf_size != null) {
        var n: usize = if ((d.*.m_pOut_buf_size.* -% d.*.m_out_buf_ofs) < @as(usize, d.*.m_output_flush_remaining)) d.*.m_pOut_buf_size.* -% d.*.m_out_buf_ofs else @as(usize, d.*.m_output_flush_remaining);
        _ = &n;
        _ = memcpy(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(d.*.m_pOut_buf))) + d.*.m_out_buf_ofs)), @ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_output_buf))) + d.*.m_output_flush_ofs)), n);
        d.*.m_output_flush_ofs +%= @truncate(n);
        d.*.m_output_flush_remaining -%= @truncate(n);
        d.*.m_out_buf_ofs +%= n;
        d.*.m_pOut_buf_size.* = d.*.m_out_buf_ofs;
    }
    return if ((d.*.m_finished != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(!(d.*.m_output_flush_remaining != 0))))) != 0)) TDEFL_STATUS_DONE else TDEFL_STATUS_OKAY;
}
pub export fn tdefl_compress(d: [*c]tdefl_compressor, pIn_buf: ?*const anyopaque, pIn_buf_size: [*c]usize, pOut_buf: ?*anyopaque, pOut_buf_size: [*c]usize, flush: tdefl_flush) tdefl_status {
    @setEvalBranchQuota(100000);
    if (!(d != null)) {
        if (pIn_buf_size != null) {
            pIn_buf_size.* = 0;
        }
        if (pOut_buf_size != null) {
            pOut_buf_size.* = 0;
        }
        return TDEFL_STATUS_BAD_PARAM;
    }
    d.*.m_pIn_buf = pIn_buf;
    d.*.m_pIn_buf_size = pIn_buf_size;
    d.*.m_pOut_buf = pOut_buf;
    d.*.m_pOut_buf_size = pOut_buf_size;
    d.*.m_pSrc = @ptrCast(@alignCast(pIn_buf));
    d.*.m_src_buf_left = if (pIn_buf_size != null) pIn_buf_size.* else @as(usize, 0);
    d.*.m_out_buf_ofs = 0;
    d.*.m_flush = flush;
    if (((((@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(d.*.m_pPut_buf_func)))) != @as(?*anyopaque, null)) == @intFromBool((pOut_buf != @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(pOut_buf_size))) != @as(?*anyopaque, null)))) or (d.*.m_prev_return_status != TDEFL_STATUS_OKAY)) or ((d.*.m_wants_to_finish != 0) and (@as(mz_uint, @bitCast(@as(c_int, @intFromBool(flush != @as(tdefl_flush, TDEFL_FINISH))))) != 0))) or (((pIn_buf_size != null) and (pIn_buf_size.* != 0)) and !(pIn_buf != null))) or (((pOut_buf_size != null) and (pOut_buf_size.* != 0)) and !(pOut_buf != null))) {
        if (pIn_buf_size != null) {
            pIn_buf_size.* = 0;
        }
        if (pOut_buf_size != null) {
            pOut_buf_size.* = 0;
        }
        return blk: {
            const tmp = TDEFL_STATUS_BAD_PARAM;
            d.*.m_prev_return_status = tmp;
            break :blk tmp;
        };
    }
    d.*.m_wants_to_finish |= @bitCast(@as(c_int, @intFromBool(flush == @as(tdefl_flush, TDEFL_FINISH))));
    if ((d.*.m_output_flush_remaining != 0) or (d.*.m_finished != 0)) return blk: {
        const tmp = tdefl_flush_output_buffer(d);
        d.*.m_prev_return_status = tmp;
        break :blk tmp;
    };
    {
        if (!(tdefl_compress_normal(d) != 0)) return d.*.m_prev_return_status;
    }
    if (((d.*.m_flags & @as(mz_uint, @bitCast(@as(c_int, TDEFL_WRITE_ZLIB_HEADER | TDEFL_COMPUTE_ADLER32)))) != 0) and (pIn_buf != null)) {
        d.*.m_adler32 = @truncate(mz_adler32(d.*.m_adler32, @ptrCast(@alignCast(pIn_buf)), @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(d.*.m_pSrc) -% @intFromPtr(@as([*c]const mz_uint8, @ptrCast(@alignCast(pIn_buf)))))), @sizeOf(mz_uint8))))));
    }
    if ((((flush != 0) and (@as(tdefl_flush, @intCast(@intFromBool(!(d.*.m_lookahead_size != 0)))) != 0)) and !(d.*.m_src_buf_left != 0)) and !(d.*.m_output_flush_remaining != 0)) {
        if (tdefl_flush_block(d, @bitCast(flush)) < @as(c_int, 0)) return d.*.m_prev_return_status;
        d.*.m_finished = @bitCast(@as(c_int, @intFromBool(flush == @as(tdefl_flush, TDEFL_FINISH))));
        if (flush == @as(tdefl_flush, TDEFL_FULL_FLUSH)) {
            _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint16, @ptrCast(@alignCast(&d.*.m_hash))))), 0, @sizeOf(@TypeOf(d.*.m_hash)));
            _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint16, @ptrCast(@alignCast(&d.*.m_next))))), 0, @sizeOf(@TypeOf(d.*.m_next)));
            d.*.m_dict_size = 0;
        }
    }
    return blk: {
        const tmp = tdefl_flush_output_buffer(d);
        d.*.m_prev_return_status = tmp;
        break :blk tmp;
    };
}
pub export fn tdefl_compress_buffer(d: [*c]tdefl_compressor, pIn_buf: ?*const anyopaque, arg_in_buf_size: usize, flush: tdefl_flush) tdefl_status {
    @setEvalBranchQuota(100000);
    var in_buf_size = arg_in_buf_size;
    _ = &in_buf_size;
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "tdefl_compress_buffer".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(d.*.m_pPut_buf_func != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "d->m_pPut_buf_func",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "miniz.h", 2804);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    return tdefl_compress(d, pIn_buf, &in_buf_size, null, null, flush);
}
pub export fn tdefl_init(d: [*c]tdefl_compressor, pPut_buf_func: tdefl_put_buf_func_ptr, pPut_buf_user: ?*anyopaque, flags: c_int) tdefl_status {
    @setEvalBranchQuota(100000);
    d.*.m_pPut_buf_func = pPut_buf_func;
    d.*.m_pPut_buf_user = pPut_buf_user;
    d.*.m_flags = @bitCast(@as(c_int, flags));
    d.*.m_max_probes[@as(c_int, 0)] = @bitCast(@as(c_int, @as(c_int, 1) + @divTrunc((flags & @as(c_int, 4095)) + @as(c_int, 2), @as(c_int, 3))));
    d.*.m_greedy_parsing = @intFromBool((flags & TDEFL_GREEDY_PARSING_FLAG) != @as(c_int, 0));
    d.*.m_max_probes[@as(c_int, 1)] = @bitCast(@as(c_int, @as(c_int, 1) + @divTrunc(((flags & @as(c_int, 4095)) >> @intCast(@as(c_int, 2))) + @as(c_int, 2), @as(c_int, 3))));
    if (!((flags & TDEFL_NONDETERMINISTIC_PARSING_FLAG) != 0)) {
        _ = memset(@ptrCast(@alignCast(@as([*c]mz_uint16, @ptrCast(@alignCast(&d.*.m_hash))))), 0, @sizeOf(@TypeOf(d.*.m_hash)));
    }
    d.*.m_lookahead_pos = blk: {
        const tmp = blk_1: {
            const tmp_2 = blk_2: {
                const tmp_3 = blk_3: {
                    const tmp_4 = blk_4: {
                        const tmp_5 = @as(mz_uint, 0);
                        d.*.m_bits_in = tmp_5;
                        break :blk_4 tmp_5;
                    };
                    d.*.m_lz_code_buf_dict_pos = tmp_4;
                    break :blk_3 tmp_4;
                };
                d.*.m_total_lz_bytes = tmp_3;
                break :blk_2 tmp_3;
            };
            d.*.m_dict_size = tmp_2;
            break :blk_1 tmp_2;
        };
        d.*.m_lookahead_size = tmp;
        break :blk tmp;
    };
    d.*.m_output_flush_ofs = blk: {
        const tmp = blk_1: {
            const tmp_2 = blk_2: {
                const tmp_3 = blk_3: {
                    const tmp_4 = blk_4: {
                        const tmp_5 = @as(mz_uint, 0);
                        d.*.m_wants_to_finish = tmp_5;
                        break :blk_4 tmp_5;
                    };
                    d.*.m_bit_buffer = tmp_4;
                    break :blk_3 tmp_4;
                };
                d.*.m_block_index = tmp_3;
                break :blk_2 tmp_3;
            };
            d.*.m_finished = tmp_2;
            break :blk_1 tmp_2;
        };
        d.*.m_output_flush_remaining = tmp;
        break :blk tmp;
    };
    d.*.m_pLZ_code_buf = @as([*c]mz_uint8, @ptrCast(@alignCast(&d.*.m_lz_code_buf))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    d.*.m_pLZ_flags = @ptrCast(@alignCast(&d.*.m_lz_code_buf));
    d.*.m_num_flags_left = 8;
    d.*.m_pOutput_buf = @ptrCast(@alignCast(&d.*.m_output_buf));
    d.*.m_pOutput_buf_end = @ptrCast(@alignCast(&d.*.m_output_buf));
    d.*.m_prev_return_status = TDEFL_STATUS_OKAY;
    d.*.m_saved_match_dist = blk: {
        const tmp = blk_1: {
            const tmp_2 = @as(mz_uint, 0);
            d.*.m_saved_lit = tmp_2;
            break :blk_1 tmp_2;
        };
        d.*.m_saved_match_len = tmp;
        break :blk tmp;
    };
    d.*.m_adler32 = 1;
    d.*.m_pIn_buf = null;
    d.*.m_pOut_buf = null;
    d.*.m_pIn_buf_size = null;
    d.*.m_pOut_buf_size = null;
    d.*.m_flush = TDEFL_NO_FLUSH;
    d.*.m_pSrc = null;
    d.*.m_src_buf_left = 0;
    d.*.m_out_buf_ofs = 0;
    _ = memset(@ptrCast(@alignCast(&d.*.m_huff_count[@as(c_int, 0)][@as(c_int, 0)])), 0, @sizeOf(@TypeOf(d.*.m_huff_count[@as(c_int, 0)][@as(c_int, 0)])) *% @as(c_ulong, TDEFL_MAX_HUFF_SYMBOLS_0));
    _ = memset(@ptrCast(@alignCast(&d.*.m_huff_count[@as(c_int, 1)][@as(c_int, 0)])), 0, @sizeOf(@TypeOf(d.*.m_huff_count[@as(c_int, 1)][@as(c_int, 0)])) *% @as(c_ulong, TDEFL_MAX_HUFF_SYMBOLS_1));
    return TDEFL_STATUS_OKAY;
}
pub const tdefl_output_buffer = extern struct {
    m_size: usize = 0,
    m_capacity: usize = 0,
    m_pBuf: [*c]mz_uint8 = null,
    m_expandable: mz_bool = 0,
};
pub fn tdefl_output_buffer_putter(pBuf: ?*const anyopaque, len: c_int, pUser: ?*anyopaque) callconv(.c) mz_bool {
    @setEvalBranchQuota(100000);
    var p: [*c]tdefl_output_buffer = @ptrCast(@alignCast(pUser));
    _ = &p;
    var new_size: usize = p.*.m_size +% @as(usize, @bitCast(@as(c_long, len)));
    _ = &new_size;
    if (new_size > p.*.m_capacity) {
        var new_capacity: usize = p.*.m_capacity;
        _ = &new_capacity;
        var pNew_buf: [*c]mz_uint8 = undefined;
        _ = &pNew_buf;
        if (!(p.*.m_expandable != 0)) return @as(c_int, 0);
        while (true) {
            new_capacity = if (@as(usize, @as(c_uint, 128)) > (new_capacity << @intCast(@as(usize, 1)))) @as(usize, @as(c_uint, 128)) else new_capacity << @intCast(@as(usize, 1));
            if (!(new_size > new_capacity)) break;
        }
        pNew_buf = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(p.*.m_pBuf)), new_capacity)));
        if (!(pNew_buf != null)) return @as(c_int, 0);
        p.*.m_pBuf = pNew_buf;
        p.*.m_capacity = new_capacity;
    }
    _ = memcpy(@ptrCast(@alignCast(p.*.m_pBuf + p.*.m_size)), pBuf, @bitCast(@as(c_long, len)));
    p.*.m_size = new_size;
    return @as(c_int, 1);
}
pub fn tdefl_write_image_to_png_file_in_memory_ex(pImage: ?*const anyopaque, w: c_int, h: c_int, num_chans: c_int, bpl: c_int, pLen_out: [*c]usize, level: mz_uint, flip: mz_bool, plte: [*c]mz_uint8, plte_size: c_int, trns: [*c]mz_uint8, trns_size: c_int) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    const static_local_s_tdefl_png_num_probes = struct {
        const s_tdefl_png_num_probes: [11]mz_uint = [11]mz_uint{
            0,
            1,
            6,
            32,
            16,
            32,
            128,
            256,
            512,
            768,
            1500,
        };
    };
    _ = &static_local_s_tdefl_png_num_probes;
    var pComp: [*c]tdefl_compressor = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(tdefl_compressor))));
    _ = &pComp;
    var out_buf: tdefl_output_buffer = undefined;
    _ = &out_buf;
    var i: c_int = undefined;
    _ = &i;
    var y: c_int = undefined;
    _ = &y;
    var z: c_int = 0;
    _ = &z;
    var c: mz_uint32 = undefined;
    _ = &c;
    pLen_out.* = 0;
    var data_start: usize = undefined;
    _ = &data_start;
    var data_size: usize = undefined;
    _ = &data_size;
    if (!(pComp != null)) return null;
    _ = memset(@ptrCast(@alignCast(&out_buf)), 0, @sizeOf(@TypeOf(out_buf)));
    out_buf.m_expandable = @as(c_int, 1);
    out_buf.m_capacity = @bitCast(@as(c_long, @as(c_int, 57) + (if (@as(c_int, 64) > ((@as(c_int, 1) + (w * num_chans)) * h)) @as(c_int, 64) else (@as(c_int, 1) + (w * num_chans)) * h)));
    if (plte_size > @as(c_int, 0)) {
        out_buf.m_capacity +%= @bitCast(@as(c_long, @as(c_int, 12) + plte_size));
    }
    if (trns_size > @as(c_int, 0)) {
        out_buf.m_capacity +%= @bitCast(@as(c_long, @as(c_int, 12) + trns_size));
    }
    if (@as(?*anyopaque, null) == @as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = @as([*c]mz_uint8, @ptrCast(@alignCast(SDL_malloc_REAL(out_buf.m_capacity))));
        out_buf.m_pBuf = tmp;
        break :blk tmp;
    })))) {
        SDL_free_REAL(@ptrCast(@alignCast(pComp)));
        return null;
    }
    {
        const static_local_chans = struct {
            const chans: [5]mz_uint8 = [5]mz_uint8{
                0,
                0,
                4,
                2,
                6,
            };
        };
        _ = &static_local_chans;
        var pnghdr: [33]mz_uint8 = [33]mz_uint8{
            137,
            80,
            78,
            71,
            13,
            10,
            26,
            10,
            0,
            0,
            0,
            13,
            73,
            72,
            68,
            82,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            8,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
        };
        _ = &pnghdr;
        pnghdr[@as(c_int, 18)] = @bitCast(@as(i8, @truncate(w >> @intCast(@as(c_int, 8)))));
        pnghdr[@as(c_int, 19)] = @bitCast(@as(i8, @truncate(w >> @intCast(@as(c_int, 0)))));
        pnghdr[@as(c_int, 22)] = @bitCast(@as(i8, @truncate(h >> @intCast(@as(c_int, 8)))));
        pnghdr[@as(c_int, 23)] = @bitCast(@as(i8, @truncate(h >> @intCast(@as(c_int, 0)))));
        if ((num_chans == @as(c_int, 1)) and (plte_size > @as(c_int, 0))) {
            pnghdr[@as(c_int, 25)] = 3;
        } else {
            pnghdr[@as(c_int, 25)] = static_local_chans.chans[@bitCast(@as(isize, @intCast(num_chans)))];
        }
        c = @truncate(mz_crc32(@bitCast(@as(c_long, @as(c_int, 0))), @as([*c]mz_uint8, @ptrCast(@alignCast(&pnghdr))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 12))))), 17));
        {
            i = 0;
            while (i < @as(c_int, 4)) : ({
                i += 1;
                c <<= @intCast(@as(mz_uint32, 8));
            }) {
                (@as([*c]mz_uint8, @ptrCast(@alignCast(&pnghdr))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 29))))))[@bitCast(@as(isize, @intCast(i)))] = @truncate(c >> @intCast(@as(mz_uint32, 24)));
            }
        }
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&pnghdr))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(pnghdr))))), @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
    }
    if (plte_size > @as(c_int, 0)) {
        var hdr: [8]mz_uint8 = [8]mz_uint8{
            0,
            0,
            0,
            0,
            80,
            76,
            84,
            69,
        };
        _ = &hdr;
        hdr[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(plte_size >> @intCast(@as(c_int, 24)))));
        hdr[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(plte_size >> @intCast(@as(c_int, 16)))));
        hdr[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(plte_size >> @intCast(@as(c_int, 8)))));
        hdr[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(plte_size >> @intCast(@as(c_int, 0)))));
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&hdr))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(hdr))))), @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        data_start = out_buf.m_size;
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(plte)), plte_size, @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]u8, @constCast("\x00\x00\x00\x00")))), 4, @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        c = @truncate(mz_crc32(@bitCast(@as(c_long, @as(c_int, 0))), (out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), @bitCast(@as(c_long, plte_size + @as(c_int, 4)))));
        {
            i = 0;
            while (i < @as(c_int, 4)) : ({
                i += 1;
                c <<= @intCast(@as(mz_uint32, 8));
            }) {
                ((out_buf.m_pBuf + out_buf.m_size) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))[@bitCast(@as(isize, @intCast(i)))] = @truncate(c >> @intCast(@as(mz_uint32, 24)));
            }
        }
    }
    if (trns_size > @as(c_int, 0)) {
        var hdr: [8]mz_uint8 = [8]mz_uint8{
            0,
            0,
            0,
            0,
            116,
            82,
            78,
            83,
        };
        _ = &hdr;
        hdr[@as(c_int, 0)] = @bitCast(@as(i8, @truncate(trns_size >> @intCast(@as(c_int, 24)))));
        hdr[@as(c_int, 1)] = @bitCast(@as(i8, @truncate(trns_size >> @intCast(@as(c_int, 16)))));
        hdr[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(trns_size >> @intCast(@as(c_int, 8)))));
        hdr[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(trns_size >> @intCast(@as(c_int, 0)))));
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(&hdr))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(hdr))))), @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        data_start = out_buf.m_size;
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(trns)), trns_size, @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]u8, @constCast("\x00\x00\x00\x00")))), 4, @ptrCast(@alignCast(&out_buf))) != 0)) {
            pLen_out.* = 0;
            SDL_free_REAL(@ptrCast(@alignCast(pComp)));
            SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
            return null;
        }
        c = @truncate(mz_crc32(@bitCast(@as(c_long, @as(c_int, 0))), (out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), @bitCast(@as(c_long, trns_size + @as(c_int, 4)))));
        {
            i = 0;
            while (i < @as(c_int, 4)) : ({
                i += 1;
                c <<= @intCast(@as(mz_uint32, 8));
            }) {
                ((out_buf.m_pBuf + out_buf.m_size) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))[@bitCast(@as(isize, @intCast(i)))] = @truncate(c >> @intCast(@as(mz_uint32, 24)));
            }
        }
    }
    if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]u8, @constCast("\x00\x00\x00\x00IDAT")))), 8, @ptrCast(@alignCast(&out_buf))) != 0)) {
        pLen_out.* = 0;
        SDL_free_REAL(@ptrCast(@alignCast(pComp)));
        SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
        return null;
    }
    data_start = out_buf.m_size;
    _ = tdefl_init(pComp, tdefl_output_buffer_putter, @ptrCast(@alignCast(&out_buf)), @bitCast(@as(c_uint, @truncate(static_local_s_tdefl_png_num_probes.s_tdefl_png_num_probes[if (@as(mz_uint, @bitCast(@as(c_int, @as(c_int, 10)))) < level) @as(mz_uint, @bitCast(@as(c_int, @as(c_int, 10)))) else level] | @as(mz_uint, TDEFL_WRITE_ZLIB_HEADER)))));
    {
        y = 0;
        while (y < h) : (y += 1) {
            _ = tdefl_compress_buffer(pComp, @ptrCast(@alignCast(&z)), 1, TDEFL_NO_FLUSH);
            _ = tdefl_compress_buffer(pComp, @ptrCast(@alignCast(@as([*c]mz_uint8, @ptrCast(@alignCast(@constCast(pImage)))) + @as(usize, @bitCast(@as(isize, @intCast((if (flip != 0) (h - @as(c_int, 1)) - y else y) * bpl)))))), @bitCast(@as(c_long, w * num_chans)), TDEFL_NO_FLUSH);
        }
    }
    if (tdefl_compress_buffer(pComp, null, 0, TDEFL_FINISH) != TDEFL_STATUS_DONE) {
        SDL_free_REAL(@ptrCast(@alignCast(pComp)));
        SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
        return null;
    }
    data_size = out_buf.m_size -% data_start;
    ((out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))))[@as(c_int, 0)] = @truncate(data_size >> @intCast(@as(usize, 24)));
    ((out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))))[@as(c_int, 1)] = @truncate(data_size >> @intCast(@as(usize, 16)));
    ((out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))))[@as(c_int, 2)] = @truncate(data_size >> @intCast(@as(usize, 8)));
    ((out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))))[@as(c_int, 3)] = @truncate(data_size >> @intCast(@as(usize, 0)));
    if (!(tdefl_output_buffer_putter(@ptrCast(@alignCast(@as([*c]u8, @constCast("\x00\x00\x00\x00\x00\x00\x00\x00IEND\xaeB`\x82")))), 16, @ptrCast(@alignCast(&out_buf))) != 0)) {
        pLen_out.* = 0;
        SDL_free_REAL(@ptrCast(@alignCast(pComp)));
        SDL_free_REAL(@ptrCast(@alignCast(out_buf.m_pBuf)));
        return null;
    }
    c = @truncate(mz_crc32(@bitCast(@as(c_long, @as(c_int, 0))), (out_buf.m_pBuf + data_start) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), data_size +% @as(usize, 4)));
    {
        i = 0;
        while (i < @as(c_int, 4)) : ({
            i += 1;
            c <<= @intCast(@as(mz_uint32, 8));
        }) {
            ((out_buf.m_pBuf + out_buf.m_size) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))[@bitCast(@as(isize, @intCast(i)))] = @truncate(c >> @intCast(@as(mz_uint32, 24)));
        }
    }
    pLen_out.* = out_buf.m_size;
    SDL_free_REAL(@ptrCast(@alignCast(pComp)));
    return @ptrCast(@alignCast(out_buf.m_pBuf));
}
pub fn SDL_ConvertPixels_MJPG_to_NV12(width: c_int, height: c_int, src: ?*const anyopaque, src_pitch: c_int, dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var w: c_int = 0;
    _ = &w;
    var h: c_int = 0;
    _ = &h;
    var format: c_int = 0;
    _ = &format;
    var s: stbi__context = undefined;
    _ = &s;
    stbi__start_mem(&s, @ptrCast(@alignCast(src)), src_pitch);
    var ri: stbi__result_info = undefined;
    _ = &ri;
    _ = memset(@ptrCast(@alignCast(&ri)), 0, @sizeOf(@TypeOf(ri)));
    ri.bits_per_channel = 8;
    ri.channel_order = STBI_ORDER_RGB;
    ri.num_channels = 0;
    var nv12: stbi__nv12 = undefined;
    _ = &nv12;
    nv12.w = width;
    nv12.h = height;
    nv12.pitch = dst_pitch;
    nv12.y = @ptrCast(@alignCast(dst));
    nv12.uv = nv12.y + @as(usize, @bitCast(@as(isize, @intCast(nv12.h * nv12.pitch))));
    var pixels: ?*anyopaque = stbi__jpeg_load(&s, &w, &h, &format, 4, &nv12, &ri);
    _ = &pixels;
    if (!(pixels != null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_ConvertPixels_STB(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, _: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
        if (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) {
            return SDL_ConvertPixels_MJPG_to_NV12(width, height, src, src_pitch, dst, dst_pitch);
        } else if (((((((dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2))) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) or (dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) {
            var temp_size: usize = 0;
            _ = &temp_size;
            var temp_pitch: usize = 0;
            _ = &temp_pitch;
            if (!SDL_CalculateYUVSize(dst_format, width, height, &temp_size, &temp_pitch)) {
                return @"false" != 0;
            }
            var temp_pixels: ?*anyopaque = SDL_malloc_REAL(temp_size);
            _ = &temp_pixels;
            if (!(temp_pixels != null)) {
                return @"false" != 0;
            }
            if (!SDL_ConvertPixels_MJPG_to_NV12(width, height, src, src_pitch, temp_pixels, @bitCast(@as(c_uint, @truncate(temp_pitch))))) {
                SDL_free_REAL(temp_pixels);
                return @"false" != 0;
            }
            var result: bool = SDL_ConvertPixelsAndColorspace_REAL(width, height, SDL_PIXELFORMAT_NV12, src_colorspace, 0, temp_pixels, @bitCast(@as(c_uint, @truncate(temp_pitch))), dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
            _ = &result;
            SDL_free_REAL(temp_pixels);
            return result;
        }
    }
    var result: bool = undefined;
    _ = &result;
    var w: c_int = 0;
    _ = &w;
    var h: c_int = 0;
    _ = &h;
    var format: c_int = 0;
    _ = &format;
    var len: c_int = if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) src_pitch else height * src_pitch;
    _ = &len;
    var pixels: ?*anyopaque = @ptrCast(@alignCast(stbi_load_from_memory(@ptrCast(@alignCast(src)), len, &w, &h, &format, 4)));
    _ = &pixels;
    if (!(pixels != null)) {
        return @"false" != 0;
    }
    if ((w == width) and (h == height)) {
        result = SDL_ConvertPixelsAndColorspace_REAL(w, h, SDL_PIXELFORMAT_RGBA32, SDL_COLORSPACE_SRGB, 0, pixels, width * @as(c_int, 4), dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
    } else {
        result = SDL_SetError_REAL("Expected image size %dx%d, actual size %dx%d", width, height, w, h);
    }
    stbi_image_free(pixels);
    return result;
}
pub fn IMG_LoadSTB_IO_read(user: ?*anyopaque, data: [*c]u8, size: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var amount: usize = SDL_ReadIO_REAL(@ptrCast(@alignCast(user)), @ptrCast(@alignCast(data)), @bitCast(@as(c_long, size)));
    _ = &amount;
    return @bitCast(@as(c_uint, @truncate(amount)));
}
pub fn IMG_LoadSTB_IO_skip(user: ?*anyopaque, n: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SeekIO_REAL(@ptrCast(@alignCast(user)), n, SDL_IO_SEEK_CUR);
}
pub fn IMG_LoadSTB_IO_eof(user: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var src: ?*SDL_IOStream = @ptrCast(@alignCast(user));
    _ = &src;
    return @intFromBool(SDL_GetIOStatus_REAL(src) == @as(SDL_IOStatus, SDL_IO_STATUS_EOF));
}
pub fn SDL_LoadSTB_IO(src: ?*SDL_IOStream) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var start: Sint64 = undefined;
    _ = &start;
    var magic: [26]Uint8 = undefined;
    _ = &magic;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var format: c_int = undefined;
    _ = &format;
    var pixels: [*c]stbi_uc = undefined;
    _ = &pixels;
    var rw_callbacks: stbi_io_callbacks = undefined;
    _ = &rw_callbacks;
    var surface: [*c]SDL_Surface = null;
    _ = &surface;
    var use_palette: bool = @"false" != 0;
    _ = &use_palette;
    var palette_colors: [256]c_uint = undefined;
    _ = &palette_colors;
    start = SDL_TellIO_REAL(src);
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))))), @sizeOf(@TypeOf(magic))) == @sizeOf(@TypeOf(magic))) {
        const PNG_COLOR_INDEXED: Uint8 = 3;
        _ = &PNG_COLOR_INDEXED;
        if (((((((((@as(c_int, magic[@as(c_int, 0)]) == @as(c_int, 137)) and (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 'P'))) and (@as(c_int, magic[@as(c_int, 2)]) == @as(c_int, 'N'))) and (@as(c_int, magic[@as(c_int, 3)]) == @as(c_int, 'G'))) and (@as(c_int, magic[@as(c_int, 12)]) == @as(c_int, 'I'))) and (@as(c_int, magic[@as(c_int, 13)]) == @as(c_int, 'H'))) and (@as(c_int, magic[@as(c_int, 14)]) == @as(c_int, 'D'))) and (@as(c_int, magic[@as(c_int, 15)]) == @as(c_int, 'R'))) and (@as(c_int, magic[@as(c_int, 25)]) == @as(c_int, PNG_COLOR_INDEXED))) {
            use_palette = @"true" != 0;
        }
    }
    _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
    rw_callbacks.read = IMG_LoadSTB_IO_read;
    rw_callbacks.skip = IMG_LoadSTB_IO_skip;
    rw_callbacks.eof = IMG_LoadSTB_IO_eof;
    w = blk: {
        const tmp = blk_1: {
            const tmp_2 = @as(c_int, 0);
            format = tmp_2;
            break :blk_1 tmp_2;
        };
        h = tmp;
        break :blk tmp;
    };
    if (use_palette) {
        _ = memset(@ptrCast(@alignCast(@as([*c]c_uint, @ptrCast(@alignCast(&palette_colors))))), 255, @sizeOf(@TypeOf(palette_colors)));
        pixels = stbi_load_from_callbacks_with_palette(&rw_callbacks, @ptrCast(@alignCast(src)), &w, &h, @ptrCast(@alignCast(&palette_colors)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(palette_colors)) / @sizeOf(@TypeOf(palette_colors[@as(c_int, 0)]))))));
    } else {
        pixels = stbi_load_from_callbacks(&rw_callbacks, @ptrCast(@alignCast(src)), &w, &h, &format, STBI_default);
    }
    if (!(pixels != null)) {
        _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
        return null;
    }
    if (use_palette) {
        surface = SDL_CreateSurfaceFrom_REAL(w, h, SDL_PIXELFORMAT_INDEX8, @ptrCast(@alignCast(pixels)), w);
        if (surface != null) {
            var has_colorkey: bool = @"false" != 0;
            _ = &has_colorkey;
            var colorkey_index: c_int = -@as(c_int, 1);
            _ = &colorkey_index;
            var has_alpha: bool = @"false" != 0;
            _ = &has_alpha;
            var palette: [*c]SDL_Palette = SDL_CreateSurfacePalette_REAL(surface);
            _ = &palette;
            if (palette != null) {
                var i: c_int = undefined;
                _ = &i;
                var palette_bytes: [*c]Uint8 = @ptrCast(@alignCast(@as([*c]c_uint, @ptrCast(@alignCast(&palette_colors)))));
                _ = &palette_bytes;
                {
                    i = 0;
                    while (i < palette.*.ncolors) : (i += 1) {
                        palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r = (blk: {
                            const ref = &palette_bytes;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g = (blk: {
                            const ref = &palette_bytes;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b = (blk: {
                            const ref = &palette_bytes;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a = (blk: {
                            const ref = &palette_bytes;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        if (@as(c_int, palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a) != SDL_ALPHA_OPAQUE) {
                            if ((@as(c_int, palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a) == SDL_ALPHA_TRANSPARENT) and !has_colorkey) {
                                has_colorkey = @"true" != 0;
                                colorkey_index = i;
                            } else {
                                has_alpha = @"true" != 0;
                            }
                        }
                    }
                }
            }
            if (has_alpha) {
                _ = SDL_SetSurfaceBlendMode_REAL(surface, SDL_BLENDMODE_BLEND);
            } else if (has_colorkey) {
                _ = SDL_SetSurfaceColorKey_REAL(surface, @"true" != 0, @bitCast(@as(c_int, colorkey_index)));
            }
            surface.*.flags &= ~SDL_SURFACE_PREALLOCATED;
        }
    } else if (((format == STBI_grey) or (format == STBI_rgb)) or (format == STBI_rgb_alpha)) {
        surface = SDL_CreateSurfaceFrom_REAL(w, h, @bitCast(if (format == STBI_rgb_alpha) SDL_PIXELFORMAT_RGBA32 else if (format == STBI_rgb) SDL_PIXELFORMAT_RGB24 else SDL_PIXELFORMAT_INDEX8), @ptrCast(@alignCast(pixels)), w * format);
        if (surface != null) {
            if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
                var palette: [*c]SDL_Palette = SDL_CreateSurfacePalette_REAL(surface);
                _ = &palette;
                if (palette != null) {
                    var i: c_int = undefined;
                    _ = &i;
                    {
                        i = 0;
                        while (i < palette.*.ncolors) : (i += 1) {
                            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r = @bitCast(@as(i8, @truncate(i)));
                            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g = @bitCast(@as(i8, @truncate(i)));
                            palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b = @bitCast(@as(i8, @truncate(i)));
                        }
                    }
                }
            }
            surface.*.flags &= ~SDL_SURFACE_PREALLOCATED;
        }
    } else if (format == STBI_grey_alpha) {
        surface = SDL_CreateSurfaceUninitialized(w, h, SDL_PIXELFORMAT_RGBA32);
        if (surface != null) {
            var src_ptr: [*c]Uint8 = pixels;
            _ = &src_ptr;
            var dst: [*c]Uint8 = @ptrCast(@alignCast(surface.*.pixels));
            _ = &dst;
            var skip: c_int = surface.*.pitch - (surface.*.w * @as(c_int, 4));
            _ = &skip;
            var row: c_int = undefined;
            _ = &row;
            var col: c_int = undefined;
            _ = &col;
            {
                row = 0;
                while (row < h) : (row += 1) {
                    {
                        col = 0;
                        while (col < w) : (col += 1) {
                            var c: Uint8 = (blk: {
                                const ref = &src_ptr;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                            _ = &c;
                            var a: Uint8 = (blk: {
                                const ref = &src_ptr;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                            _ = &a;
                            (blk: {
                                const ref = &dst;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = c;
                            (blk: {
                                const ref = &dst;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = c;
                            (blk: {
                                const ref = &dst;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = c;
                            (blk: {
                                const ref = &dst;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = a;
                        }
                    }
                    dst += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                }
            }
            stbi_image_free(@ptrCast(@alignCast(pixels)));
        }
    } else {
        _ = SDL_SetError_REAL("Unknown image format: %d", format);
    }
    if (!(surface != null)) {
        stbi_image_free(@ptrCast(@alignCast(pixels)));
        _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
    }
    return surface;
}
pub export fn SDL_IsJPG(src: ?*SDL_IOStream) bool {
    @setEvalBranchQuota(100000);
    var start: Sint64 = undefined;
    _ = &start;
    var is_JPG: bool = undefined;
    _ = &is_JPG;
    var in_scan: bool = undefined;
    _ = &in_scan;
    var magic: [4]Uint8 = undefined;
    _ = &magic;
    if (!(src != null)) {
        return @"false" != 0;
    }
    start = SDL_TellIO_REAL(src);
    is_JPG = @"false" != 0;
    in_scan = @"false" != 0;
    if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))))), 2) == @as(usize, 2)) {
        if ((@as(c_int, magic[@as(c_int, 0)]) == @as(c_int, 255)) and (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 216))) {
            is_JPG = @"true" != 0;
            while (is_JPG) {
                if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))))), 2) != @as(usize, 2)) {
                    is_JPG = @"false" != 0;
                } else if ((@as(c_int, magic[@as(c_int, 0)]) != @as(c_int, 255)) and !in_scan) {
                    is_JPG = @"false" != 0;
                } else if ((@as(c_int, magic[@as(c_int, 0)]) != @as(c_int, 255)) or (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 255))) {
                    _ = SDL_SeekIO_REAL(src, -@as(c_int, 1), SDL_IO_SEEK_CUR);
                } else if (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 217)) {
                    break;
                } else if (in_scan and (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 0))) {} else if ((@as(c_int, magic[@as(c_int, 1)]) >= @as(c_int, 208)) and (@as(c_int, magic[@as(c_int, 1)]) < @as(c_int, 217))) {} else if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))), 2) != @as(usize, 2)) {
                    is_JPG = @"false" != 0;
                } else {
                    var innerStart: Sint64 = undefined;
                    _ = &innerStart;
                    var size: Uint32 = undefined;
                    _ = &size;
                    var end: Sint64 = undefined;
                    _ = &end;
                    innerStart = SDL_TellIO_REAL(src);
                    size = @bitCast(@as(c_int, (@as(c_int, magic[@as(c_int, 2)]) << @intCast(@as(c_int, 8))) + @as(c_int, magic[@as(c_int, 3)])));
                    end = SDL_SeekIO_REAL(src, size -% @as(Uint32, 2), SDL_IO_SEEK_CUR);
                    if (end != ((innerStart + @as(Sint64, size)) - @as(Sint64, 2))) {
                        is_JPG = @"false" != 0;
                    }
                    if (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 218)) {
                        break;
                    }
                }
            }
        }
    }
    _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
    return is_JPG;
}
pub export fn SDL_LoadJPG_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                surface = null;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if ((src != null) and closeio) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @constCast("src")));
                {
                    sdl_pc = 1;
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
                if (!SDL_IsJPG(src)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("File is not a JPEG file");
                {
                    sdl_pc = 1;
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
                surface = SDL_LoadSTB_IO(src);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                _ = SDL_CloseIO_REAL(src);
                {
                    sdl_pc = 10;
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
                return surface;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_LoadJPG_REAL(file: [*c]const u8) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        return null;
    }
    return SDL_LoadJPG_IO_REAL(stream, @"true" != 0);
}
pub export fn SDL_IsPNG(src: ?*SDL_IOStream) bool {
    @setEvalBranchQuota(100000);
    var start: Sint64 = undefined;
    _ = &start;
    var magic: [4]Uint8 = undefined;
    _ = &magic;
    var is_PNG: bool = undefined;
    _ = &is_PNG;
    is_PNG = @"false" != 0;
    start = SDL_TellIO_REAL(src);
    if (start >= @as(Sint64, 0)) {
        if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))))), @sizeOf(@TypeOf(magic))) == @sizeOf(@TypeOf(magic))) {
            if ((((@as(c_int, magic[@as(c_int, 0)]) == @as(c_int, 137)) and (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 'P'))) and (@as(c_int, magic[@as(c_int, 2)]) == @as(c_int, 'N'))) and (@as(c_int, magic[@as(c_int, 3)]) == @as(c_int, 'G'))) {
                is_PNG = @"true" != 0;
            }
        }
        _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
    }
    return is_PNG;
}
pub export fn SDL_LoadPNG_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                surface = null;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if ((src != null) and closeio) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @constCast("src")));
                {
                    sdl_pc = 1;
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
                if (!SDL_IsPNG(src)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("File is not a PNG file");
                {
                    sdl_pc = 1;
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
                surface = SDL_LoadSTB_IO(src);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                _ = SDL_CloseIO_REAL(src);
                {
                    sdl_pc = 10;
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
                return surface;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_LoadPNG_REAL(file: [*c]const u8) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        return null;
    }
    return SDL_LoadPNG_IO_REAL(stream, @"true" != 0);
}
pub export fn SDL_SavePNG_IO_REAL(arg_surface: [*c]SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool {
    @setEvalBranchQuota(100000);
    var surface = arg_surface;
    _ = &surface;
    var retval: bool = undefined;
    _ = &retval;
    var plte: [*c]Uint8 = undefined;
    _ = &plte;
    var trns: [*c]Uint8 = undefined;
    _ = &trns;
    var free_surface: bool = undefined;
    _ = &free_surface;
    var plte_size: c_int = undefined;
    _ = &plte_size;
    var trns_size: c_int = undefined;
    _ = &trns_size;
    var colors: [*c]SDL_Color = undefined;
    _ = &colors;
    var i: c_int = undefined;
    _ = &i;
    var size: usize = undefined;
    _ = &size;
    var png: ?*anyopaque = undefined;
    _ = &png;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                retval = @"false" != 0;
                plte = null;
                trns = null;
                free_surface = @"false" != 0;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (free_surface) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @constCast("surface")));
                {
                    sdl_pc = 1;
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
                if (!(dst != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @constCast("dst")));
                {
                    sdl_pc = 1;
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
                plte_size = 0;
                trns_size = 0;
                if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if (!(surface.*.palette != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                if (surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            10 => {
                size = 0;
                png = tdefl_write_image_to_png_file_in_memory_ex(surface.*.pixels, surface.*.w, surface.*.h, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))), surface.*.pitch, &size, 6, @as(c_int, 0), plte, plte_size, trns, trns_size);
                if (png != null) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            11 => {
                _ = SDL_SetError_REAL("Indexed surfaces must have a palette");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_INDEX8);
                if (!(surface != null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                plte_size = surface.*.palette.*.ncolors * @as(c_int, 3);
                trns_size = surface.*.palette.*.ncolors;
                plte = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, plte_size)))));
                trns = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, trns_size)))));
                if (!(plte != null) or !(trns != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
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
                free_surface = @"true" != 0;
                {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                colors = surface.*.palette.*.colors;
                i = 0;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (i < surface.*.palette.*.ncolors) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                plte[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 0))))] = colors[@bitCast(@as(isize, @intCast(i)))].r;
                plte[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 1))))] = colors[@bitCast(@as(isize, @intCast(i)))].g;
                plte[@bitCast(@as(isize, @intCast((i * @as(c_int, 3)) + @as(c_int, 2))))] = colors[@bitCast(@as(isize, @intCast(i)))].b;
                trns[@bitCast(@as(isize, @intCast(i)))] = colors[@bitCast(@as(isize, @intCast(i)))].a;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                i += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            27 => {
                surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_RGBA32);
                if (!(surface != null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                free_surface = @"true" != 0;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                if (SDL_WriteIO_REAL(dst, png, size) != 0) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                _ = SDL_SetError_REAL("Failed to convert and save image");
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            36 => {
                retval = @"true" != 0;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                mz_free(png);
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                SDL_DestroySurface_REAL(surface);
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
                SDL_free_REAL(@ptrCast(@alignCast(plte)));
                SDL_free_REAL(@ptrCast(@alignCast(trns)));
                if ((dst != null) and closeio) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    const ref = &retval;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_CloseIO_REAL(dst)))) != 0;
                }
                {
                    sdl_pc = 44;
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
                return retval;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SavePNG_REAL(surface: [*c]SDL_Surface, file: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @constCast("surface")));
    }
    if ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) and !(surface.*.palette != null)) {
        return SDL_SetError_REAL("Indexed surfaces must have a palette");
    }
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "wb");
    _ = &stream;
    if (!(stream != null)) {
        return @"false" != 0;
    }
    return SDL_SavePNG_IO_REAL(surface, stream, @"true" != 0);
}

pub const SDL_LoadPNG_IO = SDL_LoadPNG_IO_REAL;
pub const SDL_LoadPNG = SDL_LoadPNG_REAL;
pub const SDL_SavePNG_IO = SDL_SavePNG_IO_REAL;
pub const SDL_SavePNG = SDL_SavePNG_REAL;
pub const SDL_LoadJPG_IO = SDL_LoadJPG_IO_REAL;
pub const SDL_LoadJPG = SDL_LoadJPG_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_BLEND = @as(c_uint, 0x00000001);
pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_ALPHA_TRANSPARENT = @as(c_int, 0);
pub const SDL_SURFACE_PREALLOCATED = @as(c_uint, 0x00000001);
pub const FAST_BITS = @as(c_int, 9);
pub const STBI__MARKER_none = @as(c_int, 0xff);
pub const STBI__ZFAST_BITS = @as(c_int, 9);
pub const STBI__ZNSYMS = @as(c_int, 288);

// /home/addo/dev/stupid/zdl/.ref/SDL/src/video/stb_image.h:5241:9: warning: macro 'stbi__unpremultiply_on_load' contains a runtime value, translated to function
pub const TDEFL_MAX_HUFF_SYMBOLS_0 = @as(c_int, 288);
pub const TDEFL_MAX_HUFF_SYMBOLS_1 = @as(c_int, 32);
pub const TDEFL_MAX_HUFF_SYMBOLS_2 = @as(c_int, 19);
pub const TDEFL_LZ_DICT_SIZE = __helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const TDEFL_MIN_MATCH_LEN = @as(c_int, 3);
pub const TDEFL_MAX_MATCH_LEN = @as(c_int, 258);
