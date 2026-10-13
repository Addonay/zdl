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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_roundf_REAL(x: f32) f32;
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
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGB: c_int = 1;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGR: c_int = 4;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_XRGB2101010: c_int = 370614276;
pub const SDL_PIXELFORMAT_XBGR2101010: c_int = 374808580;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_ABGR2101010: c_int = 376905732;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_PRIMARIES_BT2020: c_int = 9;
pub const enum_SDL_ColorPrimaries = c_uint;
pub const SDL_ColorPrimaries = enum_SDL_ColorPrimaries;
pub const SDL_TRANSFER_CHARACTERISTICS_LINEAR: c_int = 8;
pub const SDL_TRANSFER_CHARACTERISTICS_SRGB: c_int = 13;
pub const SDL_TRANSFER_CHARACTERISTICS_PQ: c_int = 16;
pub const enum_SDL_TransferCharacteristics = c_uint;
pub const SDL_TransferCharacteristics = enum_SDL_TransferCharacteristics;
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
pub extern fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID;
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
pub extern fn SDL_GetSurfaceSDRWhitePoint(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32;
pub extern fn SDL_GetSurfaceHDRHeadroom(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32;
pub extern fn SDL_sRGBtoLinear(v: f32) f32;
pub extern fn SDL_sRGBfromLinear(v: f32) f32;
pub extern fn SDL_PQtoNits(v: f32) f32;
pub extern fn SDL_PQfromNits(v: f32) f32;
pub extern fn SDL_GetColorPrimariesConversionMatrix(src: SDL_ColorPrimaries, dst: SDL_ColorPrimaries) [*c]const f32;
pub extern fn SDL_ConvertColorPrimaries(fR: [*c]f32, fG: [*c]f32, fB: [*c]f32, matrix: [*c]const f32) void;
pub extern fn SDL_LookupRGBAColor(palette_map: ?*SDL_HashTable, pixelvalue: Uint32, pal: [*c]const SDL_Palette) Uint8;
pub const SlowBlitPixelAccess_Index8: c_int = 0;
pub const SlowBlitPixelAccess_RGB: c_int = 1;
pub const SlowBlitPixelAccess_RGBA: c_int = 2;
pub const SlowBlitPixelAccess_10Bit: c_int = 3;
pub const SlowBlitPixelAccess_Large: c_int = 4;
pub const SlowBlitPixelAccess = c_uint;
pub fn GetPixelAccessMethod(format: SDL_PixelFormat) callconv(.c) SlowBlitPixelAccess {
    @setEvalBranchQuota(100000);
    if ((if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 4)) {
        return SlowBlitPixelAccess_Large;
    } else if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
        return SlowBlitPixelAccess_10Bit;
    } else if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
        return SlowBlitPixelAccess_Index8;
    } else if (((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) {
        return SlowBlitPixelAccess_RGBA;
    } else {
        return SlowBlitPixelAccess_RGB;
    }
}
pub export fn SDL_Blit_Slow(info: [*c]SDL_BlitInfo) void {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    var modulateR: Uint32 = undefined;
    _ = &modulateR;
    var modulateG: Uint32 = undefined;
    _ = &modulateG;
    var modulateB: Uint32 = undefined;
    _ = &modulateB;
    var modulateA: Uint32 = undefined;
    _ = &modulateA;
    var srcpixel: Uint32 = undefined;
    _ = &srcpixel;
    var srcR: Uint32 = undefined;
    _ = &srcR;
    var srcG: Uint32 = undefined;
    _ = &srcG;
    var srcB: Uint32 = undefined;
    _ = &srcB;
    var srcA: Uint32 = undefined;
    _ = &srcA;
    var dstpixel: Uint32 = undefined;
    _ = &dstpixel;
    var dstR: Uint32 = undefined;
    _ = &dstR;
    var dstG: Uint32 = undefined;
    _ = &dstG;
    var dstB: Uint32 = undefined;
    _ = &dstB;
    var dstA: Uint32 = undefined;
    _ = &dstA;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var posy: Uint64 = undefined;
    _ = &posy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incy: Uint64 = undefined;
    _ = &incy;
    var incx: Uint64 = undefined;
    _ = &incx;
    var src_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &src_fmt;
    var src_pal: [*c]const SDL_Palette = undefined;
    _ = &src_pal;
    var dst_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dst_fmt;
    var dst_pal: [*c]const SDL_Palette = undefined;
    _ = &dst_pal;
    var palette_map: ?*SDL_HashTable = undefined;
    _ = &palette_map;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var src_access: SlowBlitPixelAccess = undefined;
    _ = &src_access;
    var dst_access: SlowBlitPixelAccess = undefined;
    _ = &dst_access;
    var rgbmask: Uint32 = undefined;
    _ = &rgbmask;
    var ckey: Uint32 = undefined;
    _ = &ckey;
    var last_pixel: Uint32 = undefined;
    _ = &last_pixel;
    var last_index: Uint8 = undefined;
    _ = &last_index;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var n: c_int = undefined;
    _ = &n;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_1: Uint16 = undefined;
    _ = &_pixel_1;
    var _pixel_2: Uint32 = undefined;
    _ = &_pixel_2;
    var _pixel_3: Uint8 = undefined;
    _ = &_pixel_3;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                flags = info.*.flags;
                modulateR = info.*.r;
                modulateG = info.*.g;
                modulateB = info.*.b;
                modulateA = info.*.a;
                srcpixel = 0;
                srcR = 0;
                srcG = 0;
                srcB = 0;
                srcA = 0;
                dstpixel = 0;
                dstR = 0;
                dstG = 0;
                dstB = 0;
                dstA = 0;
                src_fmt = info.*.src_fmt;
                src_pal = info.*.src_pal;
                dst_fmt = info.*.dst_fmt;
                dst_pal = info.*.dst_pal;
                palette_map = info.*.palette_map;
                srcbpp = src_fmt.*.bytes_per_pixel;
                dstbpp = dst_fmt.*.bytes_per_pixel;
                rgbmask = ~src_fmt.*.Amask;
                ckey = info.*.colorkey & rgbmask;
                last_pixel = 0;
                last_index = 0;
                src_access = GetPixelAccessMethod(src_fmt.*.format);
                dst_access = GetPixelAccessMethod(dst_fmt.*.format);
                if (dst_access == @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                last_index = SDL_LookupRGBAColor(palette_map, last_pixel, dst_pal);
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
                incy = if (info.*.dst_h != 0) (@as(Uint64, @bitCast(@as(c_long, info.*.src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, info.*.dst_h))) else @as(Uint64, 0);
                incx = if (info.*.dst_w != 0) (@as(Uint64, @bitCast(@as(c_long, info.*.src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, info.*.dst_w))) else @as(Uint64, 0);
                posy = incy / @as(Uint64, 2);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if ((blk: {
                    const ref = &info.*.dst_h;
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
                src = null;
                dst = info.*.dst;
                n = info.*.dst_w;
                posx = incx / @as(Uint64, 2);
                srcy = posy >> @intCast(@as(Uint64, 16));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {}
            },
            7 => {
                if ((blk: {
                    const ref = &n;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                srcx = posx >> @intCast(@as(Uint64, 16));
                src = (info.*.src + (srcy *% @as(Uint64, @bitCast(@as(c_long, info.*.src_pitch))))) + (srcx *% @as(Uint64, @bitCast(@as(c_long, srcbpp))));
                switch (src_access) {
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGB) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGBA) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_10Bit) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Large) => {
                        sdl_pc = 39;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            9 => {
                posy +%= incy;
                info.*.dst += @as(usize, @bitCast(@as(isize, @intCast(info.*.dst_pitch))));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                if ((flags & SDL_COPY_COLORKEY) != 0) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            11 => {
                srcpixel = src.*;
                srcR = src_pal.*.colors[srcpixel].r;
                srcG = src_pal.*.colors[srcpixel].g;
                srcB = src_pal.*.colors[srcpixel].b;
                srcA = src_pal.*.colors[srcpixel].a;
                {
                    sdl_pc = 10;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 21;
                        continue;
                    },
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
                srcA = 255;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                srcpixel = src.*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            18 => {
                srcpixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                srcpixel = 0;
                srcR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Rshift), @as(c_int, 8))))))).*;
                srcG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Gshift), @as(c_int, 8))))))).*;
                srcB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                srcpixel = 0;
                srcR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(Uint32, 0);
                        srcB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    srcG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 16;
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
                switch (srcbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 31;
                        continue;
                    },
                }
            },
            24 => {
                if (false) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                srcpixel = src.*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                srcpixel = @as([*c]Uint16, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                srcpixel = 0;
                srcR = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Rshift), @as(c_int, 8))))))).*;
                srcG = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Gshift), @as(c_int, 8))))))).*;
                srcB = (src + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, src_fmt.*.Bshift), @as(c_int, 8))))))).*;
                srcA = 255;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                srcR = SDL_expand_byte[src_fmt.*.Rbits][(srcpixel & src_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))];
                srcG = SDL_expand_byte[src_fmt.*.Gbits][(srcpixel & src_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift)))))];
                srcB = SDL_expand_byte[src_fmt.*.Bbits][(srcpixel & src_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift)))))];
                srcA = SDL_expand_byte[src_fmt.*.Abits][(srcpixel & src_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Ashift)))))];
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            31 => {
                srcpixel = 0;
                srcR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            srcA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        srcB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    srcG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            32 => {
                srcpixel = @as([*c]Uint32, @ptrCast(@alignCast(src))).*;
                switch (src_fmt.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 37;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            33 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            34 => {
                srcR = (srcpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                srcG = (srcpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                srcB = (srcpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                srcA = SDL_expand_byte[@as(c_int, 2)][srcpixel >> @intCast(@as(Uint32, 30))];
                srcA = 255;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            35 => {
                srcR = (srcpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                srcG = (srcpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                srcB = (srcpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                srcA = SDL_expand_byte[@as(c_int, 2)][srcpixel >> @intCast(@as(Uint32, 30))];
                srcA = 255;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                srcR = (srcpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                srcG = (srcpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                srcB = (srcpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                srcA = SDL_expand_byte[@as(c_int, 2)][srcpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            37 => {
                srcR = (srcpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                srcG = (srcpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                srcB = (srcpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                srcA = SDL_expand_byte[@as(c_int, 2)][srcpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            40 => {
                if (srcbpp == @as(c_int, 3)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
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
                if ((flags & (((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) != 0) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            43 => {
                srcpixel = ((srcR << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Rshift)))))) | (srcG << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Gshift))))))) | (srcB << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, src_fmt.*.Bshift))))));
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if ((srcpixel & rgbmask) == ckey) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                posx +%= incx;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            49 => {
                switch (dst_access) {
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGB) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGBA) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_10Bit) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Large) => {
                        sdl_pc = 81;
                        continue;
                    },
                    else => {
                        sdl_pc = 52;
                        continue;
                    },
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                if ((flags & SDL_COPY_MODULATE_COLOR) != 0) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            53 => {
                dstpixel = dst.*;
                dstR = dst_pal.*.colors[dstpixel].r;
                dstG = dst_pal.*.colors[dstpixel].g;
                dstB = dst_pal.*.colors[dstpixel].b;
                dstA = dst_pal.*.colors[dstpixel].a;
                {
                    sdl_pc = 52;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 62;
                        continue;
                    },
                    else => {
                        sdl_pc = 63;
                        continue;
                    },
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
                dstA = 255;
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                dstpixel = dst.*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            60 => {
                dstpixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            61 => {
                dstpixel = 0;
                dstR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).*;
                dstG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).*;
                dstB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            63 => {
                dstpixel = 0;
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(Uint32, 0);
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 58;
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
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 72;
                        continue;
                    },
                    else => {
                        sdl_pc = 73;
                        continue;
                    },
                }
            },
            66 => {
                if (false) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            69 => {
                dstpixel = dst.*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            70 => {
                dstpixel = @as([*c]Uint16, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                dstpixel = 0;
                dstR = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).*;
                dstG = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).*;
                dstB = (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).*;
                dstA = 255;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                dstR = SDL_expand_byte[dst_fmt.*.Rbits][(dstpixel & dst_fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))];
                dstG = SDL_expand_byte[dst_fmt.*.Gbits][(dstpixel & dst_fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift)))))];
                dstB = SDL_expand_byte[dst_fmt.*.Bbits][(dstpixel & dst_fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift)))))];
                dstA = SDL_expand_byte[dst_fmt.*.Abits][(dstpixel & dst_fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))];
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            73 => {
                dstpixel = 0;
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            dstA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            74 => {
                dstpixel = @as([*c]Uint32, @ptrCast(@alignCast(dst))).*;
                switch (dst_fmt.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 79;
                        continue;
                    },
                    else => {
                        sdl_pc = 80;
                        continue;
                    },
                }
            },
            75 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            76 => {
                dstR = (dstpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                dstG = (dstpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                dstB = (dstpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                dstA = SDL_expand_byte[@as(c_int, 2)][dstpixel >> @intCast(@as(Uint32, 30))];
                dstA = 255;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            77 => {
                dstR = (dstpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                dstG = (dstpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                dstB = (dstpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                dstA = SDL_expand_byte[@as(c_int, 2)][dstpixel >> @intCast(@as(Uint32, 30))];
                dstA = 255;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            78 => {
                dstR = (dstpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                dstG = (dstpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                dstB = (dstpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                dstA = SDL_expand_byte[@as(c_int, 2)][dstpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            79 => {
                dstR = (dstpixel >> @intCast(@as(Uint32, 2))) & @as(Uint32, 255);
                dstG = (dstpixel >> @intCast(@as(Uint32, 12))) & @as(Uint32, 255);
                dstB = (dstpixel >> @intCast(@as(Uint32, 22))) & @as(Uint32, 255);
                dstA = SDL_expand_byte[@as(c_int, 2)][dstpixel >> @intCast(@as(Uint32, 30))];
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            82 => {
                srcR = (srcR *% modulateR) / @as(Uint32, 255);
                srcG = (srcG *% modulateG) / @as(Uint32, 255);
                srcB = (srcB *% modulateB) / @as(Uint32, 255);
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
                if ((flags & SDL_COPY_MODULATE_ALPHA) != 0) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                srcA = (srcA *% modulateA) / @as(Uint32, 255);
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
                if ((flags & (SDL_COPY_BLEND | SDL_COPY_ADD)) != 0) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                if (srcA < @as(Uint32, 255)) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
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
                switch (flags & (((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) {
                    @as(c_int, 0) => {
                        sdl_pc = 95;
                        continue;
                    },
                    SDL_COPY_BLEND => {
                        sdl_pc = 96;
                        continue;
                    },
                    SDL_COPY_BLEND_PREMULTIPLIED => {
                        sdl_pc = 97;
                        continue;
                    },
                    SDL_COPY_ADD => {
                        sdl_pc = 110;
                        continue;
                    },
                    SDL_COPY_ADD_PREMULTIPLIED => {
                        sdl_pc = 111;
                        continue;
                    },
                    SDL_COPY_MOD => {
                        sdl_pc = 121;
                        continue;
                    },
                    SDL_COPY_MUL => {
                        sdl_pc = 122;
                        continue;
                    },
                    else => {
                        sdl_pc = 94;
                        continue;
                    },
                }
            },
            91 => {
                srcR = (srcR *% srcA) / @as(Uint32, 255);
                srcG = (srcG *% srcA) / @as(Uint32, 255);
                srcB = (srcB *% srcA) / @as(Uint32, 255);
                {
                    sdl_pc = 93;
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
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            94 => {
                switch (dst_access) {
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8) => {
                        sdl_pc = 133;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGB) => {
                        sdl_pc = 137;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGBA) => {
                        sdl_pc = 143;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_10Bit) => {
                        sdl_pc = 149;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Large) => {
                        sdl_pc = 156;
                        continue;
                    },
                    else => {
                        sdl_pc = 132;
                        continue;
                    },
                }
            },
            95 => {
                dstR = srcR;
                dstG = srcG;
                dstB = srcB;
                dstA = srcA;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            96 => {
                dstR = srcR +% (((@as(Uint32, 255) -% srcA) *% dstR) / @as(Uint32, 255));
                dstG = srcG +% (((@as(Uint32, 255) -% srcA) *% dstG) / @as(Uint32, 255));
                dstB = srcB +% (((@as(Uint32, 255) -% srcA) *% dstB) / @as(Uint32, 255));
                dstA = srcA +% (((@as(Uint32, 255) -% srcA) *% dstA) / @as(Uint32, 255));
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            97 => {
                dstR = srcR +% (((@as(Uint32, 255) -% srcA) *% dstR) / @as(Uint32, 255));
                if (dstR > @as(Uint32, 255)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                dstR = 255;
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
                dstG = srcG +% (((@as(Uint32, 255) -% srcA) *% dstG) / @as(Uint32, 255));
                if (dstG > @as(Uint32, 255)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                dstG = 255;
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
                dstB = srcB +% (((@as(Uint32, 255) -% srcA) *% dstB) / @as(Uint32, 255));
                if (dstB > @as(Uint32, 255)) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                dstB = 255;
                {
                    sdl_pc = 106;
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
                dstA = srcA +% (((@as(Uint32, 255) -% srcA) *% dstA) / @as(Uint32, 255));
                if (dstA > @as(Uint32, 255)) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                dstA = 255;
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 111;
                    continue;
                }
            },
            111 => {
                dstR = srcR +% dstR;
                if (dstR > @as(Uint32, 255)) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            112 => {
                dstR = 255;
                {
                    sdl_pc = 114;
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
                dstG = srcG +% dstG;
                if (dstG > @as(Uint32, 255)) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                dstG = 255;
                {
                    sdl_pc = 117;
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
                dstB = srcB +% dstB;
                if (dstB > @as(Uint32, 255)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                dstB = 255;
                {
                    sdl_pc = 120;
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
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            121 => {
                dstR = (srcR *% dstR) / @as(Uint32, 255);
                dstG = (srcG *% dstG) / @as(Uint32, 255);
                dstB = (srcB *% dstB) / @as(Uint32, 255);
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            122 => {
                dstR = ((srcR *% dstR) +% (dstR *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstR > @as(Uint32, 255)) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                dstR = 255;
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
                dstG = ((srcG *% dstG) +% (dstG *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstG > @as(Uint32, 255)) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                dstG = 255;
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
                dstB = ((srcB *% dstB) +% (dstB *% (@as(Uint32, 255) -% srcA))) / @as(Uint32, 255);
                if (dstB > @as(Uint32, 255)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                dstB = 255;
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            132 => {
                posx +%= incx;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            133 => {
                dstpixel = (((dstR << @intCast(@as(Uint32, 24))) | (dstG << @intCast(@as(Uint32, 16)))) | (dstB << @intCast(@as(Uint32, 8)))) | dstA;
                if (dstpixel != last_pixel) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            134 => {
                last_pixel = dstpixel;
                last_index = SDL_LookupRGBAColor(palette_map, dstpixel, dst_pal);
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                dst.* = last_index;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            137 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 139;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 140;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 141;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 142;
                        continue;
                    },
                    else => {
                        sdl_pc = 138;
                        continue;
                    },
                }
            },
            138 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            139 => {
                _pixel = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask);
                dst.* = _pixel;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            140 => {
                _pixel_1 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask);
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_1;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            141 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dstR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dstG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dstB);
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            142 => {
                _pixel_2 = ((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | dst_fmt.*.Amask;
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_2;
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                switch (dstbpp) {
                    @as(c_int, 1) => {
                        sdl_pc = 145;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 146;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 147;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 148;
                        continue;
                    },
                    else => {
                        sdl_pc = 144;
                        continue;
                    },
                }
            },
            144 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            145 => {
                _pixel_3 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))));
                dst.* = _pixel_3;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            146 => {
                _pixel_4 = @truncate(((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(dst))).* = _pixel_4;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            147 => {
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(dstR);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(dstG);
                (dst + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, dst_fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(dstB);
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            148 => {
                _pixel_5 = ((((dstR >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Rshift)))))) | ((dstG >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Gshift))))))) | ((dstB >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Bshift))))))) | ((dstA >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, dst_fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, dst_fmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = _pixel_5;
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            149 => {
                switch (dst_fmt.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 151;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 152;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 153;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 154;
                        continue;
                    },
                    else => {
                        sdl_pc = 155;
                        continue;
                    },
                }
            },
            150 => {
                @as([*c]Uint32, @ptrCast(@alignCast(dst))).* = pixelvalue;
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            151 => {
                dstA = 255;
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                dstR = if (dstR != 0) (dstR << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstG = if (dstG != 0) (dstG << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstB = if (dstB != 0) (dstB << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstA = (dstA *% @as(Uint32, 3)) / @as(Uint32, 255);
                pixelvalue = (((dstA << @intCast(@as(Uint32, 30))) | (dstR << @intCast(@as(Uint32, 20)))) | (dstG << @intCast(@as(Uint32, 10)))) | dstB;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            153 => {
                dstA = 255;
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                dstR = if (dstR != 0) (dstR << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstG = if (dstG != 0) (dstG << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstB = if (dstB != 0) (dstB << @intCast(@as(Uint32, 2))) | @as(Uint32, 3) else @as(Uint32, 0);
                dstA = (dstA *% @as(Uint32, 3)) / @as(Uint32, 255);
                pixelvalue = (((dstA << @intCast(@as(Uint32, 30))) | (dstB << @intCast(@as(Uint32, 20)))) | (dstG << @intCast(@as(Uint32, 10)))) | dstR;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            155 => {
                pixelvalue = 0;
                {
                    sdl_pc = 150;
                    continue;
                }
            },
            156 => {
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const FP32 = extern union {
    u: Uint32,
    f: f32,
};
pub const FP16 = extern union {
    u: Uint16,
};
pub fn half_to_float(unValue: Uint16) callconv(.c) f32 {
    @setEvalBranchQuota(100000);
    const static_local_magic = struct {
        const magic: FP32 = FP32{
            .u = @bitCast(@as(c_int, (@as(c_int, 254) - @as(c_int, 15)) << @intCast(@as(c_int, 23)))),
        };
    };
    _ = &static_local_magic;
    const static_local_was_infnan = struct {
        const was_infnan: FP32 = FP32{
            .u = @bitCast(@as(c_int, (@as(c_int, 127) + @as(c_int, 16)) << @intCast(@as(c_int, 23)))),
        };
    };
    _ = &static_local_was_infnan;
    var h: FP16 = undefined;
    _ = &h;
    var o: FP32 = undefined;
    _ = &o;
    h.u = unValue;
    o.u = @bitCast(@as(c_int, (@as(c_int, h.u) & @as(c_int, 32767)) << @intCast(@as(c_int, 13))));
    o.f *= static_local_magic.magic.f;
    if (o.f >= static_local_was_infnan.was_infnan.f) {
        o.u |= @bitCast(@as(c_int, @as(c_int, 255) << @intCast(@as(c_int, 23))));
    }
    o.u |= @bitCast(@as(c_int, (@as(c_int, h.u) & @as(c_int, 32768)) << @intCast(@as(c_int, 16))));
    return o.f;
}
pub fn float_to_half(arg_a: f32) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var a = arg_a;
    _ = &a;
    var ia: Uint32 = undefined;
    _ = &ia;
    var ir: Uint16 = undefined;
    _ = &ir;
    _ = memcpy(@ptrCast(@alignCast(&ia)), @ptrCast(@alignCast(&a)), @sizeOf(@TypeOf(ia)));
    ir = @truncate((ia >> @intCast(@as(Uint32, 16))) & @as(Uint32, 32768));
    if ((ia & @as(Uint32, 2139095040)) == @as(Uint32, 2139095040)) {
        if ((ia & @as(Uint32, 2147483647)) == @as(Uint32, 2139095040)) {
            {
                const ref = &ir;
                ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, 31744))));
            }
        } else {
            {
                const ref = &ir;
                ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(Uint32, 32256) | ((ia >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 24) - @as(c_int, 11)))))) & @as(Uint32, 511))));
            }
        }
    } else if ((ia & @as(Uint32, 2139095040)) >= @as(Uint32, 855638016)) {
        var shift: c_int = @as(c_int, @bitCast(@as(c_uint, @truncate((ia >> @intCast(@as(Uint32, 23))) & @as(Uint32, 255))))) - @as(c_int, 127);
        _ = &shift;
        if (shift > @as(c_int, 15)) {
            {
                const ref = &ir;
                ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, 31744))));
            }
        } else {
            ia = (ia & @as(Uint32, 8388607)) | @as(Uint32, 8388608);
            if (shift < -@as(c_int, 14)) {
                {
                    const ref = &ir;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (ia >> @intCast(@as(Uint32, @bitCast(@as(c_int, -@as(c_int, 1) - shift))))));
                }
                ia = ia << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 32) - (-@as(c_int, 1) - shift)))));
            } else {
                {
                    const ref = &ir;
                    ref.* = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (ia >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 24) - @as(c_int, 11)))))));
                }
                ia = ia << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 32) - (@as(c_int, 24) - @as(c_int, 11))))));
                ir = @bitCast(@as(c_short, @truncate(@as(c_int, ir) + ((@as(c_int, 14) + shift) << @intCast(@as(c_int, 10))))));
            }
            if ((ia > @as(c_uint, 2147483648)) or ((ia == @as(c_uint, 2147483648)) and ((@as(c_int, ir) & @as(c_int, 1)) != 0))) {
                ir +%= 1;
            }
        }
    }
    return ir;
}
pub fn ReadFloatPixel(pixels: [*c]Uint8, access: SlowBlitPixelAccess, fmt: [*c]const SDL_PixelFormatDetails, pal: [*c]const SDL_Palette, colorspace: SDL_Colorspace, SDR_white_point: f32, outR: [*c]f32, outG: [*c]f32, outB: [*c]f32, outA: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var R: Uint32 = undefined;
    _ = &R;
    var G: Uint32 = undefined;
    _ = &G;
    var B: Uint32 = undefined;
    _ = &B;
    var A: Uint32 = undefined;
    _ = &A;
    var fR: f32 = undefined;
    _ = &fR;
    var fG: f32 = undefined;
    _ = &fG;
    var fB: f32 = undefined;
    _ = &fB;
    var fA: f32 = undefined;
    _ = &fA;
    var v: [4]f32 = undefined;
    _ = &v;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fR = 0.0;
                fG = 0.0;
                fB = 0.0;
                fA = 0.0;
                switch (access) {
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGB) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGBA) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_10Bit) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Large) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                switch (@as(SDL_TransferCharacteristics, (colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31))) {
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_SRGB) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_LINEAR) => {
                        sdl_pc = 56;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            2 => {
                pixelvalue = pixels.*;
                fR = @as(f32, @floatFromInt(pal.*.colors[pixelvalue].r)) / @as(f32, 255.0);
                fG = @as(f32, @floatFromInt(pal.*.colors[pixelvalue].g)) / @as(f32, 255.0);
                fB = @as(f32, @floatFromInt(pal.*.colors[pixelvalue].b)) / @as(f32, 255.0);
                fA = @as(f32, @floatFromInt(pal.*.colors[pixelvalue].a)) / @as(f32, 255.0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            5 => {
                if (false) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                fR = @as(f32, @floatFromInt(R)) / @as(f32, 255.0);
                fG = @as(f32, @floatFromInt(G)) / @as(f32, 255.0);
                fB = @as(f32, @floatFromInt(B)) / @as(f32, 255.0);
                fA = 1.0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                pixelvalue = pixels.*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(pixels))).*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                pixelvalue = 0;
                R = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Rshift), @as(c_int, 8))))))).*;
                G = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Gshift), @as(c_int, 8))))))).*;
                B = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Bshift), @as(c_int, 8))))))).*;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(pixels))).*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                pixelvalue = 0;
                R = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = @as(Uint32, 0);
                        B = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    G = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 7;
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
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
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
                fR = @as(f32, @floatFromInt(R)) / @as(f32, 255.0);
                fG = @as(f32, @floatFromInt(G)) / @as(f32, 255.0);
                fB = @as(f32, @floatFromInt(B)) / @as(f32, 255.0);
                fA = @as(f32, @floatFromInt(A)) / @as(f32, 255.0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                pixelvalue = pixels.*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                A = SDL_expand_byte[fmt.*.Abits][(pixelvalue & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            19 => {
                pixelvalue = @as([*c]Uint16, @ptrCast(@alignCast(pixels))).*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                A = SDL_expand_byte[fmt.*.Abits][(pixelvalue & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            20 => {
                pixelvalue = 0;
                R = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Rshift), @as(c_int, 8))))))).*;
                G = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Gshift), @as(c_int, 8))))))).*;
                B = (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Bshift), @as(c_int, 8))))))).*;
                A = 255;
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(pixels))).*;
                R = SDL_expand_byte[fmt.*.Rbits][(pixelvalue & fmt.*.Rmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))];
                G = SDL_expand_byte[fmt.*.Gbits][(pixelvalue & fmt.*.Gmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift)))))];
                B = SDL_expand_byte[fmt.*.Bbits][(pixelvalue & fmt.*.Bmask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift)))))];
                A = SDL_expand_byte[fmt.*.Abits][(pixelvalue & fmt.*.Amask) >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))];
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                pixelvalue = 0;
                R = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(Uint32, 0);
                            A = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        B = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    G = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            23 => {
                pixelvalue = @as([*c]Uint32, @ptrCast(@alignCast(pixels))).*;
                switch (fmt.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            24 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                fR = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 20))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fG = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 10))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fB = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 0))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fA = @as(f32, @floatFromInt(pixelvalue >> @intCast(@as(Uint32, 30)))) / @as(f32, 3.0);
                fA = 1.0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            26 => {
                fR = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 0))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fG = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 10))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fB = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 20))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fA = @as(f32, @floatFromInt(pixelvalue >> @intCast(@as(Uint32, 30)))) / @as(f32, 3.0);
                fA = 1.0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            27 => {
                fR = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 20))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fG = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 10))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fB = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 0))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fA = @as(f32, @floatFromInt(pixelvalue >> @intCast(@as(Uint32, 30)))) / @as(f32, 3.0);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                fR = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 0))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fG = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 10))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fB = @as(f32, @floatFromInt((pixelvalue >> @intCast(@as(Uint32, 20))) & @as(Uint32, 1023))) / @as(f32, 1023.0);
                fA = @as(f32, @floatFromInt(pixelvalue >> @intCast(@as(Uint32, 30)))) / @as(f32, 3.0);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            29 => {
                fR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, 0.0);
                            fA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        fB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    fG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            30 => {
                switch ((fmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32) => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 44;
                        continue;
                    },
                }
            },
            31 => {
                switch ((fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGB) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGR) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR) => {
                        sdl_pc = 51;
                        continue;
                    },
                    else => {
                        sdl_pc = 52;
                        continue;
                    },
                }
            },
            32 => {
                v[@as(c_int, 0)] = @as(f32, @floatFromInt(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)])) / @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))));
                v[@as(c_int, 1)] = @as(f32, @floatFromInt(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)])) / @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))));
                v[@as(c_int, 2)] = @as(f32, @floatFromInt(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)])) / @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))));
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 8)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                v[@as(c_int, 3)] = @as(f32, @floatFromInt(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)])) / @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                v[@as(c_int, 3)] = 1.0;
                {
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
                v[@as(c_int, 0)] = half_to_float(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)]);
                v[@as(c_int, 1)] = half_to_float(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)]);
                v[@as(c_int, 2)] = half_to_float(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)]);
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 8)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                v[@as(c_int, 3)] = half_to_float(@as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)]);
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                v[@as(c_int, 3)] = 1.0;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            40 => {
                v[@as(c_int, 0)] = @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)];
                v[@as(c_int, 1)] = @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)];
                v[@as(c_int, 2)] = @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)];
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 16)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                v[@as(c_int, 3)] = @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)];
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                v[@as(c_int, 3)] = 1.0;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            44 => {
                v[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, 0.0);
                            v[@as(c_int, 3)] = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        v[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    v[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            46 => {
                fR = v[@as(c_int, 0)];
                fG = v[@as(c_int, 1)];
                fB = v[@as(c_int, 2)];
                fA = 1.0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                fR = v[@as(c_int, 0)];
                fG = v[@as(c_int, 1)];
                fB = v[@as(c_int, 2)];
                fA = v[@as(c_int, 3)];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                fA = v[@as(c_int, 0)];
                fR = v[@as(c_int, 1)];
                fG = v[@as(c_int, 2)];
                fB = v[@as(c_int, 3)];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                fB = v[@as(c_int, 0)];
                fG = v[@as(c_int, 1)];
                fR = v[@as(c_int, 2)];
                fA = 1.0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            50 => {
                fB = v[@as(c_int, 0)];
                fG = v[@as(c_int, 1)];
                fR = v[@as(c_int, 2)];
                fA = v[@as(c_int, 3)];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            51 => {
                fA = v[@as(c_int, 0)];
                fB = v[@as(c_int, 1)];
                fG = v[@as(c_int, 2)];
                fR = v[@as(c_int, 3)];
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            52 => {
                fA = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, 0.0);
                            fB = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        fG = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    fR = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            53 => {
                outR.* = fR;
                outG.* = fG;
                outB.* = fB;
                outA.* = fA;
                {}
            },
            54 => {
                fR = SDL_sRGBtoLinear(fR);
                fG = SDL_sRGBtoLinear(fG);
                fB = SDL_sRGBtoLinear(fB);
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            55 => {
                fR = SDL_PQtoNits(fR) / SDR_white_point;
                fG = SDL_PQtoNits(fG) / SDR_white_point;
                fB = SDL_PQtoNits(fB) / SDR_white_point;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            56 => {
                fR /= SDR_white_point;
                fG /= SDR_white_point;
                fB /= SDR_white_point;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn WriteFloatPixel(pixels: [*c]Uint8, access: SlowBlitPixelAccess, fmt: [*c]const SDL_PixelFormatDetails, colorspace: SDL_Colorspace, SDR_white_point: f32, arg_fR: f32, arg_fG: f32, arg_fB: f32, arg_fA: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var fR = arg_fR;
    _ = &fR;
    var fG = arg_fG;
    _ = &fG;
    var fB = arg_fB;
    _ = &fB;
    var fA = arg_fA;
    _ = &fA;
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "WriteFloatPixel".*;
    };
    _ = &static_local___func__;
    var R: Uint32 = undefined;
    _ = &R;
    var G: Uint32 = undefined;
    _ = &G;
    var B: Uint32 = undefined;
    _ = &B;
    var A: Uint32 = undefined;
    _ = &A;
    var pixelvalue: Uint32 = undefined;
    _ = &pixelvalue;
    var v: [4]f32 = undefined;
    _ = &v;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var _pixel: Uint8 = undefined;
    _ = &_pixel;
    var _pixel_1: Uint16 = undefined;
    _ = &_pixel_1;
    var _pixel_2: Uint32 = undefined;
    _ = &_pixel_2;
    var _pixel_3: Uint8 = undefined;
    _ = &_pixel_3;
    var _pixel_4: Uint16 = undefined;
    _ = &_pixel_4;
    var _pixel_5: Uint32 = undefined;
    _ = &_pixel_5;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(SDL_TransferCharacteristics, (colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31))) {
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_SRGB) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_LINEAR) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                switch (access) {
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGB) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_RGBA) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_10Bit) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Large) => {
                        sdl_pc = 39;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            2 => {
                fR = SDL_sRGBfromLinear(fR);
                fG = SDL_sRGBfromLinear(fG);
                fB = SDL_sRGBfromLinear(fB);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                fR = SDL_PQfromNits(fR * SDR_white_point);
                fG = SDL_PQfromNits(fG * SDR_white_point);
                fB = SDL_PQfromNits(fB * SDR_white_point);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                fR *= SDR_white_point;
                fG *= SDR_white_point;
                fB *= SDR_white_point;
                {
                    sdl_pc = 1;
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
                {}
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                if (@as(c_int, 0) != 0) {
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_blit_slow.c", 608);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                R = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fR < @as(f32, 0.0)) @as(f32, 0.0) else if (fR > @as(f32, 1.0)) @as(f32, 1.0) else fR) * @as(f32, 255.0))));
                G = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fG < @as(f32, 0.0)) @as(f32, 0.0) else if (fG > @as(f32, 1.0)) @as(f32, 1.0) else fG) * @as(f32, 255.0))));
                B = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fB < @as(f32, 0.0)) @as(f32, 0.0) else if (fB > @as(f32, 1.0)) @as(f32, 1.0) else fB) * @as(f32, 255.0))));
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 25;
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
                    sdl_pc = 6;
                    continue;
                }
            },
            22 => {
                _pixel = @truncate(((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                pixels.* = _pixel;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                _pixel_1 = @truncate(((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask);
                @as([*c]Uint16, @ptrCast(@alignCast(pixels))).* = _pixel_1;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(R);
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(G);
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(B);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                _pixel_2 = ((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | fmt.*.Amask;
                @as([*c]Uint32, @ptrCast(@alignCast(pixels))).* = _pixel_2;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            26 => {
                R = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fR < @as(f32, 0.0)) @as(f32, 0.0) else if (fR > @as(f32, 1.0)) @as(f32, 1.0) else fR) * @as(f32, 255.0))));
                G = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fG < @as(f32, 0.0)) @as(f32, 0.0) else if (fG > @as(f32, 1.0)) @as(f32, 1.0) else fG) * @as(f32, 255.0))));
                B = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fB < @as(f32, 0.0)) @as(f32, 0.0) else if (fB > @as(f32, 1.0)) @as(f32, 1.0) else fB) * @as(f32, 255.0))));
                A = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (fA < @as(f32, 0.0)) @as(f32, 0.0) else if (fA > @as(f32, 1.0)) @as(f32, 1.0) else fA) * @as(f32, 255.0))));
                switch (@as(c_int, fmt.*.bytes_per_pixel)) {
                    @as(c_int, 1) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 27;
                        continue;
                    },
                }
            },
            27 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            28 => {
                _pixel_3 = @truncate(((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((A >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))));
                pixels.* = _pixel_3;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            29 => {
                _pixel_4 = @truncate(((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((A >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift)))))));
                @as([*c]Uint16, @ptrCast(@alignCast(pixels))).* = _pixel_4;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            30 => {
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Rshift), @as(c_int, 8))))))).* = @truncate(R);
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Gshift), @as(c_int, 8))))))).* = @truncate(G);
                (pixels + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, fmt.*.Bshift), @as(c_int, 8))))))).* = @truncate(B);
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                _pixel_5 = ((((R >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Rbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Rshift)))))) | ((G >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Gbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Gshift))))))) | ((B >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Bbits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Bshift))))))) | ((A >> @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 8) - @as(c_int, fmt.*.Abits)))))) << @intCast(@as(Uint32, @bitCast(@as(c_int, @as(c_int, fmt.*.Ashift))))));
                @as([*c]Uint32, @ptrCast(@alignCast(pixels))).* = _pixel_5;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            32 => {
                switch (fmt.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB2101010) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR2101010) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR2101010) => {
                        sdl_pc = 37;
                        continue;
                    },
                    else => {
                        sdl_pc = 38;
                        continue;
                    },
                }
            },
            33 => {
                @as([*c]Uint32, @ptrCast(@alignCast(pixels))).* = pixelvalue;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            34 => {
                fA = 1.0;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                fR = (if (fR < @as(f32, 0.0)) @as(f32, 0.0) else if (fR > @as(f32, 1.0)) @as(f32, 1.0) else fR) * @as(f32, 1023.0);
                fG = (if (fG < @as(f32, 0.0)) @as(f32, 0.0) else if (fG > @as(f32, 1.0)) @as(f32, 1.0) else fG) * @as(f32, 1023.0);
                fB = (if (fB < @as(f32, 0.0)) @as(f32, 0.0) else if (fB > @as(f32, 1.0)) @as(f32, 1.0) else fB) * @as(f32, 1023.0);
                fA = (if (fA < @as(f32, 0.0)) @as(f32, 0.0) else if (fA > @as(f32, 1.0)) @as(f32, 1.0) else fA) * @as(f32, 3.0);
                pixelvalue = (((@as(Uint32, @intFromFloat(SDL_roundf_REAL(fA))) << @intCast(@as(Uint32, 30))) | (@as(Uint32, @intFromFloat(SDL_roundf_REAL(fR))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @intFromFloat(SDL_roundf_REAL(fG))) << @intCast(@as(Uint32, 10)))) | @as(Uint32, @intFromFloat(SDL_roundf_REAL(fB)));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                fA = 1.0;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                fR = (if (fR < @as(f32, 0.0)) @as(f32, 0.0) else if (fR > @as(f32, 1.0)) @as(f32, 1.0) else fR) * @as(f32, 1023.0);
                fG = (if (fG < @as(f32, 0.0)) @as(f32, 0.0) else if (fG > @as(f32, 1.0)) @as(f32, 1.0) else fG) * @as(f32, 1023.0);
                fB = (if (fB < @as(f32, 0.0)) @as(f32, 0.0) else if (fB > @as(f32, 1.0)) @as(f32, 1.0) else fB) * @as(f32, 1023.0);
                fA = (if (fA < @as(f32, 0.0)) @as(f32, 0.0) else if (fA > @as(f32, 1.0)) @as(f32, 1.0) else fA) * @as(f32, 3.0);
                pixelvalue = (((@as(Uint32, @intFromFloat(SDL_roundf_REAL(fA))) << @intCast(@as(Uint32, 30))) | (@as(Uint32, @intFromFloat(SDL_roundf_REAL(fB))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @intFromFloat(SDL_roundf_REAL(fG))) << @intCast(@as(Uint32, 10)))) | @as(Uint32, @intFromFloat(SDL_roundf_REAL(fR)));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            38 => {
                pixelvalue = 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            39 => {
                switch ((fmt.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGB) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGR) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR) => {
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
                switch ((fmt.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) {
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32) => {
                        sdl_pc = 57;
                        continue;
                    },
                    else => {
                        sdl_pc = 61;
                        continue;
                    },
                }
            },
            41 => {
                v[@as(c_int, 0)] = fR;
                v[@as(c_int, 1)] = fG;
                v[@as(c_int, 2)] = fB;
                v[@as(c_int, 3)] = 1.0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            42 => {
                v[@as(c_int, 0)] = fR;
                v[@as(c_int, 1)] = fG;
                v[@as(c_int, 2)] = fB;
                v[@as(c_int, 3)] = fA;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                v[@as(c_int, 0)] = fA;
                v[@as(c_int, 1)] = fR;
                v[@as(c_int, 2)] = fG;
                v[@as(c_int, 3)] = fB;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                v[@as(c_int, 0)] = fB;
                v[@as(c_int, 1)] = fG;
                v[@as(c_int, 2)] = fR;
                v[@as(c_int, 3)] = 1.0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                v[@as(c_int, 0)] = fB;
                v[@as(c_int, 1)] = fG;
                v[@as(c_int, 2)] = fR;
                v[@as(c_int, 3)] = fA;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            46 => {
                v[@as(c_int, 0)] = fA;
                v[@as(c_int, 1)] = fB;
                v[@as(c_int, 2)] = fG;
                v[@as(c_int, 3)] = fR;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            47 => {
                v[@as(c_int, 0)] = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, 0.0);
                            v[@as(c_int, 3)] = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        v[@as(c_int, 2)] = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    v[@as(c_int, 1)] = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            49 => {
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)] = @intFromFloat(SDL_roundf_REAL((if (v[@as(c_int, 0)] < @as(f32, 0.0)) @as(f32, 0.0) else if (v[@as(c_int, 0)] > @as(f32, 1.0)) @as(f32, 1.0) else v[@as(c_int, 0)]) * @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))));
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)] = @intFromFloat(SDL_roundf_REAL((if (v[@as(c_int, 1)] < @as(f32, 0.0)) @as(f32, 0.0) else if (v[@as(c_int, 1)] > @as(f32, 1.0)) @as(f32, 1.0) else v[@as(c_int, 1)]) * @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))));
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)] = @intFromFloat(SDL_roundf_REAL((if (v[@as(c_int, 2)] < @as(f32, 0.0)) @as(f32, 0.0) else if (v[@as(c_int, 2)] > @as(f32, 1.0)) @as(f32, 1.0) else v[@as(c_int, 2)]) * @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))));
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 8)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)] = @intFromFloat(SDL_roundf_REAL((if (v[@as(c_int, 3)] < @as(f32, 0.0)) @as(f32, 0.0) else if (v[@as(c_int, 3)] > @as(f32, 1.0)) @as(f32, 1.0) else v[@as(c_int, 3)]) * @as(f32, @floatFromInt(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))))));
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            53 => {
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)] = float_to_half(v[@as(c_int, 0)]);
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)] = float_to_half(v[@as(c_int, 1)]);
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)] = float_to_half(v[@as(c_int, 2)]);
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 8)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                @as([*c]Uint16, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)] = float_to_half(v[@as(c_int, 3)]);
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            57 => {
                @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 0)] = v[@as(c_int, 0)];
                @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 1)] = v[@as(c_int, 1)];
                @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 2)] = v[@as(c_int, 2)];
                if (@as(c_int, fmt.*.bytes_per_pixel) == @as(c_int, 16)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                @as([*c]f32, @ptrCast(@alignCast(pixels)))[@as(c_int, 3)] = v[@as(c_int, 3)];
                {
                    sdl_pc = 60;
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const SDL_TONEMAP_NONE: c_int = 0;
pub const SDL_TONEMAP_LINEAR: c_int = 1;
pub const SDL_TONEMAP_CHROME: c_int = 2;
pub const SDL_TonemapOperator = c_uint;
const struct_unnamed_15 = extern struct {
    scale: f32 = 0,
};
const struct_unnamed_16 = extern struct {
    a: f32 = 0,
    b: f32 = 0,
    color_primaries_matrix: [*c]const f32 = null,
};
const union_unnamed_14 = extern union {
    linear: struct_unnamed_15,
    chrome: struct_unnamed_16,
};
pub const SDL_TonemapContext = extern struct {
    op: SDL_TonemapOperator = @import("std").mem.zeroes(SDL_TonemapOperator),
    data: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
};
pub fn TonemapLinear(r: [*c]f32, g: [*c]f32, b: [*c]f32, scale: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    r.* *= scale;
    g.* *= scale;
    b.* *= scale;
}
pub fn TonemapChrome(r: [*c]f32, g: [*c]f32, b: [*c]f32, tonemap_a: f32, tonemap_b: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var v1: f32 = r.*;
    _ = &v1;
    var v2: f32 = g.*;
    _ = &v2;
    var v3: f32 = b.*;
    _ = &v3;
    var vmax: f32 = if (v1 > (if (v2 > v3) v2 else v3)) v1 else if (v2 > v3) v2 else v3;
    _ = &vmax;
    if (vmax > @as(f32, 0.0)) {
        var scale: f32 = (@as(f32, 1.0) + (tonemap_a * vmax)) / (@as(f32, 1.0) + (tonemap_b * vmax));
        _ = &scale;
        TonemapLinear(r, g, b, scale);
    }
}
pub fn ApplyTonemap(ctx: [*c]SDL_TonemapContext, r: [*c]f32, g: [*c]f32, b: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (ctx.*.op) {
                    @as(SDL_TonemapOperator, SDL_TONEMAP_LINEAR) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_TonemapOperator, SDL_TONEMAP_CHROME) => {
                        sdl_pc = 3;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                TonemapLinear(r, g, b, ctx.*.data.linear.scale);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                if (ctx.*.data.chrome.color_primaries_matrix != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                SDL_ConvertColorPrimaries(r, g, b, ctx.*.data.chrome.color_primaries_matrix);
                {
                    sdl_pc = 6;
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
                TonemapChrome(r, g, b, ctx.*.data.chrome.a, ctx.*.data.chrome.b);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_Blit_Slow_Float(info: [*c]SDL_BlitInfo) void {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    var modulateR: Uint32 = undefined;
    _ = &modulateR;
    var modulateG: Uint32 = undefined;
    _ = &modulateG;
    var modulateB: Uint32 = undefined;
    _ = &modulateB;
    var modulateA: Uint32 = undefined;
    _ = &modulateA;
    var srcR: f32 = undefined;
    _ = &srcR;
    var srcG: f32 = undefined;
    _ = &srcG;
    var srcB: f32 = undefined;
    _ = &srcB;
    var srcA: f32 = undefined;
    _ = &srcA;
    var dstR: f32 = undefined;
    _ = &dstR;
    var dstG: f32 = undefined;
    _ = &dstG;
    var dstB: f32 = undefined;
    _ = &dstB;
    var dstA: f32 = undefined;
    _ = &dstA;
    var srcy: Uint64 = undefined;
    _ = &srcy;
    var srcx: Uint64 = undefined;
    _ = &srcx;
    var posy: Uint64 = undefined;
    _ = &posy;
    var posx: Uint64 = undefined;
    _ = &posx;
    var incy: Uint64 = undefined;
    _ = &incy;
    var incx: Uint64 = undefined;
    _ = &incx;
    var src_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &src_fmt;
    var src_pal: [*c]const SDL_Palette = undefined;
    _ = &src_pal;
    var dst_fmt: [*c]const SDL_PixelFormatDetails = undefined;
    _ = &dst_fmt;
    var dst_pal: [*c]const SDL_Palette = undefined;
    _ = &dst_pal;
    var palette_map: ?*SDL_HashTable = undefined;
    _ = &palette_map;
    var srcbpp: c_int = undefined;
    _ = &srcbpp;
    var dstbpp: c_int = undefined;
    _ = &dstbpp;
    var src_access: SlowBlitPixelAccess = undefined;
    _ = &src_access;
    var dst_access: SlowBlitPixelAccess = undefined;
    _ = &dst_access;
    var src_colorspace: SDL_Colorspace = undefined;
    _ = &src_colorspace;
    var dst_colorspace: SDL_Colorspace = undefined;
    _ = &dst_colorspace;
    var src_primaries: SDL_ColorPrimaries = undefined;
    _ = &src_primaries;
    var dst_primaries: SDL_ColorPrimaries = undefined;
    _ = &dst_primaries;
    var color_primaries_matrix: [*c]const f32 = undefined;
    _ = &color_primaries_matrix;
    var src_white_point: f32 = undefined;
    _ = &src_white_point;
    var dst_white_point: f32 = undefined;
    _ = &dst_white_point;
    var dst_headroom: f32 = undefined;
    _ = &dst_headroom;
    var src_headroom: f32 = undefined;
    _ = &src_headroom;
    var tonemap: SDL_TonemapContext = undefined;
    _ = &tonemap;
    var last_pixel: Uint32 = undefined;
    _ = &last_pixel;
    var last_index: Uint8 = undefined;
    _ = &last_index;
    var tonemap_operator: [*c]const u8 = undefined;
    _ = &tonemap_operator;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var n: c_int = undefined;
    _ = &n;
    var R: Uint32 = undefined;
    _ = &R;
    var G: Uint32 = undefined;
    _ = &G;
    var B: Uint32 = undefined;
    _ = &B;
    var A: Uint32 = undefined;
    _ = &A;
    var dstpixel: Uint32 = undefined;
    _ = &dstpixel;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                flags = info.*.flags;
                modulateR = info.*.r;
                modulateG = info.*.g;
                modulateB = info.*.b;
                modulateA = info.*.a;
                src_fmt = info.*.src_fmt;
                src_pal = info.*.src_pal;
                dst_fmt = info.*.dst_fmt;
                dst_pal = info.*.dst_pal;
                palette_map = info.*.palette_map;
                srcbpp = src_fmt.*.bytes_per_pixel;
                dstbpp = dst_fmt.*.bytes_per_pixel;
                color_primaries_matrix = null;
                last_pixel = 0;
                last_index = 0;
                src_colorspace = info.*.src_surface.*.colorspace;
                dst_colorspace = info.*.dst_surface.*.colorspace;
                src_primaries = (src_colorspace >> @intCast(@as(SDL_Colorspace, 10))) & @as(SDL_Colorspace, 31);
                dst_primaries = (dst_colorspace >> @intCast(@as(SDL_Colorspace, 10))) & @as(SDL_Colorspace, 31);
                src_white_point = SDL_GetSurfaceSDRWhitePoint(info.*.src_surface, src_colorspace);
                dst_white_point = SDL_GetSurfaceSDRWhitePoint(info.*.dst_surface, dst_colorspace);
                src_headroom = SDL_GetSurfaceHDRHeadroom(info.*.src_surface, src_colorspace);
                dst_headroom = SDL_GetSurfaceHDRHeadroom(info.*.dst_surface, dst_colorspace);
                if (dst_headroom == @as(f32, 0.0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                dst_headroom = src_headroom;
                _ = SDL_SetFloatProperty_REAL(SDL_GetSurfaceProperties_REAL(info.*.dst_surface), "SDL.surface.HDR_headroom", dst_headroom);
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
                _ = memset(@ptrCast(@alignCast(&tonemap)), 0, @sizeOf(@TypeOf(tonemap)));
                if (src_headroom > dst_headroom) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                tonemap_operator = SDL_GetStringProperty_REAL(SDL_GetSurfaceProperties_REAL(info.*.src_surface), "SDL.surface.tonemap", null);
                if (tonemap_operator != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                if (src_primaries != dst_primaries) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            7 => {
                if (SDL_strncmp_REAL(tonemap_operator, "*=", 2) == @as(c_int, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                tonemap.op = SDL_TONEMAP_CHROME;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                if (tonemap.op == @as(SDL_TonemapOperator, SDL_TONEMAP_CHROME)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            10 => {
                tonemap.op = SDL_TONEMAP_LINEAR;
                tonemap.data.linear.scale = @floatCast(SDL_atof_REAL(tonemap_operator + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (SDL_strcasecmp_REAL(tonemap_operator, "chrome") == @as(c_int, 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                tonemap.op = SDL_TONEMAP_CHROME;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (SDL_strcasecmp_REAL(tonemap_operator, "none") == @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
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
                tonemap.op = SDL_TONEMAP_NONE;
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
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                tonemap.data.chrome.a = dst_headroom / (src_headroom * src_headroom);
                tonemap.data.chrome.b = @as(f32, 1.0) / dst_headroom;
                tonemap.data.chrome.color_primaries_matrix = SDL_GetColorPrimariesConversionMatrix(src_primaries, SDL_COLOR_PRIMARIES_BT2020);
                if (tonemap.data.chrome.color_primaries_matrix != null) {
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
                    sdl_pc = 6;
                    continue;
                }
            },
            22 => {
                src_primaries = SDL_COLOR_PRIMARIES_BT2020;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            25 => {
                color_primaries_matrix = SDL_GetColorPrimariesConversionMatrix(src_primaries, dst_primaries);
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
                src_access = GetPixelAccessMethod(src_fmt.*.format);
                dst_access = GetPixelAccessMethod(dst_fmt.*.format);
                if (dst_access == @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                last_index = SDL_LookupRGBAColor(palette_map, last_pixel, dst_pal);
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
                incy = (@as(Uint64, @bitCast(@as(c_long, info.*.src_h))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, info.*.dst_h)));
                incx = (@as(Uint64, @bitCast(@as(c_long, info.*.src_w))) << @intCast(@as(Uint64, 16))) / @as(Uint64, @bitCast(@as(c_long, info.*.dst_w)));
                posy = incy / @as(Uint64, 2);
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if ((blk: {
                    const ref = &info.*.dst_h;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                src = null;
                dst = info.*.dst;
                n = info.*.dst_w;
                posx = incx / @as(Uint64, 2);
                srcy = posy >> @intCast(@as(Uint64, 16));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {}
            },
            34 => {
                if ((blk: {
                    const ref = &n;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                srcx = posx >> @intCast(@as(Uint64, 16));
                src = (info.*.src + (srcy *% @as(Uint64, @bitCast(@as(c_long, info.*.src_pitch))))) + (srcx *% @as(Uint64, @bitCast(@as(c_long, srcbpp))));
                ReadFloatPixel(src, src_access, src_fmt, src_pal, src_colorspace, src_white_point, &srcR, &srcG, &srcB, &srcA);
                if (tonemap.op != 0) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                posy +%= incy;
                info.*.dst += @as(usize, @bitCast(@as(isize, @intCast(info.*.dst_pitch))));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            37 => {
                ApplyTonemap(&tonemap, &srcR, &srcG, &srcB);
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
                if (color_primaries_matrix != null) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                SDL_ConvertColorPrimaries(&srcR, &srcG, &srcB, color_primaries_matrix);
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
                if ((flags & SDL_COPY_COLORKEY) != 0) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if ((flags & (((SDL_COPY_BLEND | SDL_COPY_ADD) | SDL_COPY_MOD) | SDL_COPY_MUL)) != 0) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                ReadFloatPixel(dst, dst_access, dst_fmt, dst_pal, dst_colorspace, dst_white_point, &dstR, &dstG, &dstB, &dstA);
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                dstR = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, 0.0);
                            dstA = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        dstB = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    dstG = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                if ((flags & SDL_COPY_MODULATE_COLOR) != 0) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                srcR = (srcR * @as(f32, @floatFromInt(modulateR))) / @as(f32, @floatFromInt(@as(c_int, 255)));
                srcG = (srcG * @as(f32, @floatFromInt(modulateG))) / @as(f32, @floatFromInt(@as(c_int, 255)));
                srcB = (srcB * @as(f32, @floatFromInt(modulateB))) / @as(f32, @floatFromInt(@as(c_int, 255)));
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
                if ((flags & SDL_COPY_MODULATE_ALPHA) != 0) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                srcA = (srcA * @as(f32, @floatFromInt(modulateA))) / @as(f32, @floatFromInt(@as(c_int, 255)));
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
                if ((flags & (SDL_COPY_BLEND | SDL_COPY_ADD)) != 0) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                if (srcA < @as(f32, 1.0)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
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
                switch (flags & (((SDL_COPY_BLEND | SDL_COPY_ADD) | SDL_COPY_MOD) | SDL_COPY_MUL)) {
                    @as(c_int, 0) => {
                        sdl_pc = 62;
                        continue;
                    },
                    SDL_COPY_BLEND => {
                        sdl_pc = 63;
                        continue;
                    },
                    SDL_COPY_ADD => {
                        sdl_pc = 64;
                        continue;
                    },
                    SDL_COPY_MOD => {
                        sdl_pc = 65;
                        continue;
                    },
                    SDL_COPY_MUL => {
                        sdl_pc = 66;
                        continue;
                    },
                    else => {
                        sdl_pc = 61;
                        continue;
                    },
                }
            },
            58 => {
                srcR = srcR * srcA;
                srcG = srcG * srcA;
                srcB = srcB * srcA;
                {
                    sdl_pc = 60;
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
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            61 => {
                if (dst_access == @as(SlowBlitPixelAccess, SlowBlitPixelAccess_Index8)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            62 => {
                dstR = srcR;
                dstG = srcG;
                dstB = srcB;
                dstA = srcA;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            63 => {
                dstR = srcR + ((@as(f32, 1.0) - srcA) * dstR);
                dstG = srcG + ((@as(f32, 1.0) - srcA) * dstG);
                dstB = srcB + ((@as(f32, 1.0) - srcA) * dstB);
                dstA = srcA + ((@as(f32, 1.0) - srcA) * dstA);
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            64 => {
                dstR = srcR + dstR;
                dstG = srcG + dstG;
                dstB = srcB + dstB;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            65 => {
                dstR = srcR * dstR;
                dstG = srcG * dstG;
                dstB = srcB * dstB;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            66 => {
                dstR = (srcR * dstR) + (dstR * (@as(f32, 1.0) - srcA));
                dstG = (srcG * dstG) + (dstG * (@as(f32, 1.0) - srcA));
                dstB = (srcB * dstB) + (dstB * (@as(f32, 1.0) - srcA));
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            67 => {
                R = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (SDL_sRGBfromLinear(dstR) < @as(f32, 0.0)) @as(f32, 0.0) else if (SDL_sRGBfromLinear(dstR) > @as(f32, 1.0)) @as(f32, 1.0) else SDL_sRGBfromLinear(dstR)) * @as(f32, 255.0))));
                G = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (SDL_sRGBfromLinear(dstG) < @as(f32, 0.0)) @as(f32, 0.0) else if (SDL_sRGBfromLinear(dstG) > @as(f32, 1.0)) @as(f32, 1.0) else SDL_sRGBfromLinear(dstG)) * @as(f32, 255.0))));
                B = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (SDL_sRGBfromLinear(dstB) < @as(f32, 0.0)) @as(f32, 0.0) else if (SDL_sRGBfromLinear(dstB) > @as(f32, 1.0)) @as(f32, 1.0) else SDL_sRGBfromLinear(dstB)) * @as(f32, 255.0))));
                A = @as(Uint8, @intFromFloat(SDL_roundf_REAL((if (dstA < @as(f32, 0.0)) @as(f32, 0.0) else if (dstA > @as(f32, 1.0)) @as(f32, 1.0) else dstA) * @as(f32, 255.0))));
                dstpixel = (((R << @intCast(@as(Uint32, 24))) | (G << @intCast(@as(Uint32, 16)))) | (B << @intCast(@as(Uint32, 8)))) | A;
                if (dstpixel != last_pixel) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            68 => {
                WriteFloatPixel(dst, dst_access, dst_fmt, dst_colorspace, dst_white_point, dstR, dstG, dstB, dstA);
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                posx +%= incx;
                dst += @as(usize, @bitCast(@as(isize, @intCast(dstbpp))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            70 => {
                last_pixel = dstpixel;
                last_index = SDL_LookupRGBAColor(palette_map, dstpixel, dst_pal);
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                dst.* = last_index;
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"false" = @as(c_int, 0);
pub const SDL_COPY_MODULATE_COLOR = @as(c_int, 0x00000001);
pub const SDL_COPY_MODULATE_ALPHA = @as(c_int, 0x00000002);
pub const SDL_COPY_BLEND = @as(c_int, 0x00000010);
pub const SDL_COPY_BLEND_PREMULTIPLIED = @as(c_int, 0x00000020);
pub const SDL_COPY_ADD = @as(c_int, 0x00000040);
pub const SDL_COPY_ADD_PREMULTIPLIED = @as(c_int, 0x00000080);
pub const SDL_COPY_MOD = @as(c_int, 0x00000100);
pub const SDL_COPY_MUL = @as(c_int, 0x00000200);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
