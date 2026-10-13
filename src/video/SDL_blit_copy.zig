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
pub const __builtin = @import("translation_builtins");
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
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
pub fn SDL_memcpySSE(arg_dst: [*c]Uint8, arg_src: [*c]const Uint8, len: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var dst = arg_dst;
    _ = &dst;
    var src = arg_src;
    _ = &src;
    var i: c_int = undefined;
    _ = &i;
    var values: [4]__m128 = undefined;
    _ = &values;
    {
        i = @divTrunc(len, @as(c_int, 64));
        while ((blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            __builtin.prefetch(@as(?*const anyopaque, @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(src)))))), (_MM_HINT_NTA >> @intCast(@as(c_int, 2))) & @as(c_int, 1), _MM_HINT_NTA & @as(c_int, 3));
            values[@as(c_int, 0)] = @as([*c]__m128, @ptrCast(@alignCast(@constCast(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0))))))))).*;
            values[@as(c_int, 1)] = @as([*c]__m128, @ptrCast(@alignCast(@constCast(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16))))))))).*;
            values[@as(c_int, 2)] = @as([*c]__m128, @ptrCast(@alignCast(@constCast(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32))))))))).*;
            values[@as(c_int, 3)] = @as([*c]__m128, @ptrCast(@alignCast(@constCast(src + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48))))))))).*;
            _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0)))))))))), values[@as(c_int, 0)]);
            _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 16)))))))))), values[@as(c_int, 1)]);
            _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 32)))))))))), values[@as(c_int, 2)]);
            _mm_stream_ps(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(dst + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 48)))))))))), values[@as(c_int, 3)]);
            src += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64)))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 64)))));
        }
    }
    if ((len & @as(c_int, 63)) != 0) {
        _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, len & @as(c_int, 63))));
    }
}
pub export fn SDL_BlitCopy(info: [*c]SDL_BlitInfo) void {
    @setEvalBranchQuota(100000);
    var overlap: bool = undefined;
    _ = &overlap;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var srcskip: c_int = undefined;
    _ = &srcskip;
    var dstskip: c_int = undefined;
    _ = &dstskip;
    w = info.*.dst_w * @as(c_int, info.*.dst_fmt.*.bytes_per_pixel);
    h = info.*.dst_h;
    src = info.*.src;
    dst = info.*.dst;
    srcskip = info.*.src_pitch;
    dstskip = info.*.dst_pitch;
    if (src < dst) {
        overlap = dst < (src + @as(usize, @bitCast(@as(isize, @intCast(h * srcskip)))));
    } else {
        overlap = src < (dst + @as(usize, @bitCast(@as(isize, @intCast(h * dstskip)))));
    }
    if (overlap) {
        if (dst < src) {
            while ((blk: {
                const ref = &h;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                _ = memmove(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, w)));
                src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        } else {
            src += @as(usize, @bitCast(@as(isize, @intCast((h - @as(c_int, 1)) * srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast((h - @as(c_int, 1)) * dstskip))));
            while ((blk: {
                const ref = &h;
                const tmp = ref.*;
                ref.* -= 1;
                break :blk tmp;
            }) != 0) {
                _ = memmove(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, w)));
                src -= @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
                dst -= @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
            }
        }
        return;
    }
    if ((((SDL_HasSSE_REAL() and !((@as(usize, @intCast(@intFromPtr(src))) & @as(usize, 15)) != 0)) and !((srcskip & @as(c_int, 15)) != 0)) and !((@as(usize, @intCast(@intFromPtr(dst))) & @as(usize, 15)) != 0)) and !((dstskip & @as(c_int, 15)) != 0)) {
        while ((blk: {
            const ref = &h;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            SDL_memcpySSE(dst, src, w);
            src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
        }
        return;
    }
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, w)));
        src += @as(usize, @bitCast(@as(isize, @intCast(srcskip))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(dstskip))));
    }
}

pub const _MM_HINT_NTA = @as(c_int, 0);
