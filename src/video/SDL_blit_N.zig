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
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
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
pub extern fn SDL_HasSSE41_REAL() bool;
pub extern fn SDL_HasAVX2_REAL() bool;
pub const __m128i = @Vector(2, c_longlong);
pub const __v4si = @Vector(4, c_int);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __v4su = @Vector(4, c_uint);
pub const __m128i_u = @Vector(2, c_longlong);
pub const __v2du = @Vector(2, c_ulonglong);
pub inline fn _mm_add_epi32(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4su, @bitCast(__a)) + @as(__v4su, @bitCast(__b)));
}
pub const _mm_mulhi_epu16 = @import("simd")._mm_mulhi_epu16;
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
pub inline fn _mm_cvtsi32_si128(__a: c_int) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4si, [4]c_int{
        __a,
        0,
        0,
        0,
    }));
}
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
pub inline fn _mm_storeu_si128(__p: [*c]align(1) __m128i_u, __b: __m128i) void {
    @setEvalBranchQuota(100000);
    const struct___storeu_si128 = extern struct {
        __v: [2]c_longlong align(1) = @import("std").mem.zeroes(__m128i_u),
    };
    _ = &struct___storeu_si128;
    @as([*c]struct___storeu_si128, @ptrCast(@alignCast(__p))).*.__v = __b;
}
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
pub const _mm_shuffle_epi8 = @import("simd")._mm_shuffle_epi8;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:615:20: warning: TODO implement function '__builtin_ia32_pshufb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/tmmintrin.h:614:1: warning: unable to translate function, demoted to extern
pub const __v8si = @Vector(8, c_int);
pub const __v32qi = @Vector(32, u8);
pub const __v4du = @Vector(4, c_ulonglong);
pub const __v8su = @Vector(8, c_uint);
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
pub inline fn _mm256_add_epi32(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8su, @bitCast(__a)) + @as(__v8su, @bitCast(__b)));
}
pub inline fn _mm256_or_si256(__a: __m256i, __b: __m256i) __m256i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v4du, @bitCast(__a)) | @as(__v4du, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1816:10: warning: TODO implement function '__builtin_ia32_psadbw256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1814:1: warning: unable to translate function, demoted to extern
pub const _mm256_shuffle_epi8 = @import("simd")._mm256_shuffle_epi8;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1980:19: warning: TODO implement function '__builtin_ia32_psignb256' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/avx2intrin.h:1979:1: warning: unable to translate function, demoted to extern
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
pub extern fn SDL_BlitCopy(info: [*c]SDL_BlitInfo) void;
pub fn Blit_XRGB8888_RGB555(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint32 = undefined;
    _ = &src;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = @ptrCast(@alignCast(info.*.src));
                srcskip = @divTrunc(info.*.src_skip, @as(c_int, 4));
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 2));
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
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 9))) | ((src.* & @as(Uint32, 63488)) >> @intCast(@as(Uint32, 6)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
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
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 9))) | ((src.* & @as(Uint32, 63488)) >> @intCast(@as(Uint32, 6)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 9))) | ((src.* & @as(Uint32, 63488)) >> @intCast(@as(Uint32, 6)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 9))) | ((src.* & @as(Uint32, 63488)) >> @intCast(@as(Uint32, 6)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit_XRGB8888_RGB565(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint32 = undefined;
    _ = &src;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = @ptrCast(@alignCast(info.*.src));
                srcskip = @divTrunc(info.*.src_skip, @as(c_int, 4));
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 2));
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
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 8))) | ((src.* & @as(Uint32, 64512)) >> @intCast(@as(Uint32, 5)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
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
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 8))) | ((src.* & @as(Uint32, 64512)) >> @intCast(@as(Uint32, 5)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 8))) | ((src.* & @as(Uint32, 64512)) >> @intCast(@as(Uint32, 5)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                dst.* = @truncate((((src.* & @as(Uint32, 16252928)) >> @intCast(@as(Uint32, 8))) | ((src.* & @as(Uint32, 64512)) >> @intCast(@as(Uint32, 5)))) | ((src.* & @as(Uint32, 248)) >> @intCast(@as(Uint32, 3))));
                src += 1;
                dst += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit_RGB565_32_SSE41(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var c: c_int = undefined;
    _ = &c;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]const Uint16 = undefined;
    _ = &src;
    var dst: [*c]Uint32 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var r: Uint8 = undefined;
    _ = &r;
    var g: Uint8 = undefined;
    _ = &g;
    var b: Uint8 = undefined;
    _ = &b;
    var rb_mult: __m128i = undefined;
    _ = &rb_mult;
    var g_mult: __m128i = undefined;
    _ = &g_mult;
    var r_mask: __m128i = undefined;
    _ = &r_mask;
    var g_mask: __m128i = undefined;
    _ = &g_mask;
    var a_mask: __m128i = undefined;
    _ = &a_mask;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var Rshift: Uint32 = undefined;
    _ = &Rshift;
    var Gshift: Uint32 = undefined;
    _ = &Gshift;
    var Bshift: Uint32 = undefined;
    _ = &Bshift;
    var Amask: Uint32 = undefined;
    _ = &Amask;
    var Ashift: Uint32 = undefined;
    _ = &Ashift;
    var mask_offsets: __m128i = undefined;
    _ = &mask_offsets;
    var convert_mask: __m128i = undefined;
    _ = &convert_mask;
    var pixel: __m128i = undefined;
    _ = &pixel;
    var red: __m128i = undefined;
    _ = &red;
    var green: __m128i = undefined;
    _ = &green;
    var blue: __m128i = undefined;
    _ = &blue;
    var red_blue: __m128i = undefined;
    _ = &red_blue;
    var green_alpha: __m128i = undefined;
    _ = &green_alpha;
    var out1: __m128i = undefined;
    _ = &out1;
    var out2: __m128i = undefined;
    _ = &out2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = @ptrCast(@alignCast(info.*.src));
                srcskip = @divTrunc(info.*.src_skip, @as(c_int, 2));
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 4));
                rb_mult = @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(_mm_cvtsi32_si128(17301768))), @as(c_int, 0))));
                g_mult = @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(_mm_cvtsi32_si128(545267840))), @as(c_int, 0))));
                r_mask = @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, 4160813056))))))), @as(c_int, 0))));
                g_mask = @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(_mm_cvtsi32_si128(132122592))), @as(c_int, 0))));
                a_mask = @as(__m128i, @bitCast(__builtin.pshufd(@as(__v4si, @bitCast(_mm_cvtsi32_si128(@bitCast(@as(c_uint, @truncate(@as(c_uint, 4278255360))))))), @as(c_int, 0))));
                dstfmt = info.*.dst_fmt;
                Rshift = dstfmt.*.Rshift;
                Gshift = dstfmt.*.Gshift;
                Bshift = dstfmt.*.Bshift;
                SDL_Get8888AlphaMaskAndShift(dstfmt, &Amask, &Ashift);
                mask_offsets = _mm_set_epi8(12, 12, 12, 12, 8, 8, 8, 8, 4, 4, 4, 4, 0, 0, 0, 0);
                convert_mask = _mm_add_epi32(_mm_set1_epi32(@bitCast(@as(c_uint, @truncate((((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 16) >> @intCast(@as(c_int, 3))))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) >> @intCast(@as(c_int, 3))))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 0) >> @intCast(@as(c_int, 3))))) << @intCast(Bshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, 24) >> @intCast(@as(c_int, 3))))) << @intCast(Ashift)))))), mask_offsets);
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
                c = @divTrunc(width, @as(c_int, 8));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if (c != 0) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                pixel = _mm_loadu_si128(@ptrCast(@alignCast(src)));
                red = pixel;
                green = pixel;
                blue = pixel;
                red = _mm_and_si128(red, r_mask);
                red = _mm_mulhi_epu16(red, rb_mult);
                blue = _mm_slli_epi16(blue, 11);
                blue = _mm_mulhi_epu16(blue, rb_mult);
                red_blue = _mm_or_si128(_mm_slli_epi16(red, 8), blue);
                green = _mm_and_si128(green, g_mask);
                green = _mm_mulhi_epu16(green, g_mult);
                green_alpha = _mm_or_si128(green, a_mask);
                out1 = _mm_unpacklo_epi8(red_blue, green_alpha);
                out2 = _mm_unpackhi_epi8(red_blue, green_alpha);
                out1 = _mm_shuffle_epi8(out1, convert_mask);
                out2 = _mm_shuffle_epi8(out2, convert_mask);
                _mm_storeu_si128(@ptrCast(@alignCast(dst)), out1);
                _mm_storeu_si128(@ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))))), out2);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                c -= 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 7) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            8 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                r = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                g = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, src.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                b = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, src.*) & @as(c_int, 31))))];
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = (((@as(Uint32, @bitCast(@as(c_int, @as(c_int, r)))) << @intCast(Rshift)) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, g)))) << @intCast(Gshift))) | (@as(Uint32, @bitCast(@as(c_int, @as(c_int, b)))) << @intCast(Bshift))) | Amask;
                src += 1;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit_RGB565_32(info: [*c]SDL_BlitInfo, map: [*c]const Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint32 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var n: c_int = undefined;
    _ = &n;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                srcskip = info.*.src_skip;
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 4));
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
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[@bitCast(@as(isize, @intCast(@as(c_int, src[LO]) * @as(c_int, 2))))] | map[@bitCast(@as(isize, @intCast((@as(c_int, src[HI]) * @as(c_int, 2)) + @as(c_int, 1))))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
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
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[@bitCast(@as(isize, @intCast(@as(c_int, src[LO]) * @as(c_int, 2))))] | map[@bitCast(@as(isize, @intCast((@as(c_int, src[HI]) * @as(c_int, 2)) + @as(c_int, 1))))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[@bitCast(@as(isize, @intCast(@as(c_int, src[LO]) * @as(c_int, 2))))] | map[@bitCast(@as(isize, @intCast((@as(c_int, src[HI]) * @as(c_int, 2)) + @as(c_int, 1))))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[@bitCast(@as(isize, @intCast(@as(c_int, src[LO]) * @as(c_int, 2))))] | map[@bitCast(@as(isize, @intCast((@as(c_int, src[HI]) * @as(c_int, 2)) + @as(c_int, 1))))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const RGB565_ARGB8888_LUT: [512]Uint32 = [512]Uint32{
    4278190080,
    4278190080,
    4278190088,
    4278198272,
    4278190096,
    4278206720,
    4278190104,
    4278214912,
    4278190113,
    4278223360,
    4278190121,
    4278231552,
    4278190129,
    4278240000,
    4278190137,
    4278248192,
    4278190146,
    4278714368,
    4278190154,
    4278722560,
    4278190162,
    4278731008,
    4278190170,
    4278739200,
    4278190179,
    4278747648,
    4278190187,
    4278755840,
    4278190195,
    4278764288,
    4278190203,
    4278772480,
    4278190212,
    4279238656,
    4278190220,
    4279246848,
    4278190228,
    4279255296,
    4278190236,
    4279263488,
    4278190245,
    4279271936,
    4278190253,
    4279280128,
    4278190261,
    4279288576,
    4278190269,
    4279296768,
    4278190278,
    4279762944,
    4278190286,
    4279771136,
    4278190294,
    4279779584,
    4278190302,
    4279787776,
    4278190311,
    4279796224,
    4278190319,
    4279804416,
    4278190327,
    4279812864,
    4278190335,
    4279821056,
    4278191104,
    4280352768,
    4278191112,
    4280360960,
    4278191120,
    4280369408,
    4278191128,
    4280377600,
    4278191137,
    4280386048,
    4278191145,
    4280394240,
    4278191153,
    4280402688,
    4278191161,
    4280410880,
    4278191170,
    4280877056,
    4278191178,
    4280885248,
    4278191186,
    4280893696,
    4278191194,
    4280901888,
    4278191203,
    4280910336,
    4278191211,
    4280918528,
    4278191219,
    4280926976,
    4278191227,
    4280935168,
    4278191236,
    4281401344,
    4278191244,
    4281409536,
    4278191252,
    4281417984,
    4278191260,
    4281426176,
    4278191269,
    4281434624,
    4278191277,
    4281442816,
    4278191285,
    4281451264,
    4278191293,
    4281459456,
    4278191302,
    4281925632,
    4278191310,
    4281933824,
    4278191318,
    4281942272,
    4278191326,
    4281950464,
    4278191335,
    4281958912,
    4278191343,
    4281967104,
    4278191351,
    4281975552,
    4278191359,
    4281983744,
    4278192128,
    4282515456,
    4278192136,
    4282523648,
    4278192144,
    4282532096,
    4278192152,
    4282540288,
    4278192161,
    4282548736,
    4278192169,
    4282556928,
    4278192177,
    4282565376,
    4278192185,
    4282573568,
    4278192194,
    4283039744,
    4278192202,
    4283047936,
    4278192210,
    4283056384,
    4278192218,
    4283064576,
    4278192227,
    4283073024,
    4278192235,
    4283081216,
    4278192243,
    4283089664,
    4278192251,
    4283097856,
    4278192260,
    4283564032,
    4278192268,
    4283572224,
    4278192276,
    4283580672,
    4278192284,
    4283588864,
    4278192293,
    4283597312,
    4278192301,
    4283605504,
    4278192309,
    4283613952,
    4278192317,
    4283622144,
    4278192326,
    4284088320,
    4278192334,
    4284096512,
    4278192342,
    4284104960,
    4278192350,
    4284113152,
    4278192359,
    4284121600,
    4278192367,
    4284129792,
    4278192375,
    4284138240,
    4278192383,
    4284146432,
    4278193152,
    4284678144,
    4278193160,
    4284686336,
    4278193168,
    4284694784,
    4278193176,
    4284702976,
    4278193185,
    4284711424,
    4278193193,
    4284719616,
    4278193201,
    4284728064,
    4278193209,
    4284736256,
    4278193218,
    4285202432,
    4278193226,
    4285210624,
    4278193234,
    4285219072,
    4278193242,
    4285227264,
    4278193251,
    4285235712,
    4278193259,
    4285243904,
    4278193267,
    4285252352,
    4278193275,
    4285260544,
    4278193284,
    4285726720,
    4278193292,
    4285734912,
    4278193300,
    4285743360,
    4278193308,
    4285751552,
    4278193317,
    4285760000,
    4278193325,
    4285768192,
    4278193333,
    4285776640,
    4278193341,
    4285784832,
    4278193350,
    4286251008,
    4278193358,
    4286259200,
    4278193366,
    4286267648,
    4278193374,
    4286275840,
    4278193383,
    4286284288,
    4278193391,
    4286292480,
    4278193399,
    4286300928,
    4278193407,
    4286309120,
    4278194176,
    4286840832,
    4278194184,
    4286849024,
    4278194192,
    4286857472,
    4278194200,
    4286865664,
    4278194209,
    4286874112,
    4278194217,
    4286882304,
    4278194225,
    4286890752,
    4278194233,
    4286898944,
    4278194242,
    4287365120,
    4278194250,
    4287373312,
    4278194258,
    4287381760,
    4278194266,
    4287389952,
    4278194275,
    4287398400,
    4278194283,
    4287406592,
    4278194291,
    4287415040,
    4278194299,
    4287423232,
    4278194308,
    4287889408,
    4278194316,
    4287897600,
    4278194324,
    4287906048,
    4278194332,
    4287914240,
    4278194341,
    4287922688,
    4278194349,
    4287930880,
    4278194357,
    4287939328,
    4278194365,
    4287947520,
    4278194374,
    4288413696,
    4278194382,
    4288421888,
    4278194390,
    4288430336,
    4278194398,
    4288438528,
    4278194407,
    4288446976,
    4278194415,
    4288455168,
    4278194423,
    4288463616,
    4278194431,
    4288471808,
    4278195200,
    4289003520,
    4278195208,
    4289011712,
    4278195216,
    4289020160,
    4278195224,
    4289028352,
    4278195233,
    4289036800,
    4278195241,
    4289044992,
    4278195249,
    4289053440,
    4278195257,
    4289061632,
    4278195266,
    4289527808,
    4278195274,
    4289536000,
    4278195282,
    4289544448,
    4278195290,
    4289552640,
    4278195299,
    4289561088,
    4278195307,
    4289569280,
    4278195315,
    4289577728,
    4278195323,
    4289585920,
    4278195332,
    4290052096,
    4278195340,
    4290060288,
    4278195348,
    4290068736,
    4278195356,
    4290076928,
    4278195365,
    4290085376,
    4278195373,
    4290093568,
    4278195381,
    4290102016,
    4278195389,
    4290110208,
    4278195398,
    4290576384,
    4278195406,
    4290584576,
    4278195414,
    4290593024,
    4278195422,
    4290601216,
    4278195431,
    4290609664,
    4278195439,
    4290617856,
    4278195447,
    4290626304,
    4278195455,
    4290634496,
    4278196224,
    4291166208,
    4278196232,
    4291174400,
    4278196240,
    4291182848,
    4278196248,
    4291191040,
    4278196257,
    4291199488,
    4278196265,
    4291207680,
    4278196273,
    4291216128,
    4278196281,
    4291224320,
    4278196290,
    4291690496,
    4278196298,
    4291698688,
    4278196306,
    4291707136,
    4278196314,
    4291715328,
    4278196323,
    4291723776,
    4278196331,
    4291731968,
    4278196339,
    4291740416,
    4278196347,
    4291748608,
    4278196356,
    4292214784,
    4278196364,
    4292222976,
    4278196372,
    4292231424,
    4278196380,
    4292239616,
    4278196389,
    4292248064,
    4278196397,
    4292256256,
    4278196405,
    4292264704,
    4278196413,
    4292272896,
    4278196422,
    4292739072,
    4278196430,
    4292747264,
    4278196438,
    4292755712,
    4278196446,
    4292763904,
    4278196455,
    4292772352,
    4278196463,
    4292780544,
    4278196471,
    4292788992,
    4278196479,
    4292797184,
    4278197248,
    4293328896,
    4278197256,
    4293337088,
    4278197264,
    4293345536,
    4278197272,
    4293353728,
    4278197281,
    4293362176,
    4278197289,
    4293370368,
    4278197297,
    4293378816,
    4278197305,
    4293387008,
    4278197314,
    4293853184,
    4278197322,
    4293861376,
    4278197330,
    4293869824,
    4278197338,
    4293878016,
    4278197347,
    4293886464,
    4278197355,
    4293894656,
    4278197363,
    4293903104,
    4278197371,
    4293911296,
    4278197380,
    4294377472,
    4278197388,
    4294385664,
    4278197396,
    4294394112,
    4278197404,
    4294402304,
    4278197413,
    4294410752,
    4278197421,
    4294418944,
    4278197429,
    4294427392,
    4278197437,
    4294435584,
    4278197446,
    4294901760,
    4278197454,
    4294909952,
    4278197462,
    4294918400,
    4278197470,
    4294926592,
    4278197479,
    4294935040,
    4278197487,
    4294943232,
    4278197495,
    4294951680,
    4278197503,
    4294959872,
};
pub fn Blit_RGB565_ARGB8888(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Blit_RGB565_32(info, @ptrCast(@alignCast(&RGB565_ARGB8888_LUT)));
}
pub const RGB565_ABGR8888_LUT: [512]Uint32 = [512]Uint32{
    4278190080,
    4278190080,
    4278714368,
    4278198272,
    4279238656,
    4278206720,
    4279762944,
    4278214912,
    4280352768,
    4278223360,
    4280877056,
    4278231552,
    4281401344,
    4278240000,
    4281925632,
    4278248192,
    4282515456,
    4278190088,
    4283039744,
    4278198280,
    4283564032,
    4278206728,
    4284088320,
    4278214920,
    4284678144,
    4278223368,
    4285202432,
    4278231560,
    4285726720,
    4278240008,
    4286251008,
    4278248200,
    4286840832,
    4278190096,
    4287365120,
    4278198288,
    4287889408,
    4278206736,
    4288413696,
    4278214928,
    4289003520,
    4278223376,
    4289527808,
    4278231568,
    4290052096,
    4278240016,
    4290576384,
    4278248208,
    4291166208,
    4278190104,
    4291690496,
    4278198296,
    4292214784,
    4278206744,
    4292739072,
    4278214936,
    4293328896,
    4278223384,
    4293853184,
    4278231576,
    4294377472,
    4278240024,
    4294901760,
    4278248216,
    4278191104,
    4278190113,
    4278715392,
    4278198305,
    4279239680,
    4278206753,
    4279763968,
    4278214945,
    4280353792,
    4278223393,
    4280878080,
    4278231585,
    4281402368,
    4278240033,
    4281926656,
    4278248225,
    4282516480,
    4278190121,
    4283040768,
    4278198313,
    4283565056,
    4278206761,
    4284089344,
    4278214953,
    4284679168,
    4278223401,
    4285203456,
    4278231593,
    4285727744,
    4278240041,
    4286252032,
    4278248233,
    4286841856,
    4278190129,
    4287366144,
    4278198321,
    4287890432,
    4278206769,
    4288414720,
    4278214961,
    4289004544,
    4278223409,
    4289528832,
    4278231601,
    4290053120,
    4278240049,
    4290577408,
    4278248241,
    4291167232,
    4278190137,
    4291691520,
    4278198329,
    4292215808,
    4278206777,
    4292740096,
    4278214969,
    4293329920,
    4278223417,
    4293854208,
    4278231609,
    4294378496,
    4278240057,
    4294902784,
    4278248249,
    4278192128,
    4278190146,
    4278716416,
    4278198338,
    4279240704,
    4278206786,
    4279764992,
    4278214978,
    4280354816,
    4278223426,
    4280879104,
    4278231618,
    4281403392,
    4278240066,
    4281927680,
    4278248258,
    4282517504,
    4278190154,
    4283041792,
    4278198346,
    4283566080,
    4278206794,
    4284090368,
    4278214986,
    4284680192,
    4278223434,
    4285204480,
    4278231626,
    4285728768,
    4278240074,
    4286253056,
    4278248266,
    4286842880,
    4278190162,
    4287367168,
    4278198354,
    4287891456,
    4278206802,
    4288415744,
    4278214994,
    4289005568,
    4278223442,
    4289529856,
    4278231634,
    4290054144,
    4278240082,
    4290578432,
    4278248274,
    4291168256,
    4278190170,
    4291692544,
    4278198362,
    4292216832,
    4278206810,
    4292741120,
    4278215002,
    4293330944,
    4278223450,
    4293855232,
    4278231642,
    4294379520,
    4278240090,
    4294903808,
    4278248282,
    4278193152,
    4278190179,
    4278717440,
    4278198371,
    4279241728,
    4278206819,
    4279766016,
    4278215011,
    4280355840,
    4278223459,
    4280880128,
    4278231651,
    4281404416,
    4278240099,
    4281928704,
    4278248291,
    4282518528,
    4278190187,
    4283042816,
    4278198379,
    4283567104,
    4278206827,
    4284091392,
    4278215019,
    4284681216,
    4278223467,
    4285205504,
    4278231659,
    4285729792,
    4278240107,
    4286254080,
    4278248299,
    4286843904,
    4278190195,
    4287368192,
    4278198387,
    4287892480,
    4278206835,
    4288416768,
    4278215027,
    4289006592,
    4278223475,
    4289530880,
    4278231667,
    4290055168,
    4278240115,
    4290579456,
    4278248307,
    4291169280,
    4278190203,
    4291693568,
    4278198395,
    4292217856,
    4278206843,
    4292742144,
    4278215035,
    4293331968,
    4278223483,
    4293856256,
    4278231675,
    4294380544,
    4278240123,
    4294904832,
    4278248315,
    4278194176,
    4278190212,
    4278718464,
    4278198404,
    4279242752,
    4278206852,
    4279767040,
    4278215044,
    4280356864,
    4278223492,
    4280881152,
    4278231684,
    4281405440,
    4278240132,
    4281929728,
    4278248324,
    4282519552,
    4278190220,
    4283043840,
    4278198412,
    4283568128,
    4278206860,
    4284092416,
    4278215052,
    4284682240,
    4278223500,
    4285206528,
    4278231692,
    4285730816,
    4278240140,
    4286255104,
    4278248332,
    4286844928,
    4278190228,
    4287369216,
    4278198420,
    4287893504,
    4278206868,
    4288417792,
    4278215060,
    4289007616,
    4278223508,
    4289531904,
    4278231700,
    4290056192,
    4278240148,
    4290580480,
    4278248340,
    4291170304,
    4278190236,
    4291694592,
    4278198428,
    4292218880,
    4278206876,
    4292743168,
    4278215068,
    4293332992,
    4278223516,
    4293857280,
    4278231708,
    4294381568,
    4278240156,
    4294905856,
    4278248348,
    4278195200,
    4278190245,
    4278719488,
    4278198437,
    4279243776,
    4278206885,
    4279768064,
    4278215077,
    4280357888,
    4278223525,
    4280882176,
    4278231717,
    4281406464,
    4278240165,
    4281930752,
    4278248357,
    4282520576,
    4278190253,
    4283044864,
    4278198445,
    4283569152,
    4278206893,
    4284093440,
    4278215085,
    4284683264,
    4278223533,
    4285207552,
    4278231725,
    4285731840,
    4278240173,
    4286256128,
    4278248365,
    4286845952,
    4278190261,
    4287370240,
    4278198453,
    4287894528,
    4278206901,
    4288418816,
    4278215093,
    4289008640,
    4278223541,
    4289532928,
    4278231733,
    4290057216,
    4278240181,
    4290581504,
    4278248373,
    4291171328,
    4278190269,
    4291695616,
    4278198461,
    4292219904,
    4278206909,
    4292744192,
    4278215101,
    4293334016,
    4278223549,
    4293858304,
    4278231741,
    4294382592,
    4278240189,
    4294906880,
    4278248381,
    4278196224,
    4278190278,
    4278720512,
    4278198470,
    4279244800,
    4278206918,
    4279769088,
    4278215110,
    4280358912,
    4278223558,
    4280883200,
    4278231750,
    4281407488,
    4278240198,
    4281931776,
    4278248390,
    4282521600,
    4278190286,
    4283045888,
    4278198478,
    4283570176,
    4278206926,
    4284094464,
    4278215118,
    4284684288,
    4278223566,
    4285208576,
    4278231758,
    4285732864,
    4278240206,
    4286257152,
    4278248398,
    4286846976,
    4278190294,
    4287371264,
    4278198486,
    4287895552,
    4278206934,
    4288419840,
    4278215126,
    4289009664,
    4278223574,
    4289533952,
    4278231766,
    4290058240,
    4278240214,
    4290582528,
    4278248406,
    4291172352,
    4278190302,
    4291696640,
    4278198494,
    4292220928,
    4278206942,
    4292745216,
    4278215134,
    4293335040,
    4278223582,
    4293859328,
    4278231774,
    4294383616,
    4278240222,
    4294907904,
    4278248414,
    4278197248,
    4278190311,
    4278721536,
    4278198503,
    4279245824,
    4278206951,
    4279770112,
    4278215143,
    4280359936,
    4278223591,
    4280884224,
    4278231783,
    4281408512,
    4278240231,
    4281932800,
    4278248423,
    4282522624,
    4278190319,
    4283046912,
    4278198511,
    4283571200,
    4278206959,
    4284095488,
    4278215151,
    4284685312,
    4278223599,
    4285209600,
    4278231791,
    4285733888,
    4278240239,
    4286258176,
    4278248431,
    4286848000,
    4278190327,
    4287372288,
    4278198519,
    4287896576,
    4278206967,
    4288420864,
    4278215159,
    4289010688,
    4278223607,
    4289534976,
    4278231799,
    4290059264,
    4278240247,
    4290583552,
    4278248439,
    4291173376,
    4278190335,
    4291697664,
    4278198527,
    4292221952,
    4278206975,
    4292746240,
    4278215167,
    4293336064,
    4278223615,
    4293860352,
    4278231807,
    4294384640,
    4278240255,
    4294908928,
    4278248447,
};
pub fn Blit_RGB565_ABGR8888(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Blit_RGB565_32(info, @ptrCast(@alignCast(&RGB565_ABGR8888_LUT)));
}
pub const RGB565_RGBA8888_LUT: [512]Uint32 = [512]Uint32{
    255,
    255,
    2303,
    2097407,
    4351,
    4260095,
    6399,
    6357247,
    8703,
    8519935,
    10751,
    10617087,
    12799,
    12779775,
    14847,
    14876927,
    17151,
    134217983,
    19199,
    136315135,
    21247,
    138477823,
    23295,
    140574975,
    25599,
    142737663,
    27647,
    144834815,
    29695,
    146997503,
    31743,
    149094655,
    34047,
    268435711,
    36095,
    270532863,
    38143,
    272695551,
    40191,
    274792703,
    42495,
    276955391,
    44543,
    279052543,
    46591,
    281215231,
    48639,
    283312383,
    50943,
    402653439,
    52991,
    404750591,
    55039,
    406913279,
    57087,
    409010431,
    59391,
    411173119,
    61439,
    413270271,
    63487,
    415432959,
    65535,
    417530111,
    262399,
    553648383,
    264447,
    555745535,
    266495,
    557908223,
    268543,
    560005375,
    270847,
    562168063,
    272895,
    564265215,
    274943,
    566427903,
    276991,
    568525055,
    279295,
    687866111,
    281343,
    689963263,
    283391,
    692125951,
    285439,
    694223103,
    287743,
    696385791,
    289791,
    698482943,
    291839,
    700645631,
    293887,
    702742783,
    296191,
    822083839,
    298239,
    824180991,
    300287,
    826343679,
    302335,
    828440831,
    304639,
    830603519,
    306687,
    832700671,
    308735,
    834863359,
    310783,
    836960511,
    313087,
    956301567,
    315135,
    958398719,
    317183,
    960561407,
    319231,
    962658559,
    321535,
    964821247,
    323583,
    966918399,
    325631,
    969081087,
    327679,
    971178239,
    524543,
    1107296511,
    526591,
    1109393663,
    528639,
    1111556351,
    530687,
    1113653503,
    532991,
    1115816191,
    535039,
    1117913343,
    537087,
    1120076031,
    539135,
    1122173183,
    541439,
    1241514239,
    543487,
    1243611391,
    545535,
    1245774079,
    547583,
    1247871231,
    549887,
    1250033919,
    551935,
    1252131071,
    553983,
    1254293759,
    556031,
    1256390911,
    558335,
    1375731967,
    560383,
    1377829119,
    562431,
    1379991807,
    564479,
    1382088959,
    566783,
    1384251647,
    568831,
    1386348799,
    570879,
    1388511487,
    572927,
    1390608639,
    575231,
    1509949695,
    577279,
    1512046847,
    579327,
    1514209535,
    581375,
    1516306687,
    583679,
    1518469375,
    585727,
    1520566527,
    587775,
    1522729215,
    589823,
    1524826367,
    786687,
    1660944639,
    788735,
    1663041791,
    790783,
    1665204479,
    792831,
    1667301631,
    795135,
    1669464319,
    797183,
    1671561471,
    799231,
    1673724159,
    801279,
    1675821311,
    803583,
    1795162367,
    805631,
    1797259519,
    807679,
    1799422207,
    809727,
    1801519359,
    812031,
    1803682047,
    814079,
    1805779199,
    816127,
    1807941887,
    818175,
    1810039039,
    820479,
    1929380095,
    822527,
    1931477247,
    824575,
    1933639935,
    826623,
    1935737087,
    828927,
    1937899775,
    830975,
    1939996927,
    833023,
    1942159615,
    835071,
    1944256767,
    837375,
    2063597823,
    839423,
    2065694975,
    841471,
    2067857663,
    843519,
    2069954815,
    845823,
    2072117503,
    847871,
    2074214655,
    849919,
    2076377343,
    851967,
    2078474495,
    1048831,
    2214592767,
    1050879,
    2216689919,
    1052927,
    2218852607,
    1054975,
    2220949759,
    1057279,
    2223112447,
    1059327,
    2225209599,
    1061375,
    2227372287,
    1063423,
    2229469439,
    1065727,
    2348810495,
    1067775,
    2350907647,
    1069823,
    2353070335,
    1071871,
    2355167487,
    1074175,
    2357330175,
    1076223,
    2359427327,
    1078271,
    2361590015,
    1080319,
    2363687167,
    1082623,
    2483028223,
    1084671,
    2485125375,
    1086719,
    2487288063,
    1088767,
    2489385215,
    1091071,
    2491547903,
    1093119,
    2493645055,
    1095167,
    2495807743,
    1097215,
    2497904895,
    1099519,
    2617245951,
    1101567,
    2619343103,
    1103615,
    2621505791,
    1105663,
    2623602943,
    1107967,
    2625765631,
    1110015,
    2627862783,
    1112063,
    2630025471,
    1114111,
    2632122623,
    1310975,
    2768240895,
    1313023,
    2770338047,
    1315071,
    2772500735,
    1317119,
    2774597887,
    1319423,
    2776760575,
    1321471,
    2778857727,
    1323519,
    2781020415,
    1325567,
    2783117567,
    1327871,
    2902458623,
    1329919,
    2904555775,
    1331967,
    2906718463,
    1334015,
    2908815615,
    1336319,
    2910978303,
    1338367,
    2913075455,
    1340415,
    2915238143,
    1342463,
    2917335295,
    1344767,
    3036676351,
    1346815,
    3038773503,
    1348863,
    3040936191,
    1350911,
    3043033343,
    1353215,
    3045196031,
    1355263,
    3047293183,
    1357311,
    3049455871,
    1359359,
    3051553023,
    1361663,
    3170894079,
    1363711,
    3172991231,
    1365759,
    3175153919,
    1367807,
    3177251071,
    1370111,
    3179413759,
    1372159,
    3181510911,
    1374207,
    3183673599,
    1376255,
    3185770751,
    1573119,
    3321889023,
    1575167,
    3323986175,
    1577215,
    3326148863,
    1579263,
    3328246015,
    1581567,
    3330408703,
    1583615,
    3332505855,
    1585663,
    3334668543,
    1587711,
    3336765695,
    1590015,
    3456106751,
    1592063,
    3458203903,
    1594111,
    3460366591,
    1596159,
    3462463743,
    1598463,
    3464626431,
    1600511,
    3466723583,
    1602559,
    3468886271,
    1604607,
    3470983423,
    1606911,
    3590324479,
    1608959,
    3592421631,
    1611007,
    3594584319,
    1613055,
    3596681471,
    1615359,
    3598844159,
    1617407,
    3600941311,
    1619455,
    3603103999,
    1621503,
    3605201151,
    1623807,
    3724542207,
    1625855,
    3726639359,
    1627903,
    3728802047,
    1629951,
    3730899199,
    1632255,
    3733061887,
    1634303,
    3735159039,
    1636351,
    3737321727,
    1638399,
    3739418879,
    1835263,
    3875537151,
    1837311,
    3877634303,
    1839359,
    3879796991,
    1841407,
    3881894143,
    1843711,
    3884056831,
    1845759,
    3886153983,
    1847807,
    3888316671,
    1849855,
    3890413823,
    1852159,
    4009754879,
    1854207,
    4011852031,
    1856255,
    4014014719,
    1858303,
    4016111871,
    1860607,
    4018274559,
    1862655,
    4020371711,
    1864703,
    4022534399,
    1866751,
    4024631551,
    1869055,
    4143972607,
    1871103,
    4146069759,
    1873151,
    4148232447,
    1875199,
    4150329599,
    1877503,
    4152492287,
    1879551,
    4154589439,
    1881599,
    4156752127,
    1883647,
    4158849279,
    1885951,
    4278190335,
    1887999,
    4280287487,
    1890047,
    4282450175,
    1892095,
    4284547327,
    1894399,
    4286710015,
    1896447,
    4288807167,
    1898495,
    4290969855,
    1900543,
    4293067007,
};
pub fn Blit_RGB565_RGBA8888(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Blit_RGB565_32(info, @ptrCast(@alignCast(&RGB565_RGBA8888_LUT)));
}
pub const RGB565_BGRA8888_LUT: [512]Uint32 = [512]Uint32{
    255,
    255,
    134217983,
    2097407,
    268435711,
    4260095,
    402653439,
    6357247,
    553648383,
    8519935,
    687866111,
    10617087,
    822083839,
    12779775,
    956301567,
    14876927,
    1107296511,
    2303,
    1241514239,
    2099455,
    1375731967,
    4262143,
    1509949695,
    6359295,
    1660944639,
    8521983,
    1795162367,
    10619135,
    1929380095,
    12781823,
    2063597823,
    14878975,
    2214592767,
    4351,
    2348810495,
    2101503,
    2483028223,
    4264191,
    2617245951,
    6361343,
    2768240895,
    8524031,
    2902458623,
    10621183,
    3036676351,
    12783871,
    3170894079,
    14881023,
    3321889023,
    6399,
    3456106751,
    2103551,
    3590324479,
    4266239,
    3724542207,
    6363391,
    3875537151,
    8526079,
    4009754879,
    10623231,
    4143972607,
    12785919,
    4278190335,
    14883071,
    262399,
    8703,
    134480127,
    2105855,
    268697855,
    4268543,
    402915583,
    6365695,
    553910527,
    8528383,
    688128255,
    10625535,
    822345983,
    12788223,
    956563711,
    14885375,
    1107558655,
    10751,
    1241776383,
    2107903,
    1375994111,
    4270591,
    1510211839,
    6367743,
    1661206783,
    8530431,
    1795424511,
    10627583,
    1929642239,
    12790271,
    2063859967,
    14887423,
    2214854911,
    12799,
    2349072639,
    2109951,
    2483290367,
    4272639,
    2617508095,
    6369791,
    2768503039,
    8532479,
    2902720767,
    10629631,
    3036938495,
    12792319,
    3171156223,
    14889471,
    3322151167,
    14847,
    3456368895,
    2111999,
    3590586623,
    4274687,
    3724804351,
    6371839,
    3875799295,
    8534527,
    4010017023,
    10631679,
    4144234751,
    12794367,
    4278452479,
    14891519,
    524543,
    17151,
    134742271,
    2114303,
    268959999,
    4276991,
    403177727,
    6374143,
    554172671,
    8536831,
    688390399,
    10633983,
    822608127,
    12796671,
    956825855,
    14893823,
    1107820799,
    19199,
    1242038527,
    2116351,
    1376256255,
    4279039,
    1510473983,
    6376191,
    1661468927,
    8538879,
    1795686655,
    10636031,
    1929904383,
    12798719,
    2064122111,
    14895871,
    2215117055,
    21247,
    2349334783,
    2118399,
    2483552511,
    4281087,
    2617770239,
    6378239,
    2768765183,
    8540927,
    2902982911,
    10638079,
    3037200639,
    12800767,
    3171418367,
    14897919,
    3322413311,
    23295,
    3456631039,
    2120447,
    3590848767,
    4283135,
    3725066495,
    6380287,
    3876061439,
    8542975,
    4010279167,
    10640127,
    4144496895,
    12802815,
    4278714623,
    14899967,
    786687,
    25599,
    135004415,
    2122751,
    269222143,
    4285439,
    403439871,
    6382591,
    554434815,
    8545279,
    688652543,
    10642431,
    822870271,
    12805119,
    957087999,
    14902271,
    1108082943,
    27647,
    1242300671,
    2124799,
    1376518399,
    4287487,
    1510736127,
    6384639,
    1661731071,
    8547327,
    1795948799,
    10644479,
    1930166527,
    12807167,
    2064384255,
    14904319,
    2215379199,
    29695,
    2349596927,
    2126847,
    2483814655,
    4289535,
    2618032383,
    6386687,
    2769027327,
    8549375,
    2903245055,
    10646527,
    3037462783,
    12809215,
    3171680511,
    14906367,
    3322675455,
    31743,
    3456893183,
    2128895,
    3591110911,
    4291583,
    3725328639,
    6388735,
    3876323583,
    8551423,
    4010541311,
    10648575,
    4144759039,
    12811263,
    4278976767,
    14908415,
    1048831,
    34047,
    135266559,
    2131199,
    269484287,
    4293887,
    403702015,
    6391039,
    554696959,
    8553727,
    688914687,
    10650879,
    823132415,
    12813567,
    957350143,
    14910719,
    1108345087,
    36095,
    1242562815,
    2133247,
    1376780543,
    4295935,
    1510998271,
    6393087,
    1661993215,
    8555775,
    1796210943,
    10652927,
    1930428671,
    12815615,
    2064646399,
    14912767,
    2215641343,
    38143,
    2349859071,
    2135295,
    2484076799,
    4297983,
    2618294527,
    6395135,
    2769289471,
    8557823,
    2903507199,
    10654975,
    3037724927,
    12817663,
    3171942655,
    14914815,
    3322937599,
    40191,
    3457155327,
    2137343,
    3591373055,
    4300031,
    3725590783,
    6397183,
    3876585727,
    8559871,
    4010803455,
    10657023,
    4145021183,
    12819711,
    4279238911,
    14916863,
    1310975,
    42495,
    135528703,
    2139647,
    269746431,
    4302335,
    403964159,
    6399487,
    554959103,
    8562175,
    689176831,
    10659327,
    823394559,
    12822015,
    957612287,
    14919167,
    1108607231,
    44543,
    1242824959,
    2141695,
    1377042687,
    4304383,
    1511260415,
    6401535,
    1662255359,
    8564223,
    1796473087,
    10661375,
    1930690815,
    12824063,
    2064908543,
    14921215,
    2215903487,
    46591,
    2350121215,
    2143743,
    2484338943,
    4306431,
    2618556671,
    6403583,
    2769551615,
    8566271,
    2903769343,
    10663423,
    3037987071,
    12826111,
    3172204799,
    14923263,
    3323199743,
    48639,
    3457417471,
    2145791,
    3591635199,
    4308479,
    3725852927,
    6405631,
    3876847871,
    8568319,
    4011065599,
    10665471,
    4145283327,
    12828159,
    4279501055,
    14925311,
    1573119,
    50943,
    135790847,
    2148095,
    270008575,
    4310783,
    404226303,
    6407935,
    555221247,
    8570623,
    689438975,
    10667775,
    823656703,
    12830463,
    957874431,
    14927615,
    1108869375,
    52991,
    1243087103,
    2150143,
    1377304831,
    4312831,
    1511522559,
    6409983,
    1662517503,
    8572671,
    1796735231,
    10669823,
    1930952959,
    12832511,
    2065170687,
    14929663,
    2216165631,
    55039,
    2350383359,
    2152191,
    2484601087,
    4314879,
    2618818815,
    6412031,
    2769813759,
    8574719,
    2904031487,
    10671871,
    3038249215,
    12834559,
    3172466943,
    14931711,
    3323461887,
    57087,
    3457679615,
    2154239,
    3591897343,
    4316927,
    3726115071,
    6414079,
    3877110015,
    8576767,
    4011327743,
    10673919,
    4145545471,
    12836607,
    4279763199,
    14933759,
    1835263,
    59391,
    136052991,
    2156543,
    270270719,
    4319231,
    404488447,
    6416383,
    555483391,
    8579071,
    689701119,
    10676223,
    823918847,
    12838911,
    958136575,
    14936063,
    1109131519,
    61439,
    1243349247,
    2158591,
    1377566975,
    4321279,
    1511784703,
    6418431,
    1662779647,
    8581119,
    1796997375,
    10678271,
    1931215103,
    12840959,
    2065432831,
    14938111,
    2216427775,
    63487,
    2350645503,
    2160639,
    2484863231,
    4323327,
    2619080959,
    6420479,
    2770075903,
    8583167,
    2904293631,
    10680319,
    3038511359,
    12843007,
    3172729087,
    14940159,
    3323724031,
    65535,
    3457941759,
    2162687,
    3592159487,
    4325375,
    3726377215,
    6422527,
    3877372159,
    8585215,
    4011589887,
    10682367,
    4145807615,
    12845055,
    4280025343,
    14942207,
};
pub fn Blit_RGB565_BGRA8888(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Blit_RGB565_32(info, @ptrCast(@alignCast(&RGB565_BGRA8888_LUT)));
}
pub fn Blit2to2MaskAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint16 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var mask: Uint16 = undefined;
    _ = &mask;
    var n: c_int = undefined;
    _ = &n;
    var mask_1: Uint16 = undefined;
    _ = &mask_1;
    var n_2: c_int = undefined;
    _ = &n_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip;
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                if (dstfmt.*.Amask != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                mask = @truncate((@as(Uint32, info.*.a) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                mask_1 = @truncate((srcfmt.*.Rmask | srcfmt.*.Gmask) | srcfmt.*.Bmask);
                {
                    sdl_pc = 19;
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
                n = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 18;
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
                src = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
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
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
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
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) | @as(c_int, mask))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                n_2 = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            22 => {
                src = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
                {
                    sdl_pc = 19;
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
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                if ((blk: {
                    const ref = &n_2;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                dst.* = @bitCast(@as(c_short, @truncate(@as(c_int, src.*) & @as(c_int, mask_1))));
                dst += 1;
                src += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit4to4MaskAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint32 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dst: [*c]Uint32 = undefined;
    _ = &dst;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var mask: Uint32 = undefined;
    _ = &mask;
    var n: c_int = undefined;
    _ = &n;
    var mask_1: Uint32 = undefined;
    _ = &mask_1;
    var n_2: c_int = undefined;
    _ = &n_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip;
                dst = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                if (dstfmt.*.Amask != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                mask = (@as(Uint32, info.*.a) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                mask_1 = (srcfmt.*.Rmask | srcfmt.*.Gmask) | srcfmt.*.Bmask;
                {
                    sdl_pc = 19;
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
                n = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 18;
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
                src = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
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
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
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
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                dst.* = src.* | mask;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                n_2 = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 33;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            22 => {
                src = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
                {
                    sdl_pc = 19;
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
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                if ((blk: {
                    const ref = &n_2;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            27 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                dst.* = src.* & mask_1;
                dst += 1;
                src += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn get_permutation(srcfmt: [*c]const SDL_PixelFormatDetails, dstfmt: [*c]const SDL_PixelFormatDetails, _p0: [*c]c_int, _p1: [*c]c_int, _p2: [*c]c_int, _p3: [*c]c_int, _alpha_channel: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var alpha_channel: c_int = 0;
    _ = &alpha_channel;
    var p0: c_int = undefined;
    _ = &p0;
    var p1: c_int = undefined;
    _ = &p1;
    var p2: c_int = undefined;
    _ = &p2;
    var p3: c_int = undefined;
    _ = &p3;
    var Pixel: c_int = 67305985;
    _ = &Pixel;
    if (srcfmt.*.Amask != 0) {
        {
            p0 = SDL_expand_byte[srcfmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
            p1 = SDL_expand_byte[srcfmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
            p2 = SDL_expand_byte[srcfmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
            p3 = SDL_expand_byte[srcfmt.*.Abits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
        }
    } else {
        {
            p0 = SDL_expand_byte[srcfmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
            p1 = SDL_expand_byte[srcfmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
            p2 = SDL_expand_byte[srcfmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, Pixel))) & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
        }
        p3 = 0;
    }
    if (dstfmt.*.Amask != 0) {
        if (srcfmt.*.Amask != 0) {
            {
                Pixel = ((((p0 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Rbits))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((p1 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Gbits))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((p2 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Bbits))) << @intCast(@as(c_int, dstfmt.*.Bshift)))) | ((p3 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Abits))) << @intCast(@as(c_int, dstfmt.*.Ashift)));
            }
        } else {
            {
                Pixel = ((((p0 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Rbits))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((p1 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Gbits))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((p2 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Bbits))) << @intCast(@as(c_int, dstfmt.*.Bshift)))) | ((@as(c_int, 0) >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Abits))) << @intCast(@as(c_int, dstfmt.*.Ashift)));
            }
        }
    } else {
        {
            Pixel = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, (((p0 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Rbits))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((p1 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Gbits))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((p2 >> @intCast(@as(c_int, 8) - @as(c_int, dstfmt.*.Bbits))) << @intCast(@as(c_int, dstfmt.*.Bshift)))))) | dstfmt.*.Amask)));
        }
    }
    p0 = Pixel & @as(c_int, 255);
    p1 = (Pixel >> @intCast(@as(c_int, 8))) & @as(c_int, 255);
    p2 = (Pixel >> @intCast(@as(c_int, 16))) & @as(c_int, 255);
    p3 = (Pixel >> @intCast(@as(c_int, 24))) & @as(c_int, 255);
    if (p0 == @as(c_int, 0)) {
        p0 = 1;
        alpha_channel = 0;
    } else if (p1 == @as(c_int, 0)) {
        p1 = 1;
        alpha_channel = 1;
    } else if (p2 == @as(c_int, 0)) {
        p2 = 1;
        alpha_channel = 2;
    } else if (p3 == @as(c_int, 0)) {
        p3 = 1;
        alpha_channel = 3;
    }
    _p0.* = p0 - @as(c_int, 1);
    _p1.* = p1 - @as(c_int, 1);
    _p2.* = p2 - @as(c_int, 1);
    _p3.* = p3 - @as(c_int, 1);
    if (_alpha_channel != null) {
        _alpha_channel.* = alpha_channel;
    }
}
pub fn BlitNtoN(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var alpha_channel: c_int = undefined;
    _ = &alpha_channel;
    var p0: c_int = undefined;
    _ = &p0;
    var p1: c_int = undefined;
    _ = &p1;
    var p2: c_int = undefined;
    _ = &p2;
    var p3: c_int = undefined;
    _ = &p3;
    var n: c_int = undefined;
    _ = &n;
    var p0_1: c_int = undefined;
    _ = &p0_1;
    var p1_2: c_int = undefined;
    _ = &p1_2;
    var p2_3: c_int = undefined;
    _ = &p2_3;
    var p3_4: c_int = undefined;
    _ = &p3_4;
    var n_5: c_int = undefined;
    _ = &n_5;
    var alpha_channel_6: c_int = undefined;
    _ = &alpha_channel_6;
    var p0_7: c_int = undefined;
    _ = &p0_7;
    var p1_8: c_int = undefined;
    _ = &p1_8;
    var p2_9: c_int = undefined;
    _ = &p2_9;
    var p3_10: c_int = undefined;
    _ = &p3_10;
    var n_11: c_int = undefined;
    _ = &n_11;
    var n_12: c_int = undefined;
    _ = &n_12;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_13: Uint16 = undefined;
    _ = &_pixel_13;
    var _pixel_14: Uint32 = undefined;
    _ = &_pixel_14;
    var Pixel_15: Uint32 = undefined;
    _ = &Pixel_15;
    var sR_16: c_uint = undefined;
    _ = &sR_16;
    var sG_17: c_uint = undefined;
    _ = &sG_17;
    var sB_18: c_uint = undefined;
    _ = &sB_18;
    var _pixel_19: Uint8 = undefined;
    _ = &_pixel_19;
    var _pixel_20: Uint16 = undefined;
    _ = &_pixel_20;
    var _pixel_21: Uint32 = undefined;
    _ = &_pixel_21;
    var Pixel_22: Uint32 = undefined;
    _ = &Pixel_22;
    var sR_23: c_uint = undefined;
    _ = &sR_23;
    var sG_24: c_uint = undefined;
    _ = &sG_24;
    var sB_25: c_uint = undefined;
    _ = &sB_25;
    var _pixel_26: Uint8 = undefined;
    _ = &_pixel_26;
    var _pixel_27: Uint16 = undefined;
    _ = &_pixel_27;
    var _pixel_28: Uint32 = undefined;
    _ = &_pixel_28;
    var Pixel_29: Uint32 = undefined;
    _ = &Pixel_29;
    var sR_30: c_uint = undefined;
    _ = &sR_30;
    var sG_31: c_uint = undefined;
    _ = &sG_31;
    var sB_32: c_uint = undefined;
    _ = &sB_32;
    var _pixel_33: Uint8 = undefined;
    _ = &_pixel_33;
    var _pixel_34: Uint16 = undefined;
    _ = &_pixel_34;
    var _pixel_35: Uint32 = undefined;
    _ = &_pixel_35;
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
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstfmt = info.*.dst_fmt;
                dstbpp = dstfmt.*.bytes_per_pixel;
                alpha = @bitCast(@as(c_int, if (dstfmt.*.Amask != 0) @as(c_int, info.*.a) else @as(c_int, 0)));
                if ((((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 4))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                get_permutation(srcfmt, dstfmt, &p0, &p1, &p2, &p3, &alpha_channel);
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
                if (((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 3))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
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
                return;
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                get_permutation(srcfmt, dstfmt, &p0_1, &p1_2, &p2_3, &p3_4, null);
                {
                    sdl_pc = 18;
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
                if (((srcbpp == @as(c_int, 3)) and (dstbpp == @as(c_int, 4))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            18 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                n_5 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            20 => {
                return;
            },
            21 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_1)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_2)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if ((blk: {
                    const ref = &n_5;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_1)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_2)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_1)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_2)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_1)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_2)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                get_permutation(srcfmt, dstfmt, &p0_7, &p1_8, &p2_9, &p3_10, &alpha_channel_6);
                {
                    sdl_pc = 32;
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
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            32 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                n_11 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            34 => {
                return;
            },
            35 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 32;
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_7)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_8)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_9)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_10)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_6)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                if ((blk: {
                    const ref = &n_11;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            40 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_7)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_8)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_9)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_10)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_6)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_7)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_8)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_9)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_10)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_6)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_7)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_8)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_9)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_10)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_6)))] = @truncate(alpha);
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            43 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                n_12 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 95;
                        continue;
                    },
                    else => {
                        sdl_pc = 46;
                        continue;
                    },
                }
            },
            45 => {
                {}
            },
            46 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 43;
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
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            49 => {
                if ((blk: {
                    const ref = &n_12;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 46;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 64;
                        continue;
                    },
                    else => {
                        sdl_pc = 60;
                        continue;
                    },
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
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            61 => {
                _pixel = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            62 => {
                _pixel_13 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_13;
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            63 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            64 => {
                _pixel_14 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_14;
                {
                    sdl_pc = 60;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 73;
                        continue;
                    },
                    else => {
                        sdl_pc = 74;
                        continue;
                    },
                }
            },
            67 => {
                if (false) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 79;
                        continue;
                    },
                    else => {
                        sdl_pc = 75;
                        continue;
                    },
                }
            },
            69 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            70 => {
                Pixel_15 = src.*;
                sR_16 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_15 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_17 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_15 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_18 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_15 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            71 => {
                Pixel_15 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR_16 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_15 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_17 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_15 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_18 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_15 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            72 => {
                Pixel_15 = 0;
                sR_16 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG_17 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB_18 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            73 => {
                Pixel_15 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR_16 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_15 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_17 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_15 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_18 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_15 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            74 => {
                Pixel_15 = 0;
                sR_16 = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB_18 = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG_17 = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            75 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            76 => {
                _pixel_19 = @truncate(((((sR_16 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_17 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_18 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_19;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            77 => {
                _pixel_20 = @truncate(((((sR_16 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_17 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_18 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_20;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            78 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_16);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_17);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_18);
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                _pixel_21 = ((((sR_16 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_17 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_18 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_21;
                {
                    sdl_pc = 75;
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
                switch (srcbpp) {
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
                        sdl_pc = 89;
                        continue;
                    },
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 94;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            84 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            85 => {
                Pixel_22 = src.*;
                sR_23 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_22 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_24 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_22 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_25 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_22 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            86 => {
                Pixel_22 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR_23 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_22 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_24 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_22 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_25 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_22 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            87 => {
                Pixel_22 = 0;
                sR_23 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG_24 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB_25 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            88 => {
                Pixel_22 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR_23 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_22 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_24 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_22 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_25 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_22 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            89 => {
                Pixel_22 = 0;
                sR_23 = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB_25 = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG_24 = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            90 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            91 => {
                _pixel_26 = @truncate(((((sR_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_26;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            92 => {
                _pixel_27 = @truncate(((((sR_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_27;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            93 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_23);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_24);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_25);
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            94 => {
                _pixel_28 = ((((sR_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_28;
                {
                    sdl_pc = 90;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 103;
                        continue;
                    },
                    else => {
                        sdl_pc = 104;
                        continue;
                    },
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 106;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 108;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 109;
                        continue;
                    },
                    else => {
                        sdl_pc = 105;
                        continue;
                    },
                }
            },
            99 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            100 => {
                Pixel_29 = src.*;
                sR_30 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_29 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_31 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_29 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_32 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_29 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            101 => {
                Pixel_29 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR_30 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_29 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_31 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_29 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_32 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_29 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            102 => {
                Pixel_29 = 0;
                sR_30 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG_31 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB_32 = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            103 => {
                Pixel_29 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR_30 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_29 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_31 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_29 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_32 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_29 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            104 => {
                Pixel_29 = 0;
                sR_30 = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(c_uint, 0);
                        sB_32 = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    sG_31 = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            105 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            106 => {
                _pixel_33 = @truncate(((((sR_30 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_31 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_33;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            107 => {
                _pixel_34 = @truncate(((((sR_30 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_31 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_34;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            108 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_30);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_31);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_32);
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            109 => {
                _pixel_35 = ((((sR_30 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_31 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_35;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNtoNCopyAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var c: c_int = undefined;
    _ = &c;
    var p0: c_int = undefined;
    _ = &p0;
    var p1: c_int = undefined;
    _ = &p1;
    var p2: c_int = undefined;
    _ = &p2;
    var p3: c_int = undefined;
    _ = &p3;
    var n: c_int = undefined;
    _ = &n;
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
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_1: Uint16 = undefined;
    _ = &_pixel_1;
    var _pixel_2: Uint32 = undefined;
    _ = &_pixel_2;
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
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstfmt = info.*.dst_fmt;
                dstbpp = dstfmt.*.bytes_per_pixel;
                if ((((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 4))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                get_permutation(srcfmt, dstfmt, &p0, &p1, &p2, &p3, null);
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
                {
                    sdl_pc = 15;
                    continue;
                }
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
                return;
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                c = width;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {}
            },
            18 => {
                if (c != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                c -= 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            22 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 30;
                        continue;
                    },
                }
            },
            23 => {
                if (false) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 35;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
                        continue;
                    },
                }
            },
            25 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
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
                    sdl_pc = 25;
                    continue;
                }
            },
            31 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            32 => {
                _pixel = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            33 => {
                _pixel_1 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                _pixel_2 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_2;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit2to2Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var n: c_int = undefined;
    _ = &n;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                srcp = @ptrCast(@alignCast(info.*.src));
                srcskip = info.*.src_skip;
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip;
                ckey = info.*.colorkey;
                rgbmask = ~info.*.src_fmt.*.Amask;
                {
                    const ref = &srcskip;
                    ref.* = @divTrunc(ref.*, @as(c_int, 2));
                }
                {
                    const ref = &dstskip;
                    ref.* = @divTrunc(ref.*, @as(c_int, 2));
                }
                ckey &= rgbmask;
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
                n = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 36;
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
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
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
                dstp.* = srcp.*;
                {
                    sdl_pc = 11;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                dstp.* = srcp.*;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                dstp.* = srcp.*;
                {
                    sdl_pc = 19;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                dstp.* = srcp.*;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                dstp.* = srcp.*;
                {
                    sdl_pc = 27;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                dstp.* = srcp.*;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                dstp.* = srcp.*;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                if ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcp.*)))) & rgbmask) != ckey) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                dstp.* = srcp.*;
                {
                    sdl_pc = 39;
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
                dstp += 1;
                srcp += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNtoNKey(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var alpha: c_uint = undefined;
    _ = &alpha;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var sfmt: c_int = undefined;
    _ = &sfmt;
    var dfmt: c_int = undefined;
    _ = &dfmt;
    var src32: [*c]Uint32 = undefined;
    _ = &src32;
    var dst32: [*c]Uint32 = undefined;
    _ = &dst32;
    var mask: Uint32 = undefined;
    _ = &mask;
    var n: c_int = undefined;
    _ = &n;
    var mask_1: Uint32 = undefined;
    _ = &mask_1;
    var n_2: c_int = undefined;
    _ = &n_2;
    var alpha_channel: c_int = undefined;
    _ = &alpha_channel;
    var p0: c_int = undefined;
    _ = &p0;
    var p1: c_int = undefined;
    _ = &p1;
    var p2: c_int = undefined;
    _ = &p2;
    var p3: c_int = undefined;
    _ = &p3;
    var n_3: c_int = undefined;
    _ = &n_3;
    var src32_4: [*c]Uint32 = undefined;
    _ = &src32_4;
    var src32_5: [*c]Uint32 = undefined;
    _ = &src32_5;
    var src32_6: [*c]Uint32 = undefined;
    _ = &src32_6;
    var src32_7: [*c]Uint32 = undefined;
    _ = &src32_7;
    var k0: Uint8 = undefined;
    _ = &k0;
    var k1: Uint8 = undefined;
    _ = &k1;
    var k2: Uint8 = undefined;
    _ = &k2;
    var n_8: c_int = undefined;
    _ = &n_8;
    var s0: Uint8 = undefined;
    _ = &s0;
    var s1: Uint8 = undefined;
    _ = &s1;
    var s2: Uint8 = undefined;
    _ = &s2;
    var s0_9: Uint8 = undefined;
    _ = &s0_9;
    var s1_10: Uint8 = undefined;
    _ = &s1_10;
    var s2_11: Uint8 = undefined;
    _ = &s2_11;
    var s0_12: Uint8 = undefined;
    _ = &s0_12;
    var s1_13: Uint8 = undefined;
    _ = &s1_13;
    var s2_14: Uint8 = undefined;
    _ = &s2_14;
    var s0_15: Uint8 = undefined;
    _ = &s0_15;
    var s1_16: Uint8 = undefined;
    _ = &s1_16;
    var s2_17: Uint8 = undefined;
    _ = &s2_17;
    var k0_18: Uint8 = undefined;
    _ = &k0_18;
    var k1_19: Uint8 = undefined;
    _ = &k1_19;
    var k2_20: Uint8 = undefined;
    _ = &k2_20;
    var n_21: c_int = undefined;
    _ = &n_21;
    var s0_22: Uint8 = undefined;
    _ = &s0_22;
    var s1_23: Uint8 = undefined;
    _ = &s1_23;
    var s2_24: Uint8 = undefined;
    _ = &s2_24;
    var s0_25: Uint8 = undefined;
    _ = &s0_25;
    var s1_26: Uint8 = undefined;
    _ = &s1_26;
    var s2_27: Uint8 = undefined;
    _ = &s2_27;
    var s0_28: Uint8 = undefined;
    _ = &s0_28;
    var s1_29: Uint8 = undefined;
    _ = &s1_29;
    var s2_30: Uint8 = undefined;
    _ = &s2_30;
    var s0_31: Uint8 = undefined;
    _ = &s0_31;
    var s1_32: Uint8 = undefined;
    _ = &s1_32;
    var s2_33: Uint8 = undefined;
    _ = &s2_33;
    var p0_34: c_int = undefined;
    _ = &p0_34;
    var p1_35: c_int = undefined;
    _ = &p1_35;
    var p2_36: c_int = undefined;
    _ = &p2_36;
    var p3_37: c_int = undefined;
    _ = &p3_37;
    var n_38: c_int = undefined;
    _ = &n_38;
    var src32_39: [*c]Uint32 = undefined;
    _ = &src32_39;
    var src32_40: [*c]Uint32 = undefined;
    _ = &src32_40;
    var src32_41: [*c]Uint32 = undefined;
    _ = &src32_41;
    var src32_42: [*c]Uint32 = undefined;
    _ = &src32_42;
    var k0_43: Uint8 = undefined;
    _ = &k0_43;
    var k1_44: Uint8 = undefined;
    _ = &k1_44;
    var k2_45: Uint8 = undefined;
    _ = &k2_45;
    var alpha_channel_46: c_int = undefined;
    _ = &alpha_channel_46;
    var p0_47: c_int = undefined;
    _ = &p0_47;
    var p1_48: c_int = undefined;
    _ = &p1_48;
    var p2_49: c_int = undefined;
    _ = &p2_49;
    var p3_50: c_int = undefined;
    _ = &p3_50;
    var n_51: c_int = undefined;
    _ = &n_51;
    var s0_52: Uint8 = undefined;
    _ = &s0_52;
    var s1_53: Uint8 = undefined;
    _ = &s1_53;
    var s2_54: Uint8 = undefined;
    _ = &s2_54;
    var s0_55: Uint8 = undefined;
    _ = &s0_55;
    var s1_56: Uint8 = undefined;
    _ = &s1_56;
    var s2_57: Uint8 = undefined;
    _ = &s2_57;
    var s0_58: Uint8 = undefined;
    _ = &s0_58;
    var s1_59: Uint8 = undefined;
    _ = &s1_59;
    var s2_60: Uint8 = undefined;
    _ = &s2_60;
    var s0_61: Uint8 = undefined;
    _ = &s0_61;
    var s1_62: Uint8 = undefined;
    _ = &s1_62;
    var s2_63: Uint8 = undefined;
    _ = &s2_63;
    var n_64: c_int = undefined;
    _ = &n_64;
    var Pixel: Uint32 = undefined;
    _ = &Pixel;
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
    var B: [*c]Uint8 = undefined;
    _ = &B;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_65: Uint16 = undefined;
    _ = &_pixel_65;
    var _pixel_66: Uint32 = undefined;
    _ = &_pixel_66;
    var Pixel_67: Uint32 = undefined;
    _ = &Pixel_67;
    var sR_68: c_uint = undefined;
    _ = &sR_68;
    var sG_69: c_uint = undefined;
    _ = &sG_69;
    var sB_70: c_uint = undefined;
    _ = &sB_70;
    var B_71: [*c]Uint8 = undefined;
    _ = &B_71;
    var _pixel_72: Uint8 = undefined;
    _ = &_pixel_72;
    var _pixel_73: Uint16 = undefined;
    _ = &_pixel_73;
    var _pixel_74: Uint32 = undefined;
    _ = &_pixel_74;
    var Pixel_75: Uint32 = undefined;
    _ = &Pixel_75;
    var sR_76: c_uint = undefined;
    _ = &sR_76;
    var sG_77: c_uint = undefined;
    _ = &sG_77;
    var sB_78: c_uint = undefined;
    _ = &sB_78;
    var B_79: [*c]Uint8 = undefined;
    _ = &B_79;
    var _pixel_80: Uint8 = undefined;
    _ = &_pixel_80;
    var _pixel_81: Uint16 = undefined;
    _ = &_pixel_81;
    var _pixel_82: Uint32 = undefined;
    _ = &_pixel_82;
    var Pixel_83: Uint32 = undefined;
    _ = &Pixel_83;
    var sR_84: c_uint = undefined;
    _ = &sR_84;
    var sG_85: c_uint = undefined;
    _ = &sG_85;
    var sB_86: c_uint = undefined;
    _ = &sB_86;
    var B_87: [*c]Uint8 = undefined;
    _ = &B_87;
    var _pixel_88: Uint8 = undefined;
    _ = &_pixel_88;
    var _pixel_89: Uint16 = undefined;
    _ = &_pixel_89;
    var _pixel_90: Uint32 = undefined;
    _ = &_pixel_90;
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
                ckey = info.*.colorkey;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                alpha = @bitCast(@as(c_int, if (dstfmt.*.Amask != 0) @as(c_int, info.*.a) else @as(c_int, 0)));
                rgbmask = ~srcfmt.*.Amask;
                sfmt = @bitCast(srcfmt.*.format);
                dfmt = @bitCast(dstfmt.*.format);
                ckey &= rgbmask;
                if (((((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 4))) and (srcfmt.*.Rmask == dstfmt.*.Rmask)) and (srcfmt.*.Gmask == dstfmt.*.Gmask)) and (srcfmt.*.Bmask == dstfmt.*.Bmask)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                src32 = @ptrCast(@alignCast(src));
                dst32 = @ptrCast(@alignCast(dst));
                if (dstfmt.*.Amask != 0) {
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
                if ((((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 4))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            4 => {
                mask = @as(Uint32, info.*.a) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                mask_1 = (srcfmt.*.Rmask | srcfmt.*.Gmask) | srcfmt.*.Bmask;
                {
                    sdl_pc = 46;
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                n = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            9 => {
                return;
            },
            10 => {
                src32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src32))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst32))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
                {
                    sdl_pc = 7;
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
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 17;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                dst32.* = src32.* | mask;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 25;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 29;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 37;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                dst32.* = src32.* | mask;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                dst32.* = src32.* | mask;
                {
                    sdl_pc = 45;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            46 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                n_2 = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 81;
                        continue;
                    },
                    else => {
                        sdl_pc = 49;
                        continue;
                    },
                }
            },
            48 => {
                return;
            },
            49 => {
                src32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src32))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst32))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
                {
                    sdl_pc = 46;
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
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            52 => {
                if ((blk: {
                    const ref = &n_2;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            54 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 56;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 60;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                dst32.* = src32.* & mask_1;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                dst32.* = src32.* & mask_1;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            81 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                dst32.* = src32.* & mask_1;
                {
                    sdl_pc = 84;
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
                dst32 += 1;
                src32 += 1;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            85 => {
                get_permutation(srcfmt, dstfmt, &p0, &p1, &p2, &p3, &alpha_channel);
                {
                    sdl_pc = 88;
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
                if (((sfmt == SDL_PIXELFORMAT_RGB24) and (dfmt == SDL_PIXELFORMAT_RGB24)) or ((sfmt == SDL_PIXELFORMAT_BGR24) and (dfmt == SDL_PIXELFORMAT_BGR24))) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            88 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            89 => {
                n_3 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 107;
                        continue;
                    },
                    else => {
                        sdl_pc = 91;
                        continue;
                    },
                }
            },
            90 => {
                return;
            },
            91 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 88;
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
                src32_4 = @ptrCast(@alignCast(src));
                if ((src32_4.* & rgbmask) != ckey) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            94 => {
                if ((blk: {
                    const ref = &n_3;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
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
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                src32_5 = @ptrCast(@alignCast(src));
                if ((src32_5.* & rgbmask) != ckey) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                {
                    sdl_pc = 102;
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                src32_6 = @ptrCast(@alignCast(src));
                if ((src32_6.* & rgbmask) != ckey) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                src32_7 = @ptrCast(@alignCast(src));
                if ((src32_7.* & rgbmask) != ckey) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel)))] = @truncate(alpha);
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            111 => {
                k0 = @truncate(ckey & @as(Uint32, 255));
                k1 = @truncate((ckey >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
                k2 = @truncate((ckey >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                if (((sfmt == SDL_PIXELFORMAT_RGB24) and (dfmt == SDL_PIXELFORMAT_BGR24)) or ((sfmt == SDL_PIXELFORMAT_BGR24) and (dfmt == SDL_PIXELFORMAT_RGB24))) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            114 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                n_8 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 118;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 125;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 133;
                        continue;
                    },
                    else => {
                        sdl_pc = 117;
                        continue;
                    },
                }
            },
            116 => {
                return;
            },
            117 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                s0 = src[@as(c_int, 0)];
                s1 = src[@as(c_int, 1)];
                s2 = src[@as(c_int, 2)];
                if (((@as(c_int, k0) != @as(c_int, s0)) or (@as(c_int, k1) != @as(c_int, s1))) or (@as(c_int, k2) != @as(c_int, s2))) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            120 => {
                if ((blk: {
                    const ref = &n_8;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            122 => {
                dst[@as(c_int, 0)] = s0;
                dst[@as(c_int, 1)] = s1;
                dst[@as(c_int, 2)] = s2;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                s0_9 = src[@as(c_int, 0)];
                s1_10 = src[@as(c_int, 1)];
                s2_11 = src[@as(c_int, 2)];
                if (((@as(c_int, k0) != @as(c_int, s0_9)) or (@as(c_int, k1) != @as(c_int, s1_10))) or (@as(c_int, k2) != @as(c_int, s2_11))) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                dst[@as(c_int, 0)] = s0_9;
                dst[@as(c_int, 1)] = s1_10;
                dst[@as(c_int, 2)] = s2_11;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            128 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
                s0_12 = src[@as(c_int, 0)];
                s1_13 = src[@as(c_int, 1)];
                s2_14 = src[@as(c_int, 2)];
                if (((@as(c_int, k0) != @as(c_int, s0_12)) or (@as(c_int, k1) != @as(c_int, s1_13))) or (@as(c_int, k2) != @as(c_int, s2_14))) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                dst[@as(c_int, 0)] = s0_12;
                dst[@as(c_int, 1)] = s1_13;
                dst[@as(c_int, 2)] = s2_14;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                s0_15 = src[@as(c_int, 0)];
                s1_16 = src[@as(c_int, 1)];
                s2_17 = src[@as(c_int, 2)];
                if (((@as(c_int, k0) != @as(c_int, s0_15)) or (@as(c_int, k1) != @as(c_int, s1_16))) or (@as(c_int, k2) != @as(c_int, s2_17))) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            134 => {
                dst[@as(c_int, 0)] = s0_15;
                dst[@as(c_int, 1)] = s1_16;
                dst[@as(c_int, 2)] = s2_17;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            137 => {
                k0_18 = @truncate(ckey & @as(Uint32, 255));
                k1_19 = @truncate((ckey >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
                k2_20 = @truncate((ckey >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                if (((srcbpp == @as(c_int, 4)) and (dstbpp == @as(c_int, 3))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 163;
                    continue;
                } else {
                    sdl_pc = 164;
                    continue;
                }
            },
            140 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                n_21 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 155;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 159;
                        continue;
                    },
                    else => {
                        sdl_pc = 143;
                        continue;
                    },
                }
            },
            142 => {
                return;
            },
            143 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 140;
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
                s0_22 = src[@as(c_int, 0)];
                s1_23 = src[@as(c_int, 1)];
                s2_24 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_18) != @as(c_int, s0_22)) or (@as(c_int, k1_19) != @as(c_int, s1_23))) or (@as(c_int, k2_20) != @as(c_int, s2_24))) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            146 => {
                if ((blk: {
                    const ref = &n_21;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 145;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            148 => {
                dst[@as(c_int, 0)] = s2_24;
                dst[@as(c_int, 1)] = s1_23;
                dst[@as(c_int, 2)] = s0_22;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            150 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                s0_25 = src[@as(c_int, 0)];
                s1_26 = src[@as(c_int, 1)];
                s2_27 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_18) != @as(c_int, s0_25)) or (@as(c_int, k1_19) != @as(c_int, s1_26))) or (@as(c_int, k2_20) != @as(c_int, s2_27))) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                dst[@as(c_int, 0)] = s2_27;
                dst[@as(c_int, 1)] = s1_26;
                dst[@as(c_int, 2)] = s0_25;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            155 => {
                s0_28 = src[@as(c_int, 0)];
                s1_29 = src[@as(c_int, 1)];
                s2_30 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_18) != @as(c_int, s0_28)) or (@as(c_int, k1_19) != @as(c_int, s1_29))) or (@as(c_int, k2_20) != @as(c_int, s2_30))) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                dst[@as(c_int, 0)] = s2_30;
                dst[@as(c_int, 1)] = s1_29;
                dst[@as(c_int, 2)] = s0_28;
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            157 => {
                {
                    sdl_pc = 158;
                    continue;
                }
            },
            158 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            159 => {
                s0_31 = src[@as(c_int, 0)];
                s1_32 = src[@as(c_int, 1)];
                s2_33 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_18) != @as(c_int, s0_31)) or (@as(c_int, k1_19) != @as(c_int, s1_32))) or (@as(c_int, k2_20) != @as(c_int, s2_33))) {
                    sdl_pc = 160;
                    continue;
                } else {
                    sdl_pc = 161;
                    continue;
                }
            },
            160 => {
                dst[@as(c_int, 0)] = s2_33;
                dst[@as(c_int, 1)] = s1_32;
                dst[@as(c_int, 2)] = s0_31;
                {
                    sdl_pc = 162;
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            163 => {
                get_permutation(srcfmt, dstfmt, &p0_34, &p1_35, &p2_36, &p3_37, null);
                {
                    sdl_pc = 166;
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
                if (((srcbpp == @as(c_int, 3)) and (dstbpp == @as(c_int, 4))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 189;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            166 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 167;
                    continue;
                } else {
                    sdl_pc = 168;
                    continue;
                }
            },
            167 => {
                n_38 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 170;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 177;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 181;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 185;
                        continue;
                    },
                    else => {
                        sdl_pc = 169;
                        continue;
                    },
                }
            },
            168 => {
                return;
            },
            169 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            170 => {
                {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                src32_39 = @ptrCast(@alignCast(src));
                if ((src32_39.* & rgbmask) != ckey) {
                    sdl_pc = 174;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            172 => {
                if ((blk: {
                    const ref = &n_38;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            174 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_34)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_35)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_36)))];
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            176 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                src32_40 = @ptrCast(@alignCast(src));
                if ((src32_40.* & rgbmask) != ckey) {
                    sdl_pc = 178;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            178 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_34)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_35)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_36)))];
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                src32_41 = @ptrCast(@alignCast(src));
                if ((src32_41.* & rgbmask) != ckey) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 183;
                    continue;
                }
            },
            182 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_34)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_35)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_36)))];
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            183 => {
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            184 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                src32_42 = @ptrCast(@alignCast(src));
                if ((src32_42.* & rgbmask) != ckey) {
                    sdl_pc = 186;
                    continue;
                } else {
                    sdl_pc = 187;
                    continue;
                }
            },
            186 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_34)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_35)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_36)))];
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            187 => {
                {
                    sdl_pc = 188;
                    continue;
                }
            },
            188 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            189 => {
                k0_43 = @truncate(ckey & @as(Uint32, 255));
                k1_44 = @truncate((ckey >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
                k2_45 = @truncate((ckey >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
                get_permutation(srcfmt, dstfmt, &p0_47, &p1_48, &p2_49, &p3_50, &alpha_channel_46);
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            190 => {
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            192 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 193;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            193 => {
                n_51 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 196;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 203;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 207;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 211;
                        continue;
                    },
                    else => {
                        sdl_pc = 195;
                        continue;
                    },
                }
            },
            194 => {
                return;
            },
            195 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            196 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            197 => {
                s0_52 = src[@as(c_int, 0)];
                s1_53 = src[@as(c_int, 1)];
                s2_54 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_43) != @as(c_int, s0_52)) or (@as(c_int, k1_44) != @as(c_int, s1_53))) or (@as(c_int, k2_45) != @as(c_int, s2_54))) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            198 => {
                if ((blk: {
                    const ref = &n_51;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 197;
                    continue;
                } else {
                    sdl_pc = 199;
                    continue;
                }
            },
            199 => {
                {
                    sdl_pc = 195;
                    continue;
                }
            },
            200 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_47)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_48)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_49)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_50)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_46)))] = @truncate(alpha);
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            201 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            202 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 203;
                    continue;
                }
            },
            203 => {
                s0_55 = src[@as(c_int, 0)];
                s1_56 = src[@as(c_int, 1)];
                s2_57 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_43) != @as(c_int, s0_55)) or (@as(c_int, k1_44) != @as(c_int, s1_56))) or (@as(c_int, k2_45) != @as(c_int, s2_57))) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 205;
                    continue;
                }
            },
            204 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_47)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_48)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_49)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_50)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_46)))] = @truncate(alpha);
                {
                    sdl_pc = 206;
                    continue;
                }
            },
            205 => {
                {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            207 => {
                s0_58 = src[@as(c_int, 0)];
                s1_59 = src[@as(c_int, 1)];
                s2_60 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_43) != @as(c_int, s0_58)) or (@as(c_int, k1_44) != @as(c_int, s1_59))) or (@as(c_int, k2_45) != @as(c_int, s2_60))) {
                    sdl_pc = 208;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            208 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_47)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_48)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_49)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_50)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_46)))] = @truncate(alpha);
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 211;
                    continue;
                }
            },
            211 => {
                s0_61 = src[@as(c_int, 0)];
                s1_62 = src[@as(c_int, 1)];
                s2_63 = src[@as(c_int, 2)];
                if (((@as(c_int, k0_43) != @as(c_int, s0_61)) or (@as(c_int, k1_44) != @as(c_int, s1_62))) or (@as(c_int, k2_45) != @as(c_int, s2_63))) {
                    sdl_pc = 212;
                    continue;
                } else {
                    sdl_pc = 213;
                    continue;
                }
            },
            212 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0_47)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1_48)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2_49)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3_50)))];
                dst[@bitCast(@as(isize, @intCast(alpha_channel_46)))] = @truncate(alpha);
                {
                    sdl_pc = 214;
                    continue;
                }
            },
            213 => {
                {
                    sdl_pc = 214;
                    continue;
                }
            },
            214 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            215 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 216;
                    continue;
                } else {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                n_64 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 219;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 240;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 258;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 276;
                        continue;
                    },
                    else => {
                        sdl_pc = 218;
                        continue;
                    },
                }
            },
            217 => {
                {}
            },
            218 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            219 => {
                {
                    sdl_pc = 220;
                    continue;
                }
            },
            220 => {
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            221 => {
                if ((blk: {
                    const ref = &n_64;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            223 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 227;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 228;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 229;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 230;
                        continue;
                    },
                    else => {
                        sdl_pc = 231;
                        continue;
                    },
                }
            },
            224 => {
                if (false) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                if ((Pixel & rgbmask) != ckey) {
                    sdl_pc = 232;
                    continue;
                } else {
                    sdl_pc = 233;
                    continue;
                }
            },
            226 => {
                {
                    sdl_pc = 224;
                    continue;
                }
            },
            227 => {
                Pixel = src.*;
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            228 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            229 => {
                B = src;
                Pixel = @bitCast(@as(c_int, ((@as(c_int, B[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B[@as(c_int, 0)])));
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            230 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            231 => {
                Pixel = 0;
                {
                    sdl_pc = 226;
                    continue;
                }
            },
            232 => {
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 236;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 237;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 238;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 239;
                        continue;
                    },
                    else => {
                        sdl_pc = 235;
                        continue;
                    },
                }
            },
            233 => {
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            234 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            235 => {
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            236 => {
                _pixel = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            237 => {
                _pixel_65 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_65;
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            238 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            239 => {
                _pixel_66 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_66;
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            240 => {
                {
                    sdl_pc = 241;
                    continue;
                }
            },
            241 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 245;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 246;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 247;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 248;
                        continue;
                    },
                    else => {
                        sdl_pc = 249;
                        continue;
                    },
                }
            },
            242 => {
                if (false) {
                    sdl_pc = 241;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            243 => {
                if ((Pixel_67 & rgbmask) != ckey) {
                    sdl_pc = 250;
                    continue;
                } else {
                    sdl_pc = 251;
                    continue;
                }
            },
            244 => {
                {
                    sdl_pc = 242;
                    continue;
                }
            },
            245 => {
                Pixel_67 = src.*;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            246 => {
                Pixel_67 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            247 => {
                B_71 = src;
                Pixel_67 = @bitCast(@as(c_int, ((@as(c_int, B_71[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_71[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_71[@as(c_int, 0)])));
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            248 => {
                Pixel_67 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            249 => {
                Pixel_67 = 0;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            250 => {
                sR_68 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_67 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_69 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_67 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_70 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_67 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 254;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 255;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 256;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 257;
                        continue;
                    },
                    else => {
                        sdl_pc = 253;
                        continue;
                    },
                }
            },
            251 => {
                {
                    sdl_pc = 252;
                    continue;
                }
            },
            252 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 258;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 252;
                    continue;
                }
            },
            254 => {
                _pixel_72 = @truncate(((((sR_68 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_69 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_70 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_72;
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            255 => {
                _pixel_73 = @truncate(((((sR_68 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_69 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_70 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_73;
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            256 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_68);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_69);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_70);
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            257 => {
                _pixel_74 = ((((sR_68 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_69 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_70 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_74;
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            258 => {
                {
                    sdl_pc = 259;
                    continue;
                }
            },
            259 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 263;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 264;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 265;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 266;
                        continue;
                    },
                    else => {
                        sdl_pc = 267;
                        continue;
                    },
                }
            },
            260 => {
                if (false) {
                    sdl_pc = 259;
                    continue;
                } else {
                    sdl_pc = 261;
                    continue;
                }
            },
            261 => {
                if ((Pixel_75 & rgbmask) != ckey) {
                    sdl_pc = 268;
                    continue;
                } else {
                    sdl_pc = 269;
                    continue;
                }
            },
            262 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            263 => {
                Pixel_75 = src.*;
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            264 => {
                Pixel_75 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            265 => {
                B_79 = src;
                Pixel_75 = @bitCast(@as(c_int, ((@as(c_int, B_79[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_79[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_79[@as(c_int, 0)])));
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            266 => {
                Pixel_75 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            267 => {
                Pixel_75 = 0;
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            268 => {
                sR_76 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_75 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_77 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_75 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_78 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_75 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 272;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 273;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 274;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 275;
                        continue;
                    },
                    else => {
                        sdl_pc = 271;
                        continue;
                    },
                }
            },
            269 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            270 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 276;
                    continue;
                }
            },
            271 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            272 => {
                _pixel_80 = @truncate(((((sR_76 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_77 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_78 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_80;
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            273 => {
                _pixel_81 = @truncate(((((sR_76 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_77 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_78 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_81;
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            274 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_76);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_77);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_78);
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            275 => {
                _pixel_82 = ((((sR_76 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_77 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_78 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_82;
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            276 => {
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 281;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 282;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 283;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 284;
                        continue;
                    },
                    else => {
                        sdl_pc = 285;
                        continue;
                    },
                }
            },
            278 => {
                if (false) {
                    sdl_pc = 277;
                    continue;
                } else {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                if ((Pixel_83 & rgbmask) != ckey) {
                    sdl_pc = 286;
                    continue;
                } else {
                    sdl_pc = 287;
                    continue;
                }
            },
            280 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            281 => {
                Pixel_83 = src.*;
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            282 => {
                Pixel_83 = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            283 => {
                B_87 = src;
                Pixel_83 = @bitCast(@as(c_int, ((@as(c_int, B_87[@as(c_int, 2)]) << @intCast(@as(c_int, 16))) | (@as(c_int, B_87[@as(c_int, 1)]) << @intCast(@as(c_int, 8)))) | @as(c_int, B_87[@as(c_int, 0)])));
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            284 => {
                Pixel_83 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            285 => {
                Pixel_83 = 0;
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            286 => {
                sR_84 = SDL_expand_byte[srcfmt.*.Rbits][(Pixel_83 & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG_85 = SDL_expand_byte[srcfmt.*.Gbits][(Pixel_83 & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB_86 = SDL_expand_byte[srcfmt.*.Bbits][(Pixel_83 & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 290;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 291;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 292;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 293;
                        continue;
                    },
                    else => {
                        sdl_pc = 289;
                        continue;
                    },
                }
            },
            287 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            288 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            289 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            290 => {
                _pixel_88 = @truncate(((((sR_84 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_85 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_86 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_88;
                {
                    sdl_pc = 289;
                    continue;
                }
            },
            291 => {
                _pixel_89 = @truncate(((((sR_84 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_85 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_86 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_89;
                {
                    sdl_pc = 289;
                    continue;
                }
            },
            292 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR_84);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG_85);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB_86);
                {
                    sdl_pc = 289;
                    continue;
                }
            },
            293 => {
                _pixel_90 = ((((sR_84 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG_85 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB_86 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((alpha >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_90;
                {
                    sdl_pc = 289;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitNtoNKeyCopyAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var srcbpp: Uint8 = undefined;
    _ = &srcbpp;
    var dstbpp: Uint8 = undefined;
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
    var src32: [*c]Uint32 = undefined;
    _ = &src32;
    var dst32: [*c]Uint32 = undefined;
    _ = &dst32;
    var n: c_int = undefined;
    _ = &n;
    var p0: c_int = undefined;
    _ = &p0;
    var p1: c_int = undefined;
    _ = &p1;
    var p2: c_int = undefined;
    _ = &p2;
    var p3: c_int = undefined;
    _ = &p3;
    var n_1: c_int = undefined;
    _ = &n_1;
    var src32_2: [*c]Uint32 = undefined;
    _ = &src32_2;
    var src32_3: [*c]Uint32 = undefined;
    _ = &src32_3;
    var src32_4: [*c]Uint32 = undefined;
    _ = &src32_4;
    var src32_5: [*c]Uint32 = undefined;
    _ = &src32_5;
    var n_6: c_int = undefined;
    _ = &n_6;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_7: Uint16 = undefined;
    _ = &_pixel_7;
    var _pixel_8: Uint32 = undefined;
    _ = &_pixel_8;
    var _pixel_9: Uint8 = undefined;
    _ = &_pixel_9;
    var _pixel_10: Uint16 = undefined;
    _ = &_pixel_10;
    var _pixel_11: Uint32 = undefined;
    _ = &_pixel_11;
    var _pixel_12: Uint8 = undefined;
    _ = &_pixel_12;
    var _pixel_13: Uint16 = undefined;
    _ = &_pixel_13;
    var _pixel_14: Uint32 = undefined;
    _ = &_pixel_14;
    var _pixel_15: Uint8 = undefined;
    _ = &_pixel_15;
    var _pixel_16: Uint16 = undefined;
    _ = &_pixel_16;
    var _pixel_17: Uint32 = undefined;
    _ = &_pixel_17;
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
                ckey = info.*.colorkey;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                rgbmask = ~srcfmt.*.Amask;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                ckey &= rgbmask;
                if (srcfmt.*.format == dstfmt.*.format) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((((srcfmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) or (srcfmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888))) or (srcfmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888))) or (srcfmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888))) {
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
                if ((((@as(c_int, srcbpp) == @as(c_int, 4)) and (@as(c_int, dstbpp) == @as(c_int, 4))) and !(!((srcfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) and !(!((dstfmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            4 => {
                src32 = @ptrCast(@alignCast(src));
                dst32 = @ptrCast(@alignCast(dst));
                {
                    sdl_pc = 7;
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
                return;
            },
            7 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                n = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                src32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src32))) + @as(usize, @bitCast(@as(isize, @intCast(srcskip))))));
                dst32 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst32))) + @as(usize, @bitCast(@as(isize, @intCast(dstskip))))));
                {
                    sdl_pc = 7;
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
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 17;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                dst32.* = src32.*;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 25;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 29;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 37;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                dst32.* = src32.*;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if ((src32.* & rgbmask) != ckey) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                dst32.* = src32.*;
                {
                    sdl_pc = 45;
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
                src32 += 1;
                dst32 += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            46 => {
                get_permutation(srcfmt, dstfmt, &p0, &p1, &p2, &p3, null);
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
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            49 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                n_1 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 68;
                        continue;
                    },
                    else => {
                        sdl_pc = 52;
                        continue;
                    },
                }
            },
            51 => {
                return;
            },
            52 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 49;
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
                src32_2 = @ptrCast(@alignCast(src));
                if ((src32_2.* & rgbmask) != ckey) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                if ((blk: {
                    const ref = &n_1;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            57 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                {
                    sdl_pc = 59;
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                src32_3 = @ptrCast(@alignCast(src));
                if ((src32_3.* & rgbmask) != ckey) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                {
                    sdl_pc = 63;
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
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                src32_4 = @ptrCast(@alignCast(src));
                if ((src32_4.* & rgbmask) != ckey) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                src32_5 = @ptrCast(@alignCast(src));
                if ((src32_5.* & rgbmask) != ckey) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                dst[@as(c_int, 0)] = src[@bitCast(@as(isize, @intCast(p0)))];
                dst[@as(c_int, 1)] = src[@bitCast(@as(isize, @intCast(p1)))];
                dst[@as(c_int, 2)] = src[@bitCast(@as(isize, @intCast(p2)))];
                dst[@as(c_int, 3)] = src[@bitCast(@as(isize, @intCast(p3)))];
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            72 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                n_6 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 133;
                        continue;
                    },
                    else => {
                        sdl_pc = 75;
                        continue;
                    },
                }
            },
            74 => {
                {}
            },
            75 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
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
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if ((blk: {
                    const ref = &n_6;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            80 => {
                switch (@as(c_int, srcbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 87;
                        continue;
                    },
                    else => {
                        sdl_pc = 88;
                        continue;
                    },
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
                if ((Pixel & rgbmask) != ckey) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            84 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            85 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            86 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            88 => {
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
                    sdl_pc = 83;
                    continue;
                }
            },
            89 => {
                switch (@as(c_int, dstbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 96;
                        continue;
                    },
                    else => {
                        sdl_pc = 92;
                        continue;
                    },
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, dstbpp)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, srcbpp)))));
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            93 => {
                _pixel = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            94 => {
                _pixel_7 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_7;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            95 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            96 => {
                _pixel_8 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_8;
                {
                    sdl_pc = 92;
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
                switch (@as(c_int, srcbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 105;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
                        continue;
                    },
                }
            },
            99 => {
                if (false) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                if ((Pixel & rgbmask) != ckey) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            102 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            103 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            104 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            105 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            106 => {
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
                    sdl_pc = 101;
                    continue;
                }
            },
            107 => {
                switch (@as(c_int, dstbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 112;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 114;
                        continue;
                    },
                    else => {
                        sdl_pc = 110;
                        continue;
                    },
                }
            },
            108 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, dstbpp)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, srcbpp)))));
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            111 => {
                _pixel_9 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_9;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            112 => {
                _pixel_10 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_10;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            113 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            114 => {
                _pixel_11 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_11;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                switch (@as(c_int, srcbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 120;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 121;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 122;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 123;
                        continue;
                    },
                    else => {
                        sdl_pc = 124;
                        continue;
                    },
                }
            },
            117 => {
                if (false) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if ((Pixel & rgbmask) != ckey) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            119 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            120 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            121 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            122 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            123 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            124 => {
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
                    sdl_pc = 119;
                    continue;
                }
            },
            125 => {
                switch (@as(c_int, dstbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 130;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 132;
                        continue;
                    },
                    else => {
                        sdl_pc = 128;
                        continue;
                    },
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, dstbpp)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, srcbpp)))));
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            128 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            129 => {
                _pixel_12 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_12;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            130 => {
                _pixel_13 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_13;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            131 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            132 => {
                _pixel_14 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_14;
                {
                    sdl_pc = 128;
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
                switch (@as(c_int, srcbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 138;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 140;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 141;
                        continue;
                    },
                    else => {
                        sdl_pc = 142;
                        continue;
                    },
                }
            },
            135 => {
                if (false) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                if ((Pixel & rgbmask) != ckey) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            138 => {
                Pixel = src.*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            139 => {
                Pixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            140 => {
                Pixel = 0;
                sR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Rshift), @as(c_int, 8))))))).*;
                sG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Gshift), @as(c_int, 8))))))).*;
                sB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, srcfmt.*.Bshift), @as(c_int, 8))))))).*;
                sA = 255;
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            141 => {
                Pixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                sR = SDL_expand_byte[srcfmt.*.Rbits][(Pixel & srcfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))];
                sG = SDL_expand_byte[srcfmt.*.Gbits][(Pixel & srcfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))];
                sB = SDL_expand_byte[srcfmt.*.Bbits][(Pixel & srcfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))];
                sA = SDL_expand_byte[srcfmt.*.Abits][(Pixel & srcfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))];
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            142 => {
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
                    sdl_pc = 137;
                    continue;
                }
            },
            143 => {
                switch (@as(c_int, dstbpp)) {
                    @as(c_int, 1) => {
                        sdl_pc = 147;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 148;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 149;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 150;
                        continue;
                    },
                    else => {
                        sdl_pc = 146;
                        continue;
                    },
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, dstbpp)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, srcbpp)))));
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            147 => {
                _pixel_15 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_15;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            148 => {
                _pixel_16 = @truncate(((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_16;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            149 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(sR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(sG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(sB);
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            150 => {
                _pixel_17 = ((((sR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((sG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((sB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((sA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_17;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit8888to8888PixelSwizzleSSE41(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var fill_alpha: bool = !(srcfmt.*.Amask != 0) or !(dstfmt.*.Amask != 0);
    _ = &fill_alpha;
    var srcAmask: Uint32 = undefined;
    _ = &srcAmask;
    var srcAshift: Uint32 = undefined;
    _ = &srcAshift;
    var dstAmask: Uint32 = undefined;
    _ = &dstAmask;
    var dstAshift: Uint32 = undefined;
    _ = &dstAshift;
    SDL_Get8888AlphaMaskAndShift(srcfmt, &srcAmask, &srcAshift);
    SDL_Get8888AlphaMaskAndShift(dstfmt, &dstAmask, &dstAshift);
    const mask_offsets: __m128i = _mm_set_epi8(12, 12, 12, 12, 8, 8, 8, 8, 4, 4, 4, 4, 0, 0, 0, 0);
    _ = &mask_offsets;
    const convert_mask: __m128i = _mm_add_epi32(_mm_set1_epi32(@bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, (((@as(c_int, srcfmt.*.Rshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((@as(c_int, srcfmt.*.Gshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((@as(c_int, srcfmt.*.Bshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Bshift)))))) | ((srcAshift >> @intCast(@as(Uint32, 3))) << @intCast(dstAshift)))))), mask_offsets);
    _ = &convert_mask;
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
            src128 = _mm_shuffle_epi8(src128, convert_mask);
            if (fill_alpha) {
                src128 = _mm_or_si128(src128, alpha_fill_mask);
            }
            _mm_storeu_si128(@ptrCast(@alignCast(dst)), src128);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))));
        }
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = undefined;
            _ = &dst32;
            if (fill_alpha) {
                while (true) {
                    dst32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | dstAmask;
                    if (!false) break;
                }
            } else {
                while (true) {
                    dst32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                    if (!false) break;
                }
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn Blit8888to8888PixelSwizzleAVX2(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var fill_alpha: bool = !(srcfmt.*.Amask != 0) or !(dstfmt.*.Amask != 0);
    _ = &fill_alpha;
    var srcAmask: Uint32 = undefined;
    _ = &srcAmask;
    var srcAshift: Uint32 = undefined;
    _ = &srcAshift;
    var dstAmask: Uint32 = undefined;
    _ = &dstAmask;
    var dstAshift: Uint32 = undefined;
    _ = &dstAshift;
    SDL_Get8888AlphaMaskAndShift(srcfmt, &srcAmask, &srcAshift);
    SDL_Get8888AlphaMaskAndShift(dstfmt, &dstAmask, &dstAshift);
    const mask_offsets: __m256i = _mm256_set_epi8(28, 28, 28, 28, 24, 24, 24, 24, 20, 20, 20, 20, 16, 16, 16, 16, 12, 12, 12, 12, 8, 8, 8, 8, 4, 4, 4, 4, 0, 0, 0, 0);
    _ = &mask_offsets;
    const convert_mask: __m256i = _mm256_add_epi32(_mm256_set1_epi32(@bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, (((@as(c_int, srcfmt.*.Rshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Rshift))) | ((@as(c_int, srcfmt.*.Gshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Gshift)))) | ((@as(c_int, srcfmt.*.Bshift) >> @intCast(@as(c_int, 3))) << @intCast(@as(c_int, dstfmt.*.Bshift)))))) | ((srcAshift >> @intCast(@as(Uint32, 3))) << @intCast(dstAshift)))))), mask_offsets);
    _ = &convert_mask;
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
            src256 = _mm256_shuffle_epi8(src256, convert_mask);
            if (fill_alpha) {
                src256 = _mm256_or_si256(src256, alpha_fill_mask);
            }
            _mm256_storeu_si256(@ptrCast(@alignCast(dst)), src256);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))));
        }
        while (i < width) : (i += 1) {
            var src32: Uint32 = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
            _ = &src32;
            var dst32: Uint32 = undefined;
            _ = &dst32;
            if (fill_alpha) {
                while (true) {
                    dst32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | dstAmask;
                    if (!false) break;
                }
            } else {
                while (true) {
                    dst32 = (((((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Rshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Gshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Bshift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | (((src32 >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, srcfmt.*.Ashift)))))) & @as(Uint32, 255)) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                    if (!false) break;
                }
            }
            @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = dst32;
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}
pub fn Blit_3or4_to_3or4__same_rgb(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var mask: Uint32 = undefined;
    _ = &mask;
    var @"i0": c_int = undefined;
    _ = &@"i0";
    var @"i1": c_int = undefined;
    _ = &@"i1";
    var @"i2": c_int = undefined;
    _ = &@"i2";
    var n: c_int = undefined;
    _ = &n;
    var dst32: [*c]Uint32 = undefined;
    _ = &dst32;
    var s0: Uint8 = undefined;
    _ = &s0;
    var s1: Uint8 = undefined;
    _ = &s1;
    var s2: Uint8 = undefined;
    _ = &s2;
    var dst32_1: [*c]Uint32 = undefined;
    _ = &dst32_1;
    var s0_2: Uint8 = undefined;
    _ = &s0_2;
    var s1_3: Uint8 = undefined;
    _ = &s1_3;
    var s2_4: Uint8 = undefined;
    _ = &s2_4;
    var dst32_5: [*c]Uint32 = undefined;
    _ = &dst32_5;
    var s0_6: Uint8 = undefined;
    _ = &s0_6;
    var s1_7: Uint8 = undefined;
    _ = &s1_7;
    var s2_8: Uint8 = undefined;
    _ = &s2_8;
    var dst32_9: [*c]Uint32 = undefined;
    _ = &dst32_9;
    var s0_10: Uint8 = undefined;
    _ = &s0_10;
    var s1_11: Uint8 = undefined;
    _ = &s1_11;
    var s2_12: Uint8 = undefined;
    _ = &s2_12;
    var i0_13: c_int = undefined;
    _ = &i0_13;
    var i1_14: c_int = undefined;
    _ = &i1_14;
    var i2_15: c_int = undefined;
    _ = &i2_15;
    var j0_16: c_int = undefined;
    _ = &j0_16;
    var j1_17: c_int = undefined;
    _ = &j1_17;
    var j2: c_int = undefined;
    _ = &j2;
    var n_18: c_int = undefined;
    _ = &n_18;
    var s0_19: Uint8 = undefined;
    _ = &s0_19;
    var s1_20: Uint8 = undefined;
    _ = &s1_20;
    var s2_21: Uint8 = undefined;
    _ = &s2_21;
    var s0_22: Uint8 = undefined;
    _ = &s0_22;
    var s1_23: Uint8 = undefined;
    _ = &s1_23;
    var s2_24: Uint8 = undefined;
    _ = &s2_24;
    var s0_25: Uint8 = undefined;
    _ = &s0_25;
    var s1_26: Uint8 = undefined;
    _ = &s1_26;
    var s2_27: Uint8 = undefined;
    _ = &s2_27;
    var s0_28: Uint8 = undefined;
    _ = &s0_28;
    var s1_29: Uint8 = undefined;
    _ = &s1_29;
    var s2_30: Uint8 = undefined;
    _ = &s2_30;
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
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstfmt = info.*.dst_fmt;
                dstbpp = dstfmt.*.bytes_per_pixel;
                if (dstfmt.*.Amask != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                mask = @as(Uint32, info.*.a) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                @"i0" = 0;
                @"i1" = 1;
                @"i2" = 2;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                i0_13 = 0;
                i1_14 = 1;
                i2_15 = 2;
                j0_16 = 0;
                j1_17 = 1;
                j2 = 2;
                {
                    sdl_pc = 15;
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
                dst32 = @ptrCast(@alignCast(dst));
                s0 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                dst32.* = @as(Uint32, @bitCast(@as(c_int, (@as(c_int, s0) | (@as(c_int, s1) << @intCast(@as(c_int, 8)))) | (@as(c_int, s2) << @intCast(@as(c_int, 16)))))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
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
                dst32_1 = @ptrCast(@alignCast(dst));
                s0_2 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_3 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_4 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                dst32_1.* = @as(Uint32, @bitCast(@as(c_int, (@as(c_int, s0_2) | (@as(c_int, s1_3) << @intCast(@as(c_int, 8)))) | (@as(c_int, s2_4) << @intCast(@as(c_int, 16)))))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst32_5 = @ptrCast(@alignCast(dst));
                s0_6 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_7 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_8 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                dst32_5.* = @as(Uint32, @bitCast(@as(c_int, (@as(c_int, s0_6) | (@as(c_int, s1_7) << @intCast(@as(c_int, 8)))) | (@as(c_int, s2_8) << @intCast(@as(c_int, 16)))))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst32_9 = @ptrCast(@alignCast(dst));
                s0_10 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_11 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_12 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                dst32_9.* = @as(Uint32, @bitCast(@as(c_int, (@as(c_int, s0_10) | (@as(c_int, s1_11) << @intCast(@as(c_int, 8)))) | (@as(c_int, s2_12) << @intCast(@as(c_int, 16)))))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                n_18 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            18 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 15;
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
                s0_19 = src[@bitCast(@as(isize, @intCast(i0_13)))];
                s1_20 = src[@bitCast(@as(isize, @intCast(i1_14)))];
                s2_21 = src[@bitCast(@as(isize, @intCast(i2_15)))];
                dst[@bitCast(@as(isize, @intCast(j0_16)))] = s0_19;
                dst[@bitCast(@as(isize, @intCast(j1_17)))] = s1_20;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_21;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                s0_22 = src[@bitCast(@as(isize, @intCast(i0_13)))];
                s1_23 = src[@bitCast(@as(isize, @intCast(i1_14)))];
                s2_24 = src[@bitCast(@as(isize, @intCast(i2_15)))];
                dst[@bitCast(@as(isize, @intCast(j0_16)))] = s0_22;
                dst[@bitCast(@as(isize, @intCast(j1_17)))] = s1_23;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_24;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                s0_25 = src[@bitCast(@as(isize, @intCast(i0_13)))];
                s1_26 = src[@bitCast(@as(isize, @intCast(i1_14)))];
                s2_27 = src[@bitCast(@as(isize, @intCast(i2_15)))];
                dst[@bitCast(@as(isize, @intCast(j0_16)))] = s0_25;
                dst[@bitCast(@as(isize, @intCast(j1_17)))] = s1_26;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_27;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                s0_28 = src[@bitCast(@as(isize, @intCast(i0_13)))];
                s1_29 = src[@bitCast(@as(isize, @intCast(i1_14)))];
                s2_30 = src[@bitCast(@as(isize, @intCast(i2_15)))];
                dst[@bitCast(@as(isize, @intCast(j0_16)))] = s0_28;
                dst[@bitCast(@as(isize, @intCast(j1_17)))] = s1_29;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_30;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit_3or4_to_3or4__inversed_rgb(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var @"i0": c_int = undefined;
    _ = &@"i0";
    var @"i1": c_int = undefined;
    _ = &@"i1";
    var @"i2": c_int = undefined;
    _ = &@"i2";
    var @"i3": c_int = undefined;
    _ = &@"i3";
    var n: c_int = undefined;
    _ = &n;
    var dst32: [*c]Uint32 = undefined;
    _ = &dst32;
    var s0: Uint8 = undefined;
    _ = &s0;
    var s1: Uint8 = undefined;
    _ = &s1;
    var s2: Uint8 = undefined;
    _ = &s2;
    var alphashift: Uint32 = undefined;
    _ = &alphashift;
    var dst32_1: [*c]Uint32 = undefined;
    _ = &dst32_1;
    var s0_2: Uint8 = undefined;
    _ = &s0_2;
    var s1_3: Uint8 = undefined;
    _ = &s1_3;
    var s2_4: Uint8 = undefined;
    _ = &s2_4;
    var alphashift_5: Uint32 = undefined;
    _ = &alphashift_5;
    var dst32_6: [*c]Uint32 = undefined;
    _ = &dst32_6;
    var s0_7: Uint8 = undefined;
    _ = &s0_7;
    var s1_8: Uint8 = undefined;
    _ = &s1_8;
    var s2_9: Uint8 = undefined;
    _ = &s2_9;
    var alphashift_10: Uint32 = undefined;
    _ = &alphashift_10;
    var dst32_11: [*c]Uint32 = undefined;
    _ = &dst32_11;
    var s0_12: Uint8 = undefined;
    _ = &s0_12;
    var s1_13: Uint8 = undefined;
    _ = &s1_13;
    var s2_14: Uint8 = undefined;
    _ = &s2_14;
    var alphashift_15: Uint32 = undefined;
    _ = &alphashift_15;
    var mask: Uint32 = undefined;
    _ = &mask;
    var i0_16: c_int = undefined;
    _ = &i0_16;
    var i1_17: c_int = undefined;
    _ = &i1_17;
    var i2_18: c_int = undefined;
    _ = &i2_18;
    var n_19: c_int = undefined;
    _ = &n_19;
    var dst32_20: [*c]Uint32 = undefined;
    _ = &dst32_20;
    var s0_21: Uint8 = undefined;
    _ = &s0_21;
    var s1_22: Uint8 = undefined;
    _ = &s1_22;
    var s2_23: Uint8 = undefined;
    _ = &s2_23;
    var dst32_24: [*c]Uint32 = undefined;
    _ = &dst32_24;
    var s0_25: Uint8 = undefined;
    _ = &s0_25;
    var s1_26: Uint8 = undefined;
    _ = &s1_26;
    var s2_27: Uint8 = undefined;
    _ = &s2_27;
    var dst32_28: [*c]Uint32 = undefined;
    _ = &dst32_28;
    var s0_29: Uint8 = undefined;
    _ = &s0_29;
    var s1_30: Uint8 = undefined;
    _ = &s1_30;
    var s2_31: Uint8 = undefined;
    _ = &s2_31;
    var dst32_32: [*c]Uint32 = undefined;
    _ = &dst32_32;
    var s0_33: Uint8 = undefined;
    _ = &s0_33;
    var s1_34: Uint8 = undefined;
    _ = &s1_34;
    var s2_35: Uint8 = undefined;
    _ = &s2_35;
    var i0_36: c_int = undefined;
    _ = &i0_36;
    var i1_37: c_int = undefined;
    _ = &i1_37;
    var i2_38: c_int = undefined;
    _ = &i2_38;
    var j0_39: c_int = undefined;
    _ = &j0_39;
    var j1_40: c_int = undefined;
    _ = &j1_40;
    var j2: c_int = undefined;
    _ = &j2;
    var n_41: c_int = undefined;
    _ = &n_41;
    var s0_42: Uint8 = undefined;
    _ = &s0_42;
    var s1_43: Uint8 = undefined;
    _ = &s1_43;
    var s2_44: Uint8 = undefined;
    _ = &s2_44;
    var s0_45: Uint8 = undefined;
    _ = &s0_45;
    var s1_46: Uint8 = undefined;
    _ = &s1_46;
    var s2_47: Uint8 = undefined;
    _ = &s2_47;
    var s0_48: Uint8 = undefined;
    _ = &s0_48;
    var s1_49: Uint8 = undefined;
    _ = &s1_49;
    var s2_50: Uint8 = undefined;
    _ = &s2_50;
    var s0_51: Uint8 = undefined;
    _ = &s0_51;
    var s1_52: Uint8 = undefined;
    _ = &s1_52;
    var s2_53: Uint8 = undefined;
    _ = &s2_53;
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
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstfmt = info.*.dst_fmt;
                dstbpp = dstfmt.*.bytes_per_pixel;
                if (dstfmt.*.Amask != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if (srcfmt.*.Amask != 0) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                i0_36 = 0;
                i1_37 = 1;
                i2_38 = 2;
                j0_39 = 2;
                j1_40 = 1;
                j2 = 0;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                mask = @as(Uint32, info.*.a) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                i0_16 = 0;
                i1_17 = 1;
                i2_18 = 2;
                {
                    sdl_pc = 18;
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                @"i0" = 0;
                @"i1" = 1;
                @"i2" = 2;
                @"i3" = 3;
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 7;
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
                dst32 = @ptrCast(@alignCast(dst));
                s0 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                alphashift = @as(Uint32, src[@bitCast(@as(isize, @intCast(@"i3")))]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                dst32.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0) << @intCast(@as(c_int, 16))) | (@as(c_int, s1) << @intCast(@as(c_int, 8)))) | @as(c_int, s2)))) | alphashift;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                dst32_1 = @ptrCast(@alignCast(dst));
                s0_2 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_3 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_4 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                alphashift_5 = @as(Uint32, src[@bitCast(@as(isize, @intCast(@"i3")))]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                dst32_1.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_2) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_3) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_4)))) | alphashift_5;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                dst32_6 = @ptrCast(@alignCast(dst));
                s0_7 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_8 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_9 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                alphashift_10 = @as(Uint32, src[@bitCast(@as(isize, @intCast(@"i3")))]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                dst32_6.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_7) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_8) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_9)))) | alphashift_10;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                dst32_11 = @ptrCast(@alignCast(dst));
                s0_12 = src[@bitCast(@as(isize, @intCast(@"i0")))];
                s1_13 = src[@bitCast(@as(isize, @intCast(@"i1")))];
                s2_14 = src[@bitCast(@as(isize, @intCast(@"i2")))];
                alphashift_15 = @as(Uint32, src[@bitCast(@as(isize, @intCast(@"i3")))]) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))));
                dst32_11.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_12) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_13) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_14)))) | alphashift_15;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                n_19 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            21 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                dst32_20 = @ptrCast(@alignCast(dst));
                s0_21 = src[@bitCast(@as(isize, @intCast(i0_16)))];
                s1_22 = src[@bitCast(@as(isize, @intCast(i1_17)))];
                s2_23 = src[@bitCast(@as(isize, @intCast(i2_18)))];
                dst32_20.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_21) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_22) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_23)))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if ((blk: {
                    const ref = &n_19;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                dst32_24 = @ptrCast(@alignCast(dst));
                s0_25 = src[@bitCast(@as(isize, @intCast(i0_16)))];
                s1_26 = src[@bitCast(@as(isize, @intCast(i1_17)))];
                s2_27 = src[@bitCast(@as(isize, @intCast(i2_18)))];
                dst32_24.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_25) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_26) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_27)))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                dst32_28 = @ptrCast(@alignCast(dst));
                s0_29 = src[@bitCast(@as(isize, @intCast(i0_16)))];
                s1_30 = src[@bitCast(@as(isize, @intCast(i1_17)))];
                s2_31 = src[@bitCast(@as(isize, @intCast(i2_18)))];
                dst32_28.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_29) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_30) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_31)))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                dst32_32 = @ptrCast(@alignCast(dst));
                s0_33 = src[@bitCast(@as(isize, @intCast(i0_16)))];
                s1_34 = src[@bitCast(@as(isize, @intCast(i1_17)))];
                s2_35 = src[@bitCast(@as(isize, @intCast(i2_18)))];
                dst32_32.* = @as(Uint32, @bitCast(@as(c_int, ((@as(c_int, s0_33) << @intCast(@as(c_int, 16))) | (@as(c_int, s1_34) << @intCast(@as(c_int, 8)))) | @as(c_int, s2_35)))) | mask;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                n_41 = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 39;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            31 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            32 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 29;
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
                s0_42 = src[@bitCast(@as(isize, @intCast(i0_36)))];
                s1_43 = src[@bitCast(@as(isize, @intCast(i1_37)))];
                s2_44 = src[@bitCast(@as(isize, @intCast(i2_38)))];
                dst[@bitCast(@as(isize, @intCast(j0_39)))] = s0_42;
                dst[@bitCast(@as(isize, @intCast(j1_40)))] = s1_43;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_44;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                if ((blk: {
                    const ref = &n_41;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            37 => {
                s0_45 = src[@bitCast(@as(isize, @intCast(i0_36)))];
                s1_46 = src[@bitCast(@as(isize, @intCast(i1_37)))];
                s2_47 = src[@bitCast(@as(isize, @intCast(i2_38)))];
                dst[@bitCast(@as(isize, @intCast(j0_39)))] = s0_45;
                dst[@bitCast(@as(isize, @intCast(j1_40)))] = s1_46;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_47;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                s0_48 = src[@bitCast(@as(isize, @intCast(i0_36)))];
                s1_49 = src[@bitCast(@as(isize, @intCast(i1_37)))];
                s2_50 = src[@bitCast(@as(isize, @intCast(i2_38)))];
                dst[@bitCast(@as(isize, @intCast(j0_39)))] = s0_48;
                dst[@bitCast(@as(isize, @intCast(j1_40)))] = s1_49;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_50;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                s0_51 = src[@bitCast(@as(isize, @intCast(i0_36)))];
                s1_52 = src[@bitCast(@as(isize, @intCast(i1_37)))];
                s2_53 = src[@bitCast(@as(isize, @intCast(i2_38)))];
                dst[@bitCast(@as(isize, @intCast(j0_39)))] = s0_51;
                dst[@bitCast(@as(isize, @intCast(j1_40)))] = s1_52;
                dst[@bitCast(@as(isize, @intCast(j2)))] = s2_53;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcbpp))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const struct_blit_table = extern struct {
    srcR: Uint32 = 0,
    srcG: Uint32 = 0,
    srcB: Uint32 = 0,
    dstbpp: c_int = 0,
    dstR: Uint32 = 0,
    dstG: Uint32 = 0,
    dstB: Uint32 = 0,
    blit_features: Uint32 = 0,
    blitfunc: SDL_BlitFunc = null,
    alpha: Uint32 = 0,
};
pub const normal_blit_1: [1]struct_blit_table = [1]struct_blit_table{
    struct_blit_table{
        .srcR = 0,
        .srcG = 0,
        .srcB = 0,
        .dstbpp = 0,
        .dstR = 0,
        .dstG = 0,
        .dstB = 0,
        .blit_features = 0,
        .blitfunc = BlitNtoN,
        .alpha = 0,
    },
};
pub const normal_blit_2: [9]struct_blit_table = [9]struct_blit_table{
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = BLIT_FEATURE_HAS_SSE41,
        .blitfunc = Blit_RGB565_32_SSE41,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = BLIT_FEATURE_HAS_SSE41,
        .blitfunc = Blit_RGB565_32_SSE41,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 4278190080,
        .dstG = 16711680,
        .dstB = 65280,
        .blit_features = BLIT_FEATURE_HAS_SSE41,
        .blitfunc = Blit_RGB565_32_SSE41,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 65280,
        .dstG = 16711680,
        .dstB = 4278190080,
        .blit_features = BLIT_FEATURE_HAS_SSE41,
        .blitfunc = Blit_RGB565_32_SSE41,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_RGB565_ARGB8888,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_RGB565_ABGR8888,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 4278190080,
        .dstG = 16711680,
        .dstB = 65280,
        .blit_features = 0,
        .blitfunc = Blit_RGB565_RGBA8888,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 63488,
        .srcG = 2016,
        .srcB = 31,
        .dstbpp = 4,
        .dstR = 65280,
        .dstG = 16711680,
        .dstB = 4278190080,
        .blit_features = 0,
        .blitfunc = Blit_RGB565_BGRA8888,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | COPY_ALPHA) | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 0,
        .srcG = 0,
        .srcB = 0,
        .dstbpp = 0,
        .dstR = 0,
        .dstG = 0,
        .dstB = 0,
        .blit_features = 0,
        .blitfunc = BlitNtoN,
        .alpha = 0,
    },
};
pub const normal_blit_3: [7]struct_blit_table = [7]struct_blit_table{
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 4,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__same_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 4,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__same_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 4,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 4,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 3,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = NO_ALPHA,
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 3,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = NO_ALPHA,
    },
    struct_blit_table{
        .srcR = 0,
        .srcG = 0,
        .srcB = 0,
        .dstbpp = 0,
        .dstR = 0,
        .dstG = 0,
        .dstB = 0,
        .blit_features = 0,
        .blitfunc = BlitNtoN,
        .alpha = 0,
    },
};
pub const normal_blit_4: [9]struct_blit_table = [9]struct_blit_table{
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 3,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__same_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 3,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__same_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 3,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 3,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, NO_ALPHA | SET_ALPHA)),
    },
    struct_blit_table{
        .srcR = 255,
        .srcG = 65280,
        .srcB = 16711680,
        .dstbpp = 4,
        .dstR = 16711680,
        .dstG = 65280,
        .dstB = 255,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | SET_ALPHA) | COPY_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 4,
        .dstR = 255,
        .dstG = 65280,
        .dstB = 16711680,
        .blit_features = 0,
        .blitfunc = Blit_3or4_to_3or4__inversed_rgb,
        .alpha = @bitCast(@as(c_int, (NO_ALPHA | SET_ALPHA) | COPY_ALPHA)),
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 2,
        .dstR = 63488,
        .dstG = 2016,
        .dstB = 31,
        .blit_features = 0,
        .blitfunc = Blit_XRGB8888_RGB565,
        .alpha = NO_ALPHA,
    },
    struct_blit_table{
        .srcR = 16711680,
        .srcG = 65280,
        .srcB = 255,
        .dstbpp = 2,
        .dstR = 31744,
        .dstG = 992,
        .dstB = 31,
        .blit_features = 0,
        .blitfunc = Blit_XRGB8888_RGB555,
        .alpha = NO_ALPHA,
    },
    struct_blit_table{
        .srcR = 0,
        .srcG = 0,
        .srcB = 0,
        .dstbpp = 0,
        .dstR = 0,
        .dstG = 0,
        .dstB = 0,
        .blit_features = 0,
        .blitfunc = BlitNtoN,
        .alpha = 0,
    },
};
pub const normal_blit: [4][*c]const struct_blit_table = [4][*c]const struct_blit_table{
    @ptrCast(@alignCast(&normal_blit_1)),
    @ptrCast(@alignCast(&normal_blit_2)),
    @ptrCast(@alignCast(&normal_blit_3)),
    @ptrCast(@alignCast(&normal_blit_4)),
};
pub export fn SDL_CalculateBlitN(surface: [*c]SDL_Surface) SDL_BlitFunc {
    @setEvalBranchQuota(100000);
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var table: [*c]const struct_blit_table = undefined;
    _ = &table;
    var which: c_int = undefined;
    _ = &which;
    var blitfun: SDL_BlitFunc = undefined;
    _ = &blitfun;
    var a_need: Uint32 = undefined;
    _ = &a_need;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                srcfmt = surface.*.fmt;
                dstfmt = surface.*.map.info.dst_fmt;
                if (@as(c_int, dstfmt.*.bits_per_pixel) < @as(c_int, 8)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return null;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (surface.*.map.info.flags & ~((SDL_COPY_RLE_DESIRED | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_COPY_COLORKEY => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            4 => {
                return null;
            },
            5 => {
                if ((((srcfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888)) and (((dstfmt.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                if (SDL_HasAVX2_REAL()) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                blitfun = null;
                if (@as(c_int, dstfmt.*.bits_per_pixel) > @as(c_int, 8)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            9 => {
                return Blit8888to8888PixelSwizzleAVX2;
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (SDL_HasSSE41_REAL()) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                return Blit8888to8888PixelSwizzleSSE41;
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            15 => {
                a_need = NO_ALPHA;
                if (dstfmt.*.Amask != 0) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                return blitfun;
            },
            18 => {
                a_need = @bitCast(@as(c_int, if (srcfmt.*.Amask != 0) COPY_ALPHA else SET_ALPHA));
                {
                    sdl_pc = 20;
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
                if ((@as(c_int, srcfmt.*.bytes_per_pixel) > @as(c_int, 0)) and (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, srcfmt.*.bytes_per_pixel)))) <= (@sizeOf(@TypeOf(normal_blit)) / @sizeOf(@TypeOf(normal_blit[@as(c_int, 0)]))))) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                table = normal_blit[@bitCast(@as(isize, @intCast(@as(c_int, srcfmt.*.bytes_per_pixel) - @as(c_int, 1))))];
                which = 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (blitfun == BlitNtoN) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            24 => {
                if (table[@bitCast(@as(isize, @intCast(which)))].dstbpp != 0) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                if ((((((((((srcfmt.*.Rmask == table[@bitCast(@as(isize, @intCast(which)))].srcR) or (table[@bitCast(@as(isize, @intCast(which)))].srcR == @as(Uint32, 0))) and ((srcfmt.*.Gmask == table[@bitCast(@as(isize, @intCast(which)))].srcG) or (table[@bitCast(@as(isize, @intCast(which)))].srcG == @as(Uint32, 0)))) and ((srcfmt.*.Bmask == table[@bitCast(@as(isize, @intCast(which)))].srcB) or (table[@bitCast(@as(isize, @intCast(which)))].srcB == @as(Uint32, 0)))) and ((dstfmt.*.Rmask == table[@bitCast(@as(isize, @intCast(which)))].dstR) or (table[@bitCast(@as(isize, @intCast(which)))].dstR == @as(Uint32, 0)))) and ((dstfmt.*.Gmask == table[@bitCast(@as(isize, @intCast(which)))].dstG) or (table[@bitCast(@as(isize, @intCast(which)))].dstG == @as(Uint32, 0)))) and ((dstfmt.*.Bmask == table[@bitCast(@as(isize, @intCast(which)))].dstB) or (table[@bitCast(@as(isize, @intCast(which)))].dstB == @as(Uint32, 0)))) and (@as(c_int, dstfmt.*.bytes_per_pixel) == table[@bitCast(@as(isize, @intCast(which)))].dstbpp)) and ((a_need & table[@bitCast(@as(isize, @intCast(which)))].alpha) == a_need)) and ((table[@bitCast(@as(isize, @intCast(which)))].blit_features & @as(Uint32, @bitCast(@as(c_int, if (SDL_HasSSE41_REAL()) BLIT_FEATURE_HAS_SSE41 else @as(c_int, 0))))) == table[@bitCast(@as(isize, @intCast(which)))].blit_features)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                which += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                blitfun = table[@bitCast(@as(isize, @intCast(which)))].blitfunc;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 27;
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            31 => {
                if ((((@as(c_int, srcfmt.*.bytes_per_pixel) == @as(c_int, dstfmt.*.bytes_per_pixel)) and (srcfmt.*.Rmask == dstfmt.*.Rmask)) and (srcfmt.*.Gmask == dstfmt.*.Gmask)) and (srcfmt.*.Bmask == dstfmt.*.Bmask)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            34 => {
                if (a_need == @as(Uint32, COPY_ALPHA)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                if (a_need == @as(Uint32, COPY_ALPHA)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                if (srcfmt.*.Amask == dstfmt.*.Amask) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            38 => {
                if (@as(c_int, srcfmt.*.bytes_per_pixel) == @as(c_int, 4)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                blitfun = SDL_BlitCopy;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                blitfun = BlitNtoNCopyAlpha;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            43 => {
                blitfun = Blit4to4MaskAlpha;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                if (@as(c_int, srcfmt.*.bytes_per_pixel) == @as(c_int, 2)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            46 => {
                blitfun = Blit2to2MaskAlpha;
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
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                blitfun = BlitNtoNCopyAlpha;
                {
                    sdl_pc = 51;
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
                    sdl_pc = 36;
                    continue;
                }
            },
            52 => {
                if ((@as(c_int, srcfmt.*.bytes_per_pixel) == @as(c_int, 2)) and (surface.*.map.identity != @as(c_int, 0))) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                return Blit2to2Key;
            },
            54 => {
                if ((srcfmt.*.Amask != 0) and (dstfmt.*.Amask != 0)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            56 => {
                return BlitNtoNKeyCopyAlpha;
            },
            57 => {
                return BlitNtoNKey;
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const SDL_COPY_RLE_DESIRED = @as(c_int, 0x00001000);
pub const SDL_COPY_RLE_COLORKEY = @as(c_int, 0x00002000);
pub const SDL_COPY_RLE_ALPHAKEY = @as(c_int, 0x00004000);
pub const BLIT_FEATURE_HAS_SSE41 = @as(c_int, 0x01);
pub const HI = @as(c_int, 1);
pub const LO = @as(c_int, 0);
pub inline fn RGB565_32(dst: anytype, src: anytype, map: anytype) @TypeOf(map[@as(usize, @intCast(src[@as(usize, @intCast(LO))] * @as(c_int, 2)))] | map[@as(usize, @intCast((src[@as(usize, @intCast(HI))] * @as(c_int, 2)) + @as(c_int, 1)))]) {
    @setEvalBranchQuota(100000);
    _ = &dst;
    _ = &src;
    _ = &map;
    return map[@as(usize, @intCast(src[@as(usize, @intCast(LO))] * @as(c_int, 2)))] | map[@as(usize, @intCast((src[@as(usize, @intCast(HI))] * @as(c_int, 2)) + @as(c_int, 1)))];
}
pub const NO_ALPHA = @as(c_int, 1);
pub const SET_ALPHA = @as(c_int, 2);
pub const COPY_ALPHA = @as(c_int, 4);
pub inline fn MASKOK(x: anytype, y: anytype) @TypeOf((x == y) or (y == @as(c_int, 0x00000000))) {
    @setEvalBranchQuota(100000);
    _ = &x;
    _ = &y;
    return (x == y) or (y == @as(c_int, 0x00000000));
}
