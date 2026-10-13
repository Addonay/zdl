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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_alloc_zero_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_round_REAL(x: f64) f64;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub inline fn SDL_size_mul_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.mul_overflow(a, b, ret))) == @as(c_int, 0);
}
pub inline fn SDL_size_add_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.add_overflow(a, b, ret))) == @as(c_int, 0);
}
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
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_CopyProperties_REAL(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: f32) f32;
pub extern fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_IOStream = opaque {
};
pub const SDL_IOStream = struct_SDL_IOStream;
pub extern fn SDL_IOFromFile_REAL(file: [*c]const u8, mode: [*c]const u8) ?*SDL_IOStream;
pub extern fn SDL_CloseIO_REAL(context: ?*SDL_IOStream) bool;
pub const SDL_BlendMode = Uint32;
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
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_RGBA128_FLOAT: c_int = 455114768;
pub const SDL_PIXELFORMAT_ARGB128_FLOAT: c_int = 456163344;
pub const SDL_PIXELFORMAT_ABGR128_FLOAT: c_int = 459309072;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLOR_PRIMARIES_BT709: c_int = 1;
pub const enum_SDL_ColorPrimaries = c_uint;
pub const SDL_ColorPrimaries = enum_SDL_ColorPrimaries;
pub const SDL_TRANSFER_CHARACTERISTICS_LINEAR: c_int = 8;
pub const SDL_TRANSFER_CHARACTERISTICS_PQ: c_int = 16;
pub const enum_SDL_TransferCharacteristics = c_uint;
pub const SDL_TransferCharacteristics = enum_SDL_TransferCharacteristics;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_SRGB_LINEAR: c_int = 301991168;
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
pub extern fn SDL_GetPixelFormatDetails_REAL(format: SDL_PixelFormat) [*c]const SDL_PixelFormatDetails;
pub extern fn SDL_CreatePalette_REAL(ncolors: c_int) [*c]SDL_Palette;
pub extern fn SDL_DestroyPalette_REAL(palette: [*c]SDL_Palette) void;
pub extern fn SDL_MapRGBA_REAL(format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub extern fn SDL_GetRGBA_REAL(pixelvalue: Uint32, format: [*c]const SDL_PixelFormatDetails, palette: [*c]const SDL_Palette, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) void;
pub const struct_SDL_FPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const SDL_SCALEMODE_PIXELART: c_int = 2;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
pub const SDL_FLIP_VERTICAL: c_int = 2;
pub const SDL_FLIP_HORIZONTAL_AND_VERTICAL: c_int = 3;
pub const enum_SDL_FlipMode = c_uint;
pub const SDL_FlipMode = enum_SDL_FlipMode;
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
pub extern fn SDL_LoadBMP_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface;
pub extern fn SDL_LoadPNG_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface;
pub extern fn SDL_LoadJPG_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface;
pub extern fn SDL_FillSurfaceRect_REAL(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: Uint32) bool;
pub extern fn SDL_StretchSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
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
pub extern fn SDL_IsBMP(src: ?*SDL_IOStream) bool;
pub extern fn SDL_IsJPG(src: ?*SDL_IOStream) bool;
pub extern fn SDL_IsPNG(src: ?*SDL_IOStream) bool;
pub extern fn SDL_UnRLESurface(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetDefaultColorspaceForFormat(pixel_format: SDL_PixelFormat) SDL_Colorspace;
pub extern fn SDL_ValidateMap(src: [*c]SDL_Surface, dst: [*c]SDL_Surface) bool;
pub extern fn SDL_InvalidateMap(map: [*c]SDL_BlitMap) void;
pub extern fn SDL_IsSamePalette(src: [*c]const SDL_Palette, dst: [*c]const SDL_Palette) bool;
pub extern fn SDL_DitherPalette(palette: [*c]SDL_Palette) void;
pub extern fn SDL_DetectPalette(pal: [*c]const SDL_Palette, is_opaque: [*c]bool, has_alpha_channel: [*c]bool) void;
pub extern fn SDLgfx_rotateSurface(src: [*c]SDL_Surface, angle: f64, smooth: c_int, flipx: c_int, flipy: c_int, rect_dest: [*c]const SDL_Rect, cangle: f64, sangle: f64, center: [*c]const SDL_FPoint) [*c]SDL_Surface;
pub extern fn SDLgfx_rotozoomSurfaceSizeTrig(width: c_int, height: c_int, angle: f64, center: [*c]const SDL_FPoint, rect_dest: [*c]SDL_Rect, cangle: [*c]f64, sangle: [*c]f64) void;
pub extern fn SDL_ConvertPixels_STB(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixels_YUV_to_RGB(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixels_RGB_to_YUV(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixels_YUV_to_YUV(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool;
pub var SDL_surface_magic: u8 = 0;
pub export fn SDL_SurfaceValid(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    return (surface != null) and (surface.*.reserved == @as(?*anyopaque, @ptrCast(@alignCast(&SDL_surface_magic))));
}
pub export fn SDL_UpdateSurfaceLockFlag(surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (((surface.*.flags & SDL_SURFACE_LOCKED) != 0) or ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0)) {
        surface.*.flags |= SDL_SURFACE_LOCK_NEEDED;
    } else {
        surface.*.flags &= ~SDL_SURFACE_LOCK_NEEDED;
    }
}
pub fn SDL_CalculateRGBSize(format: Uint32, width: usize, height: usize, size: [*c]usize, pitch: [*c]usize, minimal: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((if ((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) @as(Uint32, 0) else (format >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255)) >= @as(Uint32, 8)) {
        if (!SDL_size_mul_check_overflow_builtin(width, if ((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) @as(Uint32, @bitCast(@as(c_int, if ((((((format == @as(Uint32, SDL_PIXELFORMAT_YUY2)) or (format == @as(Uint32, SDL_PIXELFORMAT_UYVY))) or (format == @as(Uint32, SDL_PIXELFORMAT_YVYU))) or (format == @as(Uint32, SDL_PIXELFORMAT_P010))) or (format == @as(Uint32, SDL_PIXELFORMAT_I0FL))) or (format == @as(Uint32, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1)))) else (format >> @intCast(@as(Uint32, 0))) & @as(Uint32, 255), pitch)) {
            return SDL_SetError_REAL("width * bpp would overflow");
        }
    } else {
        if (!SDL_size_mul_check_overflow_builtin(width, if ((format != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(((format >> @intCast(@as(Uint32, 28))) & @as(Uint32, 15)) != @as(Uint32, 1))))) != 0)) @as(Uint32, 0) else (format >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255), pitch)) {
            return SDL_SetError_REAL("width * bpp would overflow");
        }
        if (!SDL_size_add_check_overflow_builtin(pitch.*, 7, pitch)) {
            return SDL_SetError_REAL("aligning pitch would overflow");
        }
        pitch.* /= 8;
    }
    if (!minimal) {
        if (!SDL_size_add_check_overflow_builtin(pitch.*, 3, pitch)) {
            return SDL_SetError_REAL("aligning pitch would overflow");
        }
        pitch.* &= @bitCast(@as(c_long, ~@as(c_int, 3)));
    }
    if (!SDL_size_mul_check_overflow_builtin(height, pitch.*, size)) {
        return SDL_SetError_REAL("height * pitch would overflow");
    }
    return @"true" != 0;
}
pub export fn SDL_CalculateSurfaceSize(format: SDL_PixelFormat, width: c_int, height: c_int, size: [*c]usize, pitch: [*c]usize, minimalPitch: bool) bool {
    @setEvalBranchQuota(100000);
    var p: usize = 0;
    _ = &p;
    var sz: usize = 0;
    _ = &sz;
    if (size != null) {
        size.* = 0;
    }
    if (pitch != null) {
        pitch.* = 0;
    }
    if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
            return @"true" != 0;
        }
        if (!SDL_CalculateYUVSize(format, width, height, &sz, &p)) {
            return @"false" != 0;
        }
    } else {
        if (!SDL_CalculateRGBSize(format, @bitCast(@as(c_long, width)), @bitCast(@as(c_long, height)), &sz, &p, minimalPitch)) {
            return @"false" != 0;
        }
    }
    if (size != null) {
        size.* = sz;
    }
    if (pitch != null) {
        pitch.* = p;
    }
    return @"true" != 0;
}
pub fn SDL_InitializeSurface(surface: [*c]SDL_Surface, width: c_int, height: c_int, format: SDL_PixelFormat, colorspace: SDL_Colorspace, props: SDL_PropertiesID, pixels: ?*anyopaque, pitch: c_int, onstack: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(surface)), 0, @sizeOf(@TypeOf(surface.*)));
    surface.*.flags = SDL_SURFACE_PREALLOCATED;
    surface.*.format = format;
    surface.*.w = width;
    surface.*.h = height;
    surface.*.pixels = pixels;
    surface.*.pitch = pitch;
    surface.*.reserved = @ptrCast(@alignCast(&SDL_surface_magic));
    if (onstack) {
        surface.*.internal_flags |= SDL_INTERNAL_SURFACE_STACK;
    }
    surface.*.fmt = SDL_GetPixelFormatDetails_REAL(format);
    if (!(surface.*.fmt != null)) {
        SDL_DestroySurface_REAL(surface);
        return @"false" != 0;
    }
    surface.*.clip_rect.w = width;
    surface.*.clip_rect.h = height;
    surface.*.map.info.r = 255;
    surface.*.map.info.g = 255;
    surface.*.map.info.b = 255;
    surface.*.map.info.a = 255;
    if (colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_UNKNOWN)) {
        surface.*.colorspace = SDL_GetDefaultColorspaceForFormat(format);
    } else {
        surface.*.colorspace = colorspace;
    }
    if (props != 0) {
        if (!SDL_CopyProperties_REAL(props, SDL_GetSurfaceProperties_REAL(surface))) {
            SDL_DestroySurface_REAL(surface);
            return @"false" != 0;
        }
    }
    if (((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) {
        _ = SDL_SetSurfaceBlendMode_REAL(surface, SDL_BLENDMODE_BLEND);
    }
    surface.*.refcount = 1;
    return @"true" != 0;
}
pub fn SDL_CreateSurfaceInternal(width: c_int, height: c_int, format: SDL_PixelFormat, clear_surface: bool) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var pitch: usize = undefined;
    _ = &pitch;
    var size: usize = undefined;
    _ = &size;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    if (width < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("width"))));
        return null;
    }
    if (height < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("height"))));
        return null;
    }
    if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("format"))));
        return null;
    }
    if (!SDL_CalculateSurfaceSize(format, width, height, &size, &pitch, @"false" != 0)) {
        return null;
    }
    surface = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(surface.*)))));
    if (!(surface != null)) {
        return null;
    }
    if (!SDL_InitializeSurface(surface, width, height, format, SDL_COLORSPACE_UNKNOWN, 0, null, @bitCast(@as(c_uint, @truncate(pitch))), @"false" != 0)) {
        return null;
    }
    if (((surface.*.w != 0) and (surface.*.h != 0)) and (format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG))) {
        surface.*.flags &= ~SDL_SURFACE_PREALLOCATED;
        if (SDL_GetHintBoolean_REAL("SDL_SURFACE_MALLOC", @"false" != 0)) {
            if (clear_surface) {
                surface.*.pixels = SDL_calloc_REAL(1, size);
            } else {
                surface.*.pixels = SDL_malloc_REAL(size);
            }
        } else {
            surface.*.flags |= SDL_SURFACE_SIMD_ALIGNED;
            if (clear_surface) {
                surface.*.pixels = SDL_aligned_alloc_zero_REAL(SDL_GetSIMDAlignment_REAL(), size);
            } else {
                surface.*.pixels = SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), size);
            }
        }
        if (!(surface.*.pixels != null)) {
            SDL_DestroySurface_REAL(surface);
            return null;
        }
    }
    return surface;
}
pub export fn SDL_CreateSurfaceZeroed(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    return SDL_CreateSurfaceInternal(width, height, format, @"true" != 0);
}
pub export fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    return SDL_CreateSurfaceInternal(width, height, format, @"false" != 0);
}
pub export fn SDL_CreateSurface_REAL(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    return SDL_CreateSurfaceZeroed(width, height, format);
}
pub export fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (width < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("width"))));
        return null;
    }
    if (height < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("height"))));
        return null;
    }
    if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("format"))));
        return null;
    }
    if ((pitch == @as(c_int, 0)) and !(pixels != null)) {} else {
        var minimalPitch: usize = undefined;
        _ = &minimalPitch;
        if (!SDL_CalculateSurfaceSize(format, width, height, null, &minimalPitch, @"true" != 0)) {
            return null;
        }
        if ((pitch < @as(c_int, 0)) or (@as(usize, @bitCast(@as(c_long, pitch))) < minimalPitch)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("pitch"))));
            return null;
        }
    }
    var surface: [*c]SDL_Surface = undefined;
    surface = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(surface.*)))));
    _ = &surface;
    if (!(surface != null) or !SDL_InitializeSurface(surface, width, height, format, SDL_COLORSPACE_UNKNOWN, 0, pixels, pitch, @"false" != 0)) {
        return null;
    }
    return surface;
}
pub export fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return 0;
    }
    if (!(surface.*.props != 0)) {
        surface.*.props = SDL_CreateProperties_REAL();
    }
    return surface.*.props;
}
pub export fn SDL_SetSurfaceColorspace_REAL(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    surface.*.colorspace = colorspace;
    return @"true" != 0;
}
pub export fn SDL_GetSurfaceColorspace_REAL(surface: [*c]SDL_Surface) SDL_Colorspace {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_COLORSPACE_UNKNOWN;
    }
    return surface.*.colorspace;
}
pub export fn SDL_GetDefaultSDRWhitePoint(colorspace: SDL_Colorspace) f32 {
    @setEvalBranchQuota(100000);
    return SDL_GetSurfaceSDRWhitePoint(null, colorspace);
}
pub export fn SDL_GetSurfaceSDRWhitePoint(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32 {
    @setEvalBranchQuota(100000);
    var transfer: SDL_TransferCharacteristics = (colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31);
    _ = &transfer;
    if ((transfer == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_LINEAR)) or (transfer == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ))) {
        var props: SDL_PropertiesID = undefined;
        _ = &props;
        var default_value: f32 = 1.0;
        _ = &default_value;
        if (SDL_SurfaceValid(surface)) {
            props = surface.*.props;
        } else {
            props = 0;
        }
        if (transfer == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ)) {
            const DEFAULT_PQ_SDR_WHITE_POINT: f32 = 203.0;
            _ = &DEFAULT_PQ_SDR_WHITE_POINT;
            default_value = DEFAULT_PQ_SDR_WHITE_POINT;
        }
        return SDL_GetFloatProperty_REAL(props, "SDL.surface.SDR_white_point", default_value);
    }
    return 1.0;
}
pub export fn SDL_GetDefaultHDRHeadroom(colorspace: SDL_Colorspace) f32 {
    @setEvalBranchQuota(100000);
    return SDL_GetSurfaceHDRHeadroom(null, colorspace);
}
pub export fn SDL_GetSurfaceHDRHeadroom(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32 {
    @setEvalBranchQuota(100000);
    var transfer: SDL_TransferCharacteristics = (colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31);
    _ = &transfer;
    if ((transfer == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_LINEAR)) or (transfer == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ))) {
        var props: SDL_PropertiesID = undefined;
        _ = &props;
        var default_value: f32 = 0.0;
        _ = &default_value;
        if (SDL_SurfaceValid(surface)) {
            props = surface.*.props;
        } else {
            props = 0;
        }
        return SDL_GetFloatProperty_REAL(props, "SDL.surface.HDR_headroom", default_value);
    }
    return 1.0;
}
pub export fn SDL_CreateSurfacePalette_REAL(surface: [*c]SDL_Surface) [*c]SDL_Palette {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [29:0]u8 = "SDL_CreateSurfacePalette_REAL".*;
    };
    _ = &static_local___func__;
    var palette: [*c]SDL_Palette = undefined;
    _ = &palette;
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    if (!(!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
        _ = SDL_SetError_REAL("The surface is not indexed format");
        return null;
    }
    palette = SDL_CreatePalette_REAL(@as(c_int, 1) << @intCast(if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))));
    if (!(palette != null)) {
        return null;
    }
    if (palette.*.ncolors == @as(c_int, 2)) {
        palette.*.colors[@as(c_int, 0)].r = 255;
        palette.*.colors[@as(c_int, 0)].g = 255;
        palette.*.colors[@as(c_int, 0)].b = 255;
        palette.*.colors[@as(c_int, 1)].r = 0;
        palette.*.colors[@as(c_int, 1)].g = 0;
        palette.*.colors[@as(c_int, 1)].b = 0;
    }
    if (!SDL_SetSurfacePalette_REAL(surface, palette)) {
        SDL_DestroyPalette_REAL(palette);
        return null;
    }
    while (true) {
        while (!(palette.*.refcount == @as(c_int, 2))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "palette->refcount == 2",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_surface.c", 440);
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
    SDL_DestroyPalette_REAL(palette);
    return palette;
}
pub export fn SDL_SetSurfacePalette_REAL(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((palette != null) and !(!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
        return SDL_SetError_REAL("Surface doesn't use a palette");
    }
    if ((palette != null) and (palette.*.ncolors > (@as(c_int, 1) << @intCast(if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))))) {
        return SDL_SetError_REAL("Palette doesn't match surface format");
    }
    if (palette != surface.*.palette) {
        if (surface.*.palette != null) {
            SDL_DestroyPalette_REAL(surface.*.palette);
        }
        surface.*.palette = palette;
        if (surface.*.palette != null) {
            surface.*.palette.*.refcount += 1;
        }
    }
    SDL_InvalidateMap(&surface.*.map);
    return @"true" != 0;
}
pub export fn SDL_GetSurfacePalette_REAL(surface: [*c]SDL_Surface) [*c]SDL_Palette {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return null;
    }
    return surface.*.palette;
}
pub export fn SDL_AddSurfaceAlternateImage_REAL(surface: [*c]SDL_Surface, image: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (!SDL_SurfaceValid(image)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("image"))));
    }
    var images: [*c][*c]SDL_Surface = undefined;
    images = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(surface.*.images)), @as(c_ulong, @bitCast(@as(c_long, surface.*.num_images + @as(c_int, 1)))) *% @sizeOf(@TypeOf(images.*)))));
    _ = &images;
    if (!(images != null)) {
        return @"false" != 0;
    }
    images[@bitCast(@as(isize, @intCast(surface.*.num_images)))] = image;
    surface.*.images = images;
    surface.*.num_images += 1;
    image.*.refcount += 1;
    return @"true" != 0;
}
pub export fn SDL_SurfaceHasAlternateImages_REAL(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    return surface.*.num_images > @as(c_int, 0);
}
pub export fn SDL_GetSurfaceImages_REAL(surface: [*c]SDL_Surface, count: [*c]c_int) [*c][*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (count != null) {
        count.* = 0;
    }
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    var num_images: c_int = @as(c_int, 1) + surface.*.num_images;
    _ = &num_images;
    var images: [*c][*c]SDL_Surface = undefined;
    images = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_images + @as(c_int, 1)))) *% @sizeOf(@TypeOf(images.*)))));
    _ = &images;
    if (!(images != null)) {
        return null;
    }
    images[@as(c_int, 0)] = surface;
    if (surface.*.num_images > @as(c_int, 0)) {
        _ = memcpy(@ptrCast(@alignCast(&images[@as(c_int, 1)])), @ptrCast(@alignCast(surface.*.images)), @as(c_ulong, @bitCast(@as(c_long, surface.*.num_images))) *% @sizeOf(@TypeOf(images[@as(c_int, 1)])));
    }
    images[@bitCast(@as(isize, @intCast(num_images)))] = null;
    if (count != null) {
        count.* = num_images;
    }
    return images;
}
pub export fn SDL_GetSurfaceImage(surface: [*c]SDL_Surface, display_scale: f32) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_GetSurfaceImage".*;
    };
    _ = &static_local___func__;
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    if (!SDL_SurfaceHasAlternateImages_REAL(surface)) {
        surface.*.refcount += 1;
        return surface;
    }
    var images: [*c][*c]SDL_Surface = SDL_GetSurfaceImages_REAL(surface, null);
    _ = &images;
    if (!(images != null)) {
        surface.*.refcount += 1;
        return surface;
    }
    var closest: [*c]SDL_Surface = null;
    _ = &closest;
    var desired_w: c_int = @intFromFloat(SDL_round_REAL(@floatCast(@as(f32, @floatFromInt(surface.*.w)) * display_scale)));
    _ = &desired_w;
    var desired_h: c_int = @intFromFloat(SDL_round_REAL(@floatCast(@as(f32, @floatFromInt(surface.*.h)) * display_scale)));
    _ = &desired_h;
    var desired_size: c_int = desired_w * desired_h;
    _ = &desired_size;
    var closest_distance: c_int = -@as(c_int, 1);
    _ = &closest_distance;
    var closest_size: c_int = -@as(c_int, 1);
    _ = &closest_size;
    {
        var i: c_int = 0;
        _ = &i;
        while (images[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
            var candidate: [*c]SDL_Surface = images[@bitCast(@as(isize, @intCast(i)))];
            _ = &candidate;
            var size: c_int = candidate.*.w * candidate.*.h;
            _ = &size;
            var delta_w: c_int = candidate.*.w - desired_w;
            _ = &delta_w;
            var delta_h: c_int = candidate.*.h - desired_h;
            _ = &delta_h;
            var distance: c_int = (delta_w * delta_w) + (delta_h * delta_h);
            _ = &distance;
            if (((closest_distance < @as(c_int, 0)) or (distance < closest_distance)) or ((size > desired_size) and (closest_size < desired_size))) {
                closest = candidate;
                closest_distance = distance;
                closest_size = size;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(images)));
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(closest))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "closest != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_surface.c", 585);
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
    if ((closest.*.w == desired_w) and (closest.*.h == desired_h)) {
        closest.*.refcount += 1;
        return closest;
    }
    var scaled: [*c]SDL_Surface = closest;
    _ = &scaled;
    while (true) {
        var next_scaled_w: c_int = if (desired_w > @divTrunc(scaled.*.w + @as(c_int, 1), @as(c_int, 2))) desired_w else @divTrunc(scaled.*.w + @as(c_int, 1), @as(c_int, 2));
        _ = &next_scaled_w;
        var next_scaled_h: c_int = if (desired_h > @divTrunc(scaled.*.h + @as(c_int, 1), @as(c_int, 2))) desired_h else @divTrunc(scaled.*.h + @as(c_int, 1), @as(c_int, 2));
        _ = &next_scaled_h;
        var next_scaled: [*c]SDL_Surface = SDL_ScaleSurface_REAL(scaled, next_scaled_w, next_scaled_h, SDL_SCALEMODE_LINEAR);
        _ = &next_scaled;
        if (scaled != closest) {
            SDL_DestroySurface_REAL(scaled);
        }
        scaled = next_scaled;
        if (!(scaled != null)) {
            closest.*.refcount += 1;
            return closest;
        }
        if (!((scaled.*.w != desired_w) or (scaled.*.h != desired_h))) break;
    }
    return scaled;
}
pub export fn SDL_RemoveSurfaceAlternateImages_REAL(surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return;
    }
    if (surface.*.num_images > @as(c_int, 0)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < surface.*.num_images) : (i += 1) {
                SDL_DestroySurface_REAL(surface.*.images[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(surface.*.images)));
        surface.*.images = null;
        surface.*.num_images = 0;
    }
}
pub export fn SDL_SetSurfaceRLE_REAL(surface: [*c]SDL_Surface, enabled: bool) bool {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    if (!SDL_SurfaceValid(surface) or ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    flags = surface.*.map.info.flags;
    if (enabled) {
        surface.*.map.info.flags |= SDL_COPY_RLE_DESIRED;
    } else {
        surface.*.map.info.flags &= ~SDL_COPY_RLE_DESIRED;
    }
    if (surface.*.map.info.flags != flags) {
        SDL_InvalidateMap(&surface.*.map);
    }
    return @"true" != 0;
}
pub export fn SDL_SurfaceHasRLE_REAL(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    if (!((surface.*.map.info.flags & SDL_COPY_RLE_DESIRED) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_SetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, enabled: bool, arg_key: Uint32) bool {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    var flags: c_int = undefined;
    _ = &flags;
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((surface.*.palette != null) and (key >= @as(Uint32, @bitCast(@as(c_int, surface.*.palette.*.ncolors))))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("key"))));
    }
    flags = surface.*.map.info.flags;
    if (enabled) {
        surface.*.map.info.flags |= SDL_COPY_COLORKEY;
        surface.*.map.info.colorkey = key;
    } else {
        surface.*.map.info.flags &= ~SDL_COPY_COLORKEY;
    }
    if (surface.*.map.info.flags != flags) {
        SDL_InvalidateMap(&surface.*.map);
    }
    return @"true" != 0;
}
pub export fn SDL_SurfaceHasColorKey_REAL(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    if (!((surface.*.map.info.flags & SDL_COPY_COLORKEY) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, key: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    if (key != null) {
        key.* = 0;
    }
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (!((surface.*.map.info.flags & SDL_COPY_COLORKEY) != 0)) {
        return SDL_SetError_REAL("Surface doesn't have a colorkey");
    }
    if (key != null) {
        key.* = surface.*.map.info.colorkey;
    }
    return @"true" != 0;
}
pub fn SDL_ConvertColorkeyToAlpha(surface: [*c]SDL_Surface, ignore_alpha: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var bpp: c_int = undefined;
    _ = &bpp;
    if (!SDL_SurfaceValid(surface)) {
        return;
    }
    if (!((surface.*.map.info.flags & SDL_COPY_COLORKEY) != 0) or !(((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) {
        return;
    }
    bpp = if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = SDL_LockSurface_REAL(surface);
    if (bpp == @as(c_int, 2)) {
        var row: [*c]Uint16 = undefined;
        _ = &row;
        var spot: [*c]Uint16 = undefined;
        _ = &spot;
        var ckey: Uint16 = @truncate(surface.*.map.info.colorkey);
        _ = &ckey;
        var mask: Uint16 = @truncate(~surface.*.fmt.*.Amask);
        _ = &mask;
        if (ignore_alpha) {
            {
                const ref = &ckey;
                ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & @as(c_int, mask))));
            }
            row = @ptrCast(@alignCast(surface.*.pixels));
            {
                y = surface.*.h;
                while ((blk: {
                    const ref = &y;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    spot = row;
                    {
                        x = surface.*.w;
                        while ((blk: {
                            const ref = &x;
                            const tmp = ref.*;
                            ref.* -= 1;
                            break :blk tmp;
                        }) != 0) {
                            if ((@as(c_int, spot.*) & @as(c_int, mask)) == @as(c_int, ckey)) {
                                {
                                    const ref = &spot.*;
                                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & @as(c_int, mask))));
                                }
                            }
                            spot += 1;
                        }
                    }
                    row += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(surface.*.pitch, @as(c_int, 2))))));
                }
            }
        } else {
            row = @ptrCast(@alignCast(surface.*.pixels));
            {
                y = surface.*.h;
                while ((blk: {
                    const ref = &y;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    spot = row;
                    {
                        x = surface.*.w;
                        while ((blk: {
                            const ref = &x;
                            const tmp = ref.*;
                            ref.* -= 1;
                            break :blk tmp;
                        }) != 0) {
                            if (@as(c_int, spot.*) == @as(c_int, ckey)) {
                                {
                                    const ref = &spot.*;
                                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & @as(c_int, mask))));
                                }
                            }
                            spot += 1;
                        }
                    }
                    row += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(surface.*.pitch, @as(c_int, 2))))));
                }
            }
        }
    } else if (bpp == @as(c_int, 4)) {
        var row: [*c]Uint32 = undefined;
        _ = &row;
        var spot: [*c]Uint32 = undefined;
        _ = &spot;
        var ckey: Uint32 = surface.*.map.info.colorkey;
        _ = &ckey;
        var mask: Uint32 = ~surface.*.fmt.*.Amask;
        _ = &mask;
        if (ignore_alpha) {
            ckey &= mask;
            row = @ptrCast(@alignCast(surface.*.pixels));
            {
                y = surface.*.h;
                while ((blk: {
                    const ref = &y;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    spot = row;
                    {
                        x = surface.*.w;
                        while ((blk: {
                            const ref = &x;
                            const tmp = ref.*;
                            ref.* -= 1;
                            break :blk tmp;
                        }) != 0) {
                            if ((spot.* & mask) == ckey) {
                                spot.* &= mask;
                            }
                            spot += 1;
                        }
                    }
                    row += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(surface.*.pitch, @as(c_int, 4))))));
                }
            }
        } else {
            row = @ptrCast(@alignCast(surface.*.pixels));
            {
                y = surface.*.h;
                while ((blk: {
                    const ref = &y;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    spot = row;
                    {
                        x = surface.*.w;
                        while ((blk: {
                            const ref = &x;
                            const tmp = ref.*;
                            ref.* -= 1;
                            break :blk tmp;
                        }) != 0) {
                            if (spot.* == ckey) {
                                spot.* &= mask;
                            }
                            spot += 1;
                        }
                    }
                    row += @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(surface.*.pitch, @as(c_int, 4))))));
                }
            }
        }
    }
    SDL_UnlockSurface_REAL(surface);
    _ = SDL_SetSurfaceColorKey_REAL(surface, @"false" != 0, 0);
    _ = SDL_SetSurfaceBlendMode_REAL(surface, SDL_BLENDMODE_BLEND);
}
pub export fn SDL_SetSurfaceColorMod_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8) bool {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    surface.*.map.info.r = r;
    surface.*.map.info.g = g;
    surface.*.map.info.b = b;
    flags = surface.*.map.info.flags;
    if (((@as(c_int, r) != @as(c_int, 255)) or (@as(c_int, g) != @as(c_int, 255))) or (@as(c_int, b) != @as(c_int, 255))) {
        surface.*.map.info.flags |= SDL_COPY_MODULATE_COLOR;
    } else {
        surface.*.map.info.flags &= ~SDL_COPY_MODULATE_COLOR;
    }
    if (surface.*.map.info.flags != flags) {
        SDL_InvalidateMap(&surface.*.map);
    }
    return @"true" != 0;
}
pub export fn SDL_GetSurfaceColorMod_REAL(surface: [*c]SDL_Surface, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        if (r != null) {
            r.* = 255;
        }
        if (g != null) {
            g.* = 255;
        }
        if (b != null) {
            b.* = 255;
        }
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (r != null) {
        r.* = surface.*.map.info.r;
    }
    if (g != null) {
        g.* = surface.*.map.info.g;
    }
    if (b != null) {
        b.* = surface.*.map.info.b;
    }
    return @"true" != 0;
}
pub export fn SDL_SetSurfaceAlphaMod_REAL(surface: [*c]SDL_Surface, alpha: Uint8) bool {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    surface.*.map.info.a = alpha;
    flags = surface.*.map.info.flags;
    if (@as(c_int, alpha) != @as(c_int, 255)) {
        surface.*.map.info.flags |= SDL_COPY_MODULATE_ALPHA;
    } else {
        surface.*.map.info.flags &= ~SDL_COPY_MODULATE_ALPHA;
    }
    if (surface.*.map.info.flags != flags) {
        SDL_InvalidateMap(&surface.*.map);
    }
    return @"true" != 0;
}
pub export fn SDL_GetSurfaceAlphaMod_REAL(surface: [*c]SDL_Surface, alpha: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        if (alpha != null) {
            alpha.* = 255;
        }
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (alpha != null) {
        alpha.* = surface.*.map.info.a;
    }
    return @"true" != 0;
}
pub export fn SDL_SetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    var flags: c_int = undefined;
    _ = &flags;
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (blendMode == SDL_BLENDMODE_INVALID) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("blendMode"))));
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                flags = surface.*.map.info.flags;
                surface.*.map.info.flags &= ~(((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL);
                switch (blendMode) {
                    SDL_BLENDMODE_NONE => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            7 => {
                if (surface.*.map.info.flags != flags) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                surface.*.map.info.flags |= SDL_COPY_BLEND;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                surface.*.map.info.flags |= SDL_COPY_BLEND_PREMULTIPLIED;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                surface.*.map.info.flags |= SDL_COPY_ADD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                surface.*.map.info.flags |= SDL_COPY_ADD_PREMULTIPLIED;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                surface.*.map.info.flags |= SDL_COPY_MOD;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                surface.*.map.info.flags |= SDL_COPY_MUL;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                result = SDL_SetError_REAL("That operation is not supported");
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                SDL_InvalidateMap(&surface.*.map);
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (blendMode != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                blendMode.* = SDL_BLENDMODE_INVALID;
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
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (!(blendMode != null)) {
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
                switch (surface.*.map.info.flags & (((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) {
                    SDL_COPY_BLEND => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_COPY_BLEND_PREMULTIPLIED => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_COPY_ADD => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDL_COPY_ADD_PREMULTIPLIED => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDL_COPY_MOD => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDL_COPY_MUL => {
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
                return @"true" != 0;
            },
            11 => {
                blendMode.* = SDL_BLENDMODE_BLEND;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                blendMode.* = SDL_BLENDMODE_BLEND_PREMULTIPLIED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                blendMode.* = SDL_BLENDMODE_ADD;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                blendMode.* = SDL_BLENDMODE_ADD_PREMULTIPLIED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                blendMode.* = SDL_BLENDMODE_MOD;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                blendMode.* = SDL_BLENDMODE_MUL;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                blendMode.* = SDL_BLENDMODE_NONE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SetSurfaceClipRect_REAL(surface: [*c]SDL_Surface, rect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    if (!SDL_SurfaceValid(surface)) {
        return @"false" != 0;
    }
    full_rect.x = 0;
    full_rect.y = 0;
    full_rect.w = surface.*.w;
    full_rect.h = surface.*.h;
    if (!(rect != null)) {
        surface.*.clip_rect = full_rect;
        return @"true" != 0;
    }
    return SDL_GetRectIntersection_REAL(rect, &full_rect, &surface.*.clip_rect);
}
pub export fn SDL_GetSurfaceClipRect_REAL(surface: [*c]SDL_Surface, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        if (rect != null) {
            _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
        }
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (!(rect != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
    }
    rect.* = surface.*.clip_rect;
    return @"true" != 0;
}
pub export fn SDL_BlitSurfaceUnchecked_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ValidateMap(src, dst)) {
        return @"false" != 0;
    }
    return src.*.map.blit.?(src, srcrect, dst, dstrect);
}
pub export fn SDL_BlitSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var r_src: SDL_Rect = undefined;
    _ = &r_src;
    var r_dst: SDL_Rect = undefined;
    _ = &r_dst;
    if (!SDL_SurfaceValid(src) or (!(src.*.pixels != null) and !((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!SDL_SurfaceValid(dst) or (!(dst.*.pixels != null) and !((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED))) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    if (((src.*.flags & SDL_SURFACE_LOCKED) != 0) or ((dst.*.flags & SDL_SURFACE_LOCKED) != 0)) {
        return SDL_SetError_REAL("Surfaces must not be locked during blit");
    }
    r_src.x = 0;
    r_src.y = 0;
    r_src.w = src.*.w;
    r_src.h = src.*.h;
    if (dstrect != null) {
        r_dst.x = dstrect.*.x;
        r_dst.y = dstrect.*.y;
    } else {
        r_dst.x = 0;
        r_dst.y = 0;
    }
    if (srcrect != null) {
        var tmp: SDL_Rect = undefined;
        _ = &tmp;
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(srcrect, &r_src, &tmp))) == @"false") {
            return @"true" != 0;
        }
        r_dst.x += tmp.x - srcrect.*.x;
        r_dst.y += tmp.y - srcrect.*.y;
        r_src = tmp;
    }
    r_dst.w = r_src.w;
    r_dst.h = r_src.h;
    {
        var tmp: SDL_Rect = undefined;
        _ = &tmp;
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(&r_dst, &dst.*.clip_rect, &tmp))) == @"false") {
            return @"true" != 0;
        }
        r_src.x += tmp.x - r_dst.x;
        r_src.y += tmp.y - r_dst.y;
        r_src.w = tmp.w;
        r_src.h = tmp.h;
        r_dst = tmp;
    }
    if ((r_dst.w <= @as(c_int, 0)) or (r_dst.h <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    if ((src.*.map.info.flags & SDL_COPY_NEAREST) != 0) {
        src.*.map.info.flags &= ~SDL_COPY_NEAREST;
        SDL_InvalidateMap(&src.*.map);
    }
    return SDL_BlitSurfaceUnchecked_REAL(src, &r_src, dst, &r_dst);
}
pub fn SDL_BlitSurfaceClippedScaled(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var saved_w: c_int = src.*.w;
    _ = &saved_w;
    var saved_h: c_int = src.*.h;
    _ = &saved_h;
    var saved_pixels: ?*anyopaque = src.*.pixels;
    _ = &saved_pixels;
    src.*.w = srcrect.*.w;
    src.*.h = srcrect.*.h;
    src.*.pixels = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(src.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.y * src.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(srcrect.*.x * (if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    var scaled: [*c]SDL_Surface = SDL_ScaleSurface_REAL(src, dstrect.*.w, dstrect.*.h, scaleMode);
    _ = &scaled;
    if (scaled != null) {
        result = SDL_BlitSurface_REAL(scaled, null, dst, dstrect);
        SDL_DestroySurface_REAL(scaled);
    } else {
        result = @"false" != 0;
    }
    src.*.w = saved_w;
    src.*.h = saved_h;
    src.*.pixels = saved_pixels;
    return result;
}
pub export fn SDL_BlitSurfaceScaled_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, arg_scaleMode: SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    var scaleMode = arg_scaleMode;
    _ = &scaleMode;
    var r_src: SDL_Rect = undefined;
    _ = &r_src;
    var r_dst: SDL_Rect = undefined;
    _ = &r_dst;
    var result: bool = undefined;
    _ = &result;
    var src_w: c_int = undefined;
    _ = &src_w;
    var src_h: c_int = undefined;
    _ = &src_h;
    var dst_w: c_int = undefined;
    _ = &dst_w;
    var dst_h: c_int = undefined;
    _ = &dst_h;
    var desired: SDL_Rect = undefined;
    _ = &desired;
    var tmp: SDL_Rect = undefined;
    _ = &tmp;
    var tmp_1: SDL_Rect = undefined;
    _ = &tmp_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_SurfaceValid(src) or (!(src.*.pixels != null) and !((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!SDL_SurfaceValid(dst) or (!(dst.*.pixels != null) and !((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                if (((src.*.flags & SDL_SURFACE_LOCKED) != 0) or ((dst.*.flags & SDL_SURFACE_LOCKED) != 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                return SDL_SetError_REAL("Surfaces must not be locked during blit");
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                switch (scaleMode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            10 => {
                src_w = if (srcrect != null) srcrect.*.w else src.*.w;
                src_h = if (srcrect != null) srcrect.*.h else src.*.h;
                dst_w = if (dstrect != null) dstrect.*.w else dst.*.w;
                dst_h = if (dstrect != null) dstrect.*.h else dst.*.h;
                if ((src_w == dst_w) and (src_h == dst_h)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 10;
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
                scaleMode = SDL_SCALEMODE_NEAREST;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scaleMode"))));
            },
            15 => {
                return SDL_BlitSurface_REAL(src, srcrect, dst, dstrect);
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                if ((src.*.w == @as(c_int, 0)) or (src.*.h == @as(c_int, 0))) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                return @"true" != 0;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                r_src.x = 0;
                r_src.y = 0;
                r_src.w = src.*.w;
                r_src.h = src.*.h;
                if (dstrect != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                r_dst.x = dstrect.*.x;
                r_dst.y = dstrect.*.y;
                r_dst.w = dstrect.*.w;
                r_dst.h = dstrect.*.h;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                r_dst.x = 0;
                r_dst.y = 0;
                r_dst.w = dst.*.w;
                r_dst.h = dst.*.h;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (srcrect != null) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                desired.x = srcrect.*.x;
                desired.y = srcrect.*.y;
                desired.w = if (srcrect.*.w > @as(c_int, 1)) srcrect.*.w else @as(c_int, 1);
                desired.h = if (srcrect.*.h > @as(c_int, 1)) srcrect.*.h else @as(c_int, 1);
                if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(&desired, &r_src, &tmp))) == @"false") {
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
                if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(&r_dst, &dst.*.clip_rect, &tmp_1))) == @"false") {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            27 => {
                return @"true" != 0;
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                r_dst.x += @divTrunc((tmp.x - desired.x) * r_dst.w, desired.w);
                r_dst.y += @divTrunc((tmp.y - desired.y) * r_dst.h, desired.h);
                r_dst.w += @divTrunc((tmp.w - desired.w) * r_dst.w, desired.w);
                r_dst.h += @divTrunc((tmp.h - desired.h) * r_dst.h, desired.h);
                r_src = tmp;
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                return @"true" != 0;
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if ((((tmp_1.x != r_dst.x) or (tmp_1.y != r_dst.y)) or (tmp_1.w != r_dst.w)) or (tmp_1.h != r_dst.h)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                return SDL_BlitSurfaceClippedScaled(src, &r_src, dst, &r_dst, scaleMode);
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if (!SDL_LockSurface_REAL(src)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
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
                if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            39 => {
                return @"false" != 0;
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                if (!SDL_LockSurface_REAL(dst)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
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
                result = SDL_BlitSurfaceUncheckedScaled_REAL(src, &r_src, dst, &r_dst, scaleMode);
                if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            45 => {
                if ((src.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            48 => {
                SDL_UnlockSurface_REAL(src);
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                return @"false" != 0;
            },
            51 => {
                SDL_UnlockSurface_REAL(src);
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
                if ((dst.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                SDL_UnlockSurface_REAL(dst);
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_BlitSurfaceUncheckedScaled_REAL(arg_src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    const static_local_complex_copy_flags = struct {
        const complex_copy_flags: Uint32 = @bitCast(@as(c_int, ((SDL_COPY_MODULATE_COLOR | SDL_COPY_MODULATE_ALPHA) | (((((SDL_COPY_BLEND | SDL_COPY_BLEND_PREMULTIPLIED) | SDL_COPY_ADD) | SDL_COPY_ADD_PREMULTIPLIED) | SDL_COPY_MOD) | SDL_COPY_MUL)) | SDL_COPY_COLORKEY));
    };
    _ = &static_local_complex_copy_flags;
    if ((((srcrect.*.w > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535))))))) or (srcrect.*.h > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) or (dstrect.*.w > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) or (dstrect.*.h > @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(@as(c_int, 65535)))))))) {
        return SDL_SetError_REAL("Size too large for scaling");
    }
    if (!((src.*.map.info.flags & SDL_COPY_NEAREST) != 0)) {
        src.*.map.info.flags |= SDL_COPY_NEAREST;
        SDL_InvalidateMap(&src.*.map);
    }
    if ((scaleMode == SDL_SCALEMODE_NEAREST) or (scaleMode == SDL_SCALEMODE_PIXELART)) {
        if (((!((@as(Uint32, @bitCast(@as(c_int, src.*.map.info.flags))) & static_local_complex_copy_flags.complex_copy_flags) != 0) and (src.*.format == dst.*.format)) and (!(!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) or (((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 8)) and SDL_IsSamePalette(src.*.palette, dst.*.palette)))) and ((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) <= @as(c_int, 4))) {
            return SDL_StretchSurface_REAL(src, srcrect, dst, dstrect, SDL_SCALEMODE_NEAREST);
        } else if ((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
            var result: bool = @"false" != 0;
            _ = &result;
            var tmp: [*c]SDL_Surface = SDL_ConvertSurface_REAL(src, SDL_PIXELFORMAT_ARGB8888);
            _ = &tmp;
            if (tmp != null) {
                result = SDL_BlitSurfaceUncheckedScaled_REAL(tmp, srcrect, dst, dstrect, SDL_SCALEMODE_NEAREST);
                SDL_DestroySurface_REAL(tmp);
            }
            return result;
        } else {
            return SDL_BlitSurfaceUnchecked_REAL(src, srcrect, dst, dstrect);
        }
    } else {
        if ((((!((@as(Uint32, @bitCast(@as(c_int, src.*.map.info.flags))) & static_local_complex_copy_flags.complex_copy_flags) != 0) and (src.*.format == dst.*.format)) and !(!((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((src.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) and ((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 4))) and (src.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010))) {
            return SDL_StretchSurface_REAL(src, srcrect, dst, dstrect, SDL_SCALEMODE_LINEAR);
        } else if ((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
            var result: bool = @"false" != 0;
            _ = &result;
            var tmp: [*c]SDL_Surface = SDL_ConvertSurface_REAL(src, SDL_PIXELFORMAT_ARGB8888);
            _ = &tmp;
            if (tmp != null) {
                result = SDL_BlitSurfaceUncheckedScaled_REAL(tmp, srcrect, dst, dstrect, scaleMode);
                SDL_DestroySurface_REAL(tmp);
            }
            return result;
        } else {
            var tmp1: [*c]SDL_Surface = null;
            _ = &tmp1;
            var result: bool = undefined;
            _ = &result;
            var srcrect2: SDL_Rect = undefined;
            _ = &srcrect2;
            var is_complex_copy_flags: c_int = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, src.*.map.info.flags))) & static_local_complex_copy_flags.complex_copy_flags)));
            _ = &is_complex_copy_flags;
            var r: Uint8 = undefined;
            _ = &r;
            var g: Uint8 = undefined;
            _ = &g;
            var b: Uint8 = undefined;
            _ = &b;
            var alpha: Uint8 = undefined;
            _ = &alpha;
            var blendMode: SDL_BlendMode = undefined;
            _ = &blendMode;
            _ = SDL_GetSurfaceColorMod_REAL(src, &r, &g, &b);
            _ = SDL_GetSurfaceAlphaMod_REAL(src, &alpha);
            _ = SDL_GetSurfaceBlendMode_REAL(src, &blendMode);
            srcrect2.x = srcrect.*.x;
            srcrect2.y = srcrect.*.y;
            srcrect2.w = srcrect.*.w;
            srcrect2.h = srcrect.*.h;
            if (((if ((src.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) != @as(c_int, 4)) or (src.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010))) {
                var fmt: SDL_PixelFormat = undefined;
                _ = &fmt;
                if ((((if ((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (dst.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((dst.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 4)) and (dst.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB2101010))) and ((((!((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((dst.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((dst.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) or !(is_complex_copy_flags != 0))) {
                    fmt = dst.*.format;
                } else {
                    fmt = SDL_PIXELFORMAT_ARGB8888;
                }
                tmp1 = SDL_ConvertSurfaceRect(src, srcrect, fmt);
                if (!(tmp1 != null)) {
                    return @"false" != 0;
                }
                src = tmp1;
                srcrect2.x = 0;
                srcrect2.y = 0;
            }
            if ((is_complex_copy_flags != 0) or (src.*.format != dst.*.format)) {
                var tmprect: SDL_Rect = undefined;
                _ = &tmprect;
                var tmp2: [*c]SDL_Surface = SDL_CreateSurfaceUninitialized(dstrect.*.w, dstrect.*.h, src.*.format);
                _ = &tmp2;
                _ = SDL_StretchSurface_REAL(src, &srcrect2, tmp2, null, SDL_SCALEMODE_LINEAR);
                _ = SDL_SetSurfaceColorMod_REAL(tmp2, r, g, b);
                _ = SDL_SetSurfaceAlphaMod_REAL(tmp2, alpha);
                _ = SDL_SetSurfaceBlendMode_REAL(tmp2, blendMode);
                tmprect.x = 0;
                tmprect.y = 0;
                tmprect.w = dstrect.*.w;
                tmprect.h = dstrect.*.h;
                result = SDL_BlitSurfaceUnchecked_REAL(tmp2, &tmprect, dst, dstrect);
                SDL_DestroySurface_REAL(tmp2);
            } else {
                result = SDL_StretchSurface_REAL(src, &srcrect2, dst, dstrect, SDL_SCALEMODE_LINEAR);
            }
            SDL_DestroySurface_REAL(tmp1);
            return result;
        }
    }
}
pub export fn SDL_BlitSurfaceTiled_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var r_src: SDL_Rect = undefined;
    _ = &r_src;
    var r_dst: SDL_Rect = undefined;
    _ = &r_dst;
    if (!SDL_SurfaceValid(src)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    if (((src.*.flags & SDL_SURFACE_LOCKED) != 0) or ((dst.*.flags & SDL_SURFACE_LOCKED) != 0)) {
        return SDL_SetError_REAL("Surfaces must not be locked during blit");
    }
    r_src.x = 0;
    r_src.y = 0;
    r_src.w = src.*.w;
    r_src.h = src.*.h;
    if (dstrect != null) {
        r_dst.x = dstrect.*.x;
        r_dst.y = dstrect.*.y;
        r_dst.w = dstrect.*.w;
        r_dst.h = dstrect.*.h;
    } else {
        r_dst.x = 0;
        r_dst.y = 0;
        r_dst.w = dst.*.w;
        r_dst.h = dst.*.h;
    }
    if (srcrect != null) {
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(srcrect, &r_src, &r_src))) == @"false") {
            return @"true" != 0;
        }
    }
    {
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(&r_dst, &dst.*.clip_rect, &r_dst))) == @"false") {
            return @"true" != 0;
        }
    }
    if ((src.*.map.info.flags & SDL_COPY_NEAREST) != 0) {
        src.*.map.info.flags &= ~SDL_COPY_NEAREST;
        SDL_InvalidateMap(&src.*.map);
    }
    var rows: c_int = @divTrunc(r_dst.h, r_src.h);
    _ = &rows;
    var cols: c_int = @divTrunc(r_dst.w, r_src.w);
    _ = &cols;
    var remaining_w: c_int = __helpers.signedRemainder(r_dst.w, r_src.w);
    _ = &remaining_w;
    var remaining_h: c_int = __helpers.signedRemainder(r_dst.h, r_src.h);
    _ = &remaining_h;
    var curr_src: SDL_Rect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_Rect = undefined;
    _ = &curr_dst;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&curr_src).*)) == @sizeOf(@TypeOf((&r_src).*)))) @compileError("static assertion failed \"sizeof (*(&curr_src)) == sizeof (*( &r_src))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&curr_src)), @ptrCast(@alignCast(&r_src)), @sizeOf(@TypeOf((&r_src).*)));
    curr_dst.y = r_dst.y;
    curr_dst.w = r_src.w;
    curr_dst.h = r_src.h;
    {
        var y: c_int = 0;
        _ = &y;
        while (y < rows) : (y += 1) {
            curr_dst.x = r_dst.x;
            {
                var x: c_int = 0;
                _ = &x;
                while (x < cols) : (x += 1) {
                    if (!SDL_BlitSurfaceUnchecked_REAL(src, &curr_src, dst, &curr_dst)) {
                        return @"false" != 0;
                    }
                    curr_dst.x += curr_dst.w;
                }
            }
            if (remaining_w != 0) {
                curr_src.w = remaining_w;
                curr_dst.w = remaining_w;
                if (!SDL_BlitSurfaceUnchecked_REAL(src, &curr_src, dst, &curr_dst)) {
                    return @"false" != 0;
                }
                curr_src.w = r_src.w;
                curr_dst.w = r_src.w;
            }
            curr_dst.y += curr_dst.h;
        }
    }
    if (remaining_h != 0) {
        curr_src.h = remaining_h;
        curr_dst.h = remaining_h;
        curr_dst.x = r_dst.x;
        {
            var x: c_int = 0;
            _ = &x;
            while (x < cols) : (x += 1) {
                if (!SDL_BlitSurfaceUnchecked_REAL(src, &curr_src, dst, &curr_dst)) {
                    return @"false" != 0;
                }
                curr_dst.x += curr_dst.w;
            }
        }
        if (remaining_w != 0) {
            curr_src.w = remaining_w;
            curr_dst.w = remaining_w;
            if (!SDL_BlitSurfaceUnchecked_REAL(src, &curr_src, dst, &curr_dst)) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub export fn SDL_BlitSurfaceTiledWithScale_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, scale: f32, scaleMode: SDL_ScaleMode, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var r_src: SDL_Rect = undefined;
    _ = &r_src;
    var r_dst: SDL_Rect = undefined;
    _ = &r_dst;
    if (!SDL_SurfaceValid(src)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    if (((src.*.flags & SDL_SURFACE_LOCKED) != 0) or ((dst.*.flags & SDL_SURFACE_LOCKED) != 0)) {
        return SDL_SetError_REAL("Surfaces must not be locked during blit");
    }
    if (scale < @as(f32, 0.0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scale"))));
    }
    r_src.x = 0;
    r_src.y = 0;
    r_src.w = src.*.w;
    r_src.h = src.*.h;
    if (dstrect != null) {
        r_dst.x = dstrect.*.x;
        r_dst.y = dstrect.*.y;
        r_dst.w = dstrect.*.w;
        r_dst.h = dstrect.*.h;
    } else {
        r_dst.x = 0;
        r_dst.y = 0;
        r_dst.w = dst.*.w;
        r_dst.h = dst.*.h;
    }
    if (srcrect != null) {
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(srcrect, &r_src, &r_src))) == @"false") {
            return @"true" != 0;
        }
    }
    {
        if (@as(c_int, @intFromBool(SDL_GetRectIntersection_REAL(&r_dst, &dst.*.clip_rect, &r_dst))) == @"false") {
            return @"true" != 0;
        }
    }
    if ((src.*.map.info.flags & SDL_COPY_NEAREST) != 0) {
        src.*.map.info.flags &= ~SDL_COPY_NEAREST;
        SDL_InvalidateMap(&src.*.map);
    }
    var tile_width: c_int = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(r_src.w)) * scale));
    _ = &tile_width;
    var tile_height: c_int = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(r_src.h)) * scale));
    _ = &tile_height;
    if ((tile_width <= @as(c_int, 0)) or (tile_height <= @as(c_int, 0))) {
        return @"true" != 0;
    }
    var rows: c_int = @divTrunc(r_dst.h, tile_height);
    _ = &rows;
    var cols: c_int = @divTrunc(r_dst.w, tile_width);
    _ = &cols;
    var remaining_dst_w: c_int = r_dst.w - (cols * tile_width);
    _ = &remaining_dst_w;
    var remaining_dst_h: c_int = r_dst.h - (rows * tile_height);
    _ = &remaining_dst_h;
    var remaining_src_w: c_int = @intFromFloat(@as(f32, @floatFromInt(remaining_dst_w)) / scale);
    _ = &remaining_src_w;
    var remaining_src_h: c_int = @intFromFloat(@as(f32, @floatFromInt(remaining_dst_h)) / scale);
    _ = &remaining_src_h;
    var curr_src: SDL_Rect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_Rect = undefined;
    _ = &curr_dst;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&curr_src).*)) == @sizeOf(@TypeOf((&r_src).*)))) @compileError("static assertion failed \"sizeof (*(&curr_src)) == sizeof (*( &r_src))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&curr_src)), @ptrCast(@alignCast(&r_src)), @sizeOf(@TypeOf((&r_src).*)));
    curr_dst.y = r_dst.y;
    curr_dst.w = tile_width;
    curr_dst.h = tile_height;
    {
        var y: c_int = 0;
        _ = &y;
        while (y < rows) : (y += 1) {
            curr_dst.x = r_dst.x;
            {
                var x: c_int = 0;
                _ = &x;
                while (x < cols) : (x += 1) {
                    if (!SDL_BlitSurfaceUncheckedScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
                        return @"false" != 0;
                    }
                    curr_dst.x += curr_dst.w;
                }
            }
            if (remaining_dst_w > @as(c_int, 0)) {
                curr_src.w = remaining_src_w;
                curr_dst.w = remaining_dst_w;
                if (!SDL_BlitSurfaceUncheckedScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
                    return @"false" != 0;
                }
                curr_src.w = r_src.w;
                curr_dst.w = tile_width;
            }
            curr_dst.y += curr_dst.h;
        }
    }
    if (remaining_dst_h > @as(c_int, 0)) {
        curr_src.h = remaining_src_h;
        curr_dst.h = remaining_dst_h;
        curr_dst.x = r_dst.x;
        {
            var x: c_int = 0;
            _ = &x;
            while (x < cols) : (x += 1) {
                if (!SDL_BlitSurfaceUncheckedScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
                    return @"false" != 0;
                }
                curr_dst.x += curr_dst.w;
            }
        }
        if (remaining_dst_w > @as(c_int, 0)) {
            curr_src.w = remaining_src_w;
            curr_dst.w = remaining_dst_w;
            if (!SDL_BlitSurfaceUncheckedScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub export fn SDL_BlitSurface9Grid_REAL(src: [*c]SDL_Surface, arg_srcrect: [*c]const SDL_Rect, left_width: c_int, right_width: c_int, top_height: c_int, bottom_height: c_int, arg_scale: f32, scaleMode: SDL_ScaleMode, dst: [*c]SDL_Surface, arg_dstrect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var srcrect = arg_srcrect;
    _ = &srcrect;
    var scale = arg_scale;
    _ = &scale;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    var full_src: SDL_Rect = undefined;
    _ = &full_src;
    var full_dst: SDL_Rect = undefined;
    _ = &full_dst;
    var curr_src: SDL_Rect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_Rect = undefined;
    _ = &curr_dst;
    var dst_left_width: c_int = undefined;
    _ = &dst_left_width;
    var dst_right_width: c_int = undefined;
    _ = &dst_right_width;
    var dst_top_height: c_int = undefined;
    _ = &dst_top_height;
    var dst_bottom_height: c_int = undefined;
    _ = &dst_bottom_height;
    if (!SDL_SurfaceValid(src)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!SDL_SurfaceValid(dst)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    if (!(srcrect != null)) {
        full_src.x = 0;
        full_src.y = 0;
        full_src.w = src.*.w;
        full_src.h = src.*.h;
        srcrect = &full_src;
    }
    if (!(dstrect != null)) {
        full_dst.x = 0;
        full_dst.y = 0;
        full_dst.w = dst.*.w;
        full_dst.h = dst.*.h;
        dstrect = &full_dst;
    }
    if ((scale <= @as(f32, 0.0)) or (scale == @as(f32, 1.0))) {
        dst_left_width = left_width;
        dst_right_width = right_width;
        dst_top_height = top_height;
        dst_bottom_height = bottom_height;
    } else {
        dst_left_width = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(left_width)) * scale));
        dst_right_width = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(right_width)) * scale));
        dst_top_height = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(top_height)) * scale));
        dst_bottom_height = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(bottom_height)) * scale));
    }
    curr_src.x = srcrect.*.x;
    curr_src.y = srcrect.*.y;
    curr_src.w = left_width;
    curr_src.h = top_height;
    curr_dst.x = dstrect.*.x;
    curr_dst.y = dstrect.*.y;
    curr_dst.w = dst_left_width;
    curr_dst.h = dst_top_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x;
    curr_src.w = left_width;
    curr_dst.x = dstrect.*.x;
    curr_dst.w = dst_left_width;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.y = srcrect.*.y + top_height;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x + left_width;
    curr_src.y = srcrect.*.y;
    curr_src.w = (srcrect.*.w - left_width) - right_width;
    curr_src.h = top_height;
    curr_dst.x = dstrect.*.x + dst_left_width;
    curr_dst.y = dstrect.*.y;
    curr_dst.w = (dstrect.*.w - dst_left_width) - dst_right_width;
    curr_dst.h = dst_top_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x + left_width;
    curr_src.y = srcrect.*.y + top_height;
    curr_src.w = (srcrect.*.w - left_width) - right_width;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.x = dstrect.*.x + dst_left_width;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.w = (dstrect.*.w - dst_left_width) - dst_right_width;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_BlitSurfaceScaled_REAL(src, &curr_src, dst, &curr_dst, scaleMode)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (!(surface.*.locked != 0)) {
        if ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0) {
            SDL_UnRLESurface(surface);
        }
    }
    surface.*.locked += 1;
    surface.*.flags |= SDL_SURFACE_LOCKED;
    SDL_UpdateSurfaceLockFlag(surface);
    return @"true" != 0;
}
pub export fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return;
    }
    if (!(surface.*.locked != 0) or ((blk: {
        const ref = &surface.*.locked;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0))) {
        return;
    }
    surface.*.flags &= ~SDL_SURFACE_LOCKED;
    SDL_UpdateSurfaceLockFlag(surface);
}
pub fn SDL_FlipSurfaceHorizontal(surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var isstack: bool = undefined;
    _ = &isstack;
    var row: [*c]Uint8 = undefined;
    _ = &row;
    var a: [*c]Uint8 = undefined;
    _ = &a;
    var b: [*c]Uint8 = undefined;
    _ = &b;
    var tmp: [*c]Uint8 = undefined;
    _ = &tmp;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var bpp: c_int = undefined;
    _ = &bpp;
    if ((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) < @as(c_int, 8)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (surface.*.h <= @as(c_int, 0)) {
        return @"true" != 0;
    }
    if (surface.*.w <= @as(c_int, 1)) {
        return @"true" != 0;
    }
    bpp = if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    row = @ptrCast(@alignCast(surface.*.pixels));
    tmp = blk: {
        (&isstack).* = (@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch))))))) else @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch)))))));
    };
    if (!(tmp != null)) {
        return @"false" != 0;
    }
    {
        i = surface.*.h;
        while ((blk: {
            const ref = &i;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            a = row;
            b = a + @as(usize, @bitCast(@as(isize, @intCast((surface.*.w - @as(c_int, 1)) * bpp))));
            {
                j = @divTrunc(surface.*.w, @as(c_int, 2));
                while ((blk: {
                    const ref = &j;
                    const tmp_1 = ref.*;
                    ref.* -= 1;
                    break :blk tmp_1;
                }) != 0) {
                    _ = memcpy(@ptrCast(@alignCast(tmp)), @ptrCast(@alignCast(a)), @bitCast(@as(c_long, bpp)));
                    _ = memcpy(@ptrCast(@alignCast(a)), @ptrCast(@alignCast(b)), @bitCast(@as(c_long, bpp)));
                    _ = memcpy(@ptrCast(@alignCast(b)), @ptrCast(@alignCast(tmp)), @bitCast(@as(c_long, bpp)));
                    a += @as(usize, @bitCast(@as(isize, @intCast(bpp))));
                    b -= @as(usize, @bitCast(@as(isize, @intCast(bpp))));
                }
            }
            row += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
        }
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    }
    return @"true" != 0;
}
pub fn SDL_FlipSurfaceVertical(surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var isstack: bool = undefined;
    _ = &isstack;
    var a: [*c]Uint8 = undefined;
    _ = &a;
    var b: [*c]Uint8 = undefined;
    _ = &b;
    var tmp: [*c]Uint8 = undefined;
    _ = &tmp;
    var i: c_int = undefined;
    _ = &i;
    if (surface.*.h <= @as(c_int, 1)) {
        return @"true" != 0;
    }
    a = @ptrCast(@alignCast(surface.*.pixels));
    b = a + @as(usize, @bitCast(@as(isize, @intCast((surface.*.h - @as(c_int, 1)) * surface.*.pitch))));
    tmp = blk: {
        (&isstack).* = (@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch))))))) else @as([*c]Uint8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, surface.*.pitch)))))));
    };
    if (!(tmp != null)) {
        return @"false" != 0;
    }
    {
        i = @divTrunc(surface.*.h, @as(c_int, 2));
        while ((blk: {
            const ref = &i;
            const tmp_1 = ref.*;
            ref.* -= 1;
            break :blk tmp_1;
        }) != 0) {
            _ = memcpy(@ptrCast(@alignCast(tmp)), @ptrCast(@alignCast(a)), @bitCast(@as(c_long, surface.*.pitch)));
            _ = memcpy(@ptrCast(@alignCast(a)), @ptrCast(@alignCast(b)), @bitCast(@as(c_long, surface.*.pitch)));
            _ = memcpy(@ptrCast(@alignCast(b)), @ptrCast(@alignCast(tmp)), @bitCast(@as(c_long, surface.*.pitch)));
            a += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
            b -= @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
        }
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(tmp)));
    }
    return @"true" != 0;
}
pub export fn SDL_FlipSurface_REAL(surface: [*c]SDL_Surface, flip: SDL_FlipMode) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (!(surface.*.pixels != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return @"true" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                result = @"true" != 0;
                switch (flip) {
                    @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_FlipMode, SDL_FLIP_VERTICAL) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL_AND_VERTICAL) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            7 => {
                return result;
            },
            8 => {
                result = SDL_FlipSurfaceHorizontal(surface);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                result = SDL_FlipSurfaceVertical(surface);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                {
                    const ref = &result;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_FlipSurfaceHorizontal(surface)))) != 0;
                }
                {
                    const ref = &result;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_FlipSurfaceVertical(surface)))) != 0;
                }
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                result = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("flip"))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_ConvertSurfaceRectAndColorspace(surface: [*c]SDL_Surface, arg_rect: [*c]const SDL_Rect, format: SDL_PixelFormat, arg_palette: [*c]SDL_Palette, arg_colorspace: SDL_Colorspace, props: SDL_PropertiesID) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var palette = arg_palette;
    _ = &palette;
    var colorspace = arg_colorspace;
    _ = &colorspace;
    var temp_palette: [*c]SDL_Palette = undefined;
    _ = &temp_palette;
    var convert: [*c]SDL_Surface = undefined;
    _ = &convert;
    var src_colorspace: SDL_Colorspace = undefined;
    _ = &src_colorspace;
    var src_properties: SDL_PropertiesID = undefined;
    _ = &src_properties;
    var copy_flags: Uint32 = undefined;
    _ = &copy_flags;
    var copy_color: SDL_Color = undefined;
    _ = &copy_color;
    var bounds: SDL_Rect = undefined;
    _ = &bounds;
    var result: bool = undefined;
    _ = &result;
    var palette_ck_transform: bool = undefined;
    _ = &palette_ck_transform;
    var palette_ck_value: Uint8 = undefined;
    _ = &palette_ck_value;
    var palette_saved_alpha: [*c]Uint8 = undefined;
    _ = &palette_saved_alpha;
    var palette_saved_alpha_ncolors: c_int = undefined;
    _ = &palette_saved_alpha_ncolors;
    var i: c_int = undefined;
    _ = &i;
    var size: usize = undefined;
    _ = &size;
    var set_opaque: bool = undefined;
    _ = &set_opaque;
    var is_opaque: bool = undefined;
    _ = &is_opaque;
    var has_alpha_channel: bool = undefined;
    _ = &has_alpha_channel;
    var i_1: c_int = undefined;
    _ = &i_1;
    var i_2: c_int = undefined;
    _ = &i_2;
    var set_colorkey_by_color: bool = undefined;
    _ = &set_colorkey_by_color;
    var convert_colorkey: bool = undefined;
    _ = &convert_colorkey;
    var tmp: [*c]SDL_Surface = undefined;
    _ = &tmp;
    var tmp2: [*c]SDL_Surface = undefined;
    _ = &tmp2;
    var converted_colorkey: c_int = undefined;
    _ = &converted_colorkey;
    var i_3: c_int = undefined;
    _ = &i_3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                temp_palette = null;
                convert = null;
                palette_ck_transform = @"false" != 0;
                palette_ck_value = 0;
                palette_saved_alpha = null;
                palette_saved_alpha_ncolors = 0;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                if (temp_palette != null) {
                    sdl_pc = 126;
                    continue;
                } else {
                    sdl_pc = 127;
                    continue;
                }
            },
            2 => {
                if (temp_palette != null) {
                    sdl_pc = 148;
                    continue;
                } else {
                    sdl_pc = 149;
                    continue;
                }
            },
            3 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
                {
                    sdl_pc = 2;
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
                if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("format"))));
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                bounds.x = 0;
                bounds.y = 0;
                bounds.w = surface.*.w;
                bounds.h = surface.*.h;
                if (rect != null) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                bounds.w = rect.*.w;
                bounds.h = rect.*.h;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                rect = &bounds;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (palette != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                i = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            14 => {
                src_colorspace = surface.*.colorspace;
                src_properties = surface.*.props;
                if ((surface.*.pixels != null) or ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            15 => {
                if (i < palette.*.ncolors) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                if (((@as(c_int, palette.*.colors[@bitCast(@as(isize, @intCast(i)))].r) != @as(c_int, 255)) or (@as(c_int, palette.*.colors[@bitCast(@as(isize, @intCast(i)))].g) != @as(c_int, 255))) or (@as(c_int, palette.*.colors[@bitCast(@as(isize, @intCast(i)))].b) != @as(c_int, 255))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            17 => {
                i += 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                if (i == palette.*.ncolors) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 18;
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
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                _ = SDL_SetError_REAL("Empty destination palette");
                {
                    sdl_pc = 2;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            25 => {
                temp_palette = SDL_CreatePalette_REAL(@as(c_int, 1) << @intCast(if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))));
                if (temp_palette != null) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            28 => {
                SDL_DitherPalette(temp_palette);
                palette = temp_palette;
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
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            31 => {
                convert = SDL_CreateSurfaceUninitialized(rect.*.w, rect.*.h, format);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                convert = SDL_CreateSurfaceFrom_REAL(rect.*.w, rect.*.h, format, null, 0);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (!(convert != null)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 2;
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
                if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                _ = SDL_SetSurfacePalette_REAL(convert, palette);
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
                if (colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_UNKNOWN)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                colorspace = src_colorspace;
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
                _ = SDL_SetSurfaceColorspace_REAL(convert, colorspace);
                if (((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) or ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                if ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) and (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG))) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                copy_flags = @bitCast(@as(c_int, surface.*.map.info.flags));
                copy_color.r = surface.*.map.info.r;
                copy_color.g = surface.*.map.info.g;
                copy_color.b = surface.*.map.info.b;
                copy_color.a = surface.*.map.info.a;
                surface.*.map.info.r = 255;
                surface.*.map.info.g = 255;
                surface.*.map.info.b = 255;
                surface.*.map.info.a = 255;
                surface.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags & @as(Uint32, @bitCast(@as(c_int, SDL_COPY_RLE_COLORKEY | SDL_COPY_RLE_ALPHAKEY))))));
                SDL_InvalidateMap(&surface.*.map);
                if ((surface.*.palette != null) and (((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            46 => {
                size = @bitCast(@as(c_long, surface.*.pitch));
                convert.*.pixels = SDL_malloc_REAL(size);
                if (!(convert.*.pixels != null)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                if (!SDL_ConvertPixelsAndColorspace_REAL(surface.*.w, surface.*.h, surface.*.format, src_colorspace, src_properties, surface.*.pixels, surface.*.pitch, convert.*.format, colorspace, props, convert.*.pixels, convert.*.pitch)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            48 => {
                copy_flags = @bitCast(@as(c_int, surface.*.map.info.flags));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 2;
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
                convert.*.flags &= ~SDL_SURFACE_PREALLOCATED;
                convert.*.pitch = surface.*.pitch;
                _ = memcpy(convert.*.pixels, surface.*.pixels, size);
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                {
                    sdl_pc = 2;
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            55 => {
                set_opaque = @"false" != 0;
                SDL_DetectPalette(surface.*.palette, &is_opaque, &has_alpha_channel);
                if (is_opaque) {
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
                if ((copy_flags & @as(Uint32, SDL_COPY_COLORKEY)) != 0) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            58 => {
                if (!has_alpha_channel) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
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
                if (set_opaque) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            61 => {
                set_opaque = @"true" != 0;
                {
                    sdl_pc = 63;
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
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            64 => {
                palette_saved_alpha_ncolors = surface.*.palette.*.ncolors;
                if (palette_saved_alpha_ncolors > @as(c_int, 0)) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
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
                    sdl_pc = 57;
                    continue;
                }
            },
            67 => {
                palette_saved_alpha = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(Uint8) *% @as(c_ulong, @bitCast(@as(c_long, palette_saved_alpha_ncolors))))));
                i_1 = 0;
                {
                    sdl_pc = 70;
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
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            70 => {
                if (i_1 < palette_saved_alpha_ncolors) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            71 => {
                palette_saved_alpha[@bitCast(@as(isize, @intCast(i_1)))] = surface.*.palette.*.colors[@bitCast(@as(isize, @intCast(i_1)))].a;
                surface.*.palette.*.colors[@bitCast(@as(isize, @intCast(i_1)))].a = SDL_ALPHA_OPAQUE;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                i_1 += 1;
                {
                    sdl_pc = 70;
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
                if ((surface.*.palette != null) and !(palette != null)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
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
                if ((surface.*.pixels != null) or ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            77 => {
                palette_ck_transform = @"true" != 0;
                palette_ck_value = surface.*.palette.*.colors[surface.*.map.info.colorkey].a;
                surface.*.palette.*.colors[surface.*.map.info.colorkey].a = SDL_ALPHA_TRANSPARENT;
                {
                    sdl_pc = 79;
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
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            80 => {
                result = SDL_BlitSurfaceUnchecked_REAL(surface, rect, convert, &bounds);
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                result = @"true" != 0;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (palette_ck_transform) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                surface.*.palette.*.colors[surface.*.map.info.colorkey].a = palette_ck_value;
                {
                    sdl_pc = 85;
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
                if (palette_saved_alpha != null) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                i_2 = 0;
                {
                    sdl_pc = 89;
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
                convert.*.map.info.r = copy_color.r;
                convert.*.map.info.g = copy_color.g;
                convert.*.map.info.b = copy_color.b;
                convert.*.map.info.a = copy_color.a;
                convert.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags & @as(Uint32, @bitCast(@as(c_int, ~((((SDL_COPY_COLORKEY | SDL_COPY_BLEND) | SDL_COPY_RLE_DESIRED) | SDL_COPY_RLE_COLORKEY) | SDL_COPY_RLE_ALPHAKEY)))))));
                surface.*.map.info.r = copy_color.r;
                surface.*.map.info.g = copy_color.g;
                surface.*.map.info.b = copy_color.b;
                surface.*.map.info.a = copy_color.a;
                surface.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags)));
                SDL_InvalidateMap(&surface.*.map);
                if (!result) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            89 => {
                if (i_2 < palette_saved_alpha_ncolors) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            90 => {
                surface.*.palette.*.colors[@bitCast(@as(isize, @intCast(i_2)))].a = palette_saved_alpha[@bitCast(@as(isize, @intCast(i_2)))];
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                i_2 += 1;
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            92 => {
                SDL_free_REAL(@ptrCast(@alignCast(palette_saved_alpha)));
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                if ((copy_flags & @as(Uint32, SDL_COPY_COLORKEY)) != 0) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                set_colorkey_by_color = @"false" != 0;
                convert_colorkey = @"true" != 0;
                if (surface.*.palette != null) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            98 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            99 => {
                if (((palette != null) and (surface.*.palette.*.ncolors <= palette.*.ncolors)) and (SDL_memcmp_REAL(@ptrCast(@alignCast(surface.*.palette.*.colors)), @ptrCast(@alignCast(palette.*.colors)), @as(c_ulong, @bitCast(@as(c_long, surface.*.palette.*.ncolors))) *% @sizeOf(SDL_Color)) == @as(c_int, 0))) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            100 => {
                set_colorkey_by_color = @"true" != 0;
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                if (set_colorkey_by_color) {
                    sdl_pc = 111;
                    continue;
                } else {
                    sdl_pc = 112;
                    continue;
                }
            },
            102 => {
                _ = SDL_SetSurfaceColorKey_REAL(convert, @"true" != 0, surface.*.map.info.colorkey);
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                if (!(palette != null)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            105 => {
                if (((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            106 => {
                set_colorkey_by_color = @"true" != 0;
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 104;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                set_colorkey_by_color = @"true" != 0;
                convert_colorkey = @"false" != 0;
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            111 => {
                converted_colorkey = 0;
                tmp = SDL_CreateSurfaceUninitialized(1, 1, surface.*.format);
                if (!(tmp != null)) {
                    sdl_pc = 114;
                    continue;
                } else {
                    sdl_pc = 115;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            113 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 2;
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
                if (surface.*.palette != null) {
                    sdl_pc = 117;
                    continue;
                } else {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                _ = SDL_SetSurfacePalette_REAL(tmp, surface.*.palette);
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 119;
                    continue;
                }
            },
            119 => {
                _ = SDL_FillSurfaceRect_REAL(tmp, null, surface.*.map.info.colorkey);
                tmp.*.map.info.flags &= ~SDL_COPY_COLORKEY;
                tmp2 = SDL_ConvertSurfaceAndColorspace_REAL(tmp, format, palette, colorspace, props);
                if (!(tmp2 != null)) {
                    sdl_pc = 120;
                    continue;
                } else {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                SDL_DestroySurface_REAL(tmp);
                {
                    sdl_pc = 2;
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
                _ = memcpy(@ptrCast(@alignCast(&converted_colorkey)), tmp2.*.pixels, tmp2.*.fmt.*.bytes_per_pixel);
                SDL_DestroySurface_REAL(tmp);
                SDL_DestroySurface_REAL(tmp2);
                _ = SDL_SetSurfaceColorKey_REAL(convert, @"true" != 0, @bitCast(@as(c_int, converted_colorkey)));
                if (convert_colorkey) {
                    sdl_pc = 123;
                    continue;
                } else {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                SDL_ConvertColorkeyToAlpha(convert, @"true" != 0);
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
                {
                    sdl_pc = 113;
                    continue;
                }
            },
            126 => {
                SDL_DestroyPalette_REAL(temp_palette);
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
                _ = SDL_SetSurfaceClipRect_REAL(convert, &surface.*.clip_rect);
                if ((@as(Uint32, @bitCast(@as(c_int, @intFromBool(((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))))) != 0) or ((copy_flags & @as(Uint32, SDL_COPY_MODULATE_ALPHA)) != 0)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                _ = SDL_SetSurfaceBlendMode_REAL(convert, SDL_BLENDMODE_BLEND);
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
                if ((copy_flags & @as(Uint32, SDL_COPY_RLE_DESIRED)) != 0) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                _ = SDL_SetSurfaceRLE_REAL(convert, @"true" != 0);
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                i_3 = 0;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            135 => {
                if (i_3 < surface.*.num_images) {
                    sdl_pc = 136;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            136 => {
                if (!SDL_AddSurfaceAlternateImage_REAL(convert, surface.*.images[@bitCast(@as(isize, @intCast(i_3)))])) {
                    sdl_pc = 139;
                    continue;
                } else {
                    sdl_pc = 140;
                    continue;
                }
            },
            137 => {
                i_3 += 1;
                {
                    sdl_pc = 135;
                    continue;
                }
            },
            138 => {
                if (surface.*.props != 0) {
                    sdl_pc = 142;
                    continue;
                } else {
                    sdl_pc = 143;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 2;
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
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            142 => {
                if (!SDL_CopyProperties_REAL(surface.*.props, SDL_GetSurfaceProperties_REAL(convert))) {
                    sdl_pc = 145;
                    continue;
                } else {
                    sdl_pc = 146;
                    continue;
                }
            },
            143 => {
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            144 => {
                return convert;
            },
            145 => {
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            146 => {
                {
                    sdl_pc = 147;
                    continue;
                }
            },
            147 => {
                _ = SDL_ClearProperty_REAL(SDL_GetSurfaceProperties_REAL(convert), "sdl2-compat.surface2");
                {
                    sdl_pc = 144;
                    continue;
                }
            },
            148 => {
                SDL_DestroyPalette_REAL(temp_palette);
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
                if (convert != null) {
                    sdl_pc = 151;
                    continue;
                } else {
                    sdl_pc = 152;
                    continue;
                }
            },
            151 => {
                SDL_DestroySurface_REAL(convert);
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
                return null;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ConvertSurfaceAndColorspace_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat, palette: [*c]SDL_Palette, colorspace: SDL_Colorspace, props: SDL_PropertiesID) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    return SDL_ConvertSurfaceRectAndColorspace(surface, null, format, palette, colorspace, props);
}
pub export fn SDL_RotateSurface_REAL(surface: [*c]SDL_Surface, angle: f32) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var rotated: [*c]SDL_Surface = null;
    _ = &rotated;
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    var rect_dest: SDL_Rect = undefined;
    _ = &rect_dest;
    var cangle: f64 = undefined;
    _ = &cangle;
    var sangle: f64 = undefined;
    _ = &sangle;
    var center: SDL_FPoint = SDL_FPoint{
        .x = @as(f32, @floatFromInt(surface.*.w)) * @as(f32, 0.5),
        .y = @as(f32, @floatFromInt(surface.*.h)) * @as(f32, 0.5),
    };
    _ = &center;
    SDLgfx_rotozoomSurfaceSizeTrig(surface.*.w, surface.*.h, @floatCast(angle), &center, &rect_dest, &cangle, &sangle);
    if ((((if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 32)) and (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_8888))) or ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) and SDL_SurfaceHasColorKey_REAL(surface))) {
        rotated = SDLgfx_rotateSurface(surface, @floatCast(angle), 1, 0, 0, &rect_dest, cangle, sangle, &center);
    } else {
        var convert: [*c]SDL_Surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_RGBA32);
        _ = &convert;
        if (convert != null) {
            var tmp: [*c]SDL_Surface = SDLgfx_rotateSurface(convert, @floatCast(angle), 1, 0, 0, &rect_dest, cangle, sangle, &center);
            _ = &tmp;
            if (tmp != null) {
                rotated = SDL_ConvertSurfaceAndColorspace_REAL(tmp, surface.*.format, surface.*.palette, surface.*.colorspace, surface.*.props);
                SDL_DestroySurface_REAL(tmp);
            }
            SDL_DestroySurface_REAL(convert);
        }
    }
    if (rotated != null) {
        if (SDL_HasProperty_REAL(surface.*.props, "SDL.surface.rotation")) {
            const rotation: f32 = @as(f32, @floatFromInt(SDL_GetNumberProperty_REAL(surface.*.props, "SDL.surface.rotation", 0))) - angle;
            _ = &rotation;
            _ = SDL_SetFloatProperty_REAL(SDL_GetSurfaceProperties_REAL(rotated), "SDL.surface.rotation", rotation);
        }
    }
    return rotated;
}
pub export fn SDL_DuplicateSurface_REAL(surface: [*c]SDL_Surface) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    return SDL_ConvertSurfaceAndColorspace_REAL(surface, surface.*.format, surface.*.palette, surface.*.colorspace, surface.*.props);
}
pub export fn SDL_ScaleSurface_REAL(surface: [*c]SDL_Surface, width: c_int, height: c_int, arg_scaleMode: SDL_ScaleMode) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var scaleMode = arg_scaleMode;
    _ = &scaleMode;
    var convert: [*c]SDL_Surface = undefined;
    _ = &convert;
    var copy_flags: Uint32 = undefined;
    _ = &copy_flags;
    var copy_color: SDL_Color = undefined;
    _ = &copy_color;
    var rc: bool = undefined;
    _ = &rc;
    var tmp: [*c]SDL_Surface = undefined;
    _ = &tmp;
    var scaled: [*c]SDL_Surface = undefined;
    _ = &scaled;
    var result: [*c]SDL_Surface = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                convert = null;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (convert != null) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
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
                if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                tmp = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
                if (!(tmp != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            8 => {
                return null;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                scaled = SDL_ScaleSurface_REAL(tmp, width, height, scaleMode);
                SDL_DestroySurface_REAL(tmp);
                if (!(scaled != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                return null;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                result = SDL_ConvertSurfaceAndColorspace_REAL(scaled, surface.*.format, null, surface.*.colorspace, surface.*.props);
                SDL_DestroySurface_REAL(scaled);
                return result;
            },
            14 => {
                scaleMode = SDL_SCALEMODE_NEAREST;
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
                if ((surface.*.pixels != null) or ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                convert = SDL_CreateSurfaceUninitialized(width, height, surface.*.format);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                convert = SDL_CreateSurfaceFrom_REAL(width, height, surface.*.format, null, 0);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (!(convert != null)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                _ = SDL_SetSurfacePalette_REAL(convert, surface.*.palette);
                _ = SDL_SetSurfaceColorspace_REAL(convert, surface.*.colorspace);
                _ = SDL_SetSurfaceRLE_REAL(convert, SDL_SurfaceHasRLE_REAL(surface));
                if ((surface.*.pixels != null) or ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                copy_flags = @bitCast(@as(c_int, surface.*.map.info.flags));
                copy_color.r = surface.*.map.info.r;
                copy_color.g = surface.*.map.info.g;
                copy_color.b = surface.*.map.info.b;
                copy_color.a = surface.*.map.info.a;
                surface.*.map.info.r = 255;
                surface.*.map.info.g = 255;
                surface.*.map.info.b = 255;
                surface.*.map.info.a = 255;
                surface.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags & @as(Uint32, @bitCast(@as(c_int, SDL_COPY_RLE_COLORKEY | SDL_COPY_RLE_ALPHAKEY))))));
                SDL_InvalidateMap(&surface.*.map);
                rc = SDL_BlitSurfaceScaled_REAL(surface, null, convert, null, scaleMode);
                convert.*.map.info.r = copy_color.r;
                convert.*.map.info.g = copy_color.g;
                convert.*.map.info.b = copy_color.b;
                convert.*.map.info.a = copy_color.a;
                convert.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags & @as(Uint32, @bitCast(@as(c_int, ~(SDL_COPY_RLE_COLORKEY | SDL_COPY_RLE_ALPHAKEY)))))));
                surface.*.map.info.r = copy_color.r;
                surface.*.map.info.g = copy_color.g;
                surface.*.map.info.b = copy_color.b;
                surface.*.map.info.a = copy_color.a;
                surface.*.map.info.flags = @bitCast(@as(c_uint, @truncate(copy_flags)));
                SDL_InvalidateMap(&surface.*.map);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                rc = @"true" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (!rc) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                return convert;
            },
            29 => {
                SDL_DestroySurface_REAL(convert);
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
                return null;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_ConvertSurfaceRect(surface: [*c]SDL_Surface, rect: [*c]const SDL_Rect, format: SDL_PixelFormat) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    return SDL_ConvertSurfaceRectAndColorspace(surface, rect, format, null, SDL_GetDefaultColorspaceForFormat(format), surface.*.props);
}
pub export fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    return SDL_ConvertSurfaceRect(surface, null, format);
}
pub export fn SDL_DuplicatePixels(width: c_int, height: c_int, format: SDL_PixelFormat, colorspace: SDL_Colorspace, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    if (pixels != null) {
        surface = SDL_CreateSurfaceUninitialized(width, height, format);
    } else {
        surface = SDL_CreateSurfaceFrom_REAL(width, height, format, null, 0);
    }
    if (!(surface != null)) {
        return null;
    }
    _ = SDL_SetSurfaceColorspace_REAL(surface, colorspace);
    if (surface.*.pixels != null) {
        var length: c_int = width * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))));
        _ = &length;
        var src: [*c]Uint8 = @ptrCast(@alignCast(pixels));
        _ = &src;
        var dst: [*c]Uint8 = @ptrCast(@alignCast(surface.*.pixels));
        _ = &dst;
        var rows: c_int = height;
        _ = &rows;
        while ((blk: {
            const ref = &rows;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, length)));
            dst += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
            src += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
        }
    }
    return surface;
}
pub export fn SDL_ConvertPixelsAndColorspace_REAL(arg_width: c_int, height: c_int, src_format: SDL_PixelFormat, arg_src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, arg_src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, arg_dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, arg_dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    var src_colorspace = arg_src_colorspace;
    _ = &src_colorspace;
    var src = arg_src;
    _ = &src;
    var dst_colorspace = arg_dst_colorspace;
    _ = &dst_colorspace;
    var dst = arg_dst;
    _ = &dst;
    var src_surface: SDL_Surface = undefined;
    _ = &src_surface;
    var dst_surface: SDL_Surface = undefined;
    _ = &dst_surface;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var nonconst_src: ?*anyopaque = @ptrCast(@alignCast(@constCast(src)));
    _ = &nonconst_src;
    var result: bool = undefined;
    _ = &result;
    if (!(src != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
    }
    if (!(src_pitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_pitch"))));
    }
    if (!(dst != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
    }
    if (!(dst_pitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_pitch"))));
    }
    if (src_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_UNKNOWN)) {
        src_colorspace = SDL_GetDefaultColorspaceForFormat(src_format);
    }
    if (dst_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_UNKNOWN)) {
        dst_colorspace = SDL_GetDefaultColorspaceForFormat(dst_format);
    }
    if (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
        return SDL_ConvertPixels_STB(width, height, src_format, src_colorspace, src_properties, src, src_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
    }
    if (((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        return SDL_ConvertPixels_YUV_to_YUV(width, height, src_format, src_colorspace, src_properties, src, src_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
    } else if ((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        return SDL_ConvertPixels_YUV_to_RGB(width, height, src_format, src_colorspace, src_properties, src, src_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
    } else if ((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        return SDL_ConvertPixels_RGB_to_YUV(width, height, src_format, src_colorspace, src_properties, src, src_pitch, dst_format, dst_colorspace, dst_properties, dst, dst_pitch);
    }
    if ((src_format == dst_format) and (src_colorspace == dst_colorspace)) {
        if (src_pitch == dst_pitch) {
            _ = memcpy(dst, src, @bitCast(@as(c_long, height * src_pitch)));
        } else {
            var i: c_int = undefined;
            _ = &i;
            const bpp: c_int = if ((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((src_format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
            _ = &bpp;
            width *= bpp;
            {
                i = height;
                while ((blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    _ = memcpy(dst, src, @bitCast(@as(c_long, width)));
                    src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
                    dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
                }
            }
        }
        return @"true" != 0;
    }
    if (!SDL_InitializeSurface(&src_surface, width, height, src_format, src_colorspace, src_properties, nonconst_src, src_pitch, @"true" != 0)) {
        return @"false" != 0;
    }
    _ = SDL_SetSurfaceBlendMode_REAL(&src_surface, SDL_BLENDMODE_NONE);
    if (!SDL_InitializeSurface(&dst_surface, width, height, dst_format, dst_colorspace, dst_properties, dst, dst_pitch, @"true" != 0)) {
        return @"false" != 0;
    }
    rect.x = 0;
    rect.y = 0;
    rect.w = width;
    rect.h = height;
    result = SDL_BlitSurfaceUnchecked_REAL(&src_surface, &rect, &dst_surface, &rect);
    SDL_DestroySurface_REAL(&src_surface);
    SDL_DestroySurface_REAL(&dst_surface);
    return result;
}
pub export fn SDL_ConvertPixels_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    return SDL_ConvertPixelsAndColorspace_REAL(width, height, src_format, SDL_COLORSPACE_UNKNOWN, 0, src, src_pitch, dst_format, SDL_COLORSPACE_UNKNOWN, 0, dst, dst_pitch);
}
pub fn SDL_PremultiplyAlpha_AXYZ8888(width: c_int, arg_height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var height = arg_height;
    _ = &height;
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var c: c_int = undefined;
    _ = &c;
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
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var src_px: [*c]const Uint32 = @ptrCast(@alignCast(src));
        _ = &src_px;
        var dst_px: [*c]Uint32 = @ptrCast(@alignCast(dst));
        _ = &dst_px;
        {
            c = width;
            while (c != 0) : (c -= 1) {
                srcpixel = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                {
                    srcR = (srcpixel >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                    srcG = (srcpixel >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                    srcB = srcpixel & @as(Uint32, 255);
                    srcA = srcpixel >> @intCast(@as(Uint32, 24));
                }
                dstA = srcA;
                dstR = (srcA *% srcR) / @as(Uint32, 255);
                dstG = (srcA *% srcG) / @as(Uint32, 255);
                dstB = (srcA *% srcB) / @as(Uint32, 255);
                {
                    dstpixel = (((dstA << @intCast(@as(Uint32, 24))) | (dstR << @intCast(@as(Uint32, 16)))) | (dstG << @intCast(@as(Uint32, 8)))) | dstB;
                }
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = dstpixel;
            }
        }
        src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
        dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
    }
}
pub fn SDL_PremultiplyAlpha_XYZA8888(width: c_int, arg_height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var height = arg_height;
    _ = &height;
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var c: c_int = undefined;
    _ = &c;
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
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var src_px: [*c]const Uint32 = @ptrCast(@alignCast(src));
        _ = &src_px;
        var dst_px: [*c]Uint32 = @ptrCast(@alignCast(dst));
        _ = &dst_px;
        {
            c = width;
            while (c != 0) : (c -= 1) {
                srcpixel = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                {
                    srcR = srcpixel >> @intCast(@as(Uint32, 24));
                    srcG = (srcpixel >> @intCast(@as(Uint32, 16))) & @as(Uint32, 255);
                    srcB = (srcpixel >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255);
                    srcA = srcpixel & @as(Uint32, 255);
                }
                dstA = srcA;
                dstR = (srcA *% srcR) / @as(Uint32, 255);
                dstG = (srcA *% srcG) / @as(Uint32, 255);
                dstB = (srcA *% srcB) / @as(Uint32, 255);
                {
                    dstpixel = (((dstR << @intCast(@as(Uint32, 24))) | (dstG << @intCast(@as(Uint32, 16)))) | (dstB << @intCast(@as(Uint32, 8)))) | dstA;
                }
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = dstpixel;
            }
        }
        src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
        dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
    }
}
pub fn SDL_PremultiplyAlpha_AXYZ128(width: c_int, arg_height: c_int, arg_src: ?*const anyopaque, src_pitch: c_int, arg_dst: ?*anyopaque, dst_pitch: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var height = arg_height;
    _ = &height;
    var src = arg_src;
    _ = &src;
    var dst = arg_dst;
    _ = &dst;
    var c: c_int = undefined;
    _ = &c;
    var flR: f32 = undefined;
    _ = &flR;
    var flG: f32 = undefined;
    _ = &flG;
    var flB: f32 = undefined;
    _ = &flB;
    var flA: f32 = undefined;
    _ = &flA;
    while ((blk: {
        const ref = &height;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        var src_px: [*c]const f32 = @ptrCast(@alignCast(src));
        _ = &src_px;
        var dst_px: [*c]f32 = @ptrCast(@alignCast(dst));
        _ = &dst_px;
        {
            c = width;
            while (c != 0) : (c -= 1) {
                flA = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                flR = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                flG = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                flB = (blk: {
                    const ref = &src_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                flR *= flA;
                flG *= flA;
                flB *= flA;
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = flA;
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = flR;
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = flG;
                (blk: {
                    const ref = &dst_px;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = flB;
            }
        }
        src = @ptrCast(@alignCast(@as([*c]const Uint8, @ptrCast(@alignCast(src))) + @as(usize, @bitCast(@as(isize, @intCast(src_pitch))))));
        dst = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(dst))) + @as(usize, @bitCast(@as(isize, @intCast(dst_pitch))))));
    }
}
pub fn SDL_PremultiplyAlphaPixelsAndColorspace(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, arg_src: ?*const anyopaque, arg_src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, arg_dst: ?*anyopaque, arg_dst_pitch: c_int, linear: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var src = arg_src;
    _ = &src;
    var src_pitch = arg_src_pitch;
    _ = &src_pitch;
    var dst = arg_dst;
    _ = &dst;
    var dst_pitch = arg_dst_pitch;
    _ = &dst_pitch;
    var convert: [*c]SDL_Surface = undefined;
    _ = &convert;
    var final_dst: ?*anyopaque = undefined;
    _ = &final_dst;
    var final_dst_pitch: c_int = undefined;
    _ = &final_dst_pitch;
    var format: SDL_PixelFormat = undefined;
    _ = &format;
    var colorspace: SDL_Colorspace = undefined;
    _ = &colorspace;
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                convert = null;
                final_dst = dst;
                final_dst_pitch = dst_pitch;
                result = @"false" != 0;
                if (!(src != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (convert != null) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            2 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!(src_pitch != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src_pitch"))));
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!(dst != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst"))));
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (!(dst_pitch != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("dst_pitch"))));
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if ((((linear or (!((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((src_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((src_format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) or ((if ((src_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((src_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((src_format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 32))) or (!((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((dst_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((dst_format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) or ((if ((dst_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((dst_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((dst_format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) > @as(c_int, 32))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if ((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB128_FLOAT)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR128_FLOAT))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                if ((((src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888))) or (src_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            16 => {
                if (linear) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            17 => {
                format = src_format;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                format = SDL_PIXELFORMAT_ARGB128_FLOAT;
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
                format = src_format;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                format = SDL_PIXELFORMAT_ARGB8888;
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
                colorspace = SDL_COLORSPACE_SRGB_LINEAR;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                colorspace = SDL_COLORSPACE_SRGB;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if ((src_format != format) or (src_colorspace != colorspace)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                convert = SDL_CreateSurfaceUninitialized(width, height, format);
                if (!(convert != null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                if ((dst_format != format) or (dst_colorspace != colorspace)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            28 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB128_FLOAT) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR128_FLOAT) => {
                        sdl_pc = 47;
                        continue;
                    },
                    else => {
                        sdl_pc = 48;
                        continue;
                    },
                }
            },
            29 => {
                {
                    sdl_pc = 1;
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
                if (!SDL_ConvertPixelsAndColorspace_REAL(width, height, src_format, src_colorspace, src_properties, src, src_pitch, format, colorspace, 0, convert.*.pixels, convert.*.pitch)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                src = convert.*.pixels;
                src_pitch = convert.*.pitch;
                dst = convert.*.pixels;
                dst_pitch = convert.*.pitch;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            35 => {
                convert = SDL_CreateSurfaceUninitialized(width, height, format);
                if (!(convert != null)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 1;
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
                dst = convert.*.pixels;
                dst_pitch = convert.*.pitch;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                if (dst != final_dst) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
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
                SDL_PremultiplyAlpha_AXYZ8888(width, height, src, src_pitch, dst, dst_pitch);
                {
                    sdl_pc = 41;
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
                SDL_PremultiplyAlpha_XYZA8888(width, height, src, src_pitch, dst, dst_pitch);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                SDL_PremultiplyAlpha_AXYZ128(width, height, src, src_pitch, dst, dst_pitch);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            48 => {
                _ = SDL_SetError_REAL("Unexpected internal pixel format");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                if (!SDL_ConvertPixelsAndColorspace_REAL(width, height, format, colorspace, 0, convert.*.pixels, convert.*.pitch, dst_format, dst_colorspace, dst_properties, final_dst, final_dst_pitch)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
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
                result = @"true" != 0;
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                SDL_DestroySurface_REAL(convert);
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
                return result;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_PremultiplyAlpha_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) bool {
    @setEvalBranchQuota(100000);
    var src_colorspace: SDL_Colorspace = SDL_GetDefaultColorspaceForFormat(src_format);
    _ = &src_colorspace;
    var dst_colorspace: SDL_Colorspace = SDL_GetDefaultColorspaceForFormat(dst_format);
    _ = &dst_colorspace;
    return SDL_PremultiplyAlphaPixelsAndColorspace(width, height, src_format, src_colorspace, 0, src, src_pitch, dst_format, dst_colorspace, 0, dst, dst_pitch, linear);
}
pub export fn SDL_PremultiplySurfaceAlpha_REAL(surface: [*c]SDL_Surface, linear: bool) bool {
    @setEvalBranchQuota(100000);
    var colorspace: SDL_Colorspace = undefined;
    _ = &colorspace;
    if (!SDL_SurfaceValid(surface)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    colorspace = surface.*.colorspace;
    return SDL_PremultiplyAlphaPixelsAndColorspace(surface.*.w, surface.*.h, surface.*.format, colorspace, surface.*.props, surface.*.pixels, surface.*.pitch, surface.*.format, colorspace, surface.*.props, surface.*.pixels, surface.*.pitch, linear);
}
pub export fn SDL_ClearSurface_REAL(surface: [*c]SDL_Surface, r: f32, g: f32, b: f32, a: f32) bool {
    @setEvalBranchQuota(100000);
    var clip_rect: SDL_Rect = undefined;
    _ = &clip_rect;
    var result: bool = undefined;
    _ = &result;
    var color: Uint32 = undefined;
    _ = &color;
    var tmp: [*c]SDL_Surface = undefined;
    _ = &tmp;
    var tmp_1: [*c]SDL_Surface = undefined;
    _ = &tmp_1;
    var pixels: [*c]f32 = undefined;
    _ = &pixels;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"false" != 0;
                if (!SDL_SurfaceValid(surface)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetSurfaceClipRect_REAL(surface, &clip_rect);
                return result;
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
                _ = SDL_GetSurfaceClipRect_REAL(surface, &clip_rect);
                _ = SDL_SetSurfaceClipRect_REAL(surface, null);
                if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (@as(c_ulong, @bitCast(@as(c_long, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))))) <= @sizeOf(Uint32))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                color = SDL_MapSurfaceRGBA_REAL(surface, @intFromFloat(SDL_roundf_REAL((if (r < @as(f32, 0.0)) @as(f32, 0.0) else if (r > @as(f32, 1.0)) @as(f32, 1.0) else r) * @as(f32, 255.0))), @intFromFloat(SDL_roundf_REAL((if (g < @as(f32, 0.0)) @as(f32, 0.0) else if (g > @as(f32, 1.0)) @as(f32, 1.0) else g) * @as(f32, 255.0))), @intFromFloat(SDL_roundf_REAL((if (b < @as(f32, 0.0)) @as(f32, 0.0) else if (b > @as(f32, 1.0)) @as(f32, 1.0) else b) * @as(f32, 255.0))), @intFromFloat(SDL_roundf_REAL((if (a < @as(f32, 0.0)) @as(f32, 0.0) else if (a > @as(f32, 1.0)) @as(f32, 1.0) else a) * @as(f32, 255.0))));
                result = SDL_FillSurfaceRect_REAL(surface, null, color);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                tmp = SDL_CreateSurfaceUninitialized(surface.*.w, surface.*.h, SDL_PIXELFORMAT_ARGB8888);
                if (!(tmp != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                tmp_1 = SDL_CreateSurfaceUninitialized(1, 1, SDL_PIXELFORMAT_RGBA128_FLOAT);
                if (!(tmp_1 != null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
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
                if (SDL_ClearSurface_REAL(tmp, r, g, b, a)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                result = SDL_ConvertPixelsAndColorspace_REAL(surface.*.w, surface.*.h, tmp.*.format, tmp.*.colorspace, tmp.*.props, tmp.*.pixels, tmp.*.pitch, surface.*.format, surface.*.colorspace, surface.*.props, surface.*.pixels, surface.*.pitch);
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
                SDL_DestroySurface_REAL(tmp);
                {
                    sdl_pc = 10;
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
                _ = SDL_SetSurfaceColorspace_REAL(tmp_1, surface.*.colorspace);
                _ = SDL_SetSurfaceBlendMode_REAL(tmp_1, SDL_BLENDMODE_NONE);
                pixels = @ptrCast(@alignCast(tmp_1.*.pixels));
                pixels[@as(c_int, 0)] = r;
                pixels[@as(c_int, 1)] = g;
                pixels[@as(c_int, 2)] = b;
                pixels[@as(c_int, 3)] = a;
                result = SDL_BlitSurfaceScaled_REAL(tmp_1, null, surface, null, SDL_SCALEMODE_NEAREST);
                SDL_DestroySurface_REAL(tmp_1);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_MapSurfaceRGB_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8) Uint32 {
    @setEvalBranchQuota(100000);
    return SDL_MapSurfaceRGBA_REAL(surface, r, g, b, SDL_ALPHA_OPAQUE);
}
pub export fn SDL_MapSurfaceRGBA_REAL(surface: [*c]SDL_Surface, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32 {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return @"true";
    }
    return SDL_MapRGBA_REAL(surface.*.fmt, surface.*.palette, r, g, b, a);
}
pub export fn SDL_ReadSurfacePixel_REAL(surface: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, arg_r: [*c]Uint8, arg_g: [*c]Uint8, arg_b: [*c]Uint8, arg_a: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var a = arg_a;
    _ = &a;
    var pixel: Uint32 = 0;
    _ = &pixel;
    var bytes_per_pixel: usize = undefined;
    _ = &bytes_per_pixel;
    var unused: Uint8 = undefined;
    _ = &unused;
    var p: [*c]Uint8 = undefined;
    _ = &p;
    var result: bool = @"false" != 0;
    _ = &result;
    if (r != null) {
        r.* = 0;
    } else {
        r = &unused;
    }
    if (g != null) {
        g.* = 0;
    } else {
        g = &unused;
    }
    if (b != null) {
        b.* = 0;
    } else {
        b = &unused;
    }
    if (a != null) {
        a.* = 0;
    } else {
        a = &unused;
    }
    if ((!SDL_SurfaceValid(surface) or !(surface.*.format != 0)) or !(surface.*.pixels != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((x < @as(c_int, 0)) or (x >= surface.*.w)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("x"))));
    }
    if ((y < @as(c_int, 0)) or (y >= surface.*.h)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("y"))));
    }
    bytes_per_pixel = @bitCast(@as(c_long, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))));
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(surface)) {
            return @"false" != 0;
        }
    }
    p = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surface.*.pitch))))) + (@as(usize, @bitCast(@as(c_long, x))) *% bytes_per_pixel);
    if (((bytes_per_pixel <= @sizeOf(@TypeOf(pixel))) and !((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) and (@as(SDL_ColorPrimaries, (surface.*.colorspace >> @intCast(@as(SDL_Colorspace, 10))) & @as(SDL_Colorspace, 31)) == @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT709))) {
        _ = memcpy(@ptrCast(@alignCast(&pixel)), @ptrCast(@alignCast(p)), bytes_per_pixel);
        SDL_GetRGBA_REAL(pixel, surface.*.fmt, surface.*.palette, r, g, b, a);
        result = @"true" != 0;
    } else if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        var converted: [*c]SDL_Surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
        _ = &converted;
        if (converted != null) {
            result = SDL_ReadSurfacePixel_REAL(converted, x, y, r, g, b, a);
            SDL_DestroySurface_REAL(converted);
        }
    } else {
        var rgba: [4]Uint8 = undefined;
        _ = &rgba;
        if (SDL_ConvertPixelsAndColorspace_REAL(1, 1, surface.*.format, surface.*.colorspace, surface.*.props, @ptrCast(@alignCast(p)), surface.*.pitch, SDL_PIXELFORMAT_RGBA32, SDL_COLORSPACE_SRGB, 0, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rgba))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rgba))))))) {
            r.* = rgba[@as(c_int, 0)];
            g.* = rgba[@as(c_int, 1)];
            b.* = rgba[@as(c_int, 2)];
            a.* = rgba[@as(c_int, 3)];
            result = @"true" != 0;
        }
    }
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        SDL_UnlockSurface_REAL(surface);
    }
    return result;
}
pub export fn SDL_ReadSurfacePixelFloat_REAL(surface: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, arg_r: [*c]f32, arg_g: [*c]f32, arg_b: [*c]f32, arg_a: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var r = arg_r;
    _ = &r;
    var g = arg_g;
    _ = &g;
    var b = arg_b;
    _ = &b;
    var a = arg_a;
    _ = &a;
    var unused: f32 = undefined;
    _ = &unused;
    var result: bool = @"false" != 0;
    _ = &result;
    if (r != null) {
        r.* = 0.0;
    } else {
        r = &unused;
    }
    if (g != null) {
        g.* = 0.0;
    } else {
        g = &unused;
    }
    if (b != null) {
        b.* = 0.0;
    } else {
        b = &unused;
    }
    if (a != null) {
        a.* = 0.0;
    } else {
        a = &unused;
    }
    if ((!SDL_SurfaceValid(surface) or !(surface.*.format != 0)) or !(surface.*.pixels != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((x < @as(c_int, 0)) or (x >= surface.*.w)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("x"))));
    }
    if ((y < @as(c_int, 0)) or (y >= surface.*.h)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("y"))));
    }
    if (((@as(c_ulong, @bitCast(@as(c_long, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))))) <= @sizeOf(Uint32)) and !((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) and (@as(SDL_ColorPrimaries, (surface.*.colorspace >> @intCast(@as(SDL_Colorspace, 10))) & @as(SDL_Colorspace, 31)) == @as(SDL_ColorPrimaries, SDL_COLOR_PRIMARIES_BT709))) {
        var r8: Uint8 = undefined;
        _ = &r8;
        var g8: Uint8 = undefined;
        _ = &g8;
        var b8: Uint8 = undefined;
        _ = &b8;
        var a8: Uint8 = undefined;
        _ = &a8;
        if (SDL_ReadSurfacePixel_REAL(surface, x, y, &r8, &g8, &b8, &a8)) {
            r.* = @as(f32, @floatFromInt(r8)) / @as(f32, 255.0);
            g.* = @as(f32, @floatFromInt(g8)) / @as(f32, 255.0);
            b.* = @as(f32, @floatFromInt(b8)) / @as(f32, 255.0);
            a.* = @as(f32, @floatFromInt(a8)) / @as(f32, 255.0);
            result = @"true" != 0;
        }
    } else if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        var converted: [*c]SDL_Surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
        _ = &converted;
        if (converted != null) {
            result = SDL_ReadSurfacePixelFloat_REAL(converted, x, y, r, g, b, a);
            SDL_DestroySurface_REAL(converted);
        }
    } else {
        var rgba: [4]f32 = undefined;
        _ = &rgba;
        var p: [*c]Uint8 = undefined;
        _ = &p;
        if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            if (!SDL_LockSurface_REAL(surface)) {
                return @"false" != 0;
            }
        }
        p = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * (if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))));
        if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA128_FLOAT)) {
            _ = memcpy(@ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&rgba))))), @ptrCast(@alignCast(p)), @sizeOf(@TypeOf(rgba)));
            result = @"true" != 0;
        } else {
            var src_colorspace: SDL_Colorspace = surface.*.colorspace;
            _ = &src_colorspace;
            var dst_colorspace: SDL_Colorspace = @bitCast(if (src_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) SDL_COLORSPACE_SRGB_LINEAR else SDL_COLORSPACE_SRGB);
            _ = &dst_colorspace;
            if (SDL_ConvertPixelsAndColorspace_REAL(1, 1, surface.*.format, src_colorspace, surface.*.props, @ptrCast(@alignCast(p)), surface.*.pitch, SDL_PIXELFORMAT_RGBA128_FLOAT, dst_colorspace, 0, @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&rgba))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rgba))))))) {
                result = @"true" != 0;
            }
        }
        if (result) {
            r.* = rgba[@as(c_int, 0)];
            g.* = rgba[@as(c_int, 1)];
            b.* = rgba[@as(c_int, 2)];
            a.* = rgba[@as(c_int, 3)];
        }
        if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            SDL_UnlockSurface_REAL(surface);
        }
    }
    return result;
}
pub export fn SDL_WriteSurfacePixel_REAL(surface: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var pixel: Uint32 = 0;
    _ = &pixel;
    var bytes_per_pixel: usize = undefined;
    _ = &bytes_per_pixel;
    var p: [*c]Uint8 = undefined;
    _ = &p;
    var result: bool = @"false" != 0;
    _ = &result;
    if ((!SDL_SurfaceValid(surface) or !(surface.*.format != 0)) or !(surface.*.pixels != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((x < @as(c_int, 0)) or (x >= surface.*.w)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("x"))));
    }
    if ((y < @as(c_int, 0)) or (y >= surface.*.h)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("y"))));
    }
    bytes_per_pixel = @bitCast(@as(c_long, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))));
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        if (!SDL_LockSurface_REAL(surface)) {
            return @"false" != 0;
        }
    }
    p = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surface.*.pitch))))) + (@as(usize, @bitCast(@as(c_long, x))) *% bytes_per_pixel);
    if ((bytes_per_pixel <= @sizeOf(@TypeOf(pixel))) and !((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        pixel = SDL_MapRGBA_REAL(surface.*.fmt, surface.*.palette, r, g, b, a);
        _ = memcpy(@ptrCast(@alignCast(p)), @ptrCast(@alignCast(&pixel)), bytes_per_pixel);
        result = @"true" != 0;
    } else if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        result = SDL_SetError_REAL("That operation is not supported");
    } else {
        var rgba: [4]Uint8 = undefined;
        _ = &rgba;
        rgba[@as(c_int, 0)] = r;
        rgba[@as(c_int, 1)] = g;
        rgba[@as(c_int, 2)] = b;
        rgba[@as(c_int, 3)] = a;
        result = SDL_ConvertPixelsAndColorspace_REAL(1, 1, SDL_PIXELFORMAT_RGBA32, SDL_COLORSPACE_SRGB, 0, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&rgba))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rgba))))), surface.*.format, surface.*.colorspace, surface.*.props, @ptrCast(@alignCast(p)), surface.*.pitch);
    }
    if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
        SDL_UnlockSurface_REAL(surface);
    }
    return result;
}
pub export fn SDL_WriteSurfacePixelFloat_REAL(surface: [*c]SDL_Surface, arg_x: c_int, arg_y: c_int, r: f32, g: f32, b: f32, a: f32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var result: bool = @"false" != 0;
    _ = &result;
    if ((!SDL_SurfaceValid(surface) or !(surface.*.format != 0)) or !(surface.*.pixels != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if ((x < @as(c_int, 0)) or (x >= surface.*.w)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("x"))));
    }
    if ((y < @as(c_int, 0)) or (y >= surface.*.h)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("y"))));
    }
    if ((@as(c_ulong, @bitCast(@as(c_long, if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))))) <= @sizeOf(Uint32)) and !((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0))) {
        var r8: Uint8 = undefined;
        _ = &r8;
        var g8: Uint8 = undefined;
        _ = &g8;
        var b8: Uint8 = undefined;
        _ = &b8;
        var a8: Uint8 = undefined;
        _ = &a8;
        r8 = @intFromFloat(SDL_round_REAL(@floatCast((if (r < @as(f32, 0.0)) @as(f32, 0.0) else if (r > @as(f32, 1.0)) @as(f32, 1.0) else r) * @as(f32, 255.0))));
        g8 = @intFromFloat(SDL_round_REAL(@floatCast((if (g < @as(f32, 0.0)) @as(f32, 0.0) else if (g > @as(f32, 1.0)) @as(f32, 1.0) else g) * @as(f32, 255.0))));
        b8 = @intFromFloat(SDL_round_REAL(@floatCast((if (b < @as(f32, 0.0)) @as(f32, 0.0) else if (b > @as(f32, 1.0)) @as(f32, 1.0) else b) * @as(f32, 255.0))));
        a8 = @intFromFloat(SDL_round_REAL(@floatCast((if (a < @as(f32, 0.0)) @as(f32, 0.0) else if (a > @as(f32, 1.0)) @as(f32, 1.0) else a) * @as(f32, 255.0))));
        if (SDL_WriteSurfacePixel_REAL(surface, x, y, r8, g8, b8, a8)) {
            result = @"true" != 0;
        }
    } else if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        result = SDL_SetError_REAL("That operation is not supported");
    } else {
        var rgba: [4]f32 = undefined;
        _ = &rgba;
        var p: [*c]Uint8 = undefined;
        _ = &p;
        if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            if (!SDL_LockSurface_REAL(surface)) {
                return @"false" != 0;
            }
        }
        p = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(x * (if ((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((surface.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))));
        rgba[@as(c_int, 0)] = r;
        rgba[@as(c_int, 1)] = g;
        rgba[@as(c_int, 2)] = b;
        rgba[@as(c_int, 3)] = a;
        if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA128_FLOAT)) {
            _ = memcpy(@ptrCast(@alignCast(p)), @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&rgba))))), @sizeOf(@TypeOf(rgba)));
            result = @"true" != 0;
        } else {
            var dst_colorspace: SDL_Colorspace = surface.*.colorspace;
            _ = &dst_colorspace;
            var src_colorspace: SDL_Colorspace = @bitCast(if (dst_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) SDL_COLORSPACE_SRGB_LINEAR else SDL_COLORSPACE_SRGB);
            _ = &src_colorspace;
            result = SDL_ConvertPixelsAndColorspace_REAL(1, 1, SDL_PIXELFORMAT_RGBA128_FLOAT, src_colorspace, 0, @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@alignCast(&rgba))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(rgba))))), surface.*.format, dst_colorspace, surface.*.props, @ptrCast(@alignCast(p)), surface.*.pitch);
        }
        if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            SDL_UnlockSurface_REAL(surface);
        }
    }
    return result;
}
pub export fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void {
    @setEvalBranchQuota(100000);
    if (!SDL_SurfaceValid(surface)) {
        return;
    }
    if ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_DONTFREE) != 0) {
        return;
    }
    if ((blk: {
        const ref = &surface.*.refcount;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0)) {
        return;
    }
    SDL_RemoveSurfaceAlternateImages_REAL(surface);
    SDL_DestroyProperties_REAL(surface.*.props);
    SDL_InvalidateMap(&surface.*.map);
    while (surface.*.locked > @as(c_int, 0)) {
        SDL_UnlockSurface_REAL(surface);
    }
    if ((surface.*.internal_flags & SDL_INTERNAL_SURFACE_RLEACCEL) != 0) {
        SDL_UnRLESurface(surface);
    }
    _ = SDL_SetSurfacePalette_REAL(surface, null);
    if ((surface.*.flags & SDL_SURFACE_PREALLOCATED) != 0) {} else if ((surface.*.flags & SDL_SURFACE_SIMD_ALIGNED) != 0) {
        SDL_aligned_free_REAL(surface.*.pixels);
    } else {
        SDL_free_REAL(surface.*.pixels);
    }
    surface.*.reserved = null;
    if (!((surface.*.internal_flags & SDL_INTERNAL_SURFACE_STACK) != 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(surface)));
    }
}
pub export fn SDL_LoadSurface_IO_REAL(src: ?*SDL_IOStream, closeio: bool) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (!(src != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("src"))));
        return null;
    }
    if (SDL_IsBMP(src)) {
        return SDL_LoadBMP_IO_REAL(src, closeio);
    } else if (SDL_IsPNG(src)) {
        return SDL_LoadPNG_IO_REAL(src, closeio);
    } else if (SDL_IsJPG(src)) {
        return SDL_LoadJPG_IO_REAL(src, closeio);
    } else {
        if (closeio) {
            _ = SDL_CloseIO_REAL(src);
        }
        _ = SDL_SetError_REAL("Unsupported image format");
        return null;
    }
}
pub export fn SDL_LoadSurface_REAL(file: [*c]const u8) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var stream: ?*SDL_IOStream = SDL_IOFromFile_REAL(file, "rb");
    _ = &stream;
    if (!(stream != null)) {
        return null;
    }
    return SDL_LoadSurface_IO_REAL(stream, @"true" != 0);
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_AddSurfaceAlternateImage = SDL_AddSurfaceAlternateImage_REAL;
pub const SDL_BlitSurface = SDL_BlitSurface_REAL;
pub const SDL_BlitSurface9Grid = SDL_BlitSurface9Grid_REAL;
pub const SDL_BlitSurfaceScaled = SDL_BlitSurfaceScaled_REAL;
pub const SDL_BlitSurfaceTiled = SDL_BlitSurfaceTiled_REAL;
pub const SDL_BlitSurfaceTiledWithScale = SDL_BlitSurfaceTiledWithScale_REAL;
pub const SDL_BlitSurfaceUncheckedScaled = SDL_BlitSurfaceUncheckedScaled_REAL;
pub const SDL_ClearSurface = SDL_ClearSurface_REAL;
pub const SDL_ConvertPixels = SDL_ConvertPixels_REAL;
pub const SDL_ConvertPixelsAndColorspace = SDL_ConvertPixelsAndColorspace_REAL;
pub const SDL_ConvertSurface = SDL_ConvertSurface_REAL;
pub const SDL_ConvertSurfaceAndColorspace = SDL_ConvertSurfaceAndColorspace_REAL;
pub const SDL_CreateSurface = SDL_CreateSurface_REAL;
pub const SDL_CreateSurfaceFrom = SDL_CreateSurfaceFrom_REAL;
pub const SDL_CreateSurfacePalette = SDL_CreateSurfacePalette_REAL;
pub const SDL_DestroySurface = SDL_DestroySurface_REAL;
pub const SDL_DuplicateSurface = SDL_DuplicateSurface_REAL;
pub const SDL_FlipSurface = SDL_FlipSurface_REAL;
pub const SDL_GetSurfaceAlphaMod = SDL_GetSurfaceAlphaMod_REAL;
pub const SDL_GetSurfaceBlendMode = SDL_GetSurfaceBlendMode_REAL;
pub const SDL_GetSurfaceClipRect = SDL_GetSurfaceClipRect_REAL;
pub const SDL_GetSurfaceColorKey = SDL_GetSurfaceColorKey_REAL;
pub const SDL_GetSurfaceColorMod = SDL_GetSurfaceColorMod_REAL;
pub const SDL_GetSurfaceColorspace = SDL_GetSurfaceColorspace_REAL;
pub const SDL_GetSurfaceImages = SDL_GetSurfaceImages_REAL;
pub const SDL_GetSurfacePalette = SDL_GetSurfacePalette_REAL;
pub const SDL_GetSurfaceProperties = SDL_GetSurfaceProperties_REAL;
pub const SDL_LockSurface = SDL_LockSurface_REAL;
pub const SDL_MapSurfaceRGB = SDL_MapSurfaceRGB_REAL;
pub const SDL_MapSurfaceRGBA = SDL_MapSurfaceRGBA_REAL;
pub const SDL_PremultiplyAlpha = SDL_PremultiplyAlpha_REAL;
pub const SDL_PremultiplySurfaceAlpha = SDL_PremultiplySurfaceAlpha_REAL;
pub const SDL_ReadSurfacePixel = SDL_ReadSurfacePixel_REAL;
pub const SDL_ReadSurfacePixelFloat = SDL_ReadSurfacePixelFloat_REAL;
pub const SDL_RemoveSurfaceAlternateImages = SDL_RemoveSurfaceAlternateImages_REAL;
pub const SDL_ScaleSurface = SDL_ScaleSurface_REAL;
pub const SDL_SetSurfaceAlphaMod = SDL_SetSurfaceAlphaMod_REAL;
pub const SDL_SetSurfaceBlendMode = SDL_SetSurfaceBlendMode_REAL;
pub const SDL_SetSurfaceClipRect = SDL_SetSurfaceClipRect_REAL;
pub const SDL_SetSurfaceColorKey = SDL_SetSurfaceColorKey_REAL;
pub const SDL_SetSurfaceColorMod = SDL_SetSurfaceColorMod_REAL;
pub const SDL_SetSurfaceColorspace = SDL_SetSurfaceColorspace_REAL;
pub const SDL_SetSurfacePalette = SDL_SetSurfacePalette_REAL;
pub const SDL_SetSurfaceRLE = SDL_SetSurfaceRLE_REAL;
pub const SDL_SurfaceHasAlternateImages = SDL_SurfaceHasAlternateImages_REAL;
pub const SDL_SurfaceHasColorKey = SDL_SurfaceHasColorKey_REAL;
pub const SDL_SurfaceHasRLE = SDL_SurfaceHasRLE_REAL;
pub const SDL_UnlockSurface = SDL_UnlockSurface_REAL;
pub const SDL_WriteSurfacePixel = SDL_WriteSurfacePixel_REAL;
pub const SDL_WriteSurfacePixelFloat = SDL_WriteSurfacePixelFloat_REAL;
pub const SDL_RotateSurface = SDL_RotateSurface_REAL;
pub const SDL_LoadSurface_IO = SDL_LoadSurface_IO_REAL;
pub const SDL_LoadSurface = SDL_LoadSurface_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_BLENDMODE_BLEND = @as(c_uint, 0x00000001);
pub const SDL_BLENDMODE_BLEND_PREMULTIPLIED = @as(c_uint, 0x00000010);
pub const SDL_BLENDMODE_ADD = @as(c_uint, 0x00000002);
pub const SDL_BLENDMODE_ADD_PREMULTIPLIED = @as(c_uint, 0x00000020);
pub const SDL_BLENDMODE_MOD = @as(c_uint, 0x00000004);
pub const SDL_BLENDMODE_MUL = @as(c_uint, 0x00000008);
pub const SDL_BLENDMODE_INVALID = __helpers.promoteIntLiteral(c_uint, 0x7FFFFFFF, .hex);
pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_ALPHA_TRANSPARENT = @as(c_int, 0);
pub const SDL_SURFACE_PREALLOCATED = @as(c_uint, 0x00000001);
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_SURFACE_LOCKED = @as(c_uint, 0x00000004);
pub const SDL_SURFACE_SIMD_ALIGNED = @as(c_uint, 0x00000008);
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
pub const SDL_COPY_RLE_COLORKEY = @as(c_int, 0x00002000);
pub const SDL_COPY_RLE_ALPHAKEY = @as(c_int, 0x00004000);
pub const SDL_INTERNAL_SURFACE_DONTFREE = @as(c_uint, 0x00000001);
pub const SDL_INTERNAL_SURFACE_STACK = @as(c_uint, 0x00000002);
pub const SDL_INTERNAL_SURFACE_RLEACCEL = @as(c_uint, 0x00000004);
