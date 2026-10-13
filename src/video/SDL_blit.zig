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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
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
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
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
pub const SDL_BlitFunc = ?*const fn (info: [*c]SDL_BlitInfo) callconv(.c) void;
pub const SDL_BlitFuncEntry = extern struct {
    src_format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    dst_format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    flags: c_int = 0,
    func: SDL_BlitFunc = null,
};
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
pub export fn SDL_CalculateBlit(surface: [*c]SDL_Surface, dst: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "SDL_CalculateBlit".*;
    };
    _ = &static_local___func__;
    var blit: SDL_BlitFunc = null;
    _ = &blit;
    var map: [*c]SDL_BlitMap = &surface.*.map;
    _ = &map;
    var src_colorspace: SDL_Colorspace = surface.*.colorspace;
    _ = &src_colorspace;
    var dst_colorspace: SDL_Colorspace = dst.*.colorspace;
    _ = &dst_colorspace;
    if ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
        SDL_InvalidateMap(map);
        return SDL_SetError_REAL("Blit combination not supported");
    }
    while (true) {
        while (!!((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!(surface->internal_flags & 0x00000004u)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_blit.c", 152);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    map.*.blit = SDL_SoftBlit;
    map.*.info.src_surface = surface;
    map.*.info.src_fmt = surface.*.fmt;
    map.*.info.src_pal = surface.*.palette;
    map.*.info.dst_surface = dst;
    map.*.info.dst_fmt = dst.*.fmt;
    map.*.info.dst_pal = dst.*.palette;
    if ((map.*.info.flags & SDL_COPY_RLE_DESIRED) != 0) {
        if (SDL_RLESurface(surface)) {
            return @"true" != 0;
        }
    }
    if (!(blit != null)) {
        if (((src_colorspace != dst_colorspace) or ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 4))) or ((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 4))) {
            blit = SDL_Blit_Slow_Float;
        }
    }
    if (!(blit != null)) {
        if ((map.*.identity != 0) and !((map.*.info.flags & ~SDL_COPY_RLE_DESIRED) != 0)) {
            blit = SDL_BlitCopy;
        } else if ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) or (!((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) {
            blit = SDL_Blit_Slow;
        } else if (((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) and (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
            blit = SDL_CalculateBlit0(surface);
        } else if (((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 1)) and (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
            blit = SDL_CalculateBlit1(surface);
        } else if ((map.*.info.flags & SDL_COPY_BLEND) != 0) {
            blit = SDL_CalculateBlitA(surface);
        } else {
            blit = SDL_CalculateBlitN(surface);
        }
    }
    if (!(blit != null)) {
        var src_format: SDL_PixelFormat = surface.*.format;
        _ = &src_format;
        var dst_format: SDL_PixelFormat = dst.*.format;
        _ = &dst_format;
        blit = SDL_ChooseBlitFunc(src_format, dst_format, map.*.info.flags, SDL_GeneratedBlitFuncTable);
    }
    if (!(blit != null)) {
        var src_format: SDL_PixelFormat = surface.*.format;
        _ = &src_format;
        var dst_format: SDL_PixelFormat = dst.*.format;
        _ = &dst_format;
        if ((((!(!((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((src_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((src_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((src_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((src_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) or ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) and (surface.*.palette != null))) and !((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) and (!(!((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((dst_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((dst_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((dst_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((dst_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) or ((dst_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) and (dst.*.palette != null)))) and !((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
            blit = SDL_Blit_Slow;
        }
    }
    map.*.data = @ptrCast(@alignCast(@constCast(blit)));
    if (!(blit != null)) {
        SDL_InvalidateMap(map);
        return SDL_SetError_REAL("Blit combination not supported");
    }
    return @"true" != 0;
}

pub extern fn SDL_CalculateBlit0(surface: [*c]SDL_Surface) SDL_BlitFunc;
pub extern fn SDL_CalculateBlit1(surface: [*c]SDL_Surface) SDL_BlitFunc;
pub extern fn SDL_CalculateBlitN(surface: [*c]SDL_Surface) SDL_BlitFunc;
pub extern fn SDL_CalculateBlitA(surface: [*c]SDL_Surface) SDL_BlitFunc;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_COPY_MODULATE_COLOR = @as(c_int, 0x00000001);
pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_BLEND_PREMULTIPLIED = @as(c_int, 0x00000020);
pub const SDL_COPY_ADD = @as(c_int, 0x00000040);
pub const SDL_COPY_ADD_PREMULTIPLIED = @as(c_int, 0x00000080);
pub const SDL_COPY_MOD = @as(c_int, 0x00000100);
pub const SDL_COPY_MUL = @as(c_int, 0x00000200);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const SDL_COPY_NEAREST = @as(c_int, 0x00000800);
pub const SDL_COPY_RLE_DESIRED = @as(c_int, 0x00001000);
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_GeneratedBlitFuncTable: [*c]SDL_BlitFuncEntry = @extern([*c]SDL_BlitFuncEntry, .{
    .name = "SDL_GeneratedBlitFuncTable",
});
pub extern fn SDL_BlitCopy(info: [*c]SDL_BlitInfo) void;
pub extern fn SDL_Blit_Slow(info: [*c]SDL_BlitInfo) void;
pub extern fn SDL_Blit_Slow_Float(info: [*c]SDL_BlitInfo) void;
pub extern fn SDL_RLESurface(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_InvalidateMap(map: [*c]SDL_BlitMap) void;
pub fn SDL_SoftBlit(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var okay: bool = undefined;
    _ = &okay;
    var src_locked: c_int = undefined;
    _ = &src_locked;
    var dst_locked: c_int = undefined;
    _ = &dst_locked;
    okay = @"true" != 0;
    dst_locked = 0;
    if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(dst)) {
            okay = @"false" != 0;
        } else {
            dst_locked = 1;
        }
    }
    src_locked = 0;
    if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(src)) {
            okay = @"false" != 0;
        } else {
            src_locked = 1;
        }
    }
    if (okay) {
        var RunBlit: SDL_BlitFunc = undefined;
        _ = &RunBlit;
        var info: [*c]SDL_BlitInfo = &src.*.map.info;
        _ = &info;
        if (@as(c_int, info.*.src_fmt.*.bits_per_pixel) >= @as(c_int, 8)) {
            info.*.src = (@as([*c]Uint8, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.y * src.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.x * @as(c_int, info.*.src_fmt.*.bytes_per_pixel)))));
        } else {
            info.*.src = (@as([*c]Uint8, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.y * src.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(srcrect.*.x * @as(c_int, info.*.src_fmt.*.bits_per_pixel), @as(c_int, 8))))));
            info.*.leading_skip = @divTrunc(__helpers.signedRemainder(srcrect.*.x * @as(c_int, info.*.src_fmt.*.bits_per_pixel), @as(c_int, 8)), @as(c_int, info.*.src_fmt.*.bits_per_pixel));
        }
        info.*.src_w = srcrect.*.w;
        info.*.src_h = srcrect.*.h;
        info.*.src_pitch = src.*.pitch;
        info.*.src_skip = info.*.src_pitch - (info.*.src_w * @as(c_int, info.*.src_fmt.*.bytes_per_pixel));
        info.*.dst = (@as([*c]Uint8, @ptrCast(@alignCast(dst.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.y * dst.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(dstrect.*.x * @as(c_int, info.*.dst_fmt.*.bytes_per_pixel)))));
        info.*.dst_w = dstrect.*.w;
        info.*.dst_h = dstrect.*.h;
        info.*.dst_pitch = dst.*.pitch;
        info.*.dst_skip = info.*.dst_pitch - (info.*.dst_w * @as(c_int, info.*.dst_fmt.*.bytes_per_pixel));
        RunBlit = @ptrCast(@alignCast(src.*.map.data));
        RunBlit.?(info);
    }
    if (dst_locked != 0) {
        SDL_UnlockSurface_REAL(dst);
    }
    if (src_locked != 0) {
        SDL_UnlockSurface_REAL(src);
    }
    return okay;
}
pub fn SDL_ChooseBlitFunc(src_format: SDL_PixelFormat, dst_format: SDL_PixelFormat, flags: c_int, entries: [*c]SDL_BlitFuncEntry) callconv(.c) SDL_BlitFunc {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var flagcheck: c_int = flags & ((((SDL_COPY_MODULATE_COLOR | SDL_COPY_MODULATE_ALPHA) | (((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) | SDL_COPY_COLORKEY) | SDL_COPY_NEAREST);
    _ = &flagcheck;
    {
        i = 0;
        while (entries[@bitCast(@as(isize, @intCast(i)))].func != null) : (i += 1) {
            if (src_format != entries[@bitCast(@as(isize, @intCast(i)))].src_format) {
                continue;
            }
            if (dst_format != entries[@bitCast(@as(isize, @intCast(i)))].dst_format) {
                continue;
            }
            if ((flagcheck & entries[@bitCast(@as(isize, @intCast(i)))].flags) != flagcheck) {
                continue;
            }
            return entries[@bitCast(@as(isize, @intCast(i)))].func;
        }
    }
    return null;
}
pub const SDL_INTERNAL_SURFACE_RLEACCEL = @as(c_uint, 0x00000004);
