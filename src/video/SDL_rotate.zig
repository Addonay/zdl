// /*
// 
// SDL_rotate.c: rotates 32bit or 8bit surfaces
// 
// Shamelessly stolen from SDL_gfx by Andreas Schiffler. Original copyright follows:
// 
// Copyright (C) 2001-2011  Andreas Schiffler
// 
// This software is provided 'as-is', without any express or implied
// warranty. In no event will the authors be held liable for any damages
// arising from the use of this software.
// 
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
// 
//    1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would be
//    appreciated but is not required.
// 
//    2. Altered source versions must be plainly marked as such, and must not be
//    misrepresented as being the original software.
// 
//    3. This notice may not be removed or altered from any source
//    distribution.
// 
// Andreas Schiffler -- aschiffler at ferzkopp dot net
// 
// */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __helpers = @import("std").zig.c_translation.helpers;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub extern fn SDL_ceil_REAL(x: f64) f64;
pub extern fn SDL_cos_REAL(x: f64) f64;
pub extern fn SDL_floor_REAL(x: f64) f64;
pub extern fn SDL_sin_REAL(x: f64) f64;
pub const SDL_PropertiesID = Uint32;
pub const SDL_BlendMode = Uint32;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
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
pub const struct_SDL_FPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
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
pub extern fn SDL_SetSurfacePalette_REAL(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) bool;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, enabled: bool, key: Uint32) bool;
pub extern fn SDL_SurfaceHasColorKey_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_GetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, key: [*c]Uint32) bool;
pub extern fn SDL_SetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_GetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_FillSurfaceRect_REAL(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: Uint32) bool;
pub extern fn SDL_MapSurfaceRGBA_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub export fn SDLgfx_rotateSurface(src: [*c]SDL_Surface, angle: f64, smooth: c_int, flipx: c_int, flipy: c_int, rect_dest: [*c]const SDL_Rect, cangle: f64, sangle: f64, center: [*c]const SDL_FPoint) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var rz_dst: [*c]SDL_Surface = undefined;
    _ = &rz_dst;
    var is8bit: c_int = undefined;
    _ = &is8bit;
    var angle90: c_int = undefined;
    _ = &angle90;
    var blendmode: SDL_BlendMode = undefined;
    _ = &blendmode;
    var colorkey: Uint32 = 0;
    _ = &colorkey;
    var colorKeyAvailable: bool = @"false" != 0;
    _ = &colorKeyAvailable;
    var sangleinv: f64 = undefined;
    _ = &sangleinv;
    var cangleinv: f64 = undefined;
    _ = &cangleinv;
    if (!SDL_SurfaceValid(src)) {
        return null;
    }
    if (SDL_SurfaceHasColorKey_REAL(src)) {
        if (SDL_GetSurfaceColorKey_REAL(src, &colorkey)) {
            colorKeyAvailable = @"true" != 0;
        }
    }
    is8bit = @intFromBool((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) and colorKeyAvailable);
    if (!(is8bit != 0) and !(((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 32)) and (((src.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888)))) {
        return null;
    }
    sangleinv = sangle * @as(f64, 65536.0);
    cangleinv = cangle * @as(f64, 65536.0);
    rz_dst = null;
    if (is8bit != 0) {
        rz_dst = SDL_CreateSurfaceZeroed(rect_dest.*.w, rect_dest.*.h + @as(c_int, 2), src.*.format);
        if (rz_dst != null) {
            _ = SDL_SetSurfacePalette_REAL(rz_dst, src.*.palette);
        }
    } else {
        rz_dst = SDL_CreateSurfaceZeroed(rect_dest.*.w, rect_dest.*.h + @as(c_int, 2), src.*.format);
    }
    if (!(rz_dst != null)) {
        return null;
    }
    rz_dst.*.h = rect_dest.*.h;
    _ = SDL_GetSurfaceBlendMode_REAL(src, &blendmode);
    if (colorKeyAvailable) {
        _ = SDL_SetSurfaceColorKey_REAL(rz_dst, @"true" != 0, colorkey);
        _ = SDL_FillSurfaceRect_REAL(rz_dst, null, colorkey);
    } else if (blendmode == SDL_BLENDMODE_NONE) {
        blendmode = SDL_BLENDMODE_BLEND;
    } else if ((blendmode == SDL_BLENDMODE_MOD) or (blendmode == SDL_BLENDMODE_MUL)) {
        colorkey = SDL_MapSurfaceRGBA_REAL(rz_dst, 255, 255, 255, 0);
        _ = SDL_FillSurfaceRect_REAL(rz_dst, null, colorkey);
        _ = SDL_SetSurfaceColorKey_REAL(rz_dst, @"true" != 0, colorkey);
    }
    _ = SDL_SetSurfaceBlendMode_REAL(rz_dst, blendmode);
    if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(src)) {
            SDL_DestroySurface_REAL(rz_dst);
            return null;
        }
    }
    angle90 = @intFromFloat(angle / @as(f64, @floatFromInt(@as(c_int, 90))));
    if (@as(f64, @floatFromInt(angle90)) == (angle / @as(f64, @floatFromInt(@as(c_int, 90))))) {
        {
            const ref = &angle90;
            ref.* = __helpers.signedRemainder(ref.*, @as(c_int, 4));
        }
        if (angle90 < @as(c_int, 0)) {
            angle90 += 4;
        }
    } else {
        angle90 = -@as(c_int, 1);
    }
    if (is8bit != 0) {
        if (angle90 >= @as(c_int, 0)) {
            transformSurfaceY90(src, rz_dst, angle90, flipx, flipy);
        } else {
            transformSurfaceY(src, rz_dst, @intFromFloat(sangleinv), @intFromFloat(cangleinv), flipx, flipy, rect_dest, center);
        }
    } else {
        if (angle90 >= @as(c_int, 0)) {
            transformSurfaceRGBA90(src, rz_dst, angle90, flipx, flipy);
        } else {
            transformSurfaceRGBA(src, rz_dst, @intFromFloat(sangleinv), @intFromFloat(cangleinv), flipx, flipy, smooth, rect_dest, center);
        }
    }
    if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        SDL_UnlockSurface_REAL(src);
    }
    return rz_dst;
}

