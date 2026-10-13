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
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_memset4_REAL(dst: ?*anyopaque, val: Uint32, dwords: usize) ?*anyopaque;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
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
pub inline fn SDL_RectEmpty(r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @"true" else @"false") != 0;
}
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
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
pub extern fn SDL_HasSSE_REAL() bool;
pub const __m128 = @Vector(4, f32);
pub const _mm_stream_ps = @import("simd")._mm_stream_ps;
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
pub fn SDL_FillSurfaceRect1SSE(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var h = arg_h;
    _ = &h;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    var c128: __m128 = undefined;
    _ = &c128;
    var cccc: [4]Uint32 align(16) = undefined;
    _ = &cccc;
    cccc[@as(c_int, 0)] = color;
    cccc[@as(c_int, 1)] = color;
    cccc[@as(c_int, 2)] = color;
    cccc[@as(c_int, 3)] = color;
    c128 = @as([*c]__m128, @ptrCast(@alignCast(@as([*c]Uint32, @ptrCast(@alignCast(&cccc)))))).*;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var p: [*c]Uint8 = pixels;
        _ = &p;
        n = w;
        if (n > @as(c_int, 63)) {
            var adjust: c_int = @bitCast(@as(c_uint, @truncate(@as(usize, 16) -% (@as(usize, @intCast(@intFromPtr(p))) & @as(usize, 15)))));
            _ = &adjust;
            if (adjust != 0) {
                n -= adjust;
                _ = memset(@ptrCast(@alignCast(p)), @bitCast(@as(c_uint, @truncate(color))), @bitCast(@as(c_long, adjust)));
                p += @as(usize, @bitCast(@as(isize, @intCast(adjust))));
            }
            {
                i = @divTrunc(n, @as(c_int, 64));
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))))), c128);
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64)))));
                }
            }
        }
        if ((n & @as(c_int, 63)) != 0) {
            var remainder_1: c_int = n & @as(c_int, 63);
            _ = &remainder_1;
            _ = memset(@ptrCast(@alignCast(p)), @bitCast(@as(c_uint, @truncate(color))), @bitCast(@as(c_long, remainder_1)));
        }
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub fn SDL_FillSurfaceRect2SSE(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, arg_w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var w = arg_w;
    _ = &w;
    var h = arg_h;
    _ = &h;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]Uint8 = null;
    _ = &p;
    if ((w * @as(c_int, 2)) == pitch) {
        w = w * h;
        h = 1;
    }
    var c128: __m128 = undefined;
    _ = &c128;
    var cccc: [4]Uint32 align(16) = undefined;
    _ = &cccc;
    cccc[@as(c_int, 0)] = color;
    cccc[@as(c_int, 1)] = color;
    cccc[@as(c_int, 2)] = color;
    cccc[@as(c_int, 3)] = color;
    c128 = @as([*c]__m128, @ptrCast(@alignCast(@as([*c]Uint32, @ptrCast(@alignCast(&cccc)))))).*;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        n = w * @as(c_int, 2);
        p = pixels;
        if (n > @as(c_int, 63)) {
            var adjust: c_int = @bitCast(@as(c_uint, @truncate(@as(usize, 16) -% (@as(usize, @intCast(@intFromPtr(p))) & @as(usize, 15)))));
            _ = &adjust;
            if (adjust < @as(c_int, 16)) {
                n -= adjust;
                {
                    const ref = &adjust;
                    ref.* = @divTrunc(ref.*, @as(c_int, 2));
                }
                while ((blk: {
                    const ref = &adjust;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    @as([*c]Uint16, @ptrCast(@alignCast(p))).* = @truncate(color);
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                }
            }
            {
                i = @divTrunc(n, @as(c_int, 64));
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))))), c128);
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64)))));
                }
            }
        }
        if ((n & @as(c_int, 63)) != 0) {
            var remainder_1: c_int = n & @as(c_int, 63);
            _ = &remainder_1;
            {
                const ref = &remainder_1;
                ref.* = @divTrunc(ref.*, @as(c_int, 2));
            }
            while ((blk: {
                const ref = &remainder_1;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                @as([*c]Uint16, @ptrCast(@alignCast(p))).* = @truncate(color);
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
            }
        }
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub fn SDL_FillSurfaceRect4SSE(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, arg_w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var w = arg_w;
    _ = &w;
    var h = arg_h;
    _ = &h;
    var i: c_int = undefined;
    _ = &i;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]Uint8 = null;
    _ = &p;
    if ((w * @as(c_int, 4)) == pitch) {
        w = w * h;
        h = 1;
    }
    var c128: __m128 = undefined;
    _ = &c128;
    var cccc: [4]Uint32 align(16) = undefined;
    _ = &cccc;
    cccc[@as(c_int, 0)] = color;
    cccc[@as(c_int, 1)] = color;
    cccc[@as(c_int, 2)] = color;
    cccc[@as(c_int, 3)] = color;
    c128 = @as([*c]__m128, @ptrCast(@alignCast(@as([*c]Uint32, @ptrCast(@alignCast(&cccc)))))).*;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        n = w * @as(c_int, 4);
        p = pixels;
        if (n > @as(c_int, 63)) {
            var adjust: c_int = @bitCast(@as(c_uint, @truncate(@as(usize, 16) -% (@as(usize, @intCast(@intFromPtr(p))) & @as(usize, 15)))));
            _ = &adjust;
            if (adjust < @as(c_int, 16)) {
                n -= adjust;
                {
                    const ref = &adjust;
                    ref.* = @divTrunc(ref.*, @as(c_int, 4));
                }
                while ((blk: {
                    const ref = &adjust;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    @as([*c]Uint32, @ptrCast(@alignCast(p))).* = color;
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
                }
            }
            {
                i = @divTrunc(n, @as(c_int, 64));
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))))), c128);
                    _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(p + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))))), c128);
                    p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64)))));
                }
            }
        }
        if ((n & @as(c_int, 63)) != 0) {
            var remainder_1: c_int = n & @as(c_int, 63);
            _ = &remainder_1;
            {
                const ref = &remainder_1;
                ref.* = @divTrunc(ref.*, @as(c_int, 4));
            }
            while ((blk: {
                const ref = &remainder_1;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                @as([*c]Uint32, @ptrCast(@alignCast(p))).* = color;
                p += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            }
        }
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub fn SDL_FillSurfaceRect1(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var h = arg_h;
    _ = &h;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]Uint8 = undefined;
    _ = &p;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                p = null;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const ref = &h;
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
                n = w;
                p = pixels;
                if (n > @as(c_int, 3)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                switch (@as(usize, @intCast(@intFromPtr(p))) & @as(usize, 3)) {
                    @as(usize, 1) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(usize, 2) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(usize, 3) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if ((n & @as(c_int, 3)) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            7 => {
                _ = SDL_memset4_REAL(@ptrCast(@alignCast(p)), color, @bitCast(@as(c_long, n >> @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                n -= 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                n -= 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                n -= 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                p += @as(usize, @bitCast(@as(isize, @intCast(n & ~@as(c_int, 3)))));
                switch (n & @as(c_int, 3)) {
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
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_FillSurfaceRect2(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var h = arg_h;
    _ = &h;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]Uint16 = null;
    _ = &p;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        n = w;
        p = @ptrCast(@alignCast(pixels));
        if (n > @as(c_int, 1)) {
            if ((@as(usize, @intCast(@intFromPtr(p))) & @as(usize, 2)) != 0) {
                (blk: {
                    const ref = &p;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @truncate(color);
                n -= 1;
            }
            _ = SDL_memset4_REAL(@ptrCast(@alignCast(p)), color, @bitCast(@as(c_long, n >> @intCast(@as(c_int, 1)))));
        }
        if ((n & @as(c_int, 1)) != 0) {
            p[@bitCast(@as(isize, @intCast(n - @as(c_int, 1))))] = @truncate(color);
        }
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub fn SDL_FillSurfaceRect3(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var h = arg_h;
    _ = &h;
    var b1: Uint8 = @truncate(color & @as(Uint32, 255));
    _ = &b1;
    var b2: Uint8 = @truncate((color >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
    _ = &b2;
    var b3: Uint8 = @truncate((color >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255));
    _ = &b3;
    var n: c_int = undefined;
    _ = &n;
    var p: [*c]Uint8 = null;
    _ = &p;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        n = w;
        p = pixels;
        while ((blk: {
            const ref = &n;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            (blk: {
                const ref = &p;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = b1;
            (blk: {
                const ref = &p;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = b2;
            (blk: {
                const ref = &p;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            }).* = b3;
        }
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub fn SDL_FillSurfaceRect4(arg_pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, arg_h: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var h = arg_h;
    _ = &h;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        _ = SDL_memset4_REAL(@ptrCast(@alignCast(pixels)), color, @bitCast(@as(c_long, w)));
        pixels += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
    }
}
pub export fn SDL_FillSurfaceRect_REAL(dst: [*c]SDL_Surface, arg_rect: [*c]const SDL_Rect, color: Uint32) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_FillSurfaceRect(): dst"))));
    }
    if (!(rect != null)) {
        rect = &dst.*.clip_rect;
        if (SDL_RectEmpty(rect)) {
            return @"true" != 0;
        }
    }
    return SDL_FillSurfaceRects_REAL(dst, rect, 1, color);
}
pub export fn SDL_FillSurfaceRects_REAL(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, arg_color: Uint32) bool {
    @setEvalBranchQuota(100000);
    var color = arg_color;
    _ = &color;
    var clipped: SDL_Rect = undefined;
    _ = &clipped;
    var pixels: [*c]Uint8 = undefined;
    _ = &pixels;
    var rect: [*c]const SDL_Rect = undefined;
    _ = &rect;
    var fill_function: ?*const fn (pixels: [*c]Uint8, pitch: c_int, color: Uint32, w: c_int, h: c_int) callconv(.c) void = undefined;
    _ = &fill_function;
    var i: c_int = undefined;
    _ = &i;
    var r: [*c]const SDL_Rect = undefined;
    _ = &r;
    var b: Uint8 = undefined;
    _ = &b;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fill_function = null;
                if (!SDL_SurfaceValid(dst)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_FillSurfaceRects(): dst"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!(rects != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_FillSurfaceRects(): rects"))));
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!(dst.*.pixels != null) and ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("SDL_FillSurfaceRects(): You must lock the surface");
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (((dst.*.w == @as(c_int, 0)) or (dst.*.h == @as(c_int, 0))) or !(dst.*.pixels != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                if (count == @as(c_int, 1)) {
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
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(fill_function)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            16 => {
                r = &rects[@as(c_int, 0)];
                if ((((r.*.x == @as(c_int, 0)) and (r.*.y == @as(c_int, 0))) and (r.*.w == dst.*.w)) and (r.*.h == dst.*.h)) {
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
                return SDL_SetError_REAL("SDL_FillSurfaceRects(): Unsupported surface format");
            },
            19 => {
                if ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 4)) {
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
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                b = @bitCast(@as(i8, @truncate((@as(c_int, @as(Uint8, @truncate(color))) << @intCast(@as(c_int, 4))) | @as(c_int, @as(Uint8, @truncate(color))))));
                _ = memset(dst.*.pixels, b, @as(usize, @bitCast(@as(c_long, dst.*.h))) *% @as(usize, @bitCast(@as(c_long, dst.*.pitch))));
                return @"true" != 0;
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
                switch (if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) {
                    @as(c_int, 1) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 42;
                        continue;
                    },
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                i = 0;
                {
                    sdl_pc = 43;
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
                color |= color << @intCast(@as(Uint32, 8));
                color |= color << @intCast(@as(Uint32, 16));
                if (SDL_HasSSE_REAL()) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                fill_function = SDL_FillSurfaceRect1SSE;
                {
                    sdl_pc = 28;
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
                fill_function = SDL_FillSurfaceRect1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                color |= color << @intCast(@as(Uint32, 16));
                if (SDL_HasSSE_REAL()) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                fill_function = SDL_FillSurfaceRect2SSE;
                {
                    sdl_pc = 28;
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
                fill_function = SDL_FillSurfaceRect2;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            37 => {
                fill_function = SDL_FillSurfaceRect3;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            38 => {
                if (SDL_HasSSE_REAL()) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                fill_function = SDL_FillSurfaceRect4SSE;
                {
                    sdl_pc = 28;
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
                fill_function = SDL_FillSurfaceRect4;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            42 => {
                return SDL_SetError_REAL("Unsupported pixel format");
            },
            43 => {
                if (i < count) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            44 => {
                rect = &rects[@bitCast(@as(isize, @intCast(i)))];
                if (!SDL_GetRectIntersection_REAL(rect, &dst.*.clip_rect, &clipped)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                i += 1;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            46 => {
                return @"true" != 0;
            },
            47 => {
                {
                    sdl_pc = 45;
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
                rect = &clipped;
                pixels = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))));
                fill_function.?(pixels, dst.*.pitch, color, rect.*.w, rect.*.h);
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const SDL_FillSurfaceRect = SDL_FillSurfaceRect_REAL;
pub const SDL_FillSurfaceRects = SDL_FillSurfaceRects_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
