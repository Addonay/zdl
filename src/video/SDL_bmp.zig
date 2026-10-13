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
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_IO_SEEK_SET: c_int = 0;
pub const SDL_IO_SEEK_CUR: c_int = 1;
pub const enum_SDL_IOWhence = c_uint;
pub const SDL_IOWhence = enum_SDL_IOWhence;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub extern fn SDL_SeekIO_REAL(context: ?*SDL_IOStream, offset: Sint64, whence: SDL_IOWhence) Sint64;
pub extern fn SDL_TellIO_REAL(context: ?*SDL_IOStream) Sint64;
pub extern fn SDL_ReadIO_REAL(context: ?*SDL_IOStream, ptr: ?*anyopaque, size: usize) usize;
pub extern fn SDL_WriteIO_REAL(context: ?*SDL_IOStream, ptr: ?*const anyopaque, size: usize) usize;
pub extern fn SDL_ReadU8_REAL(src: ?*SDL_IOStream, value: [*c]Uint8) bool;
pub extern fn SDL_ReadU16LE_REAL(src: ?*SDL_IOStream, value: [*c]Uint16) bool;
pub extern fn SDL_ReadU32LE_REAL(src: ?*SDL_IOStream, value: [*c]Uint32) bool;
pub extern fn SDL_ReadS32LE_REAL(src: ?*SDL_IOStream, value: [*c]Sint32) bool;
pub extern fn SDL_WriteU8_REAL(dst: ?*SDL_IOStream, value: Uint8) bool;
pub extern fn SDL_WriteU16LE_REAL(dst: ?*SDL_IOStream, value: Uint16) bool;
pub extern fn SDL_WriteU32LE_REAL(dst: ?*SDL_IOStream, value: Uint32) bool;
pub extern fn SDL_WriteS32LE_REAL(dst: ?*SDL_IOStream, value: Sint32) bool;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PIXELTYPE_INDEX2: c_int = 12;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
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
pub extern fn SDL_GetPixelFormatForMasks_REAL(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) SDL_PixelFormat;
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
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_CreateSurfacePalette_REAL(surface: [*c]SDL_Surface) [*c]SDL_Palette;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
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
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub fn readRlePixels(surface: [*c]SDL_Surface, src: ?*SDL_IOStream, isRle8: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pitch: c_int = undefined;
    _ = &pitch;
    var height: c_int = undefined;
    _ = &height;
    var start: [*c]Uint8 = undefined;
    _ = &start;
    var end: [*c]Uint8 = undefined;
    _ = &end;
    var bits: [*c]Uint8 = undefined;
    _ = &bits;
    var spot: [*c]Uint8 = undefined;
    _ = &spot;
    var ofs: c_int = undefined;
    _ = &ofs;
    var ch: Uint8 = undefined;
    _ = &ch;
    var needsPad: Uint8 = undefined;
    _ = &needsPad;
    var pixels_per_byte: c_int = undefined;
    _ = &pixels_per_byte;
    var pixelvalue: Uint8 = undefined;
    _ = &pixelvalue;
    var ich: c_int = undefined;
    _ = &ich;
    var ich_1: c_int = undefined;
    _ = &ich_1;
    var pixelvalue_2: Uint8 = undefined;
    _ = &pixelvalue_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                pitch = surface.*.pitch;
                height = surface.*.h;
                start = @ptrCast(@alignCast(surface.*.pixels));
                end = start + @as(usize, @bitCast(@as(isize, @intCast(height * pitch))));
                bits = end - @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                ofs = 0;
                pixels_per_byte = if (isRle8 != 0) @as(c_int, 1) else @as(c_int, 2);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (true) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (!SDL_ReadU8_REAL(src, &ch)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                return undefined;
            },
            5 => {
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (@as(c_int, ch) != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if (!SDL_ReadU8_REAL(src, &pixelvalue)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                if (!SDL_ReadU8_REAL(src, &ch)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            11 => {
                return @"false" != 0;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                ich = ch;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                spot = &bits[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &ofs;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                if ((spot >= start) and (spot < end)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                if (ich > @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                spot.* = pixelvalue;
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
                ich -= pixels_per_byte;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                return @"false" != 0;
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                switch (@as(c_int, ch)) {
                    @as(c_int, 0) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 26;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            23 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            24 => {
                ofs = 0;
                bits -= @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            25 => {
                return @"true" != 0;
            },
            26 => {
                if (!SDL_ReadU8_REAL(src, &ch)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                return @"false" != 0;
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                ofs += @divTrunc(@as(c_int, ch), pixels_per_byte);
                if ((@as(c_int, ch) & pixels_per_byte) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                ofs += 1;
                {
                    sdl_pc = 32;
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
                if (!SDL_ReadU8_REAL(src, &ch)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                return @"false" != 0;
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                bits -= @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, ch) * pitch))));
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            36 => {
                if (pixels_per_byte == @as(c_int, 1)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                needsPad = @bitCast(@as(i8, @intFromBool((@as(c_int, ch) & @as(c_int, 1)) != @as(c_int, 0))));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                needsPad = @bitCast(@as(i8, @intFromBool((@divTrunc(@as(c_int, ch) + (pixels_per_byte - @as(c_int, 1)), pixels_per_byte) & (pixels_per_byte - @as(c_int, 1))) != @as(c_int, 0))));
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                ich_1 = ch;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (!SDL_ReadU8_REAL(src, &pixelvalue_2)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                if (ich_1 > @as(c_int, 0)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                if ((@as(c_int, needsPad) != 0) and !SDL_ReadU8_REAL(src, &ch)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            43 => {
                return @"false" != 0;
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                spot = &bits[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &ofs;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                if ((spot >= start) and (spot < end)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                spot.* = pixelvalue_2;
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
                ich_1 -= pixels_per_byte;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            49 => {
                return @"false" != 0;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn CorrectAlphaChannel(surface: [*c]SDL_Surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var hasAlpha: bool = @"false" != 0;
    _ = &hasAlpha;
    var alphaChannelOffset: c_int = 3;
    _ = &alphaChannelOffset;
    var alpha: [*c]Uint8 = @as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(alphaChannelOffset))));
    _ = &alpha;
    var end: [*c]Uint8 = alpha + @as(usize, @bitCast(@as(isize, @intCast(surface.*.h * surface.*.pitch))));
    _ = &end;
    while (alpha < end) {
        if (@as(c_int, alpha.*) != @as(c_int, 0)) {
            hasAlpha = @"true" != 0;
            break;
        }
        alpha += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
    }
    if (!hasAlpha) {
        alpha = @as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(alphaChannelOffset))));
        while (alpha < end) {
            alpha.* = SDL_ALPHA_OPAQUE;
            alpha += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
        }
    }
}
pub export fn SDL_IsBMP(src: ?*SDL_IOStream) bool {
    @setEvalBranchQuota(100000);
    var start: Sint64 = undefined;
    _ = &start;
    var magic: [2]Uint8 = undefined;
    _ = &magic;
    var is_BMP: bool = undefined;
    _ = &is_BMP;
    is_BMP = @"false" != 0;
    start = SDL_TellIO_REAL(src);
    if (start >= @as(Sint64, 0)) {
        if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&magic))))), @sizeOf(@TypeOf(magic))) == @sizeOf(@TypeOf(magic))) {
            if ((@as(c_int, magic[@as(c_int, 0)]) == @as(c_int, 'B')) and (@as(c_int, magic[@as(c_int, 1)]) == @as(c_int, 'M'))) {
                is_BMP = @"true" != 0;
            }
        }
        _ = SDL_SeekIO_REAL(src, start, SDL_IO_SEEK_SET);
    }
    return is_BMP;
}
pub export fn SDL_LoadBMP_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_LoadBMP_IO_REAL".*;
    };
    _ = &static_local___func__;
    var was_error: bool = undefined;
    _ = &was_error;
    var fp_offset: Sint64 = undefined;
    _ = &fp_offset;
    var i: c_int = undefined;
    _ = &i;
    var pad: c_int = undefined;
    _ = &pad;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var Rmask: Uint32 = undefined;
    _ = &Rmask;
    var Gmask: Uint32 = undefined;
    _ = &Gmask;
    var Bmask: Uint32 = undefined;
    _ = &Bmask;
    var Amask: Uint32 = undefined;
    _ = &Amask;
    var bits: [*c]Uint8 = undefined;
    _ = &bits;
    var top: [*c]Uint8 = undefined;
    _ = &top;
    var end: [*c]Uint8 = undefined;
    _ = &end;
    var topDown: bool = undefined;
    _ = &topDown;
    var haveRGBMasks: bool = undefined;
    _ = &haveRGBMasks;
    var haveAlphaMask: bool = undefined;
    _ = &haveAlphaMask;
    var correctAlpha: bool = undefined;
    _ = &correctAlpha;
    var bfOffBits: Uint32 = undefined;
    _ = &bfOffBits;
    var biSize: Uint32 = undefined;
    _ = &biSize;
    var biWidth: Sint32 = undefined;
    _ = &biWidth;
    var biHeight: Sint32 = undefined;
    _ = &biHeight;
    var biBitCount: Uint16 = undefined;
    _ = &biBitCount;
    var biCompression: Uint32 = undefined;
    _ = &biCompression;
    var biClrUsed: Uint32 = undefined;
    _ = &biClrUsed;
    var biWidth16: Uint16 = undefined;
    _ = &biWidth16;
    var biHeight16: Uint16 = undefined;
    _ = &biHeight16;
    var headerSize: Uint32 = undefined;
    _ = &headerSize;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!haveRGBMasks",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    const static_local_sdl_assert_data_1 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!haveAlphaMask",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_1;
    var sdl_assert_state_2: SDL_AssertState = undefined;
    _ = &sdl_assert_state_2;
    var format: SDL_PixelFormat = undefined;
    _ = &format;
    var palette: [*c]SDL_Palette = undefined;
    _ = &palette;
    var padbyte: Uint8 = undefined;
    _ = &padbyte;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                was_error = @"true" != 0;
                fp_offset = 0;
                Rmask = 0;
                Gmask = 0;
                Bmask = 0;
                Amask = 0;
                haveRGBMasks = @"false" != 0;
                haveAlphaMask = @"false" != 0;
                correctAlpha = @"false" != 0;
                biWidth = 0;
                biHeight = 0;
                biBitCount = 0;
                biCompression = 0;
                biClrUsed = 0;
                surface = null;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (was_error) {
                    sdl_pc = 197;
                    continue;
                } else {
                    sdl_pc = 198;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
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
                fp_offset = SDL_TellIO_REAL(src);
                if (fp_offset < @as(Sint64, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                _ = SDL_ClearError_REAL();
                if (!SDL_IsBMP(src)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("File is not a Windows BMP file");
                {
                    sdl_pc = 1;
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
                if ((((!SDL_ReadU16LE_REAL(src, null) or !SDL_ReadU32LE_REAL(src, null)) or !SDL_ReadU16LE_REAL(src, null)) or !SDL_ReadU16LE_REAL(src, null)) or !SDL_ReadU32LE_REAL(src, &bfOffBits)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_ReadU32LE_REAL(src, &biSize)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (biSize == @as(Uint32, 12)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                if (((!SDL_ReadU16LE_REAL(src, &biWidth16) or !SDL_ReadU16LE_REAL(src, &biHeight16)) or !SDL_ReadU16LE_REAL(src, null)) or !SDL_ReadU16LE_REAL(src, &biBitCount)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                if (biSize >= @as(Uint32, 40)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            19 => {
                if ((biWidth <= @as(c_int, 0)) or (biHeight == @as(c_int, 0))) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 1;
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
                biWidth = biWidth16;
                biHeight = biHeight16;
                biCompression = BI_RGB;
                biClrUsed = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                if (((((((((!SDL_ReadS32LE_REAL(src, &biWidth) or !SDL_ReadS32LE_REAL(src, &biHeight)) or !SDL_ReadU16LE_REAL(src, null)) or !SDL_ReadU16LE_REAL(src, &biBitCount)) or !SDL_ReadU32LE_REAL(src, &biCompression)) or !SDL_ReadU32LE_REAL(src, null)) or !SDL_ReadU32LE_REAL(src, null)) or !SDL_ReadU32LE_REAL(src, null)) or !SDL_ReadU32LE_REAL(src, &biClrUsed)) or !SDL_ReadU32LE_REAL(src, null)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 1;
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
                if (biSize != @as(Uint32, 64)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                if (biCompression == @as(Uint32, BI_BITFIELDS)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                headerSize = @bitCast(@as(c_int, @truncate(SDL_TellIO_REAL(src) - (fp_offset + @as(Sint64, 14)))));
                if (biSize > headerSize) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            32 => {
                haveRGBMasks = @"true" != 0;
                if ((!SDL_ReadU32LE_REAL(src, &Rmask) or !SDL_ReadU32LE_REAL(src, &Gmask)) or !SDL_ReadU32LE_REAL(src, &Bmask)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (biSize >= @as(Uint32, 52)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (biSize >= @as(Uint32, 56)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                haveAlphaMask = @"true" != 0;
                if (!SDL_ReadU32LE_REAL(src, &Amask)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                    sdl_pc = 34;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                if ((!SDL_ReadU32LE_REAL(src, null) or !SDL_ReadU32LE_REAL(src, null)) or !SDL_ReadU32LE_REAL(src, null)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
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
                if (biSize >= @as(Uint32, 56)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                if (!SDL_ReadU32LE_REAL(src, null)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
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
                    sdl_pc = 34;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                if (SDL_SeekIO_REAL(src, biSize -% headerSize, SDL_IO_SEEK_CUR) < @as(Sint64, 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                _ = SDL_SetError_REAL("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
                {
                    sdl_pc = 1;
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
                if (biHeight < @as(c_int, 0)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                topDown = @"true" != 0;
                biHeight = -biHeight;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                topDown = @"false" != 0;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (SDL_strcmp_REAL(SDL_GetError_REAL(), "") != @as(c_int, 0)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 1;
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
                switch (@as(c_int, biBitCount)) {
                    @as(c_int, 0) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(c_int, 7) => {
                        sdl_pc = 76;
                        continue;
                    },
                    else => {
                        sdl_pc = 77;
                        continue;
                    },
                }
            },
            71 => {
                switch (biCompression) {
                    @as(Uint32, BI_RGB) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(Uint32, BI_BITFIELDS) => {
                        sdl_pc = 110;
                        continue;
                    },
                    else => {
                        sdl_pc = 111;
                        continue;
                    },
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
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
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                _ = SDL_SetError_REAL("%u bpp BMP images are not supported", biBitCount);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            78 => {
                format = SDL_GetPixelFormatForMasks_REAL(biBitCount, Rmask, Gmask, Bmask, Amask);
                surface = SDL_CreateSurfaceUninitialized(biWidth, biHeight, format);
                if (!(surface != null)) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
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
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            83 => {
                if (!!haveRGBMasks) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_bmp.c", 394);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
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
                    sdl_pc = 83;
                    continue;
                }
            },
            87 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 91;
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
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                switch (@as(c_int, biBitCount)) {
                    @as(c_int, 15) => {
                        sdl_pc = 105;
                        continue;
                    },
                    @as(c_int, 16) => {
                        sdl_pc = 106;
                        continue;
                    },
                    @as(c_int, 24) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(c_int, 32) => {
                        sdl_pc = 108;
                        continue;
                    },
                    else => {
                        sdl_pc = 109;
                        continue;
                    },
                }
            },
            95 => {
                if (!!haveAlphaMask) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                sdl_assert_state_2 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_1.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_bmp.c", 395);
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            99 => {
                if (sdl_assert_state_2 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            101 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 78;
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
                Rmask = 31744;
                Gmask = 992;
                Bmask = 31;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            107 => {
                Rmask = 16711680;
                Gmask = 65280;
                Bmask = 255;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            108 => {
                correctAlpha = @"true" != 0;
                Amask = 4278190080;
                Rmask = 16711680;
                Gmask = 65280;
                Bmask = 255;
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            109 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 1;
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
                if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                palette = SDL_CreateSurfacePalette_REAL(surface);
                if (!(palette != null)) {
                    sdl_pc = 118;
                    continue;
                } else {
                    sdl_pc = 119;
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
                if (SDL_SeekIO_REAL(src, fp_offset + @as(Sint64, bfOffBits), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 153;
                    continue;
                } else {
                    sdl_pc = 154;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 1;
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
                if (SDL_SeekIO_REAL(src, (fp_offset + @as(Sint64, 14)) + @as(Sint64, biSize), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
                    continue;
                }
            },
            121 => {
                _ = SDL_SetError_REAL("Error seeking in datastream");
                {
                    sdl_pc = 1;
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
                if (@as(c_int, biBitCount) >= @as(c_int, 32)) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                _ = SDL_SetError_REAL("Unsupported or incorrect biBitCount field");
                {
                    sdl_pc = 1;
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
                if (biClrUsed == @as(Uint32, 0)) {
                    sdl_pc = 127;
                    continue;
                } else {
                    sdl_pc = 128;
                    continue;
                }
            },
            127 => {
                biClrUsed = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, biBitCount))));
                {
                    sdl_pc = 129;
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
                if (biClrUsed > @as(Uint32, @bitCast(@as(c_int, palette.*.ncolors)))) {
                    sdl_pc = 130;
                    continue;
                } else {
                    sdl_pc = 131;
                    continue;
                }
            },
            130 => {
                biClrUsed = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, biBitCount))));
                if (biClrUsed > @as(Uint32, @bitCast(@as(c_int, palette.*.ncolors)))) {
                    sdl_pc = 133;
                    continue;
                } else {
                    sdl_pc = 134;
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
                palette.*.ncolors = @bitCast(@as(c_uint, @truncate(biClrUsed)));
                if (biSize == @as(Uint32, 12)) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 137;
                    continue;
                }
            },
            133 => {
                _ = SDL_SetError_REAL("Unsupported or incorrect biClrUsed field");
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 132;
                    continue;
                }
            },
            136 => {
                i = 0;
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                i = 0;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 117;
                    continue;
                }
            },
            139 => {
                if (i < palette.*.ncolors) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            140 => {
                if ((!SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b) or !SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g)) or !SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r)) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            141 => {
                i += 1;
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 1;
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
                palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a = SDL_ALPHA_OPAQUE;
                {
                    sdl_pc = 141;
                    continue;
                }
            },
            146 => {
                if (i < palette.*.ncolors) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            147 => {
                if (((!SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b) or !SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g)) or !SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r)) or !SDL_ReadU8_REAL(src, &palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a)) {
                    sdl_pc = 150;
                    continue;
                } else {
                    sdl_pc = 151;
                    continue;
                }
            },
            148 => {
                i += 1;
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 138;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 152;
                    continue;
                }
            },
            152 => {
                palette.*.colors[@bitCast(@as(isize, @intCast(i)))].a = SDL_ALPHA_OPAQUE;
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            153 => {
                _ = SDL_SetError_REAL("Error seeking in datastream");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            154 => {
                {
                    sdl_pc = 155;
                    continue;
                }
            },
            155 => {
                if ((biCompression == @as(Uint32, BI_RLE4)) or (biCompression == @as(Uint32, BI_RLE8))) {
                    sdl_pc = 156;
                    continue;
                } else {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                if (!readRlePixels(surface, src, @intFromBool(biCompression == @as(Uint32, BI_RLE8)))) {
                    sdl_pc = 159;
                    continue;
                } else {
                    sdl_pc = 160;
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
                top = @ptrCast(@alignCast(surface.*.pixels));
                end = @as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(surface.*.h * surface.*.pitch))));
                pad = if (__helpers.signedRemainder(surface.*.pitch, @as(c_int, 4)) != 0) @as(c_int, 4) - __helpers.signedRemainder(surface.*.pitch, @as(c_int, 4)) else @as(c_int, 0);
                if (topDown) {
                    sdl_pc = 162;
                    continue;
                } else {
                    sdl_pc = 163;
                    continue;
                }
            },
            159 => {
                _ = SDL_SetError_REAL("Error reading from datastream");
                {
                    sdl_pc = 1;
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
                was_error = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            162 => {
                bits = top;
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            163 => {
                bits = end - @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
                {
                    sdl_pc = 164;
                    continue;
                }
            },
            164 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            165 => {
                if ((bits >= top) and (bits < end)) {
                    sdl_pc = 166;
                    continue;
                } else {
                    sdl_pc = 167;
                    continue;
                }
            },
            166 => {
                if (SDL_ReadIO_REAL(src, @ptrCast(@alignCast(bits)), @bitCast(@as(c_long, surface.*.pitch))) != @as(usize, @bitCast(@as(c_long, surface.*.pitch)))) {
                    sdl_pc = 168;
                    continue;
                } else {
                    sdl_pc = 169;
                    continue;
                }
            },
            167 => {
                if (correctAlpha) {
                    sdl_pc = 194;
                    continue;
                } else {
                    sdl_pc = 195;
                    continue;
                }
            },
            168 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            169 => {
                {
                    sdl_pc = 170;
                    continue;
                }
            },
            170 => {
                if (((@as(c_int, biBitCount) == @as(c_int, 8)) and (surface.*.palette != null)) and (biClrUsed < (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, biBitCount)))))))) {
                    sdl_pc = 171;
                    continue;
                } else {
                    sdl_pc = 172;
                    continue;
                }
            },
            171 => {
                i = 0;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            172 => {
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            173 => {
                if (pad != 0) {
                    sdl_pc = 181;
                    continue;
                } else {
                    sdl_pc = 182;
                    continue;
                }
            },
            174 => {
                if (i < surface.*.w) {
                    sdl_pc = 175;
                    continue;
                } else {
                    sdl_pc = 177;
                    continue;
                }
            },
            175 => {
                if (@as(Uint32, @bitCast(@as(c_int, @as(c_int, bits[@bitCast(@as(isize, @intCast(i)))])))) >= biClrUsed) {
                    sdl_pc = 178;
                    continue;
                } else {
                    sdl_pc = 179;
                    continue;
                }
            },
            176 => {
                i += 1;
                {
                    sdl_pc = 174;
                    continue;
                }
            },
            177 => {
                {
                    sdl_pc = 173;
                    continue;
                }
            },
            178 => {
                _ = SDL_SetError_REAL("A BMP image contains a pixel with a color out of the palette");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            179 => {
                {
                    sdl_pc = 180;
                    continue;
                }
            },
            180 => {
                {
                    sdl_pc = 176;
                    continue;
                }
            },
            181 => {
                i = 0;
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            182 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            183 => {
                if (topDown) {
                    sdl_pc = 191;
                    continue;
                } else {
                    sdl_pc = 192;
                    continue;
                }
            },
            184 => {
                if (i < pad) {
                    sdl_pc = 185;
                    continue;
                } else {
                    sdl_pc = 187;
                    continue;
                }
            },
            185 => {
                if (!SDL_ReadU8_REAL(src, &padbyte)) {
                    sdl_pc = 188;
                    continue;
                } else {
                    sdl_pc = 189;
                    continue;
                }
            },
            186 => {
                i += 1;
                {
                    sdl_pc = 184;
                    continue;
                }
            },
            187 => {
                {
                    sdl_pc = 183;
                    continue;
                }
            },
            188 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 186;
                    continue;
                }
            },
            191 => {
                bits += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            192 => {
                bits -= @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
                {
                    sdl_pc = 193;
                    continue;
                }
            },
            193 => {
                {
                    sdl_pc = 165;
                    continue;
                }
            },
            194 => {
                CorrectAlphaChannel(surface);
                {
                    sdl_pc = 196;
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
                was_error = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            197 => {
                if (src != null) {
                    sdl_pc = 200;
                    continue;
                } else {
                    sdl_pc = 201;
                    continue;
                }
            },
            198 => {
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            199 => {
                if (closeio and (src != null)) {
                    sdl_pc = 203;
                    continue;
                } else {
                    sdl_pc = 204;
                    continue;
                }
            },
            200 => {
                _ = SDL_SeekIO_REAL(src, fp_offset, SDL_IO_SEEK_SET);
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            201 => {
                {
                    sdl_pc = 202;
                    continue;
                }
            },
            202 => {
                SDL_DestroySurface_REAL(surface);
                surface = null;
                {
                    sdl_pc = 199;
                    continue;
                }
            },
            203 => {
                _ = SDL_CloseIO_REAL(src);
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            204 => {
                {
                    sdl_pc = 205;
                    continue;
                }
            },
            205 => {
                return surface;
            },
            else => unreachable,
        }
    }
}
pub const BMPSaveState = extern struct {
    surface: [*c]SDL_Surface = null,
    intermediate_surface: [*c]SDL_Surface = null,
    save32bit: bool = false,
    saveLegacyBMP: bool = false,
};
pub fn FreeBMPSaveState(state: [*c]BMPSaveState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((state.*.intermediate_surface != null) and (state.*.intermediate_surface != state.*.surface)) {
        SDL_DestroySurface_REAL(state.*.intermediate_surface);
    }
}
pub fn InitBMPSaveState(state: [*c]BMPSaveState, surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var pixel_format: SDL_PixelFormat = undefined;
    _ = &pixel_format;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                state.*.surface = surface;
                state.*.intermediate_surface = null;
                state.*.save32bit = @"false" != 0;
                state.*.saveLegacyBMP = @"false" != 0;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                FreeBMPSaveState(state);
                return @"false" != 0;
            },
            2 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) >= @as(c_int, 8)) and ((((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) or ((surface.*.map.info.flags & SDL_COPY_COLORKEY) != 0))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                state.*.save32bit = @"true" != 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if ((surface.*.palette != null) and !state.*.save32bit) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                if ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 8)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                if (((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGR24)) and !state.*.save32bit) or ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA32)) and state.*.save32bit)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            10 => {
                if (state.*.save32bit) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            11 => {
                state.*.intermediate_surface = surface;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                _ = SDL_SetError_REAL("%u bpp BMP files not supported", if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                state.*.intermediate_surface = surface;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                if (state.*.save32bit) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                pixel_format = SDL_PIXELFORMAT_BGRA32;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                pixel_format = SDL_PIXELFORMAT_BGR24;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                state.*.intermediate_surface = SDL_ConvertSurface_REAL(surface, pixel_format);
                if (!(state.*.intermediate_surface != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetError_REAL("Couldn't convert image to %d bpp", if ((pixel_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((pixel_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((pixel_format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            23 => {
                state.*.saveLegacyBMP = SDL_GetHintBoolean_REAL("SDL_BMP_SAVE_LEGACY_FORMAT", @"false" != 0);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_LoadBMP_REAL(file: [*c]const u8) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        return null;
    }
    return SDL_LoadBMP_IO_REAL(stream, @"true" != 0);
}
pub fn SDL_SaveBMP_IO_Internal(state: [*c]BMPSaveState, dst: ?*SDL_IOStream, closeio: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var was_error: bool = undefined;
    _ = &was_error;
    var fp_offset: Sint64 = undefined;
    _ = &fp_offset;
    var new_offset: Sint64 = undefined;
    _ = &new_offset;
    var i: c_int = undefined;
    _ = &i;
    var pad: c_int = undefined;
    _ = &pad;
    var bits: [*c]Uint8 = undefined;
    _ = &bits;
    var magic: [2]u8 = undefined;
    _ = &magic;
    var bfSize: Uint32 = undefined;
    _ = &bfSize;
    var bfReserved1: Uint16 = undefined;
    _ = &bfReserved1;
    var bfReserved2: Uint16 = undefined;
    _ = &bfReserved2;
    var bfOffBits: Uint32 = undefined;
    _ = &bfOffBits;
    var biSize: Uint32 = undefined;
    _ = &biSize;
    var biWidth: Sint32 = undefined;
    _ = &biWidth;
    var biHeight: Sint32 = undefined;
    _ = &biHeight;
    var biPlanes: Uint16 = undefined;
    _ = &biPlanes;
    var biBitCount: Uint16 = undefined;
    _ = &biBitCount;
    var biCompression: Uint32 = undefined;
    _ = &biCompression;
    var biSizeImage: Uint32 = undefined;
    _ = &biSizeImage;
    var biXPelsPerMeter: Sint32 = undefined;
    _ = &biXPelsPerMeter;
    var biYPelsPerMeter: Sint32 = undefined;
    _ = &biYPelsPerMeter;
    var biClrUsed: Uint32 = undefined;
    _ = &biClrUsed;
    var biClrImportant: Uint32 = undefined;
    _ = &biClrImportant;
    var bV4RedMask: Uint32 = undefined;
    _ = &bV4RedMask;
    var bV4GreenMask: Uint32 = undefined;
    _ = &bV4GreenMask;
    var bV4BlueMask: Uint32 = undefined;
    _ = &bV4BlueMask;
    var bV4AlphaMask: Uint32 = undefined;
    _ = &bV4AlphaMask;
    var bV4CSType: Uint32 = undefined;
    _ = &bV4CSType;
    var bV4Endpoints: [9]Sint32 = undefined;
    _ = &bV4Endpoints;
    var bV4GammaRed: Uint32 = undefined;
    _ = &bV4GammaRed;
    var bV4GammaGreen: Uint32 = undefined;
    _ = &bV4GammaGreen;
    var bV4GammaBlue: Uint32 = undefined;
    _ = &bV4GammaBlue;
    var bV5Intent: Uint32 = undefined;
    _ = &bV5Intent;
    var bV5ProfileData: Uint32 = undefined;
    _ = &bV5ProfileData;
    var bV5ProfileSize: Uint32 = undefined;
    _ = &bV5ProfileSize;
    var bV5Reserved: Uint32 = undefined;
    _ = &bV5Reserved;
    var bw: usize = undefined;
    _ = &bw;
    var colors: [*c]SDL_Color = undefined;
    _ = &colors;
    var ncolors: c_int = undefined;
    _ = &ncolors;
    var padbyte: Uint8 = undefined;
    _ = &padbyte;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                was_error = @"true" != 0;
                magic = [2]u8{
                    'B',
                    'M',
                };
                bV4RedMask = 0;
                bV4GreenMask = 0;
                bV4BlueMask = 0;
                bV4AlphaMask = 0;
                bV4CSType = 0;
                bV4Endpoints = [1]Sint32{
                    0,
                } ++ @as([8]Sint32, @splat(0));
                bV4GammaRed = 0;
                bV4GammaGreen = 0;
                bV4GammaBlue = 0;
                bV5Intent = 0;
                bV5ProfileData = 0;
                bV5ProfileSize = 0;
                bV5Reserved = 0;
                if (SDL_LockSurface_REAL(state.*.intermediate_surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (closeio and (dst != null)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            2 => {
                bw = @bitCast(@as(c_long, state.*.intermediate_surface.*.w * @as(c_int, state.*.intermediate_surface.*.fmt.*.bytes_per_pixel)));
                bfSize = 0;
                bfReserved1 = 0;
                bfReserved2 = 0;
                bfOffBits = 0;
                fp_offset = SDL_TellIO_REAL(dst);
                if (fp_offset < @as(Sint64, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (((((SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&magic))))), 2) != @as(usize, 2)) or !SDL_WriteU32LE_REAL(dst, bfSize)) or !SDL_WriteU16LE_REAL(dst, bfReserved1)) or !SDL_WriteU16LE_REAL(dst, bfReserved2)) or !SDL_WriteU32LE_REAL(dst, bfOffBits)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
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
                biSize = 40;
                biWidth = state.*.intermediate_surface.*.w;
                biHeight = state.*.intermediate_surface.*.h;
                biPlanes = 1;
                biBitCount = state.*.intermediate_surface.*.fmt.*.bits_per_pixel;
                biCompression = BI_RGB;
                biSizeImage = @bitCast(@as(c_int, state.*.intermediate_surface.*.h * state.*.intermediate_surface.*.pitch));
                biXPelsPerMeter = 0;
                biYPelsPerMeter = 0;
                if (state.*.intermediate_surface.*.palette != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                biClrUsed = @bitCast(@as(c_int, state.*.intermediate_surface.*.palette.*.ncolors));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                biClrUsed = 0;
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                biClrImportant = 0;
                if (state.*.save32bit and !state.*.saveLegacyBMP) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                biSize = 124;
                biCompression = BI_BITFIELDS;
                bV4RedMask = 16711680;
                bV4GreenMask = 65280;
                bV4BlueMask = 255;
                bV4AlphaMask = 4278190080;
                bV4CSType = LCS_sRGB;
                bV4GammaRed = 0;
                bV4GammaGreen = 0;
                bV4GammaBlue = 0;
                bV5Intent = LCS_GM_GRAPHICS;
                bV5ProfileData = 0;
                bV5ProfileSize = 0;
                bV5Reserved = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if ((((((((((!SDL_WriteU32LE_REAL(dst, biSize) or !SDL_WriteS32LE_REAL(dst, biWidth)) or !SDL_WriteS32LE_REAL(dst, biHeight)) or !SDL_WriteU16LE_REAL(dst, biPlanes)) or !SDL_WriteU16LE_REAL(dst, biBitCount)) or !SDL_WriteU32LE_REAL(dst, biCompression)) or !SDL_WriteU32LE_REAL(dst, biSizeImage)) or !SDL_WriteU32LE_REAL(dst, @bitCast(@as(c_int, biXPelsPerMeter)))) or !SDL_WriteU32LE_REAL(dst, @bitCast(@as(c_int, biYPelsPerMeter)))) or !SDL_WriteU32LE_REAL(dst, biClrUsed)) or !SDL_WriteU32LE_REAL(dst, biClrImportant)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
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
                if (state.*.save32bit and !state.*.saveLegacyBMP) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                if ((((!SDL_WriteU32LE_REAL(dst, bV4RedMask) or !SDL_WriteU32LE_REAL(dst, bV4GreenMask)) or !SDL_WriteU32LE_REAL(dst, bV4BlueMask)) or !SDL_WriteU32LE_REAL(dst, bV4AlphaMask)) or !SDL_WriteU32LE_REAL(dst, bV4CSType)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
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
                if (state.*.intermediate_surface.*.palette != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                i = 0;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (i < (@as(c_int, 3) * @as(c_int, 3))) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                if (!SDL_WriteU32LE_REAL(dst, @bitCast(@as(c_int, bV4Endpoints[@bitCast(@as(isize, @intCast(i)))])))) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            28 => {
                i += 1;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                if ((!SDL_WriteU32LE_REAL(dst, bV4GammaRed) or !SDL_WriteU32LE_REAL(dst, bV4GammaGreen)) or !SDL_WriteU32LE_REAL(dst, bV4GammaBlue)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 28;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 1;
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
                if (((!SDL_WriteU32LE_REAL(dst, bV5Intent) or !SDL_WriteU32LE_REAL(dst, bV5ProfileData)) or !SDL_WriteU32LE_REAL(dst, bV5ProfileSize)) or !SDL_WriteU32LE_REAL(dst, bV5Reserved)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 22;
                    continue;
                }
            },
            39 => {
                colors = state.*.intermediate_surface.*.palette.*.colors;
                ncolors = state.*.intermediate_surface.*.palette.*.ncolors;
                i = 0;
                {
                    sdl_pc = 42;
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
                bfOffBits = @bitCast(@as(c_int, @truncate(SDL_TellIO_REAL(dst) - fp_offset)));
                if (SDL_SeekIO_REAL(dst, fp_offset + @as(Sint64, 10), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            42 => {
                if (i < ncolors) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                if (((!SDL_WriteU8_REAL(dst, colors[@bitCast(@as(isize, @intCast(i)))].b) or !SDL_WriteU8_REAL(dst, colors[@bitCast(@as(isize, @intCast(i)))].g)) or !SDL_WriteU8_REAL(dst, colors[@bitCast(@as(isize, @intCast(i)))].r)) or !SDL_WriteU8_REAL(dst, colors[@bitCast(@as(isize, @intCast(i)))].a)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            44 => {
                i += 1;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 1;
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
                    sdl_pc = 44;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_WriteU32LE_REAL(dst, bfOffBits)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 1;
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
                if (SDL_SeekIO_REAL(dst, fp_offset + @as(Sint64, bfOffBits), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
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
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                bits = @as([*c]Uint8, @ptrCast(@alignCast(state.*.intermediate_surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(state.*.intermediate_surface.*.h * state.*.intermediate_surface.*.pitch))));
                pad = @bitCast(@as(c_uint, @truncate(if ((bw % @as(usize, 4)) != 0) @as(usize, 4) -% (bw % @as(usize, 4)) else @as(usize, 0))));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (bits > @as([*c]Uint8, @ptrCast(@alignCast(state.*.intermediate_surface.*.pixels)))) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                bits -= @as(usize, @bitCast(@as(isize, @intCast(state.*.intermediate_surface.*.pitch))));
                if (SDL_WriteIO_REAL(dst, @ptrCast(@alignCast(bits)), bw) != bw) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            60 => {
                new_offset = SDL_TellIO_REAL(dst);
                if (new_offset < @as(Sint64, 0)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 1;
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
                if (pad != 0) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                padbyte = 0;
                i = 0;
                {
                    sdl_pc = 67;
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
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            67 => {
                if (i < pad) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                if (!SDL_WriteU8_REAL(dst, padbyte)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            69 => {
                i += 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 66;
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
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            74 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                bfSize = @bitCast(@as(c_int, @truncate(new_offset - fp_offset)));
                if (SDL_SeekIO_REAL(dst, fp_offset + @as(Sint64, 2), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                if (!SDL_WriteU32LE_REAL(dst, bfSize)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (SDL_SeekIO_REAL(dst, fp_offset + @as(Sint64, bfSize), SDL_IO_SEEK_SET) < @as(Sint64, 0)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            85 => {
                SDL_UnlockSurface_REAL(state.*.intermediate_surface);
                was_error = @"false" != 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            86 => {
                if (!SDL_CloseIO_REAL(dst)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                if (was_error) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            89 => {
                was_error = @"true" != 0;
                {
                    sdl_pc = 91;
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
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            92 => {
                return @"false" != 0;
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SaveBMP_IO_REAL(surface: [*c]SDL_Surface, dst: ?*SDL_IOStream, closeio: bool) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var state: BMPSaveState = undefined;
    _ = &state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                if (!InitBMPSaveState(&state, surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                FreeBMPSaveState(&state);
                return result;
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!(dst != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                result = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                result = SDL_SaveBMP_IO_Internal(&state, dst, closeio);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SaveBMP_REAL(surface: [*c]SDL_Surface, file: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var state: BMPSaveState = undefined;
    _ = &state;
    if (!InitBMPSaveState(&state, surface)) {
        return @"false" != 0;
    }
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "wb");
    _ = &stream;
    if (!(stream != null)) {
        return @"false" != 0;
    }
    var result: bool = SDL_SaveBMP_IO_Internal(&state, stream, @"true" != 0);
    _ = &result;
    FreeBMPSaveState(&state);
    return result;
}

pub const SDL_LoadBMP = SDL_LoadBMP_REAL;
pub const SDL_LoadBMP_IO = SDL_LoadBMP_IO_REAL;
pub const SDL_SaveBMP = SDL_SaveBMP_REAL;
pub const SDL_SaveBMP_IO = SDL_SaveBMP_IO_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_COPY_COLORKEY = @as(c_int, 0x00000400);
pub const BI_RGB = @as(c_int, 0);
pub const BI_RLE8 = @as(c_int, 1);
pub const BI_RLE4 = @as(c_int, 2);
pub const BI_BITFIELDS = @as(c_int, 3);
pub const LCS_sRGB = __helpers.promoteIntLiteral(c_int, 0x73524742, .hex);
pub const LCS_GM_GRAPHICS = @as(c_int, 0x00000002);
