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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_BlendMode = Uint32;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
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
pub extern fn SDL_MapRGBA_REAL(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub const SDL_SurfaceFlags = Uint32;
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
pub const SDL_Surface = struct_SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_GetSurfaceClipRect_REAL(surface: [*c]SDL_Surface, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_FillSurfaceRect_REAL(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: Uint32) bool;
pub extern fn SDL_BlitSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub extern fn SDL_MapSurfaceRGBA_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub const SDL_TEXTURE_ADDRESS_CLAMP: c_int = 1;
pub const SDL_TEXTURE_ADDRESS_WRAP: c_int = 2;
pub const enum_SDL_TextureAddressMode = c_int;
pub const SDL_TextureAddressMode = enum_SDL_TextureAddressMode;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub export fn SDL_SW_FillTriangle(dst: [*c]SDL_Surface, d0: [*c]SDL_Point, d1: [*c]SDL_Point, d2: [*c]SDL_Point, blend: SDL_BlendMode, c0: SDL_Color, c1: SDL_Color, c2: SDL_Color) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var dst_locked: c_int = undefined;
    _ = &dst_locked;
    var dstrect: SDL_Rect = undefined;
    _ = &dstrect;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var dst_ptr: [*c]Uint8 = undefined;
    _ = &dst_ptr;
    var dst_pitch: c_int = undefined;
    _ = &dst_pitch;
    var area: Sint64 = undefined;
    _ = &area;
    var is_clockwise: c_int = undefined;
    _ = &is_clockwise;
    var d2d1_y: c_int = undefined;
    _ = &d2d1_y;
    var d1d2_x: c_int = undefined;
    _ = &d1d2_x;
    var d0d2_y: c_int = undefined;
    _ = &d0d2_y;
    var d2d0_x: c_int = undefined;
    _ = &d2d0_x;
    var d1d0_y: c_int = undefined;
    _ = &d1d0_y;
    var d0d1_x: c_int = undefined;
    _ = &d0d1_x;
    var w0_row: Sint64 = undefined;
    _ = &w0_row;
    var w1_row: Sint64 = undefined;
    _ = &w1_row;
    var w2_row: Sint64 = undefined;
    _ = &w2_row;
    var bias_w0: c_int = undefined;
    _ = &bias_w0;
    var bias_w1: c_int = undefined;
    _ = &bias_w1;
    var bias_w2: c_int = undefined;
    _ = &bias_w2;
    var is_uniform: bool = undefined;
    _ = &is_uniform;
    var tmp: [*c]SDL_Surface = undefined;
    _ = &tmp;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var rect_1: SDL_Rect = undefined;
    _ = &rect_1;
    var format: SDL_PixelFormat = undefined;
    _ = &format;
    var c: Uint32 = undefined;
    _ = &c;
    var val: c_int = undefined;
    _ = &val;
    var p: SDL_Point = undefined;
    _ = &p;
    var color: Uint32 = undefined;
    _ = &color;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var w0: Sint64 = undefined;
    _ = &w0;
    var w1: Sint64 = undefined;
    _ = &w1;
    var w2: Sint64 = undefined;
    _ = &w2;
    var dptr: [*c]Uint8 = undefined;
    _ = &dptr;
    var x_2: c_int = undefined;
    _ = &x_2;
    var y_3: c_int = undefined;
    _ = &y_3;
    var w0_4: Sint64 = undefined;
    _ = &w0_4;
    var w1_5: Sint64 = undefined;
    _ = &w1_5;
    var w2_6: Sint64 = undefined;
    _ = &w2_6;
    var dptr_7: [*c]Uint8 = undefined;
    _ = &dptr_7;
    var s: [*c]Uint8 = undefined;
    _ = &s;
    var x_8: c_int = undefined;
    _ = &x_8;
    var y_9: c_int = undefined;
    _ = &y_9;
    var w0_10: Sint64 = undefined;
    _ = &w0_10;
    var w1_11: Sint64 = undefined;
    _ = &w1_11;
    var w2_12: Sint64 = undefined;
    _ = &w2_12;
    var dptr_13: [*c]Uint8 = undefined;
    _ = &dptr_13;
    var x_14: c_int = undefined;
    _ = &x_14;
    var y_15: c_int = undefined;
    _ = &y_15;
    var w0_16: Sint64 = undefined;
    _ = &w0_16;
    var w1_17: Sint64 = undefined;
    _ = &w1_17;
    var w2_18: Sint64 = undefined;
    _ = &w2_18;
    var dptr_19: [*c]Uint8 = undefined;
    _ = &dptr_19;
    var format_20: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &format_20;
    var palette: [*c]SDL_Palette = undefined;
    _ = &palette;
    var x_21: c_int = undefined;
    _ = &x_21;
    var y_22: c_int = undefined;
    _ = &y_22;
    var w0_23: Sint64 = undefined;
    _ = &w0_23;
    var w1_24: Sint64 = undefined;
    _ = &w1_24;
    var w2_25: Sint64 = undefined;
    _ = &w2_25;
    var dptr_26: [*c]Uint8 = undefined;
    _ = &dptr_26;
    var r: Uint8 = undefined;
    _ = &r;
    var g: Uint8 = undefined;
    _ = &g;
    var b: Uint8 = undefined;
    _ = &b;
    var a: Uint8 = undefined;
    _ = &a;
    var color_27: Uint32 = undefined;
    _ = &color_27;
    var x_28: c_int = undefined;
    _ = &x_28;
    var y_29: c_int = undefined;
    _ = &y_29;
    var w0_30: Sint64 = undefined;
    _ = &w0_30;
    var w1_31: Sint64 = undefined;
    _ = &w1_31;
    var w2_32: Sint64 = undefined;
    _ = &w2_32;
    var dptr_33: [*c]Uint8 = undefined;
    _ = &dptr_33;
    var r_34: Uint8 = undefined;
    _ = &r_34;
    var g_35: Uint8 = undefined;
    _ = &g_35;
    var b_36: Uint8 = undefined;
    _ = &b_36;
    var a_37: Uint8 = undefined;
    _ = &a_37;
    var color_38: Uint32 = undefined;
    _ = &color_38;
    var s_39: [*c]Uint8 = undefined;
    _ = &s_39;
    var x_40: c_int = undefined;
    _ = &x_40;
    var y_41: c_int = undefined;
    _ = &y_41;
    var w0_42: Sint64 = undefined;
    _ = &w0_42;
    var w1_43: Sint64 = undefined;
    _ = &w1_43;
    var w2_44: Sint64 = undefined;
    _ = &w2_44;
    var dptr_45: [*c]Uint8 = undefined;
    _ = &dptr_45;
    var r_46: Uint8 = undefined;
    _ = &r_46;
    var g_47: Uint8 = undefined;
    _ = &g_47;
    var b_48: Uint8 = undefined;
    _ = &b_48;
    var a_49: Uint8 = undefined;
    _ = &a_49;
    var color_50: Uint32 = undefined;
    _ = &color_50;
    var x_51: c_int = undefined;
    _ = &x_51;
    var y_52: c_int = undefined;
    _ = &y_52;
    var w0_53: Sint64 = undefined;
    _ = &w0_53;
    var w1_54: Sint64 = undefined;
    _ = &w1_54;
    var w2_55: Sint64 = undefined;
    _ = &w2_55;
    var dptr_56: [*c]Uint8 = undefined;
    _ = &dptr_56;
    var r_57: Uint8 = undefined;
    _ = &r_57;
    var g_58: Uint8 = undefined;
    _ = &g_58;
    var b_59: Uint8 = undefined;
    _ = &b_59;
    var a_60: Uint8 = undefined;
    _ = &a_60;
    var color_61: Uint32 = undefined;
    _ = &color_61;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                dst_locked = 0;
                tmp = null;
                if (!SDL_SurfaceValid(dst)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (dst_locked != 0) {
                    sdl_pc = 174;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                area = cross_product(d0, d1, d2.*.x, d2.*.y);
                is_uniform = ((((@as(c_int, c0.r) == @as(c_int, c1.r)) and (@as(c_int, c0.g) == @as(c_int, c1.g))) and (@as(c_int, c0.b) == @as(c_int, c1.b))) and (@as(c_int, c0.a) == @as(c_int, c1.a))) and ((((@as(c_int, c1.r) == @as(c_int, c2.r)) and (@as(c_int, c1.g) == @as(c_int, c2.g))) and (@as(c_int, c1.b) == @as(c_int, c2.b))) and (@as(c_int, c1.a) == @as(c_int, c2.a)));
                if (area == @as(Sint64, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return @"true" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if (!SDL_LockSurface_REAL(dst)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                bounding_rect_fixedpoint(d0, d1, d2, &dstrect);
                rect.x = 0;
                rect.y = 0;
                rect.w = dst.*.w;
                rect.h = dst.*.h;
                _ = SDL_GetRectIntersection_REAL(&dstrect, &rect, &dstrect);
                _ = SDL_GetSurfaceClipRect_REAL(dst, &rect_1);
                _ = SDL_GetRectIntersection_REAL(&dstrect, &rect_1, &dstrect);
                if (blend != SDL_BLENDMODE_NONE) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            11 => {
                result = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                dst_locked = 1;
                {
                    sdl_pc = 13;
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
                format = dst.*.format;
                if (!(((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                dstbpp = dst.*.fmt.*.bytes_per_pixel;
                dst_ptr = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.x * dstbpp))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.y * dst.*.pitch))));
                dst_pitch = dst.*.pitch;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                is_clockwise = @intFromBool(area > @as(Sint64, 0));
                if (area < @as(Sint64, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            17 => {
                format = SDL_PIXELFORMAT_ARGB8888;
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
                tmp = SDL_CreateSurfaceZeroed(dstrect.w, dstrect.h, format);
                if (!(tmp != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                result = @"false" != 0;
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
                if (blend == SDL_BLENDMODE_MOD) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                c = SDL_MapSurfaceRGBA_REAL(tmp, 255, 255, 255, 255);
                _ = SDL_FillSurfaceRect_REAL(tmp, null, c);
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
                _ = SDL_SetSurfaceBlendMode_REAL(tmp, blend);
                dstbpp = tmp.*.fmt.*.bytes_per_pixel;
                dst_ptr = @ptrCast(@alignCast(tmp.*.pixels));
                dst_pitch = tmp.*.pitch;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            26 => {
                area = -area;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                val = d1.*.y - d2.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                d2d1_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                val *= -@as(c_int, 1);
                d2d1_y = val << @intCast(FP_BITS);
                d2d1_y *= -@as(c_int, 1);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                val = d2.*.y - d0.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                d0d2_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                val *= -@as(c_int, 1);
                d0d2_y = val << @intCast(FP_BITS);
                d0d2_y *= -@as(c_int, 1);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                val = d0.*.y - d1.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                d1d0_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                val *= -@as(c_int, 1);
                d1d0_y = val << @intCast(FP_BITS);
                d1d0_y *= -@as(c_int, 1);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                val = d2.*.x - d1.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                d1d2_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                val *= -@as(c_int, 1);
                d1d2_x = val << @intCast(FP_BITS);
                d1d2_x *= -@as(c_int, 1);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                val = d0.*.x - d2.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                d2d0_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                val *= -@as(c_int, 1);
                d2d0_x = val << @intCast(FP_BITS);
                d2d0_x *= -@as(c_int, 1);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                val = d1.*.x - d0.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                d0d1_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                val *= -@as(c_int, 1);
                d0d1_x = val << @intCast(FP_BITS);
                d0d1_x *= -@as(c_int, 1);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                p.x = dstrect.x;
                p.y = dstrect.y;
                trianglepoint_2_fixedpoint(&p);
                p.x += @divTrunc(@as(c_int, 1) << @intCast(FP_BITS), @as(c_int, 2));
                p.y += @divTrunc(@as(c_int, 1) << @intCast(FP_BITS), @as(c_int, 2));
                w0_row = cross_product(d1, d2, p.x, p.y);
                w1_row = cross_product(d2, d0, p.x, p.y);
                w2_row = cross_product(d0, d1, p.x, p.y);
                if (!(is_clockwise != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                d2d1_y *= -@as(c_int, 1);
                d0d2_y *= -@as(c_int, 1);
                d1d0_y *= -@as(c_int, 1);
                d1d2_x *= -@as(c_int, 1);
                d2d0_x *= -@as(c_int, 1);
                d0d1_x *= -@as(c_int, 1);
                w0_row *= -@as(c_int, 1);
                w1_row *= -@as(c_int, 1);
                w2_row *= -@as(c_int, 1);
                {
                    sdl_pc = 49;
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
                bias_w0 = if (is_top_left(d1, d2, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                bias_w1 = if (is_top_left(d2, d0, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                bias_w2 = if (is_top_left(d0, d1, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                if (is_uniform) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                if (tmp != null) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                if (tmp != null) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            52 => {
                if (tmp != null) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 172;
                    continue;
                }
            },
            53 => {
                color = SDL_MapSurfaceRGBA_REAL(tmp, c0.r, c0.g, c0.b, c0.a);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                color = SDL_MapSurfaceRGBA_REAL(dst, c0.r, c0.g, c0.b, c0.a);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                if (dstbpp == @as(c_int, 4)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                y = 0;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                if (dstbpp == @as(c_int, 3)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            59 => {
                if (y < dstrect.h) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            60 => {
                w0 = w0_row;
                w1 = w1_row;
                w2 = w2_row;
                x = 0;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                y += 1;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            63 => {
                if (x < dstrect.w) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            64 => {
                if ((((w0 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            65 => {
                x += 1;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            67 => {
                dptr = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x * dstbpp))));
                @as([*c]Uint32, @ptrCast(@alignCast(dptr))).* = color;
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
                w0 += d2d1_y;
                w1 += d0d2_y;
                w2 += d1d0_y;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            70 => {
                y_3 = 0;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                if (dstbpp == @as(c_int, 2)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            73 => {
                if (y_3 < dstrect.h) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            74 => {
                w0_4 = w0_row;
                w1_5 = w1_row;
                w2_6 = w2_row;
                x_2 = 0;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            75 => {
                y_3 += 1;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            77 => {
                if (x_2 < dstrect.w) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if ((((w0_4 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_5 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_6 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            79 => {
                x_2 += 1;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            80 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            81 => {
                dptr_7 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_2 * dstbpp))));
                s = @ptrCast(@alignCast(&color));
                dptr_7[@as(c_int, 0)] = s[@as(c_int, 0)];
                dptr_7[@as(c_int, 1)] = s[@as(c_int, 1)];
                dptr_7[@as(c_int, 2)] = s[@as(c_int, 2)];
                {
                    sdl_pc = 83;
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
                w0_4 += d2d1_y;
                w1_5 += d0d2_y;
                w2_6 += d1d0_y;
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            84 => {
                y_9 = 0;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                if (dstbpp == @as(c_int, 1)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            86 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            87 => {
                if (y_9 < dstrect.h) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                w0_10 = w0_row;
                w1_11 = w1_row;
                w2_12 = w2_row;
                x_8 = 0;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                y_9 += 1;
                {
                    sdl_pc = 87;
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
                if (x_8 < dstrect.w) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            92 => {
                if ((((w0_10 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_11 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_12 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            93 => {
                x_8 += 1;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            94 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            95 => {
                dptr_13 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_8 * dstbpp))));
                @as([*c]Uint16, @ptrCast(@alignCast(dptr_13))).* = @truncate(color);
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
                w0_10 += d2d1_y;
                w1_11 += d0d2_y;
                w2_12 += d1d0_y;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            98 => {
                y_15 = 0;
                {
                    sdl_pc = 101;
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
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            101 => {
                if (y_15 < dstrect.h) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            102 => {
                w0_16 = w0_row;
                w1_17 = w1_row;
                w2_18 = w2_row;
                x_14 = 0;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            103 => {
                y_15 += 1;
                {
                    sdl_pc = 101;
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
                if (x_14 < dstrect.w) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            106 => {
                if ((((w0_16 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_17 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_18 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            107 => {
                x_14 += 1;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            108 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            109 => {
                dptr_19 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_14 * dstbpp))));
                dptr_19.* = @truncate(color);
                {
                    sdl_pc = 111;
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
                w0_16 += d2d1_y;
                w1_17 += d0d2_y;
                w2_18 += d1d0_y;
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            112 => {
                format_20 = tmp.*.fmt;
                palette = tmp.*.palette;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            113 => {
                format_20 = dst.*.fmt;
                palette = dst.*.palette;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            114 => {
                if (dstbpp == @as(c_int, 4)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                y_22 = 0;
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            116 => {
                if (dstbpp == @as(c_int, 3)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            118 => {
                if (y_22 < dstrect.h) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            119 => {
                w0_23 = w0_row;
                w1_24 = w1_row;
                w2_25 = w2_row;
                x_21 = 0;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            120 => {
                y_22 += 1;
                {
                    sdl_pc = 118;
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
                if (x_21 < dstrect.w) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            123 => {
                if ((((w0_23 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_24 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_25 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            124 => {
                x_21 += 1;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            125 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            126 => {
                dptr_26 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_21 * dstbpp))));
                r = @bitCast(@as(i8, @truncate(@divTrunc(((w0_23 * @as(Sint64, @as(c_int, c0.r))) + (w1_24 * @as(Sint64, @as(c_int, c1.r)))) + (w2_25 * @as(Sint64, @as(c_int, c2.r))), area))));
                g = @bitCast(@as(i8, @truncate(@divTrunc(((w0_23 * @as(Sint64, @as(c_int, c0.g))) + (w1_24 * @as(Sint64, @as(c_int, c1.g)))) + (w2_25 * @as(Sint64, @as(c_int, c2.g))), area))));
                b = @bitCast(@as(i8, @truncate(@divTrunc(((w0_23 * @as(Sint64, @as(c_int, c0.b))) + (w1_24 * @as(Sint64, @as(c_int, c1.b)))) + (w2_25 * @as(Sint64, @as(c_int, c2.b))), area))));
                a = @bitCast(@as(i8, @truncate(@divTrunc(((w0_23 * @as(Sint64, @as(c_int, c0.a))) + (w1_24 * @as(Sint64, @as(c_int, c1.a)))) + (w2_25 * @as(Sint64, @as(c_int, c2.a))), area))));
                color_27 = SDL_MapRGBA_REAL(format_20, palette, r, g, b, a);
                @as([*c]Uint32, @ptrCast(@alignCast(dptr_26))).* = color_27;
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
                w0_23 += d2d1_y;
                w1_24 += d0d2_y;
                w2_25 += d1d0_y;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            129 => {
                y_29 = 0;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            130 => {
                if (dstbpp == @as(c_int, 2)) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            132 => {
                if (y_29 < dstrect.h) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            133 => {
                w0_30 = w0_row;
                w1_31 = w1_row;
                w2_32 = w2_row;
                x_28 = 0;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            134 => {
                y_29 += 1;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            136 => {
                if (x_28 < dstrect.w) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                if ((((w0_30 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_31 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_32 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 141;
                    continue;
                }
            },
            138 => {
                x_28 += 1;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            139 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            140 => {
                dptr_33 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_28 * dstbpp))));
                r_34 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_30 * @as(Sint64, @as(c_int, c0.r))) + (w1_31 * @as(Sint64, @as(c_int, c1.r)))) + (w2_32 * @as(Sint64, @as(c_int, c2.r))), area))));
                g_35 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_30 * @as(Sint64, @as(c_int, c0.g))) + (w1_31 * @as(Sint64, @as(c_int, c1.g)))) + (w2_32 * @as(Sint64, @as(c_int, c2.g))), area))));
                b_36 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_30 * @as(Sint64, @as(c_int, c0.b))) + (w1_31 * @as(Sint64, @as(c_int, c1.b)))) + (w2_32 * @as(Sint64, @as(c_int, c2.b))), area))));
                a_37 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_30 * @as(Sint64, @as(c_int, c0.a))) + (w1_31 * @as(Sint64, @as(c_int, c1.a)))) + (w2_32 * @as(Sint64, @as(c_int, c2.a))), area))));
                color_38 = SDL_MapRGBA_REAL(format_20, palette, r_34, g_35, b_36, a_37);
                s_39 = @ptrCast(@alignCast(&color_38));
                dptr_33[@as(c_int, 0)] = s_39[@as(c_int, 0)];
                dptr_33[@as(c_int, 1)] = s_39[@as(c_int, 1)];
                dptr_33[@as(c_int, 2)] = s_39[@as(c_int, 2)];
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                w0_30 += d2d1_y;
                w1_31 += d0d2_y;
                w2_32 += d1d0_y;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                y_41 = 0;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            144 => {
                if (dstbpp == @as(c_int, 1)) {
                    sdl_pc = 157;
                    continue;
                } else {
                    sdl_pc = 158;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            146 => {
                if (y_41 < dstrect.h) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            147 => {
                w0_42 = w0_row;
                w1_43 = w1_row;
                w2_44 = w2_row;
                x_40 = 0;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            148 => {
                y_41 += 1;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            150 => {
                if (x_40 < dstrect.w) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            151 => {
                if ((((w0_42 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_43 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_44 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 154;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            152 => {
                x_40 += 1;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            153 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            154 => {
                dptr_45 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_40 * dstbpp))));
                r_46 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_42 * @as(Sint64, @as(c_int, c0.r))) + (w1_43 * @as(Sint64, @as(c_int, c1.r)))) + (w2_44 * @as(Sint64, @as(c_int, c2.r))), area))));
                g_47 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_42 * @as(Sint64, @as(c_int, c0.g))) + (w1_43 * @as(Sint64, @as(c_int, c1.g)))) + (w2_44 * @as(Sint64, @as(c_int, c2.g))), area))));
                b_48 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_42 * @as(Sint64, @as(c_int, c0.b))) + (w1_43 * @as(Sint64, @as(c_int, c1.b)))) + (w2_44 * @as(Sint64, @as(c_int, c2.b))), area))));
                a_49 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_42 * @as(Sint64, @as(c_int, c0.a))) + (w1_43 * @as(Sint64, @as(c_int, c1.a)))) + (w2_44 * @as(Sint64, @as(c_int, c2.a))), area))));
                color_50 = SDL_MapRGBA_REAL(format_20, palette, r_46, g_47, b_48, a_49);
                @as([*c]Uint16, @ptrCast(@alignCast(dptr_45))).* = @truncate(color_50);
                {
                    sdl_pc = 156;
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
                w0_42 += d2d1_y;
                w1_43 += d0d2_y;
                w2_44 += d1d0_y;
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            157 => {
                y_52 = 0;
                {
                    sdl_pc = 160;
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
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            160 => {
                if (y_52 < dstrect.h) {
                    sdl_pc = 161;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            161 => {
                w0_53 = w0_row;
                w1_54 = w1_row;
                w2_55 = w2_row;
                x_51 = 0;
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            162 => {
                y_52 += 1;
                {
                    sdl_pc = 160;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 159;
                    continue;
                }
            },
            164 => {
                if (x_51 < dstrect.w) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            165 => {
                if ((((w0_53 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_54 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_55 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 169;
                    continue;
                }
            },
            166 => {
                x_51 += 1;
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            167 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 162;
                    continue;
                }
            },
            168 => {
                dptr_56 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_51 * dstbpp))));
                r_57 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_53 * @as(Sint64, @as(c_int, c0.r))) + (w1_54 * @as(Sint64, @as(c_int, c1.r)))) + (w2_55 * @as(Sint64, @as(c_int, c2.r))), area))));
                g_58 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_53 * @as(Sint64, @as(c_int, c0.g))) + (w1_54 * @as(Sint64, @as(c_int, c1.g)))) + (w2_55 * @as(Sint64, @as(c_int, c2.g))), area))));
                b_59 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_53 * @as(Sint64, @as(c_int, c0.b))) + (w1_54 * @as(Sint64, @as(c_int, c1.b)))) + (w2_55 * @as(Sint64, @as(c_int, c2.b))), area))));
                a_60 = @bitCast(@as(i8, @truncate(@divTrunc(((w0_53 * @as(Sint64, @as(c_int, c0.a))) + (w1_54 * @as(Sint64, @as(c_int, c1.a)))) + (w2_55 * @as(Sint64, @as(c_int, c2.a))), area))));
                color_61 = SDL_MapRGBA_REAL(format_20, palette, r_57, g_58, b_59, a_60);
                dptr_56.* = @truncate(color_61);
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            169 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                w0_53 += d2d1_y;
                w1_54 += d0d2_y;
                w2_55 += d1d0_y;
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            171 => {
                _ = SDL_BlitSurface_REAL(tmp, null, dst, &dstrect);
                SDL_DestroySurface_REAL(tmp);
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            172 => {
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            174 => {
                SDL_UnlockSurface_REAL(dst);
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SW_BlitTriangle(src: [*c]SDL_Surface, s0: [*c]SDL_Point, s1: [*c]SDL_Point, s2: [*c]SDL_Point, dst: [*c]SDL_Surface, d0: [*c]SDL_Point, d1: [*c]SDL_Point, d2: [*c]SDL_Point, c0: SDL_Color, c1: SDL_Color, c2: SDL_Color, texture_address_mode_u: SDL_TextureAddressMode, texture_address_mode_v: SDL_TextureAddressMode) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var src_surface: [*c]SDL_Surface = undefined;
    _ = &src_surface;
    var src_locked: c_int = undefined;
    _ = &src_locked;
    var dst_locked: c_int = undefined;
    _ = &dst_locked;
    var blend: SDL_BlendMode = undefined;
    _ = &blend;
    var dstrect: SDL_Rect = undefined;
    _ = &dstrect;
    var s2_x_area: SDL_Point = undefined;
    _ = &s2_x_area;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var dst_ptr: [*c]Uint8 = undefined;
    _ = &dst_ptr;
    var dst_pitch: c_int = undefined;
    _ = &dst_pitch;
    var src_ptr: [*c]const c_int = undefined;
    _ = &src_ptr;
    var src_pitch: c_int = undefined;
    _ = &src_pitch;
    var area: Sint64 = undefined;
    _ = &area;
    var tmp64: Sint64 = undefined;
    _ = &tmp64;
    var is_clockwise: c_int = undefined;
    _ = &is_clockwise;
    var d2d1_y: c_int = undefined;
    _ = &d2d1_y;
    var d1d2_x: c_int = undefined;
    _ = &d1d2_x;
    var d0d2_y: c_int = undefined;
    _ = &d0d2_y;
    var d2d0_x: c_int = undefined;
    _ = &d2d0_x;
    var d1d0_y: c_int = undefined;
    _ = &d1d0_y;
    var d0d1_x: c_int = undefined;
    _ = &d0d1_x;
    var s2s0_x: c_int = undefined;
    _ = &s2s0_x;
    var s2s1_x: c_int = undefined;
    _ = &s2s1_x;
    var s2s0_y: c_int = undefined;
    _ = &s2s0_y;
    var s2s1_y: c_int = undefined;
    _ = &s2s1_y;
    var w0_row: Sint64 = undefined;
    _ = &w0_row;
    var w1_row: Sint64 = undefined;
    _ = &w1_row;
    var w2_row: Sint64 = undefined;
    _ = &w2_row;
    var bias_w0: c_int = undefined;
    _ = &bias_w0;
    var bias_w1: c_int = undefined;
    _ = &bias_w1;
    var bias_w2: c_int = undefined;
    _ = &bias_w2;
    var is_uniform: bool = undefined;
    _ = &is_uniform;
    var has_modulation: bool = undefined;
    _ = &has_modulation;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var val: c_int = undefined;
    _ = &val;
    var p: SDL_Point = undefined;
    _ = &p;
    var info: [*c]SDL_BlitInfo = undefined;
    _ = &info;
    var tmp_info: SDL_BlitInfo = undefined;
    _ = &tmp_info;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var w0: Sint64 = undefined;
    _ = &w0;
    var w1: Sint64 = undefined;
    _ = &w1;
    var w2: Sint64 = undefined;
    _ = &w2;
    var dptr: [*c]Uint8 = undefined;
    _ = &dptr;
    var srcx: c_int = undefined;
    _ = &srcx;
    var srcy: c_int = undefined;
    _ = &srcy;
    var sptr: [*c]Uint32 = undefined;
    _ = &sptr;
    var x_1: c_int = undefined;
    _ = &x_1;
    var y_2: c_int = undefined;
    _ = &y_2;
    var w0_3: Sint64 = undefined;
    _ = &w0_3;
    var w1_4: Sint64 = undefined;
    _ = &w1_4;
    var w2_5: Sint64 = undefined;
    _ = &w2_5;
    var dptr_6: [*c]Uint8 = undefined;
    _ = &dptr_6;
    var srcx_7: c_int = undefined;
    _ = &srcx_7;
    var srcy_8: c_int = undefined;
    _ = &srcy_8;
    var sptr_9: [*c]Uint8 = undefined;
    _ = &sptr_9;
    var x_10: c_int = undefined;
    _ = &x_10;
    var y_11: c_int = undefined;
    _ = &y_11;
    var w0_12: Sint64 = undefined;
    _ = &w0_12;
    var w1_13: Sint64 = undefined;
    _ = &w1_13;
    var w2_14: Sint64 = undefined;
    _ = &w2_14;
    var dptr_15: [*c]Uint8 = undefined;
    _ = &dptr_15;
    var srcx_16: c_int = undefined;
    _ = &srcx_16;
    var srcy_17: c_int = undefined;
    _ = &srcy_17;
    var sptr_18: [*c]Uint16 = undefined;
    _ = &sptr_18;
    var x_19: c_int = undefined;
    _ = &x_19;
    var y_20: c_int = undefined;
    _ = &y_20;
    var w0_21: Sint64 = undefined;
    _ = &w0_21;
    var w1_22: Sint64 = undefined;
    _ = &w1_22;
    var w2_23: Sint64 = undefined;
    _ = &w2_23;
    var dptr_24: [*c]Uint8 = undefined;
    _ = &dptr_24;
    var srcx_25: c_int = undefined;
    _ = &srcx_25;
    var srcy_26: c_int = undefined;
    _ = &srcy_26;
    var sptr_27: [*c]Uint8 = undefined;
    _ = &sptr_27;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                src_surface = src;
                src_locked = 0;
                dst_locked = 0;
                if (!SDL_SurfaceValid(src)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (dst_locked != 0) {
                    sdl_pc = 253;
                    continue;
                } else {
                    sdl_pc = 254;
                    continue;
                }
            },
            2 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!SDL_SurfaceValid(dst)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                area = cross_product(d0, d1, d2.*.x, d2.*.y);
                if (area == @as(Sint64, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return @"true" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (!SDL_LockSurface_REAL(dst)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                result = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                dst_locked = 1;
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
            17 => {
                if (!SDL_LockSurface_REAL(src)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                is_uniform = ((((@as(c_int, c0.r) == @as(c_int, c1.r)) and (@as(c_int, c0.g) == @as(c_int, c1.g))) and (@as(c_int, c0.b) == @as(c_int, c1.b))) and (@as(c_int, c0.a) == @as(c_int, c1.a))) and ((((@as(c_int, c1.r) == @as(c_int, c2.r)) and (@as(c_int, c1.g) == @as(c_int, c2.g))) and (@as(c_int, c1.b) == @as(c_int, c2.b))) and (@as(c_int, c1.a) == @as(c_int, c2.a)));
                bounding_rect_fixedpoint(d0, d1, d2, &dstrect);
                _ = SDL_GetSurfaceBlendMode_REAL(src, &blend);
                if (is_uniform) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            20 => {
                result = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                src_locked = 1;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                has_modulation = (((@as(c_int, c0.r) != @as(c_int, 255)) or (@as(c_int, c0.g) != @as(c_int, 255))) or (@as(c_int, c0.b) != @as(c_int, 255))) or (@as(c_int, c0.a) != @as(c_int, 255));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                has_modulation = @"true" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                _ = SDL_GetSurfaceClipRect_REAL(dst, &rect);
                _ = SDL_GetRectIntersection_REAL(&dstrect, &rect, &dstrect);
                dstbpp = dst.*.fmt.*.bytes_per_pixel;
                dst_ptr = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.x * dstbpp))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.y * dst.*.pitch))));
                dst_pitch = dst.*.pitch;
                src_ptr = @ptrCast(@alignCast(src.*.pixels));
                src_pitch = src.*.pitch;
                is_clockwise = @intFromBool(area > @as(Sint64, 0));
                if (area < @as(Sint64, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                area = -area;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                val = d1.*.y - d2.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                d2d1_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                val *= -@as(c_int, 1);
                d2d1_y = val << @intCast(FP_BITS);
                d2d1_y *= -@as(c_int, 1);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                val = d2.*.y - d0.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                d0d2_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                val *= -@as(c_int, 1);
                d0d2_y = val << @intCast(FP_BITS);
                d0d2_y *= -@as(c_int, 1);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                val = d0.*.y - d1.*.y;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                d1d0_y = val << @intCast(FP_BITS);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                val *= -@as(c_int, 1);
                d1d0_y = val << @intCast(FP_BITS);
                d1d0_y *= -@as(c_int, 1);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                val = d2.*.x - d1.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                d1d2_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                val *= -@as(c_int, 1);
                d1d2_x = val << @intCast(FP_BITS);
                d1d2_x *= -@as(c_int, 1);
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                val = d0.*.x - d2.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                d2d0_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                val *= -@as(c_int, 1);
                d2d0_x = val << @intCast(FP_BITS);
                d2d0_x *= -@as(c_int, 1);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                val = d1.*.x - d0.*.x;
                if (val >= @as(c_int, 0)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                d0d1_x = val << @intCast(FP_BITS);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                val *= -@as(c_int, 1);
                d0d1_x = val << @intCast(FP_BITS);
                d0d1_x *= -@as(c_int, 1);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                s2s0_x = s0.*.x - s2.*.x;
                s2s1_x = s1.*.x - s2.*.x;
                s2s0_y = s0.*.y - s2.*.y;
                s2s1_y = s1.*.y - s2.*.y;
                p.x = dstrect.x;
                p.y = dstrect.y;
                trianglepoint_2_fixedpoint(&p);
                p.x += @divTrunc(@as(c_int, 1) << @intCast(FP_BITS), @as(c_int, 2));
                p.y += @divTrunc(@as(c_int, 1) << @intCast(FP_BITS), @as(c_int, 2));
                w0_row = cross_product(d1, d2, p.x, p.y);
                w1_row = cross_product(d2, d0, p.x, p.y);
                w2_row = cross_product(d0, d1, p.x, p.y);
                if (!(is_clockwise != 0)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                d2d1_y *= -@as(c_int, 1);
                d0d2_y *= -@as(c_int, 1);
                d1d0_y *= -@as(c_int, 1);
                d1d2_x *= -@as(c_int, 1);
                d2d0_x *= -@as(c_int, 1);
                d0d1_x *= -@as(c_int, 1);
                w0_row *= -@as(c_int, 1);
                w1_row *= -@as(c_int, 1);
                w2_row *= -@as(c_int, 1);
                {
                    sdl_pc = 49;
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
                bias_w0 = if (is_top_left(d1, d2, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                bias_w1 = if (is_top_left(d2, d0, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                bias_w2 = if (is_top_left(d0, d1, is_clockwise)) @as(c_int, 0) else -@as(c_int, 1);
                tmp64 = @as(Sint64, s2.*.x) * area;
                if ((tmp64 >= @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) and (tmp64 <= @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                s2_x_area.x = @truncate(tmp64);
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                result = SDL_SetError_REAL("triangle area overflow");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            52 => {
                tmp64 = @as(Sint64, s2.*.y) * area;
                if ((tmp64 >= @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) and (tmp64 <= @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                s2_x_area.y = @truncate(tmp64);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                result = SDL_SetError_REAL("triangle area overflow");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            55 => {
                if ((((blend != SDL_BLENDMODE_NONE) or (src.*.format != dst.*.format)) or has_modulation) or !is_uniform) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                info = &src.*.map.info;
                _ = memset(@ptrCast(@alignCast(&tmp_info)), 0, @sizeOf(@TypeOf(tmp_info)));
                tmp_info.src_fmt = src.*.fmt;
                tmp_info.dst_fmt = dst.*.fmt;
                tmp_info.flags = info.*.flags;
                tmp_info.r = c0.r;
                tmp_info.g = c0.g;
                tmp_info.b = c0.b;
                tmp_info.a = c0.a;
                tmp_info.flags &= ~(SDL_COPY_MODULATE_COLOR | SDL_COPY_MODULATE_ALPHA);
                if (((((((((@as(c_int, c0.r) != @as(c_int, 255)) or (@as(c_int, c1.r) != @as(c_int, 255))) or (@as(c_int, c2.r) != @as(c_int, 255))) or (@as(c_int, c0.g) != @as(c_int, 255))) or (@as(c_int, c1.g) != @as(c_int, 255))) or (@as(c_int, c2.g) != @as(c_int, 255))) or (@as(c_int, c0.b) != @as(c_int, 255))) or (@as(c_int, c1.b) != @as(c_int, 255))) or (@as(c_int, c2.b) != @as(c_int, 255))) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
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
                if (dstbpp == @as(c_int, 4)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            59 => {
                tmp_info.flags |= SDL_COPY_MODULATE_COLOR;
                {
                    sdl_pc = 61;
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
                if (((@as(c_int, c0.a) != @as(c_int, 255)) or (@as(c_int, c1.a) != @as(c_int, 255))) or (@as(c_int, c2.a) != @as(c_int, 255))) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                tmp_info.flags |= SDL_COPY_MODULATE_ALPHA;
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
                tmp_info.colorkey = info.*.colorkey;
                tmp_info.src_surface = src_surface;
                tmp_info.src = @ptrCast(@alignCast(@constCast(src_ptr)));
                tmp_info.src_pitch = src_pitch;
                tmp_info.dst = dst_ptr;
                tmp_info.dst_pitch = dst_pitch;
                if ((area < @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) or (area > @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                result = SDL_SetError_REAL("integer overflow (%s = %ld)", @as([*c]u8, @as([*c]u8, @constCast("area"))), area);
                {
                    sdl_pc = 1;
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
                if ((w0_row < @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) or (w0_row > @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                result = SDL_SetError_REAL("integer overflow (%s = %ld)", @as([*c]u8, @as([*c]u8, @constCast("w0_row"))), w0_row);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if ((w1_row < @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) or (w1_row > @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                result = SDL_SetError_REAL("integer overflow (%s = %ld)", @as([*c]u8, @as([*c]u8, @constCast("w1_row"))), w1_row);
                {
                    sdl_pc = 1;
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
                if ((w2_row < @as(Sint64, -__INT_MAX__ - @as(c_int, 1))) or (w2_row > @as(Sint64, __INT_MAX__))) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                result = SDL_SetError_REAL("integer overflow (%s = %ld)", @as([*c]u8, @as([*c]u8, @constCast("w2_row"))), w2_row);
                {
                    sdl_pc = 1;
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
                SDL_BlitTriangle_Slow(&tmp_info, s2_x_area, dstrect, @truncate(area), bias_w0, bias_w1, bias_w2, d2d1_y, d1d2_x, d0d2_y, d2d0_x, d1d0_y, d0d1_x, s2s0_x, s2s1_x, s2s0_y, s2s1_y, @truncate(w0_row), @truncate(w1_row), @truncate(w2_row), c0, c1, c2, is_uniform, texture_address_mode_u, texture_address_mode_v);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            77 => {
                y = 0;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if (dstbpp == @as(c_int, 3)) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            80 => {
                if (y < dstrect.h) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                w0 = w0_row;
                w1 = w1_row;
                w2 = w2_row;
                x = 0;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                y += 1;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            84 => {
                if (x < dstrect.w) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                if ((((w0 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            86 => {
                x += 1;
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            87 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            88 => {
                dptr = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x * dstbpp))));
                srcx = @truncate(@divTrunc(((w0 * @as(Sint64, s2s0_x)) + (w1 * @as(Sint64, s2s1_x))) + @as(Sint64, s2_x_area.x), area));
                srcy = @truncate(@divTrunc(((w0 * @as(Sint64, s2s0_y)) + (w1 * @as(Sint64, s2s1_y))) + @as(Sint64, s2_x_area.y), area));
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
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
                w0 += d2d1_y;
                w1 += d0d2_y;
                w2 += d1d0_y;
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            91 => {
                if (srcx < @as(c_int, 0)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            92 => {
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            93 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            94 => {
                srcx = 0;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                if (srcx >= src_surface.*.w) {
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
                srcx = src_surface.*.w - @as(c_int, 1);
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
            100 => {
                {
                    const ref = &srcx;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.w);
                }
                if (srcx < @as(c_int, 0)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
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
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            103 => {
                srcx += src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
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
                if (srcy < @as(c_int, 0)) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            107 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            108 => {
                sptr = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(src_ptr)))) + @as(usize, @bitCast(@as(isize, @intCast(srcy * src_pitch))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dptr))).* = sptr[@bitCast(@as(isize, @intCast(srcx)))];
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            109 => {
                srcy = 0;
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                if (srcy >= src_surface.*.h) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            112 => {
                srcy = src_surface.*.h - @as(c_int, 1);
                {
                    sdl_pc = 114;
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
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            115 => {
                {
                    const ref = &srcy;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.h);
                }
                if (srcy < @as(c_int, 0)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
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
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            118 => {
                srcy += src_surface.*.h - @as(c_int, 1);
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
                    sdl_pc = 117;
                    continue;
                }
            },
            121 => {
                y_2 = 0;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            122 => {
                if (dstbpp == @as(c_int, 2)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            124 => {
                if (y_2 < dstrect.h) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            125 => {
                w0_3 = w0_row;
                w1_4 = w1_row;
                w2_5 = w2_row;
                x_1 = 0;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            126 => {
                y_2 += 1;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            128 => {
                if (x_1 < dstrect.w) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            129 => {
                if ((((w0_3 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_4 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_5 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            130 => {
                x_1 += 1;
                {
                    sdl_pc = 128;
                    continue;
                }
            },
            131 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 126;
                    continue;
                }
            },
            132 => {
                dptr_6 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_1 * dstbpp))));
                srcx_7 = @truncate(@divTrunc(((w0_3 * @as(Sint64, s2s0_x)) + (w1_4 * @as(Sint64, s2s1_x))) + @as(Sint64, s2_x_area.x), area));
                srcy_8 = @truncate(@divTrunc(((w0_3 * @as(Sint64, s2s0_y)) + (w1_4 * @as(Sint64, s2s1_y))) + @as(Sint64, s2_x_area.y), area));
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
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
                w0_3 += d2d1_y;
                w1_4 += d0d2_y;
                w2_5 += d1d0_y;
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            135 => {
                if (srcx_7 < @as(c_int, 0)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            136 => {
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            137 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 150;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            138 => {
                srcx_7 = 0;
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                if (srcx_7 >= src_surface.*.w) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            140 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            141 => {
                srcx_7 = src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 143;
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
                {
                    const ref = &srcx_7;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.w);
                }
                if (srcx_7 < @as(c_int, 0)) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
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
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            147 => {
                srcx_7 += src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 149;
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
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            150 => {
                if (srcy_8 < @as(c_int, 0)) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            151 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            152 => {
                sptr_9 = @as([*c]Uint8, @ptrCast(@alignCast(@constCast(src_ptr)))) + @as(usize, @bitCast(@as(isize, @intCast(srcy_8 * src_pitch))));
                dptr_6[@as(c_int, 0)] = sptr_9[@bitCast(@as(isize, @intCast(@as(c_int, 3) * srcx_7)))];
                dptr_6[@as(c_int, 1)] = sptr_9[@bitCast(@as(isize, @intCast((@as(c_int, 3) * srcx_7) + @as(c_int, 1))))];
                dptr_6[@as(c_int, 2)] = sptr_9[@bitCast(@as(isize, @intCast((@as(c_int, 3) * srcx_7) + @as(c_int, 2))))];
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            153 => {
                srcy_8 = 0;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                if (srcy_8 >= src_surface.*.h) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            155 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            156 => {
                srcy_8 = src_surface.*.h - @as(c_int, 1);
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
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            159 => {
                {
                    const ref = &srcy_8;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.h);
                }
                if (srcy_8 < @as(c_int, 0)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            160 => {
                {
                    sdl_pc = 161;
                    continue;
                }
            },
            161 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            162 => {
                srcy_8 += src_surface.*.h - @as(c_int, 1);
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            163 => {
                {
                    sdl_pc = 164;
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
                y_11 = 0;
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            166 => {
                if (dstbpp == @as(c_int, 1)) {
                    sdl_pc = 209;
                    continue;
                } else {
                    sdl_pc = 210;
                    continue;
                }
            },
            167 => {
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            168 => {
                if (y_11 < dstrect.h) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            169 => {
                w0_12 = w0_row;
                w1_13 = w1_row;
                w2_14 = w2_row;
                x_10 = 0;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            170 => {
                y_11 += 1;
                {
                    sdl_pc = 168;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            172 => {
                if (x_10 < dstrect.w) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 175;
                    continue;
                }
            },
            173 => {
                if ((((w0_12 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_13 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_14 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 176;
                    continue;
                } else {
                    sdl_pc = 177;
                    continue;
                }
            },
            174 => {
                x_10 += 1;
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            175 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            176 => {
                dptr_15 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_10 * dstbpp))));
                srcx_16 = @truncate(@divTrunc(((w0_12 * @as(Sint64, s2s0_x)) + (w1_13 * @as(Sint64, s2s1_x))) + @as(Sint64, s2_x_area.x), area));
                srcy_17 = @truncate(@divTrunc(((w0_12 * @as(Sint64, s2s0_y)) + (w1_13 * @as(Sint64, s2s1_y))) + @as(Sint64, s2_x_area.y), area));
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 179;
                    continue;
                } else {
                    sdl_pc = 180;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            178 => {
                w0_12 += d2d1_y;
                w1_13 += d0d2_y;
                w2_14 += d1d0_y;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            179 => {
                if (srcx_16 < @as(c_int, 0)) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 183;
                    continue;
                }
            },
            180 => {
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 189;
                    continue;
                }
            },
            181 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 194;
                    continue;
                } else {
                    sdl_pc = 195;
                    continue;
                }
            },
            182 => {
                srcx_16 = 0;
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            183 => {
                if (srcx_16 >= src_surface.*.w) {
                    sdl_pc = 185;
                    continue;
                } else {
                    sdl_pc = 186;
                    continue;
                }
            },
            184 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            185 => {
                srcx_16 = src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 187;
                    continue;
                }
            },
            186 => {
                {
                    sdl_pc = 187;
                    continue;
                }
            },
            187 => {
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            188 => {
                {
                    const ref = &srcx_16;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.w);
                }
                if (srcx_16 < @as(c_int, 0)) {
                    sdl_pc = 191;
                    continue;
                } else {
                    sdl_pc = 192;
                    continue;
                }
            },
            189 => {
                {
                    sdl_pc = 190;
                    continue;
                }
            },
            190 => {
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            191 => {
                srcx_16 += src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            192 => {
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                {
                    sdl_pc = 190;
                    continue;
                }
            },
            194 => {
                if (srcy_17 < @as(c_int, 0)) {
                    sdl_pc = 197;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            195 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 203;
                    continue;
                } else {
                    sdl_pc = 204;
                    continue;
                }
            },
            196 => {
                sptr_18 = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(src_ptr)))) + @as(usize, @bitCast(@as(isize, @intCast(srcy_17 * src_pitch))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dptr_15))).* = sptr_18[@bitCast(@as(isize, @intCast(srcx_16)))];
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            197 => {
                srcy_17 = 0;
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            198 => {
                if (srcy_17 >= src_surface.*.h) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            199 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            200 => {
                srcy_17 = src_surface.*.h - @as(c_int, 1);
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
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            203 => {
                {
                    const ref = &srcy_17;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.h);
                }
                if (srcy_17 < @as(c_int, 0)) {
                    sdl_pc = 206;
                    continue;
                } else {
                    sdl_pc = 207;
                    continue;
                }
            },
            204 => {
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            205 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            206 => {
                srcy_17 += src_surface.*.h - @as(c_int, 1);
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            207 => {
                {
                    sdl_pc = 208;
                    continue;
                }
            },
            208 => {
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            209 => {
                y_20 = 0;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            210 => {
                {
                    sdl_pc = 211;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 167;
                    continue;
                }
            },
            212 => {
                if (y_20 < dstrect.h) {
                    sdl_pc = 213;
                    continue;
                } else {
                    sdl_pc = 215;
                    continue;
                }
            },
            213 => {
                w0_21 = w0_row;
                w1_22 = w1_row;
                w2_23 = w2_row;
                x_19 = 0;
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            214 => {
                y_20 += 1;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            215 => {
                {
                    sdl_pc = 211;
                    continue;
                }
            },
            216 => {
                if (x_19 < dstrect.w) {
                    sdl_pc = 217;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            217 => {
                if ((((w0_21 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1_22 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2_23 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 221;
                    continue;
                }
            },
            218 => {
                x_19 += 1;
                {
                    sdl_pc = 216;
                    continue;
                }
            },
            219 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 214;
                    continue;
                }
            },
            220 => {
                dptr_24 = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x_19 * dstbpp))));
                srcx_25 = @truncate(@divTrunc(((w0_21 * @as(Sint64, s2s0_x)) + (w1_22 * @as(Sint64, s2s1_x))) + @as(Sint64, s2_x_area.x), area));
                srcy_26 = @truncate(@divTrunc(((w0_21 * @as(Sint64, s2s0_y)) + (w1_22 * @as(Sint64, s2s1_y))) + @as(Sint64, s2_x_area.y), area));
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            221 => {
                {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                w0_21 += d2d1_y;
                w1_22 += d0d2_y;
                w2_23 += d1d0_y;
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            223 => {
                if (srcx_25 < @as(c_int, 0)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            224 => {
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 232;
                    continue;
                } else {
                    sdl_pc = 233;
                    continue;
                }
            },
            225 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 238;
                    continue;
                } else {
                    sdl_pc = 239;
                    continue;
                }
            },
            226 => {
                srcx_25 = 0;
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            227 => {
                if (srcx_25 >= src_surface.*.w) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 230;
                    continue;
                }
            },
            228 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            229 => {
                srcx_25 = src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 231;
                    continue;
                }
            },
            230 => {
                {
                    sdl_pc = 231;
                    continue;
                }
            },
            231 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            232 => {
                {
                    const ref = &srcx_25;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.w);
                }
                if (srcx_25 < @as(c_int, 0)) {
                    sdl_pc = 235;
                    continue;
                } else {
                    sdl_pc = 236;
                    continue;
                }
            },
            233 => {
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            234 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            235 => {
                srcx_25 += src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 237;
                    continue;
                }
            },
            236 => {
                {
                    sdl_pc = 237;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            238 => {
                if (srcy_26 < @as(c_int, 0)) {
                    sdl_pc = 241;
                    continue;
                } else {
                    sdl_pc = 242;
                    continue;
                }
            },
            239 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 247;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            240 => {
                sptr_27 = @as([*c]Uint8, @ptrCast(@alignCast(@constCast(src_ptr)))) + @as(usize, @bitCast(@as(isize, @intCast(srcy_26 * src_pitch))));
                dptr_24.* = sptr_27[@bitCast(@as(isize, @intCast(srcx_25)))];
                {
                    sdl_pc = 222;
                    continue;
                }
            },
            241 => {
                srcy_26 = 0;
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                if (srcy_26 >= src_surface.*.h) {
                    sdl_pc = 244;
                    continue;
                } else {
                    sdl_pc = 245;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            244 => {
                srcy_26 = src_surface.*.h - @as(c_int, 1);
                {
                    sdl_pc = 246;
                    continue;
                }
            },
            245 => {
                {
                    sdl_pc = 246;
                    continue;
                }
            },
            246 => {
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            247 => {
                {
                    const ref = &srcy_26;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.h);
                }
                if (srcy_26 < @as(c_int, 0)) {
                    sdl_pc = 250;
                    continue;
                } else {
                    sdl_pc = 251;
                    continue;
                }
            },
            248 => {
                {
                    sdl_pc = 249;
                    continue;
                }
            },
            249 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            250 => {
                srcy_26 += src_surface.*.h - @as(c_int, 1);
                {
                    sdl_pc = 252;
                    continue;
                }
            },
            251 => {
                {
                    sdl_pc = 252;
                    continue;
                }
            },
            252 => {
                {
                    sdl_pc = 249;
                    continue;
                }
            },
            253 => {
                SDL_UnlockSurface_REAL(dst);
                {
                    sdl_pc = 255;
                    continue;
                }
            },
            254 => {
                {
                    sdl_pc = 255;
                    continue;
                }
            },
            255 => {
                if (src_locked != 0) {
                    sdl_pc = 256;
                    continue;
                } else {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                SDL_UnlockSurface_REAL(src);
                {
                    sdl_pc = 258;
                    continue;
                }
            },
            257 => {
                {
                    sdl_pc = 258;
                    continue;
                }
            },
            258 => {
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn trianglepoint_2_fixedpoint(a: [*c]SDL_Point) void {
    @setEvalBranchQuota(100000);
    var val: c_int = undefined;
    _ = &val;
    val = a.*.x;
    if (val >= @as(c_int, 0)) {
        a.*.x = val << @intCast(FP_BITS);
    } else {
        val *= -@as(c_int, 1);
        a.*.x = val << @intCast(FP_BITS);
        a.*.x *= -@as(c_int, 1);
    }
    val = a.*.y;
    if (val >= @as(c_int, 0)) {
        a.*.y = val << @intCast(FP_BITS);
    } else {
        val *= -@as(c_int, 1);
        a.*.y = val << @intCast(FP_BITS);
        a.*.y *= -@as(c_int, 1);
    }
}
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_SurfaceDataFlags = Uint32;
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
pub extern fn SDL_SurfaceValid(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_CreateSurfaceZeroed(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub fn cross_product(a: [*c]const SDL_Point, b: [*c]const SDL_Point, c_x: c_int, c_y: c_int) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    return (@as(Sint64, b.*.x - a.*.x) * @as(Sint64, c_y - a.*.y)) - (@as(Sint64, b.*.y - a.*.y) * @as(Sint64, c_x - a.*.x));
}
pub fn is_top_left(a: [*c]const SDL_Point, b: [*c]const SDL_Point, is_clockwise: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (is_clockwise != 0) {
        if ((a.*.y == b.*.y) and (a.*.x < b.*.x)) {
            return @"true" != 0;
        }
        if (b.*.y < a.*.y) {
            return @"true" != 0;
        }
    } else {
        if ((a.*.y == b.*.y) and (b.*.x < a.*.x)) {
            return @"true" != 0;
        }
        if (a.*.y < b.*.y) {
            return @"true" != 0;
        }
    }
    return @"false" != 0;
}
pub fn bounding_rect_fixedpoint(a: [*c]const SDL_Point, b: [*c]const SDL_Point, c: [*c]const SDL_Point, r: [*c]SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var min_x: c_int = if (a.*.x < (if (b.*.x < c.*.x) b.*.x else c.*.x)) a.*.x else if (b.*.x < c.*.x) b.*.x else c.*.x;
    _ = &min_x;
    var max_x: c_int = if (a.*.x > (if (b.*.x > c.*.x) b.*.x else c.*.x)) a.*.x else if (b.*.x > c.*.x) b.*.x else c.*.x;
    _ = &max_x;
    var min_y: c_int = if (a.*.y < (if (b.*.y < c.*.y) b.*.y else c.*.y)) a.*.y else if (b.*.y < c.*.y) b.*.y else c.*.y;
    _ = &min_y;
    var max_y: c_int = if (a.*.y > (if (b.*.y > c.*.y) b.*.y else c.*.y)) a.*.y else if (b.*.y > c.*.y) b.*.y else c.*.y;
    _ = &max_y;
    r.*.x = min_x >> @intCast(FP_BITS);
    r.*.y = min_y >> @intCast(FP_BITS);
    r.*.w = (max_x - min_x) >> @intCast(FP_BITS);
    r.*.h = (max_y - min_y) >> @intCast(FP_BITS);
}
pub fn detect_format(pf: [*c]const SDL_PixelFormatDetails) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    if (!((pf.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((pf.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((pf.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((pf.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((pf.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((pf.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        return -@as(c_int, 2);
    }
    if (pf.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010)) {
        return FORMAT_2101010;
    } else if (pf.*.Amask != 0) {
        return FORMAT_ALPHA;
    } else {
        return -@as(c_int, 1);
    }
}
pub fn SDL_BlitTriangle_Slow(info: [*c]SDL_BlitInfo, s2_x_area: SDL_Point, dstrect: SDL_Rect, area: c_int, bias_w0: c_int, bias_w1: c_int, bias_w2: c_int, d2d1_y: c_int, d1d2_x: c_int, d0d2_y: c_int, d2d0_x: c_int, d1d0_y: c_int, d0d1_x: c_int, s2s0_x: c_int, s2s1_x: c_int, s2s0_y: c_int, s2s1_y: c_int, arg_w0_row: c_int, arg_w1_row: c_int, arg_w2_row: c_int, c0: SDL_Color, c1: SDL_Color, c2: SDL_Color, is_uniform: bool, texture_address_mode_u: SDL_TextureAddressMode, texture_address_mode_v: SDL_TextureAddressMode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var w0_row = arg_w0_row;
    _ = &w0_row;
    var w1_row = arg_w1_row;
    _ = &w1_row;
    var w2_row = arg_w2_row;
    _ = &w2_row;
    var src_surface: [*c]SDL_Surface = undefined;
    _ = &src_surface;
    var palette: [*c]SDL_Palette = undefined;
    _ = &palette;
    var flags: c_int = undefined;
    _ = &flags;
    var modulateR: Uint32 = undefined;
    _ = &modulateR;
    var modulateG: Uint32 = undefined;
    _ = &modulateG;
    var modulateB: Uint32 = undefined;
    _ = &modulateB;
    var modulateA: Uint32 = undefined;
    _ = &modulateA;
    var srcpixel: Uint32 = undefined;
    _ = &srcpixel;
    var srcR: Uint32 = undefined;
    _ = &srcR;
    var srcG: Uint32 = undefined;
    _ = &srcG;
    var srcB: Uint32 = undefined;
    _ = &srcB;
    var srcA: Uint32 = undefined;
    _ = &srcA;
    var dstpixel: Uint32 = undefined;
    _ = &dstpixel;
    var dstR: Uint32 = undefined;
    _ = &dstR;
    var dstG: Uint32 = undefined;
    _ = &dstG;
    var dstB: Uint32 = undefined;
    _ = &dstB;
    var dstA: Uint32 = undefined;
    _ = &dstA;
    var src_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &src_fmt;
    var dst_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dst_fmt;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var srcfmt_val: c_int = undefined;
    _ = &srcfmt_val;
    var dstfmt_val: c_int = undefined;
    _ = &dstfmt_val;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var dst_ptr: [*c]Uint8 = undefined;
    _ = &dst_ptr;
    var dst_pitch: c_int = undefined;
    _ = &dst_pitch;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var w0: Sint64 = undefined;
    _ = &w0;
    var w1: Sint64 = undefined;
    _ = &w1;
    var w2: Sint64 = undefined;
    _ = &w2;
    var dptr: [*c]Uint8 = undefined;
    _ = &dptr;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var srcx: c_int = undefined;
    _ = &srcx;
    var srcy: c_int = undefined;
    _ = &srcy;
    var color: [*c]const SDL_Color = undefined;
    _ = &color;
    var r: c_int = undefined;
    _ = &r;
    var g: c_int = undefined;
    _ = &g;
    var b: c_int = undefined;
    _ = &b;
    var a: c_int = undefined;
    _ = &a;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_1: Uint16 = undefined;
    _ = &_pixel_1;
    var _pixel_2: Uint32 = undefined;
    _ = &_pixel_2;
    var _pixel_3: Uint8 = undefined;
    _ = &_pixel_3;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                src_surface = info.*.src_surface;
                palette = src_surface.*.palette;
                flags = info.*.flags;
                modulateR = info.*.r;
                modulateG = info.*.g;
                modulateB = info.*.b;
                modulateA = info.*.a;
                src_fmt = info.*.src_fmt;
                dst_fmt = info.*.dst_fmt;
                srcbpp = src_fmt.*.bytes_per_pixel;
                dstbpp = dst_fmt.*.bytes_per_pixel;
                rgbmask = ~src_fmt.*.Amask;
                ckey = info.*.colorkey & rgbmask;
                dst_ptr = info.*.dst;
                dst_pitch = info.*.dst_pitch;
                srcfmt_val = detect_format(src_fmt);
                dstfmt_val = detect_format(dst_fmt);
                y = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (y < dstrect.h) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                w0 = w0_row;
                w1 = w1_row;
                w2 = w2_row;
                x = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                y += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {}
            },
            5 => {
                if (x < dstrect.w) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if ((((w0 + @as(Sint64, bias_w0)) >= @as(Sint64, 0)) and ((w1 + @as(Sint64, bias_w1)) >= @as(Sint64, 0))) and ((w2 + @as(Sint64, bias_w2)) >= @as(Sint64, 0))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                x += 1;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                w0_row += d1d2_x;
                w1_row += d2d0_x;
                w2_row += d0d1_x;
                dst_ptr += @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            9 => {
                dptr = dst_ptr + @as(usize, @bitCast(@as(isize, @intCast(x * dstbpp))));
                dst = dptr;
                srcx = @truncate(@divTrunc(((w0 * @as(Sint64, s2s0_x)) + (w1 * @as(Sint64, s2s1_x))) + @as(Sint64, s2_x_area.x), @as(Sint64, area)));
                srcy = @truncate(@divTrunc(((w0 * @as(Sint64, s2s0_y)) + (w1 * @as(Sint64, s2s1_y))) + @as(Sint64, s2_x_area.y), @as(Sint64, area)));
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP) {
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
                w0 += d2d1_y;
                w1 += d0d2_y;
                w2 += d1d0_y;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                if (srcx < @as(c_int, 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            14 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            15 => {
                srcx = 0;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                if (srcx >= src_surface.*.w) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                srcx = src_surface.*.w - @as(c_int, 1);
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                {
                    const ref = &srcx;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.w);
                }
                if (srcx < @as(c_int, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            24 => {
                srcx += src_surface.*.w - @as(c_int, 1);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                if (srcy < @as(c_int, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_WRAP) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            29 => {
                src = (info.*.src + @as(usize, @bitCast(@as(isize, @intCast(srcy * info.*.src_pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(srcx * srcbpp))));
                if (srcfmt_val == -@as(c_int, 2)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            30 => {
                srcy = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                if (srcy >= src_surface.*.h) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                srcy = src_surface.*.h - @as(c_int, 1);
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
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                {
                    const ref = &srcy;
                    ref.* = __helpers.signedRemainder(ref.*, src_surface.*.h);
                }
                if (srcy < @as(c_int, 0)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            39 => {
                srcy += src_surface.*.h - @as(c_int, 1);
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
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                srcpixel = src.*;
                color = &palette.*.colors[srcpixel];
                srcR = color.*.r;
                srcG = color.*.g;
                srcB = color.*.b;
                srcA = color.*.a;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                if (srcfmt_val == @as(c_int, 0)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                if ((flags & SDL_COPY_COLORKEY) != 0) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                if (srcfmt_val < @as(c_int, 0)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 55;
                        continue;
                    },
                    else => {
                        sdl_pc = 56;
                        continue;
                    },
                }
            },
            49 => {
                if (false) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            52 => {
                srcpixel = src.*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            53 => {
                srcpixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            54 => {
                srcpixel = 0;
                srcR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Rshift), @as(c_int, 8))))))).*;
                srcG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Gshift), @as(c_int, 8))))))).*;
                srcB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Bshift), @as(c_int, 8))))))).*;
                srcA = 255;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            56 => {
                srcpixel = 0;
                srcR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            srcA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        srcB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    srcG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                srcR = (srcpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                srcG = (srcpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                srcB = (srcpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                srcA = SDL_expand_byte[@as(c_int, 2)][srcpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            60 => {
                switch (srcbpp) {
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
                srcA = 255;
                {
                    sdl_pc = 59;
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
                srcpixel = src.*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            65 => {
                srcpixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                srcpixel = 0;
                srcR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Rshift), @as(c_int, 8))))))).*;
                srcG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Gshift), @as(c_int, 8))))))).*;
                srcB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            67 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            68 => {
                srcpixel = 0;
                srcR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(Uint32, 0);
                        srcB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    srcG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            69 => {
                if (srcbpp == @as(c_int, 3)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
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
                if ((flags & (((SDL_COPY_BLEND | SDL_COPY_ADD) | SDL_COPY_MOD) | SDL_COPY_MUL)) != 0) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            72 => {
                srcpixel = ((srcR << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))) | (srcG << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift))))))) | (srcB << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift))))));
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
                if ((srcpixel & rgbmask) == ckey) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 7;
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
                    sdl_pc = 71;
                    continue;
                }
            },
            78 => {
                if (dstfmt_val == @as(c_int, 0)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            79 => {
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            dstA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                if (!is_uniform) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                if (dstfmt_val < @as(c_int, 0)) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            84 => {
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
                {
                    sdl_pc = 83;
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
                dstpixel = dst.*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            89 => {
                dstpixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            90 => {
                dstpixel = 0;
                dstR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).*;
                dstG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).*;
                dstB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).*;
                dstA = 255;
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            91 => {
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 87;
                    continue;
                }
            },
            92 => {
                dstpixel = 0;
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            dstA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
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
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dstR = (dstpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                dstG = (dstpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                dstB = (dstpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                dstA = SDL_expand_byte[@as(c_int, 2)][dstpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            96 => {
                switch (dstbpp) {
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
                dstA = 255;
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            100 => {
                dstpixel = dst.*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            101 => {
                dstpixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            102 => {
                dstpixel = 0;
                dstR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).*;
                dstG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).*;
                dstB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            103 => {
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            104 => {
                dstpixel = 0;
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(Uint32, 0);
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            105 => {
                r = @truncate(@divTrunc(((w0 * @as(Sint64, @as(c_int, c0.r))) + (w1 * @as(Sint64, @as(c_int, c1.r)))) + (w2 * @as(Sint64, @as(c_int, c2.r))), @as(Sint64, area)));
                g = @truncate(@divTrunc(((w0 * @as(Sint64, @as(c_int, c0.g))) + (w1 * @as(Sint64, @as(c_int, c1.g)))) + (w2 * @as(Sint64, @as(c_int, c2.g))), @as(Sint64, area)));
                b = @truncate(@divTrunc(((w0 * @as(Sint64, @as(c_int, c0.b))) + (w1 * @as(Sint64, @as(c_int, c1.b)))) + (w2 * @as(Sint64, @as(c_int, c2.b))), @as(Sint64, area)));
                a = @truncate(@divTrunc(((w0 * @as(Sint64, @as(c_int, c0.a))) + (w1 * @as(Sint64, @as(c_int, c1.a)))) + (w2 * @as(Sint64, @as(c_int, c2.a))), @as(Sint64, area)));
                modulateR = @bitCast(@as(c_int, r));
                modulateG = @bitCast(@as(c_int, g));
                modulateB = @bitCast(@as(c_int, b));
                modulateA = @bitCast(@as(c_int, a));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                if ((flags & SDL_COPY_MODULATE_COLOR) != 0) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                srcR = (srcR *% modulateR) / @as(Uint32, 255);
                srcG = (srcG *% modulateG) / @as(Uint32, 255);
                srcB = (srcB *% modulateB) / @as(Uint32, 255);
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
                if ((flags & SDL_COPY_MODULATE_ALPHA) != 0) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                srcA = (srcA *% modulateA) / @as(Uint32, 255);
                {
                    sdl_pc = 113;
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
                if ((flags & (SDL_COPY_BLEND | SDL_COPY_ADD)) != 0) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                if (srcA < @as(Uint32, 255)) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
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
                switch (flags & (((SDL_COPY_BLEND | SDL_COPY_ADD) | SDL_COPY_MOD) | SDL_COPY_MUL)) {
                    @as(c_int, 0) => {
                        sdl_pc = 121;
                        continue;
                    },
                    SDL_COPY_BLEND => {
                        sdl_pc = 122;
                        continue;
                    },
                    SDL_COPY_ADD => {
                        sdl_pc = 123;
                        continue;
                    },
                    SDL_COPY_MOD => {
                        sdl_pc = 133;
                        continue;
                    },
                    SDL_COPY_MUL => {
                        sdl_pc = 134;
                        continue;
                    },
                    else => {
                        sdl_pc = 120;
                        continue;
                    },
                }
            },
            117 => {
                srcR = (srcR *% srcA) / @as(Uint32, 255);
                srcG = (srcG *% srcA) / @as(Uint32, 255);
                srcB = (srcB *% srcA) / @as(Uint32, 255);
                {
                    sdl_pc = 119;
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
                {
                    sdl_pc = 116;
                    continue;
                }
            },
            120 => {
                if (dstfmt_val == @as(c_int, 0)) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            121 => {
                dstR = srcR;
                dstG = srcG;
                dstB = srcB;
                dstA = srcA;
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            122 => {
                dstR = srcR +% (((@as(Uint32, 255) -% srcA) *% dstR) / @as(Uint32, 255));
                dstG = srcG +% (((@as(Uint32, 255) -% srcA) *% dstG) / @as(Uint32, 255));
                dstB = srcB +% (((@as(Uint32, 255) -% srcA) *% dstB) / @as(Uint32, 255));
                dstA = srcA +% (((@as(Uint32, 255) -% srcA) *% dstA) / @as(Uint32, 255));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            123 => {
                dstR = srcR +% dstR;
                if (dstR > @as(Uint32, 255)) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                dstR = 255;
                {
                    sdl_pc = 126;
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
                dstG = srcG +% dstG;
                if (dstG > @as(Uint32, 255)) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                dstG = 255;
                {
                    sdl_pc = 129;
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
                dstB = srcB +% dstB;
                if (dstB > @as(Uint32, 255)) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                dstB = 255;
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
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            133 => {
                dstR = (srcR *% dstR) / @as(Uint32, 255);
                dstG = (srcG *% dstG) / @as(Uint32, 255);
                dstB = (srcB *% dstB) / @as(Uint32, 255);
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            134 => {
                dstR = ((srcR *% dstR) +% (dstR *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstR > @as(Uint32, 255)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                dstR = 255;
                {
                    sdl_pc = 137;
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
                dstG = ((srcG *% dstG) +% (dstG *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstG > @as(Uint32, 255)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                dstG = 255;
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
                dstB = ((srcB *% dstB) +% (dstB *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstB > @as(Uint32, 255)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                dstB = 255;
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            144 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 148;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 149;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 150;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 151;
                        continue;
                    },
                    else => {
                        sdl_pc = 147;
                        continue;
                    },
                }
            },
            145 => {
                if (dstfmt_val < @as(c_int, 0)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            148 => {
                _pixel = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            149 => {
                _pixel_1 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_1;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            150 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dstR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dstG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dstB);
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            151 => {
                _pixel_2 = ((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_2;
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            152 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 156;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 157;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 158;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 159;
                        continue;
                    },
                    else => {
                        sdl_pc = 155;
                        continue;
                    },
                }
            },
            153 => {
                dstR = if (dstR != 0) (dstR << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstG = if (dstG != 0) (dstG << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstB = if (dstB != 0) (dstB << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstA = (dstA *% @as(Uint32, 3)) / @as(Uint32, 255);
                pixelvalue = (((dstA << @intCast(@as(Uint32, 30))) | (dstR << @intCast(@as(Uint32, 20)))) | (dstG << @intCast(@as(Uint32, 10)))) | dstB;
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = pixelvalue;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            155 => {
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            156 => {
                _pixel_3 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask);
                dst.* = _pixel_3;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            157 => {
                _pixel_4 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask);
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            158 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dstR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dstG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dstB);
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            159 => {
                _pixel_5 = ((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask;
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_COPY_MODULATE_COLOR = @as(c_int, 0x00000001);
pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_ADD = @as(c_int, 0x00000040);
pub const SDL_COPY_MOD = @as(c_int, 0x00000100);
pub const SDL_COPY_MUL = @as(c_int, 0x00000200);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const FP_BITS = @as(c_int, 1);
pub const FORMAT_ALPHA = @as(c_int, 0);
pub const FORMAT_INDEX8 = -@as(c_int, 2);
pub const FORMAT_2101010 = @as(c_int, 1);
pub inline fn FORMAT_INDEXED(format: anytype) @TypeOf(format == FORMAT_INDEX8) {
    @setEvalBranchQuota(100000);
    _ = &format;
    return format == FORMAT_INDEX8;
}
