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
pub export fn SDL_DrawPoint(dst: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, color: Uint32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
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
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_DrawPoint(): dst"))));
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
                return SDL_SetError_REAL("SDL_DrawPoint(): Unsupported surface format");
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
                switch (@as(c_int, dst.*.fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            10 => {
                return @"true" != 0;
            },
            11 => {
                ((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 1)))))).* = @truncate(color);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                @as([*c]Uint16, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))))).* = @truncate(color);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            14 => {
                @as([*c]Uint32, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))))).* = color;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_DrawPoints(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, color: Uint32) bool {
    @setEvalBranchQuota(100000);
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
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_DrawPoints(): dst"))));
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
                return SDL_SetError_REAL("SDL_DrawPoints(): Unsupported surface format");
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                minx = dst.*.clip_rect.x;
                maxx = (dst.*.clip_rect.x + dst.*.clip_rect.w) - @as(c_int, 1);
                miny = dst.*.clip_rect.y;
                maxy = (dst.*.clip_rect.y + dst.*.clip_rect.h) - @as(c_int, 1);
                i = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (i < count) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if ((((x < minx) or (x > maxx)) or (y < miny)) or (y > maxy)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                i += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                return @"true" != 0;
            },
            11 => {
                {
                    sdl_pc = 9;
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
                switch (@as(c_int, dst.*.fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            14 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            15 => {
                ((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 1)))))).* = @truncate(color);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            16 => {
                @as([*c]Uint16, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))))).* = @truncate(color);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            18 => {
                @as([*c]Uint32, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))))).* = color;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
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
