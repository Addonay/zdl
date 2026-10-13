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
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
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
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const SDL_SCALEMODE_PIXELART: c_int = 2;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
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
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_ConvertSurfaceAndColorspace_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat, palette: [*c]SDL_Palette, colorspace: SDL_Colorspace, props: SDL_PropertiesID) [*c]SDL_Surface;
pub extern fn SDL_ConvertPixelsAndColorspace_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_HasSSE2_REAL() bool;
pub const __m128i = @Vector(2, c_longlong);
pub const __v2di = @Vector(2, c_longlong);
pub const __v4si = @Vector(4, c_int);
pub const __v8hi = @Vector(8, c_short);
pub const __v16qi = @Vector(16, u8);
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:68:3: warning: TODO implement function '__builtin_ia32_emms' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/mmintrin.h:67:5: warning: unable to translate function, demoted to extern
pub const __v8hu = @Vector(8, c_ushort);
pub const __m128i_u = @Vector(2, c_longlong);
pub inline fn _mm_add_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) + @as(__v8hu, @bitCast(__b)));
}
pub const _mm_madd_epi16 = @import("simd")._mm_madd_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2314:19: warning: TODO implement function '__builtin_elementwise_max' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2313:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_mullo_epi16(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(__v8hu, @bitCast(__a)) * @as(__v8hu, @bitCast(__b)));
}
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2446:20: warning: TODO implement function '__builtin_ia32_pmuludq128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:2444:54: warning: unable to translate function, demoted to extern
pub const _mm_srli_epi32 = @import("simd")._mm_srli_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3033:19: warning: TODO implement function '__builtin_ia32_psrld128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:3032:1: warning: unable to translate function, demoted to extern
pub inline fn _mm_cvtsi128_si32(__a: __m128i) c_int {
    @setEvalBranchQuota(100000);
    var __b: __v4si = @bitCast(__a);
    _ = &__b;
    return __b[@as(c_int, 0)];
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
pub inline fn _mm_setzero_si128() __m128i {
    @setEvalBranchQuota(100000);
    return @as(__v2di, [2]c_longlong{
        0,
        0,
    });
}
pub const _mm_packs_epi32 = @import("simd")._mm_packs_epi32;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4210:19: warning: TODO implement function '__builtin_ia32_packuswb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4209:1: warning: unable to translate function, demoted to extern
pub const _mm_packus_epi16 = @import("simd")._mm_packus_epi16;
// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4285:10: warning: TODO implement function '__builtin_ia32_pmovmskb128' in std.zig.c_builtins

// /home/addo/dev/stupid/zdl/.cache/zig-lib/include/emmintrin.h:4284:1: warning: unable to translate function, demoted to extern
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
pub inline fn _mm_unpacklo_epi64(__a: __m128i, __b: __m128i) __m128i {
    @setEvalBranchQuota(100000);
    return @shuffle(@typeInfo(@TypeOf(__a)).vector.child, __a, __b, @Vector(2, i32){
        __helpers.shuffleVectorIndex(0, @typeInfo(@TypeOf(__a)).vector.len),
        __helpers.shuffleVectorIndex(@as(c_int, 2) + @as(c_int, 0), @typeInfo(@TypeOf(__a)).vector.len),
    });
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
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub export fn SDL_StretchSurface_REAL(src: [*c]SDL_Surface, arg_srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, arg_dstrect: [*c]const SDL_Rect, arg_scaleMode: SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    var srcrect = arg_srcrect;
    _ = &srcrect;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    var scaleMode = arg_scaleMode;
    _ = &scaleMode;
    var result: bool = undefined;
    _ = &result;
    var src_locked: c_int = undefined;
    _ = &src_locked;
    var dst_locked: c_int = undefined;
    _ = &dst_locked;
    var full_src: SDL_Rect = undefined;
    _ = &full_src;
    var full_dst: SDL_Rect = undefined;
    _ = &full_dst;
    var src_tmp: [*c]SDL_Surface = undefined;
    _ = &src_tmp;
    var src_tmp_1: [*c]SDL_Surface = undefined;
    _ = &src_tmp_1;
    var dst_tmp: [*c]SDL_Surface = undefined;
    _ = &dst_tmp;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(src != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!(dst != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (src.*.format != dst.*.format) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                src_tmp = SDL_ConvertSurfaceAndColorspace_REAL(src, dst.*.format, dst.*.palette, dst.*.colorspace, dst.*.props);
                if (!(src_tmp != null)) {
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
                if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                result = SDL_StretchSurface_REAL(src_tmp, srcrect, dst, dstrect, scaleMode);
                SDL_DestroySurface_REAL(src_tmp);
                return result;
            },
            13 => {
                if (!(dstrect != null)) {
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
                switch (scaleMode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 27;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            16 => {
                full_dst.x = 0;
                full_dst.y = 0;
                full_dst.w = dst.*.w;
                full_dst.h = dst.*.h;
                dstrect = &full_dst;
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
                src_tmp_1 = SDL_ConvertSurface_REAL(src, SDL_PIXELFORMAT_XRGB8888);
                dst_tmp = SDL_CreateSurfaceUninitialized(dstrect.*.w, dstrect.*.h, SDL_PIXELFORMAT_XRGB8888);
                if ((src_tmp_1 != null) and (dst_tmp != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                result = SDL_StretchSurface_REAL(src_tmp_1, srcrect, dst_tmp, null, scaleMode);
                if (result) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                result = @"false" != 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                SDL_DestroySurface_REAL(src_tmp_1);
                SDL_DestroySurface_REAL(dst_tmp);
                return result;
            },
            22 => {
                result = SDL_ConvertPixelsAndColorspace_REAL(dstrect.*.w, dstrect.*.h, dst_tmp.*.format, SDL_COLORSPACE_SRGB, 0, dst_tmp.*.pixels, dst_tmp.*.pitch, dst.*.format, dst.*.colorspace, SDL_GetSurfaceProperties_REAL(dst), @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.x * (if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))))))))), dst.*.pitch);
                {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                if (scaleMode == SDL_SCALEMODE_LINEAR) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                scaleMode = SDL_SCALEMODE_NEAREST;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scaleMode"))));
            },
            30 => {
                if (((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) != @as(c_int, 4)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010))) {
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
                if (srcrect != null) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            33 => {
                return SDL_SetError_REAL("Wrong format");
            },
            34 => {
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
            36 => {
                if ((((srcrect.*.x < @as(c_int, 0)) or (srcrect.*.y < @as(c_int, 0))) or ((srcrect.*.x + srcrect.*.w) > src.*.w)) or ((srcrect.*.y + srcrect.*.h) > src.*.h)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            37 => {
                full_src.x = 0;
                full_src.y = 0;
                full_src.w = src.*.w;
                full_src.h = src.*.h;
                srcrect = &full_src;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                if (dstrect != null) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            39 => {
                return SDL_SetError_REAL("Invalid source blit rectangle");
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                if ((((dstrect.*.x < @as(c_int, 0)) or (dstrect.*.y < @as(c_int, 0))) or ((dstrect.*.x + dstrect.*.w) > dst.*.w)) or ((dstrect.*.y + dstrect.*.h) > dst.*.h)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            43 => {
                full_dst.x = 0;
                full_dst.y = 0;
                full_dst.w = dst.*.w;
                full_dst.h = dst.*.h;
                dstrect = &full_dst;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                if ((dstrect.*.w <= @as(c_int, 0)) or (dstrect.*.h <= @as(c_int, 0))) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            45 => {
                return SDL_SetError_REAL("Invalid destination blit rectangle");
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            48 => {
                return @"true" != 0;
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                if ((((srcrect.*.w > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))) or (srcrect.*.h > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) or (dstrect.*.w > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) or (dstrect.*.h > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                return SDL_SetError_REAL("Size too large for scaling");
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                dst_locked = 0;
                if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                if (!SDL_LockSurface_REAL(dst)) {
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
                src_locked = 0;
                if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            57 => {
                return SDL_SetError_REAL("Unable to lock destination surface");
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                dst_locked = 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                if (!SDL_LockSurface_REAL(src)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
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
                if (scaleMode == SDL_SCALEMODE_NEAREST) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            63 => {
                if (dst_locked != 0) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
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
                src_locked = 1;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            66 => {
                SDL_UnlockSurface_REAL(dst);
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
                return SDL_SetError_REAL("Unable to lock source surface");
            },
            69 => {
                result = SDL_StretchSurfaceUncheckedNearest(src, srcrect, dst, dstrect);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                result = SDL_StretchSurfaceUncheckedLinear(src, srcrect, dst, dstrect);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                if (dst_locked != 0) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                SDL_UnlockSurface_REAL(dst);
                {
                    sdl_pc = 74;
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
                if (src_locked != 0) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                SDL_UnlockSurface_REAL(src);
                {
                    sdl_pc = 77;
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub fn get_scaler_datas(src_nb: c_int, dst_nb: c_int, fp_start: [*c]Sint64, fp_step: [*c]c_int, left_pad: [*c]c_int, right_pad: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var step: c_int = @bitCast(@as(c_uint, @truncate((@as(Uint32, @bitCast(@as(c_int, src_nb))) << @intCast(@as(Uint32, 16))) / @as(Uint32, @bitCast(@as(c_int, dst_nb))))));
    _ = &step;
    var x0: c_int = @bitCast(@as(c_uint, @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, 16))) / @as(Uint32, 2))));
    _ = &x0;
    var fp_sum: Sint64 = undefined;
    _ = &fp_sum;
    var i: c_int = undefined;
    _ = &i;
    var tmp: [2]Sint64 = undefined;
    _ = &tmp;
    tmp[@as(c_int, 0)] = @as(Sint64, step) * @as(Sint64, x0 >> @intCast(@as(c_int, 16)));
    tmp[@as(c_int, 1)] = @as(Sint64, step) * @as(Sint64, x0 & @as(c_int, 65535));
    x0 = @truncate(tmp[@as(c_int, 0)] + ((tmp[@as(c_int, 1)] + @as(Sint64, 32768)) >> @intCast(@as(Sint64, 16))));
    {
        const ref = &x0;
        ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) -% ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, 16))) / @as(Uint32, 2)))));
    }
    fp_start.* = x0;
    fp_step.* = step;
    left_pad.* = 0;
    right_pad.* = 0;
    fp_sum = x0;
    {
        i = 0;
        while (i < dst_nb) : (i += 1) {
            if (fp_sum < @as(Sint64, 0)) {
                left_pad.* += 1;
            } else {
                var index_1: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum)))) >> @intCast(@as(Uint32, 16)))));
                _ = &index_1;
                if (index_1 > (src_nb - @as(c_int, 2))) {
                    right_pad.* += 1;
                }
            }
            fp_sum += step;
        }
    }
}
pub const struct_color_t = extern struct {
    a: Uint8 = 0,
    b: Uint8 = 0,
    c: Uint8 = 0,
    d: Uint8 = 0,
};
pub const color_t = struct_color_t;
pub fn INTERPOL(src_x0: [*c]const Uint32, src_x1: [*c]const Uint32, frac0: c_int, frac1: c_int, dst: [*c]Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var c0: [*c]const color_t = @ptrCast(@alignCast(src_x0));
    _ = &c0;
    var c1: [*c]const color_t = @ptrCast(@alignCast(src_x1));
    _ = &c1;
    var cx: [*c]color_t = @ptrCast(@alignCast(dst));
    _ = &cx;
    cx.*.a = @truncate(@as(Uint32, @bitCast(@as(c_int, (frac1 * @as(c_int, c0.*.a)) + (frac0 * @as(c_int, c1.*.a))))) >> @intCast(@as(Uint32, PRECISION)));
    cx.*.b = @truncate(@as(Uint32, @bitCast(@as(c_int, (frac1 * @as(c_int, c0.*.b)) + (frac0 * @as(c_int, c1.*.b))))) >> @intCast(@as(Uint32, PRECISION)));
    cx.*.c = @truncate(@as(Uint32, @bitCast(@as(c_int, (frac1 * @as(c_int, c0.*.c)) + (frac0 * @as(c_int, c1.*.c))))) >> @intCast(@as(Uint32, PRECISION)));
    cx.*.d = @truncate(@as(Uint32, @bitCast(@as(c_int, (frac1 * @as(c_int, c0.*.d)) + (frac0 * @as(c_int, c1.*.d))))) >> @intCast(@as(Uint32, PRECISION)));
}
pub fn INTERPOL_BILINEAR(s0: [*c]const Uint32, s1: [*c]const Uint32, frac_w0: c_int, frac_h0: c_int, frac_h1: c_int, dst: [*c]Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tmp: [2]Uint32 = undefined;
    _ = &tmp;
    var frac_w1: c_uint = @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - frac_w0));
    _ = &frac_w1;
    INTERPOL(s0, s1, frac_h0, frac_h1, @ptrCast(@alignCast(&tmp)));
    INTERPOL(s0 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), s1 + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), frac_h0, frac_h1, @as([*c]Uint32, @ptrCast(@alignCast(&tmp))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))));
    INTERPOL(@ptrCast(@alignCast(&tmp)), @as([*c]Uint32, @ptrCast(@alignCast(&tmp))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), frac_w0, @bitCast(@as(c_uint, @truncate(frac_w1))), dst);
}
pub fn scale_mat(src: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var i: c_int = undefined;
    _ = &i;
    var fp_sum_h: Sint64 = undefined;
    _ = &fp_sum_h;
    var fp_step_h: c_int = undefined;
    _ = &fp_step_h;
    var left_pad_h: c_int = undefined;
    _ = &left_pad_h;
    var right_pad_h: c_int = undefined;
    _ = &right_pad_h;
    var fp_sum_w: Sint64 = undefined;
    _ = &fp_sum_w;
    var fp_step_w: c_int = undefined;
    _ = &fp_step_w;
    var left_pad_w: c_int = undefined;
    _ = &left_pad_w;
    var right_pad_w: c_int = undefined;
    _ = &right_pad_w;
    var fp_sum_w_init: Sint64 = undefined;
    _ = &fp_sum_w_init;
    var left_pad_w_init: c_int = undefined;
    _ = &left_pad_w_init;
    var right_pad_w_init: c_int = undefined;
    _ = &right_pad_w_init;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var middle_init: c_int = undefined;
    _ = &middle_init;
    get_scaler_datas(src_h, dst_h, &fp_sum_h, &fp_step_h, &left_pad_h, &right_pad_h);
    get_scaler_datas(src_w, dst_w, &fp_sum_w, &fp_step_w, &left_pad_w, &right_pad_w);
    fp_sum_w_init = fp_sum_w + @as(Sint64, left_pad_w * fp_step_w);
    left_pad_w_init = left_pad_w;
    right_pad_w_init = right_pad_w;
    dst_gap = dst_pitch - (@as(c_int, 4) * dst_w);
    middle_init = (dst_w - left_pad_w) - right_pad_w;
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            var index_h: c_int = undefined;
            _ = &index_h;
            var frac_h0: c_int = undefined;
            _ = &frac_h0;
            var frac_h1: c_int = undefined;
            _ = &frac_h1;
            var middle: c_int = undefined;
            _ = &middle;
            var src_h0: [*c]const Uint32 = undefined;
            _ = &src_h0;
            var src_h1: [*c]const Uint32 = undefined;
            _ = &src_h1;
            var no_padding: c_int = undefined;
            _ = &no_padding;
            var incr_h0: Uint64 = undefined;
            _ = &incr_h0;
            var incr_h1: Uint64 = undefined;
            _ = &incr_h1;
            no_padding = @intFromBool(!((i < left_pad_h) or (i > ((dst_h - @as(c_int, 1)) - right_pad_h))));
            index_h = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_h)))) >> @intCast(@as(Uint32, 16)))));
            frac_h0 = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_h >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
            index_h = if (no_padding != 0) index_h else if (i < left_pad_h) @as(c_int, 0) else src_h - @as(c_int, 1);
            frac_h0 = if (no_padding != 0) frac_h0 else @as(c_int, 0);
            incr_h1 = @bitCast(@as(c_long, if (no_padding != 0) src_pitch else @as(c_int, 0)));
            incr_h0 = @as(Uint64, @bitCast(@as(c_long, index_h))) *% @as(Uint64, @bitCast(@as(c_long, src_pitch)));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + incr_h0));
            src_h1 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + incr_h1));
            fp_sum_h += fp_step_h;
            frac_h1 = (@as(c_int, 1) << @intCast(PRECISION)) - frac_h0;
            fp_sum_w = fp_sum_w_init;
            right_pad_w = right_pad_w_init;
            left_pad_w = left_pad_w_init;
            middle = middle_init;
            while ((blk: {
                const ref = &left_pad_w;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                INTERPOL_BILINEAR(src_h0, src_h1, FRAC_ZERO, frac_h0, frac_h1, dst);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            while ((blk: {
                const ref = &middle;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var s_00_01: [*c]const Uint32 = undefined;
                _ = &s_00_01;
                var s_10_11: [*c]const Uint32 = undefined;
                _ = &s_10_11;
                var index_w: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, 4) *% (@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w)))) >> @intCast(@as(Uint32, 16))))));
                _ = &index_w;
                var frac_w: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
                _ = &frac_w;
                fp_sum_w += fp_step_w;
                s_00_01 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                s_10_11 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                INTERPOL_BILINEAR(s_00_01, s_10_11, frac_w, frac_h0, frac_h1, dst);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            while ((blk: {
                const ref = &right_pad_w;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var index_w: c_int = @as(c_int, 4) * (src_w - @as(c_int, 2));
                _ = &index_w;
                var s_00_01: [*c]const Uint32 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                _ = &s_00_01;
                var s_10_11: [*c]const Uint32 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                _ = &s_10_11;
                INTERPOL_BILINEAR(s_00_01, s_10_11, @as(c_int, 1) << @intCast(PRECISION), frac_h0, frac_h1, dst);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub fn hasSSE2() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_val = struct {
        var val: c_int = -@as(c_int, 1);
    };
    _ = &static_local_val;
    if (static_local_val.val != -@as(c_int, 1)) {
        return static_local_val.val;
    }
    static_local_val.val = @intFromBool(SDL_HasSSE2_REAL());
    return static_local_val.val;
}
pub fn INTERPOL_BILINEAR_SSE(s0: [*c]const Uint32, s1: [*c]const Uint32, frac_w: c_int, v_frac_h0: __m128i, v_frac_h1: __m128i, dst: [*c]Uint32, zero: __m128i) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x_00_01: __m128i = undefined;
    _ = &x_00_01;
    var x_10_11: __m128i = undefined;
    _ = &x_10_11;
    var v_frac_w0: __m128i = undefined;
    _ = &v_frac_w0;
    var k0: __m128i = undefined;
    _ = &k0;
    var l0: __m128i = undefined;
    _ = &l0;
    var d0: __m128i = undefined;
    _ = &d0;
    var e0: __m128i = undefined;
    _ = &e0;
    var f: c_int = undefined;
    _ = &f;
    var f2: c_int = undefined;
    _ = &f2;
    f = frac_w;
    f2 = (@as(c_int, 1) << @intCast(PRECISION)) - frac_w;
    v_frac_w0 = _mm_set_epi16(@truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2));
    x_00_01 = _mm_loadl_epi64(@ptrCast(@alignCast(s0)));
    x_10_11 = _mm_loadl_epi64(@ptrCast(@alignCast(s1)));
    k0 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_00_01, zero), v_frac_h1);
    l0 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_10_11, zero), v_frac_h0);
    k0 = _mm_add_epi16(k0, l0);
    l0 = _mm_unpacklo_epi64(l0, k0);
    k0 = _mm_madd_epi16(_mm_unpackhi_epi16(l0, k0), v_frac_w0);
    d0 = _mm_srli_epi32(k0, PRECISION * @as(c_int, 2));
    e0 = _mm_packs_epi32(d0, d0);
    e0 = _mm_packus_epi16(e0, e0);
    dst.* = @bitCast(@as(c_int, _mm_cvtsi128_si32(e0)));
}
pub fn scale_mat_SSE(src: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var i: c_int = undefined;
    _ = &i;
    var fp_sum_h: Sint64 = undefined;
    _ = &fp_sum_h;
    var fp_step_h: c_int = undefined;
    _ = &fp_step_h;
    var left_pad_h: c_int = undefined;
    _ = &left_pad_h;
    var right_pad_h: c_int = undefined;
    _ = &right_pad_h;
    var fp_sum_w: Sint64 = undefined;
    _ = &fp_sum_w;
    var fp_step_w: c_int = undefined;
    _ = &fp_step_w;
    var left_pad_w: c_int = undefined;
    _ = &left_pad_w;
    var right_pad_w: c_int = undefined;
    _ = &right_pad_w;
    var fp_sum_w_init: Sint64 = undefined;
    _ = &fp_sum_w_init;
    var left_pad_w_init: c_int = undefined;
    _ = &left_pad_w_init;
    var right_pad_w_init: c_int = undefined;
    _ = &right_pad_w_init;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var middle_init: c_int = undefined;
    _ = &middle_init;
    get_scaler_datas(src_h, dst_h, &fp_sum_h, &fp_step_h, &left_pad_h, &right_pad_h);
    get_scaler_datas(src_w, dst_w, &fp_sum_w, &fp_step_w, &left_pad_w, &right_pad_w);
    fp_sum_w_init = fp_sum_w + @as(Sint64, left_pad_w * fp_step_w);
    left_pad_w_init = left_pad_w;
    right_pad_w_init = right_pad_w;
    dst_gap = dst_pitch - (@as(c_int, 4) * dst_w);
    middle_init = (dst_w - left_pad_w) - right_pad_w;
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            var nb_block2: c_int = undefined;
            _ = &nb_block2;
            var v_frac_h0: __m128i = undefined;
            _ = &v_frac_h0;
            var v_frac_h1: __m128i = undefined;
            _ = &v_frac_h1;
            var zero: __m128i = undefined;
            _ = &zero;
            var index_h: c_int = undefined;
            _ = &index_h;
            var frac_h0: c_int = undefined;
            _ = &frac_h0;
            var frac_h1: c_int = undefined;
            _ = &frac_h1;
            var middle: c_int = undefined;
            _ = &middle;
            var src_h0: [*c]const Uint32 = undefined;
            _ = &src_h0;
            var src_h1: [*c]const Uint32 = undefined;
            _ = &src_h1;
            var no_padding: c_int = undefined;
            _ = &no_padding;
            var incr_h0: Uint64 = undefined;
            _ = &incr_h0;
            var incr_h1: Uint64 = undefined;
            _ = &incr_h1;
            no_padding = @intFromBool(!((i < left_pad_h) or (i > ((dst_h - @as(c_int, 1)) - right_pad_h))));
            index_h = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_h)))) >> @intCast(@as(Uint32, 16)))));
            frac_h0 = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_h >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
            index_h = if (no_padding != 0) index_h else if (i < left_pad_h) @as(c_int, 0) else src_h - @as(c_int, 1);
            frac_h0 = if (no_padding != 0) frac_h0 else @as(c_int, 0);
            incr_h1 = @bitCast(@as(c_long, if (no_padding != 0) src_pitch else @as(c_int, 0)));
            incr_h0 = @as(Uint64, @bitCast(@as(c_long, index_h))) *% @as(Uint64, @bitCast(@as(c_long, src_pitch)));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + incr_h0));
            src_h1 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + incr_h1));
            fp_sum_h += fp_step_h;
            frac_h1 = (@as(c_int, 1) << @intCast(PRECISION)) - frac_h0;
            fp_sum_w = fp_sum_w_init;
            right_pad_w = right_pad_w_init;
            left_pad_w = left_pad_w_init;
            middle = middle_init;
            nb_block2 = @divTrunc(middle, @as(c_int, 2));
            v_frac_h0 = _mm_set_epi16(@truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0), @truncate(frac_h0));
            v_frac_h1 = _mm_set_epi16(@truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1), @truncate(frac_h1));
            zero = _mm_setzero_si128();
            while ((blk: {
                const ref = &left_pad_w;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                INTERPOL_BILINEAR_SSE(src_h0, src_h1, FRAC_ZERO, v_frac_h0, v_frac_h1, dst, zero);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            while ((blk: {
                const ref = &nb_block2;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var index_w_0: c_int = undefined;
                _ = &index_w_0;
                var frac_w_0: c_int = undefined;
                _ = &frac_w_0;
                var index_w_1: c_int = undefined;
                _ = &index_w_1;
                var frac_w_1: c_int = undefined;
                _ = &frac_w_1;
                var s_00_01: [*c]const Uint32 = undefined;
                _ = &s_00_01;
                var s_02_03: [*c]const Uint32 = undefined;
                _ = &s_02_03;
                var s_10_11: [*c]const Uint32 = undefined;
                _ = &s_10_11;
                var s_12_13: [*c]const Uint32 = undefined;
                _ = &s_12_13;
                var x_00_01: __m128i = undefined;
                _ = &x_00_01;
                var x_10_11: __m128i = undefined;
                _ = &x_10_11;
                var x_02_03: __m128i = undefined;
                _ = &x_02_03;
                var x_12_13: __m128i = undefined;
                _ = &x_12_13;
                var v_frac_w0: __m128i = undefined;
                _ = &v_frac_w0;
                var k0: __m128i = undefined;
                _ = &k0;
                var l0: __m128i = undefined;
                _ = &l0;
                var d0: __m128i = undefined;
                _ = &d0;
                var e0: __m128i = undefined;
                _ = &e0;
                var v_frac_w1: __m128i = undefined;
                _ = &v_frac_w1;
                var k1: __m128i = undefined;
                _ = &k1;
                var l1: __m128i = undefined;
                _ = &l1;
                var d1: __m128i = undefined;
                _ = &d1;
                var e1: __m128i = undefined;
                _ = &e1;
                var f: c_int = undefined;
                _ = &f;
                var f2: c_int = undefined;
                _ = &f2;
                index_w_0 = @bitCast(@as(c_uint, @truncate(@as(Uint32, 4) *% (@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w)))) >> @intCast(@as(Uint32, 16))))));
                frac_w_0 = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
                fp_sum_w += fp_step_w;
                index_w_1 = @bitCast(@as(c_uint, @truncate(@as(Uint32, 4) *% (@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w)))) >> @intCast(@as(Uint32, 16))))));
                frac_w_1 = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
                fp_sum_w += fp_step_w;
                s_00_01 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w_0))))));
                s_02_03 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w_1))))));
                s_10_11 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w_0))))));
                s_12_13 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w_1))))));
                f = frac_w_0;
                f2 = (@as(c_int, 1) << @intCast(PRECISION)) - frac_w_0;
                v_frac_w0 = _mm_set_epi16(@truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2));
                f = frac_w_1;
                f2 = (@as(c_int, 1) << @intCast(PRECISION)) - frac_w_1;
                v_frac_w1 = _mm_set_epi16(@truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2), @truncate(f), @truncate(f2));
                x_00_01 = _mm_loadl_epi64(@ptrCast(@alignCast(s_00_01)));
                x_02_03 = _mm_loadl_epi64(@ptrCast(@alignCast(s_02_03)));
                x_10_11 = _mm_loadl_epi64(@ptrCast(@alignCast(s_10_11)));
                x_12_13 = _mm_loadl_epi64(@ptrCast(@alignCast(s_12_13)));
                k0 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_00_01, zero), v_frac_h1);
                l0 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_10_11, zero), v_frac_h0);
                k0 = _mm_add_epi16(k0, l0);
                k1 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_02_03, zero), v_frac_h1);
                l1 = _mm_mullo_epi16(_mm_unpacklo_epi8(x_12_13, zero), v_frac_h0);
                k1 = _mm_add_epi16(k1, l1);
                l0 = _mm_unpacklo_epi64(l0, k0);
                k0 = _mm_madd_epi16(_mm_unpackhi_epi16(l0, k0), v_frac_w0);
                l1 = _mm_unpacklo_epi64(l1, k1);
                k1 = _mm_madd_epi16(_mm_unpackhi_epi16(l1, k1), v_frac_w1);
                d0 = _mm_srli_epi32(k0, PRECISION * @as(c_int, 2));
                e0 = _mm_packs_epi32(d0, d0);
                e0 = _mm_packus_epi16(e0, e0);
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_int, _mm_cvtsi128_si32(e0)));
                d1 = _mm_srli_epi32(k1, PRECISION * @as(c_int, 2));
                e1 = _mm_packs_epi32(d1, d1);
                e1 = _mm_packus_epi16(e1, e1);
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @bitCast(@as(c_int, _mm_cvtsi128_si32(e1)));
            }
            if ((middle & @as(c_int, 1)) != 0) {
                var s_00_01: [*c]const Uint32 = undefined;
                _ = &s_00_01;
                var s_10_11: [*c]const Uint32 = undefined;
                _ = &s_10_11;
                var index_w: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, 4) *% (@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w)))) >> @intCast(@as(Uint32, 16))))));
                _ = &index_w;
                var frac_w: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, @truncate(fp_sum_w >> @intCast(@as(Sint64, @as(c_int, 16) - PRECISION)))))) & @as(Uint32, @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(PRECISION)) - @as(c_int, 1)))))));
                _ = &frac_w;
                fp_sum_w += fp_step_w;
                s_00_01 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                s_10_11 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                INTERPOL_BILINEAR_SSE(s_00_01, s_10_11, frac_w, v_frac_h0, v_frac_h1, dst, zero);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            while ((blk: {
                const ref = &right_pad_w;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var index_w: c_int = @as(c_int, 4) * (src_w - @as(c_int, 2));
                _ = &index_w;
                var s_00_01: [*c]const Uint32 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                _ = &s_00_01;
                var s_10_11: [*c]const Uint32 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h1))) + @as(usize, @bitCast(@as(isize, @intCast(index_w))))));
                _ = &s_10_11;
                INTERPOL_BILINEAR_SSE(s_00_01, s_10_11, @as(c_int, 1) << @intCast(PRECISION), v_frac_h0, v_frac_h1, dst, zero);
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_StretchSurfaceUncheckedLinear(s: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, d: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"false" != 0;
    _ = &result;
    var src_w: c_int = srcrect.*.w;
    _ = &src_w;
    var src_h: c_int = srcrect.*.h;
    _ = &src_h;
    var dst_w: c_int = dstrect.*.w;
    _ = &dst_w;
    var dst_h: c_int = dstrect.*.h;
    _ = &dst_h;
    var src_pitch: c_int = s.*.pitch;
    _ = &src_pitch;
    var dst_pitch: c_int = d.*.pitch;
    _ = &dst_pitch;
    var src: [*c]Uint32 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(s.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.x * @as(c_int, 4)))))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.y * src_pitch))))));
    _ = &src;
    var dst: [*c]Uint32 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(d.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.x * @as(c_int, 4)))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.y * dst_pitch))))));
    _ = &dst;
    if (!result and (hasSSE2() != 0)) {
        result = scale_mat_SSE(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    }
    if (!result) {
        result = scale_mat(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    }
    return result;
}
pub fn scale_mat_nearest_1(src_ptr: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var bpp: Uint32 = 1;
    _ = &bpp;
    var i: c_int = undefined;
    _ = &i;
    var posy: Uint64 = undefined;
    _ = &posy;
    var incy: Uint64 = undefined;
    _ = &incy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incx: Uint64 = undefined;
    _ = &incx;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var n: c_int = undefined;
    _ = &n;
    var src_h0: [*c]const Uint32 = undefined;
    _ = &src_h0;
    incy = (@as(Uint64, @bitCast(@as(c_long, src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_h)));
    incx = (@as(Uint64, @bitCast(@as(c_long, src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_w)));
    dst_gap = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, dst_pitch))) -% (bpp *% @as(Uint32, @bitCast(@as(c_int, dst_w)))))));
    posy = incy / @as(Uint64, 2);
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            srcy = posy >> @intCast(@as(Uint64, 16));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_ptr))) + (srcy *% @as(Uint64, @bitCast(@as(c_long, src_pitch))))));
            posy +%= incy;
            posx = incx / @as(Uint64, 2);
            n = dst_w;
            while ((blk: {
                const ref = &n;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var src: [*c]const Uint8 = undefined;
                _ = &src;
                srcx = @as(Uint64, bpp) *% (posx >> @intCast(@as(Uint64, 16)));
                posx +%= incx;
                src = @as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + srcx;
                @as([*c]Uint8, @ptrCast(@alignCast(dst))).* = src.*;
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + bpp));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub fn scale_mat_nearest_2(src_ptr: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var bpp: Uint32 = 2;
    _ = &bpp;
    var i: c_int = undefined;
    _ = &i;
    var posy: Uint64 = undefined;
    _ = &posy;
    var incy: Uint64 = undefined;
    _ = &incy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incx: Uint64 = undefined;
    _ = &incx;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var n: c_int = undefined;
    _ = &n;
    var src_h0: [*c]const Uint32 = undefined;
    _ = &src_h0;
    incy = (@as(Uint64, @bitCast(@as(c_long, src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_h)));
    incx = (@as(Uint64, @bitCast(@as(c_long, src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_w)));
    dst_gap = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, dst_pitch))) -% (bpp *% @as(Uint32, @bitCast(@as(c_int, dst_w)))))));
    posy = incy / @as(Uint64, 2);
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            srcy = posy >> @intCast(@as(Uint64, 16));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_ptr))) + (srcy *% @as(Uint64, @bitCast(@as(c_long, src_pitch))))));
            posy +%= incy;
            posx = incx / @as(Uint64, 2);
            n = dst_w;
            while ((blk: {
                const ref = &n;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var src: [*c]const Uint16 = undefined;
                _ = &src;
                srcx = @as(Uint64, bpp) *% (posx >> @intCast(@as(Uint64, 16)));
                posx +%= incx;
                src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + srcx));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = src.*;
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + bpp));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub fn scale_mat_nearest_3(src_ptr: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var bpp: Uint32 = 3;
    _ = &bpp;
    var i: c_int = undefined;
    _ = &i;
    var posy: Uint64 = undefined;
    _ = &posy;
    var incy: Uint64 = undefined;
    _ = &incy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incx: Uint64 = undefined;
    _ = &incx;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var n: c_int = undefined;
    _ = &n;
    var src_h0: [*c]const Uint32 = undefined;
    _ = &src_h0;
    incy = (@as(Uint64, @bitCast(@as(c_long, src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_h)));
    incx = (@as(Uint64, @bitCast(@as(c_long, src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_w)));
    dst_gap = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, dst_pitch))) -% (bpp *% @as(Uint32, @bitCast(@as(c_int, dst_w)))))));
    posy = incy / @as(Uint64, 2);
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            srcy = posy >> @intCast(@as(Uint64, 16));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_ptr))) + (srcy *% @as(Uint64, @bitCast(@as(c_long, src_pitch))))));
            posy +%= incy;
            posx = incx / @as(Uint64, 2);
            n = dst_w;
            while ((blk: {
                const ref = &n;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var src: [*c]const Uint8 = undefined;
                _ = &src;
                srcx = @as(Uint64, bpp) *% (posx >> @intCast(@as(Uint64, 16)));
                posx +%= incx;
                src = @as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + srcx;
                @as([*c]Uint8, @ptrCast(@alignCast(dst)))[@as(c_int, 0)] = src[@as(c_int, 0)];
                @as([*c]Uint8, @ptrCast(@alignCast(dst)))[@as(c_int, 1)] = src[@as(c_int, 1)];
                @as([*c]Uint8, @ptrCast(@alignCast(dst)))[@as(c_int, 2)] = src[@as(c_int, 2)];
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + bpp));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub fn scale_mat_nearest_4(src_ptr: [*c]const Uint32, src_w: c_int, src_h: c_int, src_pitch: c_int, arg_dst: [*c]Uint32, dst_w: c_int, dst_h: c_int, dst_pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var bpp: Uint32 = 4;
    _ = &bpp;
    var i: c_int = undefined;
    _ = &i;
    var posy: Uint64 = undefined;
    _ = &posy;
    var incy: Uint64 = undefined;
    _ = &incy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incx: Uint64 = undefined;
    _ = &incx;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var dst_gap: c_int = undefined;
    _ = &dst_gap;
    var n: c_int = undefined;
    _ = &n;
    var src_h0: [*c]const Uint32 = undefined;
    _ = &src_h0;
    incy = (@as(Uint64, @bitCast(@as(c_long, src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_h)));
    incx = (@as(Uint64, @bitCast(@as(c_long, src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, dst_w)));
    dst_gap = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, dst_pitch))) -% (bpp *% @as(Uint32, @bitCast(@as(c_int, dst_w)))))));
    posy = incy / @as(Uint64, 2);
    {
        i = 0;
        while (i < dst_h) : (i += 1) {
            srcy = posy >> @intCast(@as(Uint64, 16));
            src_h0 = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_ptr))) + (srcy *% @as(Uint64, @bitCast(@as(c_long, src_pitch))))));
            posy +%= incy;
            posx = incx / @as(Uint64, 2);
            n = dst_w;
            while ((blk: {
                const ref = &n;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var src: [*c]const Uint32 = undefined;
                _ = &src;
                srcx = @as(Uint64, bpp) *% (posx >> @intCast(@as(Uint64, 16)));
                posx +%= incx;
                src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src_h0))) + srcx));
                dst.* = src.*;
                dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + bpp));
            }
            dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_gap))))));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_StretchSurfaceUncheckedNearest(s: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, d: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var src_w: c_int = srcrect.*.w;
    _ = &src_w;
    var src_h: c_int = srcrect.*.h;
    _ = &src_h;
    var dst_w: c_int = dstrect.*.w;
    _ = &dst_w;
    var dst_h: c_int = dstrect.*.h;
    _ = &dst_h;
    var src_pitch: c_int = s.*.pitch;
    _ = &src_pitch;
    var dst_pitch: c_int = d.*.pitch;
    _ = &dst_pitch;
    var bpp: c_int = if ((d.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((d.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (d.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((d.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &bpp;
    var src: [*c]Uint32 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(s.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.x * bpp))))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.y * src_pitch))))));
    _ = &src;
    var dst: [*c]Uint32 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(d.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.x * bpp))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.y * dst_pitch))))));
    _ = &dst;
    if (bpp == @as(c_int, 4)) {
        return scale_mat_nearest_4(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    } else if (bpp == @as(c_int, 3)) {
        return scale_mat_nearest_3(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    } else if (bpp == @as(c_int, 2)) {
        return scale_mat_nearest_2(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    } else {
        return scale_mat_nearest_1(src, src_w, src_h, src_pitch, dst, dst_w, dst_h, dst_pitch);
    }
}

pub const SDL_StretchSurface = SDL_StretchSurface_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const PRECISION = @as(c_int, 7);
pub const FRAC_ZERO = @as(c_int, 0);
