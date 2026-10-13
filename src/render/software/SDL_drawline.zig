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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn y1(f64) f64;
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
pub extern fn SDL_GetRGBA_REAL(pixelvalue: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) void;
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
pub extern fn SDL_GetRectAndLineIntersection_REAL(rect: [*c]const SDL_Rect, X1: [*c]c_int, Y1: [*c]c_int, X2: [*c]c_int, Y2: [*c]c_int) bool;
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
pub export fn SDL_DrawLine(dst: [*c]SDL_Surface, arg_x1: c_int, arg_y1_1: c_int, arg_x2: c_int, arg_y2: c_int, color: Uint32) bool {
    @setEvalBranchQuota(100000);
    var x1 = arg_x1;
    _ = &x1;
    var y1_1 = arg_y1_1;
    _ = &y1_1;
    var x2 = arg_x2;
    _ = &x2;
    var y2 = arg_y2;
    _ = &y2;
    var func: DrawLineFunc = undefined;
    _ = &func;
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_DrawLine(): dst"))));
    }
    func = SDL_CalculateDrawLineFunc(dst.*.fmt);
    if (!(func != null)) {
        return SDL_SetError_REAL("SDL_DrawLine(): Unsupported surface format");
    }
    if (!SDL_GetRectAndLineIntersection_REAL(&dst.*.clip_rect, &x1, &y1_1, &x2, &y2)) {
        return @"true" != 0;
    }
    func.?(dst, x1, y1_1, x2, y2, color, @"true" != 0);
    return @"true" != 0;
}
pub export fn SDL_DrawLines(dst: [*c]SDL_Surface, points: [*c]const SDL_Point, count: c_int, color: Uint32) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var x1: c_int = undefined;
    _ = &x1;
    var y1_1: c_int = undefined;
    _ = &y1_1;
    var x2: c_int = undefined;
    _ = &x2;
    var y2: c_int = undefined;
    _ = &y2;
    var draw_end: bool = undefined;
    _ = &draw_end;
    var func: DrawLineFunc = undefined;
    _ = &func;
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_DrawLines(): dst"))));
    }
    func = SDL_CalculateDrawLineFunc(dst.*.fmt);
    if (!(func != null)) {
        return SDL_SetError_REAL("SDL_DrawLines(): Unsupported surface format");
    }
    {
        i = 1;
        while (i < count) : (i += 1) {
            x1 = points[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))].x;
            y1_1 = points[@bitCast(@as(isize, @intCast(i - @as(c_int, 1))))].y;
            x2 = points[@bitCast(@as(isize, @intCast(i)))].x;
            y2 = points[@bitCast(@as(isize, @intCast(i)))].y;
            if (!SDL_GetRectAndLineIntersection_REAL(&dst.*.clip_rect, &x1, &y1_1, &x2, &y2)) {
                continue;
            }
            draw_end = ((x1 == x2) and (y1_1 == y2)) or ((x2 != points[@bitCast(@as(isize, @intCast(i)))].x) or (y2 != points[@bitCast(@as(isize, @intCast(i)))].y));
            func.?(dst, x1, y1_1, x2, y2, color, draw_end);
        }
    }
    if ((points[@as(c_int, 0)].x != points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].x) or (points[@as(c_int, 0)].y != points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].y)) {
        _ = SDL_DrawPoint(dst, points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].x, points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].y, color);
    }
    return @"true" != 0;
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
pub extern fn SDL_DrawPoint(dst: [*c]SDL_Surface, x: c_int, y: c_int, color: Uint32) bool;
pub fn SDL_DrawLine1(dst: [*c]SDL_Surface, arg_x1: c_int, arg_y1_1: c_int, arg_x2: c_int, y2: c_int, color: Uint32, draw_end: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x1 = arg_x1;
    _ = &x1;
    var y1_1 = arg_y1_1;
    _ = &y1_1;
    var x2 = arg_x2;
    _ = &x2;
    if (y1_1 == y2) {
        var length: c_int = undefined;
        _ = &length;
        var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
        _ = &pitch;
        var pixels: [*c]Uint8 = undefined;
        _ = &pixels;
        if (x1 <= x2) {
            pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
            length = if (draw_end) (x2 - x1) + @as(c_int, 1) else x2 - x1;
        } else {
            pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
            if (!draw_end) {
                pixels += 1;
            }
            length = if (draw_end) (x1 - x2) + @as(c_int, 1) else x1 - x2;
        }
        _ = memset(@ptrCast(@alignCast(pixels)), @bitCast(@as(c_uint, @truncate(color))), @bitCast(@as(c_long, length)));
    } else if (x1 == x2) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint8 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                length = if (draw_end) (y2 - y1_1) + @as(c_int, 1) else y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = if (draw_end) (y1_1 - y2) + @as(c_int, 1) else y1_1 - y2;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = @truncate(color);
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else if ((if ((x1 - x2) < @as(c_int, 0)) -(x1 - x2) else x1 - x2) == (if ((y1_1 - y2) < @as(c_int, 0)) -(y1_1 - y2) else y1_1 - y2)) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint8 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (x1 <= x2) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                length = y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
                if (x2 <= x1) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = y1_1 - y2;
            }
            if (draw_end) {
                length += 1;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = @truncate(color);
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else {
        {
            var i: c_int = undefined;
            _ = &i;
            var deltax: c_int = undefined;
            _ = &deltax;
            var deltay: c_int = undefined;
            _ = &deltay;
            var numpixels: c_int = undefined;
            _ = &numpixels;
            var d: c_int = undefined;
            _ = &d;
            var dinc1: c_int = undefined;
            _ = &dinc1;
            var dinc2: c_int = undefined;
            _ = &dinc2;
            var x: c_int = undefined;
            _ = &x;
            var xinc1: c_int = undefined;
            _ = &xinc1;
            var xinc2: c_int = undefined;
            _ = &xinc2;
            var y: c_int = undefined;
            _ = &y;
            var yinc1: c_int = undefined;
            _ = &yinc1;
            var yinc2: c_int = undefined;
            _ = &yinc2;
            deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
            deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
            if (deltax >= deltay) {
                numpixels = deltax + @as(c_int, 1);
                d = (@as(c_int, 2) * deltay) - deltax;
                dinc1 = deltay * @as(c_int, 2);
                dinc2 = (deltay - deltax) * @as(c_int, 2);
                xinc1 = 1;
                xinc2 = 1;
                yinc1 = 0;
                yinc2 = 1;
            } else {
                numpixels = deltay + @as(c_int, 1);
                d = (@as(c_int, 2) * deltax) - deltay;
                dinc1 = deltax * @as(c_int, 2);
                dinc2 = (deltax - deltay) * @as(c_int, 2);
                xinc1 = 0;
                xinc2 = 1;
                yinc1 = 1;
                yinc2 = 1;
            }
            if (x1 > x2) {
                xinc1 = -xinc1;
                xinc2 = -xinc2;
            }
            if (y1_1 > y2) {
                yinc1 = -yinc1;
                yinc2 = -yinc2;
            }
            x = x1;
            y = y1_1;
            if (!draw_end) {
                numpixels -= 1;
            }
            {
                i = 0;
                while (i < numpixels) : (i += 1) {
                    ((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 1)))))).* = @truncate(color);
                    if (d < @as(c_int, 0)) {
                        d += dinc1;
                        x += xinc1;
                        y += yinc1;
                    } else {
                        d += dinc2;
                        x += xinc2;
                        y += yinc2;
                    }
                }
            }
        }
    }
}
pub fn SDL_DrawLine2(dst: [*c]SDL_Surface, arg_x1: c_int, arg_y1_1: c_int, arg_x2: c_int, y2: c_int, color: Uint32, draw_end: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x1 = arg_x1;
    _ = &x1;
    var y1_1 = arg_y1_1;
    _ = &y1_1;
    var x2 = arg_x2;
    _ = &x2;
    if (y1_1 == y2) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint16 = undefined;
            _ = &pixels;
            if (x1 <= x2) {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                length = if (draw_end) (x2 - x1) + @as(c_int, 1) else x2 - x1;
            } else {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
                if (!draw_end) {
                    pixels += 1;
                }
                length = if (draw_end) (x1 - x2) + @as(c_int, 1) else x1 - x2;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = @truncate(color);
                pixels += 1;
            }
        }
    } else if (x1 == x2) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint16 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                length = if (draw_end) (y2 - y1_1) + @as(c_int, 1) else y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = if (draw_end) (y1_1 - y2) + @as(c_int, 1) else y1_1 - y2;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = @truncate(color);
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else if ((if ((x1 - x2) < @as(c_int, 0)) -(x1 - x2) else x1 - x2) == (if ((y1_1 - y2) < @as(c_int, 0)) -(y1_1 - y2) else y1_1 - y2)) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint16 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (x1 <= x2) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                length = y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint16, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
                if (x2 <= x1) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = y1_1 - y2;
            }
            if (draw_end) {
                length += 1;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = @truncate(color);
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else {
        var _r: Uint8 = undefined;
        _ = &_r;
        var _g: Uint8 = undefined;
        _ = &_g;
        var _b: Uint8 = undefined;
        _ = &_b;
        var _a: Uint8 = undefined;
        _ = &_a;
        var fmt: [*c]const SDL_PixelFormatDetails = dst.*.fmt;
        _ = &fmt;
        SDL_GetRGBA_REAL(color, fmt, dst.*.palette, &_r, &_g, &_b, &_a);
        if (fmt.*.Rmask == @as(Uint32, 31744)) {
            {
                var i: c_int = undefined;
                _ = &i;
                var deltax: c_int = undefined;
                _ = &deltax;
                var deltay: c_int = undefined;
                _ = &deltay;
                var numpixels: c_int = undefined;
                _ = &numpixels;
                var d: c_int = undefined;
                _ = &d;
                var dinc1: c_int = undefined;
                _ = &dinc1;
                var dinc2: c_int = undefined;
                _ = &dinc2;
                var x: c_int = undefined;
                _ = &x;
                var xinc1: c_int = undefined;
                _ = &xinc1;
                var xinc2: c_int = undefined;
                _ = &xinc2;
                var y: c_int = undefined;
                _ = &y;
                var yinc1: c_int = undefined;
                _ = &yinc1;
                var yinc2: c_int = undefined;
                _ = &yinc2;
                deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                if (deltax >= deltay) {
                    numpixels = deltax + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltay) - deltax;
                    dinc1 = deltay * @as(c_int, 2);
                    dinc2 = (deltay - deltax) * @as(c_int, 2);
                    xinc1 = 1;
                    xinc2 = 1;
                    yinc1 = 0;
                    yinc2 = 1;
                } else {
                    numpixels = deltay + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltax) - deltay;
                    dinc1 = deltax * @as(c_int, 2);
                    dinc2 = (deltax - deltay) * @as(c_int, 2);
                    xinc1 = 0;
                    xinc2 = 1;
                    yinc1 = 1;
                    yinc2 = 1;
                }
                if (x1 > x2) {
                    xinc1 = -xinc1;
                    xinc2 = -xinc2;
                }
                if (y1_1 > y2) {
                    yinc1 = -yinc1;
                    yinc2 = -yinc2;
                }
                x = x1;
                y = y1_1;
                if (!draw_end) {
                    numpixels -= 1;
                }
                {
                    i = 0;
                    while (i < numpixels) : (i += 1) {
                        @as([*c]Uint16, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))))).* = @truncate(color);
                        if (d < @as(c_int, 0)) {
                            d += dinc1;
                            x += xinc1;
                            y += yinc1;
                        } else {
                            d += dinc2;
                            x += xinc2;
                            y += yinc2;
                        }
                    }
                }
            }
        } else if (fmt.*.Rmask == @as(Uint32, 63488)) {
            {
                var i: c_int = undefined;
                _ = &i;
                var deltax: c_int = undefined;
                _ = &deltax;
                var deltay: c_int = undefined;
                _ = &deltay;
                var numpixels: c_int = undefined;
                _ = &numpixels;
                var d: c_int = undefined;
                _ = &d;
                var dinc1: c_int = undefined;
                _ = &dinc1;
                var dinc2: c_int = undefined;
                _ = &dinc2;
                var x: c_int = undefined;
                _ = &x;
                var xinc1: c_int = undefined;
                _ = &xinc1;
                var xinc2: c_int = undefined;
                _ = &xinc2;
                var y: c_int = undefined;
                _ = &y;
                var yinc1: c_int = undefined;
                _ = &yinc1;
                var yinc2: c_int = undefined;
                _ = &yinc2;
                deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                if (deltax >= deltay) {
                    numpixels = deltax + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltay) - deltax;
                    dinc1 = deltay * @as(c_int, 2);
                    dinc2 = (deltay - deltax) * @as(c_int, 2);
                    xinc1 = 1;
                    xinc2 = 1;
                    yinc1 = 0;
                    yinc2 = 1;
                } else {
                    numpixels = deltay + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltax) - deltay;
                    dinc1 = deltax * @as(c_int, 2);
                    dinc2 = (deltax - deltay) * @as(c_int, 2);
                    xinc1 = 0;
                    xinc2 = 1;
                    yinc1 = 1;
                    yinc2 = 1;
                }
                if (x1 > x2) {
                    xinc1 = -xinc1;
                    xinc2 = -xinc2;
                }
                if (y1_1 > y2) {
                    yinc1 = -yinc1;
                    yinc2 = -yinc2;
                }
                x = x1;
                y = y1_1;
                if (!draw_end) {
                    numpixels -= 1;
                }
                {
                    i = 0;
                    while (i < numpixels) : (i += 1) {
                        @as([*c]Uint16, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))))).* = @truncate(color);
                        if (d < @as(c_int, 0)) {
                            d += dinc1;
                            x += xinc1;
                            y += yinc1;
                        } else {
                            d += dinc2;
                            x += xinc2;
                            y += yinc2;
                        }
                    }
                }
            }
        } else {
            {
                var i: c_int = undefined;
                _ = &i;
                var deltax: c_int = undefined;
                _ = &deltax;
                var deltay: c_int = undefined;
                _ = &deltay;
                var numpixels: c_int = undefined;
                _ = &numpixels;
                var d: c_int = undefined;
                _ = &d;
                var dinc1: c_int = undefined;
                _ = &dinc1;
                var dinc2: c_int = undefined;
                _ = &dinc2;
                var x: c_int = undefined;
                _ = &x;
                var xinc1: c_int = undefined;
                _ = &xinc1;
                var xinc2: c_int = undefined;
                _ = &xinc2;
                var y: c_int = undefined;
                _ = &y;
                var yinc1: c_int = undefined;
                _ = &yinc1;
                var yinc2: c_int = undefined;
                _ = &yinc2;
                deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                if (deltax >= deltay) {
                    numpixels = deltax + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltay) - deltax;
                    dinc1 = deltay * @as(c_int, 2);
                    dinc2 = (deltay - deltax) * @as(c_int, 2);
                    xinc1 = 1;
                    xinc2 = 1;
                    yinc1 = 0;
                    yinc2 = 1;
                } else {
                    numpixels = deltay + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltax) - deltay;
                    dinc1 = deltax * @as(c_int, 2);
                    dinc2 = (deltax - deltay) * @as(c_int, 2);
                    xinc1 = 0;
                    xinc2 = 1;
                    yinc1 = 1;
                    yinc2 = 1;
                }
                if (x1 > x2) {
                    xinc1 = -xinc1;
                    xinc2 = -xinc2;
                }
                if (y1_1 > y2) {
                    yinc1 = -yinc1;
                    yinc2 = -yinc2;
                }
                x = x1;
                y = y1_1;
                if (!draw_end) {
                    numpixels -= 1;
                }
                {
                    i = 0;
                    while (i < numpixels) : (i += 1) {
                        @as([*c]Uint16, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 2)))))))).* = @truncate(color);
                        if (d < @as(c_int, 0)) {
                            d += dinc1;
                            x += xinc1;
                            y += yinc1;
                        } else {
                            d += dinc2;
                            x += xinc2;
                            y += yinc2;
                        }
                    }
                }
            }
        }
    }
}
pub fn SDL_DrawLine4(dst: [*c]SDL_Surface, arg_x1: c_int, arg_y1_1: c_int, arg_x2: c_int, y2: c_int, color: Uint32, draw_end: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x1 = arg_x1;
    _ = &x1;
    var y1_1 = arg_y1_1;
    _ = &y1_1;
    var x2 = arg_x2;
    _ = &x2;
    if (y1_1 == y2) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint32 = undefined;
            _ = &pixels;
            if (x1 <= x2) {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                length = if (draw_end) (x2 - x1) + @as(c_int, 1) else x2 - x1;
            } else {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
                if (!draw_end) {
                    pixels += 1;
                }
                length = if (draw_end) (x1 - x2) + @as(c_int, 1) else x1 - x2;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = color;
                pixels += 1;
            }
        }
    } else if (x1 == x2) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint32 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                length = if (draw_end) (y2 - y1_1) + @as(c_int, 1) else y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = if (draw_end) (y1_1 - y2) + @as(c_int, 1) else y1_1 - y2;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = color;
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else if ((if ((x1 - x2) < @as(c_int, 0)) -(x1 - x2) else x1 - x2) == (if ((y1_1 - y2) < @as(c_int, 0)) -(y1_1 - y2) else y1_1 - y2)) {
        {
            var length: c_int = undefined;
            _ = &length;
            var pitch: c_int = @divTrunc(dst.*.pitch, @as(c_int, dst.*.fmt.*.bytes_per_pixel));
            _ = &pitch;
            var pixels: [*c]Uint32 = undefined;
            _ = &pixels;
            if (y1_1 <= y2) {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y1_1 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x1))));
                if (x1 <= x2) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                length = y2 - y1_1;
            } else {
                pixels = (@as([*c]Uint32, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y2 * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x2))));
                if (x2 <= x1) {
                    pitch += 1;
                } else {
                    pitch -= 1;
                }
                if (!draw_end) {
                    pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                }
                length = y1_1 - y2;
            }
            if (draw_end) {
                length += 1;
            }
            while ((blk: {
                const ref = &length;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                pixels.* = color;
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
            }
        }
    } else {
        var _r: Uint8 = undefined;
        _ = &_r;
        var _g: Uint8 = undefined;
        _ = &_g;
        var _b: Uint8 = undefined;
        _ = &_b;
        var _a: Uint8 = undefined;
        _ = &_a;
        var fmt: [*c]const SDL_PixelFormatDetails = dst.*.fmt;
        _ = &fmt;
        SDL_GetRGBA_REAL(color, fmt, dst.*.palette, &_r, &_g, &_b, &_a);
        if (fmt.*.Rmask == @as(Uint32, 16711680)) {
            if (!(fmt.*.Amask != 0)) {
                {
                    var i: c_int = undefined;
                    _ = &i;
                    var deltax: c_int = undefined;
                    _ = &deltax;
                    var deltay: c_int = undefined;
                    _ = &deltay;
                    var numpixels: c_int = undefined;
                    _ = &numpixels;
                    var d: c_int = undefined;
                    _ = &d;
                    var dinc1: c_int = undefined;
                    _ = &dinc1;
                    var dinc2: c_int = undefined;
                    _ = &dinc2;
                    var x: c_int = undefined;
                    _ = &x;
                    var xinc1: c_int = undefined;
                    _ = &xinc1;
                    var xinc2: c_int = undefined;
                    _ = &xinc2;
                    var y: c_int = undefined;
                    _ = &y;
                    var yinc1: c_int = undefined;
                    _ = &yinc1;
                    var yinc2: c_int = undefined;
                    _ = &yinc2;
                    deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                    deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                    if (deltax >= deltay) {
                        numpixels = deltax + @as(c_int, 1);
                        d = (@as(c_int, 2) * deltay) - deltax;
                        dinc1 = deltay * @as(c_int, 2);
                        dinc2 = (deltay - deltax) * @as(c_int, 2);
                        xinc1 = 1;
                        xinc2 = 1;
                        yinc1 = 0;
                        yinc2 = 1;
                    } else {
                        numpixels = deltay + @as(c_int, 1);
                        d = (@as(c_int, 2) * deltax) - deltay;
                        dinc1 = deltax * @as(c_int, 2);
                        dinc2 = (deltax - deltay) * @as(c_int, 2);
                        xinc1 = 0;
                        xinc2 = 1;
                        yinc1 = 1;
                        yinc2 = 1;
                    }
                    if (x1 > x2) {
                        xinc1 = -xinc1;
                        xinc2 = -xinc2;
                    }
                    if (y1_1 > y2) {
                        yinc1 = -yinc1;
                        yinc2 = -yinc2;
                    }
                    x = x1;
                    y = y1_1;
                    if (!draw_end) {
                        numpixels -= 1;
                    }
                    {
                        i = 0;
                        while (i < numpixels) : (i += 1) {
                            @as([*c]Uint32, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))))).* = color;
                            if (d < @as(c_int, 0)) {
                                d += dinc1;
                                x += xinc1;
                                y += yinc1;
                            } else {
                                d += dinc2;
                                x += xinc2;
                                y += yinc2;
                            }
                        }
                    }
                }
            } else {
                {
                    var i: c_int = undefined;
                    _ = &i;
                    var deltax: c_int = undefined;
                    _ = &deltax;
                    var deltay: c_int = undefined;
                    _ = &deltay;
                    var numpixels: c_int = undefined;
                    _ = &numpixels;
                    var d: c_int = undefined;
                    _ = &d;
                    var dinc1: c_int = undefined;
                    _ = &dinc1;
                    var dinc2: c_int = undefined;
                    _ = &dinc2;
                    var x: c_int = undefined;
                    _ = &x;
                    var xinc1: c_int = undefined;
                    _ = &xinc1;
                    var xinc2: c_int = undefined;
                    _ = &xinc2;
                    var y: c_int = undefined;
                    _ = &y;
                    var yinc1: c_int = undefined;
                    _ = &yinc1;
                    var yinc2: c_int = undefined;
                    _ = &yinc2;
                    deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                    deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                    if (deltax >= deltay) {
                        numpixels = deltax + @as(c_int, 1);
                        d = (@as(c_int, 2) * deltay) - deltax;
                        dinc1 = deltay * @as(c_int, 2);
                        dinc2 = (deltay - deltax) * @as(c_int, 2);
                        xinc1 = 1;
                        xinc2 = 1;
                        yinc1 = 0;
                        yinc2 = 1;
                    } else {
                        numpixels = deltay + @as(c_int, 1);
                        d = (@as(c_int, 2) * deltax) - deltay;
                        dinc1 = deltax * @as(c_int, 2);
                        dinc2 = (deltax - deltay) * @as(c_int, 2);
                        xinc1 = 0;
                        xinc2 = 1;
                        yinc1 = 1;
                        yinc2 = 1;
                    }
                    if (x1 > x2) {
                        xinc1 = -xinc1;
                        xinc2 = -xinc2;
                    }
                    if (y1_1 > y2) {
                        yinc1 = -yinc1;
                        yinc2 = -yinc2;
                    }
                    x = x1;
                    y = y1_1;
                    if (!draw_end) {
                        numpixels -= 1;
                    }
                    {
                        i = 0;
                        while (i < numpixels) : (i += 1) {
                            @as([*c]Uint32, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))))).* = color;
                            if (d < @as(c_int, 0)) {
                                d += dinc1;
                                x += xinc1;
                                y += yinc1;
                            } else {
                                d += dinc2;
                                x += xinc2;
                                y += yinc2;
                            }
                        }
                    }
                }
            }
        } else {
            {
                var i: c_int = undefined;
                _ = &i;
                var deltax: c_int = undefined;
                _ = &deltax;
                var deltay: c_int = undefined;
                _ = &deltay;
                var numpixels: c_int = undefined;
                _ = &numpixels;
                var d: c_int = undefined;
                _ = &d;
                var dinc1: c_int = undefined;
                _ = &dinc1;
                var dinc2: c_int = undefined;
                _ = &dinc2;
                var x: c_int = undefined;
                _ = &x;
                var xinc1: c_int = undefined;
                _ = &xinc1;
                var xinc2: c_int = undefined;
                _ = &xinc2;
                var y: c_int = undefined;
                _ = &y;
                var yinc1: c_int = undefined;
                _ = &yinc1;
                var yinc2: c_int = undefined;
                _ = &yinc2;
                deltax = if ((x2 - x1) < @as(c_int, 0)) -(x2 - x1) else x2 - x1;
                deltay = if ((y2 - y1_1) < @as(c_int, 0)) -(y2 - y1_1) else y2 - y1_1;
                if (deltax >= deltay) {
                    numpixels = deltax + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltay) - deltax;
                    dinc1 = deltay * @as(c_int, 2);
                    dinc2 = (deltay - deltax) * @as(c_int, 2);
                    xinc1 = 1;
                    xinc2 = 1;
                    yinc1 = 0;
                    yinc2 = 1;
                } else {
                    numpixels = deltay + @as(c_int, 1);
                    d = (@as(c_int, 2) * deltax) - deltay;
                    dinc1 = deltax * @as(c_int, 2);
                    dinc2 = (deltax - deltay) * @as(c_int, 2);
                    xinc1 = 0;
                    xinc2 = 1;
                    yinc1 = 1;
                    yinc2 = 1;
                }
                if (x1 > x2) {
                    xinc1 = -xinc1;
                    xinc2 = -xinc2;
                }
                if (y1_1 > y2) {
                    yinc1 = -yinc1;
                    yinc2 = -yinc2;
                }
                x = x1;
                y = y1_1;
                if (!draw_end) {
                    numpixels -= 1;
                }
                {
                    i = 0;
                    while (i < numpixels) : (i += 1) {
                        @as([*c]Uint32, @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * @as(c_int, 4)))))))).* = color;
                        if (d < @as(c_int, 0)) {
                            d += dinc1;
                            x += xinc1;
                            y += yinc1;
                        } else {
                            d += dinc2;
                            x += xinc2;
                            y += yinc2;
                        }
                    }
                }
            }
        }
    }
}
pub const DrawLineFunc = ?*const fn (dst: [*c]SDL_Surface, x1: c_int, y1: c_int, x2: c_int, y2: c_int, color: Uint32, draw_end: bool) callconv(.c) void;
pub fn SDL_CalculateDrawLineFunc(fmt: [*c]const SDL_PixelFormatDetails) callconv(.c) DrawLineFunc {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 7;
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
                if (@as(c_int, fmt.*.bits_per_pixel) < @as(c_int, 8)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 1;
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
                return SDL_DrawLine1;
            },
            6 => {
                return SDL_DrawLine2;
            },
            7 => {
                return SDL_DrawLine4;
            },
            else => unreachable,
        }
    }
}
