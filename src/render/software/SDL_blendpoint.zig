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
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_BlendMode = Uint32;
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
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub export fn SDL_BlendPoint(dst: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, blendMode: SDL_BlendMode, arg_r: Uint8, arg_g: Uint8, arg_b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_SurfaceValid(dst)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_BlendPoint(): dst"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("SDL_BlendPoint(): Unsupported surface format");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((((x < dst.*.clip_rect.x) or (y < dst.*.clip_rect.y)) or (x >= (dst.*.clip_rect.x + dst.*.clip_rect.w))) or (y >= (dst.*.clip_rect.y + dst.*.clip_rect.h))) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if ((blendMode == SDL_BLENDMODE_BLEND) or (blendMode == SDL_BLENDMODE_ADD)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                r = @truncate((@as(c_uint, r) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                g = @truncate((@as(c_uint, g) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                b = @truncate((@as(c_uint, b) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
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
                switch (@as(c_int, dst.*.fmt.*.bits_per_pixel)) {
                    @as(c_int, 15) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            13 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            14 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 31744) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            15 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                return SDL_BlendPoint_RGB555(dst, x, y, blendMode, r, g, b, a);
            },
            17 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 63488) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            18 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            19 => {
                return SDL_BlendPoint_RGB565(dst, x, y, blendMode, r, g, b, a);
            },
            20 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 16711680) => {
                        sdl_pc = 22;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            21 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            22 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return SDL_BlendPoint_XRGB8888(dst, x, y, blendMode, r, g, b, a);
            },
            24 => {
                return SDL_BlendPoint_ARGB8888(dst, x, y, blendMode, r, g, b, a);
            },
            25 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            27 => {
                return SDL_BlendPoint_RGB(dst, x, y, blendMode, r, g, b, a);
            },
            28 => {
                return SDL_BlendPoint_RGBA(dst, x, y, blendMode, r, g, b, a);
            },
            29 => {
                unreachable;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_BlendPoints(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, blendMode: SDL_BlendMode, arg_r: Uint8, arg_g: Uint8, arg_b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var minx: c_int = undefined;
    _ = &minx;
    var miny: c_int = undefined;
    _ = &miny;
    var maxx: c_int = undefined;
    _ = &maxx;
    var maxy: c_int = undefined;
    _ = &maxy;
    var i: c_int = undefined;
    _ = &i;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var func: ?*const fn (dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool = undefined;
    _ = &func;
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                func = null;
                result = @"true" != 0;
                if (!SDL_SurfaceValid(dst)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_BlendPoints(): dst"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (@as(c_int, dst.*.fmt.*.bits_per_pixel) < @as(c_int, 8)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("SDL_BlendPoints(): Unsupported surface format");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((blendMode == SDL_BLENDMODE_BLEND) or (blendMode == SDL_BLENDMODE_ADD)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                r = @truncate((@as(c_uint, r) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                g = @truncate((@as(c_uint, g) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                b = @truncate((@as(c_uint, b) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                {
                    sdl_pc = 9;
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
                switch (@as(c_int, dst.*.fmt.*.bits_per_pixel)) {
                    @as(c_int, 15) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 17;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            10 => {
                if (!(func != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            11 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 31744) => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            12 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                func = SDL_BlendPoint_RGB555;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 63488) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            15 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                func = SDL_BlendPoint_RGB565;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 16711680) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 18;
                        continue;
                    },
                }
            },
            18 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                func = SDL_BlendPoint_XRGB8888;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                func = SDL_BlendPoint_ARGB8888;
                {
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            24 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
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
                minx = dst.*.clip_rect.x;
                maxx = (dst.*.clip_rect.x + dst.*.clip_rect.w) - @as(c_int, 1);
                miny = dst.*.clip_rect.y;
                maxy = (dst.*.clip_rect.y + dst.*.clip_rect.h) - @as(c_int, 1);
                i = 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                func = SDL_BlendPoint_RGB;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                func = SDL_BlendPoint_RGBA;
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
                if (i < count) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            31 => {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if ((((x < minx) or (x > maxx)) or (y < miny)) or (y > maxy)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            32 => {
                i += 1;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            33 => {
                return result;
            },
            34 => {
                {
                    sdl_pc = 32;
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
                result = func.?(dst, x, y, blendMode, r, g, b, a);
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const SDL_BLENDMODE_BLEND = @as(c_uint, 0x00000001);
pub const SDL_BLENDMODE_BLEND_PREMULTIPLIED = @as(c_uint, 0x00000010);
pub const SDL_BLENDMODE_ADD = @as(c_uint, 0x00000002);
pub const SDL_BLENDMODE_ADD_PREMULTIPLIED = @as(c_uint, 0x00000020);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_BLENDMODE_MUL = @as(c_uint, 0x00000008);
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
pub fn SDL_BlendPoint_RGB555(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint16 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint16 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint16 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint16 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint16 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 28;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 45;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
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
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                if (false) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                sa = 255;
                sr = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (false) {
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (false) {
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
                sa_5 = 255;
                sr_2 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_1.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_3 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_1.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_4 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_1.*) & @as(c_int, 31))))];
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (false) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
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
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                sa_5 = 255;
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
                pixels_1.* = @truncate((((sr_2 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_3 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_4 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 14;
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
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                _ = &sa_10;
                sr_7 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_6.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_8 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_6.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_9 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_6.*) & @as(c_int, 31))))];
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                sg_8 = 255;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sb_9 = 255;
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
                pixels_6.* = @truncate((((sr_7 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_8 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_9 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 49;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                _ = &sa_15;
                sr_12 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_11.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_13 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_11.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_14 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_11.*) & @as(c_int, 31))))];
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = @truncate((((sr_12 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_13 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_14 >> @intCast(@as(c_uint, 3))));
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
                    sdl_pc = 47;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (false) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = &sa_20;
                sr_17 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_16.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_18 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_16.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_19 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_16.*) & @as(c_int, 31))))];
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                if (false) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sb_19 = 255;
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
                pixels_16.* = @truncate((((sr_17 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_18 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_19 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 57;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            72 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = @truncate((((sr_22 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_23 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_24 >> @intCast(@as(c_uint, 3))));
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
                    sdl_pc = 70;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendPoint_RGB565(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint16 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint16 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint16 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint16 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint16 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 28;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 45;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
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
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                if (false) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                sa = 255;
                sr = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (false) {
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (false) {
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
                sa_5 = 255;
                sr_2 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_1.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_3 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_1.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_4 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_1.*) & @as(c_int, 31))))];
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (false) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
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
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                sa_5 = 255;
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
                pixels_1.* = @truncate((((sr_2 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_3 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_4 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 14;
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
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                _ = &sa_10;
                sr_7 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_6.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_8 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_6.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_9 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_6.*) & @as(c_int, 31))))];
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                sg_8 = 255;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sb_9 = 255;
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
                pixels_6.* = @truncate((((sr_7 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_8 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_9 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 49;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                _ = &sa_15;
                sr_12 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_11.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_13 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_11.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_14 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_11.*) & @as(c_int, 31))))];
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = @truncate((((sr_12 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_13 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_14 >> @intCast(@as(c_uint, 3))));
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
                    sdl_pc = 47;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (false) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = &sa_20;
                sr_17 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_16.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_18 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_16.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_19 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_16.*) & @as(c_int, 31))))];
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                if (false) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sb_19 = 255;
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
                pixels_16.* = @truncate((((sr_17 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_18 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_19 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 57;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            72 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = @truncate((((sr_22 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_23 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_24 >> @intCast(@as(c_uint, 3))));
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
                    sdl_pc = 70;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendPoint_XRGB8888(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint32 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint32 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint32 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint32 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint32 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 28;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 45;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
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
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                if (false) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                sa = 255;
                sr = (pixels.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg = (pixels.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb = pixels.* & @as(Uint32, 255);
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((sr << @intCast(@as(c_uint, 16))) | (sg << @intCast(@as(c_uint, 8)))) | sb;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (false) {
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (false) {
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
                sa_5 = 255;
                sr_2 = (pixels_1.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_3 = (pixels_1.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_4 = pixels_1.* & @as(Uint32, 255);
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (false) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
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
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                sa_5 = 255;
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
                pixels_1.* = ((sr_2 << @intCast(@as(c_uint, 16))) | (sg_3 << @intCast(@as(c_uint, 8)))) | sb_4;
                {
                    sdl_pc = 14;
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
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                _ = &sa_10;
                sr_7 = (pixels_6.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_8 = (pixels_6.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_9 = pixels_6.* & @as(Uint32, 255);
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                sg_8 = 255;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sb_9 = 255;
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
                pixels_6.* = ((sr_7 << @intCast(@as(c_uint, 16))) | (sg_8 << @intCast(@as(c_uint, 8)))) | sb_9;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 49;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                _ = &sa_15;
                sr_12 = (pixels_11.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_13 = (pixels_11.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_14 = pixels_11.* & @as(Uint32, 255);
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = ((sr_12 << @intCast(@as(c_uint, 16))) | (sg_13 << @intCast(@as(c_uint, 8)))) | sb_14;
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
                    sdl_pc = 47;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (false) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = &sa_20;
                sr_17 = (pixels_16.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_18 = (pixels_16.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_19 = pixels_16.* & @as(Uint32, 255);
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                if (false) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sb_19 = 255;
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
                pixels_16.* = ((sr_17 << @intCast(@as(c_uint, 16))) | (sg_18 << @intCast(@as(c_uint, 8)))) | sb_19;
                {
                    sdl_pc = 57;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            72 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = ((sr_22 << @intCast(@as(c_uint, 16))) | (sg_23 << @intCast(@as(c_uint, 8)))) | sb_24;
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
                    sdl_pc = 70;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendPoint_ARGB8888(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint32 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint32 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint32 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint32 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint32 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 28;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 45;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 68;
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
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            4 => {
                if (false) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                sa = 255;
                sr = (pixels.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg = (pixels.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb = pixels.* & @as(Uint32, 255);
                sa = pixels.* >> @intCast(@as(Uint32, 24));
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = (((sa << @intCast(@as(c_uint, 24))) | (sr << @intCast(@as(c_uint, 16)))) | (sg << @intCast(@as(c_uint, 8)))) | sb;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (false) {
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (false) {
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
                sa_5 = 255;
                sr_2 = (pixels_1.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_3 = (pixels_1.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_4 = pixels_1.* & @as(Uint32, 255);
                sa_5 = pixels_1.* >> @intCast(@as(Uint32, 24));
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                if (false) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
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
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                sa_5 = 255;
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
                pixels_1.* = (((sa_5 << @intCast(@as(c_uint, 24))) | (sr_2 << @intCast(@as(c_uint, 16)))) | (sg_3 << @intCast(@as(c_uint, 8)))) | sb_4;
                {
                    sdl_pc = 14;
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
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                _ = &sa_10;
                sr_7 = (pixels_6.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_8 = (pixels_6.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_9 = pixels_6.* & @as(Uint32, 255);
                sa_10 = pixels_6.* >> @intCast(@as(Uint32, 24));
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                sg_8 = 255;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sb_9 = 255;
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
                pixels_6.* = (((sa_10 << @intCast(@as(c_uint, 24))) | (sr_7 << @intCast(@as(c_uint, 16)))) | (sg_8 << @intCast(@as(c_uint, 8)))) | sb_9;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 49;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                _ = &sa_15;
                sr_12 = (pixels_11.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_13 = (pixels_11.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_14 = pixels_11.* & @as(Uint32, 255);
                sa_15 = pixels_11.* >> @intCast(@as(Uint32, 24));
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = (((sa_15 << @intCast(@as(c_uint, 24))) | (sr_12 << @intCast(@as(c_uint, 16)))) | (sg_13 << @intCast(@as(c_uint, 8)))) | sb_14;
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
                    sdl_pc = 47;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (false) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                _ = &sa_20;
                sr_17 = (pixels_16.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_18 = (pixels_16.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_19 = pixels_16.* & @as(Uint32, 255);
                sa_20 = pixels_16.* >> @intCast(@as(Uint32, 24));
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                if (false) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sb_19 = 255;
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
                pixels_16.* = (((sa_20 << @intCast(@as(c_uint, 24))) | (sr_17 << @intCast(@as(c_uint, 16)))) | (sg_18 << @intCast(@as(c_uint, 8)))) | sb_19;
                {
                    sdl_pc = 57;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            72 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = (((sa_25 << @intCast(@as(c_uint, 24))) | (sr_22 << @intCast(@as(c_uint, 16)))) | (sg_23 << @intCast(@as(c_uint, 8)))) | sb_24;
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
                    sdl_pc = 70;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendPoint_RGB(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint16 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint16 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint16 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint16 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint16 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var pixels_26: [*c]Uint32 = undefined;
    _ = &pixels_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var pixels_31: [*c]Uint32 = undefined;
    _ = &pixels_31;
    var sr_32: c_uint = undefined;
    _ = &sr_32;
    var sg_33: c_uint = undefined;
    _ = &sg_33;
    var sb_34: c_uint = undefined;
    _ = &sb_34;
    var sa_35: c_uint = undefined;
    _ = &sa_35;
    var pixels_36: [*c]Uint32 = undefined;
    _ = &pixels_36;
    var sr_37: c_uint = undefined;
    _ = &sr_37;
    var sg_38: c_uint = undefined;
    _ = &sg_38;
    var sb_39: c_uint = undefined;
    _ = &sb_39;
    var sa_40: c_uint = undefined;
    _ = &sa_40;
    var pixels_41: [*c]Uint32 = undefined;
    _ = &pixels_41;
    var sr_42: c_uint = undefined;
    _ = &sr_42;
    var sg_43: c_uint = undefined;
    _ = &sg_43;
    var sb_44: c_uint = undefined;
    _ = &sb_44;
    var sa_45: c_uint = undefined;
    _ = &sa_45;
    var pixels_46: [*c]Uint32 = undefined;
    _ = &pixels_46;
    var sr_47: c_uint = undefined;
    _ = &sr_47;
    var sg_48: c_uint = undefined;
    _ = &sg_48;
    var sb_49: c_uint = undefined;
    _ = &sb_49;
    var sa_50: c_uint = undefined;
    _ = &sa_50;
    var pixels_51: [*c]Uint32 = undefined;
    _ = &pixels_51;
    var sr_52: c_uint = undefined;
    _ = &sr_52;
    var sg_53: c_uint = undefined;
    _ = &sg_53;
    var sb_54: c_uint = undefined;
    _ = &sb_54;
    var sa_55: c_uint = undefined;
    _ = &sa_55;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fmt = dst.*.fmt;
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 2) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 77;
                        continue;
                    },
                    else => {
                        sdl_pc = 152;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 30;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 31;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 47;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 54;
                        continue;
                    },
                    else => {
                        sdl_pc = 70;
                        continue;
                    },
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (false) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
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
                sa = 255;
                sr = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate(((((sr >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (false) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            15 => {
                sa_5 = 255;
                sr_2 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_1.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_3 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_1.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_4 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_1.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                if (false) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                sa_5 = 255;
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
                pixels_1.* = @truncate(((((sr_2 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_3 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_4 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 16;
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
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                if (false) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            35 => {
                _ = &sa_10;
                sr_7 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_6.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_8 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_6.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_9 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_6.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if (false) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                sg_8 = 255;
                {
                    sdl_pc = 43;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                sb_9 = 255;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_6.* = @truncate(((((sr_7 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_8 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_9 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 36;
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
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 51;
                    continue;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            51 => {
                _ = &sa_15;
                sr_12 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_11.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_13 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_11.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_14 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_11.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = @truncate(((((sr_12 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_13 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_14 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 52;
                    continue;
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
                    sdl_pc = 49;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 58;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            58 => {
                _ = &sa_20;
                sr_17 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_16.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_18 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_16.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_19 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_16.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
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
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                sb_19 = 255;
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
                pixels_16.* = @truncate(((((sr_17 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_18 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_19 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 59;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))));
                {
                    sdl_pc = 74;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            74 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = @truncate(((((sr_22 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
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
                    sdl_pc = 72;
                    continue;
                }
            },
            77 => {
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 79;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 86;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 105;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 106;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 122;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 129;
                        continue;
                    },
                    else => {
                        sdl_pc = 145;
                        continue;
                    },
                }
            },
            78 => {
                return @"true" != 0;
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                pixels_26 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 83;
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
                    sdl_pc = 78;
                    continue;
                }
            },
            83 => {
                sa_30 = 255;
                sr_27 = SDL_expand_byte[fmt.*.Rbits][(pixels_26.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_28 = SDL_expand_byte[fmt.*.Gbits][(pixels_26.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_29 = SDL_expand_byte[fmt.*.Bbits][(pixels_26.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels_26.* = ((((sr_27 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_28 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_29 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
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
                    sdl_pc = 81;
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
                pixels_31 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                if (false) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            90 => {
                sa_35 = 255;
                sr_32 = SDL_expand_byte[fmt.*.Rbits][(pixels_31.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_33 = SDL_expand_byte[fmt.*.Gbits][(pixels_31.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_34 = SDL_expand_byte[fmt.*.Bbits][(pixels_31.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_32 = ((inva *% sr_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_32 > @as(c_uint, 255)) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
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
                    sdl_pc = 88;
                    continue;
                }
            },
            93 => {
                sr_32 = 255;
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                sg_33 = ((inva *% sg_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_33 > @as(c_uint, 255)) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                sg_33 = 255;
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
                sb_34 = ((inva *% sb_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_34 > @as(c_uint, 255)) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                sb_34 = 255;
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                sa_35 = ((inva *% sa_35) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_35 > @as(c_uint, 255)) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                sa_35 = 255;
                {
                    sdl_pc = 104;
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
                pixels_31.* = ((((sr_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_33 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_34 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 91;
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
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                pixels_36 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            108 => {
                if (false) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            110 => {
                _ = &sa_40;
                sr_37 = SDL_expand_byte[fmt.*.Rbits][(pixels_36.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_38 = SDL_expand_byte[fmt.*.Gbits][(pixels_36.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_39 = SDL_expand_byte[fmt.*.Bbits][(pixels_36.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_37 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_37 > @as(c_uint, 255)) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            111 => {
                if (false) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            113 => {
                sr_37 = 255;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                sg_38 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_38 > @as(c_uint, 255)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            116 => {
                sg_38 = 255;
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                sb_39 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_39 > @as(c_uint, 255)) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            119 => {
                sb_39 = 255;
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                pixels_36.* = ((((sr_37 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_38 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_39 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 111;
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
                pixels_41 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 126;
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
                    sdl_pc = 78;
                    continue;
                }
            },
            126 => {
                _ = &sa_45;
                sr_42 = SDL_expand_byte[fmt.*.Rbits][(pixels_41.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_43 = SDL_expand_byte[fmt.*.Gbits][(pixels_41.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_44 = SDL_expand_byte[fmt.*.Bbits][(pixels_41.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_42 = (sr_42 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_43 = (sg_43 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_44 = (sb_44 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_41.* = ((((sr_42 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_43 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_44 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
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
                    sdl_pc = 124;
                    continue;
                }
            },
            129 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                pixels_46 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            131 => {
                if (false) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            133 => {
                _ = &sa_50;
                sr_47 = SDL_expand_byte[fmt.*.Rbits][(pixels_46.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_48 = SDL_expand_byte[fmt.*.Gbits][(pixels_46.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_49 = SDL_expand_byte[fmt.*.Bbits][(pixels_46.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_47 = ((sr_47 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_47) / @as(c_uint, 255));
                if (sr_47 > @as(c_uint, 255)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            134 => {
                if (false) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 135;
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
                sr_47 = 255;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            137 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            138 => {
                sg_48 = ((sg_48 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_48) / @as(c_uint, 255));
                if (sg_48 > @as(c_uint, 255)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                sg_48 = 255;
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            140 => {
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            141 => {
                sb_49 = ((sb_49 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_49) / @as(c_uint, 255));
                if (sb_49 > @as(c_uint, 255)) {
                    sdl_pc = 142;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            142 => {
                sb_49 = 255;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                pixels_46.* = ((((sr_47 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_48 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_49 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 134;
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
                pixels_51 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            147 => {
                if (false) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            149 => {
                sr_52 = r;
                sg_53 = g;
                sb_54 = b;
                sa_55 = a;
                _ = &sa_55;
                pixels_51.* = ((((sr_52 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_53 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_54 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            150 => {
                if (false) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            152 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendPoint_RGBA(dst: [*c]SDL_Surface, x: c_int, y: c_int, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var inva: c_uint = undefined;
    _ = &inva;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var pixels_1: [*c]Uint32 = undefined;
    _ = &pixels_1;
    var sr_2: c_uint = undefined;
    _ = &sr_2;
    var sg_3: c_uint = undefined;
    _ = &sg_3;
    var sb_4: c_uint = undefined;
    _ = &sb_4;
    var sa_5: c_uint = undefined;
    _ = &sa_5;
    var pixels_6: [*c]Uint32 = undefined;
    _ = &pixels_6;
    var sr_7: c_uint = undefined;
    _ = &sr_7;
    var sg_8: c_uint = undefined;
    _ = &sg_8;
    var sb_9: c_uint = undefined;
    _ = &sb_9;
    var sa_10: c_uint = undefined;
    _ = &sa_10;
    var pixels_11: [*c]Uint32 = undefined;
    _ = &pixels_11;
    var sr_12: c_uint = undefined;
    _ = &sr_12;
    var sg_13: c_uint = undefined;
    _ = &sg_13;
    var sb_14: c_uint = undefined;
    _ = &sb_14;
    var sa_15: c_uint = undefined;
    _ = &sa_15;
    var pixels_16: [*c]Uint32 = undefined;
    _ = &pixels_16;
    var sr_17: c_uint = undefined;
    _ = &sr_17;
    var sg_18: c_uint = undefined;
    _ = &sg_18;
    var sb_19: c_uint = undefined;
    _ = &sb_19;
    var sa_20: c_uint = undefined;
    _ = &sa_20;
    var pixels_21: [*c]Uint32 = undefined;
    _ = &pixels_21;
    var sr_22: c_uint = undefined;
    _ = &sr_22;
    var sg_23: c_uint = undefined;
    _ = &sg_23;
    var sb_24: c_uint = undefined;
    _ = &sb_24;
    var sa_25: c_uint = undefined;
    _ = &sa_25;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fmt = dst.*.fmt;
                inva = @bitCast(@as(c_int, @as(c_int, 255) - @as(c_int, a)));
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 4) => {
                        sdl_pc = 2;
                        continue;
                    },
                    else => {
                        sdl_pc = 77;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 30;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 31;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 47;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 54;
                        continue;
                    },
                    else => {
                        sdl_pc = 70;
                        continue;
                    },
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (false) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
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
                sa = 255;
                sr = SDL_expand_byte[fmt.*.Rbits][(pixels.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg = SDL_expand_byte[fmt.*.Gbits][(pixels.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb = SDL_expand_byte[fmt.*.Bbits][(pixels.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa = SDL_expand_byte[fmt.*.Abits][(pixels.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr = ((inva *% sr) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg = ((inva *% sg) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb = ((inva *% sb) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa = ((inva *% sa) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((((sr >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (false) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
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
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                pixels_1 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            15 => {
                sa_5 = 255;
                sr_2 = SDL_expand_byte[fmt.*.Rbits][(pixels_1.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_3 = SDL_expand_byte[fmt.*.Gbits][(pixels_1.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_4 = SDL_expand_byte[fmt.*.Bbits][(pixels_1.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_5 = SDL_expand_byte[fmt.*.Abits][(pixels_1.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_2 = ((inva *% sr_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_2 > @as(c_uint, 255)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                if (false) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                sr_2 = 255;
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
                sg_3 = ((inva *% sg_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_3 > @as(c_uint, 255)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                sg_3 = 255;
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
                sb_4 = ((inva *% sb_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_4 > @as(c_uint, 255)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                sb_4 = 255;
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
                sa_5 = ((inva *% sa_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_5 > @as(c_uint, 255)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                sa_5 = 255;
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
                pixels_1.* = ((((sr_2 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_3 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_4 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_5 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 16;
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
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                pixels_6 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                if (false) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            35 => {
                _ = &sa_10;
                sr_7 = SDL_expand_byte[fmt.*.Rbits][(pixels_6.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_8 = SDL_expand_byte[fmt.*.Gbits][(pixels_6.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_9 = SDL_expand_byte[fmt.*.Bbits][(pixels_6.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_10 = SDL_expand_byte[fmt.*.Abits][(pixels_6.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_7 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_7 > @as(c_uint, 255)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if (false) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                sr_7 = 255;
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
                sg_8 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_8 > @as(c_uint, 255)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                sg_8 = 255;
                {
                    sdl_pc = 43;
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
                sb_9 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_9 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                sb_9 = 255;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                pixels_6.* = ((((sr_7 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_8 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_9 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_10 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 36;
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
                pixels_11 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 51;
                    continue;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            51 => {
                _ = &sa_15;
                sr_12 = SDL_expand_byte[fmt.*.Rbits][(pixels_11.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_13 = SDL_expand_byte[fmt.*.Gbits][(pixels_11.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_14 = SDL_expand_byte[fmt.*.Bbits][(pixels_11.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_15 = SDL_expand_byte[fmt.*.Abits][(pixels_11.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_12 = (sr_12 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_13 = (sg_13 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_14 = (sb_14 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_11.* = ((((sr_12 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_13 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_14 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_15 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 52;
                    continue;
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
                    sdl_pc = 49;
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
                pixels_16 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 58;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            58 => {
                _ = &sa_20;
                sr_17 = SDL_expand_byte[fmt.*.Rbits][(pixels_16.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_18 = SDL_expand_byte[fmt.*.Gbits][(pixels_16.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_19 = SDL_expand_byte[fmt.*.Bbits][(pixels_16.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_20 = SDL_expand_byte[fmt.*.Abits][(pixels_16.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_17 = ((sr_17 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_17) / @as(c_uint, 255));
                if (sr_17 > @as(c_uint, 255)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
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
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                sr_17 = 255;
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
                sg_18 = ((sg_18 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_18) / @as(c_uint, 255));
                if (sg_18 > @as(c_uint, 255)) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                sg_18 = 255;
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
                sb_19 = ((sb_19 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_19) / @as(c_uint, 255));
                if (sb_19 > @as(c_uint, 255)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                sb_19 = 255;
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
                pixels_16.* = ((((sr_17 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_18 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_19 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_20 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 59;
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
                pixels_21 = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))));
                {
                    sdl_pc = 74;
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
                    sdl_pc = 3;
                    continue;
                }
            },
            74 => {
                sr_22 = r;
                sg_23 = g;
                sb_24 = b;
                sa_25 = a;
                _ = &sa_25;
                pixels_21.* = ((((sr_22 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
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
                    sdl_pc = 72;
                    continue;
                }
            },
            77 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