pub export fn SDLgfx_rotozoomSurfaceSizeTrig(width: c_int, height: c_int, angle: f64, center: [*c]const SDL_FPoint, rect_dest: [*c]SDL_Rect, cangle: [*c]f64, sangle: [*c]f64) void {
    @setEvalBranchQuota(100000);
    var minx: c_int = undefined;
    _ = &minx;
    var maxx: c_int = undefined;
    _ = &maxx;
    var miny: c_int = undefined;
    _ = &miny;
    var maxy: c_int = undefined;
    _ = &maxy;
    var radangle: f64 = undefined;
    _ = &radangle;
    var x0: f64 = undefined;
    _ = &x0;
    var x1: f64 = undefined;
    _ = &x1;
    var x2: f64 = undefined;
    _ = &x2;
    var x3: f64 = undefined;
    _ = &x3;
    var y0_1: f64 = undefined;
    _ = &y0_1;
    var y1_2: f64 = undefined;
    _ = &y1_2;
    var y2: f64 = undefined;
    _ = &y2;
    var y3: f64 = undefined;
    _ = &y3;
    var sinangle: f64 = undefined;
    _ = &sinangle;
    var cosangle: f64 = undefined;
    _ = &cosangle;
    radangle = angle * (SDL_PI_D / @as(f64, 180.0));
    sinangle = SDL_sin_REAL(radangle);
    cosangle = SDL_cos_REAL(radangle);
    rotate(0.5, 0.5, sinangle, cosangle, center, &x0, &y0_1);
    rotate(@as(f64, @floatFromInt(width)) - @as(f64, 0.5), 0.5, sinangle, cosangle, center, &x1, &y1_2);
    rotate(0.5, @as(f64, @floatFromInt(height)) - @as(f64, 0.5), sinangle, cosangle, center, &x2, &y2);
    rotate(@as(f64, @floatFromInt(width)) - @as(f64, 0.5), @as(f64, @floatFromInt(height)) - @as(f64, 0.5), sinangle, cosangle, center, &x3, &y3);
    minx = @intFromFloat(SDL_floor_REAL(if ((if (x0 < x1) x0 else x1) < (if (x2 < x3) x2 else x3)) if (x0 < x1) x0 else x1 else if (x2 < x3) x2 else x3));
    maxx = @intFromFloat(SDL_ceil_REAL(if ((if (x0 > x1) x0 else x1) > (if (x2 > x3) x2 else x3)) if (x0 > x1) x0 else x1 else if (x2 > x3) x2 else x3));
    miny = @intFromFloat(SDL_floor_REAL(if ((if (y0_1 < y1_2) y0_1 else y1_2) < (if (y2 < y3) y2 else y3)) if (y0_1 < y1_2) y0_1 else y1_2 else if (y2 < y3) y2 else y3));
    maxy = @intFromFloat(SDL_ceil_REAL(if ((if (y0_1 > y1_2) y0_1 else y1_2) > (if (y2 > y3) y2 else y3)) if (y0_1 > y1_2) y0_1 else y1_2 else if (y2 > y3) y2 else y3));
    rect_dest.*.w = maxx - minx;
    rect_dest.*.h = maxy - miny;
    rect_dest.*.x = minx;
    rect_dest.*.y = miny;
    sangle.* = -sinangle;
    cangle.* = cosangle;
    {
        var angle90: c_int = @intFromFloat(angle / @as(f64, @floatFromInt(@as(c_int, 90))));
        _ = &angle90;
        if (@as(f64, @floatFromInt(angle90)) == (angle / @as(f64, @floatFromInt(@as(c_int, 90))))) {
            {
                const ref = &angle90;
                ref.* = __helpers.signedRemainder(ref.*, @as(c_int, 4));
            }
            if (angle90 < @as(c_int, 0)) {
                angle90 += 4;
            }
            if ((angle90 & @as(c_int, 1)) != 0) {
                rect_dest.*.w = height;
                rect_dest.*.h = width;
                cangle.* = @floatFromInt(@as(c_int, 0));
                sangle.* = @floatFromInt(if (angle90 == @as(c_int, 1)) -@as(c_int, 1) else @as(c_int, 1));
            } else {
                rect_dest.*.w = width;
                rect_dest.*.h = height;
                cangle.* = @floatFromInt(if (angle90 == @as(c_int, 0)) @as(c_int, 1) else -@as(c_int, 1));
                sangle.* = @floatFromInt(@as(c_int, 0));
            }
        }
    }
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_BLEND = @as(c_uint, 0x00000001);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_BLENDMODE_MUL = @as(c_uint, 0x00000008);
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
pub const struct_tColorRGBA = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const tColorRGBA = struct_tColorRGBA;
pub const struct_tColorY = extern struct {
    y: Uint8 = 0,
};
pub const tColorY = struct_tColorY;
pub fn get_colorkey(src: [*c]SDL_Surface) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var key: Uint32 = 0;
    _ = &key;
    if (SDL_SurfaceHasColorKey_REAL(src)) {
        _ = SDL_GetSurfaceColorKey_REAL(src, &key);
    }
    return key;
}
pub fn rotate(arg_sx: f64, arg_sy: f64, sinangle: f64, cosangle: f64, center: [*c]const SDL_FPoint, dx: [*c]f64, dy: [*c]f64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sx = arg_sx;
    _ = &sx;
    var sy = arg_sy;
    _ = &sy;
    sx -= @floatCast(center.*.x);
    sy -= @floatCast(center.*.y);
    dx.* = (cosangle * sx) - (sinangle * sy);
    dy.* = (sinangle * sx) + (cosangle * sy);
    dx.* += @floatCast(center.*.x);
    dy.* += @floatCast(center.*.y);
}
pub fn computeSourceIncrements90(src: [*c]SDL_Surface, arg_bpp: c_int, angle: c_int, flipx: c_int, flipy: c_int, sincx: [*c]c_int, sincy: [*c]c_int, signx: [*c]c_int, signy: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var bpp = arg_bpp;
    _ = &bpp;
    var pitch: c_int = undefined;
    _ = &pitch;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                pitch = if (flipy != 0) -src.*.pitch else src.*.pitch;
                if (flipx != 0) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                bpp = -bpp;
                {
                    sdl_pc = 3;
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
                switch (angle) {
                    @as(c_int, 0) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            4 => {
                if (flipx != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            5 => {
                sincx.* = bpp;
                sincy.* = pitch - (src.*.w * sincx.*);
                signx.* = blk: {
                    const tmp = @as(c_int, 1);
                    signy.* = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                sincx.* = -pitch;
                sincy.* = bpp - (sincx.* * src.*.h);
                signx.* = 1;
                signy.* = -@as(c_int, 1);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                sincx.* = -bpp;
                sincy.* = (-src.*.w * sincx.*) - pitch;
                signx.* = blk: {
                    const tmp = -@as(c_int, 1);
                    signy.* = tmp;
                    break :blk tmp;
                };
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
                sincx.* = pitch;
                sincy.* = (-sincx.* * src.*.h) - bpp;
                signx.* = -@as(c_int, 1);
                signy.* = 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                signx.* = -signx.*;
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
                if (flipy != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                signy.* = -signy.*;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn transformSurfaceRGBA90(src: [*c]SDL_Surface, dst: [*c]SDL_Surface, angle: c_int, flipx: c_int, flipy: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dy: c_int = undefined;
    _ = &dy;
    var dincy: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, dst.*.pitch))) -% (@as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorRGBA)))));
    _ = &dincy;
    var sincx: c_int = undefined;
    _ = &sincx;
    var sincy: c_int = undefined;
    _ = &sincy;
    var signx: c_int = undefined;
    _ = &signx;
    var signy: c_int = undefined;
    _ = &signy;
    var sp: [*c]Uint8 = @ptrCast(@alignCast(src.*.pixels));
    _ = &sp;
    var dp: [*c]Uint8 = @ptrCast(@alignCast(dst.*.pixels));
    _ = &dp;
    var de: [*c]Uint8 = undefined;
    _ = &de;
    computeSourceIncrements90(src, @bitCast(@as(c_uint, @truncate(@sizeOf(tColorRGBA)))), angle, flipx, flipy, &sincx, &sincy, &signx, &signy);
    if (signx < @as(c_int, 0)) {
        sp += @as(c_ulong, @bitCast(@as(c_long, src.*.w - @as(c_int, 1)))) *% @sizeOf(tColorRGBA);
    }
    if (signy < @as(c_int, 0)) {
        sp += @as(usize, @bitCast(@as(isize, @intCast((src.*.h - @as(c_int, 1)) * src.*.pitch))));
    }
    {
        dy = 0;
        while (dy < dst.*.h) : ({
            sp += @as(usize, @bitCast(@as(isize, @intCast(sincy))));
            dp += @as(usize, @bitCast(@as(isize, @intCast(dincy))));
            dy += 1;
        }) {
            if (@as(c_ulong, @bitCast(@as(c_long, sincx))) == @sizeOf(tColorRGBA)) {
                _ = memcpy(@ptrCast(@alignCast(dp)), @ptrCast(@alignCast(sp)), @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorRGBA));
                sp += @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorRGBA);
                dp += @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorRGBA);
            } else {
                {
                    de = dp + (@as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorRGBA));
                    while (dp != de) : ({
                        sp += @as(usize, @bitCast(@as(isize, @intCast(sincx))));
                        dp += @sizeOf(tColorRGBA);
                    }) {
                        @as([*c]tColorRGBA, @ptrCast(@alignCast(dp))).* = @as([*c]tColorRGBA, @ptrCast(@alignCast(sp))).*;
                    }
                }
            }
        }
    }
}
pub fn transformSurfaceY90(src: [*c]SDL_Surface, dst: [*c]SDL_Surface, angle: c_int, flipx: c_int, flipy: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dy: c_int = undefined;
    _ = &dy;
    var dincy: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, dst.*.pitch))) -% (@as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorY)))));
    _ = &dincy;
    var sincx: c_int = undefined;
    _ = &sincx;
    var sincy: c_int = undefined;
    _ = &sincy;
    var signx: c_int = undefined;
    _ = &signx;
    var signy: c_int = undefined;
    _ = &signy;
    var sp: [*c]Uint8 = @ptrCast(@alignCast(src.*.pixels));
    _ = &sp;
    var dp: [*c]Uint8 = @ptrCast(@alignCast(dst.*.pixels));
    _ = &dp;
    var de: [*c]Uint8 = undefined;
    _ = &de;
    computeSourceIncrements90(src, @bitCast(@as(c_uint, @truncate(@sizeOf(tColorY)))), angle, flipx, flipy, &sincx, &sincy, &signx, &signy);
    if (signx < @as(c_int, 0)) {
        sp += @as(c_ulong, @bitCast(@as(c_long, src.*.w - @as(c_int, 1)))) *% @sizeOf(tColorY);
    }
    if (signy < @as(c_int, 0)) {
        sp += @as(usize, @bitCast(@as(isize, @intCast((src.*.h - @as(c_int, 1)) * src.*.pitch))));
    }
    {
        dy = 0;
        while (dy < dst.*.h) : ({
            sp += @as(usize, @bitCast(@as(isize, @intCast(sincy))));
            dp += @as(usize, @bitCast(@as(isize, @intCast(dincy))));
            dy += 1;
        }) {
            if (@as(c_ulong, @bitCast(@as(c_long, sincx))) == @sizeOf(tColorY)) {
                _ = memcpy(@ptrCast(@alignCast(dp)), @ptrCast(@alignCast(sp)), @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorY));
                sp += @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorY);
                dp += @as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorY);
            } else {
                {
                    de = dp + (@as(c_ulong, @bitCast(@as(c_long, dst.*.w))) *% @sizeOf(tColorY));
                    while (dp != de) : ({
                        sp += @as(usize, @bitCast(@as(isize, @intCast(sincx))));
                        dp += @sizeOf(tColorY);
                    }) {
                        @as([*c]tColorY, @ptrCast(@alignCast(dp))).* = @as([*c]tColorY, @ptrCast(@alignCast(sp))).*;
                    }
                }
            }
        }
    }
}
pub fn transformSurfaceRGBA(src: [*c]SDL_Surface, dst: [*c]SDL_Surface, isin: c_int, icos: c_int, flipx: c_int, flipy: c_int, smooth: c_int, rect_dest: [*c]const SDL_Rect, center: [*c]const SDL_FPoint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sw: c_int = undefined;
    _ = &sw;
    var sh: c_int = undefined;
    _ = &sh;
    var cx: c_int = undefined;
    _ = &cx;
    var cy: c_int = undefined;
    _ = &cy;
    var c00: tColorRGBA = undefined;
    _ = &c00;
    var c01: tColorRGBA = undefined;
    _ = &c01;
    var c10: tColorRGBA = undefined;
    _ = &c10;
    var c11: tColorRGBA = undefined;
    _ = &c11;
    var cswap: tColorRGBA = undefined;
    _ = &cswap;
    var pc: [*c]tColorRGBA = undefined;
    _ = &pc;
    var sp: [*c]tColorRGBA = undefined;
    _ = &sp;
    var gap: c_int = undefined;
    _ = &gap;
    const fp_half: c_int = @as(c_int, 1) << @intCast(@as(c_int, 15));
    _ = &fp_half;
    sw = src.*.w - @as(c_int, 1);
    sh = src.*.h - @as(c_int, 1);
    pc = @ptrCast(@alignCast(dst.*.pixels));
    gap = dst.*.pitch - (dst.*.w * @as(c_int, 4));
    cx = @intFromFloat(@as(f64, @floatCast(center.*.x)) * @as(f64, 65536.0));
    cy = @intFromFloat(@as(f64, @floatCast(center.*.y)) * @as(f64, 65536.0));
    if (smooth != 0) {
        var y: c_int = undefined;
        _ = &y;
        {
            y = 0;
            while (y < dst.*.h) : (y += 1) {
                var x: c_int = undefined;
                _ = &x;
                var src_x: f64 = ((@as(f64, @floatFromInt(rect_dest.*.x)) + @as(f64, @floatFromInt(@as(c_int, 0)))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.x));
                _ = &src_x;
                var src_y: f64 = ((@as(f64, @floatFromInt(rect_dest.*.y)) + @as(f64, @floatFromInt(y))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.y));
                _ = &src_y;
                var sdx: c_int = @intFromFloat((((@as(f64, @floatFromInt(icos)) * src_x) - (@as(f64, @floatFromInt(isin)) * src_y)) + @as(f64, @floatFromInt(cx))) - @as(f64, @floatFromInt(fp_half)));
                _ = &sdx;
                var sdy: c_int = @intFromFloat((((@as(f64, @floatFromInt(isin)) * src_x) + (@as(f64, @floatFromInt(icos)) * src_y)) + @as(f64, @floatFromInt(cy))) - @as(f64, @floatFromInt(fp_half)));
                _ = &sdy;
                {
                    x = 0;
                    while (x < dst.*.w) : (x += 1) {
                        var dx: c_int = sdx >> @intCast(@as(c_int, 16));
                        _ = &dx;
                        var dy: c_int = sdy >> @intCast(@as(c_int, 16));
                        _ = &dy;
                        if (flipx != 0) {
                            dx = sw - dx;
                        }
                        if (flipy != 0) {
                            dy = sh - dy;
                        }
                        if ((((dx > -@as(c_int, 1)) and (dy > -@as(c_int, 1))) and (dx < (src.*.w - @as(c_int, 1)))) and (dy < (src.*.h - @as(c_int, 1)))) {
                            var ex: c_int = undefined;
                            _ = &ex;
                            var ey: c_int = undefined;
                            _ = &ey;
                            var t1: c_int = undefined;
                            _ = &t1;
                            var t2: c_int = undefined;
                            _ = &t2;
                            sp = @as([*c]tColorRGBA, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(src.*.pitch * dy))))))) + @as(usize, @bitCast(@as(isize, @intCast(dx))));
                            c00 = sp.*;
                            sp += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                            c01 = sp.*;
                            sp += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(src.*.pitch, @as(c_int, 4))))));
                            c11 = sp.*;
                            sp -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
                            c10 = sp.*;
                            if (flipx != 0) {
                                cswap = c00;
                                c00 = c01;
                                c01 = cswap;
                                cswap = c10;
                                c10 = c11;
                                c11 = cswap;
                            }
                            if (flipy != 0) {
                                cswap = c00;
                                c00 = c10;
                                c10 = cswap;
                                cswap = c01;
                                c01 = c11;
                                c11 = cswap;
                            }
                            ex = sdx & @as(c_int, 65535);
                            ey = sdy & @as(c_int, 65535);
                            t1 = ((((@as(c_int, c01.r) - @as(c_int, c00.r)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c00.r)) & @as(c_int, 255);
                            t2 = ((((@as(c_int, c11.r) - @as(c_int, c10.r)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c10.r)) & @as(c_int, 255);
                            pc.*.r = @bitCast(@as(i8, @truncate((((t2 - t1) * ey) >> @intCast(@as(c_int, 16))) + t1)));
                            t1 = ((((@as(c_int, c01.g) - @as(c_int, c00.g)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c00.g)) & @as(c_int, 255);
                            t2 = ((((@as(c_int, c11.g) - @as(c_int, c10.g)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c10.g)) & @as(c_int, 255);
                            pc.*.g = @bitCast(@as(i8, @truncate((((t2 - t1) * ey) >> @intCast(@as(c_int, 16))) + t1)));
                            t1 = ((((@as(c_int, c01.b) - @as(c_int, c00.b)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c00.b)) & @as(c_int, 255);
                            t2 = ((((@as(c_int, c11.b) - @as(c_int, c10.b)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c10.b)) & @as(c_int, 255);
                            pc.*.b = @bitCast(@as(i8, @truncate((((t2 - t1) * ey) >> @intCast(@as(c_int, 16))) + t1)));
                            t1 = ((((@as(c_int, c01.a) - @as(c_int, c00.a)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c00.a)) & @as(c_int, 255);
                            t2 = ((((@as(c_int, c11.a) - @as(c_int, c10.a)) * ex) >> @intCast(@as(c_int, 16))) + @as(c_int, c10.a)) & @as(c_int, 255);
                            pc.*.a = @bitCast(@as(i8, @truncate((((t2 - t1) * ey) >> @intCast(@as(c_int, 16))) + t1)));
                        }
                        sdx += icos;
                        sdy += isin;
                        pc += 1;
                    }
                }
                pc = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(pc))) + @as(usize, @bitCast(@as(isize, @intCast(gap))))));
            }
        }
    } else {
        var y: c_int = undefined;
        _ = &y;
        {
            y = 0;
            while (y < dst.*.h) : (y += 1) {
                var x: c_int = undefined;
                _ = &x;
                var src_x: f64 = ((@as(f64, @floatFromInt(rect_dest.*.x)) + @as(f64, @floatFromInt(@as(c_int, 0)))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.x));
                _ = &src_x;
                var src_y: f64 = ((@as(f64, @floatFromInt(rect_dest.*.y)) + @as(f64, @floatFromInt(y))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.y));
                _ = &src_y;
                var sdx: c_int = @intFromFloat((((@as(f64, @floatFromInt(icos)) * src_x) - (@as(f64, @floatFromInt(isin)) * src_y)) + @as(f64, @floatFromInt(cx))) - @as(f64, @floatFromInt(fp_half)));
                _ = &sdx;
                var sdy: c_int = @intFromFloat((((@as(f64, @floatFromInt(isin)) * src_x) + (@as(f64, @floatFromInt(icos)) * src_y)) + @as(f64, @floatFromInt(cy))) - @as(f64, @floatFromInt(fp_half)));
                _ = &sdy;
                {
                    x = 0;
                    while (x < dst.*.w) : (x += 1) {
                        var dx: c_int = sdx >> @intCast(@as(c_int, 16));
                        _ = &dx;
                        var dy: c_int = sdy >> @intCast(@as(c_int, 16));
                        _ = &dy;
                        if ((@as(c_uint, @bitCast(@as(c_int, dx))) < @as(c_uint, @bitCast(@as(c_int, src.*.w)))) and (@as(c_uint, @bitCast(@as(c_int, dy))) < @as(c_uint, @bitCast(@as(c_int, src.*.h))))) {
                            if (flipx != 0) {
                                dx = sw - dx;
                            }
                            if (flipy != 0) {
                                dy = sh - dy;
                            }
                            pc.* = (@as([*c]tColorRGBA, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(src.*.pitch * dy))))))) + @as(usize, @bitCast(@as(isize, @intCast(dx))))).*;
                        }
                        sdx += icos;
                        sdy += isin;
                        pc += 1;
                    }
                }
                pc = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(pc))) + @as(usize, @bitCast(@as(isize, @intCast(gap))))));
            }
        }
    }
}
pub fn transformSurfaceY(src: [*c]SDL_Surface, dst: [*c]SDL_Surface, isin: c_int, icos: c_int, flipx: c_int, flipy: c_int, rect_dest: [*c]const SDL_Rect, center: [*c]const SDL_FPoint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sw: c_int = undefined;
    _ = &sw;
    var sh: c_int = undefined;
    _ = &sh;
    var cx: c_int = undefined;
    _ = &cx;
    var cy: c_int = undefined;
    _ = &cy;
    var pc: [*c]tColorY = undefined;
    _ = &pc;
    var gap: c_int = undefined;
    _ = &gap;
    const fp_half: c_int = @as(c_int, 1) << @intCast(@as(c_int, 15));
    _ = &fp_half;
    var y: c_int = undefined;
    _ = &y;
    sw = src.*.w - @as(c_int, 1);
    sh = src.*.h - @as(c_int, 1);
    pc = @ptrCast(@alignCast(dst.*.pixels));
    gap = dst.*.pitch - dst.*.w;
    cx = @intFromFloat(@as(f64, @floatCast(center.*.x)) * @as(f64, 65536.0));
    cy = @intFromFloat(@as(f64, @floatCast(center.*.y)) * @as(f64, 65536.0));
    _ = memset(@ptrCast(@alignCast(pc)), @bitCast(@as(c_uint, @truncate(get_colorkey(src) & @as(Uint32, 255)))), @as(usize, @bitCast(@as(c_long, dst.*.pitch))) *% @as(usize, @bitCast(@as(c_long, dst.*.h))));
    {
        y = 0;
        while (y < dst.*.h) : (y += 1) {
            var x: c_int = undefined;
            _ = &x;
            var src_x: f64 = ((@as(f64, @floatFromInt(rect_dest.*.x)) + @as(f64, @floatFromInt(@as(c_int, 0)))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.x));
            _ = &src_x;
            var src_y: f64 = ((@as(f64, @floatFromInt(rect_dest.*.y)) + @as(f64, @floatFromInt(y))) + @as(f64, 0.5)) - @as(f64, @floatCast(center.*.y));
            _ = &src_y;
            var sdx: c_int = @intFromFloat((((@as(f64, @floatFromInt(icos)) * src_x) - (@as(f64, @floatFromInt(isin)) * src_y)) + @as(f64, @floatFromInt(cx))) - @as(f64, @floatFromInt(fp_half)));
            _ = &sdx;
            var sdy: c_int = @intFromFloat((((@as(f64, @floatFromInt(isin)) * src_x) + (@as(f64, @floatFromInt(icos)) * src_y)) + @as(f64, @floatFromInt(cy))) - @as(f64, @floatFromInt(fp_half)));
            _ = &sdy;
            {
                x = 0;
                while (x < dst.*.w) : (x += 1) {
                    var dx: c_int = sdx >> @intCast(@as(c_int, 16));
                    _ = &dx;
                    var dy: c_int = sdy >> @intCast(@as(c_int, 16));
                    _ = &dy;
                    if ((@as(c_uint, @bitCast(@as(c_int, dx))) < @as(c_uint, @bitCast(@as(c_int, src.*.w)))) and (@as(c_uint, @bitCast(@as(c_int, dy))) < @as(c_uint, @bitCast(@as(c_int, src.*.h))))) {
                        if (flipx != 0) {
                            dx = sw - dx;
                        }
                        if (flipy != 0) {
                            dy = sh - dy;
                        }
                        pc.* = ((@as([*c]tColorY, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(src.*.pitch * dy))))) + @as(usize, @bitCast(@as(isize, @intCast(dx))))).*;
                    }
                    sdx += icos;
                    sdy += isin;
                    pc += 1;
                }
            }
            pc += @as(usize, @bitCast(@as(isize, @intCast(gap))));
        }
    }
}
pub const GUARD_ROWS = @as(c_int, 2);
