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
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub export fn SDL_BlendFillRect(dst: [*c]SDL_Surface, arg_rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, arg_r: Uint8, arg_g: Uint8, arg_b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var clipped: SDL_Rect = undefined;
    _ = &clipped;
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
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_BlendFillRect(): dst"))));
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
                return SDL_SetError_REAL("SDL_BlendFillRect(): Unsupported surface format");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (rect != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                if (!SDL_GetRectIntersection_REAL(rect, &dst.*.clip_rect, &clipped)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                rect = &dst.*.clip_rect;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if ((blendMode == SDL_BLENDMODE_BLEND) or (blendMode == SDL_BLENDMODE_ADD)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                return @"true" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                rect = &clipped;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                r = @truncate((@as(c_uint, r) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                g = @truncate((@as(c_uint, g) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
                b = @truncate((@as(c_uint, b) *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))))) / @as(c_uint, 255));
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
                switch (@as(c_int, dst.*.fmt.*.bits_per_pixel)) {
                    @as(c_int, 15) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            16 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            17 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 31744) => {
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
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                return SDL_BlendFillRect_RGB555(dst, rect, blendMode, r, g, b, a);
            },
            20 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 63488) => {
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
                    sdl_pc = 16;
                    continue;
                }
            },
            22 => {
                return SDL_BlendFillRect_RGB565(dst, rect, blendMode, r, g, b, a);
            },
            23 => {
                switch (dst.*.fmt.*.Rmask) {
                    @as(Uint32, 16711680) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            24 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            25 => {
                if (!(dst.*.fmt.*.Amask != 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                return SDL_BlendFillRect_XRGB8888(dst, rect, blendMode, r, g, b, a);
            },
            27 => {
                return SDL_BlendFillRect_ARGB8888(dst, rect, blendMode, r, g, b, a);
            },
            28 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            30 => {
                return SDL_BlendFillRect_RGB(dst, rect, blendMode, r, g, b, a);
            },
            31 => {
                return SDL_BlendFillRect_RGBA(dst, rect, blendMode, r, g, b, a);
            },
            32 => {
                unreachable;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_BlendFillRects(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, blendMode: SDL_BlendMode, arg_r: Uint8, arg_g: Uint8, arg_b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var i: c_int = undefined;
    _ = &i;
    var func: ?*const fn (dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool = undefined;
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
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_BlendFillRects(): dst"))));
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
                return SDL_SetError_REAL("SDL_BlendFillRects(): Unsupported surface format");
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
                func = SDL_BlendFillRect_RGB555;
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
                func = SDL_BlendFillRect_RGB565;
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
                func = SDL_BlendFillRect_XRGB8888;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                func = SDL_BlendFillRect_ARGB8888;
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
                i = 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                func = SDL_BlendFillRect_RGB;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                func = SDL_BlendFillRect_RGBA;
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
                if (!SDL_GetRectIntersection_REAL(&rects[@bitCast(@as(isize, @intCast(i)))], &dst.*.clip_rect, &rect)) {
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
                result = func.?(dst, &rect, blendMode, r, g, b, a);
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
pub fn SDL_BlendFillRect_RGB555(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint16 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint16 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint16 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint16 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint16 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
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
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 104;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 105;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 168;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 195;
                        continue;
                    },
                    else => {
                        sdl_pc = 258;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
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
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (false) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                pixels += 1;
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
                sa_4 = 255;
                sr_1 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_2 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_3 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_1 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_2 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_3 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 19;
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
                pixels += 1;
                {
                    sdl_pc = 21;
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
                sa_8 = 255;
                sr_5 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_6 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_7 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_5 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_6 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_7 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 23;
                    continue;
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
                pixels += 1;
                {
                    sdl_pc = 25;
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
                sa_12 = 255;
                sr_9 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_10 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_11 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_9 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_10 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_11 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (false) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                pixels += 1;
                {
                    sdl_pc = 12;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 33;
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
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                sa_22 = 255;
                sr_19 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_20 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_21 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                if (false) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                pixels_17 += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            44 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                sb_21 = 255;
                {
                    sdl_pc = 52;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                sa_22 = 255;
                {
                    sdl_pc = 55;
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
                pixels_17.* = @truncate((((sr_19 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_20 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_21 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                sa_26 = 255;
                sr_23 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_24 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_25 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                if (false) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pixels_17 += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            60 => {
                sr_23 = 255;
                {
                    sdl_pc = 62;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                sg_24 = 255;
                {
                    sdl_pc = 65;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                sb_25 = 255;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                sa_26 = 255;
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
                pixels_17.* = @truncate((((sr_23 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_24 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_25 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 58;
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
                sa_30 = 255;
                sr_27 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_28 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_29 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                if (false) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                pixels_17 += 1;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            76 => {
                sr_27 = 255;
                {
                    sdl_pc = 78;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                sb_29 = 255;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                sa_30 = 255;
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
                pixels_17.* = @truncate((((sr_27 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_28 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_29 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                sa_34 = 255;
                sr_31 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_32 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_33 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                if (false) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                pixels_17 += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            92 => {
                sr_31 = 255;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                sb_33 = 255;
                {
                    sdl_pc = 100;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                sa_34 = 255;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                pixels_17.* = @truncate((((sr_31 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_32 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_33 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 90;
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
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                if (false) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            109 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 155;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            111 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            112 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 109;
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
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            117 => {
                _ = &sa_44;
                sr_41 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_42 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_43 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
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
                pixels_39 += 1;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            120 => {
                sr_41 = 255;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                sg_42 = 255;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                sb_43 = 255;
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
                pixels_39.* = @truncate((((sr_41 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_42 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_43 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 118;
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
                _ = &sa_48;
                sr_45 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_46 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_47 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
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
                pixels_39 += 1;
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            133 => {
                sr_45 = 255;
                {
                    sdl_pc = 135;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                sb_47 = 255;
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
                pixels_39.* = @truncate((((sr_45 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_46 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_47 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 131;
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
                _ = &sa_52;
                sr_49 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_50 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_51 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            144 => {
                if (false) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                pixels_39 += 1;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            146 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                sg_50 = 255;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                sb_51 = 255;
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
                pixels_39.* = @truncate((((sr_49 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_50 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_51 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 144;
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
                _ = &sa_56;
                sr_53 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_54 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_55 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
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
                pixels_39 += 1;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            159 => {
                sr_53 = 255;
                {
                    sdl_pc = 161;
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
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                sg_54 = 255;
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
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                sb_55 = 255;
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
                pixels_39.* = @truncate((((sr_53 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_54 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_55 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            170 => {
                if (false) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            172 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 174;
                    continue;
                }
            },
            173 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 176;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 183;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 187;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 191;
                        continue;
                    },
                    else => {
                        sdl_pc = 175;
                        continue;
                    },
                }
            },
            174 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            175 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            178 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            180 => {
                _ = &sa_66;
                sr_63 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_64 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_65 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_63 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_64 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_65 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                if (false) {
                    sdl_pc = 180;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                pixels_61 += 1;
                {
                    sdl_pc = 183;
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
                _ = &sa_70;
                sr_67 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_68 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_69 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_67 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_68 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_69 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                if (false) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                pixels_61 += 1;
                {
                    sdl_pc = 187;
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
                _ = &sa_74;
                sr_71 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_72 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_73 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_71 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_72 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_73 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                if (false) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            190 => {
                pixels_61 += 1;
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                _ = &sa_78;
                sr_75 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_76 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_77 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_75 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_76 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_77 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                pixels_61 += 1;
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            197 => {
                if (false) {
                    sdl_pc = 196;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            199 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 203;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 219;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 232;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 245;
                        continue;
                    },
                    else => {
                        sdl_pc = 202;
                        continue;
                    },
                }
            },
            201 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            202 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 199;
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
                    sdl_pc = 207;
                    continue;
                }
            },
            205 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            207 => {
                _ = &sa_88;
                sr_85 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_86 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_87 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 210;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            208 => {
                if (false) {
                    sdl_pc = 207;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                pixels_83 += 1;
                {
                    sdl_pc = 219;
                    continue;
                }
            },
            210 => {
                sr_85 = 255;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            212 => {
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 213;
                    continue;
                } else {
                    sdl_pc = 214;
                    continue;
                }
            },
            213 => {
                sg_86 = 255;
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            215 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 216;
                    continue;
                } else {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                sb_87 = 255;
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            218 => {
                pixels_83.* = @truncate((((sr_85 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_86 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_87 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 208;
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
                _ = &sa_92;
                sr_89 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_90 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_91 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            221 => {
                if (false) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                pixels_83 += 1;
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            223 => {
                sr_89 = 255;
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                sg_90 = 255;
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            227 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            228 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                sb_91 = 255;
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
                pixels_83.* = @truncate((((sr_89 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_90 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_91 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                _ = &sa_96;
                sr_93 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_94 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_95 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                if (false) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                pixels_83 += 1;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            236 => {
                sr_93 = 255;
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            238 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                sg_94 = 255;
                {
                    sdl_pc = 241;
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
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                sb_95 = 255;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                pixels_83.* = @truncate((((sr_93 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_94 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_95 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 234;
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
                _ = &sa_100;
                sr_97 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 31744)) >> @intCast(@as(c_int, 10)))))];
                sg_98 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 992)) >> @intCast(@as(c_int, 5)))))];
                sb_99 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            247 => {
                if (false) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                pixels_83 += 1;
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            249 => {
                sr_97 = 255;
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                sg_98 = 255;
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                sb_99 = 255;
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                pixels_83.* = @truncate((((sr_97 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_98 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_99 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 247;
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
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 262;
                    continue;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            262 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 263;
                    continue;
                } else {
                    sdl_pc = 264;
                    continue;
                }
            },
            263 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 266;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 273;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 277;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 281;
                        continue;
                    },
                    else => {
                        sdl_pc = 265;
                        continue;
                    },
                }
            },
            264 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            265 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            266 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            268 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 267;
                    continue;
                } else {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            270 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = @truncate((((sr_107 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_108 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_109 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                if (false) {
                    sdl_pc = 270;
                    continue;
                } else {
                    sdl_pc = 272;
                    continue;
                }
            },
            272 => {
                pixels_105 += 1;
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = @truncate((((sr_111 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_112 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_113 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                if (false) {
                    sdl_pc = 274;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                pixels_105 += 1;
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = @truncate((((sr_115 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_116 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_117 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                if (false) {
                    sdl_pc = 278;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                pixels_105 += 1;
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = @truncate((((sr_119 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 10))) | ((sg_120 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 5)))) | (sb_121 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                if (false) {
                    sdl_pc = 282;
                    continue;
                } else {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                pixels_105 += 1;
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendFillRect_RGB565(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint16 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint16 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint16 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint16 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint16 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
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
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 104;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 105;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 168;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 195;
                        continue;
                    },
                    else => {
                        sdl_pc = 258;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
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
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (false) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                pixels += 1;
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
                sa_4 = 255;
                sr_1 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_2 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_3 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_1 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_2 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_3 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 19;
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
                pixels += 1;
                {
                    sdl_pc = 21;
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
                sa_8 = 255;
                sr_5 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_6 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_7 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_5 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_6 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_7 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 23;
                    continue;
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
                pixels += 1;
                {
                    sdl_pc = 25;
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
                sa_12 = 255;
                sr_9 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_10 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_11 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels.*) & @as(c_int, 31))))];
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate((((sr_9 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_10 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_11 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (false) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                pixels += 1;
                {
                    sdl_pc = 12;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 33;
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
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                sa_22 = 255;
                sr_19 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_20 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_21 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                if (false) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                pixels_17 += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            44 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                sb_21 = 255;
                {
                    sdl_pc = 52;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                sa_22 = 255;
                {
                    sdl_pc = 55;
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
                pixels_17.* = @truncate((((sr_19 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_20 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_21 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                sa_26 = 255;
                sr_23 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_24 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_25 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                if (false) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pixels_17 += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            60 => {
                sr_23 = 255;
                {
                    sdl_pc = 62;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                sg_24 = 255;
                {
                    sdl_pc = 65;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                sb_25 = 255;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                sa_26 = 255;
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
                pixels_17.* = @truncate((((sr_23 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_24 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_25 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 58;
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
                sa_30 = 255;
                sr_27 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_28 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_29 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                if (false) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                pixels_17 += 1;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            76 => {
                sr_27 = 255;
                {
                    sdl_pc = 78;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                sb_29 = 255;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                sa_30 = 255;
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
                pixels_17.* = @truncate((((sr_27 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_28 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_29 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                sa_34 = 255;
                sr_31 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_32 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_17.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_33 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_17.*) & @as(c_int, 31))))];
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                if (false) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                pixels_17 += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            92 => {
                sr_31 = 255;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                sb_33 = 255;
                {
                    sdl_pc = 100;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                sa_34 = 255;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                pixels_17.* = @truncate((((sr_31 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_32 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_33 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 90;
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
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                if (false) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            109 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 155;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            111 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            112 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 109;
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
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            117 => {
                _ = &sa_44;
                sr_41 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_42 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_43 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
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
                pixels_39 += 1;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            120 => {
                sr_41 = 255;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                sg_42 = 255;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                sb_43 = 255;
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
                pixels_39.* = @truncate((((sr_41 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_42 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_43 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 118;
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
                _ = &sa_48;
                sr_45 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_46 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_47 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
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
                pixels_39 += 1;
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            133 => {
                sr_45 = 255;
                {
                    sdl_pc = 135;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                sb_47 = 255;
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
                pixels_39.* = @truncate((((sr_45 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_46 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_47 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 131;
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
                _ = &sa_52;
                sr_49 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_50 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_51 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            144 => {
                if (false) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                pixels_39 += 1;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            146 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                sg_50 = 255;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                sb_51 = 255;
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
                pixels_39.* = @truncate((((sr_49 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_50 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_51 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 144;
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
                _ = &sa_56;
                sr_53 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_54 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_39.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_55 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_39.*) & @as(c_int, 31))))];
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
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
                pixels_39 += 1;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            159 => {
                sr_53 = 255;
                {
                    sdl_pc = 161;
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
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                sg_54 = 255;
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
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                sb_55 = 255;
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
                pixels_39.* = @truncate((((sr_53 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_54 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_55 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            170 => {
                if (false) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            172 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 174;
                    continue;
                }
            },
            173 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 176;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 183;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 187;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 191;
                        continue;
                    },
                    else => {
                        sdl_pc = 175;
                        continue;
                    },
                }
            },
            174 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            175 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            178 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            180 => {
                _ = &sa_66;
                sr_63 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_64 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_65 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_63 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_64 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_65 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                if (false) {
                    sdl_pc = 180;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                pixels_61 += 1;
                {
                    sdl_pc = 183;
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
                _ = &sa_70;
                sr_67 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_68 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_69 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_67 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_68 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_69 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                if (false) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                pixels_61 += 1;
                {
                    sdl_pc = 187;
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
                _ = &sa_74;
                sr_71 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_72 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_73 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_71 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_72 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_73 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                if (false) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            190 => {
                pixels_61 += 1;
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                _ = &sa_78;
                sr_75 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_76 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_61.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_77 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_61.*) & @as(c_int, 31))))];
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate((((sr_75 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_76 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_77 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                pixels_61 += 1;
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            197 => {
                if (false) {
                    sdl_pc = 196;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            199 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 203;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 219;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 232;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 245;
                        continue;
                    },
                    else => {
                        sdl_pc = 202;
                        continue;
                    },
                }
            },
            201 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            202 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 199;
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
                    sdl_pc = 207;
                    continue;
                }
            },
            205 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            207 => {
                _ = &sa_88;
                sr_85 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_86 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_87 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 210;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            208 => {
                if (false) {
                    sdl_pc = 207;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                pixels_83 += 1;
                {
                    sdl_pc = 219;
                    continue;
                }
            },
            210 => {
                sr_85 = 255;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            212 => {
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 213;
                    continue;
                } else {
                    sdl_pc = 214;
                    continue;
                }
            },
            213 => {
                sg_86 = 255;
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            215 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 216;
                    continue;
                } else {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                sb_87 = 255;
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            218 => {
                pixels_83.* = @truncate((((sr_85 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_86 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_87 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 208;
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
                _ = &sa_92;
                sr_89 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_90 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_91 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            221 => {
                if (false) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                pixels_83 += 1;
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            223 => {
                sr_89 = 255;
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                sg_90 = 255;
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            227 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            228 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                sb_91 = 255;
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
                pixels_83.* = @truncate((((sr_89 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_90 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_91 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                _ = &sa_96;
                sr_93 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_94 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_95 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                if (false) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                pixels_83 += 1;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            236 => {
                sr_93 = 255;
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            238 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                sg_94 = 255;
                {
                    sdl_pc = 241;
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
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                sb_95 = 255;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                pixels_83.* = @truncate((((sr_93 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_94 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_95 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 234;
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
                _ = &sa_100;
                sr_97 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 63488)) >> @intCast(@as(c_int, 11)))))];
                sg_98 = SDL_expand_byte[@as(c_int, 6)][@bitCast(@as(isize, @intCast((@as(c_int, pixels_83.*) & @as(c_int, 2016)) >> @intCast(@as(c_int, 5)))))];
                sb_99 = SDL_expand_byte[@as(c_int, 5)][@bitCast(@as(isize, @intCast(@as(c_int, pixels_83.*) & @as(c_int, 31))))];
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            247 => {
                if (false) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                pixels_83 += 1;
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            249 => {
                sr_97 = 255;
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                sg_98 = 255;
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                sb_99 = 255;
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                pixels_83.* = @truncate((((sr_97 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_98 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_99 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 247;
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
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 262;
                    continue;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            262 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 263;
                    continue;
                } else {
                    sdl_pc = 264;
                    continue;
                }
            },
            263 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 266;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 273;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 277;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 281;
                        continue;
                    },
                    else => {
                        sdl_pc = 265;
                        continue;
                    },
                }
            },
            264 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            265 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            266 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            268 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 267;
                    continue;
                } else {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            270 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = @truncate((((sr_107 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_108 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_109 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                if (false) {
                    sdl_pc = 270;
                    continue;
                } else {
                    sdl_pc = 272;
                    continue;
                }
            },
            272 => {
                pixels_105 += 1;
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = @truncate((((sr_111 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_112 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_113 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                if (false) {
                    sdl_pc = 274;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                pixels_105 += 1;
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = @truncate((((sr_115 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_116 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_117 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                if (false) {
                    sdl_pc = 278;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                pixels_105 += 1;
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = @truncate((((sr_119 >> @intCast(@as(c_uint, 3))) << @intCast(@as(c_uint, 11))) | ((sg_120 >> @intCast(@as(c_uint, 2))) << @intCast(@as(c_uint, 5)))) | (sb_121 >> @intCast(@as(c_uint, 3))));
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                if (false) {
                    sdl_pc = 282;
                    continue;
                } else {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                pixels_105 += 1;
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendFillRect_XRGB8888(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint32 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint32 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint32 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint32 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint32 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
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
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 104;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 105;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 168;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 195;
                        continue;
                    },
                    else => {
                        sdl_pc = 258;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
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
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (false) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                pixels += 1;
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
                sa_4 = 255;
                sr_1 = (pixels.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_2 = (pixels.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_3 = pixels.* & @as(Uint32, 255);
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((sr_1 << @intCast(@as(c_uint, 16))) | (sg_2 << @intCast(@as(c_uint, 8)))) | sb_3;
                {
                    sdl_pc = 19;
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
                pixels += 1;
                {
                    sdl_pc = 21;
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
                sa_8 = 255;
                sr_5 = (pixels.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_6 = (pixels.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_7 = pixels.* & @as(Uint32, 255);
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((sr_5 << @intCast(@as(c_uint, 16))) | (sg_6 << @intCast(@as(c_uint, 8)))) | sb_7;
                {
                    sdl_pc = 23;
                    continue;
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
                pixels += 1;
                {
                    sdl_pc = 25;
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
                sa_12 = 255;
                sr_9 = (pixels.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_10 = (pixels.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_11 = pixels.* & @as(Uint32, 255);
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((sr_9 << @intCast(@as(c_uint, 16))) | (sg_10 << @intCast(@as(c_uint, 8)))) | sb_11;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (false) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                pixels += 1;
                {
                    sdl_pc = 12;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 33;
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
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                sa_22 = 255;
                sr_19 = (pixels_17.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_20 = (pixels_17.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_21 = pixels_17.* & @as(Uint32, 255);
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                if (false) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                pixels_17 += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            44 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                sb_21 = 255;
                {
                    sdl_pc = 52;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                sa_22 = 255;
                {
                    sdl_pc = 55;
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
                pixels_17.* = ((sr_19 << @intCast(@as(c_uint, 16))) | (sg_20 << @intCast(@as(c_uint, 8)))) | sb_21;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                sa_26 = 255;
                sr_23 = (pixels_17.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_24 = (pixels_17.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_25 = pixels_17.* & @as(Uint32, 255);
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                if (false) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pixels_17 += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            60 => {
                sr_23 = 255;
                {
                    sdl_pc = 62;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                sg_24 = 255;
                {
                    sdl_pc = 65;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                sb_25 = 255;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                sa_26 = 255;
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
                pixels_17.* = ((sr_23 << @intCast(@as(c_uint, 16))) | (sg_24 << @intCast(@as(c_uint, 8)))) | sb_25;
                {
                    sdl_pc = 58;
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
                sa_30 = 255;
                sr_27 = (pixels_17.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_28 = (pixels_17.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_29 = pixels_17.* & @as(Uint32, 255);
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                if (false) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                pixels_17 += 1;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            76 => {
                sr_27 = 255;
                {
                    sdl_pc = 78;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                sb_29 = 255;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                sa_30 = 255;
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
                pixels_17.* = ((sr_27 << @intCast(@as(c_uint, 16))) | (sg_28 << @intCast(@as(c_uint, 8)))) | sb_29;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                sa_34 = 255;
                sr_31 = (pixels_17.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_32 = (pixels_17.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_33 = pixels_17.* & @as(Uint32, 255);
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                if (false) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                pixels_17 += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            92 => {
                sr_31 = 255;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                sb_33 = 255;
                {
                    sdl_pc = 100;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                sa_34 = 255;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                pixels_17.* = ((sr_31 << @intCast(@as(c_uint, 16))) | (sg_32 << @intCast(@as(c_uint, 8)))) | sb_33;
                {
                    sdl_pc = 90;
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
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                if (false) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            109 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 155;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            111 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            112 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 109;
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
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            117 => {
                _ = &sa_44;
                sr_41 = (pixels_39.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_42 = (pixels_39.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_43 = pixels_39.* & @as(Uint32, 255);
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
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
                pixels_39 += 1;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            120 => {
                sr_41 = 255;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                sg_42 = 255;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                sb_43 = 255;
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
                pixels_39.* = ((sr_41 << @intCast(@as(c_uint, 16))) | (sg_42 << @intCast(@as(c_uint, 8)))) | sb_43;
                {
                    sdl_pc = 118;
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
                _ = &sa_48;
                sr_45 = (pixels_39.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_46 = (pixels_39.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_47 = pixels_39.* & @as(Uint32, 255);
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
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
                pixels_39 += 1;
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            133 => {
                sr_45 = 255;
                {
                    sdl_pc = 135;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                sb_47 = 255;
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
                pixels_39.* = ((sr_45 << @intCast(@as(c_uint, 16))) | (sg_46 << @intCast(@as(c_uint, 8)))) | sb_47;
                {
                    sdl_pc = 131;
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
                _ = &sa_52;
                sr_49 = (pixels_39.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_50 = (pixels_39.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_51 = pixels_39.* & @as(Uint32, 255);
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            144 => {
                if (false) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                pixels_39 += 1;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            146 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                sg_50 = 255;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                sb_51 = 255;
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
                pixels_39.* = ((sr_49 << @intCast(@as(c_uint, 16))) | (sg_50 << @intCast(@as(c_uint, 8)))) | sb_51;
                {
                    sdl_pc = 144;
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
                _ = &sa_56;
                sr_53 = (pixels_39.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_54 = (pixels_39.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_55 = pixels_39.* & @as(Uint32, 255);
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
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
                pixels_39 += 1;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            159 => {
                sr_53 = 255;
                {
                    sdl_pc = 161;
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
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                sg_54 = 255;
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
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                sb_55 = 255;
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
                pixels_39.* = ((sr_53 << @intCast(@as(c_uint, 16))) | (sg_54 << @intCast(@as(c_uint, 8)))) | sb_55;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            170 => {
                if (false) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            172 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 174;
                    continue;
                }
            },
            173 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 176;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 183;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 187;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 191;
                        continue;
                    },
                    else => {
                        sdl_pc = 175;
                        continue;
                    },
                }
            },
            174 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            175 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            178 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            180 => {
                _ = &sa_66;
                sr_63 = (pixels_61.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_64 = (pixels_61.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_65 = pixels_61.* & @as(Uint32, 255);
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((sr_63 << @intCast(@as(c_uint, 16))) | (sg_64 << @intCast(@as(c_uint, 8)))) | sb_65;
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                if (false) {
                    sdl_pc = 180;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                pixels_61 += 1;
                {
                    sdl_pc = 183;
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
                _ = &sa_70;
                sr_67 = (pixels_61.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_68 = (pixels_61.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_69 = pixels_61.* & @as(Uint32, 255);
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((sr_67 << @intCast(@as(c_uint, 16))) | (sg_68 << @intCast(@as(c_uint, 8)))) | sb_69;
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                if (false) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                pixels_61 += 1;
                {
                    sdl_pc = 187;
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
                _ = &sa_74;
                sr_71 = (pixels_61.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_72 = (pixels_61.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_73 = pixels_61.* & @as(Uint32, 255);
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((sr_71 << @intCast(@as(c_uint, 16))) | (sg_72 << @intCast(@as(c_uint, 8)))) | sb_73;
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                if (false) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            190 => {
                pixels_61 += 1;
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                _ = &sa_78;
                sr_75 = (pixels_61.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_76 = (pixels_61.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_77 = pixels_61.* & @as(Uint32, 255);
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((sr_75 << @intCast(@as(c_uint, 16))) | (sg_76 << @intCast(@as(c_uint, 8)))) | sb_77;
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                pixels_61 += 1;
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            197 => {
                if (false) {
                    sdl_pc = 196;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            199 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 203;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 219;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 232;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 245;
                        continue;
                    },
                    else => {
                        sdl_pc = 202;
                        continue;
                    },
                }
            },
            201 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            202 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 199;
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
                    sdl_pc = 207;
                    continue;
                }
            },
            205 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            207 => {
                _ = &sa_88;
                sr_85 = (pixels_83.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_86 = (pixels_83.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_87 = pixels_83.* & @as(Uint32, 255);
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 210;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            208 => {
                if (false) {
                    sdl_pc = 207;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                pixels_83 += 1;
                {
                    sdl_pc = 219;
                    continue;
                }
            },
            210 => {
                sr_85 = 255;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            212 => {
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 213;
                    continue;
                } else {
                    sdl_pc = 214;
                    continue;
                }
            },
            213 => {
                sg_86 = 255;
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            215 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 216;
                    continue;
                } else {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                sb_87 = 255;
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            218 => {
                pixels_83.* = ((sr_85 << @intCast(@as(c_uint, 16))) | (sg_86 << @intCast(@as(c_uint, 8)))) | sb_87;
                {
                    sdl_pc = 208;
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
                _ = &sa_92;
                sr_89 = (pixels_83.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_90 = (pixels_83.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_91 = pixels_83.* & @as(Uint32, 255);
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            221 => {
                if (false) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                pixels_83 += 1;
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            223 => {
                sr_89 = 255;
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                sg_90 = 255;
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            227 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            228 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                sb_91 = 255;
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
                pixels_83.* = ((sr_89 << @intCast(@as(c_uint, 16))) | (sg_90 << @intCast(@as(c_uint, 8)))) | sb_91;
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                _ = &sa_96;
                sr_93 = (pixels_83.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_94 = (pixels_83.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_95 = pixels_83.* & @as(Uint32, 255);
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                if (false) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                pixels_83 += 1;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            236 => {
                sr_93 = 255;
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            238 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                sg_94 = 255;
                {
                    sdl_pc = 241;
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
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                sb_95 = 255;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                pixels_83.* = ((sr_93 << @intCast(@as(c_uint, 16))) | (sg_94 << @intCast(@as(c_uint, 8)))) | sb_95;
                {
                    sdl_pc = 234;
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
                _ = &sa_100;
                sr_97 = (pixels_83.* & @as(Uint32, 16711680)) >> @intCast(@as(Uint32, 16));
                sg_98 = (pixels_83.* & @as(Uint32, 65280)) >> @intCast(@as(Uint32, 8));
                sb_99 = pixels_83.* & @as(Uint32, 255);
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            247 => {
                if (false) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                pixels_83 += 1;
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            249 => {
                sr_97 = 255;
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                sg_98 = 255;
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                sb_99 = 255;
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                pixels_83.* = ((sr_97 << @intCast(@as(c_uint, 16))) | (sg_98 << @intCast(@as(c_uint, 8)))) | sb_99;
                {
                    sdl_pc = 247;
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
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 262;
                    continue;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            262 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 263;
                    continue;
                } else {
                    sdl_pc = 264;
                    continue;
                }
            },
            263 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 266;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 273;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 277;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 281;
                        continue;
                    },
                    else => {
                        sdl_pc = 265;
                        continue;
                    },
                }
            },
            264 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            265 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            266 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            268 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 267;
                    continue;
                } else {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            270 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = ((sr_107 << @intCast(@as(c_uint, 16))) | (sg_108 << @intCast(@as(c_uint, 8)))) | sb_109;
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                if (false) {
                    sdl_pc = 270;
                    continue;
                } else {
                    sdl_pc = 272;
                    continue;
                }
            },
            272 => {
                pixels_105 += 1;
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = ((sr_111 << @intCast(@as(c_uint, 16))) | (sg_112 << @intCast(@as(c_uint, 8)))) | sb_113;
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                if (false) {
                    sdl_pc = 274;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                pixels_105 += 1;
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = ((sr_115 << @intCast(@as(c_uint, 16))) | (sg_116 << @intCast(@as(c_uint, 8)))) | sb_117;
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                if (false) {
                    sdl_pc = 278;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                pixels_105 += 1;
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = ((sr_119 << @intCast(@as(c_uint, 16))) | (sg_120 << @intCast(@as(c_uint, 8)))) | sb_121;
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                if (false) {
                    sdl_pc = 282;
                    continue;
                } else {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                pixels_105 += 1;
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendFillRect_ARGB8888(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint32 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint32 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint32 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint32 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint32 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
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
                        sdl_pc = 29;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 104;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 105;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 168;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 195;
                        continue;
                    },
                    else => {
                        sdl_pc = 258;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
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
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (false) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                pixels += 1;
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
                sa_4 = 255;
                sr_1 = (pixels.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_2 = (pixels.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_3 = pixels.* & @as(Uint32, 255);
                sa_4 = pixels.* >> @intCast(@as(Uint32, 24));
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = (((sa_4 << @intCast(@as(c_uint, 24))) | (sr_1 << @intCast(@as(c_uint, 16)))) | (sg_2 << @intCast(@as(c_uint, 8)))) | sb_3;
                {
                    sdl_pc = 19;
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
                pixels += 1;
                {
                    sdl_pc = 21;
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
                sa_8 = 255;
                sr_5 = (pixels.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_6 = (pixels.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_7 = pixels.* & @as(Uint32, 255);
                sa_8 = pixels.* >> @intCast(@as(Uint32, 24));
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = (((sa_8 << @intCast(@as(c_uint, 24))) | (sr_5 << @intCast(@as(c_uint, 16)))) | (sg_6 << @intCast(@as(c_uint, 8)))) | sb_7;
                {
                    sdl_pc = 23;
                    continue;
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
                pixels += 1;
                {
                    sdl_pc = 25;
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
                sa_12 = 255;
                sr_9 = (pixels.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_10 = (pixels.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_11 = pixels.* & @as(Uint32, 255);
                sa_12 = pixels.* >> @intCast(@as(Uint32, 24));
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = (((sa_12 << @intCast(@as(c_uint, 24))) | (sr_9 << @intCast(@as(c_uint, 16)))) | (sg_10 << @intCast(@as(c_uint, 8)))) | sb_11;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (false) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                pixels += 1;
                {
                    sdl_pc = 12;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 88;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            35 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 33;
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
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                sa_22 = 255;
                sr_19 = (pixels_17.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_20 = (pixels_17.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_21 = pixels_17.* & @as(Uint32, 255);
                sa_22 = pixels_17.* >> @intCast(@as(Uint32, 24));
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            42 => {
                if (false) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                pixels_17 += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            44 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                sb_21 = 255;
                {
                    sdl_pc = 52;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                sa_22 = 255;
                {
                    sdl_pc = 55;
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
                pixels_17.* = (((sa_22 << @intCast(@as(c_uint, 24))) | (sr_19 << @intCast(@as(c_uint, 16)))) | (sg_20 << @intCast(@as(c_uint, 8)))) | sb_21;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                sa_26 = 255;
                sr_23 = (pixels_17.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_24 = (pixels_17.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_25 = pixels_17.* & @as(Uint32, 255);
                sa_26 = pixels_17.* >> @intCast(@as(Uint32, 24));
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                if (false) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                pixels_17 += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            60 => {
                sr_23 = 255;
                {
                    sdl_pc = 62;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                sg_24 = 255;
                {
                    sdl_pc = 65;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                sb_25 = 255;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                sa_26 = 255;
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
                pixels_17.* = (((sa_26 << @intCast(@as(c_uint, 24))) | (sr_23 << @intCast(@as(c_uint, 16)))) | (sg_24 << @intCast(@as(c_uint, 8)))) | sb_25;
                {
                    sdl_pc = 58;
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
                sa_30 = 255;
                sr_27 = (pixels_17.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_28 = (pixels_17.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_29 = pixels_17.* & @as(Uint32, 255);
                sa_30 = pixels_17.* >> @intCast(@as(Uint32, 24));
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                if (false) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                pixels_17 += 1;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            76 => {
                sr_27 = 255;
                {
                    sdl_pc = 78;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                sb_29 = 255;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                sa_30 = 255;
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
                pixels_17.* = (((sa_30 << @intCast(@as(c_uint, 24))) | (sr_27 << @intCast(@as(c_uint, 16)))) | (sg_28 << @intCast(@as(c_uint, 8)))) | sb_29;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                sa_34 = 255;
                sr_31 = (pixels_17.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_32 = (pixels_17.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_33 = pixels_17.* & @as(Uint32, 255);
                sa_34 = pixels_17.* >> @intCast(@as(Uint32, 24));
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                if (false) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                pixels_17 += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            92 => {
                sr_31 = 255;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                sb_33 = 255;
                {
                    sdl_pc = 100;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                sa_34 = 255;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                pixels_17.* = (((sa_34 << @intCast(@as(c_uint, 24))) | (sr_31 << @intCast(@as(c_uint, 16)))) | (sg_32 << @intCast(@as(c_uint, 8)))) | sb_33;
                {
                    sdl_pc = 90;
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
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            107 => {
                if (false) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            109 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 129;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 142;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 155;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            111 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            112 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 109;
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
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            116 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            117 => {
                _ = &sa_44;
                sr_41 = (pixels_39.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_42 = (pixels_39.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_43 = pixels_39.* & @as(Uint32, 255);
                sa_44 = pixels_39.* >> @intCast(@as(Uint32, 24));
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
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
                pixels_39 += 1;
                {
                    sdl_pc = 129;
                    continue;
                }
            },
            120 => {
                sr_41 = 255;
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 122;
                    continue;
                }
            },
            122 => {
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                sg_42 = 255;
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 125;
                    continue;
                }
            },
            125 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                sb_43 = 255;
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
                pixels_39.* = (((sa_44 << @intCast(@as(c_uint, 24))) | (sr_41 << @intCast(@as(c_uint, 16)))) | (sg_42 << @intCast(@as(c_uint, 8)))) | sb_43;
                {
                    sdl_pc = 118;
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
                _ = &sa_48;
                sr_45 = (pixels_39.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_46 = (pixels_39.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_47 = pixels_39.* & @as(Uint32, 255);
                sa_48 = pixels_39.* >> @intCast(@as(Uint32, 24));
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
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
                pixels_39 += 1;
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            133 => {
                sr_45 = 255;
                {
                    sdl_pc = 135;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                sb_47 = 255;
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
                pixels_39.* = (((sa_48 << @intCast(@as(c_uint, 24))) | (sr_45 << @intCast(@as(c_uint, 16)))) | (sg_46 << @intCast(@as(c_uint, 8)))) | sb_47;
                {
                    sdl_pc = 131;
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
                _ = &sa_52;
                sr_49 = (pixels_39.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_50 = (pixels_39.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_51 = pixels_39.* & @as(Uint32, 255);
                sa_52 = pixels_39.* >> @intCast(@as(Uint32, 24));
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            144 => {
                if (false) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                pixels_39 += 1;
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            146 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            149 => {
                sg_50 = 255;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            152 => {
                sb_51 = 255;
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
                pixels_39.* = (((sa_52 << @intCast(@as(c_uint, 24))) | (sr_49 << @intCast(@as(c_uint, 16)))) | (sg_50 << @intCast(@as(c_uint, 8)))) | sb_51;
                {
                    sdl_pc = 144;
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
                _ = &sa_56;
                sr_53 = (pixels_39.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_54 = (pixels_39.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_55 = pixels_39.* & @as(Uint32, 255);
                sa_56 = pixels_39.* >> @intCast(@as(Uint32, 24));
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
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
                pixels_39 += 1;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            159 => {
                sr_53 = 255;
                {
                    sdl_pc = 161;
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
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                sg_54 = 255;
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
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 165;
                    continue;
                } else {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                sb_55 = 255;
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
                pixels_39.* = (((sa_56 << @intCast(@as(c_uint, 24))) | (sr_53 << @intCast(@as(c_uint, 16)))) | (sg_54 << @intCast(@as(c_uint, 8)))) | sb_55;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            170 => {
                if (false) {
                    sdl_pc = 169;
                    continue;
                } else {
                    sdl_pc = 171;
                    continue;
                }
            },
            171 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            172 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 173;
                    continue;
                } else {
                    sdl_pc = 174;
                    continue;
                }
            },
            173 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 176;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 183;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 187;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 191;
                        continue;
                    },
                    else => {
                        sdl_pc = 175;
                        continue;
                    },
                }
            },
            174 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            175 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            176 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            178 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 177;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 175;
                    continue;
                }
            },
            180 => {
                _ = &sa_66;
                sr_63 = (pixels_61.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_64 = (pixels_61.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_65 = pixels_61.* & @as(Uint32, 255);
                sa_66 = pixels_61.* >> @intCast(@as(Uint32, 24));
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = (((sa_66 << @intCast(@as(c_uint, 24))) | (sr_63 << @intCast(@as(c_uint, 16)))) | (sg_64 << @intCast(@as(c_uint, 8)))) | sb_65;
                {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                if (false) {
                    sdl_pc = 180;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            182 => {
                pixels_61 += 1;
                {
                    sdl_pc = 183;
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
                _ = &sa_70;
                sr_67 = (pixels_61.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_68 = (pixels_61.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_69 = pixels_61.* & @as(Uint32, 255);
                sa_70 = pixels_61.* >> @intCast(@as(Uint32, 24));
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = (((sa_70 << @intCast(@as(c_uint, 24))) | (sr_67 << @intCast(@as(c_uint, 16)))) | (sg_68 << @intCast(@as(c_uint, 8)))) | sb_69;
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                if (false) {
                    sdl_pc = 184;
                    continue;
                } else {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                pixels_61 += 1;
                {
                    sdl_pc = 187;
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
                _ = &sa_74;
                sr_71 = (pixels_61.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_72 = (pixels_61.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_73 = pixels_61.* & @as(Uint32, 255);
                sa_74 = pixels_61.* >> @intCast(@as(Uint32, 24));
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = (((sa_74 << @intCast(@as(c_uint, 24))) | (sr_71 << @intCast(@as(c_uint, 16)))) | (sg_72 << @intCast(@as(c_uint, 8)))) | sb_73;
                {
                    sdl_pc = 189;
                    continue;
                }
            },
            189 => {
                if (false) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 190;
                    continue;
                }
            },
            190 => {
                pixels_61 += 1;
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                _ = &sa_78;
                sr_75 = (pixels_61.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_76 = (pixels_61.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_77 = pixels_61.* & @as(Uint32, 255);
                sa_78 = pixels_61.* >> @intCast(@as(Uint32, 24));
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = (((sa_78 << @intCast(@as(c_uint, 24))) | (sr_75 << @intCast(@as(c_uint, 16)))) | (sg_76 << @intCast(@as(c_uint, 8)))) | sb_77;
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                if (false) {
                    sdl_pc = 192;
                    continue;
                } else {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                pixels_61 += 1;
                {
                    sdl_pc = 178;
                    continue;
                }
            },
            195 => {
                {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            197 => {
                if (false) {
                    sdl_pc = 196;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            199 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            200 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 203;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 219;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 232;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 245;
                        continue;
                    },
                    else => {
                        sdl_pc = 202;
                        continue;
                    },
                }
            },
            201 => {
                {
                    sdl_pc = 197;
                    continue;
                }
            },
            202 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 199;
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
                    sdl_pc = 207;
                    continue;
                }
            },
            205 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 204;
                    continue;
                } else {
                    sdl_pc = 206;
                    continue;
                }
            },
            206 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            207 => {
                _ = &sa_88;
                sr_85 = (pixels_83.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_86 = (pixels_83.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_87 = pixels_83.* & @as(Uint32, 255);
                sa_88 = pixels_83.* >> @intCast(@as(Uint32, 24));
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 210;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            208 => {
                if (false) {
                    sdl_pc = 207;
                    continue;
                } else {
                    sdl_pc = 209;
                    continue;
                }
            },
            209 => {
                pixels_83 += 1;
                {
                    sdl_pc = 219;
                    continue;
                }
            },
            210 => {
                sr_85 = 255;
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            211 => {
                {
                    sdl_pc = 212;
                    continue;
                }
            },
            212 => {
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 213;
                    continue;
                } else {
                    sdl_pc = 214;
                    continue;
                }
            },
            213 => {
                sg_86 = 255;
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            214 => {
                {
                    sdl_pc = 215;
                    continue;
                }
            },
            215 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 216;
                    continue;
                } else {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                sb_87 = 255;
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            217 => {
                {
                    sdl_pc = 218;
                    continue;
                }
            },
            218 => {
                pixels_83.* = (((sa_88 << @intCast(@as(c_uint, 24))) | (sr_85 << @intCast(@as(c_uint, 16)))) | (sg_86 << @intCast(@as(c_uint, 8)))) | sb_87;
                {
                    sdl_pc = 208;
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
                _ = &sa_92;
                sr_89 = (pixels_83.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_90 = (pixels_83.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_91 = pixels_83.* & @as(Uint32, 255);
                sa_92 = pixels_83.* >> @intCast(@as(Uint32, 24));
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 223;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            221 => {
                if (false) {
                    sdl_pc = 220;
                    continue;
                } else {
                    sdl_pc = 222;
                    continue;
                }
            },
            222 => {
                pixels_83 += 1;
                {
                    sdl_pc = 232;
                    continue;
                }
            },
            223 => {
                sr_89 = 255;
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            224 => {
                {
                    sdl_pc = 225;
                    continue;
                }
            },
            225 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 226;
                    continue;
                } else {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                sg_90 = 255;
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            227 => {
                {
                    sdl_pc = 228;
                    continue;
                }
            },
            228 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 229;
                    continue;
                } else {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                sb_91 = 255;
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
                pixels_83.* = (((sa_92 << @intCast(@as(c_uint, 24))) | (sr_89 << @intCast(@as(c_uint, 16)))) | (sg_90 << @intCast(@as(c_uint, 8)))) | sb_91;
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                _ = &sa_96;
                sr_93 = (pixels_83.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_94 = (pixels_83.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_95 = pixels_83.* & @as(Uint32, 255);
                sa_96 = pixels_83.* >> @intCast(@as(Uint32, 24));
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 236;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            234 => {
                if (false) {
                    sdl_pc = 233;
                    continue;
                } else {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                pixels_83 += 1;
                {
                    sdl_pc = 245;
                    continue;
                }
            },
            236 => {
                sr_93 = 255;
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            237 => {
                {
                    sdl_pc = 238;
                    continue;
                }
            },
            238 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 239;
                    continue;
                } else {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                sg_94 = 255;
                {
                    sdl_pc = 241;
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
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 242;
                    continue;
                } else {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                sb_95 = 255;
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            243 => {
                {
                    sdl_pc = 244;
                    continue;
                }
            },
            244 => {
                pixels_83.* = (((sa_96 << @intCast(@as(c_uint, 24))) | (sr_93 << @intCast(@as(c_uint, 16)))) | (sg_94 << @intCast(@as(c_uint, 8)))) | sb_95;
                {
                    sdl_pc = 234;
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
                _ = &sa_100;
                sr_97 = (pixels_83.* >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                sg_98 = (pixels_83.* >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                sb_99 = pixels_83.* & @as(Uint32, 255);
                sa_100 = pixels_83.* >> @intCast(@as(Uint32, 24));
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 249;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            247 => {
                if (false) {
                    sdl_pc = 246;
                    continue;
                } else {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                pixels_83 += 1;
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            249 => {
                sr_97 = 255;
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            250 => {
                {
                    sdl_pc = 251;
                    continue;
                }
            },
            251 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 252;
                    continue;
                } else {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                sg_98 = 255;
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            253 => {
                {
                    sdl_pc = 254;
                    continue;
                }
            },
            254 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 255;
                    continue;
                } else {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                sb_99 = 255;
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            256 => {
                {
                    sdl_pc = 257;
                    continue;
                }
            },
            257 => {
                pixels_83.* = (((sa_100 << @intCast(@as(c_uint, 24))) | (sr_97 << @intCast(@as(c_uint, 16)))) | (sg_98 << @intCast(@as(c_uint, 8)))) | sb_99;
                {
                    sdl_pc = 247;
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
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 262;
                    continue;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            262 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 263;
                    continue;
                } else {
                    sdl_pc = 264;
                    continue;
                }
            },
            263 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 266;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 273;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 277;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 281;
                        continue;
                    },
                    else => {
                        sdl_pc = 265;
                        continue;
                    },
                }
            },
            264 => {
                {
                    sdl_pc = 260;
                    continue;
                }
            },
            265 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            266 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            267 => {
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            268 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 267;
                    continue;
                } else {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 265;
                    continue;
                }
            },
            270 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = (((sa_110 << @intCast(@as(c_uint, 24))) | (sr_107 << @intCast(@as(c_uint, 16)))) | (sg_108 << @intCast(@as(c_uint, 8)))) | sb_109;
                {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                if (false) {
                    sdl_pc = 270;
                    continue;
                } else {
                    sdl_pc = 272;
                    continue;
                }
            },
            272 => {
                pixels_105 += 1;
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = (((sa_114 << @intCast(@as(c_uint, 24))) | (sr_111 << @intCast(@as(c_uint, 16)))) | (sg_112 << @intCast(@as(c_uint, 8)))) | sb_113;
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                if (false) {
                    sdl_pc = 274;
                    continue;
                } else {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                pixels_105 += 1;
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = (((sa_118 << @intCast(@as(c_uint, 24))) | (sr_115 << @intCast(@as(c_uint, 16)))) | (sg_116 << @intCast(@as(c_uint, 8)))) | sb_117;
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                if (false) {
                    sdl_pc = 278;
                    continue;
                } else {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                pixels_105 += 1;
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = (((sa_122 << @intCast(@as(c_uint, 24))) | (sr_119 << @intCast(@as(c_uint, 16)))) | (sg_120 << @intCast(@as(c_uint, 8)))) | sb_121;
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                if (false) {
                    sdl_pc = 282;
                    continue;
                } else {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                pixels_105 += 1;
                {
                    sdl_pc = 268;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendFillRect_RGB(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint16 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint16 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint16 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint16 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint16 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint16 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
    var width_123: c_int = undefined;
    _ = &width_123;
    var height_124: c_int = undefined;
    _ = &height_124;
    var pitch_125: c_int = undefined;
    _ = &pitch_125;
    var skip_126: c_int = undefined;
    _ = &skip_126;
    var pixels_127: [*c]Uint32 = undefined;
    _ = &pixels_127;
    var n_128: c_int = undefined;
    _ = &n_128;
    var sr_129: c_uint = undefined;
    _ = &sr_129;
    var sg_130: c_uint = undefined;
    _ = &sg_130;
    var sb_131: c_uint = undefined;
    _ = &sb_131;
    var sa_132: c_uint = undefined;
    _ = &sa_132;
    var sr_133: c_uint = undefined;
    _ = &sr_133;
    var sg_134: c_uint = undefined;
    _ = &sg_134;
    var sb_135: c_uint = undefined;
    _ = &sb_135;
    var sa_136: c_uint = undefined;
    _ = &sa_136;
    var sr_137: c_uint = undefined;
    _ = &sr_137;
    var sg_138: c_uint = undefined;
    _ = &sg_138;
    var sb_139: c_uint = undefined;
    _ = &sb_139;
    var sa_140: c_uint = undefined;
    _ = &sa_140;
    var sr_141: c_uint = undefined;
    _ = &sr_141;
    var sg_142: c_uint = undefined;
    _ = &sg_142;
    var sb_143: c_uint = undefined;
    _ = &sb_143;
    var sa_144: c_uint = undefined;
    _ = &sa_144;
    var width_145: c_int = undefined;
    _ = &width_145;
    var height_146: c_int = undefined;
    _ = &height_146;
    var pitch_147: c_int = undefined;
    _ = &pitch_147;
    var skip_148: c_int = undefined;
    _ = &skip_148;
    var pixels_149: [*c]Uint32 = undefined;
    _ = &pixels_149;
    var n_150: c_int = undefined;
    _ = &n_150;
    var sr_151: c_uint = undefined;
    _ = &sr_151;
    var sg_152: c_uint = undefined;
    _ = &sg_152;
    var sb_153: c_uint = undefined;
    _ = &sb_153;
    var sa_154: c_uint = undefined;
    _ = &sa_154;
    var sr_155: c_uint = undefined;
    _ = &sr_155;
    var sg_156: c_uint = undefined;
    _ = &sg_156;
    var sb_157: c_uint = undefined;
    _ = &sb_157;
    var sa_158: c_uint = undefined;
    _ = &sa_158;
    var sr_159: c_uint = undefined;
    _ = &sr_159;
    var sg_160: c_uint = undefined;
    _ = &sg_160;
    var sb_161: c_uint = undefined;
    _ = &sb_161;
    var sa_162: c_uint = undefined;
    _ = &sa_162;
    var sr_163: c_uint = undefined;
    _ = &sr_163;
    var sg_164: c_uint = undefined;
    _ = &sg_164;
    var sb_165: c_uint = undefined;
    _ = &sb_165;
    var sa_166: c_uint = undefined;
    _ = &sa_166;
    var width_167: c_int = undefined;
    _ = &width_167;
    var height_168: c_int = undefined;
    _ = &height_168;
    var pitch_169: c_int = undefined;
    _ = &pitch_169;
    var skip_170: c_int = undefined;
    _ = &skip_170;
    var pixels_171: [*c]Uint32 = undefined;
    _ = &pixels_171;
    var n_172: c_int = undefined;
    _ = &n_172;
    var sr_173: c_uint = undefined;
    _ = &sr_173;
    var sg_174: c_uint = undefined;
    _ = &sg_174;
    var sb_175: c_uint = undefined;
    _ = &sb_175;
    var sa_176: c_uint = undefined;
    _ = &sa_176;
    var sr_177: c_uint = undefined;
    _ = &sr_177;
    var sg_178: c_uint = undefined;
    _ = &sg_178;
    var sb_179: c_uint = undefined;
    _ = &sb_179;
    var sa_180: c_uint = undefined;
    _ = &sa_180;
    var sr_181: c_uint = undefined;
    _ = &sr_181;
    var sg_182: c_uint = undefined;
    _ = &sg_182;
    var sb_183: c_uint = undefined;
    _ = &sb_183;
    var sa_184: c_uint = undefined;
    _ = &sa_184;
    var sr_185: c_uint = undefined;
    _ = &sr_185;
    var sg_186: c_uint = undefined;
    _ = &sg_186;
    var sb_187: c_uint = undefined;
    _ = &sb_187;
    var sa_188: c_uint = undefined;
    _ = &sa_188;
    var width_189: c_int = undefined;
    _ = &width_189;
    var height_190: c_int = undefined;
    _ = &height_190;
    var pitch_191: c_int = undefined;
    _ = &pitch_191;
    var skip_192: c_int = undefined;
    _ = &skip_192;
    var pixels_193: [*c]Uint32 = undefined;
    _ = &pixels_193;
    var n_194: c_int = undefined;
    _ = &n_194;
    var sr_195: c_uint = undefined;
    _ = &sr_195;
    var sg_196: c_uint = undefined;
    _ = &sg_196;
    var sb_197: c_uint = undefined;
    _ = &sb_197;
    var sa_198: c_uint = undefined;
    _ = &sa_198;
    var sr_199: c_uint = undefined;
    _ = &sr_199;
    var sg_200: c_uint = undefined;
    _ = &sg_200;
    var sb_201: c_uint = undefined;
    _ = &sb_201;
    var sa_202: c_uint = undefined;
    _ = &sa_202;
    var sr_203: c_uint = undefined;
    _ = &sr_203;
    var sg_204: c_uint = undefined;
    _ = &sg_204;
    var sb_205: c_uint = undefined;
    _ = &sb_205;
    var sa_206: c_uint = undefined;
    _ = &sa_206;
    var sr_207: c_uint = undefined;
    _ = &sr_207;
    var sg_208: c_uint = undefined;
    _ = &sg_208;
    var sb_209: c_uint = undefined;
    _ = &sb_209;
    var sa_210: c_uint = undefined;
    _ = &sa_210;
    var width_211: c_int = undefined;
    _ = &width_211;
    var height_212: c_int = undefined;
    _ = &height_212;
    var pitch_213: c_int = undefined;
    _ = &pitch_213;
    var skip_214: c_int = undefined;
    _ = &skip_214;
    var pixels_215: [*c]Uint32 = undefined;
    _ = &pixels_215;
    var n_216: c_int = undefined;
    _ = &n_216;
    var sr_217: c_uint = undefined;
    _ = &sr_217;
    var sg_218: c_uint = undefined;
    _ = &sg_218;
    var sb_219: c_uint = undefined;
    _ = &sb_219;
    var sa_220: c_uint = undefined;
    _ = &sa_220;
    var sr_221: c_uint = undefined;
    _ = &sr_221;
    var sg_222: c_uint = undefined;
    _ = &sg_222;
    var sb_223: c_uint = undefined;
    _ = &sb_223;
    var sa_224: c_uint = undefined;
    _ = &sa_224;
    var sr_225: c_uint = undefined;
    _ = &sr_225;
    var sg_226: c_uint = undefined;
    _ = &sg_226;
    var sb_227: c_uint = undefined;
    _ = &sb_227;
    var sa_228: c_uint = undefined;
    _ = &sa_228;
    var sr_229: c_uint = undefined;
    _ = &sr_229;
    var sg_230: c_uint = undefined;
    _ = &sg_230;
    var sb_231: c_uint = undefined;
    _ = &sb_231;
    var sa_232: c_uint = undefined;
    _ = &sa_232;
    var width_233: c_int = undefined;
    _ = &width_233;
    var height_234: c_int = undefined;
    _ = &height_234;
    var pitch_235: c_int = undefined;
    _ = &pitch_235;
    var skip_236: c_int = undefined;
    _ = &skip_236;
    var pixels_237: [*c]Uint32 = undefined;
    _ = &pixels_237;
    var n_238: c_int = undefined;
    _ = &n_238;
    var sr_239: c_uint = undefined;
    _ = &sr_239;
    var sg_240: c_uint = undefined;
    _ = &sg_240;
    var sb_241: c_uint = undefined;
    _ = &sb_241;
    var sa_242: c_uint = undefined;
    _ = &sa_242;
    var sr_243: c_uint = undefined;
    _ = &sr_243;
    var sg_244: c_uint = undefined;
    _ = &sg_244;
    var sb_245: c_uint = undefined;
    _ = &sb_245;
    var sa_246: c_uint = undefined;
    _ = &sa_246;
    var sr_247: c_uint = undefined;
    _ = &sr_247;
    var sg_248: c_uint = undefined;
    _ = &sg_248;
    var sb_249: c_uint = undefined;
    _ = &sb_249;
    var sa_250: c_uint = undefined;
    _ = &sa_250;
    var sr_251: c_uint = undefined;
    _ = &sr_251;
    var sg_252: c_uint = undefined;
    _ = &sg_252;
    var sb_253: c_uint = undefined;
    _ = &sb_253;
    var sa_254: c_uint = undefined;
    _ = &sa_254;
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
                        sdl_pc = 287;
                        continue;
                    },
                    else => {
                        sdl_pc = 572;
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
                        sdl_pc = 31;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 106;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 107;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 170;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 197;
                        continue;
                    },
                    else => {
                        sdl_pc = 260;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
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
                pixels += 1;
                {
                    sdl_pc = 19;
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
                sa_4 = 255;
                sr_1 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_2 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_3 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate(((((sr_1 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_2 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_3 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
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
                pixels += 1;
                {
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
                sa_8 = 255;
                sr_5 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_6 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_7 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate(((((sr_5 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_6 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_7 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
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
                pixels += 1;
                {
                    sdl_pc = 27;
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
                sa_12 = 255;
                sr_9 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_10 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_11 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = @truncate(((((sr_9 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_10 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_11 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (false) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels += 1;
                {
                    sdl_pc = 14;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 90;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 35;
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
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            43 => {
                sa_22 = 255;
                sr_19 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_20 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_21 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                pixels_17 += 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            46 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                sb_21 = 255;
                {
                    sdl_pc = 54;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                sa_22 = 255;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                pixels_17.* = @truncate(((((sr_19 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_20 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_21 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 44;
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
                sa_26 = 255;
                sr_23 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_24 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_25 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
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
                pixels_17 += 1;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            62 => {
                sr_23 = 255;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sg_24 = 255;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                sb_25 = 255;
                {
                    sdl_pc = 70;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                sa_26 = 255;
                {
                    sdl_pc = 73;
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
                pixels_17.* = @truncate(((((sr_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 60;
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
                sa_30 = 255;
                sr_27 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_28 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_29 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
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
                pixels_17 += 1;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            78 => {
                sr_27 = 255;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                sb_29 = 255;
                {
                    sdl_pc = 86;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                sa_30 = 255;
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                pixels_17.* = @truncate(((((sr_27 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_28 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_29 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                sa_34 = 255;
                sr_31 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_32 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_33 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_17.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            92 => {
                if (false) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                pixels_17 += 1;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            94 => {
                sr_31 = 255;
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
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                sb_33 = 255;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                sa_34 = 255;
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
                pixels_17.* = @truncate(((((sr_31 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_33 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 92;
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
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            111 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 157;
                        continue;
                    },
                    else => {
                        sdl_pc = 114;
                        continue;
                    },
                }
            },
            113 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            114 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 111;
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
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            117 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            119 => {
                _ = &sa_44;
                sr_41 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_42 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_43 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            120 => {
                if (false) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                pixels_39 += 1;
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            122 => {
                sr_41 = 255;
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
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            125 => {
                sg_42 = 255;
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            128 => {
                sb_43 = 255;
                {
                    sdl_pc = 130;
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
                pixels_39.* = @truncate(((((sr_41 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_42 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_43 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 120;
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
                _ = &sa_48;
                sr_45 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_46 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_47 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            133 => {
                if (false) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                pixels_39 += 1;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            135 => {
                sr_45 = 255;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                sb_47 = 255;
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
                pixels_39.* = @truncate(((((sr_45 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_46 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_47 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 133;
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
                _ = &sa_52;
                sr_49 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_50 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_51 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            146 => {
                if (false) {
                    sdl_pc = 145;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                pixels_39 += 1;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            148 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                sg_50 = 255;
                {
                    sdl_pc = 153;
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
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 154;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                sb_51 = 255;
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
                pixels_39.* = @truncate(((((sr_49 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_50 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_51 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 146;
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
                _ = &sa_56;
                sr_53 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_54 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_55 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_39.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 161;
                    continue;
                } else {
                    sdl_pc = 162;
                    continue;
                }
            },
            159 => {
                if (false) {
                    sdl_pc = 158;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                pixels_39 += 1;
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            161 => {
                sr_53 = 255;
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 164;
                    continue;
                } else {
                    sdl_pc = 165;
                    continue;
                }
            },
            164 => {
                sg_54 = 255;
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            166 => {
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 167;
                    continue;
                } else {
                    sdl_pc = 168;
                    continue;
                }
            },
            167 => {
                sb_55 = 255;
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                pixels_39.* = @truncate(((((sr_53 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_54 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_55 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 159;
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
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            172 => {
                if (false) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            174 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 175;
                    continue;
                } else {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 178;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 185;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 189;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 193;
                        continue;
                    },
                    else => {
                        sdl_pc = 177;
                        continue;
                    },
                }
            },
            176 => {
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            177 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            180 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 179;
                    continue;
                } else {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            182 => {
                _ = &sa_66;
                sr_63 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_64 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_65 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate(((((sr_63 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_64 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_65 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                if (false) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 184;
                    continue;
                }
            },
            184 => {
                pixels_61 += 1;
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                _ = &sa_70;
                sr_67 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_68 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_69 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate(((((sr_67 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_68 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_69 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 187;
                    continue;
                }
            },
            187 => {
                if (false) {
                    sdl_pc = 186;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            188 => {
                pixels_61 += 1;
                {
                    sdl_pc = 189;
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
                _ = &sa_74;
                sr_71 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_72 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_73 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate(((((sr_71 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_72 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_73 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                if (false) {
                    sdl_pc = 190;
                    continue;
                } else {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                pixels_61 += 1;
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                _ = &sa_78;
                sr_75 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_76 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_77 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_61.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = @truncate(((((sr_75 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_76 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_77 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 195;
                    continue;
                }
            },
            195 => {
                if (false) {
                    sdl_pc = 194;
                    continue;
                } else {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                pixels_61 += 1;
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            197 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            199 => {
                if (false) {
                    sdl_pc = 198;
                    continue;
                } else {
                    sdl_pc = 200;
                    continue;
                }
            },
            200 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            201 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 202;
                    continue;
                } else {
                    sdl_pc = 203;
                    continue;
                }
            },
            202 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 205;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 221;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 234;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 247;
                        continue;
                    },
                    else => {
                        sdl_pc = 204;
                        continue;
                    },
                }
            },
            203 => {
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            204 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 201;
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
                {
                    sdl_pc = 209;
                    continue;
                }
            },
            207 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 206;
                    continue;
                } else {
                    sdl_pc = 208;
                    continue;
                }
            },
            208 => {
                {
                    sdl_pc = 204;
                    continue;
                }
            },
            209 => {
                _ = &sa_88;
                sr_85 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_86 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_87 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 212;
                    continue;
                } else {
                    sdl_pc = 213;
                    continue;
                }
            },
            210 => {
                if (false) {
                    sdl_pc = 209;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            211 => {
                pixels_83 += 1;
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            212 => {
                sr_85 = 255;
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
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 215;
                    continue;
                } else {
                    sdl_pc = 216;
                    continue;
                }
            },
            215 => {
                sg_86 = 255;
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            217 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 218;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            218 => {
                sb_87 = 255;
                {
                    sdl_pc = 220;
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
                pixels_83.* = @truncate(((((sr_85 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_86 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_87 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 210;
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
                _ = &sa_92;
                sr_89 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_90 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_91 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 225;
                    continue;
                } else {
                    sdl_pc = 226;
                    continue;
                }
            },
            223 => {
                if (false) {
                    sdl_pc = 222;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            224 => {
                pixels_83 += 1;
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            225 => {
                sr_89 = 255;
                {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                {
                    sdl_pc = 227;
                    continue;
                }
            },
            227 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 228;
                    continue;
                } else {
                    sdl_pc = 229;
                    continue;
                }
            },
            228 => {
                sg_90 = 255;
                {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                {
                    sdl_pc = 230;
                    continue;
                }
            },
            230 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 231;
                    continue;
                } else {
                    sdl_pc = 232;
                    continue;
                }
            },
            231 => {
                sb_91 = 255;
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                pixels_83.* = @truncate(((((sr_89 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_90 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_91 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            234 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                _ = &sa_96;
                sr_93 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_94 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_95 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 238;
                    continue;
                } else {
                    sdl_pc = 239;
                    continue;
                }
            },
            236 => {
                if (false) {
                    sdl_pc = 235;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            237 => {
                pixels_83 += 1;
                {
                    sdl_pc = 247;
                    continue;
                }
            },
            238 => {
                sr_93 = 255;
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            240 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 241;
                    continue;
                } else {
                    sdl_pc = 242;
                    continue;
                }
            },
            241 => {
                sg_94 = 255;
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            243 => {
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 244;
                    continue;
                } else {
                    sdl_pc = 245;
                    continue;
                }
            },
            244 => {
                sb_95 = 255;
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
                pixels_83.* = @truncate(((((sr_93 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_94 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_95 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 236;
                    continue;
                }
            },
            247 => {
                {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                _ = &sa_100;
                sr_97 = SDL_expand_byte[fmt.*.Rbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_98 = SDL_expand_byte[fmt.*.Gbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_99 = SDL_expand_byte[fmt.*.Bbits][(@as(Uint32, @bitCast(@as(c_int, @as(c_int, pixels_83.*)))) & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 251;
                    continue;
                } else {
                    sdl_pc = 252;
                    continue;
                }
            },
            249 => {
                if (false) {
                    sdl_pc = 248;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            250 => {
                pixels_83 += 1;
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            251 => {
                sr_97 = 255;
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            253 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 254;
                    continue;
                } else {
                    sdl_pc = 255;
                    continue;
                }
            },
            254 => {
                sg_98 = 255;
                {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                {
                    sdl_pc = 256;
                    continue;
                }
            },
            256 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 257;
                    continue;
                } else {
                    sdl_pc = 258;
                    continue;
                }
            },
            257 => {
                sb_99 = 255;
                {
                    sdl_pc = 259;
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
                pixels_83.* = @truncate(((((sr_97 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_98 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_99 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 249;
                    continue;
                }
            },
            260 => {
                {
                    sdl_pc = 261;
                    continue;
                }
            },
            261 => {
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            262 => {
                if (false) {
                    sdl_pc = 261;
                    continue;
                } else {
                    sdl_pc = 263;
                    continue;
                }
            },
            263 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            264 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 265;
                    continue;
                } else {
                    sdl_pc = 266;
                    continue;
                }
            },
            265 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 268;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 275;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 279;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 283;
                        continue;
                    },
                    else => {
                        sdl_pc = 267;
                        continue;
                    },
                }
            },
            266 => {
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            267 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            268 => {
                {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 272;
                    continue;
                }
            },
            270 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 269;
                    continue;
                } else {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            272 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = @truncate(((((sr_107 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_108 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_109 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                if (false) {
                    sdl_pc = 272;
                    continue;
                } else {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                pixels_105 += 1;
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = @truncate(((((sr_111 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_112 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_113 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                if (false) {
                    sdl_pc = 276;
                    continue;
                } else {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                pixels_105 += 1;
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = @truncate(((((sr_115 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_116 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_117 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                if (false) {
                    sdl_pc = 280;
                    continue;
                } else {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                pixels_105 += 1;
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = @truncate(((((sr_119 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_120 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_121 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                {
                    sdl_pc = 285;
                    continue;
                }
            },
            285 => {
                if (false) {
                    sdl_pc = 284;
                    continue;
                } else {
                    sdl_pc = 286;
                    continue;
                }
            },
            286 => {
                pixels_105 += 1;
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            287 => {
                switch (blendMode) {
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 289;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 316;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 391;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 392;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 455;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 482;
                        continue;
                    },
                    else => {
                        sdl_pc = 545;
                        continue;
                    },
                }
            },
            288 => {
                return @"true" != 0;
            },
            289 => {
                {
                    sdl_pc = 290;
                    continue;
                }
            },
            290 => {
                width_123 = rect.*.w;
                height_124 = rect.*.h;
                pitch_125 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_126 = pitch_125 - width_123;
                pixels_127 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_125))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            291 => {
                if (false) {
                    sdl_pc = 290;
                    continue;
                } else {
                    sdl_pc = 292;
                    continue;
                }
            },
            292 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            293 => {
                if ((blk: {
                    const ref = &height_124;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 294;
                    continue;
                } else {
                    sdl_pc = 295;
                    continue;
                }
            },
            294 => {
                n_128 = @divTrunc(width_123 + @as(c_int, 3), @as(c_int, 4));
                switch (width_123 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 297;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 304;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 308;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 312;
                        continue;
                    },
                    else => {
                        sdl_pc = 296;
                        continue;
                    },
                }
            },
            295 => {
                {
                    sdl_pc = 291;
                    continue;
                }
            },
            296 => {
                pixels_127 += @as(usize, @bitCast(@as(isize, @intCast(skip_126))));
                {
                    sdl_pc = 293;
                    continue;
                }
            },
            297 => {
                {
                    sdl_pc = 298;
                    continue;
                }
            },
            298 => {
                {
                    sdl_pc = 301;
                    continue;
                }
            },
            299 => {
                if ((blk: {
                    const ref = &n_128;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 298;
                    continue;
                } else {
                    sdl_pc = 300;
                    continue;
                }
            },
            300 => {
                {
                    sdl_pc = 296;
                    continue;
                }
            },
            301 => {
                sa_132 = 255;
                sr_129 = SDL_expand_byte[fmt.*.Rbits][(pixels_127.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_130 = SDL_expand_byte[fmt.*.Gbits][(pixels_127.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_131 = SDL_expand_byte[fmt.*.Bbits][(pixels_127.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_129 = ((inva *% sr_129) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_130 = ((inva *% sg_130) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_131 = ((inva *% sb_131) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_132 = ((inva *% sa_132) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels_127.* = ((((sr_129 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_130 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_131 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 302;
                    continue;
                }
            },
            302 => {
                if (false) {
                    sdl_pc = 301;
                    continue;
                } else {
                    sdl_pc = 303;
                    continue;
                }
            },
            303 => {
                pixels_127 += 1;
                {
                    sdl_pc = 304;
                    continue;
                }
            },
            304 => {
                {
                    sdl_pc = 305;
                    continue;
                }
            },
            305 => {
                sa_136 = 255;
                sr_133 = SDL_expand_byte[fmt.*.Rbits][(pixels_127.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_134 = SDL_expand_byte[fmt.*.Gbits][(pixels_127.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_135 = SDL_expand_byte[fmt.*.Bbits][(pixels_127.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_133 = ((inva *% sr_133) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_134 = ((inva *% sg_134) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_135 = ((inva *% sb_135) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_136 = ((inva *% sa_136) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels_127.* = ((((sr_133 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_134 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_135 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 306;
                    continue;
                }
            },
            306 => {
                if (false) {
                    sdl_pc = 305;
                    continue;
                } else {
                    sdl_pc = 307;
                    continue;
                }
            },
            307 => {
                pixels_127 += 1;
                {
                    sdl_pc = 308;
                    continue;
                }
            },
            308 => {
                {
                    sdl_pc = 309;
                    continue;
                }
            },
            309 => {
                sa_140 = 255;
                sr_137 = SDL_expand_byte[fmt.*.Rbits][(pixels_127.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_138 = SDL_expand_byte[fmt.*.Gbits][(pixels_127.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_139 = SDL_expand_byte[fmt.*.Bbits][(pixels_127.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_137 = ((inva *% sr_137) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_138 = ((inva *% sg_138) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_139 = ((inva *% sb_139) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_140 = ((inva *% sa_140) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels_127.* = ((((sr_137 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_138 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_139 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 310;
                    continue;
                }
            },
            310 => {
                if (false) {
                    sdl_pc = 309;
                    continue;
                } else {
                    sdl_pc = 311;
                    continue;
                }
            },
            311 => {
                pixels_127 += 1;
                {
                    sdl_pc = 312;
                    continue;
                }
            },
            312 => {
                {
                    sdl_pc = 313;
                    continue;
                }
            },
            313 => {
                sa_144 = 255;
                sr_141 = SDL_expand_byte[fmt.*.Rbits][(pixels_127.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_142 = SDL_expand_byte[fmt.*.Gbits][(pixels_127.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_143 = SDL_expand_byte[fmt.*.Bbits][(pixels_127.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_141 = ((inva *% sr_141) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_142 = ((inva *% sg_142) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_143 = ((inva *% sb_143) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_144 = ((inva *% sa_144) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels_127.* = ((((sr_141 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_142 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_143 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 314;
                    continue;
                }
            },
            314 => {
                if (false) {
                    sdl_pc = 313;
                    continue;
                } else {
                    sdl_pc = 315;
                    continue;
                }
            },
            315 => {
                pixels_127 += 1;
                {
                    sdl_pc = 299;
                    continue;
                }
            },
            316 => {
                {
                    sdl_pc = 317;
                    continue;
                }
            },
            317 => {
                width_145 = rect.*.w;
                height_146 = rect.*.h;
                pitch_147 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_148 = pitch_147 - width_145;
                pixels_149 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_147))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            318 => {
                if (false) {
                    sdl_pc = 317;
                    continue;
                } else {
                    sdl_pc = 319;
                    continue;
                }
            },
            319 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            320 => {
                if ((blk: {
                    const ref = &height_146;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 321;
                    continue;
                } else {
                    sdl_pc = 322;
                    continue;
                }
            },
            321 => {
                n_150 = @divTrunc(width_145 + @as(c_int, 3), @as(c_int, 4));
                switch (width_145 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 324;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 343;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 359;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 375;
                        continue;
                    },
                    else => {
                        sdl_pc = 323;
                        continue;
                    },
                }
            },
            322 => {
                {
                    sdl_pc = 318;
                    continue;
                }
            },
            323 => {
                pixels_149 += @as(usize, @bitCast(@as(isize, @intCast(skip_148))));
                {
                    sdl_pc = 320;
                    continue;
                }
            },
            324 => {
                {
                    sdl_pc = 325;
                    continue;
                }
            },
            325 => {
                {
                    sdl_pc = 328;
                    continue;
                }
            },
            326 => {
                if ((blk: {
                    const ref = &n_150;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 325;
                    continue;
                } else {
                    sdl_pc = 327;
                    continue;
                }
            },
            327 => {
                {
                    sdl_pc = 323;
                    continue;
                }
            },
            328 => {
                sa_154 = 255;
                sr_151 = SDL_expand_byte[fmt.*.Rbits][(pixels_149.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_152 = SDL_expand_byte[fmt.*.Gbits][(pixels_149.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_153 = SDL_expand_byte[fmt.*.Bbits][(pixels_149.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_151 = ((inva *% sr_151) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_151 > @as(c_uint, 255)) {
                    sdl_pc = 331;
                    continue;
                } else {
                    sdl_pc = 332;
                    continue;
                }
            },
            329 => {
                if (false) {
                    sdl_pc = 328;
                    continue;
                } else {
                    sdl_pc = 330;
                    continue;
                }
            },
            330 => {
                pixels_149 += 1;
                {
                    sdl_pc = 343;
                    continue;
                }
            },
            331 => {
                sr_151 = 255;
                {
                    sdl_pc = 333;
                    continue;
                }
            },
            332 => {
                {
                    sdl_pc = 333;
                    continue;
                }
            },
            333 => {
                sg_152 = ((inva *% sg_152) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_152 > @as(c_uint, 255)) {
                    sdl_pc = 334;
                    continue;
                } else {
                    sdl_pc = 335;
                    continue;
                }
            },
            334 => {
                sg_152 = 255;
                {
                    sdl_pc = 336;
                    continue;
                }
            },
            335 => {
                {
                    sdl_pc = 336;
                    continue;
                }
            },
            336 => {
                sb_153 = ((inva *% sb_153) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_153 > @as(c_uint, 255)) {
                    sdl_pc = 337;
                    continue;
                } else {
                    sdl_pc = 338;
                    continue;
                }
            },
            337 => {
                sb_153 = 255;
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            338 => {
                {
                    sdl_pc = 339;
                    continue;
                }
            },
            339 => {
                sa_154 = ((inva *% sa_154) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_154 > @as(c_uint, 255)) {
                    sdl_pc = 340;
                    continue;
                } else {
                    sdl_pc = 341;
                    continue;
                }
            },
            340 => {
                sa_154 = 255;
                {
                    sdl_pc = 342;
                    continue;
                }
            },
            341 => {
                {
                    sdl_pc = 342;
                    continue;
                }
            },
            342 => {
                pixels_149.* = ((((sr_151 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_152 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_153 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 329;
                    continue;
                }
            },
            343 => {
                {
                    sdl_pc = 344;
                    continue;
                }
            },
            344 => {
                sa_158 = 255;
                sr_155 = SDL_expand_byte[fmt.*.Rbits][(pixels_149.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_156 = SDL_expand_byte[fmt.*.Gbits][(pixels_149.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_157 = SDL_expand_byte[fmt.*.Bbits][(pixels_149.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_155 = ((inva *% sr_155) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_155 > @as(c_uint, 255)) {
                    sdl_pc = 347;
                    continue;
                } else {
                    sdl_pc = 348;
                    continue;
                }
            },
            345 => {
                if (false) {
                    sdl_pc = 344;
                    continue;
                } else {
                    sdl_pc = 346;
                    continue;
                }
            },
            346 => {
                pixels_149 += 1;
                {
                    sdl_pc = 359;
                    continue;
                }
            },
            347 => {
                sr_155 = 255;
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            348 => {
                {
                    sdl_pc = 349;
                    continue;
                }
            },
            349 => {
                sg_156 = ((inva *% sg_156) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_156 > @as(c_uint, 255)) {
                    sdl_pc = 350;
                    continue;
                } else {
                    sdl_pc = 351;
                    continue;
                }
            },
            350 => {
                sg_156 = 255;
                {
                    sdl_pc = 352;
                    continue;
                }
            },
            351 => {
                {
                    sdl_pc = 352;
                    continue;
                }
            },
            352 => {
                sb_157 = ((inva *% sb_157) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_157 > @as(c_uint, 255)) {
                    sdl_pc = 353;
                    continue;
                } else {
                    sdl_pc = 354;
                    continue;
                }
            },
            353 => {
                sb_157 = 255;
                {
                    sdl_pc = 355;
                    continue;
                }
            },
            354 => {
                {
                    sdl_pc = 355;
                    continue;
                }
            },
            355 => {
                sa_158 = ((inva *% sa_158) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_158 > @as(c_uint, 255)) {
                    sdl_pc = 356;
                    continue;
                } else {
                    sdl_pc = 357;
                    continue;
                }
            },
            356 => {
                sa_158 = 255;
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            357 => {
                {
                    sdl_pc = 358;
                    continue;
                }
            },
            358 => {
                pixels_149.* = ((((sr_155 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_156 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_157 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 345;
                    continue;
                }
            },
            359 => {
                {
                    sdl_pc = 360;
                    continue;
                }
            },
            360 => {
                sa_162 = 255;
                sr_159 = SDL_expand_byte[fmt.*.Rbits][(pixels_149.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_160 = SDL_expand_byte[fmt.*.Gbits][(pixels_149.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_161 = SDL_expand_byte[fmt.*.Bbits][(pixels_149.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_159 = ((inva *% sr_159) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_159 > @as(c_uint, 255)) {
                    sdl_pc = 363;
                    continue;
                } else {
                    sdl_pc = 364;
                    continue;
                }
            },
            361 => {
                if (false) {
                    sdl_pc = 360;
                    continue;
                } else {
                    sdl_pc = 362;
                    continue;
                }
            },
            362 => {
                pixels_149 += 1;
                {
                    sdl_pc = 375;
                    continue;
                }
            },
            363 => {
                sr_159 = 255;
                {
                    sdl_pc = 365;
                    continue;
                }
            },
            364 => {
                {
                    sdl_pc = 365;
                    continue;
                }
            },
            365 => {
                sg_160 = ((inva *% sg_160) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_160 > @as(c_uint, 255)) {
                    sdl_pc = 366;
                    continue;
                } else {
                    sdl_pc = 367;
                    continue;
                }
            },
            366 => {
                sg_160 = 255;
                {
                    sdl_pc = 368;
                    continue;
                }
            },
            367 => {
                {
                    sdl_pc = 368;
                    continue;
                }
            },
            368 => {
                sb_161 = ((inva *% sb_161) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_161 > @as(c_uint, 255)) {
                    sdl_pc = 369;
                    continue;
                } else {
                    sdl_pc = 370;
                    continue;
                }
            },
            369 => {
                sb_161 = 255;
                {
                    sdl_pc = 371;
                    continue;
                }
            },
            370 => {
                {
                    sdl_pc = 371;
                    continue;
                }
            },
            371 => {
                sa_162 = ((inva *% sa_162) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_162 > @as(c_uint, 255)) {
                    sdl_pc = 372;
                    continue;
                } else {
                    sdl_pc = 373;
                    continue;
                }
            },
            372 => {
                sa_162 = 255;
                {
                    sdl_pc = 374;
                    continue;
                }
            },
            373 => {
                {
                    sdl_pc = 374;
                    continue;
                }
            },
            374 => {
                pixels_149.* = ((((sr_159 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_160 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_161 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 361;
                    continue;
                }
            },
            375 => {
                {
                    sdl_pc = 376;
                    continue;
                }
            },
            376 => {
                sa_166 = 255;
                sr_163 = SDL_expand_byte[fmt.*.Rbits][(pixels_149.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_164 = SDL_expand_byte[fmt.*.Gbits][(pixels_149.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_165 = SDL_expand_byte[fmt.*.Bbits][(pixels_149.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_163 = ((inva *% sr_163) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_163 > @as(c_uint, 255)) {
                    sdl_pc = 379;
                    continue;
                } else {
                    sdl_pc = 380;
                    continue;
                }
            },
            377 => {
                if (false) {
                    sdl_pc = 376;
                    continue;
                } else {
                    sdl_pc = 378;
                    continue;
                }
            },
            378 => {
                pixels_149 += 1;
                {
                    sdl_pc = 326;
                    continue;
                }
            },
            379 => {
                sr_163 = 255;
                {
                    sdl_pc = 381;
                    continue;
                }
            },
            380 => {
                {
                    sdl_pc = 381;
                    continue;
                }
            },
            381 => {
                sg_164 = ((inva *% sg_164) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_164 > @as(c_uint, 255)) {
                    sdl_pc = 382;
                    continue;
                } else {
                    sdl_pc = 383;
                    continue;
                }
            },
            382 => {
                sg_164 = 255;
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            383 => {
                {
                    sdl_pc = 384;
                    continue;
                }
            },
            384 => {
                sb_165 = ((inva *% sb_165) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_165 > @as(c_uint, 255)) {
                    sdl_pc = 385;
                    continue;
                } else {
                    sdl_pc = 386;
                    continue;
                }
            },
            385 => {
                sb_165 = 255;
                {
                    sdl_pc = 387;
                    continue;
                }
            },
            386 => {
                {
                    sdl_pc = 387;
                    continue;
                }
            },
            387 => {
                sa_166 = ((inva *% sa_166) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_166 > @as(c_uint, 255)) {
                    sdl_pc = 388;
                    continue;
                } else {
                    sdl_pc = 389;
                    continue;
                }
            },
            388 => {
                sa_166 = 255;
                {
                    sdl_pc = 390;
                    continue;
                }
            },
            389 => {
                {
                    sdl_pc = 390;
                    continue;
                }
            },
            390 => {
                pixels_149.* = ((((sr_163 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_164 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_165 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 377;
                    continue;
                }
            },
            391 => {
                {
                    sdl_pc = 392;
                    continue;
                }
            },
            392 => {
                {
                    sdl_pc = 393;
                    continue;
                }
            },
            393 => {
                width_167 = rect.*.w;
                height_168 = rect.*.h;
                pitch_169 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_170 = pitch_169 - width_167;
                pixels_171 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_169))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 396;
                    continue;
                }
            },
            394 => {
                if (false) {
                    sdl_pc = 393;
                    continue;
                } else {
                    sdl_pc = 395;
                    continue;
                }
            },
            395 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            396 => {
                if ((blk: {
                    const ref = &height_168;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 397;
                    continue;
                } else {
                    sdl_pc = 398;
                    continue;
                }
            },
            397 => {
                n_172 = @divTrunc(width_167 + @as(c_int, 3), @as(c_int, 4));
                switch (width_167 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 400;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 416;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 429;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 442;
                        continue;
                    },
                    else => {
                        sdl_pc = 399;
                        continue;
                    },
                }
            },
            398 => {
                {
                    sdl_pc = 394;
                    continue;
                }
            },
            399 => {
                pixels_171 += @as(usize, @bitCast(@as(isize, @intCast(skip_170))));
                {
                    sdl_pc = 396;
                    continue;
                }
            },
            400 => {
                {
                    sdl_pc = 401;
                    continue;
                }
            },
            401 => {
                {
                    sdl_pc = 404;
                    continue;
                }
            },
            402 => {
                if ((blk: {
                    const ref = &n_172;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 401;
                    continue;
                } else {
                    sdl_pc = 403;
                    continue;
                }
            },
            403 => {
                {
                    sdl_pc = 399;
                    continue;
                }
            },
            404 => {
                _ = &sa_176;
                sr_173 = SDL_expand_byte[fmt.*.Rbits][(pixels_171.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_174 = SDL_expand_byte[fmt.*.Gbits][(pixels_171.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_175 = SDL_expand_byte[fmt.*.Bbits][(pixels_171.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_173 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_173 > @as(c_uint, 255)) {
                    sdl_pc = 407;
                    continue;
                } else {
                    sdl_pc = 408;
                    continue;
                }
            },
            405 => {
                if (false) {
                    sdl_pc = 404;
                    continue;
                } else {
                    sdl_pc = 406;
                    continue;
                }
            },
            406 => {
                pixels_171 += 1;
                {
                    sdl_pc = 416;
                    continue;
                }
            },
            407 => {
                sr_173 = 255;
                {
                    sdl_pc = 409;
                    continue;
                }
            },
            408 => {
                {
                    sdl_pc = 409;
                    continue;
                }
            },
            409 => {
                sg_174 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_174 > @as(c_uint, 255)) {
                    sdl_pc = 410;
                    continue;
                } else {
                    sdl_pc = 411;
                    continue;
                }
            },
            410 => {
                sg_174 = 255;
                {
                    sdl_pc = 412;
                    continue;
                }
            },
            411 => {
                {
                    sdl_pc = 412;
                    continue;
                }
            },
            412 => {
                sb_175 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_175 > @as(c_uint, 255)) {
                    sdl_pc = 413;
                    continue;
                } else {
                    sdl_pc = 414;
                    continue;
                }
            },
            413 => {
                sb_175 = 255;
                {
                    sdl_pc = 415;
                    continue;
                }
            },
            414 => {
                {
                    sdl_pc = 415;
                    continue;
                }
            },
            415 => {
                pixels_171.* = ((((sr_173 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_174 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_175 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 405;
                    continue;
                }
            },
            416 => {
                {
                    sdl_pc = 417;
                    continue;
                }
            },
            417 => {
                _ = &sa_180;
                sr_177 = SDL_expand_byte[fmt.*.Rbits][(pixels_171.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_178 = SDL_expand_byte[fmt.*.Gbits][(pixels_171.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_179 = SDL_expand_byte[fmt.*.Bbits][(pixels_171.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_177 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_177 > @as(c_uint, 255)) {
                    sdl_pc = 420;
                    continue;
                } else {
                    sdl_pc = 421;
                    continue;
                }
            },
            418 => {
                if (false) {
                    sdl_pc = 417;
                    continue;
                } else {
                    sdl_pc = 419;
                    continue;
                }
            },
            419 => {
                pixels_171 += 1;
                {
                    sdl_pc = 429;
                    continue;
                }
            },
            420 => {
                sr_177 = 255;
                {
                    sdl_pc = 422;
                    continue;
                }
            },
            421 => {
                {
                    sdl_pc = 422;
                    continue;
                }
            },
            422 => {
                sg_178 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_178 > @as(c_uint, 255)) {
                    sdl_pc = 423;
                    continue;
                } else {
                    sdl_pc = 424;
                    continue;
                }
            },
            423 => {
                sg_178 = 255;
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            424 => {
                {
                    sdl_pc = 425;
                    continue;
                }
            },
            425 => {
                sb_179 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_179 > @as(c_uint, 255)) {
                    sdl_pc = 426;
                    continue;
                } else {
                    sdl_pc = 427;
                    continue;
                }
            },
            426 => {
                sb_179 = 255;
                {
                    sdl_pc = 428;
                    continue;
                }
            },
            427 => {
                {
                    sdl_pc = 428;
                    continue;
                }
            },
            428 => {
                pixels_171.* = ((((sr_177 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_178 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_179 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 418;
                    continue;
                }
            },
            429 => {
                {
                    sdl_pc = 430;
                    continue;
                }
            },
            430 => {
                _ = &sa_184;
                sr_181 = SDL_expand_byte[fmt.*.Rbits][(pixels_171.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_182 = SDL_expand_byte[fmt.*.Gbits][(pixels_171.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_183 = SDL_expand_byte[fmt.*.Bbits][(pixels_171.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_181 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_181 > @as(c_uint, 255)) {
                    sdl_pc = 433;
                    continue;
                } else {
                    sdl_pc = 434;
                    continue;
                }
            },
            431 => {
                if (false) {
                    sdl_pc = 430;
                    continue;
                } else {
                    sdl_pc = 432;
                    continue;
                }
            },
            432 => {
                pixels_171 += 1;
                {
                    sdl_pc = 442;
                    continue;
                }
            },
            433 => {
                sr_181 = 255;
                {
                    sdl_pc = 435;
                    continue;
                }
            },
            434 => {
                {
                    sdl_pc = 435;
                    continue;
                }
            },
            435 => {
                sg_182 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_182 > @as(c_uint, 255)) {
                    sdl_pc = 436;
                    continue;
                } else {
                    sdl_pc = 437;
                    continue;
                }
            },
            436 => {
                sg_182 = 255;
                {
                    sdl_pc = 438;
                    continue;
                }
            },
            437 => {
                {
                    sdl_pc = 438;
                    continue;
                }
            },
            438 => {
                sb_183 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_183 > @as(c_uint, 255)) {
                    sdl_pc = 439;
                    continue;
                } else {
                    sdl_pc = 440;
                    continue;
                }
            },
            439 => {
                sb_183 = 255;
                {
                    sdl_pc = 441;
                    continue;
                }
            },
            440 => {
                {
                    sdl_pc = 441;
                    continue;
                }
            },
            441 => {
                pixels_171.* = ((((sr_181 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_182 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_183 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 431;
                    continue;
                }
            },
            442 => {
                {
                    sdl_pc = 443;
                    continue;
                }
            },
            443 => {
                _ = &sa_188;
                sr_185 = SDL_expand_byte[fmt.*.Rbits][(pixels_171.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_186 = SDL_expand_byte[fmt.*.Gbits][(pixels_171.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_187 = SDL_expand_byte[fmt.*.Bbits][(pixels_171.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_185 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_185 > @as(c_uint, 255)) {
                    sdl_pc = 446;
                    continue;
                } else {
                    sdl_pc = 447;
                    continue;
                }
            },
            444 => {
                if (false) {
                    sdl_pc = 443;
                    continue;
                } else {
                    sdl_pc = 445;
                    continue;
                }
            },
            445 => {
                pixels_171 += 1;
                {
                    sdl_pc = 402;
                    continue;
                }
            },
            446 => {
                sr_185 = 255;
                {
                    sdl_pc = 448;
                    continue;
                }
            },
            447 => {
                {
                    sdl_pc = 448;
                    continue;
                }
            },
            448 => {
                sg_186 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_186 > @as(c_uint, 255)) {
                    sdl_pc = 449;
                    continue;
                } else {
                    sdl_pc = 450;
                    continue;
                }
            },
            449 => {
                sg_186 = 255;
                {
                    sdl_pc = 451;
                    continue;
                }
            },
            450 => {
                {
                    sdl_pc = 451;
                    continue;
                }
            },
            451 => {
                sb_187 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_187 > @as(c_uint, 255)) {
                    sdl_pc = 452;
                    continue;
                } else {
                    sdl_pc = 453;
                    continue;
                }
            },
            452 => {
                sb_187 = 255;
                {
                    sdl_pc = 454;
                    continue;
                }
            },
            453 => {
                {
                    sdl_pc = 454;
                    continue;
                }
            },
            454 => {
                pixels_171.* = ((((sr_185 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_186 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_187 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 444;
                    continue;
                }
            },
            455 => {
                {
                    sdl_pc = 456;
                    continue;
                }
            },
            456 => {
                width_189 = rect.*.w;
                height_190 = rect.*.h;
                pitch_191 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_192 = pitch_191 - width_189;
                pixels_193 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_191))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 459;
                    continue;
                }
            },
            457 => {
                if (false) {
                    sdl_pc = 456;
                    continue;
                } else {
                    sdl_pc = 458;
                    continue;
                }
            },
            458 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            459 => {
                if ((blk: {
                    const ref = &height_190;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 460;
                    continue;
                } else {
                    sdl_pc = 461;
                    continue;
                }
            },
            460 => {
                n_194 = @divTrunc(width_189 + @as(c_int, 3), @as(c_int, 4));
                switch (width_189 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 463;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 470;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 474;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 478;
                        continue;
                    },
                    else => {
                        sdl_pc = 462;
                        continue;
                    },
                }
            },
            461 => {
                {
                    sdl_pc = 457;
                    continue;
                }
            },
            462 => {
                pixels_193 += @as(usize, @bitCast(@as(isize, @intCast(skip_192))));
                {
                    sdl_pc = 459;
                    continue;
                }
            },
            463 => {
                {
                    sdl_pc = 464;
                    continue;
                }
            },
            464 => {
                {
                    sdl_pc = 467;
                    continue;
                }
            },
            465 => {
                if ((blk: {
                    const ref = &n_194;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 464;
                    continue;
                } else {
                    sdl_pc = 466;
                    continue;
                }
            },
            466 => {
                {
                    sdl_pc = 462;
                    continue;
                }
            },
            467 => {
                _ = &sa_198;
                sr_195 = SDL_expand_byte[fmt.*.Rbits][(pixels_193.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_196 = SDL_expand_byte[fmt.*.Gbits][(pixels_193.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_197 = SDL_expand_byte[fmt.*.Bbits][(pixels_193.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_195 = (sr_195 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_196 = (sg_196 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_197 = (sb_197 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_193.* = ((((sr_195 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_196 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_197 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 468;
                    continue;
                }
            },
            468 => {
                if (false) {
                    sdl_pc = 467;
                    continue;
                } else {
                    sdl_pc = 469;
                    continue;
                }
            },
            469 => {
                pixels_193 += 1;
                {
                    sdl_pc = 470;
                    continue;
                }
            },
            470 => {
                {
                    sdl_pc = 471;
                    continue;
                }
            },
            471 => {
                _ = &sa_202;
                sr_199 = SDL_expand_byte[fmt.*.Rbits][(pixels_193.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_200 = SDL_expand_byte[fmt.*.Gbits][(pixels_193.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_201 = SDL_expand_byte[fmt.*.Bbits][(pixels_193.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_199 = (sr_199 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_200 = (sg_200 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_201 = (sb_201 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_193.* = ((((sr_199 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_200 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_201 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 472;
                    continue;
                }
            },
            472 => {
                if (false) {
                    sdl_pc = 471;
                    continue;
                } else {
                    sdl_pc = 473;
                    continue;
                }
            },
            473 => {
                pixels_193 += 1;
                {
                    sdl_pc = 474;
                    continue;
                }
            },
            474 => {
                {
                    sdl_pc = 475;
                    continue;
                }
            },
            475 => {
                _ = &sa_206;
                sr_203 = SDL_expand_byte[fmt.*.Rbits][(pixels_193.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_204 = SDL_expand_byte[fmt.*.Gbits][(pixels_193.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_205 = SDL_expand_byte[fmt.*.Bbits][(pixels_193.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_203 = (sr_203 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_204 = (sg_204 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_205 = (sb_205 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_193.* = ((((sr_203 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_204 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_205 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 476;
                    continue;
                }
            },
            476 => {
                if (false) {
                    sdl_pc = 475;
                    continue;
                } else {
                    sdl_pc = 477;
                    continue;
                }
            },
            477 => {
                pixels_193 += 1;
                {
                    sdl_pc = 478;
                    continue;
                }
            },
            478 => {
                {
                    sdl_pc = 479;
                    continue;
                }
            },
            479 => {
                _ = &sa_210;
                sr_207 = SDL_expand_byte[fmt.*.Rbits][(pixels_193.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_208 = SDL_expand_byte[fmt.*.Gbits][(pixels_193.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_209 = SDL_expand_byte[fmt.*.Bbits][(pixels_193.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_207 = (sr_207 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_208 = (sg_208 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_209 = (sb_209 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_193.* = ((((sr_207 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_208 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_209 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 480;
                    continue;
                }
            },
            480 => {
                if (false) {
                    sdl_pc = 479;
                    continue;
                } else {
                    sdl_pc = 481;
                    continue;
                }
            },
            481 => {
                pixels_193 += 1;
                {
                    sdl_pc = 465;
                    continue;
                }
            },
            482 => {
                {
                    sdl_pc = 483;
                    continue;
                }
            },
            483 => {
                width_211 = rect.*.w;
                height_212 = rect.*.h;
                pitch_213 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_214 = pitch_213 - width_211;
                pixels_215 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_213))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 486;
                    continue;
                }
            },
            484 => {
                if (false) {
                    sdl_pc = 483;
                    continue;
                } else {
                    sdl_pc = 485;
                    continue;
                }
            },
            485 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            486 => {
                if ((blk: {
                    const ref = &height_212;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 487;
                    continue;
                } else {
                    sdl_pc = 488;
                    continue;
                }
            },
            487 => {
                n_216 = @divTrunc(width_211 + @as(c_int, 3), @as(c_int, 4));
                switch (width_211 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 490;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 506;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 519;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 532;
                        continue;
                    },
                    else => {
                        sdl_pc = 489;
                        continue;
                    },
                }
            },
            488 => {
                {
                    sdl_pc = 484;
                    continue;
                }
            },
            489 => {
                pixels_215 += @as(usize, @bitCast(@as(isize, @intCast(skip_214))));
                {
                    sdl_pc = 486;
                    continue;
                }
            },
            490 => {
                {
                    sdl_pc = 491;
                    continue;
                }
            },
            491 => {
                {
                    sdl_pc = 494;
                    continue;
                }
            },
            492 => {
                if ((blk: {
                    const ref = &n_216;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 491;
                    continue;
                } else {
                    sdl_pc = 493;
                    continue;
                }
            },
            493 => {
                {
                    sdl_pc = 489;
                    continue;
                }
            },
            494 => {
                _ = &sa_220;
                sr_217 = SDL_expand_byte[fmt.*.Rbits][(pixels_215.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_218 = SDL_expand_byte[fmt.*.Gbits][(pixels_215.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_219 = SDL_expand_byte[fmt.*.Bbits][(pixels_215.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_217 = ((sr_217 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_217) / @as(c_uint, 255));
                if (sr_217 > @as(c_uint, 255)) {
                    sdl_pc = 497;
                    continue;
                } else {
                    sdl_pc = 498;
                    continue;
                }
            },
            495 => {
                if (false) {
                    sdl_pc = 494;
                    continue;
                } else {
                    sdl_pc = 496;
                    continue;
                }
            },
            496 => {
                pixels_215 += 1;
                {
                    sdl_pc = 506;
                    continue;
                }
            },
            497 => {
                sr_217 = 255;
                {
                    sdl_pc = 499;
                    continue;
                }
            },
            498 => {
                {
                    sdl_pc = 499;
                    continue;
                }
            },
            499 => {
                sg_218 = ((sg_218 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_218) / @as(c_uint, 255));
                if (sg_218 > @as(c_uint, 255)) {
                    sdl_pc = 500;
                    continue;
                } else {
                    sdl_pc = 501;
                    continue;
                }
            },
            500 => {
                sg_218 = 255;
                {
                    sdl_pc = 502;
                    continue;
                }
            },
            501 => {
                {
                    sdl_pc = 502;
                    continue;
                }
            },
            502 => {
                sb_219 = ((sb_219 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_219) / @as(c_uint, 255));
                if (sb_219 > @as(c_uint, 255)) {
                    sdl_pc = 503;
                    continue;
                } else {
                    sdl_pc = 504;
                    continue;
                }
            },
            503 => {
                sb_219 = 255;
                {
                    sdl_pc = 505;
                    continue;
                }
            },
            504 => {
                {
                    sdl_pc = 505;
                    continue;
                }
            },
            505 => {
                pixels_215.* = ((((sr_217 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_218 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_219 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 495;
                    continue;
                }
            },
            506 => {
                {
                    sdl_pc = 507;
                    continue;
                }
            },
            507 => {
                _ = &sa_224;
                sr_221 = SDL_expand_byte[fmt.*.Rbits][(pixels_215.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_222 = SDL_expand_byte[fmt.*.Gbits][(pixels_215.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_223 = SDL_expand_byte[fmt.*.Bbits][(pixels_215.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_221 = ((sr_221 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_221) / @as(c_uint, 255));
                if (sr_221 > @as(c_uint, 255)) {
                    sdl_pc = 510;
                    continue;
                } else {
                    sdl_pc = 511;
                    continue;
                }
            },
            508 => {
                if (false) {
                    sdl_pc = 507;
                    continue;
                } else {
                    sdl_pc = 509;
                    continue;
                }
            },
            509 => {
                pixels_215 += 1;
                {
                    sdl_pc = 519;
                    continue;
                }
            },
            510 => {
                sr_221 = 255;
                {
                    sdl_pc = 512;
                    continue;
                }
            },
            511 => {
                {
                    sdl_pc = 512;
                    continue;
                }
            },
            512 => {
                sg_222 = ((sg_222 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_222) / @as(c_uint, 255));
                if (sg_222 > @as(c_uint, 255)) {
                    sdl_pc = 513;
                    continue;
                } else {
                    sdl_pc = 514;
                    continue;
                }
            },
            513 => {
                sg_222 = 255;
                {
                    sdl_pc = 515;
                    continue;
                }
            },
            514 => {
                {
                    sdl_pc = 515;
                    continue;
                }
            },
            515 => {
                sb_223 = ((sb_223 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_223) / @as(c_uint, 255));
                if (sb_223 > @as(c_uint, 255)) {
                    sdl_pc = 516;
                    continue;
                } else {
                    sdl_pc = 517;
                    continue;
                }
            },
            516 => {
                sb_223 = 255;
                {
                    sdl_pc = 518;
                    continue;
                }
            },
            517 => {
                {
                    sdl_pc = 518;
                    continue;
                }
            },
            518 => {
                pixels_215.* = ((((sr_221 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_222 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_223 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 508;
                    continue;
                }
            },
            519 => {
                {
                    sdl_pc = 520;
                    continue;
                }
            },
            520 => {
                _ = &sa_228;
                sr_225 = SDL_expand_byte[fmt.*.Rbits][(pixels_215.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_226 = SDL_expand_byte[fmt.*.Gbits][(pixels_215.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_227 = SDL_expand_byte[fmt.*.Bbits][(pixels_215.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_225 = ((sr_225 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_225) / @as(c_uint, 255));
                if (sr_225 > @as(c_uint, 255)) {
                    sdl_pc = 523;
                    continue;
                } else {
                    sdl_pc = 524;
                    continue;
                }
            },
            521 => {
                if (false) {
                    sdl_pc = 520;
                    continue;
                } else {
                    sdl_pc = 522;
                    continue;
                }
            },
            522 => {
                pixels_215 += 1;
                {
                    sdl_pc = 532;
                    continue;
                }
            },
            523 => {
                sr_225 = 255;
                {
                    sdl_pc = 525;
                    continue;
                }
            },
            524 => {
                {
                    sdl_pc = 525;
                    continue;
                }
            },
            525 => {
                sg_226 = ((sg_226 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_226) / @as(c_uint, 255));
                if (sg_226 > @as(c_uint, 255)) {
                    sdl_pc = 526;
                    continue;
                } else {
                    sdl_pc = 527;
                    continue;
                }
            },
            526 => {
                sg_226 = 255;
                {
                    sdl_pc = 528;
                    continue;
                }
            },
            527 => {
                {
                    sdl_pc = 528;
                    continue;
                }
            },
            528 => {
                sb_227 = ((sb_227 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_227) / @as(c_uint, 255));
                if (sb_227 > @as(c_uint, 255)) {
                    sdl_pc = 529;
                    continue;
                } else {
                    sdl_pc = 530;
                    continue;
                }
            },
            529 => {
                sb_227 = 255;
                {
                    sdl_pc = 531;
                    continue;
                }
            },
            530 => {
                {
                    sdl_pc = 531;
                    continue;
                }
            },
            531 => {
                pixels_215.* = ((((sr_225 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_226 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_227 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 521;
                    continue;
                }
            },
            532 => {
                {
                    sdl_pc = 533;
                    continue;
                }
            },
            533 => {
                _ = &sa_232;
                sr_229 = SDL_expand_byte[fmt.*.Rbits][(pixels_215.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_230 = SDL_expand_byte[fmt.*.Gbits][(pixels_215.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_231 = SDL_expand_byte[fmt.*.Bbits][(pixels_215.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sr_229 = ((sr_229 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_229) / @as(c_uint, 255));
                if (sr_229 > @as(c_uint, 255)) {
                    sdl_pc = 536;
                    continue;
                } else {
                    sdl_pc = 537;
                    continue;
                }
            },
            534 => {
                if (false) {
                    sdl_pc = 533;
                    continue;
                } else {
                    sdl_pc = 535;
                    continue;
                }
            },
            535 => {
                pixels_215 += 1;
                {
                    sdl_pc = 492;
                    continue;
                }
            },
            536 => {
                sr_229 = 255;
                {
                    sdl_pc = 538;
                    continue;
                }
            },
            537 => {
                {
                    sdl_pc = 538;
                    continue;
                }
            },
            538 => {
                sg_230 = ((sg_230 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_230) / @as(c_uint, 255));
                if (sg_230 > @as(c_uint, 255)) {
                    sdl_pc = 539;
                    continue;
                } else {
                    sdl_pc = 540;
                    continue;
                }
            },
            539 => {
                sg_230 = 255;
                {
                    sdl_pc = 541;
                    continue;
                }
            },
            540 => {
                {
                    sdl_pc = 541;
                    continue;
                }
            },
            541 => {
                sb_231 = ((sb_231 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_231) / @as(c_uint, 255));
                if (sb_231 > @as(c_uint, 255)) {
                    sdl_pc = 542;
                    continue;
                } else {
                    sdl_pc = 543;
                    continue;
                }
            },
            542 => {
                sb_231 = 255;
                {
                    sdl_pc = 544;
                    continue;
                }
            },
            543 => {
                {
                    sdl_pc = 544;
                    continue;
                }
            },
            544 => {
                pixels_215.* = ((((sr_229 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_230 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_231 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 534;
                    continue;
                }
            },
            545 => {
                {
                    sdl_pc = 546;
                    continue;
                }
            },
            546 => {
                width_233 = rect.*.w;
                height_234 = rect.*.h;
                pitch_235 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_236 = pitch_235 - width_233;
                pixels_237 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_235))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 549;
                    continue;
                }
            },
            547 => {
                if (false) {
                    sdl_pc = 546;
                    continue;
                } else {
                    sdl_pc = 548;
                    continue;
                }
            },
            548 => {
                {
                    sdl_pc = 288;
                    continue;
                }
            },
            549 => {
                if ((blk: {
                    const ref = &height_234;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 550;
                    continue;
                } else {
                    sdl_pc = 551;
                    continue;
                }
            },
            550 => {
                n_238 = @divTrunc(width_233 + @as(c_int, 3), @as(c_int, 4));
                switch (width_233 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 553;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 560;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 564;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 568;
                        continue;
                    },
                    else => {
                        sdl_pc = 552;
                        continue;
                    },
                }
            },
            551 => {
                {
                    sdl_pc = 547;
                    continue;
                }
            },
            552 => {
                pixels_237 += @as(usize, @bitCast(@as(isize, @intCast(skip_236))));
                {
                    sdl_pc = 549;
                    continue;
                }
            },
            553 => {
                {
                    sdl_pc = 554;
                    continue;
                }
            },
            554 => {
                {
                    sdl_pc = 557;
                    continue;
                }
            },
            555 => {
                if ((blk: {
                    const ref = &n_238;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 554;
                    continue;
                } else {
                    sdl_pc = 556;
                    continue;
                }
            },
            556 => {
                {
                    sdl_pc = 552;
                    continue;
                }
            },
            557 => {
                sr_239 = r;
                sg_240 = g;
                sb_241 = b;
                sa_242 = a;
                _ = &sa_242;
                pixels_237.* = ((((sr_239 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_240 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_241 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 558;
                    continue;
                }
            },
            558 => {
                if (false) {
                    sdl_pc = 557;
                    continue;
                } else {
                    sdl_pc = 559;
                    continue;
                }
            },
            559 => {
                pixels_237 += 1;
                {
                    sdl_pc = 560;
                    continue;
                }
            },
            560 => {
                {
                    sdl_pc = 561;
                    continue;
                }
            },
            561 => {
                sr_243 = r;
                sg_244 = g;
                sb_245 = b;
                sa_246 = a;
                _ = &sa_246;
                pixels_237.* = ((((sr_243 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_244 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_245 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 562;
                    continue;
                }
            },
            562 => {
                if (false) {
                    sdl_pc = 561;
                    continue;
                } else {
                    sdl_pc = 563;
                    continue;
                }
            },
            563 => {
                pixels_237 += 1;
                {
                    sdl_pc = 564;
                    continue;
                }
            },
            564 => {
                {
                    sdl_pc = 565;
                    continue;
                }
            },
            565 => {
                sr_247 = r;
                sg_248 = g;
                sb_249 = b;
                sa_250 = a;
                _ = &sa_250;
                pixels_237.* = ((((sr_247 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_248 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_249 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 566;
                    continue;
                }
            },
            566 => {
                if (false) {
                    sdl_pc = 565;
                    continue;
                } else {
                    sdl_pc = 567;
                    continue;
                }
            },
            567 => {
                pixels_237 += 1;
                {
                    sdl_pc = 568;
                    continue;
                }
            },
            568 => {
                {
                    sdl_pc = 569;
                    continue;
                }
            },
            569 => {
                sr_251 = r;
                sg_252 = g;
                sb_253 = b;
                sa_254 = a;
                _ = &sa_254;
                pixels_237.* = ((((sr_251 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_252 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_253 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                {
                    sdl_pc = 570;
                    continue;
                }
            },
            570 => {
                if (false) {
                    sdl_pc = 569;
                    continue;
                } else {
                    sdl_pc = 571;
                    continue;
                }
            },
            571 => {
                pixels_237 += 1;
                {
                    sdl_pc = 555;
                    continue;
                }
            },
            572 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub fn SDL_BlendFillRect_RGBA(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, blendMode: SDL_BlendMode, r: Uint8, g: Uint8, b: Uint8, a: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &fmt;
    var inva: c_uint = undefined;
    _ = &inva;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var pitch: c_int = undefined;
    _ = &pitch;
    var skip: c_int = undefined;
    _ = &skip;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var n: c_int = undefined;
    _ = &n;
    var sr: c_uint = undefined;
    _ = &sr;
    var sg: c_uint = undefined;
    _ = &sg;
    var sb: c_uint = undefined;
    _ = &sb;
    var sa: c_uint = undefined;
    _ = &sa;
    var sr_1: c_uint = undefined;
    _ = &sr_1;
    var sg_2: c_uint = undefined;
    _ = &sg_2;
    var sb_3: c_uint = undefined;
    _ = &sb_3;
    var sa_4: c_uint = undefined;
    _ = &sa_4;
    var sr_5: c_uint = undefined;
    _ = &sr_5;
    var sg_6: c_uint = undefined;
    _ = &sg_6;
    var sb_7: c_uint = undefined;
    _ = &sb_7;
    var sa_8: c_uint = undefined;
    _ = &sa_8;
    var sr_9: c_uint = undefined;
    _ = &sr_9;
    var sg_10: c_uint = undefined;
    _ = &sg_10;
    var sb_11: c_uint = undefined;
    _ = &sb_11;
    var sa_12: c_uint = undefined;
    _ = &sa_12;
    var width_13: c_int = undefined;
    _ = &width_13;
    var height_14: c_int = undefined;
    _ = &height_14;
    var pitch_15: c_int = undefined;
    _ = &pitch_15;
    var skip_16: c_int = undefined;
    _ = &skip_16;
    var pixels_17: [*c]Uint32 = undefined;
    _ = &pixels_17;
    var n_18: c_int = undefined;
    _ = &n_18;
    var sr_19: c_uint = undefined;
    _ = &sr_19;
    var sg_20: c_uint = undefined;
    _ = &sg_20;
    var sb_21: c_uint = undefined;
    _ = &sb_21;
    var sa_22: c_uint = undefined;
    _ = &sa_22;
    var sr_23: c_uint = undefined;
    _ = &sr_23;
    var sg_24: c_uint = undefined;
    _ = &sg_24;
    var sb_25: c_uint = undefined;
    _ = &sb_25;
    var sa_26: c_uint = undefined;
    _ = &sa_26;
    var sr_27: c_uint = undefined;
    _ = &sr_27;
    var sg_28: c_uint = undefined;
    _ = &sg_28;
    var sb_29: c_uint = undefined;
    _ = &sb_29;
    var sa_30: c_uint = undefined;
    _ = &sa_30;
    var sr_31: c_uint = undefined;
    _ = &sr_31;
    var sg_32: c_uint = undefined;
    _ = &sg_32;
    var sb_33: c_uint = undefined;
    _ = &sb_33;
    var sa_34: c_uint = undefined;
    _ = &sa_34;
    var width_35: c_int = undefined;
    _ = &width_35;
    var height_36: c_int = undefined;
    _ = &height_36;
    var pitch_37: c_int = undefined;
    _ = &pitch_37;
    var skip_38: c_int = undefined;
    _ = &skip_38;
    var pixels_39: [*c]Uint32 = undefined;
    _ = &pixels_39;
    var n_40: c_int = undefined;
    _ = &n_40;
    var sr_41: c_uint = undefined;
    _ = &sr_41;
    var sg_42: c_uint = undefined;
    _ = &sg_42;
    var sb_43: c_uint = undefined;
    _ = &sb_43;
    var sa_44: c_uint = undefined;
    _ = &sa_44;
    var sr_45: c_uint = undefined;
    _ = &sr_45;
    var sg_46: c_uint = undefined;
    _ = &sg_46;
    var sb_47: c_uint = undefined;
    _ = &sb_47;
    var sa_48: c_uint = undefined;
    _ = &sa_48;
    var sr_49: c_uint = undefined;
    _ = &sr_49;
    var sg_50: c_uint = undefined;
    _ = &sg_50;
    var sb_51: c_uint = undefined;
    _ = &sb_51;
    var sa_52: c_uint = undefined;
    _ = &sa_52;
    var sr_53: c_uint = undefined;
    _ = &sr_53;
    var sg_54: c_uint = undefined;
    _ = &sg_54;
    var sb_55: c_uint = undefined;
    _ = &sb_55;
    var sa_56: c_uint = undefined;
    _ = &sa_56;
    var width_57: c_int = undefined;
    _ = &width_57;
    var height_58: c_int = undefined;
    _ = &height_58;
    var pitch_59: c_int = undefined;
    _ = &pitch_59;
    var skip_60: c_int = undefined;
    _ = &skip_60;
    var pixels_61: [*c]Uint32 = undefined;
    _ = &pixels_61;
    var n_62: c_int = undefined;
    _ = &n_62;
    var sr_63: c_uint = undefined;
    _ = &sr_63;
    var sg_64: c_uint = undefined;
    _ = &sg_64;
    var sb_65: c_uint = undefined;
    _ = &sb_65;
    var sa_66: c_uint = undefined;
    _ = &sa_66;
    var sr_67: c_uint = undefined;
    _ = &sr_67;
    var sg_68: c_uint = undefined;
    _ = &sg_68;
    var sb_69: c_uint = undefined;
    _ = &sb_69;
    var sa_70: c_uint = undefined;
    _ = &sa_70;
    var sr_71: c_uint = undefined;
    _ = &sr_71;
    var sg_72: c_uint = undefined;
    _ = &sg_72;
    var sb_73: c_uint = undefined;
    _ = &sb_73;
    var sa_74: c_uint = undefined;
    _ = &sa_74;
    var sr_75: c_uint = undefined;
    _ = &sr_75;
    var sg_76: c_uint = undefined;
    _ = &sg_76;
    var sb_77: c_uint = undefined;
    _ = &sb_77;
    var sa_78: c_uint = undefined;
    _ = &sa_78;
    var width_79: c_int = undefined;
    _ = &width_79;
    var height_80: c_int = undefined;
    _ = &height_80;
    var pitch_81: c_int = undefined;
    _ = &pitch_81;
    var skip_82: c_int = undefined;
    _ = &skip_82;
    var pixels_83: [*c]Uint32 = undefined;
    _ = &pixels_83;
    var n_84: c_int = undefined;
    _ = &n_84;
    var sr_85: c_uint = undefined;
    _ = &sr_85;
    var sg_86: c_uint = undefined;
    _ = &sg_86;
    var sb_87: c_uint = undefined;
    _ = &sb_87;
    var sa_88: c_uint = undefined;
    _ = &sa_88;
    var sr_89: c_uint = undefined;
    _ = &sr_89;
    var sg_90: c_uint = undefined;
    _ = &sg_90;
    var sb_91: c_uint = undefined;
    _ = &sb_91;
    var sa_92: c_uint = undefined;
    _ = &sa_92;
    var sr_93: c_uint = undefined;
    _ = &sr_93;
    var sg_94: c_uint = undefined;
    _ = &sg_94;
    var sb_95: c_uint = undefined;
    _ = &sb_95;
    var sa_96: c_uint = undefined;
    _ = &sa_96;
    var sr_97: c_uint = undefined;
    _ = &sr_97;
    var sg_98: c_uint = undefined;
    _ = &sg_98;
    var sb_99: c_uint = undefined;
    _ = &sb_99;
    var sa_100: c_uint = undefined;
    _ = &sa_100;
    var width_101: c_int = undefined;
    _ = &width_101;
    var height_102: c_int = undefined;
    _ = &height_102;
    var pitch_103: c_int = undefined;
    _ = &pitch_103;
    var skip_104: c_int = undefined;
    _ = &skip_104;
    var pixels_105: [*c]Uint32 = undefined;
    _ = &pixels_105;
    var n_106: c_int = undefined;
    _ = &n_106;
    var sr_107: c_uint = undefined;
    _ = &sr_107;
    var sg_108: c_uint = undefined;
    _ = &sg_108;
    var sb_109: c_uint = undefined;
    _ = &sb_109;
    var sa_110: c_uint = undefined;
    _ = &sa_110;
    var sr_111: c_uint = undefined;
    _ = &sr_111;
    var sg_112: c_uint = undefined;
    _ = &sg_112;
    var sb_113: c_uint = undefined;
    _ = &sb_113;
    var sa_114: c_uint = undefined;
    _ = &sa_114;
    var sr_115: c_uint = undefined;
    _ = &sr_115;
    var sg_116: c_uint = undefined;
    _ = &sg_116;
    var sb_117: c_uint = undefined;
    _ = &sb_117;
    var sa_118: c_uint = undefined;
    _ = &sa_118;
    var sr_119: c_uint = undefined;
    _ = &sr_119;
    var sg_120: c_uint = undefined;
    _ = &sg_120;
    var sb_121: c_uint = undefined;
    _ = &sb_121;
    var sa_122: c_uint = undefined;
    _ = &sa_122;
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
                        sdl_pc = 287;
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
                        sdl_pc = 31;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 106;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 107;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 170;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 197;
                        continue;
                    },
                    else => {
                        sdl_pc = 260;
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
                width = rect.*.w;
                height = rect.*.h;
                pitch = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip = pitch - width;
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                n = @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                switch (width & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            10 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(skip))));
                {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if ((blk: {
                    const ref = &n;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
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
                pixels += 1;
                {
                    sdl_pc = 19;
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
                sa_4 = 255;
                sr_1 = SDL_expand_byte[fmt.*.Rbits][(pixels.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_2 = SDL_expand_byte[fmt.*.Gbits][(pixels.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_3 = SDL_expand_byte[fmt.*.Bbits][(pixels.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_4 = SDL_expand_byte[fmt.*.Abits][(pixels.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_1 = ((inva *% sr_1) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_2 = ((inva *% sg_2) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_3 = ((inva *% sb_3) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_4 = ((inva *% sa_4) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((((sr_1 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_2 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_3 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_4 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
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
                pixels += 1;
                {
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
                sa_8 = 255;
                sr_5 = SDL_expand_byte[fmt.*.Rbits][(pixels.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_6 = SDL_expand_byte[fmt.*.Gbits][(pixels.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_7 = SDL_expand_byte[fmt.*.Bbits][(pixels.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_8 = SDL_expand_byte[fmt.*.Abits][(pixels.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_5 = ((inva *% sr_5) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_6 = ((inva *% sg_6) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_7 = ((inva *% sb_7) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_8 = ((inva *% sa_8) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((((sr_5 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_6 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_7 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_8 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
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
                pixels += 1;
                {
                    sdl_pc = 27;
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
                sa_12 = 255;
                sr_9 = SDL_expand_byte[fmt.*.Rbits][(pixels.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_10 = SDL_expand_byte[fmt.*.Gbits][(pixels.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_11 = SDL_expand_byte[fmt.*.Bbits][(pixels.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_12 = SDL_expand_byte[fmt.*.Abits][(pixels.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_9 = ((inva *% sr_9) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                sg_10 = ((inva *% sg_10) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                sb_11 = ((inva *% sb_11) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                sa_12 = ((inva *% sa_12) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                pixels.* = ((((sr_9 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_10 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_11 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_12 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (false) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                pixels += 1;
                {
                    sdl_pc = 14;
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
                width_13 = rect.*.w;
                height_14 = rect.*.h;
                pitch_15 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_16 = pitch_15 - width_13;
                pixels_17 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_15))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                if ((blk: {
                    const ref = &height_14;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                n_18 = @divTrunc(width_13 + @as(c_int, 3), @as(c_int, 4));
                switch (width_13 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 90;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            37 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                pixels_17 += @as(usize, @bitCast(@as(isize, @intCast(skip_16))));
                {
                    sdl_pc = 35;
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
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                if ((blk: {
                    const ref = &n_18;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            43 => {
                sa_22 = 255;
                sr_19 = SDL_expand_byte[fmt.*.Rbits][(pixels_17.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_20 = SDL_expand_byte[fmt.*.Gbits][(pixels_17.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_21 = SDL_expand_byte[fmt.*.Bbits][(pixels_17.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_22 = SDL_expand_byte[fmt.*.Abits][(pixels_17.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_19 = ((inva *% sr_19) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_19 > @as(c_uint, 255)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                pixels_17 += 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            46 => {
                sr_19 = 255;
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
                sg_20 = ((inva *% sg_20) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_20 > @as(c_uint, 255)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                sg_20 = 255;
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
                sb_21 = ((inva *% sb_21) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_21 > @as(c_uint, 255)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                sb_21 = 255;
                {
                    sdl_pc = 54;
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
                sa_22 = ((inva *% sa_22) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_22 > @as(c_uint, 255)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                sa_22 = 255;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                pixels_17.* = ((((sr_19 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_20 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_21 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_22 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 44;
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
                sa_26 = 255;
                sr_23 = SDL_expand_byte[fmt.*.Rbits][(pixels_17.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_24 = SDL_expand_byte[fmt.*.Gbits][(pixels_17.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_25 = SDL_expand_byte[fmt.*.Bbits][(pixels_17.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_26 = SDL_expand_byte[fmt.*.Abits][(pixels_17.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_23 = ((inva *% sr_23) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_23 > @as(c_uint, 255)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
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
                pixels_17 += 1;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            62 => {
                sr_23 = 255;
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
                sg_24 = ((inva *% sg_24) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_24 > @as(c_uint, 255)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                sg_24 = 255;
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
                sb_25 = ((inva *% sb_25) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_25 > @as(c_uint, 255)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                sb_25 = 255;
                {
                    sdl_pc = 70;
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
                sa_26 = ((inva *% sa_26) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_26 > @as(c_uint, 255)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                sa_26 = 255;
                {
                    sdl_pc = 73;
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
                pixels_17.* = ((((sr_23 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_24 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_25 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_26 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 60;
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
                sa_30 = 255;
                sr_27 = SDL_expand_byte[fmt.*.Rbits][(pixels_17.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_28 = SDL_expand_byte[fmt.*.Gbits][(pixels_17.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_29 = SDL_expand_byte[fmt.*.Bbits][(pixels_17.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_30 = SDL_expand_byte[fmt.*.Abits][(pixels_17.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_27 = ((inva *% sr_27) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_27 > @as(c_uint, 255)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
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
                pixels_17 += 1;
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            78 => {
                sr_27 = 255;
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
                sg_28 = ((inva *% sg_28) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_28 > @as(c_uint, 255)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                sg_28 = 255;
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
                sb_29 = ((inva *% sb_29) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_29 > @as(c_uint, 255)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                sb_29 = 255;
                {
                    sdl_pc = 86;
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
                sa_30 = ((inva *% sa_30) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_30 > @as(c_uint, 255)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                sa_30 = 255;
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                pixels_17.* = ((((sr_27 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_28 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_29 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_30 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                sa_34 = 255;
                sr_31 = SDL_expand_byte[fmt.*.Rbits][(pixels_17.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_32 = SDL_expand_byte[fmt.*.Gbits][(pixels_17.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_33 = SDL_expand_byte[fmt.*.Bbits][(pixels_17.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_34 = SDL_expand_byte[fmt.*.Abits][(pixels_17.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_31 = ((inva *% sr_31) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))));
                if (sr_31 > @as(c_uint, 255)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            92 => {
                if (false) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                pixels_17 += 1;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            94 => {
                sr_31 = 255;
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
                sg_32 = ((inva *% sg_32) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))));
                if (sg_32 > @as(c_uint, 255)) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            97 => {
                sg_32 = 255;
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
                sb_33 = ((inva *% sb_33) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))));
                if (sb_33 > @as(c_uint, 255)) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            100 => {
                sb_33 = 255;
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
                sa_34 = ((inva *% sa_34) / @as(c_uint, 255)) +% @as(c_uint, @bitCast(@as(c_int, @as(c_int, a))));
                if (sa_34 > @as(c_uint, 255)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                sa_34 = 255;
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
                pixels_17.* = ((((sr_31 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_32 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_33 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_34 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 92;
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
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                width_35 = rect.*.w;
                height_36 = rect.*.h;
                pitch_37 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_38 = pitch_37 - width_35;
                pixels_39 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_37))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            111 => {
                if ((blk: {
                    const ref = &height_36;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                n_40 = @divTrunc(width_35 + @as(c_int, 3), @as(c_int, 4));
                switch (width_35 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 131;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 144;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 157;
                        continue;
                    },
                    else => {
                        sdl_pc = 114;
                        continue;
                    },
                }
            },
            113 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            114 => {
                pixels_39 += @as(usize, @bitCast(@as(isize, @intCast(skip_38))));
                {
                    sdl_pc = 111;
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
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            117 => {
                if ((blk: {
                    const ref = &n_40;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            119 => {
                _ = &sa_44;
                sr_41 = SDL_expand_byte[fmt.*.Rbits][(pixels_39.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_42 = SDL_expand_byte[fmt.*.Gbits][(pixels_39.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_43 = SDL_expand_byte[fmt.*.Bbits][(pixels_39.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_44 = SDL_expand_byte[fmt.*.Abits][(pixels_39.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_41 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_41 > @as(c_uint, 255)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            120 => {
                if (false) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                pixels_39 += 1;
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            122 => {
                sr_41 = 255;
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
                sg_42 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_42 > @as(c_uint, 255)) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            125 => {
                sg_42 = 255;
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                sb_43 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_43 > @as(c_uint, 255)) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            128 => {
                sb_43 = 255;
                {
                    sdl_pc = 130;
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
                pixels_39.* = ((((sr_41 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_42 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_43 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_44 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 120;
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
                _ = &sa_48;
                sr_45 = SDL_expand_byte[fmt.*.Rbits][(pixels_39.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_46 = SDL_expand_byte[fmt.*.Gbits][(pixels_39.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_47 = SDL_expand_byte[fmt.*.Bbits][(pixels_39.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_48 = SDL_expand_byte[fmt.*.Abits][(pixels_39.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_45 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_45 > @as(c_uint, 255)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            133 => {
                if (false) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                pixels_39 += 1;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            135 => {
                sr_45 = 255;
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
                sg_46 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_46 > @as(c_uint, 255)) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                sg_46 = 255;
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
                sb_47 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_47 > @as(c_uint, 255)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                sb_47 = 255;
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
                pixels_39.* = ((((sr_45 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_46 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_47 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_48 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 133;
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
                _ = &sa_52;
                sr_49 = SDL_expand_byte[fmt.*.Rbits][(pixels_39.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_50 = SDL_expand_byte[fmt.*.Gbits][(pixels_39.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_51 = SDL_expand_byte[fmt.*.Bbits][(pixels_39.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_52 = SDL_expand_byte[fmt.*.Abits][(pixels_39.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_49 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_49 > @as(c_uint, 255)) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            146 => {
                if (false) {
                    sdl_pc = 145;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                pixels_39 += 1;
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            148 => {
                sr_49 = 255;
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
                sg_50 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_50 > @as(c_uint, 255)) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                sg_50 = 255;
                {
                    sdl_pc = 153;
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
                sb_51 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_51 > @as(c_uint, 255)) {
                    sdl_pc = 154;
                    continue;
                } else {
                    sdl_pc = 155;
                    continue;
                }
            },
            154 => {
                sb_51 = 255;
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
                pixels_39.* = ((((sr_49 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_50 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_51 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_52 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 146;
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
                _ = &sa_56;
                sr_53 = SDL_expand_byte[fmt.*.Rbits][(pixels_39.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_54 = SDL_expand_byte[fmt.*.Gbits][(pixels_39.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_55 = SDL_expand_byte[fmt.*.Bbits][(pixels_39.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_56 = SDL_expand_byte[fmt.*.Abits][(pixels_39.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_53 +%= @bitCast(@as(c_int, @as(c_int, r)));
                if (sr_53 > @as(c_uint, 255)) {
                    sdl_pc = 161;
                    continue;
                } else {
                    sdl_pc = 162;
                    continue;
                }
            },
            159 => {
                if (false) {
                    sdl_pc = 158;
                    continue;
                } else {
                    sdl_pc = 160;
                    continue;
                }
            },
            160 => {
                pixels_39 += 1;
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            161 => {
                sr_53 = 255;
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            162 => {
                {
                    sdl_pc = 163;
                    continue;
                }
            },
            163 => {
                sg_54 +%= @bitCast(@as(c_int, @as(c_int, g)));
                if (sg_54 > @as(c_uint, 255)) {
                    sdl_pc = 164;
                    continue;
                } else {
                    sdl_pc = 165;
                    continue;
                }
            },
            164 => {
                sg_54 = 255;
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            165 => {
                {
                    sdl_pc = 166;
                    continue;
                }
            },
            166 => {
                sb_55 +%= @bitCast(@as(c_int, @as(c_int, b)));
                if (sb_55 > @as(c_uint, 255)) {
                    sdl_pc = 167;
                    continue;
                } else {
                    sdl_pc = 168;
                    continue;
                }
            },
            167 => {
                sb_55 = 255;
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 169;
                    continue;
                }
            },
            169 => {
                pixels_39.* = ((((sr_53 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_54 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_55 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_56 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 159;
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
                width_57 = rect.*.w;
                height_58 = rect.*.h;
                pitch_59 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_60 = pitch_59 - width_57;
                pixels_61 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_59))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            172 => {
                if (false) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            174 => {
                if ((blk: {
                    const ref = &height_58;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 175;
                    continue;
                } else {
                    sdl_pc = 176;
                    continue;
                }
            },
            175 => {
                n_62 = @divTrunc(width_57 + @as(c_int, 3), @as(c_int, 4));
                switch (width_57 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 178;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 185;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 189;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 193;
                        continue;
                    },
                    else => {
                        sdl_pc = 177;
                        continue;
                    },
                }
            },
            176 => {
                {
                    sdl_pc = 172;
                    continue;
                }
            },
            177 => {
                pixels_61 += @as(usize, @bitCast(@as(isize, @intCast(skip_60))));
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            178 => {
                {
                    sdl_pc = 179;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 182;
                    continue;
                }
            },
            180 => {
                if ((blk: {
                    const ref = &n_62;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 179;
                    continue;
                } else {
                    sdl_pc = 181;
                    continue;
                }
            },
            181 => {
                {
                    sdl_pc = 177;
                    continue;
                }
            },
            182 => {
                _ = &sa_66;
                sr_63 = SDL_expand_byte[fmt.*.Rbits][(pixels_61.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_64 = SDL_expand_byte[fmt.*.Gbits][(pixels_61.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_65 = SDL_expand_byte[fmt.*.Bbits][(pixels_61.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_66 = SDL_expand_byte[fmt.*.Abits][(pixels_61.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_63 = (sr_63 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_64 = (sg_64 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_65 = (sb_65 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((((sr_63 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_64 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_65 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_66 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                if (false) {
                    sdl_pc = 182;
                    continue;
                } else {
                    sdl_pc = 184;
                    continue;
                }
            },
            184 => {
                pixels_61 += 1;
                {
                    sdl_pc = 185;
                    continue;
                }
            },
            185 => {
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            186 => {
                _ = &sa_70;
                sr_67 = SDL_expand_byte[fmt.*.Rbits][(pixels_61.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_68 = SDL_expand_byte[fmt.*.Gbits][(pixels_61.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_69 = SDL_expand_byte[fmt.*.Bbits][(pixels_61.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_70 = SDL_expand_byte[fmt.*.Abits][(pixels_61.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_67 = (sr_67 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_68 = (sg_68 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_69 = (sb_69 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((((sr_67 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_68 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_69 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_70 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 187;
                    continue;
                }
            },
            187 => {
                if (false) {
                    sdl_pc = 186;
                    continue;
                } else {
                    sdl_pc = 188;
                    continue;
                }
            },
            188 => {
                pixels_61 += 1;
                {
                    sdl_pc = 189;
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
                _ = &sa_74;
                sr_71 = SDL_expand_byte[fmt.*.Rbits][(pixels_61.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_72 = SDL_expand_byte[fmt.*.Gbits][(pixels_61.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_73 = SDL_expand_byte[fmt.*.Bbits][(pixels_61.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_74 = SDL_expand_byte[fmt.*.Abits][(pixels_61.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_71 = (sr_71 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_72 = (sg_72 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_73 = (sb_73 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((((sr_71 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_72 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_73 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_74 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 191;
                    continue;
                }
            },
            191 => {
                if (false) {
                    sdl_pc = 190;
                    continue;
                } else {
                    sdl_pc = 192;
                    continue;
                }
            },
            192 => {
                pixels_61 += 1;
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                {
                    sdl_pc = 194;
                    continue;
                }
            },
            194 => {
                _ = &sa_78;
                sr_75 = SDL_expand_byte[fmt.*.Rbits][(pixels_61.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_76 = SDL_expand_byte[fmt.*.Gbits][(pixels_61.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_77 = SDL_expand_byte[fmt.*.Bbits][(pixels_61.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_78 = SDL_expand_byte[fmt.*.Abits][(pixels_61.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_75 = (sr_75 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255);
                sg_76 = (sg_76 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255);
                sb_77 = (sb_77 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255);
                pixels_61.* = ((((sr_75 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_76 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_77 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_78 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 195;
                    continue;
                }
            },
            195 => {
                if (false) {
                    sdl_pc = 194;
                    continue;
                } else {
                    sdl_pc = 196;
                    continue;
                }
            },
            196 => {
                pixels_61 += 1;
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            197 => {
                {
                    sdl_pc = 198;
                    continue;
                }
            },
            198 => {
                width_79 = rect.*.w;
                height_80 = rect.*.h;
                pitch_81 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_82 = pitch_81 - width_79;
                pixels_83 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_81))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 201;
                    continue;
                }
            },
            199 => {
                if (false) {
                    sdl_pc = 198;
                    continue;
                } else {
                    sdl_pc = 200;
                    continue;
                }
            },
            200 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            201 => {
                if ((blk: {
                    const ref = &height_80;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 202;
                    continue;
                } else {
                    sdl_pc = 203;
                    continue;
                }
            },
            202 => {
                n_84 = @divTrunc(width_79 + @as(c_int, 3), @as(c_int, 4));
                switch (width_79 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 205;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 221;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 234;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 247;
                        continue;
                    },
                    else => {
                        sdl_pc = 204;
                        continue;
                    },
                }
            },
            203 => {
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            204 => {
                pixels_83 += @as(usize, @bitCast(@as(isize, @intCast(skip_82))));
                {
                    sdl_pc = 201;
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
                {
                    sdl_pc = 209;
                    continue;
                }
            },
            207 => {
                if ((blk: {
                    const ref = &n_84;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 206;
                    continue;
                } else {
                    sdl_pc = 208;
                    continue;
                }
            },
            208 => {
                {
                    sdl_pc = 204;
                    continue;
                }
            },
            209 => {
                _ = &sa_88;
                sr_85 = SDL_expand_byte[fmt.*.Rbits][(pixels_83.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_86 = SDL_expand_byte[fmt.*.Gbits][(pixels_83.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_87 = SDL_expand_byte[fmt.*.Bbits][(pixels_83.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_88 = SDL_expand_byte[fmt.*.Abits][(pixels_83.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_85 = ((sr_85 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_85) / @as(c_uint, 255));
                if (sr_85 > @as(c_uint, 255)) {
                    sdl_pc = 212;
                    continue;
                } else {
                    sdl_pc = 213;
                    continue;
                }
            },
            210 => {
                if (false) {
                    sdl_pc = 209;
                    continue;
                } else {
                    sdl_pc = 211;
                    continue;
                }
            },
            211 => {
                pixels_83 += 1;
                {
                    sdl_pc = 221;
                    continue;
                }
            },
            212 => {
                sr_85 = 255;
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
                sg_86 = ((sg_86 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_86) / @as(c_uint, 255));
                if (sg_86 > @as(c_uint, 255)) {
                    sdl_pc = 215;
                    continue;
                } else {
                    sdl_pc = 216;
                    continue;
                }
            },
            215 => {
                sg_86 = 255;
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            216 => {
                {
                    sdl_pc = 217;
                    continue;
                }
            },
            217 => {
                sb_87 = ((sb_87 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_87) / @as(c_uint, 255));
                if (sb_87 > @as(c_uint, 255)) {
                    sdl_pc = 218;
                    continue;
                } else {
                    sdl_pc = 219;
                    continue;
                }
            },
            218 => {
                sb_87 = 255;
                {
                    sdl_pc = 220;
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
                pixels_83.* = ((((sr_85 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_86 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_87 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_88 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 210;
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
                _ = &sa_92;
                sr_89 = SDL_expand_byte[fmt.*.Rbits][(pixels_83.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_90 = SDL_expand_byte[fmt.*.Gbits][(pixels_83.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_91 = SDL_expand_byte[fmt.*.Bbits][(pixels_83.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_92 = SDL_expand_byte[fmt.*.Abits][(pixels_83.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_89 = ((sr_89 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_89) / @as(c_uint, 255));
                if (sr_89 > @as(c_uint, 255)) {
                    sdl_pc = 225;
                    continue;
                } else {
                    sdl_pc = 226;
                    continue;
                }
            },
            223 => {
                if (false) {
                    sdl_pc = 222;
                    continue;
                } else {
                    sdl_pc = 224;
                    continue;
                }
            },
            224 => {
                pixels_83 += 1;
                {
                    sdl_pc = 234;
                    continue;
                }
            },
            225 => {
                sr_89 = 255;
                {
                    sdl_pc = 227;
                    continue;
                }
            },
            226 => {
                {
                    sdl_pc = 227;
                    continue;
                }
            },
            227 => {
                sg_90 = ((sg_90 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_90) / @as(c_uint, 255));
                if (sg_90 > @as(c_uint, 255)) {
                    sdl_pc = 228;
                    continue;
                } else {
                    sdl_pc = 229;
                    continue;
                }
            },
            228 => {
                sg_90 = 255;
                {
                    sdl_pc = 230;
                    continue;
                }
            },
            229 => {
                {
                    sdl_pc = 230;
                    continue;
                }
            },
            230 => {
                sb_91 = ((sb_91 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_91) / @as(c_uint, 255));
                if (sb_91 > @as(c_uint, 255)) {
                    sdl_pc = 231;
                    continue;
                } else {
                    sdl_pc = 232;
                    continue;
                }
            },
            231 => {
                sb_91 = 255;
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            232 => {
                {
                    sdl_pc = 233;
                    continue;
                }
            },
            233 => {
                pixels_83.* = ((((sr_89 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_90 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_91 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_92 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 223;
                    continue;
                }
            },
            234 => {
                {
                    sdl_pc = 235;
                    continue;
                }
            },
            235 => {
                _ = &sa_96;
                sr_93 = SDL_expand_byte[fmt.*.Rbits][(pixels_83.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_94 = SDL_expand_byte[fmt.*.Gbits][(pixels_83.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_95 = SDL_expand_byte[fmt.*.Bbits][(pixels_83.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_96 = SDL_expand_byte[fmt.*.Abits][(pixels_83.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_93 = ((sr_93 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_93) / @as(c_uint, 255));
                if (sr_93 > @as(c_uint, 255)) {
                    sdl_pc = 238;
                    continue;
                } else {
                    sdl_pc = 239;
                    continue;
                }
            },
            236 => {
                if (false) {
                    sdl_pc = 235;
                    continue;
                } else {
                    sdl_pc = 237;
                    continue;
                }
            },
            237 => {
                pixels_83 += 1;
                {
                    sdl_pc = 247;
                    continue;
                }
            },
            238 => {
                sr_93 = 255;
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            239 => {
                {
                    sdl_pc = 240;
                    continue;
                }
            },
            240 => {
                sg_94 = ((sg_94 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_94) / @as(c_uint, 255));
                if (sg_94 > @as(c_uint, 255)) {
                    sdl_pc = 241;
                    continue;
                } else {
                    sdl_pc = 242;
                    continue;
                }
            },
            241 => {
                sg_94 = 255;
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            242 => {
                {
                    sdl_pc = 243;
                    continue;
                }
            },
            243 => {
                sb_95 = ((sb_95 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_95) / @as(c_uint, 255));
                if (sb_95 > @as(c_uint, 255)) {
                    sdl_pc = 244;
                    continue;
                } else {
                    sdl_pc = 245;
                    continue;
                }
            },
            244 => {
                sb_95 = 255;
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
                pixels_83.* = ((((sr_93 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_94 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_95 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_96 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 236;
                    continue;
                }
            },
            247 => {
                {
                    sdl_pc = 248;
                    continue;
                }
            },
            248 => {
                _ = &sa_100;
                sr_97 = SDL_expand_byte[fmt.*.Rbits][(pixels_83.* & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                sg_98 = SDL_expand_byte[fmt.*.Gbits][(pixels_83.* & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                sb_99 = SDL_expand_byte[fmt.*.Bbits][(pixels_83.* & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                sa_100 = SDL_expand_byte[fmt.*.Abits][(pixels_83.* & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                sr_97 = ((sr_97 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, r))))) / @as(c_uint, 255)) +% ((inva *% sr_97) / @as(c_uint, 255));
                if (sr_97 > @as(c_uint, 255)) {
                    sdl_pc = 251;
                    continue;
                } else {
                    sdl_pc = 252;
                    continue;
                }
            },
            249 => {
                if (false) {
                    sdl_pc = 248;
                    continue;
                } else {
                    sdl_pc = 250;
                    continue;
                }
            },
            250 => {
                pixels_83 += 1;
                {
                    sdl_pc = 207;
                    continue;
                }
            },
            251 => {
                sr_97 = 255;
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            252 => {
                {
                    sdl_pc = 253;
                    continue;
                }
            },
            253 => {
                sg_98 = ((sg_98 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, g))))) / @as(c_uint, 255)) +% ((inva *% sg_98) / @as(c_uint, 255));
                if (sg_98 > @as(c_uint, 255)) {
                    sdl_pc = 254;
                    continue;
                } else {
                    sdl_pc = 255;
                    continue;
                }
            },
            254 => {
                sg_98 = 255;
                {
                    sdl_pc = 256;
                    continue;
                }
            },
            255 => {
                {
                    sdl_pc = 256;
                    continue;
                }
            },
            256 => {
                sb_99 = ((sb_99 *% @as(c_uint, @bitCast(@as(c_int, @as(c_int, b))))) / @as(c_uint, 255)) +% ((inva *% sb_99) / @as(c_uint, 255));
                if (sb_99 > @as(c_uint, 255)) {
                    sdl_pc = 257;
                    continue;
                } else {
                    sdl_pc = 258;
                    continue;
                }
            },
            257 => {
                sb_99 = 255;
                {
                    sdl_pc = 259;
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
                pixels_83.* = ((((sr_97 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_98 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_99 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_100 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 249;
                    continue;
                }
            },
            260 => {
                {
                    sdl_pc = 261;
                    continue;
                }
            },
            261 => {
                width_101 = rect.*.w;
                height_102 = rect.*.h;
                pitch_103 = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
                skip_104 = pitch_103 - width_101;
                pixels_105 = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * pitch_103))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            262 => {
                if (false) {
                    sdl_pc = 261;
                    continue;
                } else {
                    sdl_pc = 263;
                    continue;
                }
            },
            263 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            264 => {
                if ((blk: {
                    const ref = &height_102;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 265;
                    continue;
                } else {
                    sdl_pc = 266;
                    continue;
                }
            },
            265 => {
                n_106 = @divTrunc(width_101 + @as(c_int, 3), @as(c_int, 4));
                switch (width_101 & @as(c_int, 3)) {
                    @as(c_int, 0) => {
                        sdl_pc = 268;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 275;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 279;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 283;
                        continue;
                    },
                    else => {
                        sdl_pc = 267;
                        continue;
                    },
                }
            },
            266 => {
                {
                    sdl_pc = 262;
                    continue;
                }
            },
            267 => {
                pixels_105 += @as(usize, @bitCast(@as(isize, @intCast(skip_104))));
                {
                    sdl_pc = 264;
                    continue;
                }
            },
            268 => {
                {
                    sdl_pc = 269;
                    continue;
                }
            },
            269 => {
                {
                    sdl_pc = 272;
                    continue;
                }
            },
            270 => {
                if ((blk: {
                    const ref = &n_106;
                    ref.* -= 1;
                    break :blk ref.*;
                }) > @as(c_int, 0)) {
                    sdl_pc = 269;
                    continue;
                } else {
                    sdl_pc = 271;
                    continue;
                }
            },
            271 => {
                {
                    sdl_pc = 267;
                    continue;
                }
            },
            272 => {
                sr_107 = r;
                sg_108 = g;
                sb_109 = b;
                sa_110 = a;
                _ = &sa_110;
                pixels_105.* = ((((sr_107 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_108 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_109 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_110 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 273;
                    continue;
                }
            },
            273 => {
                if (false) {
                    sdl_pc = 272;
                    continue;
                } else {
                    sdl_pc = 274;
                    continue;
                }
            },
            274 => {
                pixels_105 += 1;
                {
                    sdl_pc = 275;
                    continue;
                }
            },
            275 => {
                {
                    sdl_pc = 276;
                    continue;
                }
            },
            276 => {
                sr_111 = r;
                sg_112 = g;
                sb_113 = b;
                sa_114 = a;
                _ = &sa_114;
                pixels_105.* = ((((sr_111 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_112 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_113 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_114 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 277;
                    continue;
                }
            },
            277 => {
                if (false) {
                    sdl_pc = 276;
                    continue;
                } else {
                    sdl_pc = 278;
                    continue;
                }
            },
            278 => {
                pixels_105 += 1;
                {
                    sdl_pc = 279;
                    continue;
                }
            },
            279 => {
                {
                    sdl_pc = 280;
                    continue;
                }
            },
            280 => {
                sr_115 = r;
                sg_116 = g;
                sb_117 = b;
                sa_118 = a;
                _ = &sa_118;
                pixels_105.* = ((((sr_115 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_116 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_117 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_118 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 281;
                    continue;
                }
            },
            281 => {
                if (false) {
                    sdl_pc = 280;
                    continue;
                } else {
                    sdl_pc = 282;
                    continue;
                }
            },
            282 => {
                pixels_105 += 1;
                {
                    sdl_pc = 283;
                    continue;
                }
            },
            283 => {
                {
                    sdl_pc = 284;
                    continue;
                }
            },
            284 => {
                sr_119 = r;
                sg_120 = g;
                sb_121 = b;
                sa_122 = a;
                _ = &sa_122;
                pixels_105.* = ((((sr_119 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((sg_120 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((sb_121 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((sa_122 >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                {
                    sdl_pc = 285;
                    continue;
                }
            },
            285 => {
                if (false) {
                    sdl_pc = 284;
                    continue;
                } else {
                    sdl_pc = 286;
                    continue;
                }
            },
            286 => {
                pixels_105 += 1;
                {
                    sdl_pc = 270;
                    continue;
                }
            },
            287 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
