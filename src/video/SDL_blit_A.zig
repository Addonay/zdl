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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
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
pub extern fn SDL_HasMMX_REAL() bool;
pub extern fn SDL_HasSSE2_REAL() bool;
pub extern fn SDL_HasSSE41_REAL() bool;
pub extern fn SDL_HasAVX2_REAL() bool;
pub const __m64 = @Vector(1, c_longlong);
pub const __v2si = @Vector(2, c_int);
pub const __v4hi = @Vector(4, c_short);
pub const __v1du = @Vector(1, c_ulonglong);
pub const __v4hu = @Vector(4, c_ushort);
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v4si = @Vector(4, c_int);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const _mm_empty = @import("simd")._mm_empty;
pub inline fn _mm_unpacklo_pi16(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v4hi, @bitCast(__m1)))).vector.child, @as(__v4hi, @bitCast(__m1)), @as(__v4hi, @bitCast(__m2)), @Vector(4, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(@as(__v4hi, @bitCast(__m1)))).vector.len),
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(@as(__v4hi, @bitCast(__m1)))).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(@as(__v4hi, @bitCast(__m1)))).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(@as(__v4hi, @bitCast(__m1)))).vector.len),
    }));
}
pub inline fn _mm_unpacklo_pi32(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v2si, @bitCast(__m1)))).vector.child, @as(__v2si, @bitCast(__m1)), @as(__v2si, @bitCast(__m2)), @Vector(2, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(@as(__v2si, @bitCast(__m1)))).vector.len),
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(@as(__v2si, @bitCast(__m1)))).vector.len),
    }));
}
pub inline fn _mm_add_pi16(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4hu, @bitCast(__m1)) + @as(__v4hu, @bitCast(__m2)));
}
pub inline fn _mm_sub_pi16(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4hu, @bitCast(__m1)) - @as(__v4hu, @bitCast(__m2)));
}
pub const _mm_mulhi_pi16 = @import("simd")._mm_mulhi_pi16;
pub inline fn _mm_mullo_pi16(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4hu, @bitCast(__m1)) * @as(__v4hu, @bitCast(__m2)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:732:20: warning: TODO implement function '__builtin_ia32_psllw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:730:1: warning: unable to translate function, demoted to extern
pub const _mm_slli_pi16 = @import("simd")._mm_slli_pi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:777:20: warning: TODO implement function '__builtin_ia32_pslld128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:775:1: warning: unable to translate function, demoted to extern
pub const _mm_slli_si64 = @import("simd")._mm_slli_si64;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:863:20: warning: TODO implement function '__builtin_ia32_psraw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:861:1: warning: unable to translate function, demoted to extern
pub const _mm_srli_pi16 = @import("simd")._mm_srli_pi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:1001:20: warning: TODO implement function '__builtin_ia32_psrld128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:999:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_and_si64(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v1du, @bitCast(__m1)) & @as(__v1du, @bitCast(__m2)));
}
pub inline fn _mm_or_si64(__m1: __m64, __m2: __m64) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v1du, @bitCast(__m1)) | @as(__v1du, @bitCast(__m2)));
}
pub inline fn _mm_set_pi32(__i1: c_int, __i0: c_int) __m64 {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2si, [2]c_int{
        __i0,
        __i1,
    }));
}
pub const __v4su = @Vector(4, c_uint);
pub const __v8hu = @Vector(8, c_ushort);
pub const __v16qu = @Vector(16, u8);
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
pub inline fn _mm_add_epi8(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v16qu, @bitCast(__a)) + @as(__v16qu, @bitCast(__b)));
}
pub inline fn _mm_add_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) + @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_add_epi32(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4su, @bitCast(__a)) + @as(__v4su, @bitCast(__b)));
}
pub const _mm_mulhi_epu16 = @import("simd")._mm_mulhi_epu16;
pub inline fn _mm_mullo_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) * @as(__v8hu, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2446:20: warning: TODO implement function '__builtin_ia32_pmuludq128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2444:54: warning: unable to translate function, demoted to extern
pub inline fn _mm_sub_epi8(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v16qu, @bitCast(__a)) - @as(__v16qu, @bitCast(__b)));
}
pub inline fn _mm_sub_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) - @as(__v8hu, @bitCast(__b)));
}
pub inline fn _mm_or_si128(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v2du, @bitCast(__a)) | @as(__v2du, @bitCast(__b)));
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
pub const _mm_maddubs_epi16 = @import("simd")._mm_maddubs_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:526:20: warning: TODO implement function '__builtin_ia32_pmaddubsw128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:525:1: warning: unable to translate function, demoted to extern
pub const _mm_shuffle_epi8 = @import("simd")._mm_shuffle_epi8;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:615:20: warning: TODO implement function '__builtin_ia32_pshufb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:614:1: warning: unable to translate function, demoted to extern
pub const __v8si = @Vector(8, c_int);
pub const __v16hi = @Vector(16, c_short);
pub const __v32qi = @Vector(32, u8);
pub const __v4du = @Vector(4, c_ulonglong);
pub const __v8su = @Vector(8, c_uint);
pub const __v16hu = @Vector(16, c_ushort);
pub const __v32qu = @Vector(32, u8);
pub const __m256i = @Vector(4, c_longlong);
pub const __m256i_u = @Vector(4, c_longlong);
pub inline fn _mm256_loadu_si256(__p: [*c]align(1) const __m256i_u) __m256i {
    @setEvalBranchQuota(100000);
    const struct___loadu_si256 = extern struct {
        __v: [4]c_longlong align(1) = @import("std").mem.zeroes(__m256i_u),
    };
    _ = &struct___loadu_si256;
    return @as([*c]const struct___loadu_si256, @ptrCast(@alignCast(__p))).*.__v;
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avxintrin.h:3206:19: warning: TODO implement function '__builtin_ia32_lddqu256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avxintrin.h:3204:1: warning: unable to translate function, demoted to extern
pub inline fn _mm256_storeu_si256(__p: [*c]align(1) __m256i_u, __a: __m256i) void {
    @setEvalBranchQuota(100000);
    const struct___storeu_si256 = extern struct {
        __v: [4]c_longlong align(1) = @import("std").mem.zeroes(__m256i_u),
    };
    _ = &struct___storeu_si256;
    @as([*c]struct___storeu_si256, @ptrCast(@alignCast(__p))).*.__v = __a;
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avxintrin.h:3348:19: warning: TODO implement function '__builtin_ia32_maskloadpd' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avxintrin.h:3346:1: warning: unable to translate function, demoted to extern
pub inline fn _mm256_set_epi32(__i0: c_int, __i1: c_int, __i2: c_int, __i3: c_int, __i4: c_int, __i5: c_int, __i6: c_int, __i7: c_int) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8si, [8]c_int{
        __i7,
        __i6,
        __i5,
        __i4,
        __i3,
        __i2,
        __i1,
        __i0,
    }));
}
pub inline fn _mm256_set_epi16(__w15: c_short, __w14: c_short, __w13: c_short, __w12: c_short, __w11: c_short, __w10: c_short, __w09: c_short, __w08: c_short, __w07: c_short, __w06: c_short, __w05: c_short, __w04: c_short, __w03: c_short, __w02: c_short, __w01: c_short, __w00: c_short) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v16hi, [16]c_short{
        __w00,
        __w01,
        __w02,
        __w03,
        __w04,
        __w05,
        __w06,
        __w07,
        __w08,
        __w09,
        __w10,
        __w11,
        __w12,
        __w13,
        __w14,
        __w15,
    }));
}
pub inline fn _mm256_set_epi8(__b31: u8, __b30: u8, __b29: u8, __b28: u8, __b27: u8, __b26: u8, __b25: u8, __b24: u8, __b23: u8, __b22: u8, __b21: u8, __b20: u8, __b19: u8, __b18: u8, __b17: u8, __b16: u8, __b15: u8, __b14: u8, __b13: u8, __b12: u8, __b11: u8, __b10: u8, __b09: u8, __b08: u8, __b07: u8, __b06: u8, __b05: u8, __b04: u8, __b03: u8, __b02: u8, __b01: u8, __b00: u8) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v32qi, [32]u8{
        __b00,
        __b01,
        __b02,
        __b03,
        __b04,
        __b05,
        __b06,
        __b07,
        __b08,
        __b09,
        __b10,
        __b11,
        __b12,
        __b13,
        __b14,
        __b15,
        __b16,
        __b17,
        __b18,
        __b19,
        __b20,
        __b21,
        __b22,
        __b23,
        __b24,
        __b25,
        __b26,
        __b27,
        __b28,
        __b29,
        __b30,
        __b31,
    }));
}
pub inline fn _mm256_set1_epi32(__i: c_int) __m256i {
    @setEvalBranchQuota(100000);
    return _mm256_set_epi32(__i, __i, __i, __i, __i, __i, __i, __i);
}
pub inline fn _mm256_set1_epi16(__w: c_short) __m256i {
    @setEvalBranchQuota(100000);
    return _mm256_set_epi16(__w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w, __w);
}
pub inline fn _mm256_set1_epi8(__b: u8) __m256i {
    @setEvalBranchQuota(100000);
    return _mm256_set_epi8(__b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b, __b);
}
pub const _mm256_packus_epi16 = @import("simd")._mm256_packus_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:262:20: warning: TODO implement function '__builtin_ia32_packusdw256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:261:1: warning: unable to translate function, demoted to extern
pub inline fn _mm256_add_epi8(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v32qu, @bitCast(__a)) + @as(__v32qu, @bitCast(__b)));
}
pub inline fn _mm256_add_epi16(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v16hu, @bitCast(__a)) + @as(__v16hu, @bitCast(__b)));
}
pub inline fn _mm256_add_epi32(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8su, @bitCast(__a)) + @as(__v8su, @bitCast(__b)));
}
pub const _mm256_maddubs_epi16 = @import("simd")._mm256_maddubs_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1065:19: warning: TODO implement function '__builtin_ia32_pmaddwd256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1064:1: warning: unable to translate function, demoted to extern
pub const _mm256_mulhi_epu16 = @import("simd")._mm256_mulhi_epu16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1691:19: warning: TODO implement function '__builtin_ia32_pmulhw256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1689:1: warning: unable to translate function, demoted to extern
pub inline fn _mm256_or_si256(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4du, @bitCast(__a)) | @as(__v4du, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1816:10: warning: TODO implement function '__builtin_ia32_psadbw256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1814:1: warning: unable to translate function, demoted to extern
pub const _mm256_shuffle_epi8 = @import("simd")._mm256_shuffle_epi8;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1980:19: warning: TODO implement function '__builtin_ia32_psignb256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1979:1: warning: unable to translate function, demoted to extern
pub inline fn _mm256_sub_epi8(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v32qu, @bitCast(__a)) - @as(__v32qu, @bitCast(__b)));
}
pub inline fn _mm256_unpackhi_epi8(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.child, @as(__v32qi, @bitCast(__a)), @as(__v32qi, @bitCast(__b)), @Vector(32, i32){
        __helpers.shuffleVectorIndex(8, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 8), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(9, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 9), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(10, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 10), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(11, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 11), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(12, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 12), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(13, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 13), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(14, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 14), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(15, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 15), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(24, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 24), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(25, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 25), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(26, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 26), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(27, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 27), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(28, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 28), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(29, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 29), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(30, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 30), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(31, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 31), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm256_unpacklo_epi8(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@shuffle(@typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.child, @as(__v32qi, @bitCast(__a)), @as(__v32qi, @bitCast(__b)), @Vector(32, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 0), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(1, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 1), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(2, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 2), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(3, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 3), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(4, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 4), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(5, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 5), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(6, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 6), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(7, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 7), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(16, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 16), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(17, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 17), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(18, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 18), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(19, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 19), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(20, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 20), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(21, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 21), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(22, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 22), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(23, @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 32) + @as(c_int, 23), @typeInfo(@TypeOf(@as(__v32qi, @bitCast(__a)))).vector.len),
    }));
}
pub inline fn _mm256_xor_si256(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4du, @bitCast(__a)) ^ @as(__v4du, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:2909:19: warning: TODO implement function '__builtin_nontemporal_load' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:2906:1: warning: unable to translate function, demoted to extern
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern var SDL_expand_byte: [9][*c]const Uint8;
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
pub const SDL_BlitFunc = ?*const fn (info: [*c]SDL_BlitInfo) callconv(.c) void;
pub extern fn SDL_Get8888AlphaMaskAndShift(fmt: [*c]const SDL_PixelFormatDetails, mask: [*c]Uint32, shift: [*c]Uint32) void;
pub fn BlitNto1SurfaceAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var palmap: [*c]Uint8 = undefined;
    _ = &palmap;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstpal: [*c]const SDL_Color = undefined;
    _ = &dstpal;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var A: c_uint = undefined;
    _ = &A;
    var n: c_int = undefined;
    _ = &n;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var x_4: Uint16 = undefined;
    _ = &x_4;
    var x_5: Uint16 = undefined;
    _ = &x_5;
    var x_6: Uint16 = undefined;
    _ = &x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var x_11: Uint16 = undefined;
    _ = &x_11;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                palmap = info.*.table;
                srcfmt = info.*.src_fmt;
                dstpal = info.*.dst_pal.*.colors;
                srcbpp = srcfmt.*.bytes_per_pixel;
                A = info.*.a;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 83;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if (false) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            21 => {
                x = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                x_1 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (false) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                x_2 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (false) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            30 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 33;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 41;
                        continue;
                    },
                    else => {
                        sdl_pc = 42;
                        continue;
                    },
                }
            },
            35 => {
                if (false) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            39 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            40 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                if (false) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            46 => {
                x_3 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if (false) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                x_4 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_4;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_4;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_4) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_4) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if (false) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                x_5 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_5;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_5;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_5) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_5) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (false) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            55 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 58;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 66;
                        continue;
                    },
                    else => {
                        sdl_pc = 67;
                        continue;
                    },
                }
            },
            60 => {
                if (false) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            64 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            65 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            66 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            67 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                if (false) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            71 => {
                x_6 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_6;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_6;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_6) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_6) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                if (false) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                x_7 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                if (false) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
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
                x_8 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (false) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            80 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 83;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 91;
                        continue;
                    },
                    else => {
                        sdl_pc = 92;
                        continue;
                    },
                }
            },
            85 => {
                if (false) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            88 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            89 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            94 => {
                if (false) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            96 => {
                x_9 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                if (false) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 98;
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
                x_10 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                if (false) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                x_11 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_11;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_11;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_11) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_11) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                if (false) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            105 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNto1PixelAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var palmap: [*c]Uint8 = undefined;
    _ = &palmap;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstpal: [*c]const SDL_Color = undefined;
    _ = &dstpal;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var sA: c_uint = undefined;
    _ = &sA;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var n: c_int = undefined;
    _ = &n;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var x_4: Uint16 = undefined;
    _ = &x_4;
    var x_5: Uint16 = undefined;
    _ = &x_5;
    var x_6: Uint16 = undefined;
    _ = &x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var x_11: Uint16 = undefined;
    _ = &x_11;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                palmap = info.*.table;
                srcfmt = info.*.src_fmt;
                dstpal = info.*.dst_pal.*.colors;
                srcbpp = srcfmt.*.bytes_per_pixel;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 83;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if (false) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            21 => {
                x = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                x_1 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (false) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                x_2 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (false) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            30 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 33;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 41;
                        continue;
                    },
                    else => {
                        sdl_pc = 42;
                        continue;
                    },
                }
            },
            35 => {
                if (false) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            39 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            40 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                if (false) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            46 => {
                x_3 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                if (false) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                x_4 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_4;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_4;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_4) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_4) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if (false) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                x_5 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_5;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_5;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_5) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_5) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (false) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            55 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 58;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 66;
                        continue;
                    },
                    else => {
                        sdl_pc = 67;
                        continue;
                    },
                }
            },
            60 => {
                if (false) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            64 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            65 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            66 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            67 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                if (false) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            71 => {
                x_6 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_6;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_6;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_6) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_6) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                if (false) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                x_7 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                if (false) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
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
                x_8 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (false) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            80 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 83;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 91;
                        continue;
                    },
                    else => {
                        sdl_pc = 92;
                        continue;
                    },
                }
            },
            85 => {
                if (false) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            88 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            89 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            94 => {
                if (false) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            96 => {
                x_9 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                if (false) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 98;
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
                x_10 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                if (false) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                x_11 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_11;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_11;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_11) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_11) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                if (false) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            105 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNto1SurfaceAlphaKey(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var palmap: [*c]Uint8 = undefined;
    _ = &palmap;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstpal: [*c]const SDL_Color = undefined;
    _ = &dstpal;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var A: c_uint = undefined;
    _ = &A;
    var n: c_int = undefined;
    _ = &n;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var x_4: Uint16 = undefined;
    _ = &x_4;
    var x_5: Uint16 = undefined;
    _ = &x_5;
    var x_6: Uint16 = undefined;
    _ = &x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var x_11: Uint16 = undefined;
    _ = &x_11;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                palmap = info.*.table;
                srcfmt = info.*.src_fmt;
                dstpal = info.*.dst_pal.*.colors;
                srcbpp = srcfmt.*.bytes_per_pixel;
                ckey = info.*.colorkey;
                A = info.*.a;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 92;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (Pixel != ckey) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            24 => {
                x = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (false) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                x_1 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (false) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
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
                x_2 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (false) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            33 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 20;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 44;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            38 => {
                if (false) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (Pixel != ckey) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            42 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            46 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 49;
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
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                if (false) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            52 => {
                x_3 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (false) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                x_4 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_4;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_4;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_4) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_4) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if (false) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                x_5 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_5;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_5;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_5) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_5) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                if (false) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            61 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 72;
                        continue;
                    },
                    else => {
                        sdl_pc = 73;
                        continue;
                    },
                }
            },
            66 => {
                if (false) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (Pixel != ckey) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            69 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            70 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            73 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            74 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 77;
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
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if (false) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            80 => {
                x_6 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_6;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_6;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_6) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_6) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if (false) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                x_7 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                if (false) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                x_8 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
                if (false) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            89 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 100;
                        continue;
                    },
                    else => {
                        sdl_pc = 101;
                        continue;
                    },
                }
            },
            94 => {
                if (false) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if (Pixel != ckey) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            98 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            99 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            100 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            101 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            102 => {
                dR = dstpal[dst.*].r;
                dG = dstpal[dst.*].g;
                dB = dstpal[dst.*].b;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                dst += 1;
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            106 => {
                if (false) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                dR &= 255;
                dG &= 255;
                dB &= 255;
                if (@as(?*anyopaque, @ptrCast(@alignCast(palmap))) == @as(?*anyopaque, null)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            108 => {
                x_9 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                if (false) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                x_10 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                if (false) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                x_11 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_11;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_11;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_11) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_11) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                if (false) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            117 => {
                dst.* = @truncate((((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))));
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                dst.* = palmap[(((dR >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 3) + @as(c_int, 2)))))) | ((dG >> @intCast(@as(c_uint, 5))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 2))))))) | ((dB >> @intCast(@as(c_uint, 6))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))))];
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit888to888SurfaceAlphaSSE2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var alpha: Uint8 = info.*.a;
    _ = &alpha;
    const alpha_fill_mask: __m128i = _mm_set1_epi32(@bitCast(@as(c_uint, @truncate(@as(c_uint, 4278190080)))));
    _ = &alpha_fill_mask;
    const srcA: __m128i = _mm_set1_epi16(alpha);
    _ = &srcA;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var i: c_int = 0;
        _ = &i;
        while ((i + @as(c_int, 4)) <= width) : (i += 4) {
            var src128: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(src)));
            _ = &src128;
            var dst128: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(dst)));
            _ = &dst128;
            var src_lo: __m128i = _mm_unpacklo_epi8(src128, _mm_setzero_si128());
            _ = &src_lo;
            var src_hi: __m128i = _mm_unpackhi_epi8(src128, _mm_setzero_si128());
            _ = &src_hi;
            var dst_lo: __m128i = _mm_unpacklo_epi8(dst128, _mm_setzero_si128());
            _ = &dst_lo;
            var dst_hi: __m128i = _mm_unpackhi_epi8(dst128, _mm_setzero_si128());
            _ = &dst_hi;
            dst_lo = _mm_add_epi16(_mm_mullo_epi16(_mm_sub_epi16(src_lo, dst_lo), srcA), _mm_sub_epi16(_mm_slli_epi16(dst_lo, 8), dst_lo));
            dst_hi = _mm_add_epi16(_mm_mullo_epi16(_mm_sub_epi16(src_hi, dst_hi), srcA), _mm_sub_epi16(_mm_slli_epi16(dst_hi, 8), dst_hi));
            dst_lo = _mm_add_epi16(dst_lo, _mm_set1_epi16(1));
            dst_hi = _mm_add_epi16(dst_hi, _mm_set1_epi16(1));
            dst_lo = _mm_srli_epi16(_mm_add_epi16(dst_lo, _mm_srli_epi16(dst_lo, 8)), 8);
            dst_hi = _mm_srli_epi16(_mm_add_epi16(dst_hi, _mm_srli_epi16(dst_hi, 8)), 8);
            dst128 = _mm_packus_epi16(dst_lo, dst_hi);
            dst128 = _mm_or_si128(dst128, alpha_fill_mask);
            _mm_storeu_si128(@ptrCast(@alignCast(dst)), dst128);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
        }
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
            _ = &dst32;
            while (true) {
                var src64: Uint64 = src32;
                _ = &src64;
                src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                var dst64: Uint64 = dst32;
                _ = &dst64;
                dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64 = (((src64 -% dst64) *% @as(Uint64, @bitCast(@as(c_long, @as(c_int, alpha))))) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                dst64 +%= 281479271743489;
                dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                dst64 &= 18374966859414961920;
                dst32 = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                if (!false) break;
            }
            dst.* = @truncate(dst32 | @as(c_uint, 4278190080));
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn BlitRGBtoRGBSurfaceAlpha128(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint32 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint32 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var s_1: Uint32 = undefined;
    _ = &s_1;
    var d_2: Uint32 = undefined;
    _ = &d_2;
    var s_3: Uint32 = undefined;
    _ = &s_3;
    var d_4: Uint32 = undefined;
    _ = &d_4;
    var s_5: Uint32 = undefined;
    _ = &s_5;
    var d_6: Uint32 = undefined;
    _ = &d_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 2));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 2));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                s = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d = dstp.*;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = ((((s & @as(Uint32, 16711422)) +% (d & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s & d) & @as(Uint32, 65793))) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                s_1 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_2 = dstp.*;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = ((((s_1 & @as(Uint32, 16711422)) +% (d_2 & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s_1 & d_2) & @as(Uint32, 65793))) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                s_3 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_4 = dstp.*;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = ((((s_3 & @as(Uint32, 16711422)) +% (d_4 & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s_3 & d_4) & @as(Uint32, 65793))) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                s_5 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_6 = dstp.*;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = ((((s_5 & @as(Uint32, 16711422)) +% (d_6 & @as(Uint32, 16711422))) >> @intCast(@as(Uint32, 1))) +% ((s_5 & d_6) & @as(Uint32, 65793))) | @as(c_uint, 4278190080);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitRGBtoRGBSurfaceAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha: c_uint = undefined;
    _ = &alpha;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint32 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint32 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var n: c_int = undefined;
    _ = &n;
    var src64: Uint64 = undefined;
    _ = &src64;
    var dst64: Uint64 = undefined;
    _ = &dst64;
    var src64_1: Uint64 = undefined;
    _ = &src64_1;
    var dst64_2: Uint64 = undefined;
    _ = &dst64_2;
    var src64_3: Uint64 = undefined;
    _ = &src64_3;
    var dst64_4: Uint64 = undefined;
    _ = &dst64_4;
    var src64_5: Uint64 = undefined;
    _ = &src64_5;
    var dst64_6: Uint64 = undefined;
    _ = &dst64_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                alpha = info.*.a;
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                BlitRGBtoRGBSurfaceAlpha128(info);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 2));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 2));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 4;
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
                s = srcp.*;
                d = dstp.*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                src64 = s;
                src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64 = d;
                dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64 = (((src64 -% dst64) *% @as(Uint64, alpha)) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                dst64 +%= 281479271743489;
                dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                dst64 &= 18374966859414961920;
                d = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if (false) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dstp.* = d | @as(c_uint, 4278190080);
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                s = srcp.*;
                d = dstp.*;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                src64_1 = s;
                src64_1 = (src64_1 | (src64_1 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_2 = d;
                dst64_2 = (dst64_2 | (dst64_2 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_2 = (((src64_1 -% dst64_2) *% @as(Uint64, alpha)) +% (dst64_2 << @intCast(@as(Uint64, 8)))) -% dst64_2;
                dst64_2 +%= 281479271743489;
                dst64_2 +%= (dst64_2 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                dst64_2 &= 18374966859414961920;
                d = @truncate((dst64_2 >> @intCast(@as(Uint64, 8))) | (dst64_2 >> @intCast(@as(Uint64, 32))));
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if (false) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                dstp.* = d | @as(c_uint, 4278190080);
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                s = srcp.*;
                d = dstp.*;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                src64_3 = s;
                src64_3 = (src64_3 | (src64_3 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_4 = d;
                dst64_4 = (dst64_4 | (dst64_4 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_4 = (((src64_3 -% dst64_4) *% @as(Uint64, alpha)) +% (dst64_4 << @intCast(@as(Uint64, 8)))) -% dst64_4;
                dst64_4 +%= 281479271743489;
                dst64_4 +%= (dst64_4 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                dst64_4 &= 18374966859414961920;
                d = @truncate((dst64_4 >> @intCast(@as(Uint64, 8))) | (dst64_4 >> @intCast(@as(Uint64, 32))));
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if (false) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                dstp.* = d | @as(c_uint, 4278190080);
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                s = srcp.*;
                d = dstp.*;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                src64_5 = s;
                src64_5 = (src64_5 | (src64_5 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_6 = d;
                dst64_6 = (dst64_6 | (dst64_6 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                dst64_6 = (((src64_5 -% dst64_6) *% @as(Uint64, alpha)) +% (dst64_6 << @intCast(@as(Uint64, 8)))) -% dst64_6;
                dst64_6 +%= 281479271743489;
                dst64_6 +%= (dst64_6 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                dst64_6 &= 18374966859414961920;
                d = @truncate((dst64_6 >> @intCast(@as(Uint64, 8))) | (dst64_6 >> @intCast(@as(Uint64, 32))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (false) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                dstp.* = d | @as(c_uint, 4278190080);
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit16to16SurfaceAlpha128(info: [*c]SDL_BlitInfo, mask: Uint16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var srcp: [*c]Uint16 = @ptrCast(@alignCast(info.*.src));
    _ = &srcp;
    var srcskip: c_int = info.*.src_skip >> @intCast(@as(c_int, 1));
    _ = &srcskip;
    var dstp: [*c]Uint16 = @ptrCast(@alignCast(info.*.dst));
    _ = &dstp;
    var dstskip: c_int = info.*.dst_skip >> @intCast(@as(c_int, 1));
    _ = &dstskip;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        if (((@as(usize, @intCast(@intFromPtr(srcp))) ^ @as(usize, @intCast(@intFromPtr(dstp)))) & @as(usize, 2)) != 0) {
            var prev_sw: Uint32 = undefined;
            _ = &prev_sw;
            var w: c_int = width;
            _ = &w;
            if ((@as(usize, @intCast(@intFromPtr(dstp))) & @as(usize, 2)) != 0) {
                var d: Uint16 = dstp.*;
                _ = &d;
                var s: Uint16 = srcp.*;
                _ = &s;
                dstp.* = @bitCast(@as(c_short, @truncate((((@as(c_int, s) & @as(c_int, mask)) + (@as(c_int, d) & @as(c_int, mask))) >> @intCast(@as(c_int, 1))) + ((@as(c_int, s) & @as(c_int, d)) & (~@as(c_int, mask) & @as(c_int, 65535))))));
                dstp += 1;
                srcp += 1;
                w -= 1;
            }
            srcp += 1;
            prev_sw = @as([*c]Uint32, @ptrCast(@alignCast(srcp)))[@bitCast(@as(isize, @intCast(-@as(c_int, 1))))];
            while (w > @as(c_int, 1)) {
                var sw: Uint32 = undefined;
                _ = &sw;
                var dw: Uint32 = undefined;
                _ = &dw;
                var s: Uint32 = undefined;
                _ = &s;
                sw = @as([*c]Uint32, @ptrCast(@alignCast(srcp))).*;
                dw = @as([*c]Uint32, @ptrCast(@alignCast(dstp))).*;
                s = (prev_sw >> @intCast(@as(Uint32, 16))) +% (sw << @intCast(@as(Uint32, 16)));
                prev_sw = sw;
                @as([*c]Uint32, @ptrCast(@alignCast(dstp))).* = (((s & @as(Uint32, @bitCast(@as(c_int, @as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))) >> @intCast(@as(Uint32, 1))) +% ((dw & @as(Uint32, @bitCast(@as(c_int, @as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))) >> @intCast(@as(Uint32, 1)))) +% ((s & dw) & @as(Uint32, @bitCast(@as(c_int, ~(@as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                w -= 2;
            }
            if (w != 0) {
                var d: Uint16 = dstp.*;
                _ = &d;
                var s: Uint16 = undefined;
                _ = &s;
                s = @truncate(prev_sw >> @intCast(@as(Uint32, 16)));
                dstp.* = @bitCast(@as(c_short, @truncate((((@as(c_int, s) & @as(c_int, mask)) + (@as(c_int, d) & @as(c_int, mask))) >> @intCast(@as(c_int, 1))) + ((@as(c_int, s) & @as(c_int, d)) & (~@as(c_int, mask) & @as(c_int, 65535))))));
                srcp += 1;
                dstp += 1;
            }
            srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip - @as(c_int, 1)))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        } else {
            var w: c_int = width;
            _ = &w;
            if ((@as(usize, @intCast(@intFromPtr(srcp))) & @as(usize, 2)) != 0) {
                var d: Uint16 = dstp.*;
                _ = &d;
                var s: Uint16 = srcp.*;
                _ = &s;
                dstp.* = @bitCast(@as(c_short, @truncate((((@as(c_int, s) & @as(c_int, mask)) + (@as(c_int, d) & @as(c_int, mask))) >> @intCast(@as(c_int, 1))) + ((@as(c_int, s) & @as(c_int, d)) & (~@as(c_int, mask) & @as(c_int, 65535))))));
                srcp += 1;
                dstp += 1;
                w -= 1;
            }
            while (w > @as(c_int, 1)) {
                var sw: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(srcp))).*;
                _ = &sw;
                var dw: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dstp))).*;
                _ = &dw;
                @as([*c]Uint32, @ptrCast(@alignCast(dstp))).* = (((sw & @as(Uint32, @bitCast(@as(c_int, @as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))) >> @intCast(@as(Uint32, 1))) +% ((dw & @as(Uint32, @bitCast(@as(c_int, @as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))) >> @intCast(@as(Uint32, 1)))) +% ((sw & dw) & @as(Uint32, @bitCast(@as(c_int, ~(@as(c_int, mask) | (@as(c_int, mask) << @intCast(@as(c_int, 16))))))));
                srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                w -= 2;
            }
            if (w != 0) {
                var d: Uint16 = dstp.*;
                _ = &d;
                var s: Uint16 = srcp.*;
                _ = &s;
                dstp.* = @bitCast(@as(c_short, @truncate((((@as(c_int, s) & @as(c_int, mask)) + (@as(c_int, d) & @as(c_int, mask))) >> @intCast(@as(c_int, 1))) + ((@as(c_int, s) & @as(c_int, d)) & (~@as(c_int, mask) & @as(c_int, 65535))))));
                srcp += 1;
                dstp += 1;
            }
            srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub fn Blit565to565SurfaceAlphaMMX(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha: c_uint = info.*.a;
    _ = &alpha;
    if (alpha == @as(c_uint, 128)) {
        Blit16to16SurfaceAlpha128(info, 63454);
    } else {
        var width: c_int = info.*.dst_w;
        _ = &width;
        var height: c_int = info.*.dst_h;
        _ = &height;
        var srcp: [*c]Uint16 = @ptrCast(@alignCast(info.*.src));
        _ = &srcp;
        var srcskip: c_int = info.*.src_skip >> @intCast(@as(c_int, 1));
        _ = &srcskip;
        var dstp: [*c]Uint16 = @ptrCast(@alignCast(info.*.dst));
        _ = &dstp;
        var dstskip: c_int = info.*.dst_skip >> @intCast(@as(c_int, 1));
        _ = &dstskip;
        var s: Uint32 = undefined;
        _ = &s;
        var d: Uint32 = undefined;
        _ = &d;
        var src1: __m64 = undefined;
        _ = &src1;
        var dst1: __m64 = undefined;
        _ = &dst1;
        var src2: __m64 = undefined;
        _ = &src2;
        var dst2: __m64 = undefined;
        _ = &dst2;
        var gmask: __m64 = undefined;
        _ = &gmask;
        var bmask: __m64 = undefined;
        _ = &bmask;
        var mm_res: __m64 = undefined;
        _ = &mm_res;
        var mm_alpha: __m64 = undefined;
        _ = &mm_alpha;
        alpha &= @bitCast(@as(c_int, ~((@as(c_int, 1) + @as(c_int, 2)) + @as(c_int, 4))));
        mm_alpha = _mm_set_pi32(0, @bitCast(@as(c_uint, @truncate(alpha))));
        alpha >>= @intCast(@as(c_uint, 3));
        mm_alpha = _mm_unpacklo_pi16(mm_alpha, mm_alpha);
        mm_alpha = _mm_unpacklo_pi32(mm_alpha, mm_alpha);
        mm_alpha = _mm_slli_si64(mm_alpha, 3);
        gmask = _mm_set_pi32(132122592, 132122592);
        bmask = _mm_set_pi32(2031647, 2031647);
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            {
                var n: c_int = width;
                _ = &n;
                if ((n & @as(c_int, 1)) != 0) {
                    {
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 132184095;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                    }
                    n -= 1;
                }
                if ((n & @as(c_int, 2)) != 0) {
                    {
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 132184095;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 132184095;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                    }
                    n -= 2;
                }
                if ((n & @as(c_int, 4)) != 0) {
                    {
                        src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                        dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                        src2 = src1;
                        src2 = _mm_srli_pi16(src2, 11);
                        dst2 = dst1;
                        dst2 = _mm_srli_pi16(dst2, 11);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mullo_pi16(src2, mm_alpha);
                        src2 = _mm_srli_pi16(src2, 11);
                        dst2 = _mm_add_pi16(src2, dst2);
                        dst2 = _mm_slli_pi16(dst2, 11);
                        mm_res = dst2;
                        src2 = src1;
                        src2 = _mm_and_si64(src2, gmask);
                        dst2 = dst1;
                        dst2 = _mm_and_si64(dst2, gmask);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mulhi_pi16(src2, mm_alpha);
                        src2 = _mm_slli_pi16(src2, 5);
                        dst2 = _mm_add_pi16(src2, dst2);
                        mm_res = _mm_or_si64(mm_res, dst2);
                        src2 = src1;
                        src2 = _mm_and_si64(src2, bmask);
                        dst2 = dst1;
                        dst2 = _mm_and_si64(dst2, bmask);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mullo_pi16(src2, mm_alpha);
                        src2 = _mm_srli_pi16(src2, 11);
                        dst2 = _mm_add_pi16(src2, dst2);
                        dst2 = _mm_and_si64(dst2, bmask);
                        mm_res = _mm_or_si64(mm_res, dst2);
                        @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                        srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    }
                    n -= 4;
                }
                if (n != 0) {
                    {
                        const ref = &n;
                        ref.* = @divTrunc(ref.*, @as(c_int, 8));
                    }
                    while (true) {
                        {
                            src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                            dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                            src2 = src1;
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = dst1;
                            dst2 = _mm_srli_pi16(dst2, 11);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_slli_pi16(dst2, 11);
                            mm_res = dst2;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, gmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, gmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            src2 = src1;
                            src2 = _mm_and_si64(src2, bmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, bmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, bmask);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                            srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                            dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        }
                        {
                            src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                            dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                            src2 = src1;
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = dst1;
                            dst2 = _mm_srli_pi16(dst2, 11);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_slli_pi16(dst2, 11);
                            mm_res = dst2;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, gmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, gmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            src2 = src1;
                            src2 = _mm_and_si64(src2, bmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, bmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, bmask);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                            srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                            dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        }
                        if (!((blk: {
                            const ref = &n;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) > @as(c_int, 0))) break;
                    }
                }
            }
            srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
        _mm_empty();
    }
}
pub fn Blit555to555SurfaceAlphaMMX(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha: c_uint = info.*.a;
    _ = &alpha;
    if (alpha == @as(c_uint, 128)) {
        Blit16to16SurfaceAlpha128(info, 64478);
    } else {
        var width: c_int = info.*.dst_w;
        _ = &width;
        var height: c_int = info.*.dst_h;
        _ = &height;
        var srcp: [*c]Uint16 = @ptrCast(@alignCast(info.*.src));
        _ = &srcp;
        var srcskip: c_int = info.*.src_skip >> @intCast(@as(c_int, 1));
        _ = &srcskip;
        var dstp: [*c]Uint16 = @ptrCast(@alignCast(info.*.dst));
        _ = &dstp;
        var dstskip: c_int = info.*.dst_skip >> @intCast(@as(c_int, 1));
        _ = &dstskip;
        var s: Uint32 = undefined;
        _ = &s;
        var d: Uint32 = undefined;
        _ = &d;
        var src1: __m64 = undefined;
        _ = &src1;
        var dst1: __m64 = undefined;
        _ = &dst1;
        var src2: __m64 = undefined;
        _ = &src2;
        var dst2: __m64 = undefined;
        _ = &dst2;
        var rmask: __m64 = undefined;
        _ = &rmask;
        var gmask: __m64 = undefined;
        _ = &gmask;
        var bmask: __m64 = undefined;
        _ = &bmask;
        var mm_res: __m64 = undefined;
        _ = &mm_res;
        var mm_alpha: __m64 = undefined;
        _ = &mm_alpha;
        alpha &= @bitCast(@as(c_int, ~((@as(c_int, 1) + @as(c_int, 2)) + @as(c_int, 4))));
        mm_alpha = _mm_set_pi32(0, @bitCast(@as(c_uint, @truncate(alpha))));
        alpha >>= @intCast(@as(c_uint, 3));
        mm_alpha = _mm_unpacklo_pi16(mm_alpha, mm_alpha);
        mm_alpha = _mm_unpacklo_pi32(mm_alpha, mm_alpha);
        mm_alpha = _mm_slli_si64(mm_alpha, 3);
        rmask = _mm_set_pi32(2080406528, 2080406528);
        gmask = _mm_set_pi32(65012704, 65012704);
        bmask = _mm_set_pi32(2031647, 2031647);
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            {
                var n: c_int = width;
                _ = &n;
                if ((n & @as(c_int, 1)) != 0) {
                    {
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 65043487;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                    }
                    n -= 1;
                }
                if ((n & @as(c_int, 2)) != 0) {
                    {
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 65043487;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                        s = (blk: {
                            const ref = &srcp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        d = dstp.*;
                        s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                        d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                        d &= 65043487;
                        (blk: {
                            const ref = &dstp;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                    }
                    n -= 2;
                }
                if ((n & @as(c_int, 4)) != 0) {
                    {
                        src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                        dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                        src2 = src1;
                        src2 = _mm_and_si64(src2, rmask);
                        dst2 = dst1;
                        dst2 = _mm_and_si64(dst2, rmask);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mulhi_pi16(src2, mm_alpha);
                        src2 = _mm_slli_pi16(src2, 5);
                        dst2 = _mm_add_pi16(src2, dst2);
                        dst2 = _mm_and_si64(dst2, rmask);
                        mm_res = dst2;
                        src2 = src1;
                        src2 = _mm_and_si64(src2, gmask);
                        dst2 = dst1;
                        dst2 = _mm_and_si64(dst2, gmask);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mulhi_pi16(src2, mm_alpha);
                        src2 = _mm_slli_pi16(src2, 5);
                        dst2 = _mm_add_pi16(src2, dst2);
                        mm_res = _mm_or_si64(mm_res, dst2);
                        src2 = src1;
                        src2 = _mm_and_si64(src2, bmask);
                        dst2 = dst1;
                        dst2 = _mm_and_si64(dst2, bmask);
                        src2 = _mm_sub_pi16(src2, dst2);
                        src2 = _mm_mullo_pi16(src2, mm_alpha);
                        src2 = _mm_srli_pi16(src2, 11);
                        dst2 = _mm_add_pi16(src2, dst2);
                        dst2 = _mm_and_si64(dst2, bmask);
                        mm_res = _mm_or_si64(mm_res, dst2);
                        @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                        srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                    }
                    n -= 4;
                }
                if (n != 0) {
                    {
                        const ref = &n;
                        ref.* = @divTrunc(ref.*, @as(c_int, 8));
                    }
                    while (true) {
                        {
                            src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                            dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, rmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, rmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, rmask);
                            mm_res = dst2;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, gmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, gmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            src2 = src1;
                            src2 = _mm_and_si64(src2, bmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, bmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, bmask);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                            srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                            dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        }
                        {
                            src1 = @as([*c]__m64, @ptrCast(@alignCast(srcp))).*;
                            dst1 = @as([*c]__m64, @ptrCast(@alignCast(dstp))).*;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, rmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, rmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, rmask);
                            mm_res = dst2;
                            src2 = src1;
                            src2 = _mm_and_si64(src2, gmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, gmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mulhi_pi16(src2, mm_alpha);
                            src2 = _mm_slli_pi16(src2, 5);
                            dst2 = _mm_add_pi16(src2, dst2);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            src2 = src1;
                            src2 = _mm_and_si64(src2, bmask);
                            dst2 = dst1;
                            dst2 = _mm_and_si64(dst2, bmask);
                            src2 = _mm_sub_pi16(src2, dst2);
                            src2 = _mm_mullo_pi16(src2, mm_alpha);
                            src2 = _mm_srli_pi16(src2, 11);
                            dst2 = _mm_add_pi16(src2, dst2);
                            dst2 = _mm_and_si64(dst2, bmask);
                            mm_res = _mm_or_si64(mm_res, dst2);
                            @as([*c]__m64, @ptrCast(@alignCast(dstp))).* = mm_res;
                            srcp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                            dstp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                        }
                        if (!((blk: {
                            const ref = &n;
                            ref.* -= 1;
                            break :blk ref.*;
                        }) > @as(c_int, 0))) break;
                    }
                }
            }
            srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
        _mm_empty();
    }
}
pub fn Blit565to565SurfaceAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha: c_uint = undefined;
    _ = &alpha;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint16 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint16 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var s_1: Uint32 = undefined;
    _ = &s_1;
    var d_2: Uint32 = undefined;
    _ = &d_2;
    var s_3: Uint32 = undefined;
    _ = &s_3;
    var d_4: Uint32 = undefined;
    _ = &d_4;
    var s_5: Uint32 = undefined;
    _ = &s_5;
    var d_6: Uint32 = undefined;
    _ = &d_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                alpha = info.*.a;
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                Blit16to16SurfaceAlpha128(info, 63454);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 1));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 1));
                alpha >>= @intCast(@as(c_uint, 3));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 4;
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
                s = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d = dstp.*;
                s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 132184095;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                s_1 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_2 = dstp.*;
                s_1 = (s_1 | (s_1 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_2 = (d_2 | (d_2 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_2 +%= ((s_1 -% d_2) *% alpha) >> @intCast(@as(Uint32, 5));
                d_2 &= 132184095;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_2 | (d_2 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                s_3 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_4 = dstp.*;
                s_3 = (s_3 | (s_3 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_4 = (d_4 | (d_4 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_4 +%= ((s_3 -% d_4) *% alpha) >> @intCast(@as(Uint32, 5));
                d_4 &= 132184095;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_4 | (d_4 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                s_5 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_6 = dstp.*;
                s_5 = (s_5 | (s_5 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_6 = (d_6 | (d_6 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_6 +%= ((s_5 -% d_6) *% alpha) >> @intCast(@as(Uint32, 5));
                d_6 &= 132184095;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_6 | (d_6 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit555to555SurfaceAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha: c_uint = undefined;
    _ = &alpha;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint16 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint16 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var s_1: Uint32 = undefined;
    _ = &s_1;
    var d_2: Uint32 = undefined;
    _ = &d_2;
    var s_3: Uint32 = undefined;
    _ = &s_3;
    var d_4: Uint32 = undefined;
    _ = &d_4;
    var s_5: Uint32 = undefined;
    _ = &s_5;
    var d_6: Uint32 = undefined;
    _ = &d_6;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                alpha = info.*.a;
                if (alpha == @as(c_uint, 128)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                Blit16to16SurfaceAlpha128(info, 64478);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 1));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 1));
                alpha >>= @intCast(@as(c_uint, 3));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 4;
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
                s = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d = dstp.*;
                s = (s | (s << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 65043487;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                s_1 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_2 = dstp.*;
                s_1 = (s_1 | (s_1 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_2 = (d_2 | (d_2 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_2 +%= ((s_1 -% d_2) *% alpha) >> @intCast(@as(Uint32, 5));
                d_2 &= 65043487;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_2 | (d_2 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                s_3 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_4 = dstp.*;
                s_3 = (s_3 | (s_3 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_4 = (d_4 | (d_4 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_4 +%= ((s_3 -% d_4) *% alpha) >> @intCast(@as(Uint32, 5));
                d_4 &= 65043487;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_4 | (d_4 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                s_5 = (blk: {
                    const ref = &srcp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                d_6 = dstp.*;
                s_5 = (s_5 | (s_5 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_6 = (d_6 | (d_6 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_6 +%= ((s_5 -% d_6) *% alpha) >> @intCast(@as(Uint32, 5));
                d_6 &= 65043487;
                (blk: {
                    const ref = &dstp;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(d_6 | (d_6 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitARGBto565PixelAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint32 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint16 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var s: Uint32 = undefined;
    _ = &s;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var d: Uint32 = undefined;
    _ = &d;
    var s_1: Uint32 = undefined;
    _ = &s_1;
    var alpha_2: c_uint = undefined;
    _ = &alpha_2;
    var d_3: Uint32 = undefined;
    _ = &d_3;
    var s_4: Uint32 = undefined;
    _ = &s_4;
    var alpha_5: c_uint = undefined;
    _ = &alpha_5;
    var d_6: Uint32 = undefined;
    _ = &d_6;
    var s_7: Uint32 = undefined;
    _ = &s_7;
    var alpha_8: c_uint = undefined;
    _ = &alpha_8;
    var d_9: Uint32 = undefined;
    _ = &d_9;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 2));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                s = srcp.*;
                alpha = s >> @intCast(@as(Uint32, 27));
                if (alpha != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                if (alpha == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                dstp.* = @truncate((((s >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488)) +% ((s >> @intCast(@as(Uint32, 5))) & @as(Uint32, 2016))) +% ((s >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                d = dstp.*;
                s = (((s & @as(Uint32, 64512)) << @intCast(@as(Uint32, 11))) +% ((s >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488))) +% ((s >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 132184095;
                dstp.* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                s_1 = srcp.*;
                alpha_2 = s_1 >> @intCast(@as(Uint32, 27));
                if (alpha_2 != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (alpha_2 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                dstp.* = @truncate((((s_1 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488)) +% ((s_1 >> @intCast(@as(Uint32, 5))) & @as(Uint32, 2016))) +% ((s_1 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                d_3 = dstp.*;
                s_1 = (((s_1 & @as(Uint32, 64512)) << @intCast(@as(Uint32, 11))) +% ((s_1 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488))) +% ((s_1 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_3 = (d_3 | (d_3 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_3 +%= ((s_1 -% d_3) *% alpha_2) >> @intCast(@as(Uint32, 5));
                d_3 &= 132184095;
                dstp.* = @truncate(d_3 | (d_3 >> @intCast(@as(Uint32, 16))));
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
            22 => {
                s_4 = srcp.*;
                alpha_5 = s_4 >> @intCast(@as(Uint32, 27));
                if (alpha_5 != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (alpha_5 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                dstp.* = @truncate((((s_4 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488)) +% ((s_4 >> @intCast(@as(Uint32, 5))) & @as(Uint32, 2016))) +% ((s_4 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                d_6 = dstp.*;
                s_4 = (((s_4 & @as(Uint32, 64512)) << @intCast(@as(Uint32, 11))) +% ((s_4 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488))) +% ((s_4 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_6 = (d_6 | (d_6 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_6 +%= ((s_4 -% d_6) *% alpha_5) >> @intCast(@as(Uint32, 5));
                d_6 &= 132184095;
                dstp.* = @truncate(d_6 | (d_6 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                s_7 = srcp.*;
                alpha_8 = s_7 >> @intCast(@as(Uint32, 27));
                if (alpha_8 != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                if (alpha_8 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
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
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            33 => {
                dstp.* = @truncate((((s_7 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488)) +% ((s_7 >> @intCast(@as(Uint32, 5))) & @as(Uint32, 2016))) +% ((s_7 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                d_9 = dstp.*;
                s_7 = (((s_7 & @as(Uint32, 64512)) << @intCast(@as(Uint32, 11))) +% ((s_7 >> @intCast(@as(Uint32, 8))) & @as(Uint32, 63488))) +% ((s_7 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_9 = (d_9 | (d_9 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 132184095);
                d_9 +%= ((s_7 -% d_9) *% alpha_8) >> @intCast(@as(Uint32, 5));
                d_9 &= 132184095;
                dstp.* = @truncate(d_9 | (d_9 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitARGBto555PixelAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var srcp: [*c]Uint32 = undefined;
    _ = &srcp;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint16 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var s: Uint32 = undefined;
    _ = &s;
    var d: Uint32 = undefined;
    _ = &d;
    var alpha_1: c_uint = undefined;
    _ = &alpha_1;
    var s_2: Uint32 = undefined;
    _ = &s_2;
    var d_3: Uint32 = undefined;
    _ = &d_3;
    var alpha_4: c_uint = undefined;
    _ = &alpha_4;
    var s_5: Uint32 = undefined;
    _ = &s_5;
    var d_6: Uint32 = undefined;
    _ = &d_6;
    var alpha_7: c_uint = undefined;
    _ = &alpha_7;
    var s_8: Uint32 = undefined;
    _ = &s_8;
    var d_9: Uint32 = undefined;
    _ = &d_9;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip >> @intCast(@as(c_int, 2));
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip >> @intCast(@as(c_int, 1));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                srcp += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                s = srcp.*;
                alpha = s >> @intCast(@as(Uint32, 27));
                if (alpha != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                if (alpha == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                dstp.* = @truncate((((s >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744)) +% ((s >> @intCast(@as(Uint32, 6))) & @as(Uint32, 992))) +% ((s >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                d = dstp.*;
                s = (((s & @as(Uint32, 63488)) << @intCast(@as(Uint32, 10))) +% ((s >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744))) +% ((s >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d = (d | (d << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d +%= ((s -% d) *% alpha) >> @intCast(@as(Uint32, 5));
                d &= 65043487;
                dstp.* = @truncate(d | (d >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                s_2 = srcp.*;
                alpha_1 = s_2 >> @intCast(@as(Uint32, 27));
                if (alpha_1 != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (alpha_1 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
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
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            19 => {
                dstp.* = @truncate((((s_2 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744)) +% ((s_2 >> @intCast(@as(Uint32, 6))) & @as(Uint32, 992))) +% ((s_2 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                d_3 = dstp.*;
                s_2 = (((s_2 & @as(Uint32, 63488)) << @intCast(@as(Uint32, 10))) +% ((s_2 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744))) +% ((s_2 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_3 = (d_3 | (d_3 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_3 +%= ((s_2 -% d_3) *% alpha_1) >> @intCast(@as(Uint32, 5));
                d_3 &= 65043487;
                dstp.* = @truncate(d_3 | (d_3 >> @intCast(@as(Uint32, 16))));
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
            22 => {
                s_5 = srcp.*;
                alpha_4 = s_5 >> @intCast(@as(Uint32, 27));
                if (alpha_4 != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (alpha_4 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                dstp.* = @truncate((((s_5 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744)) +% ((s_5 >> @intCast(@as(Uint32, 6))) & @as(Uint32, 992))) +% ((s_5 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                d_6 = dstp.*;
                s_5 = (((s_5 & @as(Uint32, 63488)) << @intCast(@as(Uint32, 10))) +% ((s_5 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744))) +% ((s_5 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_6 = (d_6 | (d_6 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_6 +%= ((s_5 -% d_6) *% alpha_4) >> @intCast(@as(Uint32, 5));
                d_6 &= 65043487;
                dstp.* = @truncate(d_6 | (d_6 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                s_8 = srcp.*;
                alpha_7 = s_8 >> @intCast(@as(Uint32, 27));
                if (alpha_7 != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                if (alpha_7 == @as(c_uint, @bitCast(@as(c_int, SDL_ALPHA_OPAQUE >> @intCast(@as(c_int, 3)))))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
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
                srcp += 1;
                dstp += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            33 => {
                dstp.* = @truncate((((s_8 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744)) +% ((s_8 >> @intCast(@as(Uint32, 6))) & @as(Uint32, 992))) +% ((s_8 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31)));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                d_9 = dstp.*;
                s_8 = (((s_8 & @as(Uint32, 63488)) << @intCast(@as(Uint32, 10))) +% ((s_8 >> @intCast(@as(Uint32, 9))) & @as(Uint32, 31744))) +% ((s_8 >> @intCast(@as(Uint32, 3))) & @as(Uint32, 31));
                d_9 = (d_9 | (d_9 << @intCast(@as(Uint32, 16)))) & @as(Uint32, 65043487);
                d_9 +%= ((s_8 -% d_9) *% alpha_7) >> @intCast(@as(Uint32, 5));
                d_9 &= 65043487;
                dstp.* = @truncate(d_9 | (d_9 >> @intCast(@as(Uint32, 16))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNtoNSurfaceAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var dA: c_uint = undefined;
    _ = &dA;
    var sA: c_uint = undefined;
    _ = &sA;
    var n: c_int = undefined;
    _ = &n;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var x_6: Uint16 = undefined;
    _ = &x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var _pixel_10: Uint8 = undefined;
    _ = &_pixel_10;
    var _pixel_11: Uint16 = undefined;
    _ = &_pixel_11;
    var _pixel_12: Uint32 = undefined;
    _ = &_pixel_12;
    var x_13: Uint16 = undefined;
    _ = &x_13;
    var x_14: Uint16 = undefined;
    _ = &x_14;
    var x_15: Uint16 = undefined;
    _ = &x_15;
    var x_16: Uint16 = undefined;
    _ = &x_16;
    var _pixel_17: Uint8 = undefined;
    _ = &_pixel_17;
    var _pixel_18: Uint16 = undefined;
    _ = &_pixel_18;
    var _pixel_19: Uint32 = undefined;
    _ = &_pixel_19;
    var x_20: Uint16 = undefined;
    _ = &x_20;
    var x_21: Uint16 = undefined;
    _ = &x_21;
    var x_22: Uint16 = undefined;
    _ = &x_22;
    var x_23: Uint16 = undefined;
    _ = &x_23;
    var _pixel_24: Uint8 = undefined;
    _ = &_pixel_24;
    var _pixel_25: Uint16 = undefined;
    _ = &_pixel_25;
    var _pixel_26: Uint32 = undefined;
    _ = &_pixel_26;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                sA = info.*.a;
                if (sA != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 128;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            10 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            13 => {
                if (false) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            21 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                if (false) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 49;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            33 => {
                x = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if (false) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                x_1 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (false) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                x_2 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (false) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                x_3 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            45 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            46 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 45;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 58;
                        continue;
                    },
                    else => {
                        sdl_pc = 59;
                        continue;
                    },
                }
            },
            52 => {
                if (false) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            56 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            60 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 67;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
                        continue;
                    },
                }
            },
            61 => {
                if (false) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            64 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            65 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            67 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            68 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            70 => {
                if (false) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 84;
                        continue;
                    },
                }
            },
            72 => {
                x_6 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_6;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_6;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_6) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_6) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if (false) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 74;
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
                x_7 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                if (false) {
                    sdl_pc = 75;
                    continue;
                } else {
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
                x_8 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (false) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
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
                x_9 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (false) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            84 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            85 => {
                _pixel_10 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_10;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            86 => {
                _pixel_11 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_11;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            87 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            88 => {
                _pixel_12 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_12;
                {
                    sdl_pc = 84;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 97;
                        continue;
                    },
                    else => {
                        sdl_pc = 98;
                        continue;
                    },
                }
            },
            91 => {
                if (false) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            94 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            95 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            96 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            97 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            98 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            99 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 105;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 106;
                        continue;
                    },
                    else => {
                        sdl_pc = 107;
                        continue;
                    },
                }
            },
            100 => {
                if (false) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            103 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            104 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            105 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            107 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            109 => {
                if (false) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 124;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 125;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 126;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 127;
                        continue;
                    },
                    else => {
                        sdl_pc = 123;
                        continue;
                    },
                }
            },
            111 => {
                x_13 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_13;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_13;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_13) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_13) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                if (false) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                x_14 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_14;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_14;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_14) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_14) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                if (false) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
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
                x_15 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_15;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_15;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_15) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_15) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if (false) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 119;
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
                x_16 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_16;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_16;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_16) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_16) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                if (false) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            123 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            124 => {
                _pixel_17 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_17;
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            125 => {
                _pixel_18 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_18;
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            126 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            127 => {
                _pixel_19 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_19;
                {
                    sdl_pc = 123;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 133;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 134;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 135;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 136;
                        continue;
                    },
                    else => {
                        sdl_pc = 137;
                        continue;
                    },
                }
            },
            130 => {
                if (false) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            133 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            134 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            135 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            136 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            137 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            138 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 143;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 145;
                        continue;
                    },
                    else => {
                        sdl_pc = 146;
                        continue;
                    },
                }
            },
            139 => {
                if (false) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            142 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            143 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            144 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            145 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            146 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            148 => {
                if (false) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 163;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 164;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 165;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 166;
                        continue;
                    },
                    else => {
                        sdl_pc = 162;
                        continue;
                    },
                }
            },
            150 => {
                x_20 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_20;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_20;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_20) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_20) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                if (false) {
                    sdl_pc = 150;
                    continue;
                } else {
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
                x_21 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_21;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_21;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_21) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_21) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                if (false) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            155 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            156 => {
                x_22 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_22;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_22;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_22) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_22) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                if (false) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                x_23 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_23;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_23;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_23) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_23) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                if (false) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            162 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            163 => {
                _pixel_24 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_24;
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            164 => {
                _pixel_25 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_25;
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            165 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            166 => {
                _pixel_26 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_26;
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNtoNSurfaceAlphaKey(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var dA: c_uint = undefined;
    _ = &dA;
    var sA: c_uint = undefined;
    _ = &sA;
    var n: c_int = undefined;
    _ = &n;
    var B: [*c]Uint8 = undefined;
    _ = &B;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var B_6: [*c]Uint8 = undefined;
    _ = &B_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var _pixel_11: Uint8 = undefined;
    _ = &_pixel_11;
    var _pixel_12: Uint16 = undefined;
    _ = &_pixel_12;
    var _pixel_13: Uint32 = undefined;
    _ = &_pixel_13;
    var B_14: [*c]Uint8 = undefined;
    _ = &B_14;
    var x_15: Uint16 = undefined;
    _ = &x_15;
    var x_16: Uint16 = undefined;
    _ = &x_16;
    var x_17: Uint16 = undefined;
    _ = &x_17;
    var x_18: Uint16 = undefined;
    _ = &x_18;
    var _pixel_19: Uint8 = undefined;
    _ = &_pixel_19;
    var _pixel_20: Uint16 = undefined;
    _ = &_pixel_20;
    var _pixel_21: Uint32 = undefined;
    _ = &_pixel_21;
    var B_22: [*c]Uint8 = undefined;
    _ = &B_22;
    var x_23: Uint16 = undefined;
    _ = &x_23;
    var x_24: Uint16 = undefined;
    _ = &x_24;
    var x_25: Uint16 = undefined;
    _ = &x_25;
    var x_26: Uint16 = undefined;
    _ = &x_26;
    var _pixel_27: Uint8 = undefined;
    _ = &_pixel_27;
    var _pixel_28: Uint16 = undefined;
    _ = &_pixel_28;
    var _pixel_29: Uint32 = undefined;
    _ = &_pixel_29;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                ckey = info.*.colorkey;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                sA = info.*.a;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 134;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if ((sA != 0) and (@as(c_uint, @bitCast(@as(c_int, @intFromBool(Pixel != ckey)))) != 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                Pixel = src.*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                B = src;
                Pixel = @bitCast(@as(c_int, ((@as(c_int, B[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B[@as(c_int, 0)])));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                Pixel = 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            21 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                if (false) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 49;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            33 => {
                x = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if (false) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                x_1 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (false) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                x_2 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (false) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                x_3 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            46 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 45;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 58;
                        continue;
                    },
                    else => {
                        sdl_pc = 59;
                        continue;
                    },
                }
            },
            52 => {
                if (false) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if ((sA != 0) and (@as(c_uint, @bitCast(@as(c_int, @intFromBool(Pixel != ckey)))) != 0)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                Pixel = src.*;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            56 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                B_6 = src;
                Pixel = @bitCast(@as(c_int, ((@as(c_int, B_6[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_6[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_6[@as(c_int, 0)])));
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                Pixel = 0;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            60 => {
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            63 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 71;
                        continue;
                    },
                }
            },
            64 => {
                if (false) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            67 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            68 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            69 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            70 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            71 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (false) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 91;
                        continue;
                    },
                    else => {
                        sdl_pc = 87;
                        continue;
                    },
                }
            },
            75 => {
                x_7 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                if (false) {
                    sdl_pc = 75;
                    continue;
                } else {
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
                x_8 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (false) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
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
                x_9 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (false) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
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
                x_10 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (false) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            88 => {
                _pixel_11 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_11;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            89 => {
                _pixel_12 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_12;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                _pixel_13 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_13;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 100;
                        continue;
                    },
                    else => {
                        sdl_pc = 101;
                        continue;
                    },
                }
            },
            94 => {
                if (false) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if ((sA != 0) and (@as(c_uint, @bitCast(@as(c_int, @intFromBool(Pixel != ckey)))) != 0)) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                Pixel = src.*;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            98 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            99 => {
                B_14 = src;
                Pixel = @bitCast(@as(c_int, ((@as(c_int, B_14[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_14[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_14[@as(c_int, 0)])));
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            100 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            101 => {
                Pixel = 0;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            102 => {
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            105 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 110;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 112;
                        continue;
                    },
                    else => {
                        sdl_pc = 113;
                        continue;
                    },
                }
            },
            106 => {
                if (false) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            110 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            111 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            112 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if (false) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 130;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 132;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 133;
                        continue;
                    },
                    else => {
                        sdl_pc = 129;
                        continue;
                    },
                }
            },
            117 => {
                x_15 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_15;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_15;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_15) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_15) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if (false) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 119;
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
                x_16 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_16;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_16;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_16) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_16) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                if (false) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                x_17 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_17;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_17;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_17) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_17) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                if (false) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                x_18 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_18;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_18;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_18) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_18) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                if (false) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            130 => {
                _pixel_19 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_19;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            131 => {
                _pixel_20 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_20;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            132 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            133 => {
                _pixel_21 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_21;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 140;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 141;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 142;
                        continue;
                    },
                    else => {
                        sdl_pc = 143;
                        continue;
                    },
                }
            },
            136 => {
                if (false) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                if ((sA != 0) and (@as(c_uint, @bitCast(@as(c_int, @intFromBool(Pixel != ckey)))) != 0)) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            139 => {
                Pixel = src.*;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            140 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            141 => {
                B_22 = src;
                Pixel = @bitCast(@as(c_int, ((@as(c_int, B_22[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_22[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_22[@as(c_int, 0)])));
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            142 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                Pixel = 0;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            144 => {
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            147 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 153;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 154;
                        continue;
                    },
                    else => {
                        sdl_pc = 155;
                        continue;
                    },
                }
            },
            148 => {
                if (false) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            151 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            152 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            153 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            154 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            155 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 150;
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
                if (false) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 172;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 173;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 174;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 175;
                        continue;
                    },
                    else => {
                        sdl_pc = 171;
                        continue;
                    },
                }
            },
            159 => {
                x_23 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_23;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_23;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_23) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_23) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                if (false) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                x_24 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_24;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_24;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_24) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_24) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                if (false) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                x_25 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_25;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_25;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_25) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_25) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            166 => {
                if (false) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                x_26 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_26;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_26;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_26) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_26) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                if (false) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            172 => {
                _pixel_27 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_27;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            173 => {
                _pixel_28 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_28;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            174 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            175 => {
                _pixel_29 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_29;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit8888to8888PixelAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = info.*.src_fmt;
    _ = &srcfmt;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var i: c_int = 0;
        _ = &i;
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
            _ = &dst32;
            while (true) {
                var srcA: Uint32 = (src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255);
                _ = &srcA;
                var tmp: Uint32 = src32 | srcfmt.*.Amask;
                _ = &tmp;
                while (true) {
                    var src64: Uint64 = tmp;
                    _ = &src64;
                    src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    var dst64: Uint64 = dst32;
                    _ = &dst64;
                    dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    dst64 = (((src64 -% dst64) *% @as(Uint64, srcA)) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                    dst64 +%= 281479271743489;
                    dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                    dst64 &= 18374966859414961920;
                    dst32 = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                    if (!false) break;
                }
                if (!false) break;
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn Blit8888to8888PixelAlphaSwizzle(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = info.*.src_fmt;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = info.*.dst_fmt;
    _ = &dstfmt;
    var fill_alpha: bool = !(dstfmt.*.Amask != 0);
    _ = &fill_alpha;
    var dstAmask: Uint32 = undefined;
    _ = &dstAmask;
    var dstAshift: Uint32 = undefined;
    _ = &dstAshift;
    SDL_Get8888AlphaMaskAndShift(dstfmt, &dstAmask, &dstAshift);
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var i: c_int = 0;
        _ = &i;
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
            _ = &dst32;
            while (true) {
                var srcA: Uint32 = (src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255);
                _ = &srcA;
                var tmp: Uint32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | dstfmt.*.Amask;
                _ = &tmp;
                while (true) {
                    var src64: Uint64 = tmp;
                    _ = &src64;
                    src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    var dst64: Uint64 = dst32;
                    _ = &dst64;
                    dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    dst64 = (((src64 -% dst64) *% @as(Uint64, srcA)) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                    dst64 +%= 281479271743489;
                    dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                    dst64 &= 18374966859414961920;
                    dst32 = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                    if (!false) break;
                }
                if (!false) break;
            }
            if (fill_alpha) {
                dst32 |= dstAmask;
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn Blit8888to8888PixelAlphaSwizzleSSE41(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = info.*.src_fmt;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = info.*.dst_fmt;
    _ = &dstfmt;
    var fill_alpha: bool = !(dstfmt.*.Amask != 0);
    _ = &fill_alpha;
    var dstAmask: Uint32 = undefined;
    _ = &dstAmask;
    var dstAshift: Uint32 = undefined;
    _ = &dstAshift;
    SDL_Get8888AlphaMaskAndShift(dstfmt, &dstAmask, &dstAshift);
    const mask_offsets: __m128i = _mm_set_epi8(12, 12, 12, 12, 8, 8, 8, 8, 4, 4, 4, 4, 0, 0, 0, 0);
    _ = &mask_offsets;
    const convert_mask: __m128i = _mm_add_epi32(_mm_set1_epi32((((@as(c_int, srcfmt.*.Rshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((@as(c_int, srcfmt.*.Gshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((@as(c_int, srcfmt.*.Bshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Bshift)))), mask_offsets);
    _ = &convert_mask;
    const alpha_splat_mask: __m128i = _mm_add_epi8(_mm_set1_epi8(@bitCast(@as(i8, @truncate(@as(c_int, srcfmt.*.Ashift) >> @intCast(@as(c_int, 3)))))), mask_offsets);
    _ = &alpha_splat_mask;
    const alpha_fill_mask: __m128i = _mm_set1_epi32(@bitCast(@as(c_uint, @truncate(dstAmask))));
    _ = &alpha_fill_mask;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var i: c_int = 0;
        _ = &i;
        while ((i + @as(c_int, 4)) <= width) : (i += 4) {
            var src128: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(src)));
            _ = &src128;
            var dst128: __m128i = _mm_loadu_si128(@ptrCast(@alignCast(dst)));
            _ = &dst128;
            var srcA: __m128i = _mm_shuffle_epi8(src128, alpha_splat_mask);
            _ = &srcA;
            src128 = _mm_shuffle_epi8(src128, convert_mask);
            src128 = _mm_or_si128(src128, alpha_fill_mask);
            var srca_lo: __m128i = _mm_unpacklo_epi8(srcA, srcA);
            _ = &srca_lo;
            var srca_hi: __m128i = _mm_unpackhi_epi8(srcA, srcA);
            _ = &srca_hi;
            srca_lo = _mm_xor_si128(srca_lo, _mm_set1_epi16(@truncate(@as(c_int, 65280))));
            srca_hi = _mm_xor_si128(srca_hi, _mm_set1_epi16(@truncate(@as(c_int, 65280))));
            src128 = _mm_sub_epi8(src128, _mm_set1_epi8(@truncate(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 128))))))));
            dst128 = _mm_sub_epi8(dst128, _mm_set1_epi8(@truncate(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 128))))))));
            var dst_lo: __m128i = _mm_maddubs_epi16(srca_lo, _mm_unpacklo_epi8(src128, dst128));
            _ = &dst_lo;
            var dst_hi: __m128i = _mm_maddubs_epi16(srca_hi, _mm_unpackhi_epi8(src128, dst128));
            _ = &dst_hi;
            dst_lo = _mm_add_epi16(dst_lo, _mm_set1_epi16(@truncate(@as(c_int, 1) + (@as(c_int, 128) * @as(c_int, 255)))));
            dst_hi = _mm_add_epi16(dst_hi, _mm_set1_epi16(@truncate(@as(c_int, 1) + (@as(c_int, 128) * @as(c_int, 255)))));
            dst_lo = _mm_mulhi_epu16(dst_lo, _mm_set1_epi16(257));
            dst_hi = _mm_mulhi_epu16(dst_hi, _mm_set1_epi16(257));
            dst128 = _mm_packus_epi16(dst_lo, dst_hi);
            if (fill_alpha) {
                dst128 = _mm_or_si128(dst128, alpha_fill_mask);
            }
            _mm_storeu_si128(@ptrCast(@alignCast(dst)), dst128);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
        }
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
            _ = &dst32;
            while (true) {
                var srcA: Uint32 = (src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255);
                _ = &srcA;
                var tmp: Uint32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | dstfmt.*.Amask;
                _ = &tmp;
                while (true) {
                    var src64: Uint64 = tmp;
                    _ = &src64;
                    src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    var dst64: Uint64 = dst32;
                    _ = &dst64;
                    dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    dst64 = (((src64 -% dst64) *% @as(Uint64, srcA)) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                    dst64 +%= 281479271743489;
                    dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                    dst64 &= 18374966859414961920;
                    dst32 = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                    if (!false) break;
                }
                if (!false) break;
            }
            if (fill_alpha) {
                dst32 |= dstAmask;
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn Blit8888to8888PixelAlphaSwizzleAVX2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = info.*.src_fmt;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = info.*.dst_fmt;
    _ = &dstfmt;
    var fill_alpha: bool = !(dstfmt.*.Amask != 0);
    _ = &fill_alpha;
    var dstAmask: Uint32 = undefined;
    _ = &dstAmask;
    var dstAshift: Uint32 = undefined;
    _ = &dstAshift;
    SDL_Get8888AlphaMaskAndShift(dstfmt, &dstAmask, &dstAshift);
    const mask_offsets: __m256i = _mm256_set_epi8(28, 28, 28, 28, 24, 24, 24, 24, 20, 20, 20, 20, 16, 16, 16, 16, 12, 12, 12, 12, 8, 8, 8, 8, 4, 4, 4, 4, 0, 0, 0, 0);
    _ = &mask_offsets;
    const convert_mask: __m256i = _mm256_add_epi32(_mm256_set1_epi32((((@as(c_int, srcfmt.*.Rshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((@as(c_int, srcfmt.*.Gshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((@as(c_int, srcfmt.*.Bshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Bshift)))), mask_offsets);
    _ = &convert_mask;
    const alpha_splat_mask: __m256i = _mm256_add_epi8(_mm256_set1_epi8(@bitCast(@as(i8, @truncate(@as(c_int, srcfmt.*.Ashift) >> @intCast(@as(c_int, 3)))))), mask_offsets);
    _ = &alpha_splat_mask;
    const alpha_fill_mask: __m256i = _mm256_set1_epi32(@bitCast(@as(c_uint, @truncate(dstAmask))));
    _ = &alpha_fill_mask;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var i: c_int = 0;
        _ = &i;
        while ((i + @as(c_int, 8)) <= width) : (i += 8) {
            var src256: __m256i = _mm256_loadu_si256(@ptrCast(@alignCast(src)));
            _ = &src256;
            var dst256: __m256i = _mm256_loadu_si256(@ptrCast(@alignCast(dst)));
            _ = &dst256;
            var srcA: __m256i = _mm256_shuffle_epi8(src256, alpha_splat_mask);
            _ = &srcA;
            src256 = _mm256_shuffle_epi8(src256, convert_mask);
            src256 = _mm256_or_si256(src256, alpha_fill_mask);
            var alpha_lo: __m256i = _mm256_unpacklo_epi8(srcA, srcA);
            _ = &alpha_lo;
            var alpha_hi: __m256i = _mm256_unpackhi_epi8(srcA, srcA);
            _ = &alpha_hi;
            alpha_lo = _mm256_xor_si256(alpha_lo, _mm256_set1_epi16(@truncate(@as(c_int, 65280))));
            alpha_hi = _mm256_xor_si256(alpha_hi, _mm256_set1_epi16(@truncate(@as(c_int, 65280))));
            src256 = _mm256_sub_epi8(src256, _mm256_set1_epi8(@truncate(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 128))))))));
            dst256 = _mm256_sub_epi8(dst256, _mm256_set1_epi8(@truncate(@as(Uint8, @bitCast(@as(i8, @truncate(@as(c_int, 128))))))));
            var dst_lo: __m256i = _mm256_maddubs_epi16(alpha_lo, _mm256_unpacklo_epi8(src256, dst256));
            _ = &dst_lo;
            var dst_hi: __m256i = _mm256_maddubs_epi16(alpha_hi, _mm256_unpackhi_epi8(src256, dst256));
            _ = &dst_hi;
            dst_lo = _mm256_add_epi16(dst_lo, _mm256_set1_epi16(@truncate(@as(c_int, 1) + (@as(c_int, 128) * @as(c_int, 255)))));
            dst_hi = _mm256_add_epi16(dst_hi, _mm256_set1_epi16(@truncate(@as(c_int, 1) + (@as(c_int, 128) * @as(c_int, 255)))));
            dst_lo = _mm256_mulhi_epu16(dst_lo, _mm256_set1_epi16(257));
            dst_hi = _mm256_mulhi_epu16(dst_hi, _mm256_set1_epi16(257));
            dst256 = _mm256_packus_epi16(dst_lo, dst_hi);
            if (fill_alpha) {
                dst256 = _mm256_or_si256(dst256, alpha_fill_mask);
            }
            _mm256_storeu_si256(@ptrCast(@alignCast(dst)), dst256);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
        }
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
            _ = &dst32;
            while (true) {
                var srcA: Uint32 = (src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255);
                _ = &srcA;
                var tmp: Uint32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | dstfmt.*.Amask;
                _ = &tmp;
                while (true) {
                    var src64: Uint64 = tmp;
                    _ = &src64;
                    src64 = (src64 | (src64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    var dst64: Uint64 = dst32;
                    _ = &dst64;
                    dst64 = (dst64 | (dst64 << @intCast(@as(Uint64, 24)))) & @as(Uint64, 71777214294589695);
                    dst64 = (((src64 -% dst64) *% @as(Uint64, srcA)) +% (dst64 << @intCast(@as(Uint64, 8)))) -% dst64;
                    dst64 +%= 281479271743489;
                    dst64 +%= (dst64 >> @intCast(@as(Uint64, 8))) & @as(Uint64, 71777214294589695);
                    dst64 &= 18374966859414961920;
                    dst32 = @truncate((dst64 >> @intCast(@as(Uint64, 8))) | (dst64 >> @intCast(@as(Uint64, 32))));
                    if (!false) break;
                }
                if (!false) break;
            }
            if (fill_alpha) {
                dst32 |= dstAmask;
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn BlitNtoNPixelAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var sA: c_uint = undefined;
    _ = &sA;
    var dR: c_uint = undefined;
    _ = &dR;
    var dG: c_uint = undefined;
    _ = &dG;
    var dB: c_uint = undefined;
    _ = &dB;
    var dA: c_uint = undefined;
    _ = &dA;
    var n: c_int = undefined;
    _ = &n;
    var x: Uint16 = undefined;
    _ = &x;
    var x_1: Uint16 = undefined;
    _ = &x_1;
    var x_2: Uint16 = undefined;
    _ = &x_2;
    var x_3: Uint16 = undefined;
    _ = &x_3;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var x_6: Uint16 = undefined;
    _ = &x_6;
    var x_7: Uint16 = undefined;
    _ = &x_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var _pixel_10: Uint8 = undefined;
    _ = &_pixel_10;
    var _pixel_11: Uint16 = undefined;
    _ = &_pixel_11;
    var _pixel_12: Uint32 = undefined;
    _ = &_pixel_12;
    var x_13: Uint16 = undefined;
    _ = &x_13;
    var x_14: Uint16 = undefined;
    _ = &x_14;
    var x_15: Uint16 = undefined;
    _ = &x_15;
    var x_16: Uint16 = undefined;
    _ = &x_16;
    var _pixel_17: Uint8 = undefined;
    _ = &_pixel_17;
    var _pixel_18: Uint16 = undefined;
    _ = &_pixel_18;
    var _pixel_19: Uint32 = undefined;
    _ = &_pixel_19;
    var x_20: Uint16 = undefined;
    _ = &x_20;
    var x_21: Uint16 = undefined;
    _ = &x_21;
    var x_22: Uint16 = undefined;
    _ = &x_22;
    var x_23: Uint16 = undefined;
    _ = &x_23;
    var _pixel_24: Uint8 = undefined;
    _ = &_pixel_24;
    var _pixel_25: Uint16 = undefined;
    _ = &_pixel_25;
    var _pixel_26: Uint32 = undefined;
    _ = &_pixel_26;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 134;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                {}
            },
            4 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            10 => {
                if (false) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (sA != 0) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            21 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            22 => {
                if (false) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                if (false) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 49;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            33 => {
                x = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if (false) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                x_1 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_1;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_1;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_1) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_1) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (false) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                x_2 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_2;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_2;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_2) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_2) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (false) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                x_3 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_3;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_3;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_3) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_3) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            46 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 45;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 58;
                        continue;
                    },
                    else => {
                        sdl_pc = 59;
                        continue;
                    },
                }
            },
            52 => {
                if (false) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (sA != 0) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            55 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            56 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            57 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            63 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 71;
                        continue;
                    },
                }
            },
            64 => {
                if (false) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            67 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            68 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            69 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            70 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            71 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (false) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 91;
                        continue;
                    },
                    else => {
                        sdl_pc = 87;
                        continue;
                    },
                }
            },
            75 => {
                x_6 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_6;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_6;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_6) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_6) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                if (false) {
                    sdl_pc = 75;
                    continue;
                } else {
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
                x_7 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_7;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_7;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_7) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_7) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (false) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
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
                x_8 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (false) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
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
                x_9 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                if (false) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            88 => {
                _pixel_10 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_10;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            89 => {
                _pixel_11 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_11;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                _pixel_12 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_12;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 100;
                        continue;
                    },
                    else => {
                        sdl_pc = 101;
                        continue;
                    },
                }
            },
            94 => {
                if (false) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if (sA != 0) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            98 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            99 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            100 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            101 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            105 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 110;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 112;
                        continue;
                    },
                    else => {
                        sdl_pc = 113;
                        continue;
                    },
                }
            },
            106 => {
                if (false) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            110 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            111 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            112 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if (false) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 130;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 132;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 133;
                        continue;
                    },
                    else => {
                        sdl_pc = 129;
                        continue;
                    },
                }
            },
            117 => {
                x_13 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_13;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_13;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_13) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_13) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if (false) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 119;
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
                x_14 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_14;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_14;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_14) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_14) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                if (false) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            123 => {
                x_15 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_15;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_15;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_15) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_15) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                if (false) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            126 => {
                x_16 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_16;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_16;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_16) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_16) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                if (false) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            130 => {
                _pixel_17 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_17;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            131 => {
                _pixel_18 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_18;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            132 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            133 => {
                _pixel_19 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_19;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 140;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 141;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 142;
                        continue;
                    },
                    else => {
                        sdl_pc = 143;
                        continue;
                    },
                }
            },
            136 => {
                if (false) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                if (sA != 0) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            139 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            140 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            141 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            142 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                Pixel = 0;
                sR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            sA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        sB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            147 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 153;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 154;
                        continue;
                    },
                    else => {
                        sdl_pc = 155;
                        continue;
                    },
                }
            },
            148 => {
                if (false) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 156;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            151 => {
                Pixel = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            152 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            153 => {
                Pixel = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            154 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(Pixel & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(Pixel & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(Pixel & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(Pixel & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            155 => {
                Pixel = 0;
                dR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(c_uint, 0);
                            dA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 150;
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
                if (false) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 172;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 173;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 174;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 175;
                        continue;
                    },
                    else => {
                        sdl_pc = 171;
                        continue;
                    },
                }
            },
            159 => {
                x_20 = @truncate(((sR -% dR) *% sA) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_20;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_20;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_20) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_20) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                if (false) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            162 => {
                x_21 = @truncate(((sG -% dG) *% sA) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_21;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_21;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_21) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_21) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                if (false) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                x_22 = @truncate(((sB -% dB) *% sA) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_22;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_22;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_22) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_22) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            166 => {
                if (false) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            168 => {
                x_23 = @truncate(((@as(c_uint, 255) -% dA) *% sA) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_23;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_23;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_23) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_23) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                if (false) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            172 => {
                _pixel_24 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_24;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            173 => {
                _pixel_25 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_25;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            174 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            175 => {
                _pixel_26 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_26;
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_CalculateBlitA(surface: [*c]SDL_Surface) SDL_BlitFunc {
    @setEvalBranchQuota(100000);
    var sf: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &sf;
    var df: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &df;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                sf = surface.*.fmt;
                df = surface.*.map.info.dst_fmt;
                switch (surface.*.map.info.flags & ~((SDL_COPY_RLE_DESIRED | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)) {
                    SDL_COPY_BLEND => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_COPY_MODULATE_ALPHA | SDL_COPY_BLEND => {
                        sdl_pc = 33;
                        continue;
                    },
                    (SDL_COPY_COLORKEY | SDL_COPY_MODULATE_ALPHA) | SDL_COPY_BLEND => {
                        sdl_pc = 70;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return null;
            },
            2 => {
                switch (@as(c_int, df.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            3 => {
                return BlitNtoNPixelAlpha;
            },
            4 => {
                if (surface.*.map.info.dst_pal != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return BlitNto1PixelAlpha;
            },
            6 => {
                return BlitNtoNPixelAlpha;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if ((((@as(c_int, sf.*.bytes_per_pixel) == @as(c_int, 4)) and (sf.*.Amask == @as(c_uint, 4278190080))) and (sf.*.Gmask == @as(Uint32, 65280))) and (((sf.*.Rmask == @as(Uint32, 255)) and (df.*.Rmask == @as(Uint32, 31))) or ((sf.*.Bmask == @as(Uint32, 255)) and (df.*.Bmask == @as(Uint32, 31))))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (df.*.Gmask == @as(Uint32, 2016)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return BlitNtoNPixelAlpha;
            },
            12 => {
                return BlitARGBto565PixelAlpha;
            },
            13 => {
                if ((df.*.Gmask == @as(Uint32, 992)) and !(df.*.Amask != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                return BlitARGBto555PixelAlpha;
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (((@as(Uint32, @bitCast(@as(c_int, @intFromBool(((sf.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888))))) != 0) and (sf.*.Amask != 0)) and (((df.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if (SDL_HasAVX2_REAL()) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                return BlitNtoNPixelAlpha;
            },
            22 => {
                return Blit8888to8888PixelAlphaSwizzleAVX2;
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (SDL_HasSSE41_REAL()) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                return Blit8888to8888PixelAlphaSwizzleSSE41;
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (sf.*.format == df.*.format) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                return Blit8888to8888PixelAlpha;
            },
            29 => {
                return Blit8888to8888PixelAlphaSwizzle;
            },
            30 => {
                {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            33 => {
                if (sf.*.Amask == @as(Uint32, 0)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                switch (@as(c_int, df.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 68;
                        continue;
                    },
                    else => {
                        sdl_pc = 69;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                if (surface.*.map.info.dst_pal != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                return BlitNto1SurfaceAlpha;
            },
            40 => {
                return BlitNtoNSurfaceAlpha;
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if (surface.*.map.identity != 0) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                if (df.*.Gmask == @as(Uint32, 2016)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                return BlitNtoNSurfaceAlpha;
            },
            46 => {
                if (SDL_HasMMX_REAL()) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                if (df.*.Gmask == @as(Uint32, 992)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                return Blit565to565SurfaceAlphaMMX;
            },
            50 => {
                return Blit565to565SurfaceAlpha;
            },
            51 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                if (SDL_HasMMX_REAL()) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            55 => {
                return Blit555to555SurfaceAlphaMMX;
            },
            56 => {
                return Blit555to555SurfaceAlpha;
            },
            57 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            58 => {
                if ((((sf.*.Rmask == df.*.Rmask) and (sf.*.Gmask == df.*.Gmask)) and (sf.*.Bmask == df.*.Bmask)) and (@as(c_int, sf.*.bytes_per_pixel) == @as(c_int, 4))) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                if ((((__helpers.signedRemainder(@as(c_int, sf.*.Rshift), @as(c_int, 8)) == @as(c_int, 0)) and (__helpers.signedRemainder(@as(c_int, sf.*.Gshift), @as(c_int, 8)) == @as(c_int, 0))) and (__helpers.signedRemainder(@as(c_int, sf.*.Bshift), @as(c_int, 8)) == @as(c_int, 0))) and SDL_HasSSE2_REAL()) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                return BlitNtoNSurfaceAlpha;
            },
            62 => {
                return Blit888to888SurfaceAlphaSSE2;
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                if (((sf.*.Rmask | sf.*.Gmask) | sf.*.Bmask) == @as(Uint32, 16777215)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                return BlitRGBtoRGBSurfaceAlpha;
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 61;
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
                return BlitNtoNSurfaceAlpha;
            },
            70 => {
                if (sf.*.Amask == @as(Uint32, 0)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                if (@as(c_int, df.*.bytes_per_pixel) == @as(c_int, 1)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            74 => {
                if (surface.*.map.info.dst_pal != null) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            75 => {
                return BlitNtoNSurfaceAlphaKey;
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                return BlitNto1SurfaceAlphaKey;
            },
            78 => {
                return BlitNtoNSurfaceAlphaKey;
            },
            79 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const SDL_COPY_RLE_DESIRED = @as(c_int, 0x00001000);
pub const SDL_COPY_RLE_COLORKEY = @as(c_int, 0x00002000);
pub const SDL_COPY_RLE_ALPHAKEY = @as(c_int, 0x00004000);
pub inline fn BLEND16_50(d: anytype, s: anytype, mask: anytype) @TypeOf((((s & mask) + (d & mask)) >> @as(c_int, 1)) + ((s & d) & (~mask & __helpers.promoteIntLiteral(c_int, 0xffff, .hex)))) {
    @setEvalBranchQuota(100000);
    _ = &d;
    _ = &s;
    _ = &mask;
    return (((s & mask) + (d & mask)) >> @as(c_int, 1)) + ((s & d) & (~mask & __helpers.promoteIntLiteral(c_int, 0xffff, .hex)));
}
