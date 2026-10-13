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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_BITMAPORDER_4321: c_int = 1;
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
pub inline fn BlitBto1(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var c: c_int = undefined;
    _ = &c;
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
    width = info.*.dst_w;
    height = info.*.dst_h;
    src = info.*.src;
    srcskip = info.*.src_skip;
    dst = info.*.dst;
    dstskip = info.*.dst_skip;
    map = info.*.table;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (map != null) {
        if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                    if (true) {
                        dst.* = map[bit];
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        } else {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                    if (true) {
                        dst.* = map[bit];
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        }
    } else {
        if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                    if (true) {
                        dst.* = bit;
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        } else {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                    if (true) {
                        dst.* = bit;
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        }
    }
}
pub inline fn BlitBto2(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var c: c_int = undefined;
    _ = &c;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var map: [*c]Uint16 = undefined;
    _ = &map;
    var dst: [*c]Uint16 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    width = info.*.dst_w;
    height = info.*.dst_h;
    src = info.*.src;
    srcskip = info.*.src_skip;
    dst = @ptrCast(@alignCast(info.*.dst));
    dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 2));
    map = @ptrCast(@alignCast(info.*.table));
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (true) {
                    dst.* = map[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dst += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (true) {
                    dst.* = map[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dst += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub inline fn BlitBto3(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var c: c_int = undefined;
    _ = &c;
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
    width = info.*.dst_w;
    height = info.*.dst_h;
    src = info.*.src;
    srcskip = info.*.src_skip;
    dst = info.*.dst;
    dstskip = info.*.dst_skip;
    map = info.*.table;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (true) {
                    o = @as(c_int, bit) * @as(c_int, 4);
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
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (true) {
                    o = @as(c_int, bit) * @as(c_int, 4);
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
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub inline fn BlitBto4(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
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
    var c: c_int = undefined;
    _ = &c;
    width = info.*.dst_w;
    height = info.*.dst_h;
    src = info.*.src;
    srcskip = info.*.src_skip;
    dst = @ptrCast(@alignCast(info.*.dst));
    dstskip = @divTrunc(info.*.dst_skip, @as(c_int, 4));
    map = @ptrCast(@alignCast(info.*.table));
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (true) {
                    dst.* = map[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dst += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (true) {
                    dst.* = map[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dst += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub inline fn BlitBto1Key(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var ckey: Uint32 = info.*.colorkey;
    _ = &ckey;
    var palmap: [*c]Uint8 = info.*.table;
    _ = &palmap;
    var c: c_int = undefined;
    _ = &c;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (palmap != null) {
        if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                    if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                        dst.* = palmap[bit];
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        } else {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                    if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                        dst.* = palmap[bit];
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        }
    } else {
        if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                    if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                        dst.* = bit;
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        } else {
            while ((blk: {
                const ref = &height;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                var byte: Uint8 = 0;
                _ = &byte;
                var bit: Uint8 = undefined;
                _ = &bit;
                {
                    c = 0;
                    while (c < info.*.leading_skip) : (c += 1) {
                        if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                            byte = (blk: {
                                const ref = &src;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).*;
                        }
                        {
                            const ref = &byte;
                            ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                        }
                    }
                }
                while (c < width) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                    if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                        dst.* = bit;
                    }
                    dst += 1;
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        }
    }
}
pub inline fn BlitBto2Key(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var dstp: [*c]Uint16 = @ptrCast(@alignCast(info.*.dst));
    _ = &dstp;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var ckey: Uint32 = info.*.colorkey;
    _ = &ckey;
    var palmap: [*c]Uint8 = info.*.table;
    _ = &palmap;
    var c: c_int = undefined;
    _ = &c;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    {
        const ref = &dstskip;
        ref.* = @divTrunc(ref.*, @as(c_int, 2));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    dstp.* = @as([*c]Uint16, @ptrCast(@alignCast(palmap)))[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dstp += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    dstp.* = @as([*c]Uint16, @ptrCast(@alignCast(palmap)))[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dstp += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub inline fn BlitBto3Key(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var dst: [*c]Uint8 = info.*.dst;
    _ = &dst;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var ckey: Uint32 = info.*.colorkey;
    _ = &ckey;
    var palmap: [*c]Uint8 = info.*.table;
    _ = &palmap;
    var c: c_int = undefined;
    _ = &c;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(&palmap[@bitCast(@as(isize, @intCast(@as(c_int, bit) * @as(c_int, 4))))])), 3);
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(&palmap[@bitCast(@as(isize, @intCast(@as(c_int, bit) * @as(c_int, 4))))])), 3);
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 3)))));
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub inline fn BlitBto4Key(info: [*c]SDL_BlitInfo, srcbpp: Uint32) void {
    @setEvalBranchQuota(100000);
    _ = &srcbpp;
    const mask: Uint32 = (@as(Uint32, 1) << @intCast(srcbpp)) -% @as(Uint32, 1);
    _ = &mask;
    const @"align": Uint32 = (@as(Uint32, 8) / srcbpp) -% @as(Uint32, 1);
    _ = &@"align";
    var width: c_int = info.*.dst_w;
    _ = &width;
    var height: c_int = info.*.dst_h;
    _ = &height;
    var src: [*c]Uint8 = info.*.src;
    _ = &src;
    var dstp: [*c]Uint32 = @ptrCast(@alignCast(info.*.dst));
    _ = &dstp;
    var srcskip: c_int = info.*.src_skip;
    _ = &srcskip;
    var dstskip: c_int = info.*.dst_skip;
    _ = &dstskip;
    var ckey: Uint32 = info.*.colorkey;
    _ = &ckey;
    var palmap: [*c]Uint8 = info.*.table;
    _ = &palmap;
    var c: c_int = undefined;
    _ = &c;
    width += info.*.leading_skip;
    if (srcbpp == @as(Uint32, 4)) {
        srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
    } else if (srcbpp == @as(Uint32, 2)) {
        srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
    } else if (srcbpp == @as(Uint32, 1)) {
        srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
    }
    {
        const ref = &dstskip;
        ref.* = @divTrunc(ref.*, @as(c_int, 4));
    }
    if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    dstp.* = @as([*c]Uint32, @ptrCast(@alignCast(palmap)))[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) >> @intCast(srcbpp));
                }
                dstp += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    } else {
        while ((blk: {
            const ref = &height;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var byte: Uint8 = 0;
            _ = &byte;
            var bit: Uint8 = undefined;
            _ = &bit;
            {
                c = 0;
                while (c < info.*.leading_skip) : (c += 1) {
                    if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                        byte = (blk: {
                            const ref = &src;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    {
                        const ref = &byte;
                        ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                    }
                }
            }
            while (c < width) : (c += 1) {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    byte = (blk: {
                        const ref = &src;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).*;
                }
                bit = @truncate((@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) >> @intCast(@as(Uint32, 8) -% srcbpp)) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    dstp.* = @as([*c]Uint32, @ptrCast(@alignCast(palmap)))[bit];
                }
                {
                    const ref = &byte;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) << @intCast(srcbpp));
                }
                dstp += 1;
            }
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dstp += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
    }
}
pub fn BlitBtoNAlpha(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcpal: [*c]const SDL_Color = undefined;
    _ = &srcpal;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var c: c_int = undefined;
    _ = &c;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var mask: Uint32 = undefined;
    _ = &mask;
    var @"align": Uint32 = undefined;
    _ = &@"align";
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
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
    var byte: Uint8 = undefined;
    _ = &byte;
    var bit: Uint8 = undefined;
    _ = &bit;
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
    var byte_6: Uint8 = undefined;
    _ = &byte_6;
    var bit_7: Uint8 = undefined;
    _ = &bit_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var x_11: Uint16 = undefined;
    _ = &x_11;
    var _pixel_12: Uint8 = undefined;
    _ = &_pixel_12;
    var _pixel_13: Uint16 = undefined;
    _ = &_pixel_13;
    var _pixel_14: Uint32 = undefined;
    _ = &_pixel_14;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                dst = info.*.dst;
                srcskip = info.*.src_skip;
                dstskip = info.*.dst_skip;
                srcpal = info.*.src_pal.*.colors;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                A = info.*.a;
                width += info.*.leading_skip;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                if (srcbpp == @as(c_int, 4)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (srcbpp == @as(c_int, 2)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                mask = @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(srcbpp)) - @as(c_int, 1)));
                @"align" = @bitCast(@as(c_int, @divTrunc(@as(c_int, 8), srcbpp) - @as(c_int, 1)));
                if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            4 => {
                srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (srcbpp == @as(c_int, 1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            12 => {
                {}
            },
            13 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                byte = 0;
                c = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (c < info.*.leading_skip) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                c += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                byte = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                {
                    const ref = &byte;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(srcbpp))));
                }
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                if (c < width) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                c += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            27 => {
                byte = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (true) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                sR = srcpal[bit].r;
                sG = srcpal[bit].g;
                sB = srcpal[bit].b;
                {
                    sdl_pc = 33;
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
                {
                    const ref = &byte;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(srcbpp))));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
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
                        sdl_pc = 41;
                        continue;
                    },
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
                    sdl_pc = 42;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            37 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
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
                    sdl_pc = 36;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 61;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            45 => {
                x = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
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
                    sdl_pc = 46;
                    continue;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                x_1 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
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
                    sdl_pc = 49;
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
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                x_2 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
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
                x_3 = @truncate(((@as(c_uint, 255) -% dA) *% A) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
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
                    sdl_pc = 43;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            58 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            59 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            60 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            61 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            62 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                byte_6 = 0;
                c = 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            65 => {
                if (c < info.*.leading_skip) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                c += 1;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                byte_6 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                {
                    const ref = &byte_6;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(srcbpp))));
                }
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            72 => {
                if (c < width) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                c += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            75 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            76 => {
                byte_6 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                bit_7 = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte_6) >> @intCast(@as(c_int, 8) - srcbpp)))) & mask);
                if (true) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sR = srcpal[bit_7].r;
                sG = srcpal[bit_7].g;
                sB = srcpal[bit_7].b;
                {
                    sdl_pc = 82;
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
                {
                    const ref = &byte_6;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(srcbpp))));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            82 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 89;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            83 => {
                if (false) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            86 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            87 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            88 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            90 => {
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
                    sdl_pc = 85;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 94;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 108;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 110;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
                        continue;
                    },
                }
            },
            94 => {
                x_8 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if (false) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 96;
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
                x_9 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                if (false) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 99;
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
                x_10 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                if (false) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 102;
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
                x_11 = @truncate(((@as(c_uint, 255) -% dA) *% A) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_11;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_11;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_11) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_11) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                if (false) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            107 => {
                _pixel_12 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_12;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            108 => {
                _pixel_13 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_13;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            110 => {
                _pixel_14 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_14;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn BlitBtoNAlphaKey(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    var srcfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &srcfmt;
    var dstfmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dstfmt;
    var srcpal: [*c]const SDL_Color = undefined;
    _ = &srcpal;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var c: c_int = undefined;
    _ = &c;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var mask: Uint32 = undefined;
    _ = &mask;
    var @"align": Uint32 = undefined;
    _ = &@"align";
    var sR: c_uint = undefined;
    _ = &sR;
    var sG: c_uint = undefined;
    _ = &sG;
    var sB: c_uint = undefined;
    _ = &sB;
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
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var byte: Uint8 = undefined;
    _ = &byte;
    var bit: Uint8 = undefined;
    _ = &bit;
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
    var byte_6: Uint8 = undefined;
    _ = &byte_6;
    var bit_7: Uint8 = undefined;
    _ = &bit_7;
    var x_8: Uint16 = undefined;
    _ = &x_8;
    var x_9: Uint16 = undefined;
    _ = &x_9;
    var x_10: Uint16 = undefined;
    _ = &x_10;
    var x_11: Uint16 = undefined;
    _ = &x_11;
    var _pixel_12: Uint8 = undefined;
    _ = &_pixel_12;
    var _pixel_13: Uint16 = undefined;
    _ = &_pixel_13;
    var _pixel_14: Uint32 = undefined;
    _ = &_pixel_14;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                width = info.*.dst_w;
                height = info.*.dst_h;
                src = info.*.src;
                dst = info.*.dst;
                srcskip = info.*.src_skip;
                dstskip = info.*.dst_skip;
                srcfmt = info.*.src_fmt;
                dstfmt = info.*.dst_fmt;
                srcpal = info.*.src_pal.*.colors;
                A = info.*.a;
                ckey = info.*.colorkey;
                width += info.*.leading_skip;
                srcbpp = srcfmt.*.bytes_per_pixel;
                dstbpp = dstfmt.*.bytes_per_pixel;
                if (srcbpp == @as(c_int, 4)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                srcskip += width - @divTrunc(width + @as(c_int, 1), @as(c_int, 2));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (srcbpp == @as(c_int, 2)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                mask = @bitCast(@as(c_int, (@as(c_int, 1) << @intCast(srcbpp)) - @as(c_int, 1)));
                @"align" = @bitCast(@as(c_int, @divTrunc(@as(c_int, 8), srcbpp) - @as(c_int, 1)));
                if (((info.*.src_fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_BITMAPORDER_4321)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            4 => {
                srcskip += width - @divTrunc(width + @as(c_int, 3), @as(c_int, 4));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                if (srcbpp == @as(c_int, 1)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                srcskip += width - @divTrunc(width + @as(c_int, 7), @as(c_int, 8));
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            12 => {
                {}
            },
            13 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                byte = 0;
                c = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                if (c < info.*.leading_skip) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                c += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                byte = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                {
                    const ref = &byte;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(srcbpp))));
                }
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                if (c < width) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                c += 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            27 => {
                byte = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                bit = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte)))) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit)))) != ckey) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                sR = srcpal[bit].r;
                sG = srcpal[bit].g;
                sB = srcpal[bit].b;
                {
                    sdl_pc = 33;
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
                {
                    const ref = &byte;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) >> @intCast(srcbpp))));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            33 => {
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
                        sdl_pc = 41;
                        continue;
                    },
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
                    sdl_pc = 42;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            37 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            38 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            39 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
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
                    sdl_pc = 36;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                if (false) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 61;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            45 => {
                x = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
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
                    sdl_pc = 46;
                    continue;
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
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                x_1 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
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
                    sdl_pc = 49;
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
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                x_2 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
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
                x_3 = @truncate(((@as(c_uint, 255) -% dA) *% A) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
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
                    sdl_pc = 43;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            58 => {
                _pixel = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            59 => {
                _pixel_4 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            60 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            61 => {
                _pixel_5 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            62 => {
                if ((blk: {
                    const ref = &height;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                byte_6 = 0;
                c = 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            65 => {
                if (c < info.*.leading_skip) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                c += 1;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                byte_6 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                {
                    const ref = &byte_6;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(srcbpp))));
                }
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            72 => {
                if (c < width) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (!((@as(Uint32, @bitCast(@as(c_int, c))) & @"align") != 0)) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            74 => {
                c += 1;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            75 => {
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            76 => {
                byte_6 = (blk: {
                    const ref = &src;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
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
                bit_7 = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, byte_6) >> @intCast(@as(c_int, 8) - srcbpp)))) & mask);
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bit_7)))) != ckey) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                sR = srcpal[bit_7].r;
                sG = srcpal[bit_7].g;
                sB = srcpal[bit_7].b;
                {
                    sdl_pc = 82;
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
                {
                    const ref = &byte_6;
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(srcbpp))));
                }
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            82 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 89;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            83 => {
                if (false) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            86 => {
                pixelvalue = dst.*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            87 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            88 => {
                pixelvalue = 0;
                dR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).*;
                dG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).*;
                dB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).*;
                dA = 255;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dR = SDL_expand_byte[dstfmt.*.Rbits][(pixelvalue & dstfmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))];
                dG = SDL_expand_byte[dstfmt.*.Gbits][(pixelvalue & dstfmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift)))))];
                dB = SDL_expand_byte[dstfmt.*.Bbits][(pixelvalue & dstfmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift)))))];
                dA = SDL_expand_byte[dstfmt.*.Abits][(pixelvalue & dstfmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))];
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            90 => {
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
                    sdl_pc = 85;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 94;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 108;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 110;
                        continue;
                    },
                    else => {
                        sdl_pc = 106;
                        continue;
                    },
                }
            },
            94 => {
                x_8 = @truncate(((sR -% dR) *% A) +% ((dR << @intCast(@as(c_uint, 8))) -% dR));
                {
                    const ref = &x_8;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_8;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_8) >> @intCast(@as(c_int, 8))))));
                }
                dR = @bitCast(@as(c_int, @as(c_int, x_8) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if (false) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 96;
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
                x_9 = @truncate(((sG -% dG) *% A) +% ((dG << @intCast(@as(c_uint, 8))) -% dG));
                {
                    const ref = &x_9;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_9;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_9) >> @intCast(@as(c_int, 8))))));
                }
                dG = @bitCast(@as(c_int, @as(c_int, x_9) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                if (false) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 99;
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
                x_10 = @truncate(((sB -% dB) *% A) +% ((dB << @intCast(@as(c_uint, 8))) -% dB));
                {
                    const ref = &x_10;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_10;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_10) >> @intCast(@as(c_int, 8))))));
                }
                dB = @bitCast(@as(c_int, @as(c_int, x_10) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                if (false) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 102;
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
                x_11 = @truncate(((@as(c_uint, 255) -% dA) *% A) +% ((dA << @intCast(@as(c_uint, 8))) -% dA));
                {
                    const ref = &x_11;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) +% @as(c_uint, 1));
                }
                {
                    const ref = &x_11;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) + (@as(c_int, x_11) >> @intCast(@as(c_int, 8))))));
                }
                dA = @bitCast(@as(c_int, @as(c_int, x_11) >> @intCast(@as(c_int, 8))));
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            104 => {
                if (false) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 81;
                    continue;
                }
            },
            107 => {
                _pixel_12 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                dst.* = _pixel_12;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            108 => {
                _pixel_13 = @truncate(((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_13;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            109 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dstfmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dB);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            110 => {
                _pixel_14 = ((((dR >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Rbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Rshift)))))) | ((dG >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Gbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Gshift))))))) | ((dB >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Bbits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Bshift))))))) | ((dA >> @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dstfmt.*.Abits)))))) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, dstfmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_14;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Blit1bto1(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1(info, 1);
}
pub fn Blit1bto2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2(info, 1);
}
pub fn Blit1bto3(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3(info, 1);
}
pub fn Blit1bto4(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4(info, 1);
}
pub const bitmap_blit_1b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit1bto1,
    Blit1bto2,
    Blit1bto3,
    Blit1bto4,
};
pub fn Blit1bto1Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1Key(info, 1);
}
pub fn Blit1bto2Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2Key(info, 1);
}
pub fn Blit1bto3Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3Key(info, 1);
}
pub fn Blit1bto4Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4Key(info, 1);
}
pub const colorkey_blit_1b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit1bto1Key,
    Blit1bto2Key,
    Blit1bto3Key,
    Blit1bto4Key,
};
pub fn Blit2bto1(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1(info, 2);
}
pub fn Blit2bto2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2(info, 2);
}
pub fn Blit2bto3(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3(info, 2);
}
pub fn Blit2bto4(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4(info, 2);
}
pub const bitmap_blit_2b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit2bto1,
    Blit2bto2,
    Blit2bto3,
    Blit2bto4,
};
pub fn Blit2bto1Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1Key(info, 2);
}
pub fn Blit2bto2Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2Key(info, 2);
}
pub fn Blit2bto3Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3Key(info, 2);
}
pub fn Blit2bto4Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4Key(info, 2);
}
pub const colorkey_blit_2b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit2bto1Key,
    Blit2bto2Key,
    Blit2bto3Key,
    Blit2bto4Key,
};
pub fn Blit4bto1(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1(info, 4);
}
pub fn Blit4bto2(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2(info, 4);
}
pub fn Blit4bto3(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3(info, 4);
}
pub fn Blit4bto4(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4(info, 4);
}
pub const bitmap_blit_4b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit4bto1,
    Blit4bto2,
    Blit4bto3,
    Blit4bto4,
};
pub fn Blit4bto1Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto1Key(info, 4);
}
pub fn Blit4bto2Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto2Key(info, 4);
}
pub fn Blit4bto3Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto3Key(info, 4);
}
pub fn Blit4bto4Key(info: [*c]SDL_BlitInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    BlitBto4Key(info, 4);
}
pub const colorkey_blit_4b: [5]SDL_BlitFunc = [5]SDL_BlitFunc{
    null,
    Blit4bto1Key,
    Blit4bto2Key,
    Blit4bto3Key,
    Blit4bto4Key,
};
pub export fn SDL_CalculateBlit0(surface: [*c]SDL_Surface) SDL_BlitFunc {
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
                if (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (surface.*.map.info.flags & ~((SDL_COPY_RLE_DESIRED | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)) {
                    @as(c_int, 0) => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDL_COPY_COLORKEY => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_COPY_MODULATE_ALPHA | SDL_COPY_BLEND => {
                        sdl_pc = 16;
                        continue;
                    },
                    (SDL_COPY_COLORKEY | SDL_COPY_MODULATE_ALPHA) | SDL_COPY_BLEND => {
                        sdl_pc = 17;
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
                if (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            7 => {
                return null;
            },
            8 => {
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(bitmap_blit_1b)) / @sizeOf(@TypeOf(bitmap_blit_1b[@as(c_int, 0)])))) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                return bitmap_blit_1b[@bitCast(@as(isize, @intCast(which)))];
            },
            10 => {
                {
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
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(colorkey_blit_1b)) / @sizeOf(@TypeOf(colorkey_blit_1b[@as(c_int, 0)])))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                return colorkey_blit_1b[@bitCast(@as(isize, @intCast(which)))];
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlpha else @as(SDL_BlitFunc, null);
            },
            17 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlphaKey else @as(SDL_BlitFunc, null);
            },
            18 => {
                switch (surface.*.map.info.flags & ~((SDL_COPY_RLE_DESIRED | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)) {
                    @as(c_int, 0) => {
                        sdl_pc = 22;
                        continue;
                    },
                    SDL_COPY_COLORKEY => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDL_COPY_MODULATE_ALPHA | SDL_COPY_BLEND => {
                        sdl_pc = 30;
                        continue;
                    },
                    (SDL_COPY_COLORKEY | SDL_COPY_MODULATE_ALPHA) | SDL_COPY_BLEND => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            21 => {
                return null;
            },
            22 => {
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(bitmap_blit_2b)) / @sizeOf(@TypeOf(bitmap_blit_2b[@as(c_int, 0)])))) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                return bitmap_blit_2b[@bitCast(@as(isize, @intCast(which)))];
            },
            24 => {
                {
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
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(colorkey_blit_2b)) / @sizeOf(@TypeOf(colorkey_blit_2b[@as(c_int, 0)])))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                return colorkey_blit_2b[@bitCast(@as(isize, @intCast(which)))];
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            30 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlpha else @as(SDL_BlitFunc, null);
            },
            31 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlphaKey else @as(SDL_BlitFunc, null);
            },
            32 => {
                switch (surface.*.map.info.flags & ~((SDL_COPY_RLE_DESIRED | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)) {
                    @as(c_int, 0) => {
                        sdl_pc = 36;
                        continue;
                    },
                    SDL_COPY_COLORKEY => {
                        sdl_pc = 40;
                        continue;
                    },
                    SDL_COPY_MODULATE_ALPHA | SDL_COPY_BLEND => {
                        sdl_pc = 44;
                        continue;
                    },
                    (SDL_COPY_COLORKEY | SDL_COPY_MODULATE_ALPHA) | SDL_COPY_BLEND => {
                        sdl_pc = 45;
                        continue;
                    },
                    else => {
                        sdl_pc = 35;
                        continue;
                    },
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                return null;
            },
            35 => {
                return null;
            },
            36 => {
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(bitmap_blit_4b)) / @sizeOf(@TypeOf(bitmap_blit_4b[@as(c_int, 0)])))) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                return bitmap_blit_4b[@bitCast(@as(isize, @intCast(which)))];
            },
            38 => {
                {
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
                if (@as(c_ulong, @bitCast(@as(c_long, which))) < (@sizeOf(@TypeOf(colorkey_blit_4b)) / @sizeOf(@TypeOf(colorkey_blit_4b[@as(c_int, 0)])))) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                return colorkey_blit_4b[@bitCast(@as(isize, @intCast(which)))];
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            44 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlpha else @as(SDL_BlitFunc, null);
            },
            45 => {
                return if (which >= @as(c_int, 2)) BlitBtoNAlphaKey else @as(SDL_BlitFunc, null);
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
