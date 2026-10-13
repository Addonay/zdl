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
pub fn Blit1to1(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var map: [*c]Uint8 = undefined;
    _ = &map;
    var dst: [*c]Uint8 = undefined;
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
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                map = info.*.table;
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
                dst.* = map[src.*];
                dst += 1;
                src += 1;
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
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                dst.* = map[src.*];
                dst += 1;
                src += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var map: [*c]Uint16 = undefined;
    _ = &map;
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
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                map = @ptrCast(@alignCast(info.*.table));
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
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
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
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to3(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var o: c_int = undefined;
    _ = &o;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var map: [*c]Uint8 = undefined;
    _ = &map;
    var dst: [*c]Uint8 = undefined;
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
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                map = info.*.table;
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
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
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
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = map[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to4(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var map: [*c]Uint32 = undefined;
    _ = &map;
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
                map = @ptrCast(@alignCast(info.*.table));
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
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
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
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
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
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
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
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                (blk: {
                    const ref = &dst;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = map[
                    (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*
                ];
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to1Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var n: c_int = undefined;
    _ = &n;
    var n_1: c_int = undefined;
    _ = &n_1;
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
                ckey = info.*.colorkey;
                if (palmap != null) {
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
                    sdl_pc = 43;
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
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 39;
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                dst.* = palmap[src.*];
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                dst += 1;
                src += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                dst.* = palmap[src.*];
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                dst.* = palmap[src.*];
                {
                    sdl_pc = 22;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                dst.* = palmap[src.*];
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                dst.* = palmap[src.*];
                {
                    sdl_pc = 30;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                dst.* = palmap[src.*];
                {
                    sdl_pc = 34;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                dst.* = palmap[src.*];
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                dst.* = palmap[src.*];
                {
                    sdl_pc = 42;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 10;
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
                n_1 = @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
                switch (width & @as(c_int, 7)) {
                    @as(c_int, 0) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 78;
                        continue;
                    },
                    else => {
                        sdl_pc = 46;
                        continue;
                    },
                }
            },
            45 => {
                {
                    sdl_pc = 3;
                    continue;
                }
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            49 => {
                if ((blk: {
                    const ref = &n_1;
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
                dst.* = src.*;
                {
                    sdl_pc = 53;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            78 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                dst.* = src.*;
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
                dst += 1;
                src += 1;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to2Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint16 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var palmap: [*c]Uint16 = undefined;
    _ = &palmap;
    var ckey: Uint32 = undefined;
    _ = &ckey;
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
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip;
                palmap = @ptrCast(@alignCast(info.*.table));
                ckey = info.*.colorkey;
                {
                    const ref = &dstskip;
                    ref.* = @divTrunc(ref.*, @as(c_int, 2));
                }
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
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
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
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to3Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var o: c_int = undefined;
    _ = &o;
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
                dst = info.*.dst;
                dstskip = info.*.dst_skip;
                palmap = info.*.table;
                ckey = info.*.colorkey;
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
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 20;
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
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
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                o = @as(c_int, src.*) * @as(c_int, 4);
                dst[@as(c_int, 0)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 1)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                dst[@as(c_int, 2)] = palmap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &o;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1to4Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstp: [*c]Uint32 = undefined;
    _ = &dstp;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var palmap: [*c]Uint32 = undefined;
    _ = &palmap;
    var ckey: Uint32 = undefined;
    _ = &ckey;
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
                dstp = @ptrCast(@alignCast(info.*.dst));
                dstskip = info.*.dst_skip;
                palmap = @ptrCast(@alignCast(info.*.table));
                ckey = info.*.colorkey;
                {
                    const ref = &dstskip;
                    ref.* = @divTrunc(ref.*, @as(c_int, 4));
                }
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
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
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
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                dstp.* = palmap[src.*];
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
                src += 1;
                dstp += 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1toNAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcpal: [*c]const SDL_Color = undefined;
    _ = &srcpal;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
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
                dstfmt = info.*.dst_fmt;
                srcpal = info.*.src_pal.*.colors;
                A = info.*.a;
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
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 98;
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
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
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
                switch (dstbpp) {
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
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            14 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                pixelvalue = 0;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 37;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
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
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
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
                    sdl_pc = 19;
                    continue;
                }
            },
            33 => {
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            34 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            35 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 46;
                        continue;
                    },
                    else => {
                        sdl_pc = 47;
                        continue;
                    },
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
                    sdl_pc = 48;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            44 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            45 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            47 => {
                pixelvalue = 0;
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
                    sdl_pc = 42;
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
                if (false) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
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
                        sdl_pc = 63;
                        continue;
                    },
                }
            },
            51 => {
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
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
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
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                if (false) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
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
                    sdl_pc = 58;
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
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
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
                    sdl_pc = 61;
                    continue;
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
                    sdl_pc = 49;
                    continue;
                }
            },
            63 => {
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            64 => {
                _pixel_10 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_10;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            65 => {
                _pixel_11 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_11;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            66 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            67 => {
                _pixel_12 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_12;
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            68 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 76;
                        continue;
                    },
                    else => {
                        sdl_pc = 77;
                        continue;
                    },
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
                    sdl_pc = 78;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            73 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            74 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            75 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            77 => {
                pixelvalue = 0;
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
                    sdl_pc = 72;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 81;
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
                switch (dstbpp) {
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
                        sdl_pc = 93;
                        continue;
                    },
                }
            },
            81 => {
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
                    sdl_pc = 87;
                    continue;
                }
            },
            87 => {
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
                    sdl_pc = 88;
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
                    sdl_pc = 90;
                    continue;
                }
            },
            90 => {
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
                    sdl_pc = 91;
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
                    sdl_pc = 79;
                    continue;
                }
            },
            93 => {
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            94 => {
                _pixel_17 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_17;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            95 => {
                _pixel_18 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_18;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            96 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            97 => {
                _pixel_19 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_19;
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            98 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 99;
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
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            104 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            105 => {
                pixelvalue = 0;
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
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            107 => {
                pixelvalue = 0;
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            124 => {
                _pixel_24 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_24;
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            125 => {
                _pixel_25 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_25;
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
                _pixel_26 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_26;
                {
                    sdl_pc = 123;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1toNAlphaKey(info: [*c]SDL_BlitInfo) callconv(.c) void {
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
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcpal: [*c]const SDL_Color = undefined;
    _ = &srcpal;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
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
                dstfmt = info.*.dst_fmt;
                srcpal = info.*.src_pal.*.colors;
                ckey = info.*.colorkey;
                A = info.*.a;
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
                        sdl_pc = 41;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 107;
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
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
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
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 12;
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            12 => {
                switch (dstbpp) {
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
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            17 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                pixelvalue = 0;
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
                    sdl_pc = 15;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            24 => {
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
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
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
                    sdl_pc = 22;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            37 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 45;
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            45 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 53;
                        continue;
                    },
                }
            },
            46 => {
                if (false) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            50 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            51 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            53 => {
                pixelvalue = 0;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                if (false) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                switch (dstbpp) {
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
                        sdl_pc = 69;
                        continue;
                    },
                }
            },
            57 => {
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
                    sdl_pc = 58;
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
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
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
                    sdl_pc = 61;
                    continue;
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
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
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
                    sdl_pc = 64;
                    continue;
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
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
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
                    sdl_pc = 67;
                    continue;
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
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            70 => {
                _pixel_10 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_10;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            71 => {
                _pixel_11 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_11;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            72 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            73 => {
                _pixel_12 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_12;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            74 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 78;
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            78 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 85;
                        continue;
                    },
                    else => {
                        sdl_pc = 86;
                        continue;
                    },
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
                    sdl_pc = 87;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            82 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            83 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            84 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            85 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            86 => {
                pixelvalue = 0;
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
                    sdl_pc = 81;
                    continue;
                }
            },
            87 => {
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
                        sdl_pc = 102;
                        continue;
                    },
                }
            },
            90 => {
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
                    sdl_pc = 91;
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
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
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
                    sdl_pc = 94;
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
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
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
                    sdl_pc = 88;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            103 => {
                _pixel_17 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_17;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            104 => {
                _pixel_18 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_18;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            105 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            106 => {
                _pixel_19 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_19;
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            107 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, src.*)))) != ckey) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                sR = srcpal[src.*].r;
                sG = srcpal[src.*].g;
                sB = srcpal[src.*].b;
                sA = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, srcpal[src.*].a)))) *% A) / @as(c_uint, 255);
                {
                    sdl_pc = 111;
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
                src += 1;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            111 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 116;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 117;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 118;
                        continue;
                    },
                    else => {
                        sdl_pc = 119;
                        continue;
                    },
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
                    sdl_pc = 120;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            115 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            116 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            117 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            118 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 114;
                    continue;
                }
            },
            119 => {
                pixelvalue = 0;
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
                    sdl_pc = 114;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 123;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 136;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 137;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 138;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 139;
                        continue;
                    },
                    else => {
                        sdl_pc = 135;
                        continue;
                    },
                }
            },
            123 => {
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
                    sdl_pc = 129;
                    continue;
                }
            },
            129 => {
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
                    sdl_pc = 130;
                    continue;
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
                    sdl_pc = 132;
                    continue;
                }
            },
            132 => {
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
                    sdl_pc = 133;
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
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            136 => {
                _pixel_24 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_24;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            137 => {
                _pixel_25 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_25;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            138 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            139 => {
                _pixel_26 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_26;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const one_blit: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit1to1,
    Blit1to2,
    Blit1to3,
    Blit1to4,
};
pub const one_blitkey: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit1to1Key,
    Blit1to2Key,
    Blit1to3Key,
    Blit1to4Key,
};
pub export fn SDL_CalculateBlit1(surface: [*c]SDL_Surface) SDL_BlitFunc {
    @setEvalBranchQuota(100000);
    var which: c_int = undefined;
    _ = &which;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((if ((surface.*.map.info.dst_fmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.map.info.dst_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.map.info.dst_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                which = 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                which = if ((surface.*.map.info.dst_fmt.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.map.info.dst_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.map.info.dst_fmt.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.map.info.dst_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
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
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_COPY_COLORKEY | SDL_COPY_BLEND => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDL_COPY_BLEND => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDL_COPY_MODULATE_ALPHA | SDL_COPY_BLEND => {
                        sdl_pc = 21;
                        continue;
                    },
                    (SDL_COPY_COLORKEY | SDL_COPY_MODULATE_ALPHA) | SDL_COPY_BLEND => {
                        sdl_pc = 22;
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
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(one_blit)) / @sizeOf(@TypeOf(one_blit[@as(c_int, 0)])))) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return one_blit[@bitCast(@as(isize, @intCast(which)))];
            },
            7 => {
                {
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
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(one_blitkey)) / @sizeOf(@TypeOf(one_blitkey[@as(c_int, 0)])))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return one_blitkey[@bitCast(@as(isize, @intCast(which)))];
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                if (@as(c_int, surface.*.map.info.a) == @as(c_int, 255)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(one_blitkey)) / @sizeOf(@TypeOf(one_blitkey[@as(c_int, 0)])))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                return if (which >= @as(c_int, 2)) Blit1toNAlphaKey else @as(SDL_BlitFunc, null);
            },
            16 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            17 => {
                return one_blitkey[@bitCast(@as(isize, @intCast(which)))];
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
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
                return if (which >= @as(c_int, 2)) Blit1toNAlpha else @as(SDL_BlitFunc, null);
            },
            22 => {
                return if (which >= @as(c_int, 2)) Blit1toNAlphaKey else @as(SDL_BlitFunc, null);
            },
            else => unreachable,
        }
    }
}

pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const SDL_COPY_RLE_DESIRED = @as(c_int, 0x00001000);
pub const SDL_COPY_RLE_COLORKEY = @as(c_int, 0x00002000);
pub const SDL_COPY_RLE_ALPHAKEY = @as(c_int, 0x00004000);
