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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_aligned_alloc_REAL(alignment: usize, size: usize) ?*anyopaque;
pub extern fn SDL_aligned_free_REAL(mem: ?*anyopaque) void;
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
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_I444: c_int = 875836489;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
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
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
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
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_ConvertPixelsAndColorspace_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_StretchSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect, scaleMode: SDL_ScaleMode) bool;
pub extern fn SDL_GetSIMDAlignment_REAL() usize;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_SDL_SW_YUVTexture = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    target_format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixels: [*c]Uint8 = null,
    pitches: [3]c_int = @import("std").mem.zeroes([3]c_int),
    planes: [3][*c]Uint8 = @import("std").mem.zeroes([3][*c]Uint8),
    stretch: [*c]SDL_Surface = null,
    display: [*c]SDL_Surface = null,
};
pub const SDL_SW_YUVTexture = struct_SDL_SW_YUVTexture;
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
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_CalculateYUVSize(format: SDL_PixelFormat, w: c_int, h: c_int, size: [*c]usize, pitch: [*c]usize) bool;
pub export fn SDL_SW_CreateYUVTexture(format: SDL_PixelFormat, colorspace: SDL_Colorspace, w: c_int, h: c_int) [*c]SDL_SW_YUVTexture {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_SW_CreateYUVTexture".*;
    };
    _ = &static_local___func__;
    var swdata: [*c]SDL_SW_YUVTexture = undefined;
    _ = &swdata;
    var dst_size: usize = undefined;
    _ = &dst_size;
    var bpp: c_int = undefined;
    _ = &bpp;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "!\"We should never get here (caught above)\"",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            1 => {
                swdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(swdata.*)))));
                if (!(swdata != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 8;
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
                    sdl_pc = 10;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                _ = SDL_SetError_REAL("Unsupported YUV format");
                return null;
            },
            13 => {
                return null;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                swdata.*.format = format;
                swdata.*.colorspace = colorspace;
                swdata.*.target_format = SDL_PIXELFORMAT_UNKNOWN;
                swdata.*.w = w;
                swdata.*.h = h;
                if (!SDL_CalculateYUVSize(format, w, h, &dst_size, null)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                SDL_SW_DestroyYUVTexture(swdata);
                return null;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                swdata.*.pixels = @ptrCast(@alignCast(SDL_aligned_alloc_REAL(SDL_GetSIMDAlignment_REAL(), dst_size)));
                if (!(swdata.*.pixels != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                SDL_SW_DestroyYUVTexture(swdata);
                return null;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                bpp = if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
                switch (format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 32;
                        continue;
                    },
                    else => {
                        sdl_pc = 33;
                        continue;
                    },
                }
            },
            22 => {
                return swdata;
            },
            23 => {
                {
                    sdl_pc = 24;
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
                swdata.*.pitches[@as(c_int, 0)] = w * bpp;
                swdata.*.pitches[@as(c_int, 1)] = @divTrunc(@divTrunc(swdata.*.pitches[@as(c_int, 0)], bpp) + @as(c_int, 1), @as(c_int, 2)) * bpp;
                swdata.*.pitches[@as(c_int, 2)] = swdata.*.pitches[@as(c_int, 1)];
                swdata.*.planes[@as(c_int, 0)] = swdata.*.pixels;
                swdata.*.planes[@as(c_int, 1)] = swdata.*.planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)] * h))));
                swdata.*.planes[@as(c_int, 2)] = swdata.*.planes[@as(c_int, 1)] + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)] * @divTrunc(h + @as(c_int, 1), @as(c_int, 2))))));
                {
                    sdl_pc = 22;
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
                swdata.*.pitches[@as(c_int, 0)] = w * bpp;
                swdata.*.pitches[@as(c_int, 1)] = swdata.*.pitches[@as(c_int, 0)];
                swdata.*.pitches[@as(c_int, 2)] = swdata.*.pitches[@as(c_int, 1)];
                swdata.*.planes[@as(c_int, 0)] = swdata.*.pixels;
                swdata.*.planes[@as(c_int, 1)] = swdata.*.planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)] * h))));
                swdata.*.planes[@as(c_int, 2)] = swdata.*.planes[@as(c_int, 1)] + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)] * h))));
                {
                    sdl_pc = 22;
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
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                swdata.*.pitches[@as(c_int, 0)] = @divTrunc(w + @as(c_int, 1), @as(c_int, 2)) * @as(c_int, 4);
                swdata.*.planes[@as(c_int, 0)] = swdata.*.pixels;
                {
                    sdl_pc = 22;
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
                swdata.*.pitches[@as(c_int, 0)] = w;
                swdata.*.pitches[@as(c_int, 1)] = @as(c_int, 2) * @divTrunc(swdata.*.pitches[@as(c_int, 0)] + @as(c_int, 1), @as(c_int, 2));
                swdata.*.planes[@as(c_int, 0)] = swdata.*.pixels;
                swdata.*.planes[@as(c_int, 1)] = swdata.*.planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)] * h))));
                {
                    sdl_pc = 22;
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            37 => {
                if (!!(@intFromPtr("We should never get here (caught above)") != 0)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_yuv_sw.c", 112);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            43 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SW_QueryYUVTexturePixels(swdata: [*c]SDL_SW_YUVTexture, pixels: [*c]?*anyopaque, pitch: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    pixels.* = @ptrCast(@alignCast(swdata.*.planes[@as(c_int, 0)]));
    pitch.* = swdata.*.pitches[@as(c_int, 0)];
    return @"true" != 0;
}
pub export fn SDL_SW_UpdateYUVTexture(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var bpp: c_int = undefined;
    _ = &bpp;
    var src: [*c]Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var row: c_int = undefined;
    _ = &row;
    var length: usize = undefined;
    _ = &length;
    var UVpitch: c_int = undefined;
    _ = &UVpitch;
    var src_1: [*c]Uint8 = undefined;
    _ = &src_1;
    var dst_2: [*c]Uint8 = undefined;
    _ = &dst_2;
    var row_3: c_int = undefined;
    _ = &row_3;
    var length_4: usize = undefined;
    _ = &length_4;
    var src_5: [*c]Uint8 = undefined;
    _ = &src_5;
    var dst_6: [*c]Uint8 = undefined;
    _ = &dst_6;
    var row_7: c_int = undefined;
    _ = &row_7;
    var length_8: usize = undefined;
    _ = &length_8;
    var src_9: [*c]Uint8 = undefined;
    _ = &src_9;
    var dst_10: [*c]Uint8 = undefined;
    _ = &dst_10;
    var row_11: c_int = undefined;
    _ = &row_11;
    var length_12: usize = undefined;
    _ = &length_12;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                bpp = if ((swdata.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
                switch (swdata.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 45;
                        continue;
                    },
                    else => {
                        sdl_pc = 57;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
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
                if (((((rect.*.x == @as(c_int, 0)) and (rect.*.y == @as(c_int, 0))) and (rect.*.w == swdata.*.w)) and (rect.*.h == swdata.*.h)) and (pitch == swdata.*.pitches[@as(c_int, 0)])) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = memcpy(@ptrCast(@alignCast(swdata.*.pixels)), pixels, @as(usize, @bitCast(@as(c_long, (swdata.*.h * swdata.*.w) * bpp))) +% @as(usize, @bitCast(@as(c_long, ((@as(c_int, 2) * @divTrunc(swdata.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))) * bpp))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                UVpitch = @divTrunc(@divTrunc(pitch, bpp) + @as(c_int, 1), @as(c_int, 2)) * bpp;
                src = @ptrCast(@alignCast(@constCast(pixels)));
                dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.w) * bpp))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * bpp))));
                length = @bitCast(@as(c_long, rect.*.w * bpp));
                row = 0;
                {
                    sdl_pc = 8;
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
                if (row < rect.*.h) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)]))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                row += 1;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                src = @as([*c]Uint8, @ptrCast(@alignCast(@constCast(pixels)))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))));
                dst = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))));
                dst += @as(usize, @bitCast(@as(isize, @intCast((@divTrunc(rect.*.y, @as(c_int, 2)) * swdata.*.pitches[@as(c_int, 1)]) + (@divTrunc(rect.*.x, @as(c_int, 2)) * bpp)))));
                length = @bitCast(@as(c_long, @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)) * bpp));
                row = 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (row < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(UVpitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)]))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                row += 1;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                src = (@as([*c]Uint8, @ptrCast(@alignCast(@constCast(pixels)))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * UVpitch))));
                dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2)) * swdata.*.pitches[@as(c_int, 1)]))));
                dst += @as(usize, @bitCast(@as(isize, @intCast((@divTrunc(rect.*.y, @as(c_int, 2)) * swdata.*.pitches[@as(c_int, 2)]) + (@divTrunc(rect.*.x, @as(c_int, 2)) * bpp)))));
                length = @bitCast(@as(c_long, @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)) * bpp));
                row = 0;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (row < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            17 => {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(UVpitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 2)]))));
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                row += 1;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 7;
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
                if (((((rect.*.x == @as(c_int, 0)) and (rect.*.y == @as(c_int, 0))) and (rect.*.w == swdata.*.w)) and (rect.*.h == swdata.*.h)) and (pitch == swdata.*.pitches[@as(c_int, 0)])) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                _ = memcpy(@ptrCast(@alignCast(swdata.*.pixels)), pixels, @bitCast(@as(c_long, (swdata.*.h * pitch) * @as(c_int, 3))));
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                src_1 = @ptrCast(@alignCast(@constCast(pixels)));
                dst_2 = swdata.*.pixels;
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.pitches[@as(c_int, 0)]) + (rect.*.x * bpp)))));
                length_4 = @bitCast(@as(c_long, rect.*.w * bpp));
                row_3 = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                if (row_3 < rect.*.h) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                _ = memcpy(@ptrCast(@alignCast(dst_2)), @ptrCast(@alignCast(src_1)), length_4);
                src_1 += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)]))));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                row_3 += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                dst_2 = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))));
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.pitches[@as(c_int, 1)]) + (rect.*.x * bpp)))));
                row_3 = 0;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (row_3 < rect.*.h) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            30 => {
                _ = memcpy(@ptrCast(@alignCast(dst_2)), @ptrCast(@alignCast(src_1)), length_4);
                src_1 += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)]))));
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                row_3 += 1;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            32 => {
                dst_2 = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 1)]))));
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.pitches[@as(c_int, 2)]) + (rect.*.x * bpp)))));
                row_3 = 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (row_3 < rect.*.h) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                _ = memcpy(@ptrCast(@alignCast(dst_2)), @ptrCast(@alignCast(src_1)), length_4);
                src_1 += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst_2 += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 2)]))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                row_3 += 1;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 24;
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
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                src_5 = @ptrCast(@alignCast(@constCast(pixels)));
                dst_6 = (swdata.*.planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * @as(c_int, 2)))));
                length_8 = @as(usize, 4) *% ((@as(usize, @bitCast(@as(c_long, rect.*.w))) +% @as(usize, 1)) / @as(usize, 2));
                row_7 = 0;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (row_7 < rect.*.h) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                _ = memcpy(@ptrCast(@alignCast(dst_6)), @ptrCast(@alignCast(src_5)), length_8);
                src_5 += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst_6 += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)]))));
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                row_7 += 1;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 1;
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
                if ((((rect.*.x == @as(c_int, 0)) and (rect.*.y == @as(c_int, 0))) and (rect.*.w == swdata.*.w)) and (rect.*.h == swdata.*.h)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                _ = memcpy(@ptrCast(@alignCast(swdata.*.pixels)), pixels, @as(usize, @bitCast(@as(c_long, swdata.*.h * swdata.*.w))) +% @as(usize, @bitCast(@as(c_long, (@as(c_int, 2) * @divTrunc(swdata.*.h + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))))));
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                src_9 = @ptrCast(@alignCast(@constCast(pixels)));
                dst_10 = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * swdata.*.w))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
                length_12 = @bitCast(@as(c_long, rect.*.w));
                row_11 = 0;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            49 => {
                if (row_11 < rect.*.h) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                _ = memcpy(@ptrCast(@alignCast(dst_10)), @ptrCast(@alignCast(src_9)), length_12);
                src_9 += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                dst_10 += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.w))));
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                row_11 += 1;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            52 => {
                src_9 = @as([*c]Uint8, @ptrCast(@alignCast(@constCast(pixels)))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.h * pitch))));
                dst_10 = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.w))));
                dst_10 += @as(usize, @bitCast(@as(isize, @intCast(((@as(c_int, 2) * @divTrunc(rect.*.y + @as(c_int, 1), @as(c_int, 2))) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))) + (@as(c_int, 2) * @divTrunc(rect.*.x, @as(c_int, 2)))))));
                length_12 = @as(usize, 2) *% ((@as(usize, @bitCast(@as(c_long, rect.*.w))) +% @as(usize, 1)) / @as(usize, 2));
                row_11 = 0;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if (row_11 < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                _ = memcpy(@ptrCast(@alignCast(dst_10)), @ptrCast(@alignCast(src_9)), length_12);
                src_9 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @divTrunc(pitch + @as(c_int, 1), @as(c_int, 2))))));
                dst_10 += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))))));
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                row_11 += 1;
                {
                    sdl_pc = 53;
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
                return SDL_SetError_REAL("Unsupported YUV format");
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SW_UpdateYUVTexturePlanar(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var src: [*c]const Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var row: c_int = undefined;
    _ = &row;
    var length: usize = undefined;
    _ = &length;
    const bpp: c_int = if ((swdata.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    _ = &bpp;
    src = Yplane;
    dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * bpp))));
    length = @bitCast(@as(c_long, rect.*.w * bpp));
    {
        row = 0;
        while (row < rect.*.h) : (row += 1) {
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
            src += @as(usize, @bitCast(@as(isize, @intCast(Ypitch))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 0)]))));
        }
    }
    src = Uplane;
    if ((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
        dst = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))));
        dst += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.pitches[@as(c_int, 1)]) + (rect.*.x * bpp)))));
        length = @bitCast(@as(c_long, rect.*.w * bpp));
        {
            row = 0;
            while (row < rect.*.h) : (row += 1) {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(Upitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)]))));
            }
        }
    } else {
        if ((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) {
            dst = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))));
        } else {
            dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(swdata.*.h + @as(c_int, 1), @as(c_int, 2)) * swdata.*.pitches[@as(c_int, 1)]))));
        }
        dst += @as(usize, @bitCast(@as(isize, @intCast(((@divTrunc(rect.*.y, @as(c_int, 2)) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))) * bpp) + (@divTrunc(rect.*.x, @as(c_int, 2)) * bpp)))));
        length = @bitCast(@as(c_long, @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)) * bpp));
        {
            row = 0;
            while (row < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) : (row += 1) {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(Upitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 1)]))));
            }
        }
    }
    src = Vplane;
    if ((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
        dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 1)]))));
        dst += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * swdata.*.pitches[@as(c_int, 2)]) + (rect.*.x * bpp)))));
        length = @bitCast(@as(c_long, rect.*.w * bpp));
        {
            row = 0;
            while (row < rect.*.h) : (row += 1) {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(Vpitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 2)]))));
            }
        }
    } else {
        if (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) {
            dst = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))));
        } else {
            dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(swdata.*.h + @as(c_int, 1), @as(c_int, 2)) * swdata.*.pitches[@as(c_int, 1)]))));
        }
        dst += @as(usize, @bitCast(@as(isize, @intCast(((@divTrunc(rect.*.y, @as(c_int, 2)) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))) * bpp) + (@divTrunc(rect.*.x, @as(c_int, 2)) * bpp)))));
        length = @bitCast(@as(c_long, @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2)) * bpp));
        {
            row = 0;
            while (row < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) : (row += 1) {
                _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
                src += @as(usize, @bitCast(@as(isize, @intCast(Vpitch))));
                dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.pitches[@as(c_int, 2)]))));
            }
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SW_UpdateNVTexturePlanar(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var src: [*c]const Uint8 = undefined;
    _ = &src;
    var dst: [*c]Uint8 = undefined;
    _ = &dst;
    var row: c_int = undefined;
    _ = &row;
    var length: usize = undefined;
    _ = &length;
    src = Yplane;
    dst = (swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * swdata.*.w))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x))));
    length = @bitCast(@as(c_long, rect.*.w));
    {
        row = 0;
        while (row < rect.*.h) : (row += 1) {
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
            src += @as(usize, @bitCast(@as(isize, @intCast(Ypitch))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(swdata.*.w))));
        }
    }
    src = UVplane;
    dst = swdata.*.pixels + @as(usize, @bitCast(@as(isize, @intCast(swdata.*.h * swdata.*.w))));
    dst += @as(usize, @bitCast(@as(isize, @intCast((rect.*.y * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))) + rect.*.x))));
    length = @bitCast(@as(c_long, @divTrunc(rect.*.w + @as(c_int, 1), @as(c_int, 2))));
    length *%= 2;
    {
        row = 0;
        while (row < @divTrunc(rect.*.h + @as(c_int, 1), @as(c_int, 2))) : (row += 1) {
            _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), length);
            src += @as(usize, @bitCast(@as(isize, @intCast(UVpitch))));
            dst += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2) * @divTrunc(swdata.*.w + @as(c_int, 1), @as(c_int, 2))))));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SW_LockYUVTexture(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (swdata.*.format) {
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                if (rect != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 4;
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
                {
                    sdl_pc = 6;
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
                if ((rect != null) and ((((rect.*.x != @as(c_int, 0)) or (rect.*.y != @as(c_int, 0))) or (rect.*.w != swdata.*.w)) or (rect.*.h != swdata.*.h))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                return SDL_SetError_REAL("YV12, IYUV, I444, I4FL, NV12, NV21 textures only support full surface locks");
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 1;
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
                pixels.* = @ptrCast(@alignCast((swdata.*.planes[@as(c_int, 0)] + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * swdata.*.pitches[@as(c_int, 0)]))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((swdata.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (swdata.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((swdata.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                pixels.* = @ptrCast(@alignCast(swdata.*.planes[@as(c_int, 0)]));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                pitch.* = swdata.*.pitches[@as(c_int, 0)];
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SW_UnlockYUVTexture(_: [*c]SDL_SW_YUVTexture) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_SW_CopyYUVToRGB(swdata: [*c]SDL_SW_YUVTexture, srcrect: [*c]const SDL_Rect, target_format: SDL_PixelFormat, w: c_int, h: c_int, arg_pixels: ?*anyopaque, arg_pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var pixels = arg_pixels;
    _ = &pixels;
    var pitch = arg_pitch;
    _ = &pitch;
    var stretch: c_int = undefined;
    _ = &stretch;
    if ((target_format != swdata.*.target_format) and (swdata.*.display != null)) {
        SDL_DestroySurface_REAL(swdata.*.display);
        swdata.*.display = null;
    }
    stretch = 0;
    if ((((srcrect.*.x != 0) or (srcrect.*.y != 0)) or (srcrect.*.w < swdata.*.w)) or (srcrect.*.h < swdata.*.h)) {
        stretch = 1;
    } else if ((srcrect.*.w != w) or (srcrect.*.h != h)) {
        stretch = 1;
    }
    if (stretch != 0) {
        if (swdata.*.display != null) {
            swdata.*.display.*.w = w;
            swdata.*.display.*.h = h;
            swdata.*.display.*.pixels = pixels;
            swdata.*.display.*.pitch = pitch;
        } else {
            swdata.*.display = SDL_CreateSurfaceFrom_REAL(w, h, target_format, pixels, pitch);
            if (!(swdata.*.display != null)) {
                return @"false" != 0;
            }
            swdata.*.target_format = target_format;
        }
        if (!(swdata.*.stretch != null)) {
            swdata.*.stretch = SDL_CreateSurfaceUninitialized(swdata.*.w, swdata.*.h, target_format);
            if (!(swdata.*.stretch != null)) {
                return @"false" != 0;
            }
        }
        pixels = swdata.*.stretch.*.pixels;
        pitch = swdata.*.stretch.*.pitch;
    }
    if (!SDL_ConvertPixelsAndColorspace_REAL(swdata.*.w, swdata.*.h, swdata.*.format, swdata.*.colorspace, 0, @ptrCast(@alignCast(swdata.*.planes[@as(c_int, 0)])), swdata.*.pitches[@as(c_int, 0)], target_format, SDL_COLORSPACE_SRGB, 0, pixels, pitch)) {
        return @"false" != 0;
    }
    if (stretch != 0) {
        var rect: SDL_Rect = srcrect.*;
        _ = &rect;
        return SDL_StretchSurface_REAL(swdata.*.stretch, &rect, swdata.*.display, null, SDL_SCALEMODE_NEAREST);
    } else {
        return @"true" != 0;
    }
}
pub export fn SDL_SW_DestroyYUVTexture(swdata: [*c]SDL_SW_YUVTexture) void {
    @setEvalBranchQuota(100000);
    if (swdata != null) {
        SDL_aligned_free_REAL(@ptrCast(@alignCast(swdata.*.pixels)));
        SDL_DestroySurface_REAL(swdata.*.stretch);
        SDL_DestroySurface_REAL(swdata.*.display);
        SDL_free_REAL(@ptrCast(@alignCast(swdata)));
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
