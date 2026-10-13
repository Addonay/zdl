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
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_abs_REAL(x: c_int) c_int;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_StepUTF8_REAL(pstr: [*c][*c]const u8, pslen: [*c]usize) Uint32;
pub extern fn SDL_vasprintf_REAL(strp: [*c][*c]u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) c_int;
pub extern fn SDL_ceilf_REAL(x: f32) f32;
pub extern fn SDL_cosf_REAL(x: f32) f32;
pub extern fn SDL_fabsf_REAL(x: f32) f32;
pub extern fn SDL_floorf_REAL(x: f32) f32;
pub extern fn SDL_modff_REAL(x: f32, y: [*c]f32) f32;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub extern fn SDL_sinf_REAL(x: f32) f32;
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
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: f32) f32;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const SDL_AudioDeviceID = Uint32;
pub const SDL_BlendMode = Uint32;
pub const SDL_BLENDOPERATION_ADD: c_int = 1;
pub const enum_SDL_BlendOperation = c_uint;
pub const SDL_BlendOperation = enum_SDL_BlendOperation;
pub const SDL_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_BLENDFACTOR_SRC_ALPHA: c_int = 5;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 6;
pub const SDL_BLENDFACTOR_DST_COLOR: c_int = 7;
pub const enum_SDL_BlendFactor = c_uint;
pub const SDL_BlendFactor = enum_SDL_BlendFactor;
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
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_XRGB4444: c_int = 353504258;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
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
pub const SDL_PIXELFORMAT_MJPG: c_int = 1196444237;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const enum_SDL_ColorType = c_uint;
pub const SDL_ColorType = enum_SDL_ColorType;
pub const SDL_TRANSFER_CHARACTERISTICS_PQ: c_int = 16;
pub const enum_SDL_TransferCharacteristics = c_uint;
pub const SDL_TransferCharacteristics = enum_SDL_TransferCharacteristics;
pub const SDL_COLORSPACE_UNKNOWN: c_int = 0;
pub const SDL_COLORSPACE_SRGB: c_int = 301991328;
pub const SDL_COLORSPACE_SRGB_LINEAR: c_int = 301991168;
pub const SDL_COLORSPACE_HDR10: c_int = 301999616;
pub const SDL_COLORSPACE_JPEG: c_int = 570426566;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_FColor = extern struct {
    r: f32 = 0,
    g: f32 = 0,
    b: f32 = 0,
    a: f32 = 0,
};
pub const SDL_FColor = struct_SDL_FColor;
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
pub extern fn SDL_GetPixelFormatName_REAL(format: SDL_PixelFormat) [*c]const u8;
pub extern fn SDL_GetPixelFormatDetails_REAL(format: SDL_PixelFormat) [*c]const SDL_PixelFormatDetails;
pub extern fn SDL_SetPaletteColors_REAL(palette: [*c]SDL_Palette, colors: [*c]const SDL_Color, firstcolor: c_int, ncolors: c_int) bool;
pub extern fn SDL_DestroyPalette_REAL(palette: [*c]SDL_Palette) void;
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
pub const struct_SDL_FRect = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
};
pub const SDL_FRect = struct_SDL_FRect;
pub inline fn SDL_RectToFRect(rect: [*c]const SDL_Rect, frect: [*c]SDL_FRect) void {
    @setEvalBranchQuota(100000);
    frect.*.x = @as(f32, @floatFromInt(rect.*.x));
    frect.*.y = @as(f32, @floatFromInt(rect.*.y));
    frect.*.w = @as(f32, @floatFromInt(rect.*.w));
    frect.*.h = @as(f32, @floatFromInt(rect.*.h));
}
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectAndLineIntersection_REAL(rect: [*c]const SDL_Rect, X1: [*c]c_int, Y1: [*c]c_int, X2: [*c]c_int, Y2: [*c]c_int) bool;
pub extern fn SDL_GetRectIntersectionFloat_REAL(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SCALEMODE_INVALID: c_int = -1;
pub const SDL_SCALEMODE_NEAREST: c_int = 0;
pub const SDL_SCALEMODE_LINEAR: c_int = 1;
pub const SDL_SCALEMODE_PIXELART: c_int = 2;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
pub const SDL_FLIP_NONE: c_int = 0;
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
pub const SDL_FLIP_VERTICAL: c_int = 2;
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
pub extern fn SDL_CreateSurfaceFrom_REAL(width: c_int, height: c_int, format: SDL_PixelFormat, pixels: ?*anyopaque, pitch: c_int) [*c]SDL_Surface;
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID;
pub extern fn SDL_GetSurfaceColorspace_REAL(surface: [*c]SDL_Surface) SDL_Colorspace;
pub extern fn SDL_CreateSurfacePalette_REAL(surface: [*c]SDL_Surface) [*c]SDL_Palette;
pub extern fn SDL_SetSurfacePalette_REAL(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) bool;
pub extern fn SDL_LockSurface_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_UnlockSurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SurfaceHasColorKey_REAL(surface: [*c]SDL_Surface) bool;
pub extern fn SDL_GetSurfaceColorKey_REAL(surface: [*c]SDL_Surface, key: [*c]Uint32) bool;
pub extern fn SDL_GetSurfaceColorMod_REAL(surface: [*c]SDL_Surface, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool;
pub extern fn SDL_GetSurfaceAlphaMod_REAL(surface: [*c]SDL_Surface, alpha: [*c]Uint8) bool;
pub extern fn SDL_GetSurfaceBlendMode_REAL(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) bool;
pub extern fn SDL_ConvertSurfaceAndColorspace_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat, palette: [*c]SDL_Palette, colorspace: SDL_Colorspace, props: SDL_PropertiesID) [*c]SDL_Surface;
pub extern fn SDL_ConvertPixels_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_ConvertPixelsAndColorspace_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src_colorspace: SDL_Colorspace, src_properties: SDL_PropertiesID, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst_colorspace: SDL_Colorspace, dst_properties: SDL_PropertiesID, dst: ?*anyopaque, dst_pitch: c_int) bool;
pub extern fn SDL_BlitSurface_REAL(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) bool;
pub const SDL_CameraID = Uint32;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_DisplayModeData = opaque {};
pub const SDL_DisplayModeData = struct_SDL_DisplayModeData;
pub const struct_SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixel_density: f32 = 0,
    refresh_rate: f32 = 0,
    refresh_rate_numerator: c_int = 0,
    refresh_rate_denominator: c_int = 0,
    internal: ?*SDL_DisplayModeData = null,
};
pub const SDL_DisplayMode = struct_SDL_DisplayMode;
pub const struct_SDL_Window = opaque {
};
pub const SDL_Window = struct_SDL_Window;
pub const SDL_WindowFlags = Uint64;
pub extern fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID;
pub extern fn SDL_GetDesktopDisplayMode_REAL(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode;
pub extern fn SDL_GetDisplayForWindow_REAL(window: ?*SDL_Window) SDL_DisplayID;
pub extern fn SDL_CreateWindow_REAL(title: [*c]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) ?*SDL_Window;
pub extern fn SDL_GetWindowID_REAL(window: ?*SDL_Window) SDL_WindowID;
pub extern fn SDL_GetWindowFromID_REAL(id: SDL_WindowID) ?*SDL_Window;
pub extern fn SDL_GetWindowProperties_REAL(window: ?*SDL_Window) SDL_PropertiesID;
pub extern fn SDL_GetWindowFlags_REAL(window: ?*SDL_Window) SDL_WindowFlags;
pub extern fn SDL_GetWindowSize_REAL(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_GetWindowSafeArea_REAL(window: ?*SDL_Window, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetWindowSizeInPixels_REAL(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) bool;
pub extern fn SDL_ShowWindow_REAL(window: ?*SDL_Window) bool;
pub extern fn SDL_WindowHasSurface_REAL(window: ?*SDL_Window) bool;
pub extern fn SDL_GetWindowSurface_REAL(window: ?*SDL_Window) [*c]SDL_Surface;
pub extern fn SDL_DestroyWindowSurface_REAL(window: ?*SDL_Window) bool;
pub extern fn SDL_DestroyWindow_REAL(window: ?*SDL_Window) void;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_HIDDEN: c_int = 515;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_WINDOW_METAL_VIEW_RESIZED: c_int = 520;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_MAXIMIZED: c_int = 522;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED: c_int = 531;
pub const SDL_EVENT_WINDOW_HDR_STATE_CHANGED: c_int = 538;
pub const SDL_EVENT_MOUSE_MOTION: c_int = 1024;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN: c_int = 1025;
pub const SDL_EVENT_MOUSE_BUTTON_UP: c_int = 1026;
pub const SDL_EVENT_MOUSE_WHEEL: c_int = 1027;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_FINGER_MOTION: c_int = 1794;
pub const SDL_EVENT_FINGER_CANCELED: c_int = 1795;
pub const SDL_EVENT_DROP_FILE: c_int = 4096;
pub const SDL_EVENT_DROP_TEXT: c_int = 4097;
pub const SDL_EVENT_DROP_COMPLETE: c_int = 4099;
pub const SDL_EVENT_DROP_POSITION: c_int = 4100;
pub const SDL_EVENT_PEN_DOWN: c_int = 4866;
pub const SDL_EVENT_PEN_UP: c_int = 4867;
pub const SDL_EVENT_PEN_BUTTON_DOWN: c_int = 4868;
pub const SDL_EVENT_PEN_BUTTON_UP: c_int = 4869;
pub const SDL_EVENT_PEN_MOTION: c_int = 4870;
pub const SDL_EVENT_PEN_AXIS: c_int = 4871;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub const SDL_EventFilter = ?*const fn (userdata: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool;
pub const struct_SDL_GPUDevice = opaque {
};
pub const SDL_GPUDevice = struct_SDL_GPUDevice;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    sampler: ?*SDL_GPUSampler = null,
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_Vertex = extern struct {
    position: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    tex_coord: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
};
pub const SDL_Vertex = struct_SDL_Vertex;
pub const SDL_TEXTUREACCESS_STATIC: c_int = 0;
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
pub const SDL_TEXTUREACCESS_TARGET: c_int = 2;
pub const enum_SDL_TextureAccess = c_uint;
pub const SDL_TextureAccess = enum_SDL_TextureAccess;
pub const SDL_TEXTURE_ADDRESS_INVALID: c_int = -1;
pub const SDL_TEXTURE_ADDRESS_AUTO: c_int = 0;
pub const SDL_TEXTURE_ADDRESS_CLAMP: c_int = 1;
pub const SDL_TEXTURE_ADDRESS_WRAP: c_int = 2;
pub const enum_SDL_TextureAddressMode = c_int;
pub const SDL_TextureAddressMode = enum_SDL_TextureAddressMode;
pub const SDL_LOGICAL_PRESENTATION_DISABLED: c_int = 0;
pub const SDL_LOGICAL_PRESENTATION_STRETCH: c_int = 1;
pub const SDL_LOGICAL_PRESENTATION_LETTERBOX: c_int = 2;
pub const SDL_LOGICAL_PRESENTATION_INTEGER_SCALE: c_int = 4;
pub const enum_SDL_RendererLogicalPresentation = c_uint;
pub const SDL_RendererLogicalPresentation = enum_SDL_RendererLogicalPresentation;
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_RenderViewState = extern struct {
    pixel_w: c_int = 0,
    pixel_h: c_int = 0,
    viewport: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    pixel_viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    clip_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    pixel_clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    clipping_enabled: bool = false,
    scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    logical_presentation_mode: SDL_RendererLogicalPresentation = @import("std").mem.zeroes(SDL_RendererLogicalPresentation),
    logical_w: c_int = 0,
    logical_h: c_int = 0,
    logical_src_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    logical_dst_rect: SDL_FRect = @import("std").mem.zeroes(SDL_FRect),
    logical_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    logical_offset: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    current_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
};
pub const SDL_RenderViewState = struct_SDL_RenderViewState;
pub const struct_SDL_TexturePalette = extern struct {
    refcount: c_int = 0,
    version: Uint32 = 0,
    last_command_generation: Uint32 = 0,
    internal: ?*anyopaque = null,
};
pub const SDL_TexturePalette = struct_SDL_TexturePalette;
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
pub const struct_SDL_Texture = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    refcount: c_int = 0,
    renderer: [*c]SDL_Renderer = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    SDR_white_point: f32 = 0,
    HDR_headroom: f32 = 0,
    access: SDL_TextureAccess = @import("std").mem.zeroes(SDL_TextureAccess),
    blendMode: SDL_BlendMode = 0,
    scaleMode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    view: SDL_RenderViewState = @import("std").mem.zeroes(SDL_RenderViewState),
    public_palette: [*c]SDL_Palette = null,
    palette: [*c]SDL_TexturePalette = null,
    palette_version: Uint32 = 0,
    palette_surface: [*c]SDL_Surface = null,
    native: [*c]SDL_Texture = null,
    yuv: [*c]SDL_SW_YUVTexture = null,
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    locked_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    locked_surface: [*c]SDL_Surface = null,
    last_command_generation: Uint32 = 0,
    props: SDL_PropertiesID = 0,
    internal: ?*anyopaque = null,
    prev: [*c]SDL_Texture = null,
    next: [*c]SDL_Texture = null,
};
pub const SDL_Texture = struct_SDL_Texture;
const struct_unnamed_15 = extern struct {
    first: usize = 0,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
const struct_unnamed_16 = extern struct {
    enabled: bool = false,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const struct_SDL_GPURenderStateUniformBuffer = extern struct {
    slot_index: Uint32 = 0,
    data: ?*anyopaque = null,
    length: Uint32 = 0,
};
pub const SDL_GPURenderStateUniformBuffer = struct_SDL_GPURenderStateUniformBuffer;
pub const struct_SDL_GPURenderState = extern struct {
    renderer: [*c]SDL_Renderer = null,
    last_command_generation: Uint32 = 0,
    fragment_shader: ?*SDL_GPUShader = null,
    num_sampler_bindings: c_int = 0,
    sampler_bindings: [*c]SDL_GPUTextureSamplerBinding = null,
    num_storage_textures: c_int = 0,
    storage_textures: [*c]?*SDL_GPUTexture = null,
    num_storage_buffers: c_int = 0,
    storage_buffers: [*c]?*SDL_GPUBuffer = null,
    num_uniform_buffers: c_int = 0,
    uniform_buffers: [*c]SDL_GPURenderStateUniformBuffer = null,
};
pub const SDL_GPURenderState = struct_SDL_GPURenderState;
const struct_unnamed_17 = extern struct {
    first: usize = 0,
    count: usize = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    blend: SDL_BlendMode = 0,
    texture: [*c]SDL_Texture = null,
    texture_scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    gpu_render_state: [*c]SDL_GPURenderState = null,
};
const struct_unnamed_18 = extern struct {
    first: usize = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
const union_unnamed_14 = extern union {
    viewport: struct_unnamed_15,
    cliprect: struct_unnamed_16,
    draw: struct_unnamed_17,
    color: struct_unnamed_18,
};
pub const struct_SDL_RenderCommand = extern struct {
    command: SDL_RenderCommandType = @import("std").mem.zeroes(SDL_RenderCommandType),
    data: union_unnamed_14 = @import("std").mem.zeroes(union_unnamed_14),
    next: [*c]struct_SDL_RenderCommand = null,
};
pub const SDL_RenderCommand = struct_SDL_RenderCommand;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const struct_SDL_Renderer = extern struct {
    WindowEvent: ?*const fn (renderer: [*c]SDL_Renderer, event: [*c]const SDL_WindowEvent) callconv(.c) void = null,
    GetOutputSize: ?*const fn (renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) callconv(.c) bool = null,
    SupportsBlendMode: ?*const fn (renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool = null,
    CreateTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, create_props: SDL_PropertiesID) callconv(.c) bool = null,
    QueueSetViewport: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand) callconv(.c) bool = null,
    QueueSetDrawColor: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand) callconv(.c) bool = null,
    QueueDrawPoints: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool = null,
    QueueDrawLines: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool = null,
    QueueFillRects: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, rects: [*c]const SDL_FRect, count: c_int) callconv(.c) bool = null,
    QueueCopy: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) callconv(.c) bool = null,
    QueueCopyEx: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, srcquad: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode, scale_x: f32, scale_y: f32) callconv(.c) bool = null,
    QueueGeometry: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int, scale_x: f32, scale_y: f32) callconv(.c) bool = null,
    InvalidateCachedState: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) void = null,
    RunCommandQueue: ?*const fn (renderer: [*c]SDL_Renderer, cmd: [*c]SDL_RenderCommand, vertices: ?*anyopaque, vertsize: usize) callconv(.c) bool = null,
    CreatePalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool = null,
    UpdatePalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette, ncolors: c_int, colors: [*c]SDL_Color) callconv(.c) bool = null,
    DestroyPalette: ?*const fn (renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) void = null,
    ChangeTexturePalette: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool = null,
    UpdateTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool = null,
    UpdateTextureYUV: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool = null,
    UpdateTextureNV: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool = null,
    LockTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool = null,
    UnlockTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void = null,
    SetRenderTarget: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) bool = null,
    RenderReadPixels: ?*const fn (renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) callconv(.c) [*c]SDL_Surface = null,
    RenderPresent: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) bool = null,
    DestroyTexture: ?*const fn (renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture) callconv(.c) void = null,
    DestroyRenderer: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) void = null,
    SetVSync: ?*const fn (renderer: [*c]SDL_Renderer, vsync: c_int) callconv(.c) bool = null,
    GetMetalLayer: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) ?*anyopaque = null,
    GetMetalCommandEncoder: ?*const fn (renderer: [*c]SDL_Renderer) callconv(.c) ?*anyopaque = null,
    AddVulkanRenderSemaphores: ?*const fn (renderer: [*c]SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) callconv(.c) bool = null,
    name: [*c]const u8 = null,
    texture_formats: [*c]SDL_PixelFormat = null,
    num_texture_formats: c_int = 0,
    software: bool = false,
    npot_texture_wrap_unsupported: bool = false,
    window: ?*SDL_Window = null,
    hidden: bool = false,
    wanted_vsync: bool = false,
    simulate_vsync: bool = false,
    simulate_vsync_interval_ns: Uint64 = 0,
    last_present: Uint64 = 0,
    view: [*c]SDL_RenderViewState = null,
    main_view: SDL_RenderViewState = @import("std").mem.zeroes(SDL_RenderViewState),
    dpi_scale: SDL_FPoint = @import("std").mem.zeroes(SDL_FPoint),
    line_method: SDL_RenderLineMethod = @import("std").mem.zeroes(SDL_RenderLineMethod),
    scale_mode: SDL_ScaleMode = @import("std").mem.zeroes(SDL_ScaleMode),
    textures: [*c]SDL_Texture = null,
    target: [*c]SDL_Texture = null,
    target_mutex: ?*SDL_Mutex = null,
    palettes: ?*SDL_HashTable = null,
    current_colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    output_colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    SDR_white_point: f32 = 0,
    HDR_headroom: f32 = 0,
    desired_color_scale: f32 = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    blendMode: SDL_BlendMode = 0,
    texture_address_mode_u: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    texture_address_mode_v: SDL_TextureAddressMode = @import("std").mem.zeroes(SDL_TextureAddressMode),
    gpu_render_state: [*c]SDL_GPURenderState = null,
    render_commands: [*c]SDL_RenderCommand = null,
    render_commands_tail: [*c]SDL_RenderCommand = null,
    render_commands_pool: [*c]SDL_RenderCommand = null,
    render_command_generation: Uint32 = 0,
    last_queued_color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
    last_queued_color_scale: f32 = 0,
    last_queued_viewport: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    last_queued_cliprect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    last_queued_cliprect_enabled: bool = false,
    color_queued: bool = false,
    viewport_queued: bool = false,
    cliprect_queued: bool = false,
    vertex_data: ?*anyopaque = null,
    vertex_data_used: usize = 0,
    vertex_data_allocation: usize = 0,
    transparent_window: bool = false,
    shape_surface: [*c]SDL_Surface = null,
    shape_texture: [*c]SDL_Texture = null,
    props: SDL_PropertiesID = 0,
    debug_char_texture_atlas: [*c]SDL_Texture = null,
    destroyed: bool = false,
    internal: ?*anyopaque = null,
    next: [*c]SDL_Renderer = null,
};
pub const struct_SDL_GPURenderStateCreateInfo = extern struct {
    fragment_shader: ?*SDL_GPUShader = null,
    num_sampler_bindings: Sint32 = 0,
    sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding = null,
    num_storage_textures: Sint32 = 0,
    storage_textures: [*c]const ?*SDL_GPUTexture = null,
    num_storage_buffers: Sint32 = 0,
    storage_buffers: [*c]const ?*SDL_GPUBuffer = null,
    props: SDL_PropertiesID = 0,
};
pub const SDL_GPURenderStateCreateInfo = struct_SDL_GPURenderStateCreateInfo;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_DelayPrecise_REAL(ns: Uint64) void;
pub const SDL_OBJECT_TYPE_RENDERER: c_int = 2;
pub const SDL_OBJECT_TYPE_TEXTURE: c_int = 3;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern var SDL_object_validation: bool;
pub inline fn SDL_ObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(object != null)) {
        return @"false" != 0;
    }
    if (!SDL_object_validation) {
        return @"true" != 0;
    }
    return SDL_FindObject(object, @"type");
}
pub extern fn SDL_GetPersistentString(string: [*c]const u8) [*c]const u8;
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_RemoveFromHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque) bool;
pub extern fn SDL_HashTableEmpty(table: ?*SDL_HashTable) bool;
pub extern fn SDL_HashPointer(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchPointer(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_DestroyHashValue(unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void;
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
pub extern fn SDL_GetDefaultSDRWhitePoint(colorspace: SDL_Colorspace) f32;
pub extern fn SDL_GetSurfaceSDRWhitePoint(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32;
pub extern fn SDL_GetDefaultHDRHeadroom(colorspace: SDL_Colorspace) f32;
pub extern fn SDL_GetSurfaceHDRHeadroom(surface: [*c]SDL_Surface, colorspace: SDL_Colorspace) f32;
pub extern fn SDL_CreateSurfaceZeroed(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_SW_CreateYUVTexture(format: SDL_PixelFormat, colorspace: SDL_Colorspace, w: c_int, h: c_int) [*c]SDL_SW_YUVTexture;
pub extern fn SDL_SW_UpdateYUVTexture(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
pub extern fn SDL_SW_UpdateYUVTexturePlanar(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) bool;
pub extern fn SDL_SW_UpdateNVTexturePlanar(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) bool;
pub extern fn SDL_SW_LockYUVTexture(swdata: [*c]SDL_SW_YUVTexture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) bool;
pub extern fn SDL_SW_CopyYUVToRGB(swdata: [*c]SDL_SW_YUVTexture, srcrect: [*c]const SDL_Rect, target_format: SDL_PixelFormat, w: c_int, h: c_int, pixels: ?*anyopaque, pitch: c_int) bool;
pub extern fn SDL_SW_DestroyYUVTexture(swdata: [*c]SDL_SW_YUVTexture) void;
pub const struct_SDL_RenderDriver = extern struct {
    CreateRenderer: ?*const fn (renderer: [*c]SDL_Renderer, window: ?*SDL_Window, props: SDL_PropertiesID) callconv(.c) bool = null,
    name: [*c]const u8 = null,
};
pub const SDL_RenderDriver = struct_SDL_RenderDriver;
pub const SDL_RENDERCMD_NO_OP: c_int = 0;
pub const SDL_RENDERCMD_SETVIEWPORT: c_int = 1;
pub const SDL_RENDERCMD_SETCLIPRECT: c_int = 2;
pub const SDL_RENDERCMD_SETDRAWCOLOR: c_int = 3;
pub const SDL_RENDERCMD_CLEAR: c_int = 4;
pub const SDL_RENDERCMD_DRAW_POINTS: c_int = 5;
pub const SDL_RENDERCMD_DRAW_LINES: c_int = 6;
pub const SDL_RENDERCMD_FILL_RECTS: c_int = 7;
pub const SDL_RENDERCMD_COPY: c_int = 8;
pub const SDL_RENDERCMD_COPY_EX: c_int = 9;
pub const SDL_RENDERCMD_GEOMETRY: c_int = 10;
pub const SDL_RenderCommandType = c_uint;
pub const SDL_RENDERLINEMETHOD_POINTS: c_int = 0;
pub const SDL_RENDERLINEMETHOD_LINES: c_int = 1;
pub const SDL_RENDERLINEMETHOD_GEOMETRY: c_int = 2;
pub const SDL_RenderLineMethod = c_uint;
pub extern var GL_RenderDriver: SDL_RenderDriver;
pub extern var GLES_RenderDriver: SDL_RenderDriver;
pub extern var GLES2_RenderDriver: SDL_RenderDriver;
pub extern var VULKAN_RenderDriver: SDL_RenderDriver;
pub extern var SW_RenderDriver: SDL_RenderDriver;
pub extern var GPU_RenderDriver: SDL_RenderDriver;
pub const SDL_RenderDebugTextFontData: [1520]Uint8 = [1520]Uint8{
    24,
    60,
    60,
    24,
    24,
    0,
    24,
    0,
    54,
    54,
    0,
    0,
    0,
    0,
    0,
    0,
    54,
    54,
    127,
    54,
    127,
    54,
    54,
    0,
    12,
    62,
    3,
    30,
    48,
    31,
    12,
    0,
    0,
    99,
    51,
    24,
    12,
    102,
    99,
    0,
    28,
    54,
    28,
    110,
    59,
    51,
    110,
    0,
    6,
    6,
    3,
    0,
    0,
    0,
    0,
    0,
    24,
    12,
    6,
    6,
    6,
    12,
    24,
    0,
    6,
    12,
    24,
    24,
    24,
    12,
    6,
    0,
    0,
    102,
    60,
    255,
    60,
    102,
    0,
    0,
    0,
    12,
    12,
    63,
    12,
    12,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    12,
    12,
    6,
    0,
    0,
    0,
    63,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    12,
    12,
    0,
    96,
    48,
    24,
    12,
    6,
    3,
    1,
    0,
    62,
    99,
    115,
    123,
    111,
    103,
    62,
    0,
    12,
    14,
    12,
    12,
    12,
    12,
    63,
    0,
    30,
    51,
    48,
    28,
    6,
    51,
    63,
    0,
    30,
    51,
    48,
    28,
    48,
    51,
    30,
    0,
    56,
    60,
    54,
    51,
    127,
    48,
    120,
    0,
    63,
    3,
    31,
    48,
    48,
    51,
    30,
    0,
    28,
    6,
    3,
    31,
    51,
    51,
    30,
    0,
    63,
    51,
    48,
    24,
    12,
    12,
    12,
    0,
    30,
    51,
    51,
    30,
    51,
    51,
    30,
    0,
    30,
    51,
    51,
    62,
    48,
    24,
    14,
    0,
    0,
    12,
    12,
    0,
    0,
    12,
    12,
    0,
    0,
    12,
    12,
    0,
    0,
    12,
    12,
    6,
    24,
    12,
    6,
    3,
    6,
    12,
    24,
    0,
    0,
    0,
    63,
    0,
    0,
    63,
    0,
    0,
    6,
    12,
    24,
    48,
    24,
    12,
    6,
    0,
    30,
    51,
    48,
    24,
    12,
    0,
    12,
    0,
    62,
    99,
    123,
    123,
    123,
    3,
    30,
    0,
    12,
    30,
    51,
    51,
    63,
    51,
    51,
    0,
    63,
    102,
    102,
    62,
    102,
    102,
    63,
    0,
    60,
    102,
    3,
    3,
    3,
    102,
    60,
    0,
    31,
    54,
    102,
    102,
    102,
    54,
    31,
    0,
    127,
    70,
    22,
    30,
    22,
    70,
    127,
    0,
    127,
    70,
    22,
    30,
    22,
    6,
    15,
    0,
    60,
    102,
    3,
    3,
    115,
    102,
    124,
    0,
    51,
    51,
    51,
    63,
    51,
    51,
    51,
    0,
    30,
    12,
    12,
    12,
    12,
    12,
    30,
    0,
    120,
    48,
    48,
    48,
    51,
    51,
    30,
    0,
    103,
    102,
    54,
    30,
    54,
    102,
    103,
    0,
    15,
    6,
    6,
    6,
    70,
    102,
    127,
    0,
    99,
    119,
    127,
    127,
    107,
    99,
    99,
    0,
    99,
    103,
    111,
    123,
    115,
    99,
    99,
    0,
    28,
    54,
    99,
    99,
    99,
    54,
    28,
    0,
    63,
    102,
    102,
    62,
    6,
    6,
    15,
    0,
    30,
    51,
    51,
    51,
    59,
    30,
    56,
    0,
    63,
    102,
    102,
    62,
    54,
    102,
    103,
    0,
    30,
    51,
    7,
    14,
    56,
    51,
    30,
    0,
    63,
    45,
    12,
    12,
    12,
    12,
    30,
    0,
    51,
    51,
    51,
    51,
    51,
    51,
    63,
    0,
    51,
    51,
    51,
    51,
    51,
    30,
    12,
    0,
    99,
    99,
    99,
    107,
    127,
    119,
    99,
    0,
    99,
    99,
    54,
    28,
    28,
    54,
    99,
    0,
    51,
    51,
    51,
    30,
    12,
    12,
    30,
    0,
    127,
    99,
    49,
    24,
    76,
    102,
    127,
    0,
    30,
    6,
    6,
    6,
    6,
    6,
    30,
    0,
    3,
    6,
    12,
    24,
    48,
    96,
    64,
    0,
    30,
    24,
    24,
    24,
    24,
    24,
    30,
    0,
    8,
    28,
    54,
    99,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    255,
    12,
    12,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    30,
    48,
    62,
    51,
    110,
    0,
    7,
    6,
    6,
    62,
    102,
    102,
    59,
    0,
    0,
    0,
    30,
    51,
    3,
    51,
    30,
    0,
    56,
    48,
    48,
    62,
    51,
    51,
    110,
    0,
    0,
    0,
    30,
    51,
    63,
    3,
    30,
    0,
    28,
    54,
    6,
    15,
    6,
    6,
    15,
    0,
    0,
    0,
    110,
    51,
    51,
    62,
    48,
    31,
    7,
    6,
    54,
    110,
    102,
    102,
    103,
    0,
    12,
    0,
    14,
    12,
    12,
    12,
    30,
    0,
    48,
    0,
    48,
    48,
    48,
    51,
    51,
    30,
    7,
    6,
    102,
    54,
    30,
    54,
    103,
    0,
    14,
    12,
    12,
    12,
    12,
    12,
    30,
    0,
    0,
    0,
    51,
    127,
    127,
    107,
    99,
    0,
    0,
    0,
    31,
    51,
    51,
    51,
    51,
    0,
    0,
    0,
    30,
    51,
    51,
    51,
    30,
    0,
    0,
    0,
    59,
    102,
    102,
    62,
    6,
    15,
    0,
    0,
    110,
    51,
    51,
    62,
    48,
    120,
    0,
    0,
    59,
    110,
    102,
    6,
    15,
    0,
    0,
    0,
    62,
    3,
    30,
    48,
    31,
    0,
    8,
    12,
    62,
    12,
    12,
    44,
    24,
    0,
    0,
    0,
    51,
    51,
    51,
    51,
    110,
    0,
    0,
    0,
    51,
    51,
    51,
    30,
    12,
    0,
    0,
    0,
    99,
    107,
    127,
    127,
    54,
    0,
    0,
    0,
    99,
    54,
    28,
    54,
    99,
    0,
    0,
    0,
    51,
    51,
    51,
    62,
    48,
    31,
    0,
    0,
    63,
    25,
    12,
    38,
    63,
    0,
    56,
    12,
    12,
    7,
    12,
    12,
    56,
    0,
    24,
    24,
    24,
    0,
    24,
    24,
    24,
    0,
    7,
    12,
    12,
    56,
    12,
    12,
    7,
    0,
    110,
    59,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    24,
    0,
    24,
    24,
    24,
    24,
    0,
    24,
    24,
    126,
    3,
    3,
    126,
    24,
    24,
    28,
    54,
    38,
    15,
    6,
    103,
    63,
    0,
    0,
    0,
    99,
    62,
    54,
    62,
    99,
    0,
    51,
    51,
    30,
    63,
    12,
    63,
    12,
    12,
    24,
    24,
    24,
    0,
    24,
    24,
    24,
    0,
    124,
    198,
    28,
    54,
    54,
    28,
    51,
    30,
    51,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    60,
    66,
    153,
    133,
    133,
    153,
    66,
    60,
    60,
    54,
    54,
    124,
    0,
    0,
    0,
    0,
    0,
    204,
    102,
    51,
    102,
    204,
    0,
    0,
    0,
    0,
    0,
    63,
    48,
    48,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    60,
    66,
    157,
    165,
    157,
    165,
    66,
    60,
    126,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    28,
    54,
    54,
    28,
    0,
    0,
    0,
    0,
    24,
    24,
    126,
    24,
    24,
    0,
    126,
    0,
    28,
    48,
    24,
    12,
    60,
    0,
    0,
    0,
    28,
    48,
    24,
    48,
    28,
    0,
    0,
    0,
    24,
    12,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    102,
    102,
    102,
    62,
    6,
    3,
    254,
    219,
    219,
    222,
    216,
    216,
    216,
    0,
    0,
    0,
    0,
    24,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    48,
    30,
    8,
    12,
    8,
    28,
    0,
    0,
    0,
    0,
    28,
    54,
    54,
    28,
    0,
    0,
    0,
    0,
    0,
    51,
    102,
    204,
    102,
    51,
    0,
    0,
    195,
    99,
    51,
    189,
    236,
    246,
    243,
    3,
    195,
    99,
    51,
    123,
    204,
    102,
    51,
    240,
    3,
    196,
    99,
    180,
    219,
    172,
    230,
    128,
    12,
    0,
    12,
    6,
    3,
    51,
    30,
    0,
    7,
    0,
    28,
    54,
    99,
    127,
    99,
    0,
    112,
    0,
    28,
    54,
    99,
    127,
    99,
    0,
    28,
    54,
    0,
    62,
    99,
    127,
    99,
    0,
    110,
    59,
    0,
    62,
    99,
    127,
    99,
    0,
    99,
    28,
    54,
    99,
    127,
    99,
    99,
    0,
    12,
    12,
    0,
    30,
    51,
    63,
    51,
    0,
    124,
    54,
    51,
    127,
    51,
    51,
    115,
    0,
    30,
    51,
    3,
    51,
    30,
    24,
    48,
    30,
    7,
    0,
    63,
    6,
    30,
    6,
    63,
    0,
    56,
    0,
    63,
    6,
    30,
    6,
    63,
    0,
    12,
    18,
    63,
    6,
    30,
    6,
    63,
    0,
    54,
    0,
    63,
    6,
    30,
    6,
    63,
    0,
    7,
    0,
    30,
    12,
    12,
    12,
    30,
    0,
    56,
    0,
    30,
    12,
    12,
    12,
    30,
    0,
    12,
    18,
    0,
    30,
    12,
    12,
    30,
    0,
    51,
    0,
    30,
    12,
    12,
    12,
    30,
    0,
    63,
    102,
    111,
    111,
    102,
    102,
    63,
    0,
    63,
    0,
    51,
    55,
    63,
    59,
    51,
    0,
    14,
    0,
    24,
    60,
    102,
    60,
    24,
    0,
    112,
    0,
    24,
    60,
    102,
    60,
    24,
    0,
    60,
    102,
    24,
    60,
    102,
    60,
    24,
    0,
    110,
    59,
    0,
    62,
    99,
    99,
    62,
    0,
    195,
    24,
    60,
    102,
    102,
    60,
    24,
    0,
    0,
    54,
    28,
    8,
    28,
    54,
    0,
    0,
    92,
    54,
    115,
    123,
    111,
    54,
    29,
    0,
    14,
    0,
    102,
    102,
    102,
    102,
    60,
    0,
    112,
    0,
    102,
    102,
    102,
    102,
    60,
    0,
    60,
    102,
    0,
    102,
    102,
    102,
    60,
    0,
    51,
    0,
    51,
    51,
    51,
    51,
    30,
    0,
    112,
    0,
    102,
    102,
    60,
    24,
    24,
    0,
    15,
    6,
    62,
    102,
    102,
    62,
    6,
    15,
    0,
    30,
    51,
    31,
    51,
    31,
    3,
    3,
    7,
    0,
    30,
    48,
    62,
    51,
    126,
    0,
    56,
    0,
    30,
    48,
    62,
    51,
    126,
    0,
    126,
    195,
    60,
    96,
    124,
    102,
    252,
    0,
    110,
    59,
    30,
    48,
    62,
    51,
    126,
    0,
    51,
    0,
    30,
    48,
    62,
    51,
    126,
    0,
    12,
    12,
    30,
    48,
    62,
    51,
    126,
    0,
    0,
    0,
    254,
    48,
    254,
    51,
    254,
    0,
    0,
    0,
    30,
    3,
    3,
    30,
    48,
    28,
    7,
    0,
    30,
    51,
    63,
    3,
    30,
    0,
    56,
    0,
    30,
    51,
    63,
    3,
    30,
    0,
    126,
    195,
    60,
    102,
    126,
    6,
    60,
    0,
    51,
    0,
    30,
    51,
    63,
    3,
    30,
    0,
    7,
    0,
    14,
    12,
    12,
    12,
    30,
    0,
    28,
    0,
    14,
    12,
    12,
    12,
    30,
    0,
    62,
    99,
    28,
    24,
    24,
    24,
    60,
    0,
    51,
    0,
    14,
    12,
    12,
    12,
    30,
    0,
    27,
    14,
    27,
    48,
    62,
    51,
    30,
    0,
    0,
    31,
    0,
    31,
    51,
    51,
    51,
    0,
    0,
    7,
    0,
    30,
    51,
    51,
    30,
    0,
    0,
    56,
    0,
    30,
    51,
    51,
    30,
    0,
    30,
    51,
    0,
    30,
    51,
    51,
    30,
    0,
    110,
    59,
    0,
    30,
    51,
    51,
    30,
    0,
    0,
    51,
    0,
    30,
    51,
    51,
    30,
    0,
    24,
    24,
    0,
    126,
    0,
    24,
    24,
    0,
    0,
    96,
    60,
    118,
    126,
    110,
    60,
    6,
    0,
    7,
    0,
    51,
    51,
    51,
    126,
    0,
    0,
    56,
    0,
    51,
    51,
    51,
    126,
    0,
    30,
    51,
    0,
    51,
    51,
    51,
    126,
    0,
    0,
    51,
    0,
    51,
    51,
    51,
    126,
    0,
    0,
    56,
    0,
    51,
    51,
    62,
    48,
    31,
    0,
    0,
    6,
    62,
    102,
    62,
    6,
    0,
    0,
    51,
    0,
    51,
    51,
    62,
    48,
    31,
    85,
    170,
    85,
    170,
    85,
    170,
    85,
    170,
};
comptime {
    if (!((@sizeOf(@TypeOf(SDL_RenderDebugTextFontData)) / @sizeOf(@TypeOf(SDL_RenderDebugTextFontData[@as(c_int, 0)]))) == @as(c_ulong, @bitCast(@as(c_long, SDL_DEBUG_FONT_NUM_GLYPHS * @as(c_int, 8)))))) @compileError("static assertion failed \"SDL_arraysize(SDL_RenderDebugTextFontData) == SDL_DEBUG_FONT_NUM_GLYPHS * 8\"");
}
pub extern fn SW_UpdateRendererSurface(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface) bool;
pub extern fn SW_CreateRendererForSurface(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface, create_props: SDL_PropertiesID) bool;
pub const SDL_WINDOW_EVENT_WATCH_NORMAL: c_int = 1;
pub const SDL_WindowEventWatchPriority = c_uint;
pub extern fn SDL_AddWindowEventWatch(priority: SDL_WindowEventWatchPriority, filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_RemoveWindowEventWatch(priority: SDL_WindowEventWatchPriority, filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_GetDefaultColorspaceForFormat(pixel_format: SDL_PixelFormat) SDL_Colorspace;
pub extern fn SDL_sRGBtoLinear(v: f32) f32;
pub extern fn SDL_ConvertColor709to2020(fR: [*c]f32, fG: [*c]f32, fB: [*c]f32) void;
pub extern fn SDL_DetectPalette(pal: [*c]const SDL_Palette, is_opaque: [*c]bool, has_alpha_channel: [*c]bool) void;
pub const struct_SDL_VideoDevice = opaque {
};
pub extern fn SDL_SetWindowTextureVSync(_this: ?*struct_SDL_VideoDevice, window: ?*SDL_Window, vsync: c_int) bool;
pub extern fn SDL_AddWindowRenderer(window: ?*SDL_Window, renderer: [*c]SDL_Renderer) bool;
pub extern fn SDL_RemoveWindowRenderer(window: ?*SDL_Window, renderer: [*c]SDL_Renderer) void;
pub var render_drivers: [7][*c]const SDL_RenderDriver = [7][*c]const SDL_RenderDriver{
    &GL_RenderDriver,
    &GLES2_RenderDriver,
    &GLES_RenderDriver,
    &VULKAN_RenderDriver,
    &GPU_RenderDriver,
    &SW_RenderDriver,
    null,
};
pub var SDL_renderers: [*c]SDL_Renderer = null;
pub const rect_index_order: [6]c_int = [6]c_int{
    0,
    1,
    2,
    0,
    2,
    3,
};
pub export fn SDL_QuitRender() void {
    @setEvalBranchQuota(100000);
    while (SDL_renderers != null) {
        SDL_DestroyRenderer_REAL(SDL_renderers);
    }
}
pub export fn SDL_AddSupportedTextureFormat(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat) bool {
    @setEvalBranchQuota(100000);
    var texture_formats: [*c]SDL_PixelFormat = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(renderer.*.texture_formats)), @as(c_ulong, @bitCast(@as(c_long, renderer.*.num_texture_formats + @as(c_int, 2)))) *% @sizeOf(SDL_PixelFormat))));
    _ = &texture_formats;
    if (!(texture_formats != null)) {
        return @"false" != 0;
    }
    texture_formats[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &renderer.*.num_texture_formats;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = format;
    texture_formats[@bitCast(@as(isize, @intCast(renderer.*.num_texture_formats)))] = SDL_PIXELFORMAT_UNKNOWN;
    renderer.*.texture_formats = texture_formats;
    _ = SDL_SetPointerProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.texture_formats", @ptrCast(@alignCast(texture_formats)));
    return @"true" != 0;
}
pub export fn SDL_SetupRendererColorspace(renderer: [*c]SDL_Renderer, props: SDL_PropertiesID) void {
    @setEvalBranchQuota(100000);
    renderer.*.output_colorspace = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.renderer.create.output_colorspace", SDL_COLORSPACE_SRGB))));
    renderer.*.current_colorspace = renderer.*.output_colorspace;
}
pub export fn SDL_ConvertToLinear(renderer: [*c]SDL_Renderer, color: [*c]SDL_FColor) void {
    @setEvalBranchQuota(100000);
    color.*.r = SDL_sRGBtoLinear(color.*.r);
    color.*.g = SDL_sRGBtoLinear(color.*.g);
    color.*.b = SDL_sRGBtoLinear(color.*.b);
    if (renderer.*.current_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10)) {
        SDL_ConvertColor709to2020(&color.*.r, &color.*.g, &color.*.b);
    }
}
pub fn DebugLogRenderCommands(_: [*c]const SDL_RenderCommand) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn FlushRenderCommands(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "FlushRenderCommands".*;
    };
    _ = &static_local___func__;
    var result: bool = undefined;
    _ = &result;
    while (true) {
        while (!(@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.render_commands))) == @as(?*anyopaque, null)) == @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.render_commands_tail))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(renderer->render_commands == ((void*)0)) == (renderer->render_commands_tail == ((void*)0))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 303);
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
    if (!(renderer.*.render_commands != null)) {
        while (true) {
            while (!(renderer.*.vertex_data_used == @as(usize, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "renderer->vertex_data_used == 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 306);
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
        return @"true" != 0;
    }
    DebugLogRenderCommands(renderer.*.render_commands);
    result = renderer.*.RunCommandQueue.?(renderer, renderer.*.render_commands, renderer.*.vertex_data, renderer.*.vertex_data_used);
    if (renderer.*.render_commands_tail != null) {
        renderer.*.render_commands_tail.*.next = renderer.*.render_commands_pool;
        renderer.*.render_commands_pool = renderer.*.render_commands;
        renderer.*.render_commands_tail = null;
        renderer.*.render_commands = null;
    }
    renderer.*.vertex_data_used = 0;
    renderer.*.render_command_generation +%= 1;
    renderer.*.color_queued = @"false" != 0;
    renderer.*.viewport_queued = @"false" != 0;
    renderer.*.cliprect_queued = @"false" != 0;
    return result;
}
pub fn FlushRenderCommandsIfTextureNeeded(texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = texture.*.renderer;
    _ = &renderer;
    if (texture.*.last_command_generation == renderer.*.render_command_generation) {
        return FlushRenderCommands(renderer);
    }
    return @"true" != 0;
}
pub fn FlushRenderCommandsIfPaletteNeeded(renderer: [*c]SDL_Renderer, palette: [*c]SDL_TexturePalette) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (palette.*.last_command_generation == renderer.*.render_command_generation) {
        return FlushRenderCommands(renderer);
    }
    return @"true" != 0;
}
pub fn FlushRenderCommandsIfGPURenderStateNeeded(state: [*c]SDL_GPURenderState) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = state.*.renderer;
    _ = &renderer;
    if (state.*.last_command_generation == renderer.*.render_command_generation) {
        return FlushRenderCommands(renderer);
    }
    return @"true" != 0;
}
pub export fn SDL_FlushRenderer_REAL(renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    if (!FlushRenderCommands(renderer)) {
        return @"false" != 0;
    }
    renderer.*.InvalidateCachedState.?(renderer);
    return @"true" != 0;
}
pub export fn SDL_AllocateRenderVertices(renderer: [*c]SDL_Renderer, numbytes: usize, arg_alignment: usize, offset: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var alignment = arg_alignment;
    _ = &alignment;
    const needed: usize = (renderer.*.vertex_data_used +% numbytes) +% alignment;
    _ = &needed;
    const current_offset: usize = renderer.*.vertex_data_used;
    _ = &current_offset;
    const aligner: usize = if ((alignment != 0) and (@as(usize, @bitCast(@as(c_long, @intFromBool((current_offset & (alignment -% @as(usize, 1))) != @as(usize, 0))))) != 0)) alignment -% (current_offset & (alignment -% @as(usize, 1))) else @as(usize, 0);
    _ = &aligner;
    const aligned: usize = current_offset +% aligner;
    _ = &aligned;
    if (renderer.*.vertex_data_allocation < needed) {
        const current_allocation: usize = if (renderer.*.vertex_data != null) renderer.*.vertex_data_allocation else @as(usize, 1024);
        _ = &current_allocation;
        var newsize: usize = current_allocation *% @as(usize, 2);
        _ = &newsize;
        var ptr: ?*anyopaque = undefined;
        _ = &ptr;
        while (newsize < needed) {
            newsize *%= 2;
        }
        ptr = SDL_realloc_REAL(renderer.*.vertex_data, newsize);
        if (!(ptr != null)) {
            return null;
        }
        renderer.*.vertex_data = ptr;
        renderer.*.vertex_data_allocation = newsize;
    }
    if (offset != null) {
        offset.* = aligned;
    }
    renderer.*.vertex_data_used +%= aligner +% numbytes;
    return @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(renderer.*.vertex_data))) + aligned));
}
pub fn AllocateRenderCommand(renderer: [*c]SDL_Renderer) callconv(.c) [*c]SDL_RenderCommand {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "AllocateRenderCommand".*;
    };
    _ = &static_local___func__;
    var result: [*c]SDL_RenderCommand = null;
    _ = &result;
    result = renderer.*.render_commands_pool;
    if (result != null) {
        renderer.*.render_commands_pool = result.*.next;
        result.*.next = null;
    } else {
        result = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(result.*)))));
        if (!(result != null)) {
            return null;
        }
    }
    while (true) {
        while (!(@intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.render_commands))) == @as(?*anyopaque, null)) == @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.render_commands_tail))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(renderer->render_commands == ((void*)0)) == (renderer->render_commands_tail == ((void*)0))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 422);
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
    if (renderer.*.render_commands_tail != null) {
        renderer.*.render_commands_tail.*.next = result;
    } else {
        renderer.*.render_commands = result;
    }
    renderer.*.render_commands_tail = result;
    return result;
}
pub fn UpdatePixelViewport(_: [*c]SDL_Renderer, view: [*c]SDL_RenderViewState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    view.*.pixel_viewport.x = @intFromFloat(SDL_floorf_REAL((view.*.viewport.x * view.*.current_scale.x) + view.*.logical_offset.x));
    view.*.pixel_viewport.y = @intFromFloat(SDL_floorf_REAL((view.*.viewport.y * view.*.current_scale.y) + view.*.logical_offset.y));
    if (view.*.viewport.w >= @as(f32, @floatFromInt(@as(c_int, 0)))) {
        view.*.pixel_viewport.w = @intFromFloat(SDL_ceilf_REAL(view.*.viewport.w * view.*.current_scale.x));
    } else {
        view.*.pixel_viewport.w = view.*.pixel_w;
    }
    if (view.*.viewport.h >= @as(f32, @floatFromInt(@as(c_int, 0)))) {
        view.*.pixel_viewport.h = @intFromFloat(SDL_ceilf_REAL(view.*.viewport.h * view.*.current_scale.y));
    } else {
        view.*.pixel_viewport.h = view.*.pixel_h;
    }
}
pub fn QueueCmdSetViewport(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    var viewport: SDL_Rect = renderer.*.view.*.pixel_viewport;
    _ = &viewport;
    if (!renderer.*.viewport_queued or (SDL_memcmp_REAL(@ptrCast(@alignCast(&viewport)), @ptrCast(@alignCast(&renderer.*.last_queued_viewport)), @sizeOf(@TypeOf(viewport))) != @as(c_int, 0))) {
        var cmd: [*c]SDL_RenderCommand = AllocateRenderCommand(renderer);
        _ = &cmd;
        if (cmd != null) {
            cmd.*.command = SDL_RENDERCMD_SETVIEWPORT;
            cmd.*.data.viewport.first = 0;
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&cmd.*.data.viewport.rect).*)) == @sizeOf(@TypeOf((&viewport).*)))) @compileError("static assertion failed \"sizeof (*(&cmd->data.viewport.rect)) == sizeof (*( &viewport))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&cmd.*.data.viewport.rect)), @ptrCast(@alignCast(&viewport)), @sizeOf(@TypeOf((&viewport).*)));
            result = renderer.*.QueueSetViewport.?(renderer, cmd);
            if (!result) {
                cmd.*.command = SDL_RENDERCMD_NO_OP;
            } else {
                {
                    comptime {
                        if (!(@sizeOf(@TypeOf((&renderer.*.last_queued_viewport).*)) == @sizeOf(@TypeOf((&viewport).*)))) @compileError("static assertion failed \"sizeof (*(&renderer->last_queued_viewport)) == sizeof (*( &viewport))\"");
                    }
                }
                _ = memcpy(@ptrCast(@alignCast(&renderer.*.last_queued_viewport)), @ptrCast(@alignCast(&viewport)), @sizeOf(@TypeOf((&viewport).*)));
                renderer.*.viewport_queued = @"true" != 0;
            }
        } else {
            result = @"false" != 0;
        }
    }
    return result;
}
pub fn UpdatePixelClipRect(_: [*c]SDL_Renderer, view: [*c]SDL_RenderViewState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    view.*.pixel_clip_rect.x = @intFromFloat(SDL_floorf_REAL(view.*.clip_rect.x * scale_x));
    view.*.pixel_clip_rect.y = @intFromFloat(SDL_floorf_REAL(view.*.clip_rect.y * scale_y));
    view.*.pixel_clip_rect.w = @intFromFloat(SDL_ceilf_REAL(view.*.clip_rect.w * scale_x));
    view.*.pixel_clip_rect.h = @intFromFloat(SDL_ceilf_REAL(view.*.clip_rect.h * scale_y));
}
pub fn QueueCmdSetClipRect(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    var clip_rect: SDL_Rect = view.*.pixel_clip_rect;
    _ = &clip_rect;
    if ((!renderer.*.cliprect_queued or (@as(c_int, @intFromBool(view.*.clipping_enabled)) != @as(c_int, @intFromBool(renderer.*.last_queued_cliprect_enabled)))) or (SDL_memcmp_REAL(@ptrCast(@alignCast(&clip_rect)), @ptrCast(@alignCast(&renderer.*.last_queued_cliprect)), @sizeOf(@TypeOf(clip_rect))) != @as(c_int, 0))) {
        var cmd: [*c]SDL_RenderCommand = AllocateRenderCommand(renderer);
        _ = &cmd;
        if (cmd != null) {
            cmd.*.command = SDL_RENDERCMD_SETCLIPRECT;
            cmd.*.data.cliprect.enabled = view.*.clipping_enabled;
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&cmd.*.data.cliprect.rect).*)) == @sizeOf(@TypeOf((&clip_rect).*)))) @compileError("static assertion failed \"sizeof (*(&cmd->data.cliprect.rect)) == sizeof (*( &clip_rect))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&cmd.*.data.cliprect.rect)), @ptrCast(@alignCast(&clip_rect)), @sizeOf(@TypeOf((&clip_rect).*)));
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&renderer.*.last_queued_cliprect).*)) == @sizeOf(@TypeOf((&clip_rect).*)))) @compileError("static assertion failed \"sizeof (*(&renderer->last_queued_cliprect)) == sizeof (*( &clip_rect))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&renderer.*.last_queued_cliprect)), @ptrCast(@alignCast(&clip_rect)), @sizeOf(@TypeOf((&clip_rect).*)));
            renderer.*.last_queued_cliprect_enabled = view.*.clipping_enabled;
            renderer.*.cliprect_queued = @"true" != 0;
        } else {
            result = @"false" != 0;
        }
    }
    return result;
}
pub fn QueueCmdSetDrawColor(renderer: [*c]SDL_Renderer, color: [*c]SDL_FColor) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if ((((!renderer.*.color_queued or (color.*.r != renderer.*.last_queued_color.r)) or (color.*.g != renderer.*.last_queued_color.g)) or (color.*.b != renderer.*.last_queued_color.b)) or (color.*.a != renderer.*.last_queued_color.a)) {
        var cmd: [*c]SDL_RenderCommand = AllocateRenderCommand(renderer);
        _ = &cmd;
        result = @"false" != 0;
        if (cmd != null) {
            cmd.*.command = SDL_RENDERCMD_SETDRAWCOLOR;
            cmd.*.data.color.first = 0;
            cmd.*.data.color.color_scale = renderer.*.color_scale;
            cmd.*.data.color.color = color.*;
            result = renderer.*.QueueSetDrawColor.?(renderer, cmd);
            if (!result) {
                cmd.*.command = SDL_RENDERCMD_NO_OP;
            } else {
                renderer.*.last_queued_color = color.*;
                renderer.*.color_queued = @"true" != 0;
            }
        }
    }
    return result;
}
pub fn QueueCmdClear(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd: [*c]SDL_RenderCommand = AllocateRenderCommand(renderer);
    _ = &cmd;
    if (!(cmd != null)) {
        return @"false" != 0;
    }
    cmd.*.command = SDL_RENDERCMD_CLEAR;
    cmd.*.data.color.first = 0;
    cmd.*.data.color.color_scale = renderer.*.color_scale;
    cmd.*.data.color.color = renderer.*.color;
    return @"true" != 0;
}
pub fn PrepQueueCmdDraw(renderer: [*c]SDL_Renderer, cmdtype: SDL_RenderCommandType, texture: [*c]SDL_Texture) callconv(.c) [*c]SDL_RenderCommand {
    @setEvalBranchQuota(100000);
    _ = &cmdtype;
    var cmd: [*c]SDL_RenderCommand = null;
    _ = &cmd;
    var result: bool = @"true" != 0;
    _ = &result;
    var color: [*c]SDL_FColor = undefined;
    _ = &color;
    var blendMode: SDL_BlendMode = undefined;
    _ = &blendMode;
    if (texture != null) {
        color = &texture.*.color;
        blendMode = texture.*.blendMode;
    } else {
        color = &renderer.*.color;
        blendMode = renderer.*.blendMode;
    }
    if (cmdtype != @as(SDL_RenderCommandType, SDL_RENDERCMD_GEOMETRY)) {
        result = QueueCmdSetDrawColor(renderer, color);
    }
    if (result and !renderer.*.viewport_queued) {
        result = QueueCmdSetViewport(renderer);
    }
    if (result and !renderer.*.cliprect_queued) {
        result = QueueCmdSetClipRect(renderer);
    }
    if (result) {
        cmd = AllocateRenderCommand(renderer);
        if (cmd != null) {
            cmd.*.command = cmdtype;
            cmd.*.data.draw.first = 0;
            cmd.*.data.draw.count = 0;
            cmd.*.data.draw.color_scale = renderer.*.color_scale;
            cmd.*.data.draw.color = color.*;
            cmd.*.data.draw.blend = blendMode;
            cmd.*.data.draw.texture = texture;
            if (texture != null) {
                cmd.*.data.draw.texture_scale_mode = texture.*.scaleMode;
            }
            cmd.*.data.draw.texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
            cmd.*.data.draw.texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
            cmd.*.data.draw.gpu_render_state = renderer.*.gpu_render_state;
            if (renderer.*.gpu_render_state != null) {
                renderer.*.gpu_render_state.*.last_command_generation = renderer.*.render_command_generation;
            }
        }
    }
    return cmd;
}
pub fn QueueCmdDrawPoints(renderer: [*c]SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &count;
    var cmd: [*c]SDL_RenderCommand = PrepQueueCmdDraw(renderer, SDL_RENDERCMD_DRAW_POINTS, null);
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    if (cmd != null) {
        result = renderer.*.QueueDrawPoints.?(renderer, cmd, points, count);
        if (!result) {
            cmd.*.command = SDL_RENDERCMD_NO_OP;
        }
    }
    return result;
}
pub fn QueueCmdDrawLines(renderer: [*c]SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &count;
    var cmd: [*c]SDL_RenderCommand = PrepQueueCmdDraw(renderer, SDL_RENDERCMD_DRAW_LINES, null);
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    if (cmd != null) {
        result = renderer.*.QueueDrawLines.?(renderer, cmd, points, count);
        if (!result) {
            cmd.*.command = SDL_RENDERCMD_NO_OP;
        }
    }
    return result;
}
pub fn QueueCmdFillRects(renderer: [*c]SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &count;
    var cmd: [*c]SDL_RenderCommand = undefined;
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    const use_rendergeometry: c_int = @intFromBool(!(renderer.*.QueueFillRects != null));
    _ = &use_rendergeometry;
    cmd = PrepQueueCmdDraw(renderer, @bitCast(if (use_rendergeometry != 0) SDL_RENDERCMD_GEOMETRY else SDL_RENDERCMD_FILL_RECTS), null);
    if (cmd != null) {
        if (use_rendergeometry != 0) {
            var isstack1: bool = undefined;
            _ = &isstack1;
            var isstack2: bool = undefined;
            _ = &isstack2;
            var xy: [*c]f32 = blk: {
                (&isstack1).* = (@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                break :blk if ((&isstack1).*) @as([*c]f32, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count))))))) else @as([*c]f32, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count)))))));
            };
            _ = &xy;
            var indices: [*c]c_int = blk: {
                (&isstack2).* = (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 6) * count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                break :blk if ((&isstack2).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 6) * count))))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 6) * count)))))));
            };
            _ = &indices;
            if ((xy != null) and (indices != null)) {
                var i: c_int = undefined;
                _ = &i;
                var ptr_xy: [*c]f32 = xy;
                _ = &ptr_xy;
                var ptr_indices: [*c]c_int = indices;
                _ = &ptr_indices;
                const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
                _ = &xy_stride;
                const num_vertices: c_int = @as(c_int, 4) * count;
                _ = &num_vertices;
                const num_indices: c_int = @as(c_int, 6) * count;
                _ = &num_indices;
                const size_indices: c_int = 4;
                _ = &size_indices;
                var cur_index: c_int = 0;
                _ = &cur_index;
                {
                    i = 0;
                    while (i < count) : (i += 1) {
                        var minx: f32 = undefined;
                        _ = &minx;
                        var miny: f32 = undefined;
                        _ = &miny;
                        var maxx: f32 = undefined;
                        _ = &maxx;
                        var maxy: f32 = undefined;
                        _ = &maxy;
                        minx = rects[@bitCast(@as(isize, @intCast(i)))].x;
                        miny = rects[@bitCast(@as(isize, @intCast(i)))].y;
                        maxx = rects[@bitCast(@as(isize, @intCast(i)))].x + rects[@bitCast(@as(isize, @intCast(i)))].w;
                        maxy = rects[@bitCast(@as(isize, @intCast(i)))].y + rects[@bitCast(@as(isize, @intCast(i)))].h;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = minx;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = miny;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = maxx;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = miny;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = maxx;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = maxy;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = minx;
                        (blk: {
                            const ref = &ptr_xy;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = maxy;
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 0)];
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 1)];
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 2)];
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 3)];
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 4)];
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + rect_index_order[@as(c_int, 5)];
                        cur_index += 4;
                    }
                }
                result = renderer.*.QueueGeometry.?(renderer, cmd, null, xy, xy_stride, &renderer.*.color, 0, null, 0, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, 1.0, 1.0);
                if (!result) {
                    cmd.*.command = SDL_RENDERCMD_NO_OP;
                }
            }
            if (isstack1) {
                SDL_free_REAL(@ptrCast(@alignCast(xy)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(xy)));
            }
            if (isstack2) {
                SDL_free_REAL(@ptrCast(@alignCast(indices)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(indices)));
            }
        } else {
            result = renderer.*.QueueFillRects.?(renderer, cmd, rects, count);
            if (!result) {
                cmd.*.command = SDL_RENDERCMD_NO_OP;
            }
        }
    }
    return result;
}
pub fn UpdateTexturePalette(texture: [*c]SDL_Texture) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = texture.*.renderer;
    _ = &renderer;
    var public: [*c]SDL_Palette = texture.*.public_palette;
    _ = &public;
    if (!(!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
        return @"true" != 0;
    }
    if (!(public != null)) {
        return SDL_SetError_REAL("Texture doesn't have a palette");
    }
    if (texture.*.native != null) {
        if (texture.*.palette_version == public.*.version) {
            return @"true" != 0;
        }
        if (!FlushRenderCommandsIfTextureNeeded(texture.*.native)) {
            return @"false" != 0;
        }
        var surface: [*c]SDL_Surface = undefined;
        _ = &surface;
        var result: bool = SDL_LockTextureToSurface_REAL(texture.*.native, null, &surface);
        _ = &result;
        if (result) {
            result = SDL_BlitSurface_REAL(texture.*.palette_surface, null, surface, null);
            SDL_UnlockTexture_REAL(texture.*.native);
        }
        if (!result) {
            return @"false" != 0;
        }
        texture.*.palette_version = public.*.version;
        return @"true" != 0;
    }
    var palette: [*c]SDL_TexturePalette = texture.*.palette;
    _ = &palette;
    if (palette.*.version != public.*.version) {
        if (!FlushRenderCommandsIfPaletteNeeded(renderer, palette)) {
            return @"false" != 0;
        }
        if (!renderer.*.UpdatePalette.?(renderer, palette, public.*.ncolors, public.*.colors)) {
            return @"false" != 0;
        }
        palette.*.version = public.*.version;
    }
    palette.*.last_command_generation = renderer.*.render_command_generation;
    return @"true" != 0;
}
pub fn QueueCmdCopy(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd: [*c]SDL_RenderCommand = PrepQueueCmdDraw(renderer, SDL_RENDERCMD_COPY, texture);
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    if (cmd != null) {
        result = renderer.*.QueueCopy.?(renderer, cmd, texture, srcrect, dstrect);
        if (!result) {
            cmd.*.command = SDL_RENDERCMD_NO_OP;
        }
    }
    return result;
}
pub fn QueueCmdCopyEx(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcquad: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode, scale_x: f32, scale_y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &angle;
    _ = &flip;
    var cmd: [*c]SDL_RenderCommand = PrepQueueCmdDraw(renderer, SDL_RENDERCMD_COPY_EX, texture);
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    if (cmd != null) {
        result = renderer.*.QueueCopyEx.?(renderer, cmd, texture, srcquad, dstrect, angle, center, flip, scale_x, scale_y);
        if (!result) {
            cmd.*.command = SDL_RENDERCMD_NO_OP;
        }
    }
    return result;
}
pub fn QueueCmdGeometry(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int, scale_x: f32, scale_y: f32, texture_address_mode_u: SDL_TextureAddressMode, texture_address_mode_v: SDL_TextureAddressMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var cmd: [*c]SDL_RenderCommand = undefined;
    _ = &cmd;
    var result: bool = @"false" != 0;
    _ = &result;
    cmd = PrepQueueCmdDraw(renderer, SDL_RENDERCMD_GEOMETRY, texture);
    if (cmd != null) {
        cmd.*.data.draw.texture_address_mode_u = texture_address_mode_u;
        cmd.*.data.draw.texture_address_mode_v = texture_address_mode_v;
        result = renderer.*.QueueGeometry.?(renderer, cmd, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, indices, num_indices, size_indices, scale_x, scale_y);
        if (!result) {
            cmd.*.command = SDL_RENDERCMD_NO_OP;
        }
    }
    return result;
}
pub fn UpdateMainViewDimensions(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window_w: c_int = 0;
    _ = &window_w;
    var window_h: c_int = 0;
    _ = &window_h;
    if (renderer.*.window != null) {
        _ = SDL_GetWindowSize_REAL(renderer.*.window, &window_w, &window_h);
    }
    _ = SDL_GetRenderOutputSize_REAL(renderer, &renderer.*.main_view.pixel_w, &renderer.*.main_view.pixel_h);
    if ((window_w > @as(c_int, 0)) and (window_h > @as(c_int, 0))) {
        renderer.*.dpi_scale.x = @as(f32, @floatFromInt(renderer.*.main_view.pixel_w)) / @as(f32, @floatFromInt(window_w));
        renderer.*.dpi_scale.y = @as(f32, @floatFromInt(renderer.*.main_view.pixel_h)) / @as(f32, @floatFromInt(window_h));
    } else {
        renderer.*.dpi_scale.x = 1.0;
        renderer.*.dpi_scale.y = 1.0;
    }
    UpdatePixelViewport(renderer, &renderer.*.main_view);
}
pub fn UpdateColorScale(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var SDR_white_point: f32 = undefined;
    _ = &SDR_white_point;
    if (renderer.*.target != null) {
        SDR_white_point = renderer.*.target.*.SDR_white_point;
    } else {
        SDR_white_point = renderer.*.SDR_white_point;
    }
    renderer.*.color_scale = renderer.*.desired_color_scale * SDR_white_point;
}
pub fn UpdateHDRProperties(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window_props: SDL_PropertiesID = undefined;
    _ = &window_props;
    var renderer_props: SDL_PropertiesID = undefined;
    _ = &renderer_props;
    window_props = SDL_GetWindowProperties_REAL(renderer.*.window);
    if (!(window_props != 0)) {
        return;
    }
    renderer_props = SDL_GetRendererProperties_REAL(renderer);
    if (!(renderer_props != 0)) {
        return;
    }
    if ((renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (renderer.*.output_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_HDR10))) {
        renderer.*.SDR_white_point = SDL_GetFloatProperty_REAL(window_props, "SDL.window.SDR_white_level", 1.0);
        renderer.*.HDR_headroom = SDL_GetFloatProperty_REAL(window_props, "SDL.window.HDR_headroom", 1.0);
    } else {
        renderer.*.SDR_white_point = 1.0;
        renderer.*.HDR_headroom = 1.0;
    }
    if (renderer.*.HDR_headroom > @as(f32, 1.0)) {
        _ = SDL_SetBooleanProperty_REAL(renderer_props, "SDL.renderer.HDR_enabled", @"true" != 0);
    } else {
        _ = SDL_SetBooleanProperty_REAL(renderer_props, "SDL.renderer.HDR_enabled", @"false" != 0);
    }
    _ = SDL_SetFloatProperty_REAL(renderer_props, "SDL.renderer.SDR_white_point", renderer.*.SDR_white_point);
    _ = SDL_SetFloatProperty_REAL(renderer_props, "SDL.renderer.HDR_headroom", renderer.*.HDR_headroom);
    UpdateColorScale(renderer);
}
pub export fn SDL_GetNumRenderDrivers_REAL() c_int {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_uint, @truncate((@sizeOf(@TypeOf(render_drivers)) / @sizeOf(@TypeOf(render_drivers[@as(c_int, 0)]))) -% @as(c_ulong, 1))));
}
pub export fn SDL_GetRenderDriver_REAL(arg_index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var index_1 = arg_index_1;
    _ = &index_1;
    if ((index_1 < @as(c_int, 0)) or (index_1 >= SDL_GetNumRenderDrivers_REAL())) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("index"))));
        return null;
    }
    return render_drivers[@bitCast(@as(isize, @intCast(index_1)))].*.name;
}
pub fn SDL_RendererEventWatch(userdata: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = @ptrCast(@alignCast(userdata));
    _ = &renderer;
    var window: ?*SDL_Window = renderer.*.window;
    _ = &window;
    if (event.*.window.windowID != SDL_GetWindowID_REAL(window)) {
        return @"true" != 0;
    }
    if (renderer.*.WindowEvent != null) {
        renderer.*.WindowEvent.?(renderer, &event.*.window);
    }
    if (((event.*.type == @as(Uint32, SDL_EVENT_WINDOW_RESIZED)) or (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED))) or (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_METAL_VIEW_RESIZED))) {
        var view: [*c]SDL_RenderViewState = renderer.*.view;
        _ = &view;
        renderer.*.view = &renderer.*.main_view;
        UpdateLogicalPresentation(renderer);
        renderer.*.view = view;
    } else if (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_HIDDEN)) {
        renderer.*.hidden = @"true" != 0;
    } else if (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_SHOWN)) {
        if (!((SDL_GetWindowFlags_REAL(window) & @as(c_ulong, 64)) != 0)) {
            renderer.*.hidden = @"false" != 0;
        }
    } else if (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_MINIMIZED)) {
        renderer.*.hidden = @"true" != 0;
    } else if ((event.*.type == @as(Uint32, SDL_EVENT_WINDOW_RESTORED)) or (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_MAXIMIZED))) {
        if (!((SDL_GetWindowFlags_REAL(window) & @as(c_ulong, 8)) != 0)) {
            renderer.*.hidden = @"false" != 0;
        }
    } else if ((event.*.type == @as(Uint32, SDL_EVENT_WINDOW_DISPLAY_CHANGED)) or (event.*.type == @as(Uint32, SDL_EVENT_WINDOW_HDR_STATE_CHANGED))) {
        UpdateHDRProperties(renderer);
    }
    return @"true" != 0;
}
pub export fn SDL_CreateWindowAndRenderer_REAL(title: [*c]const u8, width: c_int, height: c_int, arg_window_flags: SDL_WindowFlags, window: [*c]?*SDL_Window, renderer: [*c][*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    var window_flags = arg_window_flags;
    _ = &window_flags;
    if (!(window != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
    }
    if (!(renderer != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
    }
    var hidden: bool = (window_flags & @as(c_ulong, 8)) != @as(SDL_WindowFlags, 0);
    _ = &hidden;
    window_flags |= 8;
    window.* = SDL_CreateWindow_REAL(title, width, height, window_flags);
    if (!(window.* != null)) {
        renderer.* = null;
        return @"false" != 0;
    }
    renderer.* = SDL_CreateRenderer_REAL(window.*, null);
    if (!(renderer.* != null)) {
        SDL_DestroyWindow_REAL(window.*);
        window.* = null;
        return @"false" != 0;
    }
    if (!hidden) {
        _ = SDL_ShowWindow_REAL(window.*);
    }
    return @"true" != 0;
}
pub fn VerifyDrawQueueFunctions(renderer: [*c]const SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "VerifyDrawQueueFunctions".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueSetViewport)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueSetViewport != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 983);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueSetDrawColor)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueSetDrawColor != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 984);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueDrawPoints)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueDrawPoints != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 985);
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
    while (true) {
        while (!((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueDrawLines)))) != @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueGeometry)))) != @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueDrawLines != ((void*)0) || renderer->QueueGeometry != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 986);
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
    while (true) {
        while (!((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueFillRects)))) != @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueGeometry)))) != @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueFillRects != ((void*)0) || renderer->QueueGeometry != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 987);
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
    while (true) {
        while (!((@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueCopy)))) != @as(?*anyopaque, null)) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.QueueGeometry)))) != @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->QueueCopy != ((void*)0) || renderer->QueueGeometry != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 988);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(renderer.*.RunCommandQueue)))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->RunCommandQueue != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 989);
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
}
pub fn SDL_GetRenderLineMethod() callconv(.c) SDL_RenderLineMethod {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var method: c_int = undefined;
    _ = &method;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                hint = SDL_GetHint_REAL("SDL_RENDER_LINE_METHOD");
                method = 0;
                if (hint != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                method = SDL_atoi_REAL(hint);
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
                switch (method) {
                    @as(c_int, 1) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            4 => {
                return undefined;
            },
            5 => {
                return SDL_RENDERLINEMETHOD_POINTS;
            },
            6 => {
                return SDL_RENDERLINEMETHOD_LINES;
            },
            7 => {
                return SDL_RENDERLINEMETHOD_GEOMETRY;
            },
            8 => {
                return SDL_RENDERLINEMETHOD_POINTS;
            },
            else => unreachable,
        }
    }
}
pub fn SDL_CalculateSimulatedVSyncInterval(renderer: [*c]SDL_Renderer, window: ?*SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var displayID: SDL_DisplayID = if (window != null) SDL_GetDisplayForWindow_REAL(window) else @as(SDL_DisplayID, 0);
    _ = &displayID;
    var mode: [*c]const SDL_DisplayMode = undefined;
    _ = &mode;
    var refresh_num: c_int = undefined;
    _ = &refresh_num;
    var refresh_den: c_int = undefined;
    _ = &refresh_den;
    if (displayID == @as(SDL_DisplayID, 0)) {
        displayID = SDL_GetPrimaryDisplay_REAL();
    }
    mode = SDL_GetDesktopDisplayMode_REAL(displayID);
    if (((mode != null) and (mode.*.refresh_rate_numerator > @as(c_int, 0))) and (mode.*.refresh_rate_denominator > @as(c_int, 0))) {
        refresh_num = mode.*.refresh_rate_numerator;
        refresh_den = mode.*.refresh_rate_denominator;
    } else {
        refresh_num = 60;
        refresh_den = 1;
    }
    renderer.*.simulate_vsync_interval_ns = @bitCast(@as(c_long, @truncate(@divTrunc(SDL_NS_PER_SECOND * @as(c_longlong, refresh_den), @as(c_longlong, refresh_num)))));
}
pub fn SDL_UpdateSoftwareRendererOutput(renderer: [*c]SDL_Renderer, window: ?*SDL_Window, arg_surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface = arg_surface;
    _ = &surface;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!renderer.*.software) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
    }
    var props: SDL_PropertiesID = SDL_GetRendererProperties_REAL(renderer);
    _ = &props;
    if ((window == renderer.*.window) and (@as(?*anyopaque, @ptrCast(@alignCast(surface))) == SDL_GetPointerProperty_REAL(props, "SDL.renderer.surface", null))) {
        return @"true" != 0;
    }
    if ((window != null) and SDL_WindowHasSurface_REAL(window)) {
        return SDL_SetError_REAL("Window already has an associated surface");
    }
    if ((window != null) and (SDL_GetRenderer_REAL(window) != null)) {
        return SDL_SetError_REAL("Window already has an associated renderer");
    }
    _ = FlushRenderCommands(renderer);
    if (window != null) {
        surface = SDL_GetWindowSurface_REAL(window);
        if (!SDL_SurfaceValid(surface)) {
            return @"false" != 0;
        }
        if (!SDL_AddWindowRenderer(window, renderer)) {
            _ = SDL_DestroyWindowSurface_REAL(window);
            return @"false" != 0;
        }
    }
    if (!SW_UpdateRendererSurface(renderer, surface)) {
        if (window != null) {
            SDL_RemoveWindowRenderer(window, renderer);
            _ = SDL_DestroyWindowSurface_REAL(window);
        }
        return @"false" != 0;
    }
    if (renderer.*.window != null) {
        SDL_RemoveWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, SDL_RendererEventWatch, @ptrCast(@alignCast(renderer)));
        SDL_RemoveWindowRenderer(renderer.*.window, renderer);
        _ = SDL_DestroyWindowSurface_REAL(renderer.*.window);
    }
    renderer.*.window = window;
    if (surface != null) {
        renderer.*.main_view.pixel_w = surface.*.w;
        renderer.*.main_view.pixel_h = surface.*.h;
    } else {
        renderer.*.main_view.pixel_w = 0;
        renderer.*.main_view.pixel_h = 0;
    }
    renderer.*.main_view.viewport.w = @floatFromInt(-@as(c_int, 1));
    renderer.*.main_view.viewport.h = @floatFromInt(-@as(c_int, 1));
    UpdatePixelViewport(renderer, &renderer.*.main_view);
    UpdatePixelClipRect(renderer, &renderer.*.main_view);
    UpdateMainViewDimensions(renderer);
    renderer.*.SDR_white_point = 1.0;
    renderer.*.HDR_headroom = 1.0;
    renderer.*.transparent_window = @"false" != 0;
    renderer.*.hidden = @"false" != 0;
    if (window != null) {
        _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.window", @ptrCast(@alignCast(window)));
        _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.surface", null);
        if ((SDL_GetWindowFlags_REAL(window) & @as(c_ulong, 1073741824)) != 0) {
            renderer.*.transparent_window = @"true" != 0;
        }
        if ((SDL_GetWindowFlags_REAL(window) & (@as(c_ulong, 8) | @as(c_ulong, 64))) != 0) {
            renderer.*.hidden = @"true" != 0;
        }
        UpdateHDRProperties(renderer);
        SDL_AddWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, SDL_RendererEventWatch, @ptrCast(@alignCast(renderer)));
    } else {
        _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.window", null);
        _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.surface", @ptrCast(@alignCast(surface)));
    }
    var vsync: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.renderer.vsync", 0));
    _ = &vsync;
    _ = SDL_SetRenderVSync_REAL(renderer, vsync);
    SDL_CalculateSimulatedVSyncInterval(renderer, window);
    if (!(renderer.*.target != null)) {
        _ = SDL_SetRenderViewport_REAL(renderer, null);
    }
    _ = SDL_ClearError_REAL();
    return @"true" != 0;
}
pub export fn SDL_SetSoftwareRendererWindow_REAL(renderer: [*c]SDL_Renderer, window: ?*SDL_Window) bool {
    @setEvalBranchQuota(100000);
    return SDL_UpdateSoftwareRendererOutput(renderer, window, null);
}
pub export fn SDL_SetSoftwareRendererSurface_REAL(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    return SDL_UpdateSoftwareRendererOutput(renderer, null, surface);
}
pub export fn SDL_CreateRendererWithProperties_REAL(props: SDL_PropertiesID) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    var window: ?*SDL_Window = undefined;
    _ = &window;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var driver_name: [*c]const u8 = undefined;
    _ = &driver_name;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var new_props: SDL_PropertiesID = undefined;
    _ = &new_props;
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var rc: bool = undefined;
    _ = &rc;
    var driver_error: [*c]u8 = undefined;
    _ = &driver_error;
    var rc_1: bool = undefined;
    _ = &rc_1;
    var driver_attempt: [*c]const u8 = undefined;
    _ = &driver_attempt;
    var driver_attempt_end: [*c]const u8 = undefined;
    _ = &driver_attempt_end;
    var driver_attempt_len: usize = undefined;
    _ = &driver_attempt_len;
    var i: c_int = undefined;
    _ = &i;
    var driver: [*c]const SDL_RenderDriver = undefined;
    _ = &driver;
    var i_2: c_int = undefined;
    _ = &i_2;
    var driver_3: [*c]const SDL_RenderDriver = undefined;
    _ = &driver_3;
    var vsync: c_int = undefined;
    _ = &vsync;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.renderer.create.window", null)));
                surface = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.renderer.create.surface", null)));
                if (surface != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (renderer != null) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 98;
                    continue;
                }
            },
            2 => {
                driver_name = "software";
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                driver_name = SDL_GetStringProperty_REAL(props, "SDL.renderer.create.name", null);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if ((!(window != null) and !(surface != null)) and (!(driver_name != null) or ((SDL_strcmp_REAL(driver_name, "gpu") != @as(c_int, 0)) and (SDL_strcmp_REAL(driver_name, "software") != @as(c_int, 0))))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("window"))));
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if ((window != null) and (surface != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("A renderer can't target both a window and surface");
                return null;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if ((window != null) and SDL_WindowHasSurface_REAL(window)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = SDL_SetError_REAL("Window already has an associated surface");
                return null;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                if ((window != null) and (SDL_GetRenderer_REAL(window) != null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("Window already has an associated renderer");
                return null;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                renderer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(renderer.*)))));
                if (!(renderer != null)) {
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
                SDL_SetObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER, @"true" != 0);
                hint = SDL_GetHint_REAL("SDL_RENDER_VSYNC");
                if ((hint != null) and (@as(c_int, hint.*) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                _ = SDL_SetNumberProperty_REAL(props, "SDL.renderer.create.present_vsync", @intFromBool(SDL_GetHintBoolean_REAL("SDL_RENDER_VSYNC", @"true" != 0)));
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
                if (surface != null) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                rc = SW_CreateRendererForSurface(renderer, surface, props);
                if (!rc) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                driver_error = null;
                rc_1 = @"false" != 0;
                if (!(driver_name != null)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            25 => {
                VerifyDrawQueueFunctions(renderer);
                renderer.*.window = window;
                renderer.*.target_mutex = SDL_CreateMutex_REAL();
                if (surface != null) {
                    sdl_pc = 67;
                    continue;
                } else {
                    sdl_pc = 68;
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
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                driver_name = SDL_GetHint_REAL("SDL_RENDER_DRIVER");
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
                if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                driver_attempt = driver_name;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                i_2 = 0;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            34 => {
                if (rc_1) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            35 => {
                if (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !rc_1) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                driver_attempt_end = SDL_strchr_REAL(driver_attempt, ',');
                driver_attempt_len = if (driver_attempt_end != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(driver_attempt_end) -% @intFromPtr(driver_attempt))), @sizeOf(u8))))) else SDL_strlen_REAL(driver_attempt);
                i = 0;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                if (render_drivers[@bitCast(@as(isize, @intCast(i)))] != null) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                driver = render_drivers[@bitCast(@as(isize, @intCast(i)))];
                if ((driver_attempt_len == SDL_strlen_REAL(driver.*.name)) and (SDL_strncasecmp_REAL(driver.*.name, driver_attempt, driver_attempt_len) == @as(c_int, 0))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            40 => {
                i += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*const anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            42 => {
                if (driver_error != null) {
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
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                SDL_free_REAL(@ptrCast(@alignCast(driver_error)));
                driver_error = null;
                {
                    sdl_pc = 47;
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
                rc_1 = driver.*.CreateRenderer.?(renderer, window, props);
                if (rc_1) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 41;
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
                driver_error = SDL_strdup_REAL(SDL_GetError_REAL());
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_RENDER, "Couldn't create renderer %s: %s\n", driver.*.name, driver_error);
                SDL_DestroyRendererWithoutFreeing(renderer);
                _ = memset(@ptrCast(@alignCast(renderer)), 0, @sizeOf(@TypeOf(renderer.*)));
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            51 => {
                if (render_drivers[@bitCast(@as(isize, @intCast(i_2)))] != null) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                driver_3 = render_drivers[@bitCast(@as(isize, @intCast(i_2)))];
                rc_1 = driver_3.*.CreateRenderer.?(renderer, window, props);
                if (rc_1) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                i_2 += 1;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 54;
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
                SDL_DestroyRendererWithoutFreeing(renderer);
                _ = memset(@ptrCast(@alignCast(renderer)), 0, @sizeOf(@TypeOf(renderer.*)));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            58 => {
                SDL_DebugLogBackend("render", renderer.*.name);
                SDL_free_REAL(@ptrCast(@alignCast(driver_error)));
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                if (driver_name != null) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            61 => {
                if (driver_error != null) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            62 => {
                _ = SDL_SetError_REAL("Couldn't find matching render driver");
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                SDL_free_REAL(@ptrCast(@alignCast(driver_error)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            64 => {
                _ = SDL_SetError_REAL("%s", driver_error);
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                _ = SDL_SetError_REAL("%s not available", driver_name);
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            67 => {
                renderer.*.main_view.pixel_w = surface.*.w;
                renderer.*.main_view.pixel_h = surface.*.h;
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
                renderer.*.main_view.viewport.w = -@as(f32, 1.0);
                renderer.*.main_view.viewport.h = -@as(f32, 1.0);
                renderer.*.main_view.scale.x = 1.0;
                renderer.*.main_view.scale.y = 1.0;
                renderer.*.main_view.logical_scale.x = 1.0;
                renderer.*.main_view.logical_scale.y = 1.0;
                renderer.*.main_view.current_scale.x = 1.0;
                renderer.*.main_view.current_scale.y = 1.0;
                renderer.*.view = &renderer.*.main_view;
                UpdatePixelViewport(renderer, &renderer.*.main_view);
                UpdatePixelClipRect(renderer, &renderer.*.main_view);
                UpdateMainViewDimensions(renderer);
                renderer.*.palettes = SDL_CreateHashTable(0, @"false" != 0, SDL_HashPointer, SDL_KeyMatchPointer, SDL_DestroyHashValue, null);
                if (!(renderer.*.palettes != null)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 1;
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
                renderer.*.render_command_generation = 1;
                if (renderer.*.software) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            73 => {
                renderer.*.line_method = SDL_RENDERLINEMETHOD_LINES;
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                renderer.*.line_method = SDL_GetRenderLineMethod();
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            75 => {
                renderer.*.scale_mode = SDL_SCALEMODE_LINEAR;
                renderer.*.SDR_white_point = 1.0;
                renderer.*.HDR_headroom = 1.0;
                renderer.*.desired_color_scale = 1.0;
                renderer.*.color_scale = 1.0;
                if (window != null) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                if ((SDL_GetWindowFlags_REAL(window) & @as(c_ulong, 1073741824)) != 0) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
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
                new_props = SDL_GetRendererProperties_REAL(renderer);
                _ = SDL_SetStringProperty_REAL(new_props, "SDL.renderer.name", renderer.*.name);
                if (window != null) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            79 => {
                renderer.*.transparent_window = @"true" != 0;
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
                if ((SDL_GetWindowFlags_REAL(window) & (@as(c_ulong, 8) | @as(c_ulong, 64))) != 0) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                renderer.*.hidden = @"true" != 0;
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
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            85 => {
                _ = SDL_SetPointerProperty_REAL(new_props, "SDL.renderer.window", @ptrCast(@alignCast(window)));
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
                if (surface != null) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                _ = SDL_SetPointerProperty_REAL(new_props, "SDL.renderer.surface", @ptrCast(@alignCast(surface)));
                {
                    sdl_pc = 90;
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
                _ = SDL_SetNumberProperty_REAL(new_props, "SDL.renderer.output_colorspace", renderer.*.output_colorspace);
                _ = SDL_SetBooleanProperty_REAL(new_props, "SDL.renderer.texture_wrapping", !renderer.*.npot_texture_wrap_unsupported);
                if (window != null) {
                    sdl_pc = 91;
                    continue;
                } else {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                UpdateHDRProperties(renderer);
                if (!SDL_AddWindowRenderer(window, renderer)) {
                    sdl_pc = 94;
                    continue;
                } else {
                    sdl_pc = 95;
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
                vsync = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.renderer.create.present_vsync", 0));
                _ = SDL_SetRenderVSync_REAL(renderer, vsync);
                SDL_CalculateSimulatedVSyncInterval(renderer, window);
                _ = SDL_SetRenderViewport_REAL(renderer, null);
                SDL_LogInfo_REAL(SDL_LOG_CATEGORY_RENDER, "Created renderer: %s", renderer.*.name);
                renderer.*.next = SDL_renderers;
                SDL_renderers = renderer;
                _ = SDL_ClearError_REAL();
                return renderer;
            },
            94 => {
                {
                    sdl_pc = 1;
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
                SDL_AddWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, SDL_RendererEventWatch, @ptrCast(@alignCast(renderer)));
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            97 => {
                SDL_DestroyRenderer_REAL(renderer);
                {
                    sdl_pc = 99;
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
                return null;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_CreateRenderer_REAL(window: ?*SDL_Window, name: [*c]const u8) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.create.window", @ptrCast(@alignCast(window)));
    _ = SDL_SetStringProperty_REAL(props, "SDL.renderer.create.name", name);
    renderer = SDL_CreateRendererWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return renderer;
}
pub export fn SDL_CreateGPURenderer_REAL(device: ?*SDL_GPUDevice, window: ?*SDL_Window) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.create.gpu.device", @ptrCast(@alignCast(device)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.create.window", @ptrCast(@alignCast(window)));
    _ = SDL_SetStringProperty_REAL(props, "SDL.renderer.create.name", "gpu");
    renderer = SDL_CreateRendererWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return renderer;
}
pub export fn SDL_GetGPURendererDevice_REAL(renderer: [*c]SDL_Renderer) ?*SDL_GPUDevice {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    var device: ?*SDL_GPUDevice = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.gpu.device", null)));
    _ = &device;
    if (!(device != null)) {
        _ = SDL_SetError_REAL("Renderer isn't a GPU renderer");
        return null;
    }
    return device;
}
pub export fn SDL_CreateSoftwareRenderer_REAL(surface: [*c]SDL_Surface) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetStringProperty_REAL(props, "SDL.renderer.create.name", "software");
    _ = SDL_SetPointerProperty_REAL(props, "SDL.renderer.create.surface", @ptrCast(@alignCast(surface)));
    renderer = SDL_CreateRendererWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return renderer;
}
pub export fn SDL_GetRenderer_REAL(window: ?*SDL_Window) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    return @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.window.renderer", null)));
}
pub export fn SDL_GetRenderWindow_REAL(renderer: [*c]SDL_Renderer) ?*SDL_Window {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    return renderer.*.window;
}
pub export fn SDL_GetRendererName_REAL(renderer: [*c]SDL_Renderer) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    return SDL_GetPersistentString(renderer.*.name);
}
pub export fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return 0;
    }
    if (renderer.*.props == @as(SDL_PropertiesID, 0)) {
        renderer.*.props = SDL_CreateProperties_REAL();
    }
    return renderer.*.props;
}
pub export fn SDL_GetRenderOutputSize_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (w != null) {
        w.* = 0;
    }
    if (h != null) {
        h.* = 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (renderer.*.GetOutputSize != null) {
        return renderer.*.GetOutputSize.?(renderer, w, h);
    } else if (renderer.*.window != null) {
        return SDL_GetWindowSizeInPixels_REAL(renderer.*.window, w, h);
    } else {
        return @"true" != 0;
    }
}
pub export fn SDL_GetCurrentRenderOutputSize_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (w != null) {
        w.* = 0;
    }
    if (h != null) {
        h.* = 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (w != null) {
        w.* = view.*.pixel_w;
    }
    if (h != null) {
        h.* = view.*.pixel_h;
    }
    return @"true" != 0;
}
pub fn IsSupportedBlendMode(renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (blendMode) {
                    SDL_BLENDMODE_NONE => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_BLENDMODE_BLEND_PREMULTIPLIED => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_BLENDMODE_ADD => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_BLENDMODE_ADD_PREMULTIPLIED => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_BLENDMODE_MOD => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDL_BLENDMODE_MUL => {
                        sdl_pc = 8;
                        continue;
                    },
                    else => {
                        sdl_pc = 9;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
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
                return @"true" != 0;
            },
            9 => {
                return (renderer.*.SupportsBlendMode != null) and renderer.*.SupportsBlendMode.?(renderer, blendMode);
            },
            else => unreachable,
        }
    }
}
pub fn IsSupportedFormat(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < renderer.*.num_texture_formats) : (i += 1) {
            if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == format) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn GetClosestSupportedFormat(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat, arg_hasAlpha: bool) callconv(.c) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    var hasAlpha = arg_hasAlpha;
    _ = &hasAlpha;
    var i: c_int = undefined;
    _ = &i;
    if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA32)) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    } else if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == format) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    } else if ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) or (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32))))) {
        if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
            {
                i = 0;
                while (i < renderer.*.num_texture_formats) : (i += 1) {
                    if (!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010)))) {
                        return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                    }
                }
            }
        }
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    } else if (!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_INDEX8)) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    } else {
        var @"type": c_int = @bitCast((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15));
        _ = &@"type";
        var layout: c_int = @bitCast((format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15));
        _ = &layout;
        hasAlpha = hasAlpha or (((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))));
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (((!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, @bitCast(@"type")))) and (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, @bitCast(layout)))) and (@intFromBool(((!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) == @as(c_int, @intFromBool(hasAlpha)))) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    }
    if (hasAlpha) {
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA)))))) {
                    return renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    }
    return renderer.*.texture_formats[@as(c_int, 0)];
}
pub export fn SDL_CreateTextureWithProperties_REAL(renderer: [*c]SDL_Renderer, arg_props: SDL_PropertiesID) [*c]SDL_Texture {
    @setEvalBranchQuota(100000);
    var props = arg_props;
    _ = &props;
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var format: SDL_PixelFormat = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.texture.create.format", SDL_PIXELFORMAT_UNKNOWN))));
    _ = &format;
    var access: SDL_TextureAccess = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.texture.create.access", SDL_TEXTUREACCESS_STATIC))));
    _ = &access;
    var w: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.texture.create.width", 0));
    _ = &w;
    var h: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.texture.create.height", 0));
    _ = &h;
    var palette: [*c]SDL_Palette = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.texture.create.palette", null)));
    _ = &palette;
    var default_colorspace: SDL_Colorspace = undefined;
    _ = &default_colorspace;
    var texture_is_fourcc_and_target: bool = undefined;
    _ = &texture_is_fourcc_and_target;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (!(format != 0)) {
        format = renderer.*.texture_formats[@as(c_int, 0)];
    }
    if ((if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) == @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Invalid texture format");
        return null;
    }
    if ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) and (access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET))) {
        _ = SDL_SetError_REAL("Palettized textures can't be render targets");
        return null;
    }
    if (((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET))) {
        _ = SDL_SetError_REAL("%s textures can't be render targets", SDL_GetPixelFormatName_REAL(format));
        return null;
    }
    if ((w <= @as(c_int, 0)) or (h <= @as(c_int, 0))) {
        _ = SDL_SetError_REAL("Texture dimensions can't be 0");
        return null;
    }
    var max_texture_size: c_int = @truncate(SDL_GetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.max_texture_size", 0));
    _ = &max_texture_size;
    if ((max_texture_size != 0) and ((w > max_texture_size) or (h > max_texture_size))) {
        _ = SDL_SetError_REAL("Texture dimensions are limited to %dx%d", max_texture_size, max_texture_size);
        return null;
    }
    default_colorspace = SDL_GetDefaultColorspaceForFormat(format);
    texture = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(texture.*)))));
    if (!(texture != null)) {
        return null;
    }
    texture.*.refcount = 1;
    SDL_SetObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE, @"true" != 0);
    texture.*.colorspace = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.texture.create.colorspace", default_colorspace))));
    texture.*.format = format;
    texture.*.access = access;
    texture.*.w = w;
    texture.*.h = h;
    texture.*.color.r = 1.0;
    texture.*.color.g = 1.0;
    texture.*.color.b = 1.0;
    texture.*.color.a = 1.0;
    texture.*.blendMode = if (((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) SDL_BLENDMODE_BLEND else SDL_BLENDMODE_NONE;
    texture.*.scaleMode = renderer.*.scale_mode;
    texture.*.view.pixel_w = w;
    texture.*.view.pixel_h = h;
    texture.*.view.viewport.w = -@as(f32, 1.0);
    texture.*.view.viewport.h = -@as(f32, 1.0);
    texture.*.view.scale.x = 1.0;
    texture.*.view.scale.y = 1.0;
    texture.*.view.logical_scale.x = 1.0;
    texture.*.view.logical_scale.y = 1.0;
    texture.*.view.current_scale.x = 1.0;
    texture.*.view.current_scale.y = 1.0;
    texture.*.renderer = renderer;
    texture.*.next = renderer.*.textures;
    if (renderer.*.textures != null) {
        renderer.*.textures.*.prev = texture;
    }
    renderer.*.textures = texture;
    UpdatePixelViewport(renderer, &texture.*.view);
    UpdatePixelClipRect(renderer, &texture.*.view);
    texture.*.SDR_white_point = SDL_GetFloatProperty_REAL(props, "SDL.texture.create.SDR_white_point", SDL_GetDefaultSDRWhitePoint(texture.*.colorspace));
    texture.*.HDR_headroom = SDL_GetFloatProperty_REAL(props, "SDL.texture.create.HDR_headroom", SDL_GetDefaultHDRHeadroom(texture.*.colorspace));
    texture_is_fourcc_and_target = (access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) and ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0));
    if (!texture_is_fourcc_and_target and IsSupportedFormat(renderer, format)) {
        if (!renderer.*.CreateTexture.?(renderer, texture, props)) {
            SDL_DestroyTexture_REAL(texture);
            return null;
        }
    } else {
        var closest_format: SDL_PixelFormat = undefined;
        _ = &closest_format;
        var native_props: SDL_PropertiesID = SDL_CreateProperties_REAL();
        _ = &native_props;
        if (!texture_is_fourcc_and_target) {
            closest_format = GetClosestSupportedFormat(renderer, format, @"false" != 0);
        } else {
            closest_format = renderer.*.texture_formats[@as(c_int, 0)];
        }
        if ((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) and (closest_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12))) {
            _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.colorspace", SDL_COLORSPACE_JPEG);
        } else {
            default_colorspace = SDL_GetDefaultColorspaceForFormat(closest_format);
            if ((@as(SDL_ColorType, (texture.*.colorspace >> @intCast(@as(SDL_Colorspace, 28))) & @as(SDL_Colorspace, 15)) == @as(SDL_ColorType, (default_colorspace >> @intCast(@as(SDL_Colorspace, 28))) & @as(SDL_Colorspace, 15))) and (@as(SDL_TransferCharacteristics, (texture.*.colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)) == @as(SDL_TransferCharacteristics, (default_colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)))) {
                _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.colorspace", texture.*.colorspace);
            } else {
                _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.colorspace", default_colorspace);
            }
        }
        _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.format", closest_format);
        if (!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
            _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.access", SDL_TEXTUREACCESS_STREAMING);
        } else {
            _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.access", texture.*.access);
        }
        _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.width", texture.*.w);
        _ = SDL_SetNumberProperty_REAL(native_props, "SDL.texture.create.height", texture.*.h);
        texture.*.native = SDL_CreateTextureWithProperties_REAL(renderer, native_props);
        SDL_DestroyProperties_REAL(native_props);
        if (!(texture.*.native != null)) {
            SDL_DestroyTexture_REAL(texture);
            return null;
        }
        _ = SDL_SetPointerProperty_REAL(SDL_GetTextureProperties_REAL(texture.*.native), "SDL.internal.texture.parent", @ptrCast(@alignCast(texture)));
        texture.*.native.*.next = texture.*.next;
        if (texture.*.native.*.next != null) {
            texture.*.native.*.next.*.prev = texture.*.native;
        }
        texture.*.prev = texture.*.native.*.prev;
        if (texture.*.prev != null) {
            texture.*.prev.*.next = texture;
        }
        texture.*.native.*.prev = texture;
        texture.*.next = texture.*.native;
        renderer.*.textures = texture;
        _ = SDL_SetTextureScaleMode_REAL(texture.*.native, texture.*.scaleMode);
        if (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_MJPG)) {} else if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) {
            texture.*.yuv = SDL_SW_CreateYUVTexture(texture.*.format, texture.*.colorspace, w, h);
            if (!(texture.*.yuv != null)) {
                SDL_DestroyTexture_REAL(texture);
                return null;
            }
        } else if (!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
            texture.*.palette_surface = SDL_CreateSurfaceZeroed(w, h, texture.*.format);
            if (!(texture.*.palette_surface != null)) {
                SDL_DestroyTexture_REAL(texture);
                return null;
            }
        } else if (access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
            texture.*.pitch = ((w * (if ((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 3)) & ~@as(c_int, 3);
            texture.*.pixels = SDL_calloc_REAL(1, @as(usize, @bitCast(@as(c_long, texture.*.pitch))) *% @as(usize, @bitCast(@as(c_long, h))));
            if (!(texture.*.pixels != null)) {
                SDL_DestroyTexture_REAL(texture);
                return null;
            }
        }
    }
    if ((!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) and (palette != null)) {
        _ = SDL_SetTexturePalette_REAL(texture, palette);
    }
    props = SDL_GetTextureProperties_REAL(texture);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.colorspace", texture.*.colorspace);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.format", texture.*.format);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.access", texture.*.access);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.width", texture.*.w);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.height", texture.*.h);
    _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.SDR_white_point", texture.*.SDR_white_point);
    if (texture.*.HDR_headroom > @as(f32, 0.0)) {
        _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.HDR_headroom", texture.*.HDR_headroom);
    }
    return texture;
}
pub export fn SDL_CreateTexture_REAL(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat, access: SDL_TextureAccess, w: c_int, h: c_int) [*c]SDL_Texture {
    @setEvalBranchQuota(100000);
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.format", format);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.access", access);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.width", w);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.height", h);
    texture = SDL_CreateTextureWithProperties_REAL(renderer, props);
    SDL_DestroyProperties_REAL(props);
    return texture;
}
pub fn SDL_UpdateTextureFromSurface(texture: [*c]SDL_Texture, rect: [*c]SDL_Rect, surface: [*c]SDL_Surface) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var direct_update: bool = undefined;
    _ = &direct_update;
    if ((surface.*.format == texture.*.format) and (SDL_GetSurfaceColorspace_REAL(surface) == texture.*.colorspace)) {
        if (!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) {
            direct_update = @"true" != 0;
        } else if ((((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) and SDL_SurfaceHasColorKey_REAL(surface)) {
            direct_update = @"false" != 0;
        } else {
            direct_update = @"true" != 0;
        }
    } else {
        direct_update = @"false" != 0;
    }
    if (direct_update) {
        if ((surface.*.flags & SDL_SURFACE_LOCK_NEEDED) == SDL_SURFACE_LOCK_NEEDED) {
            if (SDL_LockSurface_REAL(surface)) {
                _ = SDL_UpdateTexture_REAL(texture, rect, surface.*.pixels, surface.*.pitch);
                SDL_UnlockSurface_REAL(surface);
            }
        } else {
            _ = SDL_UpdateTexture_REAL(texture, rect, surface.*.pixels, surface.*.pitch);
        }
    } else {
        var temp: [*c]SDL_Surface = SDL_ConvertSurfaceAndColorspace_REAL(surface, texture.*.format, texture.*.public_palette, texture.*.colorspace, SDL_GetSurfaceProperties_REAL(surface));
        _ = &temp;
        if (temp != null) {
            _ = SDL_UpdateTexture_REAL(texture, null, temp.*.pixels, temp.*.pitch);
            SDL_DestroySurface_REAL(temp);
        } else {
            return @"false" != 0;
        }
    }
    if ((!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8)))) and SDL_SurfaceHasColorKey_REAL(surface)) {
        var key: Uint32 = undefined;
        _ = &key;
        var col: SDL_Color = undefined;
        _ = &col;
        var palette: [*c]SDL_Palette = undefined;
        _ = &palette;
        palette = SDL_GetTexturePalette_REAL(texture);
        if ((!(palette != null) or !SDL_GetSurfaceColorKey_REAL(surface, &key)) or (key >= @as(Uint32, @bitCast(@as(c_int, palette.*.ncolors))))) {
            return @"false" != 0;
        }
        col = palette.*.colors[key];
        col.a = SDL_ALPHA_TRANSPARENT;
        _ = SDL_SetPaletteColors_REAL(palette, &col, @bitCast(@as(c_uint, @truncate(key))), 1);
    }
    {
        var r: Uint8 = undefined;
        _ = &r;
        var g: Uint8 = undefined;
        _ = &g;
        var b: Uint8 = undefined;
        _ = &b;
        var a: Uint8 = undefined;
        _ = &a;
        var blendMode: SDL_BlendMode = undefined;
        _ = &blendMode;
        _ = SDL_GetSurfaceColorMod_REAL(surface, &r, &g, &b);
        _ = SDL_SetTextureColorMod_REAL(texture, r, g, b);
        _ = SDL_GetSurfaceAlphaMod_REAL(surface, &a);
        _ = SDL_SetTextureAlphaMod_REAL(texture, a);
        if (SDL_SurfaceHasColorKey_REAL(surface)) {
            _ = SDL_SetTextureBlendMode_REAL(texture, SDL_BLENDMODE_BLEND);
        } else {
            _ = SDL_GetSurfaceBlendMode_REAL(surface, &blendMode);
            _ = SDL_SetTextureBlendMode_REAL(texture, blendMode);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_CreateTextureFromSurface_REAL(renderer: [*c]SDL_Renderer, surface: [*c]SDL_Surface) [*c]SDL_Texture {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var format: SDL_PixelFormat = SDL_PIXELFORMAT_UNKNOWN;
    _ = &format;
    var texture: [*c]SDL_Texture = undefined;
    _ = &texture;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var surface_colorspace: SDL_Colorspace = SDL_COLORSPACE_UNKNOWN;
    _ = &surface_colorspace;
    var texture_colorspace: SDL_Colorspace = SDL_COLORSPACE_UNKNOWN;
    _ = &texture_colorspace;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (!SDL_SurfaceValid(surface)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_CreateTextureFromSurface(): surface"))));
        return null;
    }
    if (!(((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((surface.*.format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))) and SDL_SurfaceHasColorKey_REAL(surface)) {
        if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888)) {
            {
                i = 0;
                while (i < renderer.*.num_texture_formats) : (i += 1) {
                    if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
                        format = SDL_PIXELFORMAT_ARGB8888;
                        break;
                    }
                }
            }
        } else if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888)) {
            {
                i = 0;
                while (i < renderer.*.num_texture_formats) : (i += 1) {
                    if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888)) {
                        format = SDL_PIXELFORMAT_ABGR8888;
                        break;
                    }
                }
            }
        } else if (surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB4444)) {
            {
                i = 0;
                while (i < renderer.*.num_texture_formats) : (i += 1) {
                    if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB4444)) {
                        format = SDL_PIXELFORMAT_ARGB4444;
                        break;
                    }
                }
            }
        }
    } else {
        {
            i = 0;
            while (i < renderer.*.num_texture_formats) : (i += 1) {
                if (renderer.*.texture_formats[@bitCast(@as(isize, @intCast(i)))] == surface.*.format) {
                    format = surface.*.format;
                    break;
                }
            }
        }
    }
    if (format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) {
        var needAlpha: bool = SDL_SurfaceHasColorKey_REAL(surface);
        _ = &needAlpha;
        if (surface.*.palette != null) {
            var is_opaque: bool = undefined;
            _ = &is_opaque;
            var has_alpha_channel: bool = undefined;
            _ = &has_alpha_channel;
            SDL_DetectPalette(surface.*.palette, &is_opaque, &has_alpha_channel);
            if (!is_opaque) {
                needAlpha = @"true" != 0;
            }
        }
        format = GetClosestSupportedFormat(renderer, surface.*.format, needAlpha);
    }
    surface_colorspace = SDL_GetSurfaceColorspace_REAL(surface);
    texture_colorspace = surface_colorspace;
    if (((surface_colorspace == @as(SDL_Colorspace, SDL_COLORSPACE_SRGB_LINEAR)) or (@as(SDL_TransferCharacteristics, (surface_colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)) == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ))) or (((surface.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((surface.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and !((format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)))) {
        texture_colorspace = SDL_GetDefaultColorspaceForFormat(format);
    }
    props = SDL_CreateProperties_REAL();
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.colorspace", texture_colorspace);
    if (surface_colorspace == texture_colorspace) {
        _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.create.SDR_white_point", SDL_GetSurfaceSDRWhitePoint(surface, surface_colorspace));
    }
    _ = SDL_SetFloatProperty_REAL(props, "SDL.texture.create.HDR_headroom", SDL_GetSurfaceHDRHeadroom(surface, surface_colorspace));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.format", format);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.access", SDL_TEXTUREACCESS_STATIC);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.width", surface.*.w);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.texture.create.height", surface.*.h);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.texture.create.palette", @ptrCast(@alignCast(surface.*.palette)));
    texture = SDL_CreateTextureWithProperties_REAL(renderer, props);
    SDL_DestroyProperties_REAL(props);
    if (!(texture != null)) {
        return null;
    }
    if (!SDL_UpdateTextureFromSurface(texture, null, surface)) {
        SDL_DestroyTexture_REAL(texture);
        return null;
    }
    return texture;
}
pub export fn SDL_GetRendererFromTexture_REAL(texture: [*c]SDL_Texture) [*c]SDL_Renderer {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return null;
    }
    return texture.*.renderer;
}
pub export fn SDL_GetTextureProperties_REAL(texture: [*c]SDL_Texture) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return 0;
    }
    if (texture.*.props == @as(SDL_PropertiesID, 0)) {
        texture.*.props = SDL_CreateProperties_REAL();
    }
    return texture.*.props;
}
pub export fn SDL_GetTextureSize_REAL(texture: [*c]SDL_Texture, w: [*c]f32, h: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    if (w != null) {
        w.* = @floatFromInt(@as(c_int, 0));
    }
    if (h != null) {
        h.* = @floatFromInt(@as(c_int, 0));
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (w != null) {
        w.* = @floatFromInt(texture.*.w);
    }
    if (h != null) {
        h.* = @floatFromInt(texture.*.h);
    }
    return @"true" != 0;
}
pub export fn SDL_SetTexturePalette_REAL(texture: [*c]SDL_Texture, palette: [*c]SDL_Palette) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (!(!((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture.*.format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) {
        return SDL_SetError_REAL("Texture isn't palettized format");
    }
    if ((palette != null) and (palette.*.ncolors > (@as(c_int, 1) << @intCast(if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))))) {
        return SDL_SetError_REAL("Palette doesn't match surface format");
    }
    if (palette != texture.*.public_palette) {
        var renderer: [*c]SDL_Renderer = texture.*.renderer;
        _ = &renderer;
        if (texture.*.public_palette != null) {
            SDL_DestroyPalette_REAL(texture.*.public_palette);
            if (!(texture.*.native != null)) {
                texture.*.palette.*.refcount -= 1;
                if (texture.*.palette.*.refcount == @as(c_int, 0)) {
                    _ = FlushRenderCommandsIfPaletteNeeded(renderer, texture.*.palette);
                    renderer.*.DestroyPalette.?(renderer, texture.*.palette);
                    _ = SDL_RemoveFromHashTable(renderer.*.palettes, @ptrCast(@alignCast(texture.*.public_palette)));
                }
                texture.*.palette = null;
            }
        }
        texture.*.public_palette = palette;
        texture.*.palette_version = 0;
        if (texture.*.public_palette != null) {
            texture.*.public_palette.*.refcount += 1;
            if (!(texture.*.native != null)) {
                if (SDL_FindInHashTable(renderer.*.palettes, @ptrCast(@alignCast(palette)), @ptrCast(@alignCast(&texture.*.palette)))) {
                    texture.*.palette.*.refcount += 1;
                } else {
                    var texture_palette: [*c]SDL_TexturePalette = undefined;
                    texture_palette = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(texture_palette.*)))));
                    _ = &texture_palette;
                    if (!(texture_palette != null)) {
                        _ = SDL_SetTexturePalette_REAL(texture, null);
                        return @"false" != 0;
                    }
                    if (!renderer.*.CreatePalette.?(renderer, texture_palette)) {
                        renderer.*.DestroyPalette.?(renderer, texture_palette);
                        _ = SDL_SetTexturePalette_REAL(texture, null);
                        return @"false" != 0;
                    }
                    texture.*.palette = texture_palette;
                    texture.*.palette.*.refcount = 1;
                    if (!SDL_InsertIntoHashTable(renderer.*.palettes, @ptrCast(@alignCast(palette)), @ptrCast(@alignCast(texture.*.palette)), @"false" != 0)) {
                        _ = SDL_SetTexturePalette_REAL(texture, null);
                        return @"false" != 0;
                    }
                }
            }
            if (!(texture.*.native != null) and (renderer.*.ChangeTexturePalette != null)) {
                _ = renderer.*.ChangeTexturePalette.?(renderer, texture);
            }
        }
        if (texture.*.palette_surface != null) {
            _ = SDL_SetSurfacePalette_REAL(texture.*.palette_surface, palette);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetTexturePalette_REAL(texture: [*c]SDL_Texture) [*c]SDL_Palette {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return null;
    }
    return texture.*.public_palette;
}
pub export fn SDL_SetTextureColorMod_REAL(texture: [*c]SDL_Texture, r: Uint8, g: Uint8, b: Uint8) bool {
    @setEvalBranchQuota(100000);
    const fR: f32 = @as(f32, @floatFromInt(r)) / @as(f32, 255.0);
    _ = &fR;
    const fG: f32 = @as(f32, @floatFromInt(g)) / @as(f32, 255.0);
    _ = &fG;
    const fB: f32 = @as(f32, @floatFromInt(b)) / @as(f32, 255.0);
    _ = &fB;
    return SDL_SetTextureColorModFloat_REAL(texture, fR, fG, fB);
}
pub export fn SDL_SetTextureColorModFloat_REAL(texture: [*c]SDL_Texture, r: f32, g: f32, b: f32) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    texture.*.color.r = r;
    texture.*.color.g = g;
    texture.*.color.b = b;
    if (texture.*.native != null) {
        return SDL_SetTextureColorModFloat_REAL(texture.*.native, r, g, b);
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextureColorMod_REAL(texture: [*c]SDL_Texture, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    var fR: f32 = 1.0;
    _ = &fR;
    var fG: f32 = 1.0;
    _ = &fG;
    var fB: f32 = 1.0;
    _ = &fB;
    if (!SDL_GetTextureColorModFloat_REAL(texture, &fR, &fG, &fB)) {
        if (r != null) {
            r.* = 255;
        }
        if (g != null) {
            g.* = 255;
        }
        if (b != null) {
            b.* = 255;
        }
        return @"false" != 0;
    }
    if (r != null) {
        r.* = @intFromFloat(SDL_roundf_REAL((if (fR < @as(f32, 0.0)) @as(f32, 0.0) else if (fR > @as(f32, 1.0)) @as(f32, 1.0) else fR) * @as(f32, 255.0)));
    }
    if (g != null) {
        g.* = @intFromFloat(SDL_roundf_REAL((if (fG < @as(f32, 0.0)) @as(f32, 0.0) else if (fG > @as(f32, 1.0)) @as(f32, 1.0) else fG) * @as(f32, 255.0)));
    }
    if (b != null) {
        b.* = @intFromFloat(SDL_roundf_REAL((if (fB < @as(f32, 0.0)) @as(f32, 0.0) else if (fB > @as(f32, 1.0)) @as(f32, 1.0) else fB) * @as(f32, 255.0)));
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextureColorModFloat_REAL(texture: [*c]SDL_Texture, r: [*c]f32, g: [*c]f32, b: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var color: SDL_FColor = undefined;
    _ = &color;
    if (r != null) {
        r.* = 1.0;
    }
    if (g != null) {
        g.* = 1.0;
    }
    if (b != null) {
        b.* = 1.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    color = texture.*.color;
    if (r != null) {
        r.* = color.r;
    }
    if (g != null) {
        g.* = color.g;
    }
    if (b != null) {
        b.* = color.b;
    }
    return @"true" != 0;
}
pub export fn SDL_SetTextureAlphaMod_REAL(texture: [*c]SDL_Texture, alpha: Uint8) bool {
    @setEvalBranchQuota(100000);
    const fA: f32 = @as(f32, @floatFromInt(alpha)) / @as(f32, 255.0);
    _ = &fA;
    return SDL_SetTextureAlphaModFloat_REAL(texture, fA);
}
pub export fn SDL_SetTextureAlphaModFloat_REAL(texture: [*c]SDL_Texture, alpha: f32) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    texture.*.color.a = alpha;
    if (texture.*.native != null) {
        return SDL_SetTextureAlphaModFloat_REAL(texture.*.native, alpha);
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextureAlphaMod_REAL(texture: [*c]SDL_Texture, alpha: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    var fA: f32 = 1.0;
    _ = &fA;
    if (!SDL_GetTextureAlphaModFloat_REAL(texture, &fA)) {
        if (alpha != null) {
            alpha.* = 255;
        }
        return @"false" != 0;
    }
    if (alpha != null) {
        alpha.* = @intFromFloat(SDL_roundf_REAL((if (fA < @as(f32, 0.0)) @as(f32, 0.0) else if (fA > @as(f32, 1.0)) @as(f32, 1.0) else fA) * @as(f32, 255.0)));
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextureAlphaModFloat_REAL(texture: [*c]SDL_Texture, alpha: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    if (alpha != null) {
        alpha.* = 1.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (alpha != null) {
        alpha.* = texture.*.color.a;
    }
    return @"true" != 0;
}
pub export fn SDL_SetTextureBlendMode_REAL(texture: [*c]SDL_Texture, blendMode: SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (blendMode == SDL_BLENDMODE_INVALID) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("blendMode"))));
    }
    renderer = texture.*.renderer;
    if (!IsSupportedBlendMode(renderer, blendMode)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    texture.*.blendMode = blendMode;
    if (texture.*.native != null) {
        return SDL_SetTextureBlendMode_REAL(texture.*.native, blendMode);
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextureBlendMode_REAL(texture: [*c]SDL_Texture, blendMode: [*c]SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    if (blendMode != null) {
        blendMode.* = SDL_BLENDMODE_INVALID;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (blendMode != null) {
        blendMode.* = texture.*.blendMode;
    }
    return @"true" != 0;
}
pub export fn SDL_SetTextureScaleMode_REAL(texture: [*c]SDL_Texture, scaleMode: SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (scaleMode) {
                    SDL_SCALEMODE_NEAREST => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDL_SCALEMODE_PIXELART => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDL_SCALEMODE_LINEAR => {
                        sdl_pc = 7;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            4 => {
                texture.*.scaleMode = scaleMode;
                if (texture.*.native != null) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
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
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scaleMode"))));
            },
            9 => {
                return SDL_SetTextureScaleMode_REAL(texture.*.native, scaleMode);
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetTextureScaleMode_REAL(texture: [*c]SDL_Texture, scaleMode: [*c]SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    if (scaleMode != null) {
        scaleMode.* = SDL_SCALEMODE_INVALID;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (scaleMode != null) {
        scaleMode.* = texture.*.scaleMode;
    }
    return @"true" != 0;
}
pub fn SDL_UpdateTextureYUV(texture: [*c]SDL_Texture, arg_rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    var result: bool = @"true" != 0;
    _ = &result;
    if (!SDL_SW_UpdateYUVTexture(texture.*.yuv, rect, pixels, pitch)) {
        return @"false" != 0;
    }
    full_rect.x = 0;
    full_rect.y = 0;
    full_rect.w = texture.*.w;
    full_rect.h = texture.*.h;
    rect = &full_rect;
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        var native_pixels: ?*anyopaque = null;
        _ = &native_pixels;
        var native_pitch: c_int = 0;
        _ = &native_pitch;
        if (!SDL_LockTexture_REAL(native, rect, &native_pixels, &native_pitch)) {
            return @"false" != 0;
        }
        result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, native_pixels, native_pitch);
        SDL_UnlockTexture_REAL(native);
    } else {
        const temp_pitch: c_int = ((rect.*.w * (if ((native.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((native.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((native.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 3)) & ~@as(c_int, 3);
        _ = &temp_pitch;
        const alloclen: usize = @as(usize, @bitCast(@as(c_long, rect.*.h))) *% @as(usize, @bitCast(@as(c_long, temp_pitch)));
        _ = &alloclen;
        if (alloclen > @as(usize, 0)) {
            var temp_pixels: ?*anyopaque = SDL_malloc_REAL(alloclen);
            _ = &temp_pixels;
            if (!(temp_pixels != null)) {
                return @"false" != 0;
            }
            result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, temp_pixels, temp_pitch);
            if (result) {
                _ = SDL_UpdateTexture_REAL(native, rect, temp_pixels, temp_pitch);
            }
            SDL_free_REAL(temp_pixels);
        }
    }
    return result;
}
pub fn SDL_UpdateTexturePaletteSurface(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = texture.*.palette_surface;
    _ = &surface;
    var src: [*c]const Uint8 = @ptrCast(@alignCast(pixels));
    _ = &src;
    var dst: [*c]Uint8 = (@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))), @as(c_int, 8))))));
    _ = &dst;
    var w: c_int = @divTrunc((rect.*.w * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 7), @as(c_int, 8));
    _ = &w;
    var h: c_int = rect.*.h;
    _ = &h;
    while ((blk: {
        const ref = &h;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        _ = memcpy(@ptrCast(@alignCast(dst)), @ptrCast(@alignCast(src)), @bitCast(@as(c_long, w)));
        src += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
        dst += @as(usize, @bitCast(@as(isize, @intCast(surface.*.pitch))));
    }
    texture.*.palette_version = 0;
    return @"true" != 0;
}
pub fn SDL_UpdateTextureNative(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        var native_pixels: ?*anyopaque = null;
        _ = &native_pixels;
        var native_pitch: c_int = 0;
        _ = &native_pitch;
        if (!SDL_LockTexture_REAL(native, rect, &native_pixels, &native_pitch)) {
            return @"false" != 0;
        }
        _ = SDL_ConvertPixelsAndColorspace_REAL(rect.*.w, rect.*.h, texture.*.format, texture.*.colorspace, 0, pixels, pitch, native.*.format, native.*.colorspace, 0, native_pixels, native_pitch);
        SDL_UnlockTexture_REAL(native);
    } else {
        const temp_pitch: c_int = ((rect.*.w * (if ((native.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((native.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((native.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 3)) & ~@as(c_int, 3);
        _ = &temp_pitch;
        const alloclen: usize = @as(usize, @bitCast(@as(c_long, rect.*.h))) *% @as(usize, @bitCast(@as(c_long, temp_pitch)));
        _ = &alloclen;
        if (alloclen > @as(usize, 0)) {
            var temp_pixels: ?*anyopaque = SDL_malloc_REAL(alloclen);
            _ = &temp_pixels;
            if (!(temp_pixels != null)) {
                return @"false" != 0;
            }
            _ = SDL_ConvertPixelsAndColorspace_REAL(rect.*.w, rect.*.h, texture.*.format, texture.*.colorspace, 0, pixels, pitch, native.*.format, native.*.colorspace, 0, temp_pixels, temp_pitch);
            _ = SDL_UpdateTexture_REAL(native, rect, temp_pixels, temp_pitch);
            SDL_free_REAL(temp_pixels);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_UpdateTexture_REAL(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool {
    @setEvalBranchQuota(100000);
    var real_rect: SDL_Rect = undefined;
    _ = &real_rect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (!(pixels != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("pixels"))));
    }
    if (!(pitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("pitch"))));
    }
    real_rect.x = 0;
    real_rect.y = 0;
    real_rect.w = texture.*.w;
    real_rect.h = texture.*.h;
    if (rect != null) {
        if (!SDL_GetRectIntersection_REAL(rect, &real_rect, &real_rect)) {
            return @"true" != 0;
        }
    }
    if ((real_rect.w == @as(c_int, 0)) or (real_rect.h == @as(c_int, 0))) {
        return @"true" != 0;
    } else if (texture.*.yuv != null) {
        return SDL_UpdateTextureYUV(texture, &real_rect, pixels, pitch);
    } else if (texture.*.palette_surface != null) {
        return SDL_UpdateTexturePaletteSurface(texture, &real_rect, pixels, pitch);
    } else if (texture.*.native != null) {
        return SDL_UpdateTextureNative(texture, &real_rect, pixels, pitch);
    } else {
        var renderer: [*c]SDL_Renderer = texture.*.renderer;
        _ = &renderer;
        if (!FlushRenderCommandsIfTextureNeeded(texture)) {
            return @"false" != 0;
        }
        return renderer.*.UpdateTexture.?(renderer, texture, &real_rect, pixels, pitch);
    }
}
pub fn SDL_UpdateTextureYUVPlanar(texture: [*c]SDL_Texture, arg_rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    var result: bool = @"true" != 0;
    _ = &result;
    if (!SDL_SW_UpdateYUVTexturePlanar(texture.*.yuv, rect, Yplane, Ypitch, Uplane, Upitch, Vplane, Vpitch)) {
        return @"false" != 0;
    }
    full_rect.x = 0;
    full_rect.y = 0;
    full_rect.w = texture.*.w;
    full_rect.h = texture.*.h;
    rect = &full_rect;
    if (!(rect.*.w != 0) or !(rect.*.h != 0)) {
        return @"true" != 0;
    }
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        var native_pixels: ?*anyopaque = null;
        _ = &native_pixels;
        var native_pitch: c_int = 0;
        _ = &native_pitch;
        if (!SDL_LockTexture_REAL(native, rect, &native_pixels, &native_pitch)) {
            return @"false" != 0;
        }
        result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, native_pixels, native_pitch);
        SDL_UnlockTexture_REAL(native);
    } else {
        const temp_pitch: c_int = ((rect.*.w * (if ((native.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((native.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((native.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 3)) & ~@as(c_int, 3);
        _ = &temp_pitch;
        const alloclen: usize = @as(usize, @bitCast(@as(c_long, rect.*.h))) *% @as(usize, @bitCast(@as(c_long, temp_pitch)));
        _ = &alloclen;
        if (alloclen > @as(usize, 0)) {
            var temp_pixels: ?*anyopaque = SDL_malloc_REAL(alloclen);
            _ = &temp_pixels;
            if (!(temp_pixels != null)) {
                return @"false" != 0;
            }
            result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, temp_pixels, temp_pitch);
            if (result) {
                _ = SDL_UpdateTexture_REAL(native, rect, temp_pixels, temp_pitch);
            }
            SDL_free_REAL(temp_pixels);
        }
    }
    return result;
}
pub fn SDL_UpdateTextureNVPlanar(texture: [*c]SDL_Texture, arg_rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    var result: bool = @"true" != 0;
    _ = &result;
    if (!SDL_SW_UpdateNVTexturePlanar(texture.*.yuv, rect, Yplane, Ypitch, UVplane, UVpitch)) {
        return @"false" != 0;
    }
    full_rect.x = 0;
    full_rect.y = 0;
    full_rect.w = texture.*.w;
    full_rect.h = texture.*.h;
    rect = &full_rect;
    if (!(rect.*.w != 0) or !(rect.*.h != 0)) {
        return @"true" != 0;
    }
    if (texture.*.access == @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        var native_pixels: ?*anyopaque = null;
        _ = &native_pixels;
        var native_pitch: c_int = 0;
        _ = &native_pitch;
        if (!SDL_LockTexture_REAL(native, rect, &native_pixels, &native_pitch)) {
            return @"false" != 0;
        }
        result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, native_pixels, native_pitch);
        SDL_UnlockTexture_REAL(native);
    } else {
        const temp_pitch: c_int = ((rect.*.w * (if ((native.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((native.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (native.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((native.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) + @as(c_int, 3)) & ~@as(c_int, 3);
        _ = &temp_pitch;
        const alloclen: usize = @as(usize, @bitCast(@as(c_long, rect.*.h))) *% @as(usize, @bitCast(@as(c_long, temp_pitch)));
        _ = &alloclen;
        if (alloclen > @as(usize, 0)) {
            var temp_pixels: ?*anyopaque = SDL_malloc_REAL(alloclen);
            _ = &temp_pixels;
            if (!(temp_pixels != null)) {
                return @"false" != 0;
            }
            result = SDL_SW_CopyYUVToRGB(texture.*.yuv, rect, native.*.format, rect.*.w, rect.*.h, temp_pixels, temp_pitch);
            if (result) {
                _ = SDL_UpdateTexture_REAL(native, rect, temp_pixels, temp_pitch);
            }
            SDL_free_REAL(temp_pixels);
        }
    }
    return result;
}
pub export fn SDL_UpdateYUVTexture_REAL(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, Uplane: [*c]const Uint8, Upitch: c_int, Vplane: [*c]const Uint8, Vpitch: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "SDL_UpdateYUVTexture_REAL".*;
    };
    _ = &static_local___func__;
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var real_rect: SDL_Rect = undefined;
    _ = &real_rect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (!(Yplane != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Yplane"))));
    }
    if (!(Ypitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Ypitch"))));
    }
    if (!(Uplane != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Uplane"))));
    }
    if (!(Upitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Upitch"))));
    }
    if (!(Vplane != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Vplane"))));
    }
    if (!(Vpitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Vpitch"))));
    }
    if (((((texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_YV12)) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_IYUV))) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_I444))) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) {
        return SDL_SetError_REAL("Texture format must be YV12, IYUV, I444, I0FL, or I4FL");
    }
    real_rect.x = 0;
    real_rect.y = 0;
    real_rect.w = texture.*.w;
    real_rect.h = texture.*.h;
    if (rect != null) {
        _ = SDL_GetRectIntersection_REAL(rect, &real_rect, &real_rect);
    }
    if ((real_rect.w == @as(c_int, 0)) or (real_rect.h == @as(c_int, 0))) {
        return @"true" != 0;
    }
    if (texture.*.yuv != null) {
        return SDL_UpdateTextureYUVPlanar(texture, &real_rect, Yplane, Ypitch, Uplane, Upitch, Vplane, Vpitch);
    } else {
        while (true) {
            while (!!(texture.*.native != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!texture->native",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 2624);
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
        renderer = texture.*.renderer;
        while (true) {
            while (!(renderer.*.UpdateTextureYUV != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "renderer->UpdateTextureYUV",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 2626);
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
        if (renderer.*.UpdateTextureYUV != null) {
            if (!FlushRenderCommandsIfTextureNeeded(texture)) {
                return @"false" != 0;
            }
            return renderer.*.UpdateTextureYUV.?(renderer, texture, &real_rect, Yplane, Ypitch, Uplane, Upitch, Vplane, Vpitch);
        } else {
            return SDL_SetError_REAL("That operation is not supported");
        }
    }
    return undefined;
}
pub export fn SDL_UpdateNVTexture_REAL(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const Uint8, Ypitch: c_int, UVplane: [*c]const Uint8, UVpitch: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_UpdateNVTexture_REAL".*;
    };
    _ = &static_local___func__;
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    var real_rect: SDL_Rect = undefined;
    _ = &real_rect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (!(Yplane != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Yplane"))));
    }
    if (!(Ypitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Ypitch"))));
    }
    if (!(UVplane != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("UVplane"))));
    }
    if (!(UVpitch != 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("UVpitch"))));
    }
    if (((texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV12)) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_NV21))) and (texture.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) {
        return SDL_SetError_REAL("Texture format must be NV12, NV21, or P010");
    }
    real_rect.x = 0;
    real_rect.y = 0;
    real_rect.w = texture.*.w;
    real_rect.h = texture.*.h;
    if (rect != null) {
        _ = SDL_GetRectIntersection_REAL(rect, &real_rect, &real_rect);
    }
    if ((real_rect.w == @as(c_int, 0)) or (real_rect.h == @as(c_int, 0))) {
        return @"true" != 0;
    }
    if (texture.*.yuv != null) {
        return SDL_UpdateTextureNVPlanar(texture, &real_rect, Yplane, Ypitch, UVplane, UVpitch);
    } else {
        while (true) {
            while (!!(texture.*.native != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!texture->native",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 2684);
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
        renderer = texture.*.renderer;
        while (true) {
            while (!(renderer.*.UpdateTextureNV != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "renderer->UpdateTextureNV",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 2686);
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
        if (renderer.*.UpdateTextureNV != null) {
            if (!FlushRenderCommandsIfTextureNeeded(texture)) {
                return @"false" != 0;
            }
            return renderer.*.UpdateTextureNV.?(renderer, texture, &real_rect, Yplane, Ypitch, UVplane, UVpitch);
        } else {
            return SDL_SetError_REAL("That operation is not supported");
        }
    }
    return undefined;
}
pub fn SDL_LockTextureYUV(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SW_LockYUVTexture(texture.*.yuv, rect, pixels, pitch);
}
pub fn SDL_LockTexturePaletteSurface(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var surface: [*c]SDL_Surface = texture.*.palette_surface;
    _ = &surface;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * surface.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))), @as(c_int, 8))))))));
    pitch.* = surface.*.pitch;
    return @"true" != 0;
}
pub fn SDL_LockTextureNative(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    texture.*.locked_rect = rect.*;
    pixels.* = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(texture.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * texture.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    pitch.* = texture.*.pitch;
    return @"true" != 0;
}
pub export fn SDL_LockTexture_REAL(texture: [*c]SDL_Texture, arg_rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (texture.*.access != @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        return SDL_SetError_REAL("SDL_LockTexture(): texture must be streaming");
    }
    if (!(rect != null)) {
        full_rect.x = 0;
        full_rect.y = 0;
        full_rect.w = texture.*.w;
        full_rect.h = texture.*.h;
        rect = &full_rect;
    }
    if (texture.*.yuv != null) {
        if (!FlushRenderCommandsIfTextureNeeded(texture)) {
            return @"false" != 0;
        }
        return SDL_LockTextureYUV(texture, rect, pixels, pitch);
    } else if (texture.*.palette_surface != null) {
        return SDL_LockTexturePaletteSurface(texture, rect, pixels, pitch);
    } else if (texture.*.native != null) {
        return SDL_LockTextureNative(texture, rect, pixels, pitch);
    } else {
        var renderer: [*c]SDL_Renderer = texture.*.renderer;
        _ = &renderer;
        if (!FlushRenderCommandsIfTextureNeeded(texture)) {
            return @"false" != 0;
        }
        return renderer.*.LockTexture.?(renderer, texture, rect, pixels, pitch);
    }
}
pub export fn SDL_LockTextureToSurface_REAL(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, surface: [*c][*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var real_rect: SDL_Rect = undefined;
    _ = &real_rect;
    var pixels: ?*anyopaque = null;
    _ = &pixels;
    var pitch: c_int = 0;
    _ = &pitch;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (!(surface != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    real_rect.x = 0;
    real_rect.y = 0;
    real_rect.w = texture.*.w;
    real_rect.h = texture.*.h;
    if (rect != null) {
        _ = SDL_GetRectIntersection_REAL(rect, &real_rect, &real_rect);
    }
    if (!SDL_LockTexture_REAL(texture, &real_rect, &pixels, &pitch)) {
        return @"false" != 0;
    }
    texture.*.locked_surface = SDL_CreateSurfaceFrom_REAL(real_rect.w, real_rect.h, texture.*.format, pixels, pitch);
    if (!(texture.*.locked_surface != null)) {
        SDL_UnlockTexture_REAL(texture);
        return @"false" != 0;
    }
    if (texture.*.public_palette != null) {
        _ = SDL_SetSurfacePalette_REAL(texture.*.locked_surface, texture.*.public_palette);
    }
    surface.* = texture.*.locked_surface;
    return @"true" != 0;
}
pub fn SDL_UnlockTextureYUV(texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    var native_pixels: ?*anyopaque = null;
    _ = &native_pixels;
    var native_pitch: c_int = 0;
    _ = &native_pitch;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    rect.x = 0;
    rect.y = 0;
    rect.w = texture.*.w;
    rect.h = texture.*.h;
    if (!SDL_LockTexture_REAL(native, &rect, &native_pixels, &native_pitch)) {
        return;
    }
    _ = SDL_SW_CopyYUVToRGB(texture.*.yuv, &rect, native.*.format, rect.w, rect.h, native_pixels, native_pitch);
    SDL_UnlockTexture_REAL(native);
}
pub fn SDL_UnlockTexturePaletteSurface(texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    texture.*.palette_version = 0;
}
pub fn SDL_UnlockTextureNative(texture: [*c]SDL_Texture) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var native: [*c]SDL_Texture = texture.*.native;
    _ = &native;
    var native_pixels: ?*anyopaque = null;
    _ = &native_pixels;
    var native_pitch: c_int = 0;
    _ = &native_pitch;
    var rect: [*c]const SDL_Rect = &texture.*.locked_rect;
    _ = &rect;
    var pixels: ?*const anyopaque = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(texture.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.y * texture.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.*.x * (if ((texture.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (texture.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((texture.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))))))));
    _ = &pixels;
    var pitch: c_int = texture.*.pitch;
    _ = &pitch;
    if (!SDL_LockTexture_REAL(native, rect, &native_pixels, &native_pitch)) {
        return;
    }
    _ = SDL_ConvertPixels_REAL(rect.*.w, rect.*.h, texture.*.format, pixels, pitch, native.*.format, native_pixels, native_pitch);
    SDL_UnlockTexture_REAL(native);
}
pub export fn SDL_UnlockTexture_REAL(texture: [*c]SDL_Texture) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return;
    }
    if (texture.*.access != @as(SDL_TextureAccess, SDL_TEXTUREACCESS_STREAMING)) {
        return;
    }
    if (texture.*.yuv != null) {
        SDL_UnlockTextureYUV(texture);
    } else if (texture.*.palette_surface != null) {
        SDL_UnlockTexturePaletteSurface(texture);
    } else if (texture.*.native != null) {
        SDL_UnlockTextureNative(texture);
    } else {
        var renderer: [*c]SDL_Renderer = texture.*.renderer;
        _ = &renderer;
        renderer.*.UnlockTexture.?(renderer, texture);
    }
    if (texture.*.locked_surface != null) {
        SDL_DestroySurface_REAL(texture.*.locked_surface);
        texture.*.locked_surface = null;
    }
}
pub export fn SDL_SetRenderTarget_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (texture != null) {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
            return @"false" != 0;
        }
        if (renderer != texture.*.renderer) {
            return SDL_SetError_REAL("Texture was not created with this renderer");
        }
        if (texture.*.access != @as(SDL_TextureAccess, SDL_TEXTUREACCESS_TARGET)) {
            return SDL_SetError_REAL("Texture not created with SDL_TEXTUREACCESS_TARGET");
        }
        if (texture.*.native != null) {
            texture = texture.*.native;
        }
    }
    if (texture == renderer.*.target) {
        return @"true" != 0;
    }
    _ = FlushRenderCommands(renderer);
    SDL_LockMutex_REAL(renderer.*.target_mutex);
    renderer.*.target = texture;
    if (texture != null) {
        renderer.*.view = &texture.*.view;
        renderer.*.current_colorspace = texture.*.colorspace;
    } else {
        renderer.*.view = &renderer.*.main_view;
        renderer.*.current_colorspace = renderer.*.output_colorspace;
    }
    UpdateColorScale(renderer);
    if (!renderer.*.SetRenderTarget.?(renderer, texture)) {
        SDL_UnlockMutex_REAL(renderer.*.target_mutex);
        return @"false" != 0;
    }
    SDL_UnlockMutex_REAL(renderer.*.target_mutex);
    if (!QueueCmdSetViewport(renderer)) {
        return @"false" != 0;
    }
    if (!QueueCmdSetClipRect(renderer)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetRenderTarget_REAL(renderer: [*c]SDL_Renderer) [*c]SDL_Texture {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (!(renderer.*.target != null)) {
        return null;
    }
    return @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetTextureProperties_REAL(renderer.*.target), "SDL.internal.texture.parent", @ptrCast(@alignCast(renderer.*.target)))));
}
pub fn UpdateLogicalPresentation(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "UpdateLogicalPresentation".*;
    };
    _ = &static_local___func__;
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const is_main_view: bool = view == (&renderer.*.main_view);
    _ = &is_main_view;
    const logical_w: f32 = @floatFromInt(view.*.logical_w);
    _ = &logical_w;
    const logical_h: f32 = @floatFromInt(view.*.logical_h);
    _ = &logical_h;
    var iwidth: c_int = undefined;
    _ = &iwidth;
    var iheight: c_int = undefined;
    _ = &iheight;
    if (is_main_view) {
        _ = SDL_GetRenderOutputSize_REAL(renderer, &iwidth, &iheight);
    } else {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.target))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "renderer->target != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 2956);
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
        iwidth = renderer.*.target.*.w;
        iheight = renderer.*.target.*.h;
    }
    view.*.logical_src_rect.x = 0.0;
    view.*.logical_src_rect.y = 0.0;
    view.*.logical_src_rect.w = logical_w;
    view.*.logical_src_rect.h = logical_h;
    if (view.*.logical_presentation_mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED)) {
        view.*.logical_dst_rect.x = 0.0;
        view.*.logical_dst_rect.y = 0.0;
        view.*.logical_dst_rect.w = @floatFromInt(iwidth);
        view.*.logical_dst_rect.h = @floatFromInt(iheight);
        view.*.logical_offset.x = blk: {
            const tmp = @as(f32, 0.0);
            view.*.logical_offset.y = tmp;
            break :blk tmp;
        };
        view.*.logical_scale.x = blk: {
            const tmp = @as(f32, 1.0);
            view.*.logical_scale.y = tmp;
            break :blk tmp;
        };
        view.*.current_scale.x = view.*.scale.x;
        view.*.current_scale.y = view.*.scale.y;
    } else {
        const output_w: f32 = @floatFromInt(iwidth);
        _ = &output_w;
        const output_h: f32 = @floatFromInt(iheight);
        _ = &output_h;
        const want_aspect: f32 = logical_w / logical_h;
        _ = &want_aspect;
        const real_aspect: f32 = output_w / output_h;
        _ = &real_aspect;
        if ((logical_w <= @as(f32, 0.0)) or (logical_h <= @as(f32, 0.0))) {
            view.*.logical_dst_rect.x = 0.0;
            view.*.logical_dst_rect.y = 0.0;
            view.*.logical_dst_rect.w = output_w;
            view.*.logical_dst_rect.h = output_h;
        } else if (view.*.logical_presentation_mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_INTEGER_SCALE)) {
            var scale: f32 = undefined;
            _ = &scale;
            if (want_aspect > real_aspect) {
                scale = @floatFromInt(@divTrunc(@as(c_int, @intFromFloat(output_w)), @as(c_int, @intFromFloat(logical_w))));
            } else {
                scale = @floatFromInt(@divTrunc(@as(c_int, @intFromFloat(output_h)), @as(c_int, @intFromFloat(logical_h))));
            }
            if (scale < @as(f32, 1.0)) {
                scale = 1.0;
            }
            view.*.logical_dst_rect.w = SDL_floorf_REAL(logical_w * scale);
            view.*.logical_dst_rect.x = (output_w - view.*.logical_dst_rect.w) / @as(f32, 2.0);
            view.*.logical_dst_rect.h = SDL_floorf_REAL(logical_h * scale);
            view.*.logical_dst_rect.y = (output_h - view.*.logical_dst_rect.h) / @as(f32, 2.0);
        } else if ((view.*.logical_presentation_mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_STRETCH)) or (SDL_fabsf_REAL(want_aspect - real_aspect) < @as(f32, 0.0001))) {
            view.*.logical_dst_rect.x = 0.0;
            view.*.logical_dst_rect.y = 0.0;
            view.*.logical_dst_rect.w = output_w;
            view.*.logical_dst_rect.h = output_h;
        } else if (want_aspect > real_aspect) {
            if (view.*.logical_presentation_mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_LETTERBOX)) {
                const scale: f32 = output_w / logical_w;
                _ = &scale;
                view.*.logical_dst_rect.x = 0.0;
                view.*.logical_dst_rect.w = output_w;
                view.*.logical_dst_rect.h = SDL_floorf_REAL(logical_h * scale);
                view.*.logical_dst_rect.y = (output_h - view.*.logical_dst_rect.h) / @as(f32, 2.0);
            } else {
                const scale: f32 = output_h / logical_h;
                _ = &scale;
                view.*.logical_dst_rect.y = 0.0;
                view.*.logical_dst_rect.h = output_h;
                view.*.logical_dst_rect.w = SDL_floorf_REAL(logical_w * scale);
                view.*.logical_dst_rect.x = (output_w - view.*.logical_dst_rect.w) / @as(f32, 2.0);
            }
        } else {
            if (view.*.logical_presentation_mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_LETTERBOX)) {
                const scale: f32 = output_h / logical_h;
                _ = &scale;
                view.*.logical_dst_rect.y = 0.0;
                view.*.logical_dst_rect.h = output_h;
                view.*.logical_dst_rect.w = SDL_floorf_REAL(logical_w * scale);
                view.*.logical_dst_rect.x = (output_w - view.*.logical_dst_rect.w) / @as(f32, 2.0);
            } else {
                const scale: f32 = output_w / logical_w;
                _ = &scale;
                view.*.logical_dst_rect.x = 0.0;
                view.*.logical_dst_rect.w = output_w;
                view.*.logical_dst_rect.h = SDL_floorf_REAL(logical_h * scale);
                view.*.logical_dst_rect.y = (output_h - view.*.logical_dst_rect.h) / @as(f32, 2.0);
            }
        }
        view.*.logical_scale.x = if (logical_w > @as(f32, 0.0)) view.*.logical_dst_rect.w / logical_w else @as(f32, 0.0);
        view.*.logical_scale.y = if (logical_h > @as(f32, 0.0)) view.*.logical_dst_rect.h / logical_h else @as(f32, 0.0);
        view.*.current_scale.x = view.*.scale.x * view.*.logical_scale.x;
        view.*.current_scale.y = view.*.scale.y * view.*.logical_scale.y;
        view.*.logical_offset.x = view.*.logical_dst_rect.x;
        view.*.logical_offset.y = view.*.logical_dst_rect.y;
    }
    if (is_main_view) {
        UpdateMainViewDimensions(renderer);
    }
    view.*.pixel_w = @intFromFloat(view.*.logical_dst_rect.w);
    view.*.pixel_h = @intFromFloat(view.*.logical_dst_rect.h);
    UpdatePixelViewport(renderer, view);
    UpdatePixelClipRect(renderer, view);
    _ = QueueCmdSetViewport(renderer);
    _ = QueueCmdSetClipRect(renderer);
}
pub export fn SDL_SetRenderLogicalPresentation_REAL(renderer: [*c]SDL_Renderer, w: c_int, h: c_int, mode: SDL_RendererLogicalPresentation) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (mode == @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED)) {
        view.*.logical_w = 0;
        view.*.logical_h = 0;
    } else {
        view.*.logical_w = w;
        view.*.logical_h = h;
    }
    view.*.logical_presentation_mode = mode;
    UpdateLogicalPresentation(renderer);
    return @"true" != 0;
}
pub export fn SDL_GetRenderLogicalPresentation_REAL(renderer: [*c]SDL_Renderer, w: [*c]c_int, h: [*c]c_int, mode: [*c]SDL_RendererLogicalPresentation) bool {
    @setEvalBranchQuota(100000);
    if (w != null) {
        w.* = 0;
    }
    if (h != null) {
        h.* = 0;
    }
    if (mode != null) {
        mode.* = SDL_LOGICAL_PRESENTATION_DISABLED;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (w != null) {
        w.* = view.*.logical_w;
    }
    if (h != null) {
        h.* = view.*.logical_h;
    }
    if (mode != null) {
        mode.* = view.*.logical_presentation_mode;
    }
    return @"true" != 0;
}
pub export fn SDL_GetRenderLogicalPresentationRect_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (rect != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(rect.*)) == @sizeOf(@TypeOf((&renderer.*.view.*.logical_dst_rect).*)))) @compileError("static assertion failed \"sizeof (*(rect)) == sizeof (*( &renderer->view->logical_dst_rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(rect)), @ptrCast(@alignCast(&renderer.*.view.*.logical_dst_rect)), @sizeOf(@TypeOf((&renderer.*.view.*.logical_dst_rect).*)));
    }
    return @"true" != 0;
}
pub fn SDL_RenderVectorFromWindow(renderer: [*c]SDL_Renderer, arg_window_dx: f32, arg_window_dy: f32, dx: [*c]f32, dy: [*c]f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var window_dx = arg_window_dx;
    _ = &window_dx;
    var window_dy = arg_window_dy;
    _ = &window_dy;
    window_dx *= renderer.*.dpi_scale.x;
    window_dy *= renderer.*.dpi_scale.y;
    var view: [*c]const SDL_RenderViewState = &renderer.*.main_view;
    _ = &view;
    if (view.*.logical_presentation_mode != @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED)) {
        var src: [*c]const SDL_FRect = &view.*.logical_src_rect;
        _ = &src;
        var dst: [*c]const SDL_FRect = &view.*.logical_dst_rect;
        _ = &dst;
        window_dx = (window_dx * src.*.w) / dst.*.w;
        window_dy = (window_dy * src.*.h) / dst.*.h;
    }
    window_dx /= view.*.scale.x;
    window_dy /= view.*.scale.y;
    dx.* = window_dx;
    dy.* = window_dy;
    return @"true" != 0;
}
pub export fn SDL_RenderCoordinatesFromWindow_REAL(renderer: [*c]SDL_Renderer, window_x: f32, window_y: f32, x: [*c]f32, y: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var render_x: f32 = undefined;
    _ = &render_x;
    var render_y: f32 = undefined;
    _ = &render_y;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    render_x = window_x * renderer.*.dpi_scale.x;
    render_y = window_y * renderer.*.dpi_scale.y;
    var view: [*c]const SDL_RenderViewState = &renderer.*.main_view;
    _ = &view;
    if (view.*.logical_presentation_mode != @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED)) {
        var src: [*c]const SDL_FRect = &view.*.logical_src_rect;
        _ = &src;
        var dst: [*c]const SDL_FRect = &view.*.logical_dst_rect;
        _ = &dst;
        render_x = ((render_x - dst.*.x) * src.*.w) / dst.*.w;
        render_y = ((render_y - dst.*.y) * src.*.h) / dst.*.h;
    }
    render_x = (render_x / view.*.scale.x) - view.*.viewport.x;
    render_y = (render_y / view.*.scale.y) - view.*.viewport.y;
    if (x != null) {
        x.* = render_x;
    }
    if (y != null) {
        y.* = render_y;
    }
    return @"true" != 0;
}
pub export fn SDL_RenderCoordinatesToWindow_REAL(renderer: [*c]SDL_Renderer, arg_x: f32, arg_y: f32, window_x: [*c]f32, window_y: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = &renderer.*.main_view;
    _ = &view;
    x = (view.*.viewport.x + x) * view.*.scale.x;
    y = (view.*.viewport.y + y) * view.*.scale.y;
    if (view.*.logical_presentation_mode != @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED)) {
        var src: [*c]const SDL_FRect = &view.*.logical_src_rect;
        _ = &src;
        var dst: [*c]const SDL_FRect = &view.*.logical_dst_rect;
        _ = &dst;
        x = dst.*.x + ((x * dst.*.w) / src.*.w);
        y = dst.*.y + ((y * dst.*.h) / src.*.h);
    }
    x /= renderer.*.dpi_scale.x;
    y /= renderer.*.dpi_scale.y;
    if (window_x != null) {
        window_x.* = x;
    }
    if (window_y != null) {
        window_y.* = y;
    }
    return @"true" != 0;
}
pub export fn SDL_ConvertEventToRenderCoordinates_REAL(renderer: [*c]SDL_Renderer, event: [*c]SDL_Event) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (event.*.type == @as(Uint32, SDL_EVENT_MOUSE_MOTION)) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.motion.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.motion.x, event.*.motion.y, &event.*.motion.x, &event.*.motion.y);
            _ = SDL_RenderVectorFromWindow(renderer, event.*.motion.xrel, event.*.motion.yrel, &event.*.motion.xrel, &event.*.motion.yrel);
        }
    } else if ((event.*.type == @as(Uint32, SDL_EVENT_MOUSE_BUTTON_DOWN)) or (event.*.type == @as(Uint32, SDL_EVENT_MOUSE_BUTTON_UP))) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.button.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.button.x, event.*.button.y, &event.*.button.x, &event.*.button.y);
        }
    } else if (event.*.type == @as(Uint32, SDL_EVENT_MOUSE_WHEEL)) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.wheel.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.wheel.mouse_x, event.*.wheel.mouse_y, &event.*.wheel.mouse_x, &event.*.wheel.mouse_y);
        }
    } else if ((((event.*.type == @as(Uint32, SDL_EVENT_FINGER_DOWN)) or (event.*.type == @as(Uint32, SDL_EVENT_FINGER_UP))) or (event.*.type == @as(Uint32, SDL_EVENT_FINGER_CANCELED))) or (event.*.type == @as(Uint32, SDL_EVENT_FINGER_MOTION))) {
        if (renderer.*.window != null) {
            var w: c_int = undefined;
            _ = &w;
            var h: c_int = undefined;
            _ = &h;
            if (!SDL_GetWindowSize_REAL(renderer.*.window, &w, &h)) {
                return @"false" != 0;
            }
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.tfinger.x * @as(f32, @floatFromInt(w)), event.*.tfinger.y * @as(f32, @floatFromInt(h)), &event.*.tfinger.x, &event.*.tfinger.y);
            _ = SDL_RenderVectorFromWindow(renderer, event.*.tfinger.dx * @as(f32, @floatFromInt(w)), event.*.tfinger.dy * @as(f32, @floatFromInt(h)), &event.*.tfinger.dx, &event.*.tfinger.dy);
        }
    } else if (event.*.type == @as(Uint32, SDL_EVENT_PEN_MOTION)) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.pmotion.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.pmotion.x, event.*.pmotion.y, &event.*.pmotion.x, &event.*.pmotion.y);
        }
    } else if ((event.*.type == @as(Uint32, SDL_EVENT_PEN_DOWN)) or (event.*.type == @as(Uint32, SDL_EVENT_PEN_UP))) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.ptouch.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.ptouch.x, event.*.ptouch.y, &event.*.ptouch.x, &event.*.ptouch.y);
        }
    } else if ((event.*.type == @as(Uint32, SDL_EVENT_PEN_BUTTON_DOWN)) or (event.*.type == @as(Uint32, SDL_EVENT_PEN_BUTTON_UP))) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.pbutton.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.pbutton.x, event.*.pbutton.y, &event.*.pbutton.x, &event.*.pbutton.y);
        }
    } else if (event.*.type == @as(Uint32, SDL_EVENT_PEN_AXIS)) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.paxis.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.paxis.x, event.*.paxis.y, &event.*.paxis.x, &event.*.paxis.y);
        }
    } else if ((((event.*.type == @as(Uint32, SDL_EVENT_DROP_POSITION)) or (event.*.type == @as(Uint32, SDL_EVENT_DROP_FILE))) or (event.*.type == @as(Uint32, SDL_EVENT_DROP_TEXT))) or (event.*.type == @as(Uint32, SDL_EVENT_DROP_COMPLETE))) {
        var window: ?*SDL_Window = SDL_GetWindowFromID_REAL(event.*.drop.windowID);
        _ = &window;
        if (window == renderer.*.window) {
            _ = SDL_RenderCoordinatesFromWindow_REAL(renderer, event.*.drop.x, event.*.drop.y, &event.*.drop.x, &event.*.drop.y);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetRenderViewport_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        var frect: SDL_FRect = undefined;
        _ = &frect;
        SDL_RectToFRect(rect, &frect);
        return SDL_SetRenderViewportFloat_REAL(renderer, &frect);
    } else {
        return SDL_SetRenderViewportFloat_REAL(renderer, null);
    }
}
pub export fn SDL_GetRenderViewport_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    var frect: SDL_FRect = undefined;
    _ = &frect;
    if (SDL_GetRenderViewportFloat_REAL(renderer, &frect)) {
        if (rect != null) {
            rect.*.x = @intFromFloat(SDL_floorf_REAL(frect.x));
            rect.*.y = @intFromFloat(SDL_floorf_REAL(frect.y));
            rect.*.w = @intFromFloat(SDL_ceilf_REAL(frect.w));
            rect.*.h = @intFromFloat(SDL_ceilf_REAL(frect.h));
        }
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub export fn SDL_SetRenderViewportFloat_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (rect != null) {
        if ((rect.*.w < @as(f32, 0.0)) or (rect.*.h < @as(f32, 0.0))) {
            return SDL_SetError_REAL("rect has a negative size");
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&view.*.viewport).*)) == @sizeOf(@TypeOf(rect.*)))) @compileError("static assertion failed \"sizeof (*(&view->viewport)) == sizeof (*( rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&view.*.viewport)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
    } else {
        view.*.viewport.x = blk: {
            const tmp = @as(f32, 0.0);
            view.*.viewport.y = tmp;
            break :blk tmp;
        };
        view.*.viewport.w = blk: {
            const tmp = -@as(f32, 1.0);
            view.*.viewport.h = tmp;
            break :blk tmp;
        };
    }
    UpdatePixelViewport(renderer, view);
    return QueueCmdSetViewport(renderer);
}
pub export fn SDL_GetRenderViewportFloat_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (rect != null) {
        var view: [*c]const SDL_RenderViewState = renderer.*.view;
        _ = &view;
        rect.*.x = view.*.viewport.x;
        rect.*.y = view.*.viewport.y;
        if (view.*.viewport.w >= @as(f32, 0.0)) {
            rect.*.w = view.*.viewport.w;
        } else {
            rect.*.w = @as(f32, @floatFromInt(view.*.pixel_w)) / view.*.current_scale.x;
        }
        if (view.*.viewport.h >= @as(f32, 0.0)) {
            rect.*.h = view.*.viewport.h;
        } else {
            rect.*.h = @as(f32, @floatFromInt(view.*.pixel_h)) / view.*.current_scale.y;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_RenderViewportSet_REAL(renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    return (view.*.viewport.w >= @as(f32, 0.0)) and (view.*.viewport.h >= @as(f32, 0.0));
}
pub fn GetRenderViewportSize(renderer: [*c]SDL_Renderer, rect: [*c]SDL_FRect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    rect.*.x = 0.0;
    rect.*.y = 0.0;
    if (view.*.viewport.w >= @as(f32, 0.0)) {
        rect.*.w = view.*.viewport.w;
    } else {
        rect.*.w = @as(f32, @floatFromInt(view.*.pixel_w)) / scale_x;
    }
    if (view.*.viewport.h >= @as(f32, 0.0)) {
        rect.*.h = view.*.viewport.h;
    } else {
        rect.*.h = @as(f32, @floatFromInt(view.*.pixel_h)) / scale_y;
    }
}
pub export fn SDL_GetRenderSafeArea_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if ((renderer.*.target != null) or !(renderer.*.window != null)) {
        return SDL_GetRenderViewport_REAL(renderer, rect);
    }
    if (rect != null) {
        var safe: SDL_Rect = undefined;
        _ = &safe;
        if (!SDL_GetWindowSafeArea_REAL(renderer.*.window, &safe)) {
            return @"false" != 0;
        }
        var minx: f32 = @floatFromInt(safe.x);
        _ = &minx;
        var miny: f32 = @floatFromInt(safe.y);
        _ = &miny;
        var maxx: f32 = @as(f32, @floatFromInt(safe.x)) + @as(f32, @floatFromInt(safe.w));
        _ = &maxx;
        var maxy: f32 = @as(f32, @floatFromInt(safe.y)) + @as(f32, @floatFromInt(safe.h));
        _ = &maxy;
        if (!SDL_RenderCoordinatesFromWindow_REAL(renderer, minx, miny, &minx, &miny) or !SDL_RenderCoordinatesFromWindow_REAL(renderer, maxx, maxy, &maxx, &maxy)) {
            return @"false" != 0;
        }
        rect.*.x = @intFromFloat(SDL_ceilf_REAL(minx));
        rect.*.y = @intFromFloat(SDL_ceilf_REAL(miny));
        rect.*.w = @intFromFloat(SDL_ceilf_REAL(maxx - minx));
        rect.*.h = @intFromFloat(SDL_ceilf_REAL(maxy - miny));
        var viewport: SDL_Rect = undefined;
        _ = &viewport;
        if (!SDL_GetRenderViewport_REAL(renderer, &viewport)) {
            return @"false" != 0;
        }
        if (!SDL_GetRectIntersection_REAL(rect, &viewport, rect)) {
            return SDL_SetError_REAL("No safe area within viewport");
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetRenderClipRect_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        var frect: SDL_FRect = undefined;
        _ = &frect;
        SDL_RectToFRect(rect, &frect);
        return SDL_SetRenderClipRectFloat_REAL(renderer, &frect);
    } else {
        return SDL_SetRenderClipRectFloat_REAL(renderer, null);
    }
}
pub export fn SDL_GetRenderClipRect_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    var frect: SDL_FRect = undefined;
    _ = &frect;
    if (SDL_GetRenderClipRectFloat_REAL(renderer, &frect)) {
        rect.*.x = @intFromFloat(SDL_floorf_REAL(frect.x));
        rect.*.y = @intFromFloat(SDL_floorf_REAL(frect.y));
        rect.*.w = @intFromFloat(SDL_ceilf_REAL(frect.w));
        rect.*.h = @intFromFloat(SDL_ceilf_REAL(frect.h));
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub export fn SDL_SetRenderClipRectFloat_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (((rect != null) and (rect.*.w >= @as(f32, 0.0))) and (rect.*.h >= @as(f32, 0.0))) {
        view.*.clipping_enabled = @"true" != 0;
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&view.*.clip_rect).*)) == @sizeOf(@TypeOf(rect.*)))) @compileError("static assertion failed \"sizeof (*(&view->clip_rect)) == sizeof (*( rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&view.*.clip_rect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
    } else {
        view.*.clipping_enabled = @"false" != 0;
        _ = memset(@ptrCast(@alignCast(&view.*.clip_rect)), 0, @sizeOf(@TypeOf(view.*.clip_rect)));
    }
    UpdatePixelClipRect(renderer, view);
    return QueueCmdSetClipRect(renderer);
}
pub export fn SDL_GetRenderClipRectFloat_REAL(renderer: [*c]SDL_Renderer, rect: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (rect != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(rect.*)) == @sizeOf(@TypeOf((&renderer.*.view.*.clip_rect).*)))) @compileError("static assertion failed \"sizeof (*(rect)) == sizeof (*( &renderer->view->clip_rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(rect)), @ptrCast(@alignCast(&renderer.*.view.*.clip_rect)), @sizeOf(@TypeOf((&renderer.*.view.*.clip_rect).*)));
    }
    return @"true" != 0;
}
pub export fn SDL_RenderClipEnabled_REAL(renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    return renderer.*.view.*.clipping_enabled;
}
pub export fn SDL_SetRenderScale_REAL(renderer: [*c]SDL_Renderer, scaleX: f32, scaleY: f32) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if ((view.*.scale.x == scaleX) and (view.*.scale.y == scaleY)) {
        return @"true" != 0;
    }
    view.*.scale.x = scaleX;
    view.*.scale.y = scaleY;
    view.*.current_scale.x = scaleX * view.*.logical_scale.x;
    view.*.current_scale.y = scaleY * view.*.logical_scale.y;
    UpdatePixelViewport(renderer, view);
    UpdatePixelClipRect(renderer, view);
    {
        const ref = &result;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(QueueCmdSetViewport(renderer)))) != 0;
    }
    {
        const ref = &result;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(QueueCmdSetClipRect(renderer)))) != 0;
    }
    return result;
}
pub export fn SDL_GetRenderScale_REAL(renderer: [*c]SDL_Renderer, scaleX: [*c]f32, scaleY: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    if (scaleX != null) {
        scaleX.* = 1.0;
    }
    if (scaleY != null) {
        scaleY.* = 1.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if (scaleX != null) {
        scaleX.* = view.*.scale.x;
    }
    if (scaleY != null) {
        scaleY.* = view.*.scale.y;
    }
    return @"true" != 0;
}
pub export fn SDL_SetRenderDrawColor_REAL(renderer: [*c]SDL_Renderer, r: Uint8, g: Uint8, b: Uint8, a: Uint8) bool {
    @setEvalBranchQuota(100000);
    const fR: f32 = @as(f32, @floatFromInt(r)) / @as(f32, 255.0);
    _ = &fR;
    const fG: f32 = @as(f32, @floatFromInt(g)) / @as(f32, 255.0);
    _ = &fG;
    const fB: f32 = @as(f32, @floatFromInt(b)) / @as(f32, 255.0);
    _ = &fB;
    const fA: f32 = @as(f32, @floatFromInt(a)) / @as(f32, 255.0);
    _ = &fA;
    return SDL_SetRenderDrawColorFloat_REAL(renderer, fR, fG, fB, fA);
}
pub export fn SDL_SetRenderDrawColorFloat_REAL(renderer: [*c]SDL_Renderer, r: f32, g: f32, b: f32, a: f32) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    renderer.*.color.r = r;
    renderer.*.color.g = g;
    renderer.*.color.b = b;
    renderer.*.color.a = a;
    return @"true" != 0;
}
pub export fn SDL_GetRenderDrawColor_REAL(renderer: [*c]SDL_Renderer, r: [*c]Uint8, g: [*c]Uint8, b: [*c]Uint8, a: [*c]Uint8) bool {
    @setEvalBranchQuota(100000);
    var fR: f32 = undefined;
    _ = &fR;
    var fG: f32 = undefined;
    _ = &fG;
    var fB: f32 = undefined;
    _ = &fB;
    var fA: f32 = undefined;
    _ = &fA;
    if (!SDL_GetRenderDrawColorFloat_REAL(renderer, &fR, &fG, &fB, &fA)) {
        if (r != null) {
            r.* = 0;
        }
        if (g != null) {
            g.* = 0;
        }
        if (b != null) {
            b.* = 0;
        }
        if (a != null) {
            a.* = 0;
        }
        return @"false" != 0;
    }
    if (r != null) {
        r.* = @intFromFloat(fR * @as(f32, 255.0));
    }
    if (g != null) {
        g.* = @intFromFloat(fG * @as(f32, 255.0));
    }
    if (b != null) {
        b.* = @intFromFloat(fB * @as(f32, 255.0));
    }
    if (a != null) {
        a.* = @intFromFloat(fA * @as(f32, 255.0));
    }
    return @"true" != 0;
}
pub export fn SDL_GetRenderDrawColorFloat_REAL(renderer: [*c]SDL_Renderer, r: [*c]f32, g: [*c]f32, b: [*c]f32, a: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    var color: SDL_FColor = undefined;
    _ = &color;
    if (r != null) {
        r.* = 0.0;
    }
    if (g != null) {
        g.* = 0.0;
    }
    if (b != null) {
        b.* = 0.0;
    }
    if (a != null) {
        a.* = 0.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    color = renderer.*.color;
    if (r != null) {
        r.* = color.r;
    }
    if (g != null) {
        g.* = color.g;
    }
    if (b != null) {
        b.* = color.b;
    }
    if (a != null) {
        a.* = color.a;
    }
    return @"true" != 0;
}
pub export fn SDL_SetRenderColorScale_REAL(renderer: [*c]SDL_Renderer, scale: f32) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    renderer.*.desired_color_scale = scale;
    UpdateColorScale(renderer);
    return @"true" != 0;
}
pub export fn SDL_GetRenderColorScale_REAL(renderer: [*c]SDL_Renderer, scale: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    if (scale != null) {
        scale.* = 1.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (scale != null) {
        scale.* = renderer.*.desired_color_scale;
    }
    return @"true" != 0;
}
pub export fn SDL_SetRenderDrawBlendMode_REAL(renderer: [*c]SDL_Renderer, blendMode: SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (blendMode == SDL_BLENDMODE_INVALID) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("blendMode"))));
    }
    if (!IsSupportedBlendMode(renderer, blendMode)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    renderer.*.blendMode = blendMode;
    return @"true" != 0;
}
pub export fn SDL_GetRenderDrawBlendMode_REAL(renderer: [*c]SDL_Renderer, blendMode: [*c]SDL_BlendMode) bool {
    @setEvalBranchQuota(100000);
    if (blendMode != null) {
        blendMode.* = SDL_BLENDMODE_INVALID;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (blendMode != null) {
        blendMode.* = renderer.*.blendMode;
    }
    return @"true" != 0;
}
pub export fn SDL_RenderClear_REAL(renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    return QueueCmdClear(renderer);
}
pub export fn SDL_RenderPoint_REAL(renderer: [*c]SDL_Renderer, x: f32, y: f32) bool {
    @setEvalBranchQuota(100000);
    var fpoint: SDL_FPoint = undefined;
    _ = &fpoint;
    fpoint.x = x;
    fpoint.y = y;
    return SDL_RenderPoints_REAL(renderer, &fpoint, 1);
}
pub fn RenderPointsWithRects(renderer: [*c]SDL_Renderer, fpoints: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &count;
    var result: bool = undefined;
    _ = &result;
    var isstack: bool = undefined;
    _ = &isstack;
    var frects: [*c]SDL_FRect = undefined;
    _ = &frects;
    var i: c_int = undefined;
    _ = &i;
    if (count < @as(c_int, 1)) {
        return @"true" != 0;
    }
    frects = blk: {
        (&isstack).* = (@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count))))))) else @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count)))))));
    };
    if (!(frects != null)) {
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    {
        i = 0;
        while (i < count) : (i += 1) {
            frects[@bitCast(@as(isize, @intCast(i)))].x = fpoints[@bitCast(@as(isize, @intCast(i)))].x * scale_x;
            frects[@bitCast(@as(isize, @intCast(i)))].y = fpoints[@bitCast(@as(isize, @intCast(i)))].y * scale_y;
            frects[@bitCast(@as(isize, @intCast(i)))].w = scale_x;
            frects[@bitCast(@as(isize, @intCast(i)))].h = scale_y;
        }
    }
    result = QueueCmdFillRects(renderer, frects, count);
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    }
    return result;
}
pub export fn SDL_RenderPoints_REAL(renderer: [*c]SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(points != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_RenderPoints(): points"))));
    }
    if (count < @as(c_int, 1)) {
        return @"true" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    if ((view.*.current_scale.x != @as(f32, 1.0)) or (view.*.current_scale.y != @as(f32, 1.0))) {
        result = RenderPointsWithRects(renderer, points, count);
    } else {
        result = QueueCmdDrawPoints(renderer, points, count);
    }
    return result;
}
pub export fn SDL_RenderLine_REAL(renderer: [*c]SDL_Renderer, x1: f32, y1_1: f32, x2: f32, y2: f32) bool {
    @setEvalBranchQuota(100000);
    var points: [2]SDL_FPoint = undefined;
    _ = &points;
    points[@as(c_int, 0)].x = x1;
    points[@as(c_int, 0)].y = y1_1;
    points[@as(c_int, 1)].x = x2;
    points[@as(c_int, 1)].y = y2;
    return SDL_RenderLines_REAL(renderer, @ptrCast(@alignCast(&points)), 2);
}
pub fn RenderLineBresenham(renderer: [*c]SDL_Renderer, arg_x1: c_int, arg_y1_1: c_int, arg_x2: c_int, arg_y2: c_int, draw_last: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x1 = arg_x1;
    _ = &x1;
    var y1_1 = arg_y1_1;
    _ = &y1_1;
    var x2 = arg_x2;
    _ = &x2;
    var y2 = arg_y2;
    _ = &y2;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const MAX_PIXELS: c_int = (if (view.*.pixel_w > view.*.pixel_h) view.*.pixel_w else view.*.pixel_h) * @as(c_int, 4);
    _ = &MAX_PIXELS;
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
    var result: bool = undefined;
    _ = &result;
    var isstack: bool = undefined;
    _ = &isstack;
    var points: [*c]SDL_FPoint = undefined;
    _ = &points;
    var viewport: SDL_Rect = undefined;
    _ = &viewport;
    viewport = view.*.pixel_viewport;
    viewport.x = 0;
    viewport.y = 0;
    if (!SDL_GetRectAndLineIntersection_REAL(&viewport, &x1, &y1_1, &x2, &y2)) {
        return @"true" != 0;
    }
    deltax = SDL_abs_REAL(x2 - x1);
    deltay = SDL_abs_REAL(y2 - y1_1);
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
    if (!draw_last) {
        numpixels -= 1;
    }
    if (numpixels > MAX_PIXELS) {
        return SDL_SetError_REAL("Line too long (tried to draw %d pixels, max %d)", numpixels, MAX_PIXELS);
    }
    points = blk: {
        (&isstack).* = (@sizeOf(SDL_FPoint) *% @as(c_ulong, @bitCast(@as(c_long, numpixels)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]SDL_FPoint, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FPoint) *% @as(c_ulong, @bitCast(@as(c_long, numpixels))))))) else @as([*c]SDL_FPoint, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FPoint) *% @as(c_ulong, @bitCast(@as(c_long, numpixels)))))));
    };
    if (!(points != null)) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < numpixels) : (i += 1) {
            points[@bitCast(@as(isize, @intCast(i)))].x = @floatFromInt(x);
            points[@bitCast(@as(isize, @intCast(i)))].y = @floatFromInt(y);
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
    if ((view.*.current_scale.x != @as(f32, 1.0)) or (view.*.current_scale.y != @as(f32, 1.0))) {
        result = RenderPointsWithRects(renderer, points, numpixels);
    } else {
        result = QueueCmdDrawPoints(renderer, points, numpixels);
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(points)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(points)));
    }
    return result;
}
pub fn RenderLinesWithRectsF(renderer: [*c]SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    _ = &count;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    var frect: [*c]SDL_FRect = undefined;
    _ = &frect;
    var frects: [*c]SDL_FRect = undefined;
    _ = &frects;
    var i: c_int = undefined;
    _ = &i;
    var nrects: c_int = 0;
    _ = &nrects;
    var result: bool = @"true" != 0;
    _ = &result;
    var isstack: bool = undefined;
    _ = &isstack;
    var drew_line: bool = @"false" != 0;
    _ = &drew_line;
    var draw_last: bool = @"false" != 0;
    _ = &draw_last;
    frects = blk: {
        (&isstack).* = (@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count - @as(c_int, 1))))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count - @as(c_int, 1)))))))) else @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count - @as(c_int, 1))))))));
    };
    if (!(frects != null)) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < (count - @as(c_int, 1))) : (i += 1) {
            var same_x: bool = points[@bitCast(@as(isize, @intCast(i)))].x == points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x;
            _ = &same_x;
            var same_y: bool = points[@bitCast(@as(isize, @intCast(i)))].y == points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y;
            _ = &same_y;
            if (i == (count - @as(c_int, 2))) {
                if ((!drew_line or (points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x != points[@as(c_int, 0)].x)) or (points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y != points[@as(c_int, 0)].y)) {
                    draw_last = @"true" != 0;
                }
            } else {
                if (same_x and same_y) {
                    continue;
                }
            }
            if (same_x) {
                const minY: f32 = if (points[@bitCast(@as(isize, @intCast(i)))].y < points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y) points[@bitCast(@as(isize, @intCast(i)))].y else points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y;
                _ = &minY;
                const maxY: f32 = if (points[@bitCast(@as(isize, @intCast(i)))].y > points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y) points[@bitCast(@as(isize, @intCast(i)))].y else points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y;
                _ = &maxY;
                frect = &frects[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &nrects;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                frect.*.x = points[@bitCast(@as(isize, @intCast(i)))].x * scale_x;
                frect.*.y = minY * scale_y;
                frect.*.w = scale_x;
                frect.*.h = ((maxY - minY) + @as(f32, @floatFromInt(@as(c_int, @intFromBool(draw_last))))) * scale_y;
                if (!draw_last and (points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y < points[@bitCast(@as(isize, @intCast(i)))].y)) {
                    frect.*.y += scale_y;
                }
            } else if (same_y) {
                const minX: f32 = if (points[@bitCast(@as(isize, @intCast(i)))].x < points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x) points[@bitCast(@as(isize, @intCast(i)))].x else points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x;
                _ = &minX;
                const maxX: f32 = if (points[@bitCast(@as(isize, @intCast(i)))].x > points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x) points[@bitCast(@as(isize, @intCast(i)))].x else points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x;
                _ = &maxX;
                frect = &frects[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &nrects;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ];
                frect.*.x = minX * scale_x;
                frect.*.y = points[@bitCast(@as(isize, @intCast(i)))].y * scale_y;
                frect.*.w = ((maxX - minX) + @as(f32, @floatFromInt(@as(c_int, @intFromBool(draw_last))))) * scale_x;
                frect.*.h = scale_y;
                if (!draw_last and (points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x < points[@bitCast(@as(isize, @intCast(i)))].x)) {
                    frect.*.x += scale_x;
                }
            } else {
                {
                    const ref = &result;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(RenderLineBresenham(renderer, @intFromFloat(SDL_roundf_REAL(points[@bitCast(@as(isize, @intCast(i)))].x)), @intFromFloat(SDL_roundf_REAL(points[@bitCast(@as(isize, @intCast(i)))].y)), @intFromFloat(SDL_roundf_REAL(points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].x)), @intFromFloat(SDL_roundf_REAL(points[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))].y)), draw_last)))) != 0;
                }
            }
            drew_line = @"true" != 0;
        }
    }
    if (nrects != 0) {
        {
            const ref = &result;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(QueueCmdFillRects(renderer, frects, nrects)))) != 0;
        }
    }
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    }
    return result;
}
pub export fn SDL_RenderLines_REAL(renderer: [*c]SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(points != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_RenderLines(): points"))));
    }
    if (count < @as(c_int, 2)) {
        return @"true" != 0;
    }
    var view: [*c]SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const islogical: bool = view.*.logical_presentation_mode != @as(SDL_RendererLogicalPresentation, SDL_LOGICAL_PRESENTATION_DISABLED);
    _ = &islogical;
    if (islogical or (renderer.*.line_method == @as(SDL_RenderLineMethod, SDL_RENDERLINEMETHOD_GEOMETRY))) {
        const scale_x: f32 = view.*.current_scale.x;
        _ = &scale_x;
        const scale_y: f32 = view.*.current_scale.y;
        _ = &scale_y;
        var isstack1: bool = undefined;
        _ = &isstack1;
        var isstack2: bool = undefined;
        _ = &isstack2;
        var xy: [*c]f32 = blk: {
            (&isstack1).* = (@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&isstack1).*) @as([*c]f32, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count))))))) else @as([*c]f32, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(f32) *% @as(c_ulong, @bitCast(@as(c_long, (@as(c_int, 4) * @as(c_int, 2)) * count)))))));
        };
        _ = &xy;
        var indices: [*c]c_int = blk: {
            (&isstack2).* = (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, ((@as(c_int, 4) * @as(c_int, 3)) * (count - @as(c_int, 1))) + ((@as(c_int, 2) * @as(c_int, 3)) * count))))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&isstack2).*) @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, ((@as(c_int, 4) * @as(c_int, 3)) * (count - @as(c_int, 1))) + ((@as(c_int, 2) * @as(c_int, 3)) * count)))))))) else @as([*c]c_int, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, ((@as(c_int, 4) * @as(c_int, 3)) * (count - @as(c_int, 1))) + ((@as(c_int, 2) * @as(c_int, 3)) * count))))))));
        };
        _ = &indices;
        if ((xy != null) and (indices != null)) {
            var i: c_int = undefined;
            _ = &i;
            var ptr_xy: [*c]f32 = xy;
            _ = &ptr_xy;
            var ptr_indices: [*c]c_int = indices;
            _ = &ptr_indices;
            const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
            _ = &xy_stride;
            var num_vertices: c_int = @as(c_int, 4) * count;
            _ = &num_vertices;
            var num_indices: c_int = 0;
            _ = &num_indices;
            const size_indices: c_int = 4;
            _ = &size_indices;
            var cur_index: c_int = -@as(c_int, 4);
            _ = &cur_index;
            const is_looping: bool = (points[@as(c_int, 0)].x == points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].x) and (points[@as(c_int, 0)].y == points[@bitCast(@as(isize, @intCast(count - @as(c_int, 1))))].y);
            _ = &is_looping;
            var p: SDL_FPoint = undefined;
            _ = &p;
            p.x = blk: {
                const tmp = @as(f32, 0.0);
                p.y = tmp;
                break :blk tmp;
            };
            {
                i = 0;
                while (i < count) : (i += 1) {
                    var q: SDL_FPoint = points[@bitCast(@as(isize, @intCast(i)))];
                    _ = &q;
                    q.x *= scale_x;
                    q.y *= scale_y;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.x;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.y;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.x + scale_x;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.y;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.x + scale_x;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.y + scale_y;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.x;
                    (blk: {
                        const ref = &ptr_xy;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    }).* = q.y + scale_y;
                    if ((i != 0) or !is_looping) {
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 4);
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 5);
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 6);
                        num_indices += 3;
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 4);
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 6);
                        (blk: {
                            const ref = &ptr_indices;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = cur_index + @as(c_int, 7);
                        num_indices += 3;
                    }
                    if (i == @as(c_int, 0)) {
                        p = q;
                        cur_index += 4;
                        continue;
                    }
                    if (p.y == q.y) {
                        if (p.x < q.x) {
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 1);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 4);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 7);
                            num_indices += 3;
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 1);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 7);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 2);
                            num_indices += 3;
                        } else {
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 5);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 0);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 3);
                            num_indices += 3;
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 5);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 3);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 6);
                            num_indices += 3;
                        }
                    } else if (p.x == q.x) {
                        if (p.y < q.y) {
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 2);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 5);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 4);
                            num_indices += 3;
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 2);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 4);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 3);
                            num_indices += 3;
                        } else {
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 6);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 1);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 0);
                            num_indices += 3;
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 6);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 0);
                            (blk: {
                                const ref = &ptr_indices;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = cur_index + @as(c_int, 7);
                            num_indices += 3;
                        }
                    } else {
                        if (p.y < q.y) {
                            if (p.x < q.x) {
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 5);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 4);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 4);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 2);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 2);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 4);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 2);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 3);
                                num_indices += 3;
                            } else {
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 4);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 5);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 5);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 3);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 5);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 3);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 3);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 2);
                                num_indices += 3;
                            }
                        } else {
                            if (p.x < q.x) {
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 4);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 2);
                                num_indices += 3;
                            } else {
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 5);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 1);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 6);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                num_indices += 3;
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 7);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 0);
                                (blk: {
                                    const ref = &ptr_indices;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                }).* = cur_index + @as(c_int, 3);
                                num_indices += 3;
                            }
                        }
                    }
                    p = q;
                    cur_index += 4;
                }
            }
            result = QueueCmdGeometry(renderer, null, xy, xy_stride, &renderer.*.color, 0, null, 0, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, 1.0, 1.0, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
        }
        if (isstack1) {
            SDL_free_REAL(@ptrCast(@alignCast(xy)));
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(xy)));
        }
        if (isstack2) {
            SDL_free_REAL(@ptrCast(@alignCast(indices)));
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(indices)));
        }
    } else if (renderer.*.line_method == @as(SDL_RenderLineMethod, SDL_RENDERLINEMETHOD_POINTS)) {
        result = RenderLinesWithRectsF(renderer, points, count);
    } else if ((view.*.scale.x != @as(f32, 1.0)) or (view.*.scale.y != @as(f32, 1.0))) {
        result = RenderLinesWithRectsF(renderer, points, count);
    } else {
        result = QueueCmdDrawLines(renderer, points, count);
    }
    return result;
}
pub export fn SDL_RenderRect_REAL(renderer: [*c]SDL_Renderer, arg_rect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var frect: SDL_FRect = undefined;
    _ = &frect;
    var points: [5]SDL_FPoint = undefined;
    _ = &points;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(rect != null)) {
        GetRenderViewportSize(renderer, &frect);
        rect = &frect;
    }
    points[@as(c_int, 0)].x = rect.*.x;
    points[@as(c_int, 0)].y = rect.*.y;
    points[@as(c_int, 1)].x = (rect.*.x + rect.*.w) - @as(f32, @floatFromInt(@as(c_int, 1)));
    points[@as(c_int, 1)].y = rect.*.y;
    points[@as(c_int, 2)].x = (rect.*.x + rect.*.w) - @as(f32, @floatFromInt(@as(c_int, 1)));
    points[@as(c_int, 2)].y = (rect.*.y + rect.*.h) - @as(f32, @floatFromInt(@as(c_int, 1)));
    points[@as(c_int, 3)].x = rect.*.x;
    points[@as(c_int, 3)].y = (rect.*.y + rect.*.h) - @as(f32, @floatFromInt(@as(c_int, 1)));
    points[@as(c_int, 4)].x = rect.*.x;
    points[@as(c_int, 4)].y = rect.*.y;
    return SDL_RenderLines_REAL(renderer, @ptrCast(@alignCast(&points)), 5);
}
pub export fn SDL_RenderRects_REAL(renderer: [*c]SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(rects != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_RenderRects(): rects"))));
    }
    if (count < @as(c_int, 1)) {
        return @"true" != 0;
    }
    {
        i = 0;
        while (i < count) : (i += 1) {
            if (!SDL_RenderRect_REAL(renderer, &rects[@bitCast(@as(isize, @intCast(i)))])) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub export fn SDL_RenderFillRect_REAL(renderer: [*c]SDL_Renderer, arg_rect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    var frect: SDL_FRect = undefined;
    _ = &frect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(rect != null)) {
        GetRenderViewportSize(renderer, &frect);
        rect = &frect;
    }
    return SDL_RenderFillRects_REAL(renderer, rect, 1);
}
pub export fn SDL_RenderFillRects_REAL(renderer: [*c]SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) bool {
    @setEvalBranchQuota(100000);
    var frects: [*c]SDL_FRect = undefined;
    _ = &frects;
    var i: c_int = undefined;
    _ = &i;
    var result: bool = undefined;
    _ = &result;
    var isstack: bool = undefined;
    _ = &isstack;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(rects != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("SDL_RenderFillRects(): rects"))));
    }
    if (count < @as(c_int, 1)) {
        return @"true" != 0;
    }
    frects = blk: {
        (&isstack).* = (@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
        break :blk if ((&isstack).*) @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count))))))) else @as([*c]SDL_FRect, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_FRect) *% @as(c_ulong, @bitCast(@as(c_long, count)))))));
    };
    if (!(frects != null)) {
        return @"false" != 0;
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    {
        i = 0;
        while (i < count) : (i += 1) {
            frects[@bitCast(@as(isize, @intCast(i)))].x = rects[@bitCast(@as(isize, @intCast(i)))].x * scale_x;
            frects[@bitCast(@as(isize, @intCast(i)))].y = rects[@bitCast(@as(isize, @intCast(i)))].y * scale_y;
            frects[@bitCast(@as(isize, @intCast(i)))].w = rects[@bitCast(@as(isize, @intCast(i)))].w * scale_x;
            frects[@bitCast(@as(isize, @intCast(i)))].h = rects[@bitCast(@as(isize, @intCast(i)))].h * scale_y;
        }
    }
    result = QueueCmdFillRects(renderer, frects, count);
    if (isstack) {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(frects)));
    }
    return result;
}
pub fn SDL_RenderTextureInternal(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    const use_rendergeometry: bool = !(renderer.*.QueueCopy != null);
    _ = &use_rendergeometry;
    var result: bool = undefined;
    _ = &result;
    if (use_rendergeometry) {
        var xy: [8]f32 = undefined;
        _ = &xy;
        const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &xy_stride;
        var uv: [8]f32 = undefined;
        _ = &uv;
        const uv_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &uv_stride;
        const num_vertices: c_int = 4;
        _ = &num_vertices;
        var indices: [*c]const c_int = @ptrCast(@alignCast(&rect_index_order));
        _ = &indices;
        const num_indices: c_int = 6;
        _ = &num_indices;
        const size_indices: c_int = 4;
        _ = &size_indices;
        var minu: f32 = undefined;
        _ = &minu;
        var minv: f32 = undefined;
        _ = &minv;
        var maxu: f32 = undefined;
        _ = &maxu;
        var maxv: f32 = undefined;
        _ = &maxv;
        var minx: f32 = undefined;
        _ = &minx;
        var miny: f32 = undefined;
        _ = &miny;
        var maxx: f32 = undefined;
        _ = &maxx;
        var maxy: f32 = undefined;
        _ = &maxy;
        minu = srcrect.*.x / @as(f32, @floatFromInt(texture.*.w));
        minv = srcrect.*.y / @as(f32, @floatFromInt(texture.*.h));
        maxu = (srcrect.*.x + srcrect.*.w) / @as(f32, @floatFromInt(texture.*.w));
        maxv = (srcrect.*.y + srcrect.*.h) / @as(f32, @floatFromInt(texture.*.h));
        minx = dstrect.*.x;
        miny = dstrect.*.y;
        maxx = dstrect.*.x + dstrect.*.w;
        maxy = dstrect.*.y + dstrect.*.h;
        uv[@as(c_int, 0)] = minu;
        uv[@as(c_int, 1)] = minv;
        uv[@as(c_int, 2)] = maxu;
        uv[@as(c_int, 3)] = minv;
        uv[@as(c_int, 4)] = maxu;
        uv[@as(c_int, 5)] = maxv;
        uv[@as(c_int, 6)] = minu;
        uv[@as(c_int, 7)] = maxv;
        xy[@as(c_int, 0)] = minx;
        xy[@as(c_int, 1)] = miny;
        xy[@as(c_int, 2)] = maxx;
        xy[@as(c_int, 3)] = miny;
        xy[@as(c_int, 4)] = maxx;
        xy[@as(c_int, 5)] = maxy;
        xy[@as(c_int, 6)] = minx;
        xy[@as(c_int, 7)] = maxy;
        result = QueueCmdGeometry(renderer, texture, @ptrCast(@alignCast(&xy)), xy_stride, &texture.*.color, 0, @ptrCast(@alignCast(&uv)), uv_stride, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, scale_x, scale_y, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
    } else {
        const rect: SDL_FRect = SDL_FRect{
            .x = dstrect.*.x * scale_x,
            .y = dstrect.*.y * scale_y,
            .w = dstrect.*.w * scale_x,
            .h = dstrect.*.h * scale_y,
        };
        _ = &rect;
        result = QueueCmdCopy(renderer, texture, srcrect, &rect);
    }
    return result;
}
pub export fn SDL_RenderTexture_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, arg_dstrect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    var real_srcrect: SDL_FRect = undefined;
    _ = &real_srcrect;
    real_srcrect.x = 0.0;
    real_srcrect.y = 0.0;
    real_srcrect.w = @floatFromInt(texture.*.w);
    real_srcrect.h = @floatFromInt(texture.*.h);
    if (srcrect != null) {
        if (!SDL_GetRectIntersectionFloat_REAL(srcrect, &real_srcrect, &real_srcrect)) {
            return @"true" != 0;
        }
    }
    var full_dstrect: SDL_FRect = undefined;
    _ = &full_dstrect;
    if (!(dstrect != null)) {
        GetRenderViewportSize(renderer, &full_dstrect);
        dstrect = &full_dstrect;
    }
    if (!UpdateTexturePalette(texture)) {
        return @"false" != 0;
    }
    if (texture.*.native != null) {
        texture = texture.*.native;
    }
    texture.*.last_command_generation = renderer.*.render_command_generation;
    return SDL_RenderTextureInternal(renderer, texture, &real_srcrect, dstrect);
}
pub export fn SDL_RenderTextureAffine_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, origin: [*c]const SDL_FPoint, right: [*c]const SDL_FPoint, down: [*c]const SDL_FPoint) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    var real_srcrect: SDL_FRect = undefined;
    _ = &real_srcrect;
    var real_dstrect: SDL_FRect = undefined;
    _ = &real_dstrect;
    var result: bool = undefined;
    _ = &result;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    if (!(renderer.*.QueueCopyEx != null) and !(renderer.*.QueueGeometry != null)) {
        return SDL_SetError_REAL("Renderer does not support RenderCopyEx");
    }
    real_srcrect.x = 0.0;
    real_srcrect.y = 0.0;
    real_srcrect.w = @floatFromInt(texture.*.w);
    real_srcrect.h = @floatFromInt(texture.*.h);
    if (srcrect != null) {
        if (!SDL_GetRectIntersectionFloat_REAL(srcrect, &real_srcrect, &real_srcrect)) {
            return @"true" != 0;
        }
    }
    GetRenderViewportSize(renderer, &real_dstrect);
    if (!UpdateTexturePalette(texture)) {
        return @"false" != 0;
    }
    if (texture.*.native != null) {
        texture = texture.*.native;
    }
    texture.*.last_command_generation = renderer.*.render_command_generation;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    {
        var xy: [8]f32 = undefined;
        _ = &xy;
        const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &xy_stride;
        var uv: [8]f32 = undefined;
        _ = &uv;
        const uv_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &uv_stride;
        const num_vertices: c_int = 4;
        _ = &num_vertices;
        var indices: [*c]const c_int = @ptrCast(@alignCast(&rect_index_order));
        _ = &indices;
        const num_indices: c_int = 6;
        _ = &num_indices;
        const size_indices: c_int = 4;
        _ = &size_indices;
        var minu: f32 = real_srcrect.x / @as(f32, @floatFromInt(texture.*.w));
        _ = &minu;
        var minv: f32 = real_srcrect.y / @as(f32, @floatFromInt(texture.*.h));
        _ = &minv;
        var maxu: f32 = (real_srcrect.x + real_srcrect.w) / @as(f32, @floatFromInt(texture.*.w));
        _ = &maxu;
        var maxv: f32 = (real_srcrect.y + real_srcrect.h) / @as(f32, @floatFromInt(texture.*.h));
        _ = &maxv;
        uv[@as(c_int, 0)] = minu;
        uv[@as(c_int, 1)] = minv;
        uv[@as(c_int, 2)] = maxu;
        uv[@as(c_int, 3)] = minv;
        uv[@as(c_int, 4)] = maxu;
        uv[@as(c_int, 5)] = maxv;
        uv[@as(c_int, 6)] = minu;
        uv[@as(c_int, 7)] = maxv;
        if (origin != null) {
            xy[@as(c_int, 0)] = origin.*.x;
            xy[@as(c_int, 1)] = origin.*.y;
        } else {
            xy[@as(c_int, 0)] = real_dstrect.x;
            xy[@as(c_int, 1)] = real_dstrect.y;
        }
        if (right != null) {
            xy[@as(c_int, 2)] = right.*.x;
            xy[@as(c_int, 3)] = right.*.y;
        } else {
            xy[@as(c_int, 2)] = real_dstrect.x + real_dstrect.w;
            xy[@as(c_int, 3)] = real_dstrect.y;
        }
        if (down != null) {
            xy[@as(c_int, 6)] = down.*.x;
            xy[@as(c_int, 7)] = down.*.y;
        } else {
            xy[@as(c_int, 6)] = real_dstrect.x;
            xy[@as(c_int, 7)] = real_dstrect.y + real_dstrect.h;
        }
        if (((origin != null) or (right != null)) or (down != null)) {
            xy[@as(c_int, 4)] = (xy[@as(c_int, 2)] + xy[@as(c_int, 6)]) - xy[@as(c_int, 0)];
            xy[@as(c_int, 5)] = (xy[@as(c_int, 3)] + xy[@as(c_int, 7)]) - xy[@as(c_int, 1)];
        } else {
            xy[@as(c_int, 4)] = real_dstrect.x + real_dstrect.w;
            xy[@as(c_int, 5)] = real_dstrect.y + real_dstrect.h;
        }
        result = QueueCmdGeometry(renderer, texture, @ptrCast(@alignCast(&xy)), xy_stride, &texture.*.color, 0, @ptrCast(@alignCast(&uv)), uv_stride, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, scale_x, scale_y, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
    }
    return result;
}
pub export fn SDL_RenderTextureRotated_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, arg_dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_FlipMode) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    _ = &angle;
    _ = &flip;
    var real_srcrect: SDL_FRect = undefined;
    _ = &real_srcrect;
    var real_center: SDL_FPoint = undefined;
    _ = &real_center;
    var result: bool = undefined;
    _ = &result;
    if ((flip == @as(SDL_FlipMode, SDL_FLIP_NONE)) and (@as(f64, @floatFromInt(@as(c_int, @intFromFloat(angle / @as(f64, @floatFromInt(@as(c_int, 360))))))) == (angle / @as(f64, @floatFromInt(@as(c_int, 360)))))) {
        return SDL_RenderTexture_REAL(renderer, texture, srcrect, dstrect);
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    if (!(renderer.*.QueueCopyEx != null) and !(renderer.*.QueueGeometry != null)) {
        return SDL_SetError_REAL("Renderer does not support RenderCopyEx");
    }
    real_srcrect.x = 0.0;
    real_srcrect.y = 0.0;
    real_srcrect.w = @floatFromInt(texture.*.w);
    real_srcrect.h = @floatFromInt(texture.*.h);
    if (srcrect != null) {
        if (!SDL_GetRectIntersectionFloat_REAL(srcrect, &real_srcrect, &real_srcrect)) {
            return @"true" != 0;
        }
    }
    var full_dstrect: SDL_FRect = undefined;
    _ = &full_dstrect;
    if (!(dstrect != null)) {
        GetRenderViewportSize(renderer, &full_dstrect);
        dstrect = &full_dstrect;
    }
    if (!UpdateTexturePalette(texture)) {
        return @"false" != 0;
    }
    if (texture.*.native != null) {
        texture = texture.*.native;
    }
    if (center != null) {
        real_center = center.*;
    } else {
        real_center.x = dstrect.*.w / @as(f32, 2.0);
        real_center.y = dstrect.*.h / @as(f32, 2.0);
    }
    texture.*.last_command_generation = renderer.*.render_command_generation;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    const scale_x: f32 = view.*.current_scale.x;
    _ = &scale_x;
    const scale_y: f32 = view.*.current_scale.y;
    _ = &scale_y;
    const use_rendergeometry: bool = !(renderer.*.QueueCopyEx != null);
    _ = &use_rendergeometry;
    if (use_rendergeometry) {
        var xy: [8]f32 = undefined;
        _ = &xy;
        const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &xy_stride;
        var uv: [8]f32 = undefined;
        _ = &uv;
        const uv_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
        _ = &uv_stride;
        const num_vertices: c_int = 4;
        _ = &num_vertices;
        var indices: [*c]const c_int = @ptrCast(@alignCast(&rect_index_order));
        _ = &indices;
        const num_indices: c_int = 6;
        _ = &num_indices;
        const size_indices: c_int = 4;
        _ = &size_indices;
        var minu: f32 = undefined;
        _ = &minu;
        var minv: f32 = undefined;
        _ = &minv;
        var maxu: f32 = undefined;
        _ = &maxu;
        var maxv: f32 = undefined;
        _ = &maxv;
        var minx: f32 = undefined;
        _ = &minx;
        var miny: f32 = undefined;
        _ = &miny;
        var maxx: f32 = undefined;
        _ = &maxx;
        var maxy: f32 = undefined;
        _ = &maxy;
        var centerx: f32 = undefined;
        _ = &centerx;
        var centery: f32 = undefined;
        _ = &centery;
        var s_minx: f32 = undefined;
        _ = &s_minx;
        var s_miny: f32 = undefined;
        _ = &s_miny;
        var s_maxx: f32 = undefined;
        _ = &s_maxx;
        var s_maxy: f32 = undefined;
        _ = &s_maxy;
        var c_minx: f32 = undefined;
        _ = &c_minx;
        var c_miny: f32 = undefined;
        _ = &c_miny;
        var c_maxx: f32 = undefined;
        _ = &c_maxx;
        var c_maxy: f32 = undefined;
        _ = &c_maxy;
        const radian_angle: f32 = @floatCast((SDL_PI_D * angle) / @as(f64, 180.0));
        _ = &radian_angle;
        const s: f32 = SDL_sinf_REAL(radian_angle);
        _ = &s;
        const c: f32 = SDL_cosf_REAL(radian_angle);
        _ = &c;
        minu = real_srcrect.x / @as(f32, @floatFromInt(texture.*.w));
        minv = real_srcrect.y / @as(f32, @floatFromInt(texture.*.h));
        maxu = (real_srcrect.x + real_srcrect.w) / @as(f32, @floatFromInt(texture.*.w));
        maxv = (real_srcrect.y + real_srcrect.h) / @as(f32, @floatFromInt(texture.*.h));
        centerx = real_center.x + dstrect.*.x;
        centery = real_center.y + dstrect.*.y;
        if ((flip & @as(SDL_FlipMode, SDL_FLIP_HORIZONTAL)) != 0) {
            minx = dstrect.*.x + dstrect.*.w;
            maxx = dstrect.*.x;
        } else {
            minx = dstrect.*.x;
            maxx = dstrect.*.x + dstrect.*.w;
        }
        if ((flip & @as(SDL_FlipMode, SDL_FLIP_VERTICAL)) != 0) {
            miny = dstrect.*.y + dstrect.*.h;
            maxy = dstrect.*.y;
        } else {
            miny = dstrect.*.y;
            maxy = dstrect.*.y + dstrect.*.h;
        }
        uv[@as(c_int, 0)] = minu;
        uv[@as(c_int, 1)] = minv;
        uv[@as(c_int, 2)] = maxu;
        uv[@as(c_int, 3)] = minv;
        uv[@as(c_int, 4)] = maxu;
        uv[@as(c_int, 5)] = maxv;
        uv[@as(c_int, 6)] = minu;
        uv[@as(c_int, 7)] = maxv;
        s_minx = s * (minx - centerx);
        s_miny = s * (miny - centery);
        s_maxx = s * (maxx - centerx);
        s_maxy = s * (maxy - centery);
        c_minx = c * (minx - centerx);
        c_miny = c * (miny - centery);
        c_maxx = c * (maxx - centerx);
        c_maxy = c * (maxy - centery);
        xy[@as(c_int, 0)] = (c_minx - s_miny) + centerx;
        xy[@as(c_int, 1)] = (s_minx + c_miny) + centery;
        xy[@as(c_int, 2)] = (c_maxx - s_miny) + centerx;
        xy[@as(c_int, 3)] = (s_maxx + c_miny) + centery;
        xy[@as(c_int, 4)] = (c_maxx - s_maxy) + centerx;
        xy[@as(c_int, 5)] = (s_maxx + c_maxy) + centery;
        xy[@as(c_int, 6)] = (c_minx - s_maxy) + centerx;
        xy[@as(c_int, 7)] = (s_minx + c_maxy) + centery;
        result = QueueCmdGeometry(renderer, texture, @ptrCast(@alignCast(&xy)), xy_stride, &texture.*.color, 0, @ptrCast(@alignCast(&uv)), uv_stride, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, scale_x, scale_y, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
    } else {
        result = QueueCmdCopyEx(renderer, texture, &real_srcrect, dstrect, angle, &real_center, flip, scale_x, scale_y);
    }
    return result;
}
pub fn SDL_RenderTextureTiled_Wrap(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, scale: f32, dstrect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var xy: [8]f32 = undefined;
    _ = &xy;
    const xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
    _ = &xy_stride;
    var uv: [8]f32 = undefined;
    _ = &uv;
    const uv_stride: c_int = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 2) *% @sizeOf(f32))));
    _ = &uv_stride;
    const num_vertices: c_int = 4;
    _ = &num_vertices;
    var indices: [*c]const c_int = @ptrCast(@alignCast(&rect_index_order));
    _ = &indices;
    const num_indices: c_int = 6;
    _ = &num_indices;
    const size_indices: c_int = 4;
    _ = &size_indices;
    var minu: f32 = undefined;
    _ = &minu;
    var minv: f32 = undefined;
    _ = &minv;
    var maxu: f32 = undefined;
    _ = &maxu;
    var maxv: f32 = undefined;
    _ = &maxv;
    var minx: f32 = undefined;
    _ = &minx;
    var miny: f32 = undefined;
    _ = &miny;
    var maxx: f32 = undefined;
    _ = &maxx;
    var maxy: f32 = undefined;
    _ = &maxy;
    minu = 0.0;
    minv = 0.0;
    maxu = dstrect.*.w / (srcrect.*.w * scale);
    maxv = dstrect.*.h / (srcrect.*.h * scale);
    minx = dstrect.*.x;
    miny = dstrect.*.y;
    maxx = dstrect.*.x + dstrect.*.w;
    maxy = dstrect.*.y + dstrect.*.h;
    uv[@as(c_int, 0)] = minu;
    uv[@as(c_int, 1)] = minv;
    uv[@as(c_int, 2)] = maxu;
    uv[@as(c_int, 3)] = minv;
    uv[@as(c_int, 4)] = maxu;
    uv[@as(c_int, 5)] = maxv;
    uv[@as(c_int, 6)] = minu;
    uv[@as(c_int, 7)] = maxv;
    xy[@as(c_int, 0)] = minx;
    xy[@as(c_int, 1)] = miny;
    xy[@as(c_int, 2)] = maxx;
    xy[@as(c_int, 3)] = miny;
    xy[@as(c_int, 4)] = maxx;
    xy[@as(c_int, 5)] = maxy;
    xy[@as(c_int, 6)] = minx;
    xy[@as(c_int, 7)] = maxy;
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    return QueueCmdGeometry(renderer, texture, @ptrCast(@alignCast(&xy)), xy_stride, &texture.*.color, 0, @ptrCast(@alignCast(&uv)), uv_stride, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices, view.*.current_scale.x, view.*.current_scale.y, SDL_TEXTURE_ADDRESS_WRAP, SDL_TEXTURE_ADDRESS_WRAP);
}
pub fn SDL_RenderTextureTiled_Iterate(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, scale: f32, dstrect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var tile_width: f32 = srcrect.*.w * scale;
    _ = &tile_width;
    var tile_height: f32 = srcrect.*.h * scale;
    _ = &tile_height;
    var float_rows: f32 = undefined;
    _ = &float_rows;
    var float_cols: f32 = undefined;
    _ = &float_cols;
    var remaining_w: f32 = SDL_modff_REAL(dstrect.*.w / tile_width, &float_cols);
    _ = &remaining_w;
    var remaining_h: f32 = SDL_modff_REAL(dstrect.*.h / tile_height, &float_rows);
    _ = &remaining_h;
    var remaining_src_w: f32 = remaining_w * srcrect.*.w;
    _ = &remaining_src_w;
    var remaining_src_h: f32 = remaining_h * srcrect.*.h;
    _ = &remaining_src_h;
    var remaining_dst_w: f32 = remaining_w * tile_width;
    _ = &remaining_dst_w;
    var remaining_dst_h: f32 = remaining_h * tile_height;
    _ = &remaining_dst_h;
    var rows: c_int = @intFromFloat(float_rows);
    _ = &rows;
    var cols: c_int = @intFromFloat(float_cols);
    _ = &cols;
    var curr_src: SDL_FRect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_FRect = undefined;
    _ = &curr_dst;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&curr_src).*)) == @sizeOf(@TypeOf(srcrect.*)))) @compileError("static assertion failed \"sizeof (*(&curr_src)) == sizeof (*( srcrect))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&curr_src)), @ptrCast(@alignCast(srcrect)), @sizeOf(@TypeOf(srcrect.*)));
    curr_dst.y = dstrect.*.y;
    curr_dst.w = tile_width;
    curr_dst.h = tile_height;
    {
        var y: c_int = 0;
        _ = &y;
        while (y < rows) : (y += 1) {
            curr_dst.x = dstrect.*.x;
            {
                var x: c_int = 0;
                _ = &x;
                while (x < cols) : (x += 1) {
                    if (!SDL_RenderTextureInternal(renderer, texture, &curr_src, &curr_dst)) {
                        return @"false" != 0;
                    }
                    curr_dst.x += curr_dst.w;
                }
            }
            if (remaining_dst_w > @as(f32, 0.0)) {
                curr_src.w = remaining_src_w;
                curr_dst.w = remaining_dst_w;
                if (!SDL_RenderTextureInternal(renderer, texture, &curr_src, &curr_dst)) {
                    return @"false" != 0;
                }
                curr_src.w = srcrect.*.w;
                curr_dst.w = tile_width;
            }
            curr_dst.y += curr_dst.h;
        }
    }
    if (remaining_dst_h > @as(f32, 0.0)) {
        curr_src.h = remaining_src_h;
        curr_dst.h = remaining_dst_h;
        curr_dst.x = dstrect.*.x;
        {
            var x: c_int = 0;
            _ = &x;
            while (x < cols) : (x += 1) {
                if (!SDL_RenderTextureInternal(renderer, texture, &curr_src, &curr_dst)) {
                    return @"false" != 0;
                }
                curr_dst.x += curr_dst.w;
            }
        }
        if (remaining_dst_w > @as(f32, 0.0)) {
            curr_src.w = remaining_src_w;
            curr_dst.w = remaining_dst_w;
            if (!SDL_RenderTextureInternal(renderer, texture, &curr_src, &curr_dst)) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn IsNPOT(arg_x: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    return (x <= @as(c_int, 0)) or ((x & (x - @as(c_int, 1))) != @as(c_int, 0));
}
pub export fn SDL_RenderTextureTiled_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, arg_scale: f32, arg_dstrect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    var scale = arg_scale;
    _ = &scale;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    var real_srcrect: SDL_FRect = undefined;
    _ = &real_srcrect;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    if (scale <= @as(f32, 0.0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("scale"))));
    }
    real_srcrect.x = 0.0;
    real_srcrect.y = 0.0;
    real_srcrect.w = @floatFromInt(texture.*.w);
    real_srcrect.h = @floatFromInt(texture.*.h);
    if (srcrect != null) {
        if (!SDL_GetRectIntersectionFloat_REAL(srcrect, &real_srcrect, &real_srcrect)) {
            return @"true" != 0;
        }
    }
    var full_dstrect: SDL_FRect = undefined;
    _ = &full_dstrect;
    if (!(dstrect != null)) {
        GetRenderViewportSize(renderer, &full_dstrect);
        dstrect = &full_dstrect;
    }
    if (!UpdateTexturePalette(texture)) {
        return @"false" != 0;
    }
    if (texture.*.native != null) {
        texture = texture.*.native;
    }
    texture.*.last_command_generation = renderer.*.render_command_generation;
    var do_wrapping: bool = !renderer.*.software and (!(srcrect != null) or ((((real_srcrect.x == @as(f32, 0.0)) and (real_srcrect.y == @as(f32, 0.0))) and (real_srcrect.w == @as(f32, @floatFromInt(texture.*.w)))) and (real_srcrect.h == @as(f32, @floatFromInt(texture.*.h)))));
    _ = &do_wrapping;
    if (do_wrapping and renderer.*.npot_texture_wrap_unsupported) {
        if (IsNPOT(texture.*.w) or IsNPOT(texture.*.h)) {
            do_wrapping = @"false" != 0;
        }
    }
    if (do_wrapping) {
        return SDL_RenderTextureTiled_Wrap(renderer, texture, &real_srcrect, scale, dstrect);
    } else {
        return SDL_RenderTextureTiled_Iterate(renderer, texture, &real_srcrect, scale, dstrect);
    }
}
pub export fn SDL_RenderTexture9Grid_REAL(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, arg_srcrect: [*c]const SDL_FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, arg_scale: f32, arg_dstrect: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var srcrect = arg_srcrect;
    _ = &srcrect;
    var scale = arg_scale;
    _ = &scale;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    var full_src: SDL_FRect = undefined;
    _ = &full_src;
    var full_dst: SDL_FRect = undefined;
    _ = &full_dst;
    var curr_src: SDL_FRect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_FRect = undefined;
    _ = &curr_dst;
    var dst_left_width: f32 = undefined;
    _ = &dst_left_width;
    var dst_right_width: f32 = undefined;
    _ = &dst_right_width;
    var dst_top_height: f32 = undefined;
    _ = &dst_top_height;
    var dst_bottom_height: f32 = undefined;
    _ = &dst_bottom_height;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    if (!(srcrect != null)) {
        full_src.x = @floatFromInt(@as(c_int, 0));
        full_src.y = @floatFromInt(@as(c_int, 0));
        full_src.w = @floatFromInt(texture.*.w);
        full_src.h = @floatFromInt(texture.*.h);
        srcrect = &full_src;
    }
    if (!(dstrect != null)) {
        GetRenderViewportSize(renderer, &full_dst);
        dstrect = &full_dst;
    }
    if ((scale <= @as(f32, 0.0)) or (scale == @as(f32, 1.0))) {
        dst_left_width = SDL_ceilf_REAL(left_width);
        dst_right_width = SDL_ceilf_REAL(right_width);
        dst_top_height = SDL_ceilf_REAL(top_height);
        dst_bottom_height = SDL_ceilf_REAL(bottom_height);
    } else {
        dst_left_width = SDL_ceilf_REAL(left_width * scale);
        dst_right_width = SDL_ceilf_REAL(right_width * scale);
        dst_top_height = SDL_ceilf_REAL(top_height * scale);
        dst_bottom_height = SDL_ceilf_REAL(bottom_height * scale);
    }
    curr_src.x = srcrect.*.x + left_width;
    curr_src.y = srcrect.*.y + top_height;
    curr_src.w = (srcrect.*.w - left_width) - right_width;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.x = dstrect.*.x + dst_left_width;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.w = (dstrect.*.w - dst_left_width) - dst_right_width;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x;
    curr_src.y = srcrect.*.y;
    curr_src.w = left_width;
    curr_src.h = top_height;
    curr_dst.x = dstrect.*.x;
    curr_dst.y = dstrect.*.y;
    curr_dst.w = dst_left_width;
    curr_dst.h = dst_top_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_src.h = bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x;
    curr_src.w = left_width;
    curr_dst.x = dstrect.*.x;
    curr_dst.w = dst_left_width;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = srcrect.*.y + top_height;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
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
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_src.h = bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_RenderTexture9GridTiled_REAL(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, arg_srcrect: [*c]const SDL_FRect, left_width: f32, right_width: f32, top_height: f32, bottom_height: f32, arg_scale: f32, arg_dstrect: [*c]const SDL_FRect, tileScale: f32) bool {
    @setEvalBranchQuota(100000);
    var srcrect = arg_srcrect;
    _ = &srcrect;
    var scale = arg_scale;
    _ = &scale;
    var dstrect = arg_dstrect;
    _ = &dstrect;
    var full_src: SDL_FRect = undefined;
    _ = &full_src;
    var full_dst: SDL_FRect = undefined;
    _ = &full_dst;
    var curr_src: SDL_FRect = undefined;
    _ = &curr_src;
    var curr_dst: SDL_FRect = undefined;
    _ = &curr_dst;
    var dst_left_width: f32 = undefined;
    _ = &dst_left_width;
    var dst_right_width: f32 = undefined;
    _ = &dst_right_width;
    var dst_top_height: f32 = undefined;
    _ = &dst_top_height;
    var dst_bottom_height: f32 = undefined;
    _ = &dst_bottom_height;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return @"false" != 0;
    }
    if (renderer != texture.*.renderer) {
        return SDL_SetError_REAL("Texture was not created with this renderer");
    }
    if (!(srcrect != null)) {
        full_src.x = @floatFromInt(@as(c_int, 0));
        full_src.y = @floatFromInt(@as(c_int, 0));
        full_src.w = @floatFromInt(texture.*.w);
        full_src.h = @floatFromInt(texture.*.h);
        srcrect = &full_src;
    }
    if (!(dstrect != null)) {
        GetRenderViewportSize(renderer, &full_dst);
        dstrect = &full_dst;
    }
    if ((scale <= @as(f32, 0.0)) or (scale == @as(f32, 1.0))) {
        dst_left_width = SDL_ceilf_REAL(left_width);
        dst_right_width = SDL_ceilf_REAL(right_width);
        dst_top_height = SDL_ceilf_REAL(top_height);
        dst_bottom_height = SDL_ceilf_REAL(bottom_height);
    } else {
        dst_left_width = SDL_ceilf_REAL(left_width * scale);
        dst_right_width = SDL_ceilf_REAL(right_width * scale);
        dst_top_height = SDL_ceilf_REAL(top_height * scale);
        dst_bottom_height = SDL_ceilf_REAL(bottom_height * scale);
    }
    curr_src.x = srcrect.*.x + left_width;
    curr_src.y = srcrect.*.y + top_height;
    curr_src.w = (srcrect.*.w - left_width) - right_width;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.x = dstrect.*.x + dst_left_width;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.w = (dstrect.*.w - dst_left_width) - dst_right_width;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_RenderTextureTiled_REAL(renderer, texture, &curr_src, tileScale, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x;
    curr_src.y = srcrect.*.y;
    curr_src.w = left_width;
    curr_src.h = top_height;
    curr_dst.x = dstrect.*.x;
    curr_dst.y = dstrect.*.y;
    curr_dst.w = dst_left_width;
    curr_dst.h = dst_top_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_src.h = bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = srcrect.*.x;
    curr_src.w = left_width;
    curr_dst.x = dstrect.*.x;
    curr_dst.w = dst_left_width;
    if (!SDL_RenderTexture_REAL(renderer, texture, &curr_src, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = srcrect.*.y + top_height;
    curr_src.h = (srcrect.*.h - top_height) - bottom_height;
    curr_dst.y = dstrect.*.y + dst_top_height;
    curr_dst.h = (dstrect.*.h - dst_top_height) - dst_bottom_height;
    if (!SDL_RenderTextureTiled_REAL(renderer, texture, &curr_src, tileScale, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.x = (srcrect.*.x + srcrect.*.w) - right_width;
    curr_src.w = right_width;
    curr_dst.x = (dstrect.*.x + dstrect.*.w) - dst_right_width;
    curr_dst.w = dst_right_width;
    if (!SDL_RenderTextureTiled_REAL(renderer, texture, &curr_src, tileScale, &curr_dst)) {
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
    if (!SDL_RenderTextureTiled_REAL(renderer, texture, &curr_src, tileScale, &curr_dst)) {
        return @"false" != 0;
    }
    curr_src.y = (srcrect.*.y + srcrect.*.h) - bottom_height;
    curr_src.h = bottom_height;
    curr_dst.y = (dstrect.*.y + dstrect.*.h) - dst_bottom_height;
    curr_dst.h = dst_bottom_height;
    if (!SDL_RenderTextureTiled_REAL(renderer, texture, &curr_src, tileScale, &curr_dst)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_RenderGeometry_REAL(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, vertices: [*c]const SDL_Vertex, num_vertices: c_int, indices: [*c]const c_int, num_indices: c_int) bool {
    @setEvalBranchQuota(100000);
    if (vertices != null) {
        var xy: [*c]const f32 = &vertices.*.position.x;
        _ = &xy;
        var xy_stride: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_Vertex))));
        _ = &xy_stride;
        var color: [*c]const SDL_FColor = &vertices.*.color;
        _ = &color;
        var color_stride: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_Vertex))));
        _ = &color_stride;
        var uv: [*c]const f32 = &vertices.*.tex_coord.x;
        _ = &uv;
        var uv_stride: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_Vertex))));
        _ = &uv_stride;
        var size_indices: c_int = 4;
        _ = &size_indices;
        return SDL_RenderGeometryRaw_REAL(renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, @ptrCast(@alignCast(indices)), num_indices, size_indices);
    } else {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("vertices"))));
    }
}
pub fn remap_one_indice(prev: c_int, k: c_int, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var xy0_: [*c]const f32 = undefined;
    _ = &xy0_;
    var xy1_: [*c]const f32 = undefined;
    _ = &xy1_;
    var uv0_: [*c]const f32 = undefined;
    _ = &uv0_;
    var uv1_: [*c]const f32 = undefined;
    _ = &uv1_;
    var col0_: [*c]const SDL_FColor = undefined;
    _ = &col0_;
    var col1_: [*c]const SDL_FColor = undefined;
    _ = &col1_;
    xy0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(prev * xy_stride))))));
    xy1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(k * xy_stride))))));
    if (xy0_[@as(c_int, 0)] != xy1_[@as(c_int, 0)]) {
        return k;
    }
    if (xy0_[@as(c_int, 1)] != xy1_[@as(c_int, 1)]) {
        return k;
    }
    if (texture != null) {
        uv0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(prev * uv_stride))))));
        uv1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(k * uv_stride))))));
        if (uv0_[@as(c_int, 0)] != uv1_[@as(c_int, 0)]) {
            return k;
        }
        if (uv0_[@as(c_int, 1)] != uv1_[@as(c_int, 1)]) {
            return k;
        }
    }
    col0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(prev * color_stride))))));
    col1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(k * color_stride))))));
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(col0_)), @ptrCast(@alignCast(col1_)), @sizeOf(@TypeOf(col0_.*))) != @as(c_int, 0)) {
        return k;
    }
    return prev;
}
pub fn remap_indices(prev: [*c]c_int, k: c_int, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    if (prev[@as(c_int, 0)] == -@as(c_int, 1)) {
        return k;
    }
    {
        i = 0;
        while (i < @as(c_int, 3)) : (i += 1) {
            var new_k: c_int = remap_one_indice(prev[@bitCast(@as(isize, @intCast(i)))], k, texture, xy, xy_stride, color, color_stride, uv, uv_stride);
            _ = &new_k;
            if (new_k != k) {
                return new_k;
            }
        }
    }
    return k;
}
pub fn SDL_SW_RenderGeometryRaw(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    var result: bool = undefined;
    _ = &result;
    var count: c_int = undefined;
    _ = &count;
    var prev: [3]c_int = undefined;
    _ = &prev;
    var texw: f32 = undefined;
    _ = &texw;
    var texh: f32 = undefined;
    _ = &texh;
    var blendMode: SDL_BlendMode = undefined;
    _ = &blendMode;
    var r: f32 = undefined;
    _ = &r;
    var g: f32 = undefined;
    _ = &g;
    var b: f32 = undefined;
    _ = &b;
    var a: f32 = undefined;
    _ = &a;
    var view: [*c]const SDL_RenderViewState = undefined;
    _ = &view;
    var scale_x: f32 = undefined;
    _ = &scale_x;
    var scale_y: f32 = undefined;
    _ = &scale_y;
    var k0: c_int = undefined;
    _ = &k0;
    var k1: c_int = undefined;
    _ = &k1;
    var k2: c_int = undefined;
    _ = &k2;
    var is_quad: c_int = undefined;
    _ = &is_quad;
    var A: c_int = undefined;
    _ = &A;
    var B: c_int = undefined;
    _ = &B;
    var C: c_int = undefined;
    _ = &C;
    var C2: c_int = undefined;
    _ = &C2;
    var cnt: c_int = undefined;
    _ = &cnt;
    var j: c_int = undefined;
    _ = &j;
    var p: c_int = undefined;
    _ = &p;
    var xy0_: [*c]const f32 = undefined;
    _ = &xy0_;
    var xy1_: [*c]const f32 = undefined;
    _ = &xy1_;
    var xy2_: [*c]const f32 = undefined;
    _ = &xy2_;
    var x0: f32 = undefined;
    _ = &x0;
    var x1: f32 = undefined;
    _ = &x1;
    var x2: f32 = undefined;
    _ = &x2;
    var y0_1: f32 = undefined;
    _ = &y0_1;
    var y1_2: f32 = undefined;
    _ = &y1_2;
    var y2: f32 = undefined;
    _ = &y2;
    var col0_: [*c]const SDL_FColor = undefined;
    _ = &col0_;
    var col1_: [*c]const SDL_FColor = undefined;
    _ = &col1_;
    var col2_: [*c]const SDL_FColor = undefined;
    _ = &col2_;
    var col3_: [*c]const SDL_FColor = undefined;
    _ = &col3_;
    var uv0_: [*c]const f32 = undefined;
    _ = &uv0_;
    var uv1_: [*c]const f32 = undefined;
    _ = &uv1_;
    var uv2_: [*c]const f32 = undefined;
    _ = &uv2_;
    var uv3_: [*c]const f32 = undefined;
    _ = &uv3_;
    var s: SDL_FRect = undefined;
    _ = &s;
    var d: SDL_FRect = undefined;
    _ = &d;
    var xy0__3: [*c]const f32 = undefined;
    _ = &xy0__3;
    var xy1__4: [*c]const f32 = undefined;
    _ = &xy1__4;
    var uv0__5: [*c]const f32 = undefined;
    _ = &uv0__5;
    var uv1__6: [*c]const f32 = undefined;
    _ = &uv1__6;
    var col0__7: [*c]const SDL_FColor = undefined;
    _ = &col0__7;
    var flags: c_int = undefined;
    _ = &flags;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                result = @"true" != 0;
                count = if (indices != null) num_indices else num_vertices;
                texw = 0.0;
                texh = 0.0;
                blendMode = SDL_BLENDMODE_NONE;
                r = @floatFromInt(@as(c_int, 0));
                g = @floatFromInt(@as(c_int, 0));
                b = @floatFromInt(@as(c_int, 0));
                a = @floatFromInt(@as(c_int, 0));
                view = renderer.*.view;
                scale_x = view.*.current_scale.x;
                scale_y = view.*.current_scale.y;
                _ = SDL_GetRenderDrawBlendMode_REAL(renderer, &blendMode);
                _ = SDL_GetRenderDrawColorFloat_REAL(renderer, &r, &g, &b, &a);
                if (texture != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetRenderDrawBlendMode_REAL(renderer, blendMode);
                _ = SDL_SetRenderDrawColorFloat_REAL(renderer, r, g, b, a);
                return result;
            },
            2 => {
                _ = SDL_GetTextureSize_REAL(texture, &texw, &texh);
                {
                    sdl_pc = 4;
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
                prev[@as(c_int, 0)] = -@as(c_int, 1);
                prev[@as(c_int, 1)] = -@as(c_int, 1);
                prev[@as(c_int, 2)] = -@as(c_int, 1);
                size_indices = if (indices != null) size_indices else @as(c_int, 0);
                i = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (i < count) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                is_quad = 1;
                A = -@as(c_int, 1);
                B = -@as(c_int, 1);
                C = -@as(c_int, 1);
                C2 = -@as(c_int, 1);
                if (size_indices == @as(c_int, 4)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                i += 3;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                if (prev[@as(c_int, 0)] != -@as(c_int, 1)) {
                    sdl_pc = 105;
                    continue;
                } else {
                    sdl_pc = 106;
                    continue;
                }
            },
            9 => {
                k0 = @bitCast(@as(c_uint, @truncate(@as([*c]const Uint32, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))])));
                k1 = @bitCast(@as(c_uint, @truncate(@as([*c]const Uint32, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])));
                k2 = @bitCast(@as(c_uint, @truncate(@as([*c]const Uint32, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 2))))])));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (size_indices == @as(c_int, 2)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (prev[@as(c_int, 0)] == -@as(c_int, 1)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            12 => {
                k0 = @as([*c]const Uint16, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
                k1 = @as([*c]const Uint16, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))];
                k2 = @as([*c]const Uint16, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 2))))];
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                if (size_indices == @as(c_int, 1)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                k0 = @as([*c]const Uint8, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
                k1 = @as([*c]const Uint8, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))];
                k2 = @as([*c]const Uint8, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i + @as(c_int, 2))))];
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                k0 = remap_indices(@ptrCast(@alignCast(&prev)), i, texture, xy, xy_stride, color, color_stride, uv, uv_stride);
                k1 = remap_indices(@ptrCast(@alignCast(&prev)), i + @as(c_int, 1), texture, xy, xy_stride, color, color_stride, uv, uv_stride);
                k2 = remap_indices(@ptrCast(@alignCast(&prev)), i + @as(c_int, 2), texture, xy, xy_stride, color, color_stride, uv, uv_stride);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                prev[@as(c_int, 0)] = k0;
                prev[@as(c_int, 1)] = k1;
                prev[@as(c_int, 2)] = k2;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                cnt = 0;
                j = 3;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                if ((blk: {
                    const ref = &j;
                    const tmp = ref.*;
                    ref.* -= 1;
                    break :blk tmp;
                }) != 0) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                p = prev[@bitCast(@as(isize, @intCast(j)))];
                if (((p == k0) or (p == k1)) or (p == k2)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                is_quad = @intFromBool(cnt == @as(c_int, 2));
                if (is_quad != 0) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            24 => {
                cnt += 1;
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            27 => {
                xy0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(k0 * xy_stride))))));
                xy1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(k1 * xy_stride))))));
                xy2_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(k2 * xy_stride))))));
                x0 = xy0_[@as(c_int, 0)];
                y0_1 = xy0_[@as(c_int, 1)];
                x1 = xy1_[@as(c_int, 0)];
                y1_2 = xy1_[@as(c_int, 1)];
                x2 = xy2_[@as(c_int, 0)];
                y2 = xy2_[@as(c_int, 1)];
                if ((x0 <= x1) and (y0_1 <= y1_2)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
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
                if (is_quad != 0) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            30 => {
                if ((x0 <= x2) and (y0_1 <= y2)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            31 => {
                if ((x1 <= x2) and (y1_2 <= y2)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            32 => {
                if ((x0 >= x1) and (y0_1 >= y1_2)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            33 => {
                A = k0;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                A = k2;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                A = k1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                A = k2;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            39 => {
                if ((x0 >= x2) and (y0_1 >= y2)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            40 => {
                if ((x1 >= x2) and (y1_2 >= y2)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            41 => {
                if ((k0 != A) and (k0 != B)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            42 => {
                B = k0;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                B = k2;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                B = k1;
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                B = k2;
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            48 => {
                C = k0;
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                if ((k1 != A) and (k1 != B)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            50 => {
                if ((prev[@as(c_int, 0)] != A) and (prev[@as(c_int, 0)] != B)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            51 => {
                C = k1;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                C = k2;
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            54 => {
                C2 = prev[@as(c_int, 0)];
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                if ((prev[@as(c_int, 1)] != A) and (prev[@as(c_int, 1)] != B)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            56 => {
                xy0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(A * xy_stride))))));
                xy1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(B * xy_stride))))));
                xy2_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(C * xy_stride))))));
                x0 = xy0_[@as(c_int, 0)];
                y0_1 = xy0_[@as(c_int, 1)];
                x1 = xy1_[@as(c_int, 0)];
                y1_2 = xy1_[@as(c_int, 1)];
                x2 = xy2_[@as(c_int, 0)];
                y2 = xy2_[@as(c_int, 1)];
                if (((x0 == x2) and (y1_2 == y2)) or ((y0_1 == y2) and (x1 == x2))) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            57 => {
                C2 = prev[@as(c_int, 1)];
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                C2 = prev[@as(c_int, 2)];
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                is_quad = 0;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                xy2_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(C2 * xy_stride))))));
                x2 = xy2_[@as(c_int, 0)];
                y2 = xy2_[@as(c_int, 1)];
                if (((x0 == x2) and (y1_2 == y2)) or ((y0_1 == y2) and (x1 == x2))) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                is_quad = 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            66 => {
                col0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(A * color_stride))))));
                col1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(B * color_stride))))));
                col2_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(C * color_stride))))));
                col3_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(C2 * color_stride))))));
                if (((SDL_memcmp_REAL(@ptrCast(@alignCast(col0_)), @ptrCast(@alignCast(col1_)), @sizeOf(@TypeOf(col0_.*))) == @as(c_int, 0)) and (SDL_memcmp_REAL(@ptrCast(@alignCast(col0_)), @ptrCast(@alignCast(col2_)), @sizeOf(@TypeOf(col0_.*))) == @as(c_int, 0))) and (SDL_memcmp_REAL(@ptrCast(@alignCast(col0_)), @ptrCast(@alignCast(col3_)), @sizeOf(@TypeOf(col0_.*))) == @as(c_int, 0))) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            68 => {
                if ((is_quad != 0) and (uv != null)) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                is_quad = 0;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            72 => {
                uv0_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(A * color_stride))))));
                uv1_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(B * color_stride))))));
                uv2_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(C * color_stride))))));
                uv3_ = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(C2 * color_stride))))));
                if ((((((((uv0_[@as(c_int, 0)] >= @as(f32, 0.0)) and (uv0_[@as(c_int, 0)] <= @as(f32, 1.0))) and (uv1_[@as(c_int, 0)] >= @as(f32, 0.0))) and (uv1_[@as(c_int, 0)] <= @as(f32, 1.0))) and (uv2_[@as(c_int, 0)] >= @as(f32, 0.0))) and (uv2_[@as(c_int, 0)] <= @as(f32, 1.0))) and (uv3_[@as(c_int, 0)] >= @as(f32, 0.0))) and (uv3_[@as(c_int, 0)] <= @as(f32, 1.0))) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
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
                if (is_quad != 0) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                is_quad = 0;
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            78 => {
                col0__7 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(color))) + @as(usize, @bitCast(@as(isize, @intCast(k0 * color_stride))))));
                xy0__3 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(A * xy_stride))))));
                xy1__4 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(xy))) + @as(usize, @bitCast(@as(isize, @intCast(B * xy_stride))))));
                if (texture != null) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            79 => {
                if (prev[@as(c_int, 0)] != -@as(c_int, 1)) {
                    sdl_pc = 99;
                    continue;
                } else {
                    sdl_pc = 100;
                    continue;
                }
            },
            80 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            81 => {
                uv0__5 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(A * uv_stride))))));
                uv1__6 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(B * uv_stride))))));
                s.x = uv0__5[@as(c_int, 0)] * texw;
                s.y = uv0__5[@as(c_int, 1)] * texh;
                s.w = (uv1__6[@as(c_int, 0)] * texw) - s.x;
                s.h = (uv1__6[@as(c_int, 1)] * texh) - s.y;
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                s.x = blk: {
                    const tmp = blk_1: {
                        const tmp_2 = blk_2: {
                            const tmp_3 = @as(f32, @floatFromInt(@as(c_int, 0)));
                            s.h = tmp_3;
                            break :blk_2 tmp_3;
                        };
                        s.w = tmp_2;
                        break :blk_1 tmp_2;
                    };
                    s.y = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                d.x = xy0__3[@as(c_int, 0)];
                d.y = xy0__3[@as(c_int, 1)];
                d.w = xy1__4[@as(c_int, 0)] - d.x;
                d.h = xy1__4[@as(c_int, 1)] - d.y;
                if (((texture != null) and (s.w != @as(f32, @floatFromInt(@as(c_int, 0))))) and (s.h != @as(f32, @floatFromInt(@as(c_int, 0))))) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                _ = SDL_SetTextureAlphaModFloat_REAL(texture, col0__7.*.a);
                _ = SDL_SetTextureColorModFloat_REAL(texture, col0__7.*.r, col0__7.*.g, col0__7.*.b);
                if ((s.w > @as(f32, @floatFromInt(@as(c_int, 0)))) and (s.h > @as(f32, @floatFromInt(@as(c_int, 0))))) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            85 => {
                if ((d.w != @as(f32, 0.0)) and (d.h != @as(f32, 0.0))) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            86 => {
                prev[@as(c_int, 0)] = -@as(c_int, 1);
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            87 => {
                _ = SDL_RenderTexture_REAL(renderer, texture, &s, &d);
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                flags = 0;
                if (s.w < @as(f32, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            89 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            90 => {
                flags |= SDL_FLIP_HORIZONTAL;
                s.w *= @floatFromInt(-@as(c_int, 1));
                s.x -= s.w;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                if (s.h < @as(f32, @floatFromInt(@as(c_int, 0)))) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                flags |= SDL_FLIP_VERTICAL;
                s.h *= @floatFromInt(-@as(c_int, 1));
                s.y -= s.h;
                {
                    sdl_pc = 95;
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
                _ = SDL_RenderTextureRotated_REAL(renderer, texture, &s, &d, @floatFromInt(@as(c_int, 0)), null, @bitCast(flags));
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            96 => {
                _ = SDL_SetRenderDrawBlendMode_REAL(renderer, SDL_BLENDMODE_BLEND);
                _ = SDL_SetRenderDrawColorFloat_REAL(renderer, col0__7.*.r, col0__7.*.g, col0__7.*.b, col0__7.*.a);
                _ = SDL_RenderFillRect_REAL(renderer, &d);
                {
                    sdl_pc = 98;
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
                    sdl_pc = 86;
                    continue;
                }
            },
            99 => {
                result = QueueCmdGeometry(renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, @ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(&prev))))), 3, 4, scale_x, scale_y, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
                if (!result) {
                    sdl_pc = 102;
                    continue;
                } else {
                    sdl_pc = 103;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                prev[@as(c_int, 0)] = k0;
                prev[@as(c_int, 1)] = k1;
                prev[@as(c_int, 2)] = k2;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            103 => {
                {
                    sdl_pc = 104;
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
                result = QueueCmdGeometry(renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, @ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(&prev))))), 3, 4, scale_x, scale_y, SDL_TEXTURE_ADDRESS_CLAMP, SDL_TEXTURE_ADDRESS_CLAMP);
                if (!result) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            106 => {
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 107;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_RenderGeometryRaw_REAL(renderer: [*c]SDL_Renderer, arg_texture: [*c]SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_FColor, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, arg_size_indices: c_int) bool {
    @setEvalBranchQuota(100000);
    var texture = arg_texture;
    _ = &texture;
    var size_indices = arg_size_indices;
    _ = &size_indices;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = if (indices != null) num_indices else num_vertices;
    _ = &count;
    var texture_address_mode_u: SDL_TextureAddressMode = SDL_TEXTURE_ADDRESS_CLAMP;
    _ = &texture_address_mode_u;
    var texture_address_mode_v: SDL_TextureAddressMode = SDL_TEXTURE_ADDRESS_CLAMP;
    _ = &texture_address_mode_v;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (texture != null) {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
            return @"false" != 0;
        }
        if (renderer != texture.*.renderer) {
            return SDL_SetError_REAL("Texture was not created with this renderer");
        }
    }
    if (!(xy != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("xy"))));
    }
    if (!(color != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("color"))));
    }
    if ((texture != null) and !(uv != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("uv"))));
    }
    _ = &count;
    if (__helpers.signedRemainder(count, @as(c_int, 3)) != @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", if (indices != null) @as([*c]u8, @as([*c]u8, @constCast("num_indices"))) else @as([*c]u8, @as([*c]u8, @constCast("num_vertices"))));
    }
    if (indices != null) {
        if (((size_indices != @as(c_int, 1)) and (size_indices != @as(c_int, 2))) and (size_indices != @as(c_int, 4))) {
            return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("size_indices"))));
        }
    }
    if (!(indices != null)) {
        size_indices = 0;
    }
    if (!(renderer.*.QueueGeometry != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (num_vertices < @as(c_int, 3)) {
        return @"true" != 0;
    }
    if (texture != null) {
        if (!UpdateTexturePalette(texture)) {
            return @"false" != 0;
        }
        if (texture.*.native != null) {
            texture = texture.*.native;
        }
        if (renderer.*.npot_texture_wrap_unsupported and IsNPOT(texture.*.w)) {
            texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
        } else {
            texture_address_mode_u = renderer.*.texture_address_mode_u;
        }
        if (renderer.*.npot_texture_wrap_unsupported and IsNPOT(texture.*.h)) {
            texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
        } else {
            texture_address_mode_v = renderer.*.texture_address_mode_v;
        }
        if ((texture_address_mode_u == SDL_TEXTURE_ADDRESS_AUTO) or (texture_address_mode_v == SDL_TEXTURE_ADDRESS_AUTO)) {
            {
                i = 0;
                while (i < num_vertices) : (i += 1) {
                    var uv_: [*c]const f32 = @ptrCast(@alignCast(@as([*c]const u8, @ptrCast(@alignCast(uv))) + @as(usize, @bitCast(@as(isize, @intCast(i * uv_stride))))));
                    _ = &uv_;
                    var u: f32 = uv_[@as(c_int, 0)];
                    _ = &u;
                    var v: f32 = uv_[@as(c_int, 1)];
                    _ = &v;
                    if ((u < @as(f32, 0.0)) or (u > @as(f32, 1.0))) {
                        if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_AUTO) {
                            texture_address_mode_u = SDL_TEXTURE_ADDRESS_WRAP;
                            if (texture_address_mode_v != SDL_TEXTURE_ADDRESS_AUTO) {
                                break;
                            }
                        }
                    }
                    if ((v < @as(f32, 0.0)) or (v > @as(f32, 1.0))) {
                        if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_AUTO) {
                            texture_address_mode_v = SDL_TEXTURE_ADDRESS_WRAP;
                            if (texture_address_mode_u != SDL_TEXTURE_ADDRESS_AUTO) {
                                break;
                            }
                        }
                    }
                }
            }
            if (texture_address_mode_u == SDL_TEXTURE_ADDRESS_AUTO) {
                texture_address_mode_u = SDL_TEXTURE_ADDRESS_CLAMP;
            }
            if (texture_address_mode_v == SDL_TEXTURE_ADDRESS_AUTO) {
                texture_address_mode_v = SDL_TEXTURE_ADDRESS_CLAMP;
            }
        }
    }
    if (indices != null) {
        {
            i = 0;
            while (i < num_indices) : (i += 1) {
                var j: c_int = undefined;
                _ = &j;
                if (size_indices == @as(c_int, 4)) {
                    j = @bitCast(@as(c_uint, @truncate(@as([*c]const Uint32, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))])));
                } else if (size_indices == @as(c_int, 2)) {
                    j = @as([*c]const Uint16, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
                } else {
                    j = @as([*c]const Uint8, @ptrCast(@alignCast(indices)))[@bitCast(@as(isize, @intCast(i)))];
                }
                if ((j < @as(c_int, 0)) or (j >= num_vertices)) {
                    return SDL_SetError_REAL("Values of 'indices' out of bounds");
                }
            }
        }
    }
    if (texture != null) {
        texture.*.last_command_generation = renderer.*.render_command_generation;
    }
    if ((renderer.*.software and (texture_address_mode_u == SDL_TEXTURE_ADDRESS_CLAMP)) and (texture_address_mode_v == SDL_TEXTURE_ADDRESS_CLAMP)) {
        return SDL_SW_RenderGeometryRaw(renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, indices, num_indices, size_indices);
    }
    var view: [*c]const SDL_RenderViewState = renderer.*.view;
    _ = &view;
    return QueueCmdGeometry(renderer, texture, xy, xy_stride, color, color_stride, uv, uv_stride, num_vertices, indices, num_indices, size_indices, view.*.current_scale.x, view.*.current_scale.y, texture_address_mode_u, texture_address_mode_v);
}
pub export fn SDL_SetRenderTextureAddressMode_REAL(renderer: [*c]SDL_Renderer, u_mode: SDL_TextureAddressMode, v_mode: SDL_TextureAddressMode) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    renderer.*.texture_address_mode_u = u_mode;
    renderer.*.texture_address_mode_v = v_mode;
    return @"true" != 0;
}
pub export fn SDL_GetRenderTextureAddressMode_REAL(renderer: [*c]SDL_Renderer, u_mode: [*c]SDL_TextureAddressMode, v_mode: [*c]SDL_TextureAddressMode) bool {
    @setEvalBranchQuota(100000);
    if (u_mode != null) {
        u_mode.* = SDL_TEXTURE_ADDRESS_INVALID;
    }
    if (v_mode != null) {
        v_mode.* = SDL_TEXTURE_ADDRESS_INVALID;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (u_mode != null) {
        u_mode.* = renderer.*.texture_address_mode_u;
    }
    if (v_mode != null) {
        v_mode.* = renderer.*.texture_address_mode_v;
    }
    return @"true" != 0;
}
pub export fn SDL_RenderReadPixels_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (!(renderer.*.RenderReadPixels != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return null;
    }
    _ = FlushRenderCommands(renderer);
    var real_rect: SDL_Rect = renderer.*.view.*.pixel_viewport;
    _ = &real_rect;
    if (rect != null) {
        if (!SDL_GetRectIntersection_REAL(rect, &real_rect, &real_rect)) {
            _ = SDL_SetError_REAL("Can't read outside the current viewport");
            return null;
        }
    }
    var surface: [*c]SDL_Surface = renderer.*.RenderReadPixels.?(renderer, &real_rect);
    _ = &surface;
    if (surface != null) {
        var props: SDL_PropertiesID = SDL_GetSurfaceProperties_REAL(surface);
        _ = &props;
        if (renderer.*.target != null) {
            var target: [*c]SDL_Texture = renderer.*.target;
            _ = &target;
            var parent: [*c]SDL_Texture = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetTextureProperties_REAL(target), "SDL.internal.texture.parent", null)));
            _ = &parent;
            var expected_format: SDL_PixelFormat = if (parent != null) parent.*.format else target.*.format;
            _ = &expected_format;
            if (@as(SDL_TransferCharacteristics, (target.*.colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)) == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ)) {
                _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.SDR_white_point", target.*.SDR_white_point * SCRGB_NITS);
            } else {
                _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.SDR_white_point", target.*.SDR_white_point);
            }
            _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.HDR_headroom", target.*.HDR_headroom);
            if (((((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) and (expected_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XRGB8888))) or ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBA8888)) and (expected_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_RGBX8888)))) or ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ABGR8888)) and (expected_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_XBGR8888)))) or ((surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRA8888)) and (expected_format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_BGRX8888)))) {
                surface.*.format = expected_format;
                surface.*.fmt = SDL_GetPixelFormatDetails_REAL(expected_format);
            }
        } else {
            if (@as(SDL_TransferCharacteristics, (renderer.*.output_colorspace >> @intCast(@as(SDL_Colorspace, 5))) & @as(SDL_Colorspace, 31)) == @as(SDL_TransferCharacteristics, SDL_TRANSFER_CHARACTERISTICS_PQ)) {
                _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.SDR_white_point", renderer.*.SDR_white_point * SCRGB_NITS);
            } else {
                _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.SDR_white_point", renderer.*.SDR_white_point);
            }
            _ = SDL_SetFloatProperty_REAL(props, "SDL.surface.HDR_headroom", renderer.*.HDR_headroom);
        }
    }
    return surface;
}
pub fn SDL_RenderApplyWindowShape(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var shape: [*c]SDL_Surface = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetWindowProperties_REAL(renderer.*.window), "SDL.window.shape", null)));
    _ = &shape;
    if (shape != renderer.*.shape_surface) {
        if (renderer.*.shape_texture != null) {
            SDL_DestroyTexture_REAL(renderer.*.shape_texture);
            renderer.*.shape_texture = null;
        }
        if (shape != null) {
            renderer.*.shape_texture = SDL_CreateTextureFromSurface_REAL(renderer, shape);
            _ = SDL_SetTextureBlendMode_REAL(renderer.*.shape_texture, SDL_ComposeCustomBlendMode_REAL(SDL_BLENDFACTOR_ZERO, SDL_BLENDFACTOR_SRC_ALPHA, SDL_BLENDOPERATION_ADD, SDL_BLENDFACTOR_ZERO, SDL_BLENDFACTOR_SRC_ALPHA, SDL_BLENDOPERATION_ADD));
        }
        renderer.*.shape_surface = shape;
    }
    if (renderer.*.shape_texture != null) {
        _ = SDL_RenderTexture_REAL(renderer, renderer.*.shape_texture, null, null);
    }
}
pub fn SDL_SimulateRenderVSync(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var now: Uint64 = undefined;
    _ = &now;
    var elapsed: Uint64 = undefined;
    _ = &elapsed;
    const interval: Uint64 = renderer.*.simulate_vsync_interval_ns;
    _ = &interval;
    if (!(interval != 0)) {
        return;
    }
    now = SDL_GetTicksNS_REAL();
    elapsed = now -% renderer.*.last_present;
    if (elapsed < interval) {
        var duration: Uint64 = interval -% elapsed;
        _ = &duration;
        SDL_DelayPrecise_REAL(duration);
        now = SDL_GetTicksNS_REAL();
    }
    elapsed = now -% renderer.*.last_present;
    if (!(renderer.*.last_present != 0) or (elapsed > (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 1000)))) *% @as(Uint64, SDL_NS_PER_MS)))) {
        renderer.*.last_present = now;
    } else {
        renderer.*.last_present +%= (elapsed / interval) *% interval;
    }
}
pub export fn SDL_RenderPresent_REAL(renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    var presented: bool = @"true" != 0;
    _ = &presented;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (renderer.*.target != null) {
        if (!(renderer.*.window != null) and (SDL_strcmp_REAL(renderer.*.name, "gpu") == @as(c_int, 0))) {} else {
            return SDL_SetError_REAL("You can't present on a render target");
        }
    }
    if (renderer.*.transparent_window) {
        SDL_RenderApplyWindowShape(renderer);
    }
    _ = FlushRenderCommands(renderer);
    if (!renderer.*.RenderPresent.?(renderer)) {
        presented = @"false" != 0;
    }
    if (renderer.*.simulate_vsync or (!presented and renderer.*.wanted_vsync)) {
        SDL_SimulateRenderVSync(renderer);
    }
    return @"true" != 0;
}
pub fn SDL_DestroyTextureInternal(texture: [*c]SDL_Texture, is_destroying: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var renderer: [*c]SDL_Renderer = undefined;
    _ = &renderer;
    if (texture.*.public_palette != null) {
        _ = SDL_SetTexturePalette_REAL(texture, null);
    }
    SDL_DestroyProperties_REAL(texture.*.props);
    renderer = texture.*.renderer;
    if (is_destroying) {} else {
        if (texture == renderer.*.target) {
            _ = SDL_SetRenderTarget_REAL(renderer, null);
        } else {
            _ = FlushRenderCommandsIfTextureNeeded(texture);
        }
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE, @"false" != 0);
    if (texture.*.next != null) {
        texture.*.next.*.prev = texture.*.prev;
    }
    if (texture.*.prev != null) {
        texture.*.prev.*.next = texture.*.next;
    } else {
        renderer.*.textures = texture.*.next;
    }
    if (texture.*.native != null) {
        SDL_DestroyTextureInternal(texture.*.native, is_destroying);
    }
    if (texture.*.yuv != null) {
        SDL_SW_DestroyYUVTexture(texture.*.yuv);
    }
    SDL_free_REAL(texture.*.pixels);
    renderer.*.DestroyTexture.?(renderer, texture);
    if (texture.*.palette_surface != null) {
        SDL_DestroySurface_REAL(texture.*.palette_surface);
        texture.*.palette_surface = null;
    }
    if (texture.*.locked_surface != null) {
        SDL_DestroySurface_REAL(texture.*.locked_surface);
        texture.*.locked_surface = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(texture)));
}
pub export fn SDL_DestroyTexture_REAL(texture: [*c]SDL_Texture) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(texture)), SDL_OBJECT_TYPE_TEXTURE)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("texture"))));
        return;
    }
    if ((blk: {
        const ref = &texture.*.refcount;
        ref.* -= 1;
        break :blk ref.*;
    }) > @as(c_int, 0)) {
        return;
    }
    SDL_DestroyTextureInternal(texture, @"false" != 0);
}
pub fn SDL_DiscardAllCommands(renderer: [*c]SDL_Renderer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cmd: [*c]SDL_RenderCommand = undefined;
    _ = &cmd;
    if (renderer.*.render_commands_tail != null) {
        renderer.*.render_commands_tail.*.next = renderer.*.render_commands_pool;
        cmd = renderer.*.render_commands;
    } else {
        cmd = renderer.*.render_commands_pool;
    }
    renderer.*.render_commands_pool = null;
    renderer.*.render_commands_tail = null;
    renderer.*.render_commands = null;
    renderer.*.vertex_data_used = 0;
    while (cmd != null) {
        var next: [*c]SDL_RenderCommand = cmd.*.next;
        _ = &next;
        SDL_free_REAL(@ptrCast(@alignCast(cmd)));
        cmd = next;
    }
}
pub export fn SDL_DestroyRendererWithoutFreeing(renderer: [*c]SDL_Renderer) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_DestroyRendererWithoutFreeing".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(renderer))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 5814);
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
    while (true) {
        while (!!renderer.*.destroyed) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!renderer->destroyed",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 5815);
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
    renderer.*.destroyed = @"true" != 0;
    if (renderer.*.window != null) {
        SDL_RemoveWindowEventWatch(SDL_WINDOW_EVENT_WATCH_NORMAL, SDL_RendererEventWatch, @ptrCast(@alignCast(renderer)));
        SDL_RemoveWindowRenderer(renderer.*.window, renderer);
    }
    if (renderer.*.software) {
        _ = FlushRenderCommands(renderer);
    }
    SDL_DiscardAllCommands(renderer);
    if (renderer.*.debug_char_texture_atlas != null) {
        SDL_DestroyTexture_REAL(renderer.*.debug_char_texture_atlas);
        renderer.*.debug_char_texture_atlas = null;
    }
    while (renderer.*.textures != null) {
        var tex: [*c]SDL_Texture = renderer.*.textures;
        _ = &tex;
        SDL_DestroyTextureInternal(renderer.*.textures, @"true" != 0);
        while (true) {
            while (!(tex != renderer.*.textures)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "tex != renderer->textures",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 5839);
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
    }
    if (renderer.*.palettes != null) {
        while (true) {
            while (!SDL_HashTableEmpty(renderer.*.palettes)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "SDL_HashTableEmpty(renderer->palettes)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 5844);
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
        SDL_DestroyHashTable(renderer.*.palettes);
        renderer.*.palettes = null;
    }
    if (renderer.*.DestroyRenderer != null) {
        renderer.*.DestroyRenderer.?(renderer);
    }
    if (renderer.*.target_mutex != null) {
        SDL_DestroyMutex_REAL(renderer.*.target_mutex);
        renderer.*.target_mutex = null;
    }
    if (renderer.*.vertex_data != null) {
        SDL_free_REAL(renderer.*.vertex_data);
        renderer.*.vertex_data = null;
    }
    if (renderer.*.texture_formats != null) {
        SDL_free_REAL(@ptrCast(@alignCast(renderer.*.texture_formats)));
        renderer.*.texture_formats = null;
    }
    if (renderer.*.props != 0) {
        SDL_DestroyProperties_REAL(renderer.*.props);
        renderer.*.props = 0;
    }
}
pub export fn SDL_DestroyRenderer_REAL(renderer: [*c]SDL_Renderer) void {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return;
    }
    if (!renderer.*.destroyed) {
        SDL_DestroyRendererWithoutFreeing(renderer);
    }
    var curr: [*c]SDL_Renderer = SDL_renderers;
    _ = &curr;
    var prev: [*c]SDL_Renderer = null;
    _ = &prev;
    while (curr != null) {
        if (curr == renderer) {
            if (prev != null) {
                prev.*.next = renderer.*.next;
            } else {
                SDL_renderers = renderer.*.next;
            }
            break;
        }
        prev = curr;
        curr = curr.*.next;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER, @"false" != 0);
    SDL_free_REAL(@ptrCast(@alignCast(renderer)));
}
pub export fn SDL_GetRenderMetalLayer_REAL(renderer: [*c]SDL_Renderer) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (renderer.*.GetMetalLayer != null) {
        _ = FlushRenderCommands(renderer);
        return renderer.*.GetMetalLayer.?(renderer);
    }
    return null;
}
pub export fn SDL_GetRenderMetalCommandEncoder_REAL(renderer: [*c]SDL_Renderer) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (renderer.*.GetMetalCommandEncoder != null) {
        _ = FlushRenderCommands(renderer);
        return renderer.*.GetMetalCommandEncoder.?(renderer);
    }
    return null;
}
pub export fn SDL_AddVulkanRenderSemaphores_REAL(renderer: [*c]SDL_Renderer, wait_stage_mask: Uint32, wait_semaphore: Sint64, signal_semaphore: Sint64) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(renderer.*.AddVulkanRenderSemaphores != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return renderer.*.AddVulkanRenderSemaphores.?(renderer, wait_stage_mask, wait_semaphore, signal_semaphore);
}
pub fn SDL_GetShortBlendMode(blendMode: SDL_BlendMode) callconv(.c) SDL_BlendMode {
    @setEvalBranchQuota(100000);
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_NONE;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_ALPHA))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_BLEND;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_BLEND_PREMULTIPLIED;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_ALPHA))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_ADD;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_ADD_PREMULTIPLIED;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_COLOR))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_MOD;
    }
    if (blendMode == ((((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_DST_COLOR))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24))))) {
        return SDL_BLENDMODE_MUL;
    }
    return blendMode;
}
pub fn SDL_GetLongBlendMode(blendMode: SDL_BlendMode) callconv(.c) SDL_BlendMode {
    @setEvalBranchQuota(100000);
    if (blendMode == SDL_BLENDMODE_NONE) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_BLEND) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_ALPHA))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_BLEND_PREMULTIPLIED) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_ADD) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_ALPHA))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_ADD_PREMULTIPLIED) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_MOD) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_SRC_COLOR))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24)));
    }
    if (blendMode == SDL_BLENDMODE_MUL) {
        return (((((@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 0))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_DST_COLOR))) << @intCast(@as(Uint32, 4)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA))) << @intCast(@as(Uint32, 8)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDOPERATION_ADD))) << @intCast(@as(Uint32, 16)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ZERO))) << @intCast(@as(Uint32, 20)))) | (@as(Uint32, @bitCast(@as(c_int, SDL_BLENDFACTOR_ONE))) << @intCast(@as(Uint32, 24)));
    }
    return blendMode;
}
pub export fn SDL_ComposeCustomBlendMode_REAL(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode {
    @setEvalBranchQuota(100000);
    var blendMode: SDL_BlendMode = (((((colorOperation << @intCast(@as(Uint32, 0))) | (srcColorFactor << @intCast(@as(Uint32, 4)))) | (dstColorFactor << @intCast(@as(Uint32, 8)))) | (alphaOperation << @intCast(@as(Uint32, 16)))) | (srcAlphaFactor << @intCast(@as(Uint32, 20)))) | (dstAlphaFactor << @intCast(@as(Uint32, 24)));
    _ = &blendMode;
    return SDL_GetShortBlendMode(blendMode);
}
pub export fn SDL_GetBlendModeSrcColorFactor(arg_blendMode: SDL_BlendMode) SDL_BlendFactor {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 4))) & @as(Uint32, 15);
}
pub export fn SDL_GetBlendModeDstColorFactor(arg_blendMode: SDL_BlendMode) SDL_BlendFactor {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 8))) & @as(Uint32, 15);
}
pub export fn SDL_GetBlendModeColorOperation(arg_blendMode: SDL_BlendMode) SDL_BlendOperation {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 0))) & @as(Uint32, 15);
}
pub export fn SDL_GetBlendModeSrcAlphaFactor(arg_blendMode: SDL_BlendMode) SDL_BlendFactor {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 20))) & @as(Uint32, 15);
}
pub export fn SDL_GetBlendModeDstAlphaFactor(arg_blendMode: SDL_BlendMode) SDL_BlendFactor {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 24))) & @as(Uint32, 15);
}
pub export fn SDL_GetBlendModeAlphaOperation(arg_blendMode: SDL_BlendMode) SDL_BlendOperation {
    @setEvalBranchQuota(100000);
    var blendMode = arg_blendMode;
    _ = &blendMode;
    blendMode = SDL_GetLongBlendMode(blendMode);
    return (blendMode >> @intCast(@as(Uint32, 16))) & @as(Uint32, 15);
}
pub export fn SDL_SetRenderVSync_REAL(renderer: [*c]SDL_Renderer, vsync: c_int) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (renderer.*.destroyed) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                renderer.*.wanted_vsync = (if (vsync != 0) @"true" else @"false") != 0;
                if (renderer.*.software) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                if (!(renderer.*.window != null)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!(renderer.*.SetVSync != null) or !renderer.*.SetVSync.?(renderer, vsync)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            10 => {
                if (!(vsync != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (SDL_SetWindowTextureVSync(null, renderer.*.window, vsync)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            13 => {
                return @"true" != 0;
            },
            14 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                renderer.*.simulate_vsync = @"false" != 0;
                return @"true" != 0;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            19 => {
                switch (vsync) {
                    @as(c_int, 0) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 24;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                _ = SDL_SetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.vsync", vsync);
                return @"true" != 0;
            },
            22 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            23 => {
                renderer.*.simulate_vsync = @"false" != 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                renderer.*.simulate_vsync = @"true" != 0;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            25 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetRenderVSync_REAL(renderer: [*c]SDL_Renderer, vsync: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (vsync != null) {
        vsync.* = 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (vsync != null) {
        vsync.* = @truncate(SDL_GetNumberProperty_REAL(SDL_GetRendererProperties_REAL(renderer), "SDL.renderer.vsync", 0));
    }
    return @"true" != 0;
}
pub fn CreateDebugTextAtlas(renderer: [*c]SDL_Renderer) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "CreateDebugTextAtlas".*;
    };
    _ = &static_local___func__;
    const static_local_colors = struct {
        const colors: [2]SDL_Color = [2]SDL_Color{
            SDL_Color{
                .r = 255,
                .g = 255,
                .b = 255,
                .a = SDL_ALPHA_TRANSPARENT,
            },
            SDL_Color{
                .r = 255,
                .g = 255,
                .b = 255,
                .a = SDL_ALPHA_OPAQUE,
            },
        };
    };
    _ = &static_local_colors;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.debug_char_texture_atlas))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->debug_char_texture_atlas == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 6097);
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
    const charWidth: c_int = SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    _ = &charWidth;
    const charHeight: c_int = SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    _ = &charHeight;
    const rows: c_int = @divTrunc(SDL_DEBUG_FONT_NUM_GLYPHS, SDL_DEBUG_FONT_GLYPHS_PER_ROW) + @as(c_int, 1);
    _ = &rows;
    var atlas: [*c]SDL_Surface = SDL_CreateSurfaceZeroed((charWidth + @as(c_int, 2)) * SDL_DEBUG_FONT_GLYPHS_PER_ROW, rows * (charHeight + @as(c_int, 2)), SDL_PIXELFORMAT_INDEX8);
    _ = &atlas;
    if (!(atlas != null)) {
        return @"false" != 0;
    }
    var palette: [*c]SDL_Palette = SDL_CreateSurfacePalette_REAL(atlas);
    _ = &palette;
    if (!(palette != null) or !SDL_SetPaletteColors_REAL(palette, @ptrCast(@alignCast(&static_local_colors.colors)), 0, 2)) {
        SDL_DestroySurface_REAL(atlas);
        return @"false" != 0;
    }
    const pitch: c_int = atlas.*.pitch;
    _ = &pitch;
    _ = memset(atlas.*.pixels, '\x00', @bitCast(@as(c_long, atlas.*.h * atlas.*.pitch)));
    var column: c_int = 0;
    _ = &column;
    var row: c_int = 0;
    _ = &row;
    {
        var glyph: c_int = 0;
        _ = &glyph;
        while (glyph < SDL_DEBUG_FONT_NUM_GLYPHS) : (glyph += 1) {
            var linepos: [*c]Uint8 = (@as([*c]Uint8, @ptrCast(@alignCast(atlas.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(((row * (charHeight + @as(c_int, 2))) + @as(c_int, 1)) * pitch))))) + (@as(c_ulong, @bitCast(@as(c_long, (column * (charWidth + @as(c_int, 2))) + @as(c_int, 1)))) *% @sizeOf(Uint8));
            _ = &linepos;
            var charpos: [*c]const Uint8 = @as([*c]const Uint8, @ptrCast(@alignCast(&SDL_RenderDebugTextFontData))) + @as(usize, @bitCast(@as(isize, @intCast(glyph * @as(c_int, 8)))));
            _ = &charpos;
            {
                var iy: c_int = 0;
                _ = &iy;
                while (iy < charHeight) : (iy += 1) {
                    var curpos: [*c]Uint8 = linepos;
                    _ = &curpos;
                    {
                        var ix: c_int = 0;
                        _ = &ix;
                        while (ix < charWidth) : (ix += 1) {
                            (blk: {
                                const ref = &curpos;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            }).* = @bitCast(@as(i8, @truncate((@as(c_int, charpos.*) >> @intCast(ix)) & @as(c_int, 1))));
                        }
                    }
                    linepos += @as(usize, @bitCast(@as(isize, @intCast(pitch))));
                    charpos += 1;
                }
            }
            column += 1;
            if (column >= SDL_DEBUG_FONT_GLYPHS_PER_ROW) {
                row += 1;
                column = 0;
            }
        }
    }
    while (true) {
        while (!((row < rows) or ((row == rows) and (column == @as(c_int, 0))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(row < rows) || ((row == rows) && (column == 0))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 6143);
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
    var texture: [*c]SDL_Texture = SDL_CreateTextureFromSurface_REAL(renderer, atlas);
    _ = &texture;
    if (texture != null) {
        _ = SDL_SetTextureScaleMode_REAL(texture, SDL_SCALEMODE_PIXELART);
        _ = SDL_SetTextureBlendMode_REAL(texture, SDL_BLENDMODE_BLEND);
        renderer.*.debug_char_texture_atlas = texture;
    }
    SDL_DestroySurface_REAL(atlas);
    return @as(?*anyopaque, @ptrCast(@alignCast(texture))) != @as(?*anyopaque, null);
}
pub fn DrawDebugCharacter(renderer: [*c]SDL_Renderer, x: f32, y: f32, c: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "DrawDebugCharacter".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(renderer.*.debug_char_texture_atlas))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "renderer->debug_char_texture_atlas != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_render.c", 6159);
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
    const charWidth: c_int = SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    _ = &charWidth;
    const charHeight: c_int = SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    _ = &charHeight;
    var ci: Uint32 = c;
    _ = &ci;
    if ((ci <= @as(Uint32, 32)) or ((ci >= @as(Uint32, 127)) and (ci <= @as(Uint32, 160)))) {
        return @"true" != 0;
    } else if (ci >= @as(Uint32, SDL_DEBUG_FONT_NUM_GLYPHS)) {
        ci = @bitCast(@as(c_int, SDL_DEBUG_FONT_NUM_GLYPHS - @as(c_int, 1)));
    } else if (ci < @as(Uint32, 127)) {
        ci -%= 33;
    } else {
        ci -%= 67;
    }
    const src_x: f32 = @floatFromInt(((ci % @as(Uint32, SDL_DEBUG_FONT_GLYPHS_PER_ROW)) *% @as(Uint32, @bitCast(@as(c_int, charWidth + @as(c_int, 2))))) +% @as(Uint32, 1));
    _ = &src_x;
    const src_y: f32 = @floatFromInt(((ci / @as(Uint32, SDL_DEBUG_FONT_GLYPHS_PER_ROW)) *% @as(Uint32, @bitCast(@as(c_int, charHeight + @as(c_int, 2))))) +% @as(Uint32, 1));
    _ = &src_y;
    const srect: SDL_FRect = SDL_FRect{
        .x = src_x,
        .y = src_y,
        .w = @floatFromInt(charWidth),
        .h = @floatFromInt(charHeight),
    };
    _ = &srect;
    const drect: SDL_FRect = SDL_FRect{
        .x = x,
        .y = y,
        .w = @floatFromInt(charWidth),
        .h = @floatFromInt(charHeight),
    };
    _ = &drect;
    return SDL_RenderTexture_REAL(renderer, renderer.*.debug_char_texture_atlas, &srect, &drect);
}
pub export fn SDL_RenderDebugText_REAL(renderer: [*c]SDL_Renderer, x: f32, y: f32, arg_s: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var s = arg_s;
    _ = &s;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (!(renderer.*.debug_char_texture_atlas != null)) {
        if (!CreateDebugTextAtlas(renderer)) {
            return @"false" != 0;
        }
    }
    var result: bool = @"true" != 0;
    _ = &result;
    var r: Uint8 = undefined;
    _ = &r;
    var g: Uint8 = undefined;
    _ = &g;
    var b: Uint8 = undefined;
    _ = &b;
    var a: Uint8 = undefined;
    _ = &a;
    {
        const ref = &result;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_GetRenderDrawColor_REAL(renderer, &r, &g, &b, &a)))) != 0;
    }
    {
        const ref = &result;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_SetTextureColorMod_REAL(renderer.*.debug_char_texture_atlas, r, g, b)))) != 0;
    }
    {
        const ref = &result;
        ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(SDL_SetTextureAlphaMod_REAL(renderer.*.debug_char_texture_atlas, a)))) != 0;
    }
    var curx: f32 = x;
    _ = &curx;
    var ch: Uint32 = undefined;
    _ = &ch;
    while (result and ((blk: {
        const tmp = SDL_StepUTF8_REAL(&s, null);
        ch = tmp;
        break :blk tmp;
    }) != @as(Uint32, 0))) {
        {
            const ref = &result;
            ref.* = (@as(c_int, @intFromBool(ref.*)) & @as(c_int, @intFromBool(DrawDebugCharacter(renderer, curx, y, ch)))) != 0;
        }
        curx += @floatFromInt(SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE);
    }
    return result;
}
pub export fn SDL_RenderDebugTextFormat_REAL(renderer: [*c]SDL_Renderer, x: f32, y: f32, fmt: [*c]const u8, ...) bool {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    if (SDL_strcmp_REAL(fmt, "%s") == @as(c_int, 0)) {
        var str: [*c]const u8 = __builtin.va_arg(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), [*c]const u8);
        _ = &str;
        __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
        return SDL_RenderDebugText_REAL(renderer, x, y, str);
    }
    var str: [*c]u8 = null;
    _ = &str;
    const rc: c_int = SDL_vasprintf_REAL(&str, fmt, @ptrCast(@alignCast(&ap)));
    _ = &rc;
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
    if (rc == -@as(c_int, 1)) {
        return @"false" != 0;
    }
    const retval: bool = SDL_RenderDebugText_REAL(renderer, x, y, str);
    _ = &retval;
    SDL_free_REAL(@ptrCast(@alignCast(str)));
    return retval;
}
pub export fn SDL_SetDefaultTextureScaleMode_REAL(renderer: [*c]SDL_Renderer, scale_mode: SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    renderer.*.scale_mode = scale_mode;
    return @"true" != 0;
}
pub export fn SDL_GetDefaultTextureScaleMode_REAL(renderer: [*c]SDL_Renderer, scale_mode: [*c]SDL_ScaleMode) bool {
    @setEvalBranchQuota(100000);
    if (scale_mode != null) {
        scale_mode.* = SDL_SCALEMODE_LINEAR;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    if (scale_mode != null) {
        scale_mode.* = renderer.*.scale_mode;
    }
    return @"true" != 0;
}
pub export fn SDL_CreateGPURenderState_REAL(renderer: [*c]SDL_Renderer, createinfo: [*c]const SDL_GPURenderStateCreateInfo) [*c]SDL_GPURenderState {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return null;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return null;
    }
    if (!(createinfo != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("createinfo"))));
        return null;
    }
    if (!(createinfo.*.fragment_shader != null)) {
        _ = SDL_SetError_REAL("A fragment_shader is required");
        return null;
    }
    var device: ?*SDL_GPUDevice = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(renderer.*.props, "SDL.renderer.gpu.device", null)));
    _ = &device;
    if (!(device != null)) {
        _ = SDL_SetError_REAL("Renderer isn't associated with a GPU device");
        return null;
    }
    var state: [*c]SDL_GPURenderState = undefined;
    state = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(state.*)))));
    _ = &state;
    if (!(state != null)) {
        return null;
    }
    state.*.renderer = renderer;
    state.*.fragment_shader = createinfo.*.fragment_shader;
    if (createinfo.*.num_sampler_bindings > @as(c_int, 0)) {
        state.*.sampler_bindings = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, createinfo.*.num_sampler_bindings)), @sizeOf(@TypeOf(state.*.sampler_bindings.*)))));
        if (!(state.*.sampler_bindings != null)) {
            SDL_DestroyGPURenderState_REAL(state);
            return null;
        }
        _ = memcpy(@ptrCast(@alignCast(state.*.sampler_bindings)), @ptrCast(@alignCast(createinfo.*.sampler_bindings)), @as(c_ulong, @bitCast(@as(c_long, createinfo.*.num_sampler_bindings))) *% @sizeOf(@TypeOf(state.*.sampler_bindings.*)));
        state.*.num_sampler_bindings = createinfo.*.num_sampler_bindings;
    }
    if (createinfo.*.num_storage_textures > @as(c_int, 0)) {
        state.*.storage_textures = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, createinfo.*.num_storage_textures)), @sizeOf(@TypeOf(state.*.storage_textures.*)))));
        if (!(state.*.storage_textures != null)) {
            SDL_DestroyGPURenderState_REAL(state);
            return null;
        }
        _ = memcpy(@ptrCast(@alignCast(state.*.storage_textures)), @ptrCast(@alignCast(createinfo.*.storage_textures)), @as(c_ulong, @bitCast(@as(c_long, createinfo.*.num_storage_textures))) *% @sizeOf(@TypeOf(state.*.storage_textures.*)));
        state.*.num_storage_textures = createinfo.*.num_storage_textures;
    }
    if (createinfo.*.num_storage_buffers > @as(c_int, 0)) {
        state.*.storage_buffers = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, createinfo.*.num_storage_buffers)), @sizeOf(@TypeOf(state.*.storage_buffers.*)))));
        if (!(state.*.storage_buffers != null)) {
            SDL_DestroyGPURenderState_REAL(state);
            return null;
        }
        _ = memcpy(@ptrCast(@alignCast(state.*.storage_buffers)), @ptrCast(@alignCast(createinfo.*.storage_buffers)), @as(c_ulong, @bitCast(@as(c_long, createinfo.*.num_storage_buffers))) *% @sizeOf(@TypeOf(state.*.storage_buffers.*)));
        state.*.num_storage_buffers = createinfo.*.num_storage_buffers;
    }
    return state;
}
pub export fn SDL_SetGPURenderStateSamplerBindings_REAL(state: [*c]SDL_GPURenderState, num_sampler_bindings: c_int, sampler_bindings: [*c]const SDL_GPUTextureSamplerBinding) bool {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("state"))));
    }
    if (!FlushRenderCommandsIfGPURenderStateNeeded(state)) {
        return @"false" != 0;
    }
    var length: Sint32 = @bitCast(@as(c_uint, @truncate(@sizeOf(SDL_GPUTextureSamplerBinding) *% @as(c_ulong, @bitCast(@as(c_long, num_sampler_bindings))))));
    _ = &length;
    var new_sampler_bindings: [*c]SDL_GPUTextureSamplerBinding = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(state.*.sampler_bindings)), @bitCast(@as(c_long, length)))));
    _ = &new_sampler_bindings;
    if (!(new_sampler_bindings != null)) {
        return @"false" != 0;
    }
    _ = memcpy(@ptrCast(@alignCast(new_sampler_bindings)), @ptrCast(@alignCast(sampler_bindings)), @bitCast(@as(c_long, length)));
    state.*.num_sampler_bindings = num_sampler_bindings;
    state.*.sampler_bindings = new_sampler_bindings;
    return @"true" != 0;
}
pub export fn SDL_SetGPURenderStateStorageTextures_REAL(state: [*c]SDL_GPURenderState, num_storage_textures: c_int, storage_textures: [*c]const ?*SDL_GPUTexture) bool {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("state"))));
    }
    if (!FlushRenderCommandsIfGPURenderStateNeeded(state)) {
        return @"false" != 0;
    }
    var length: Sint32 = @bitCast(@as(c_uint, @truncate(@sizeOf(?*SDL_GPUTexture) *% @as(c_ulong, @bitCast(@as(c_long, num_storage_textures))))));
    _ = &length;
    var new_storage_textures: [*c]?*SDL_GPUTexture = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(state.*.storage_textures)), @bitCast(@as(c_long, length)))));
    _ = &new_storage_textures;
    if (!(new_storage_textures != null)) {
        return @"false" != 0;
    }
    _ = memcpy(@ptrCast(@alignCast(new_storage_textures)), @ptrCast(@alignCast(storage_textures)), @bitCast(@as(c_long, length)));
    state.*.num_storage_textures = num_storage_textures;
    state.*.storage_textures = new_storage_textures;
    return @"true" != 0;
}
pub export fn SDL_SetGPURenderStateStorageBuffers_REAL(state: [*c]SDL_GPURenderState, num_storage_buffers: c_int, storage_buffers: [*c]const ?*SDL_GPUBuffer) bool {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("state"))));
    }
    if (!FlushRenderCommandsIfGPURenderStateNeeded(state)) {
        return @"false" != 0;
    }
    var length: Sint32 = @bitCast(@as(c_uint, @truncate(@sizeOf(?*SDL_GPUBuffer) *% @as(c_ulong, @bitCast(@as(c_long, num_storage_buffers))))));
    _ = &length;
    var new_storage_buffers: [*c]?*SDL_GPUBuffer = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(state.*.storage_buffers)), @bitCast(@as(c_long, length)))));
    _ = &new_storage_buffers;
    if (!(new_storage_buffers != null)) {
        return @"false" != 0;
    }
    _ = memcpy(@ptrCast(@alignCast(new_storage_buffers)), @ptrCast(@alignCast(storage_buffers)), @bitCast(@as(c_long, length)));
    state.*.num_storage_buffers = num_storage_buffers;
    state.*.storage_buffers = new_storage_buffers;
    return @"true" != 0;
}
pub export fn SDL_SetGPURenderStateFragmentUniforms_REAL(state: [*c]SDL_GPURenderState, slot_index: Uint32, data: ?*const anyopaque, length: Uint32) bool {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("state"))));
    }
    if (!FlushRenderCommandsIfGPURenderStateNeeded(state)) {
        return @"false" != 0;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < state.*.num_uniform_buffers) : (i += 1) {
            var buffer: [*c]SDL_GPURenderStateUniformBuffer = &state.*.uniform_buffers[@bitCast(@as(isize, @intCast(i)))];
            _ = &buffer;
            if (buffer.*.slot_index == slot_index) {
                var new_data: ?*anyopaque = SDL_realloc_REAL(buffer.*.data, length);
                _ = &new_data;
                if (!(new_data != null)) {
                    return @"false" != 0;
                }
                _ = memcpy(new_data, data, length);
                buffer.*.data = new_data;
                buffer.*.length = length;
                return @"true" != 0;
            }
        }
    }
    var buffers: [*c]SDL_GPURenderStateUniformBuffer = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(state.*.uniform_buffers)), @as(c_ulong, @bitCast(@as(c_long, state.*.num_uniform_buffers + @as(c_int, 1)))) *% @sizeOf(@TypeOf(state.*.uniform_buffers.*)))));
    _ = &buffers;
    if (!(buffers != null)) {
        return @"false" != 0;
    }
    var buffer: [*c]SDL_GPURenderStateUniformBuffer = &buffers[@bitCast(@as(isize, @intCast(state.*.num_uniform_buffers)))];
    _ = &buffer;
    buffer.*.slot_index = slot_index;
    buffer.*.length = length;
    buffer.*.data = SDL_malloc_REAL(length);
    if (!(buffer.*.data != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(buffers)));
        return @"false" != 0;
    }
    _ = memcpy(buffer.*.data, data, length);
    state.*.uniform_buffers = buffers;
    state.*.num_uniform_buffers += 1;
    return @"true" != 0;
}
pub export fn SDL_SetGPURenderState_REAL(renderer: [*c]SDL_Renderer, state: [*c]SDL_GPURenderState) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ObjectValid(@ptrCast(@alignCast(renderer)), SDL_OBJECT_TYPE_RENDERER)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("renderer"))));
        return @"false" != 0;
    }
    if (renderer.*.destroyed) {
        _ = SDL_SetError_REAL("Renderer's window has been destroyed, can't use further");
        return @"false" != 0;
    }
    renderer.*.gpu_render_state = state;
    return @"true" != 0;
}
pub export fn SDL_DestroyGPURenderState_REAL(state: [*c]SDL_GPURenderState) void {
    @setEvalBranchQuota(100000);
    if (!(state != null)) {
        return;
    }
    _ = FlushRenderCommandsIfGPURenderStateNeeded(state);
    if (state.*.num_uniform_buffers > @as(c_int, 0)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < state.*.num_uniform_buffers) : (i += 1) {
                SDL_free_REAL(state.*.uniform_buffers[@bitCast(@as(isize, @intCast(i)))].data);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(state.*.uniform_buffers)));
    }
    SDL_free_REAL(@ptrCast(@alignCast(state.*.sampler_bindings)));
    SDL_free_REAL(@ptrCast(@alignCast(state.*.storage_textures)));
    SDL_free_REAL(@ptrCast(@alignCast(state.*.storage_buffers)));
    SDL_free_REAL(@ptrCast(@alignCast(state)));
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_AddVulkanRenderSemaphores = SDL_AddVulkanRenderSemaphores_REAL;
pub const SDL_ComposeCustomBlendMode = SDL_ComposeCustomBlendMode_REAL;
pub const SDL_ConvertEventToRenderCoordinates = SDL_ConvertEventToRenderCoordinates_REAL;
pub const SDL_CreateRenderer = SDL_CreateRenderer_REAL;
pub const SDL_CreateRendererWithProperties = SDL_CreateRendererWithProperties_REAL;
pub const SDL_CreateSoftwareRenderer = SDL_CreateSoftwareRenderer_REAL;
pub const SDL_CreateTexture = SDL_CreateTexture_REAL;
pub const SDL_CreateTextureFromSurface = SDL_CreateTextureFromSurface_REAL;
pub const SDL_CreateTextureWithProperties = SDL_CreateTextureWithProperties_REAL;
pub const SDL_CreateWindowAndRenderer = SDL_CreateWindowAndRenderer_REAL;
pub const SDL_DestroyRenderer = SDL_DestroyRenderer_REAL;
pub const SDL_DestroyTexture = SDL_DestroyTexture_REAL;
pub const SDL_FlushRenderer = SDL_FlushRenderer_REAL;
pub const SDL_GetCurrentRenderOutputSize = SDL_GetCurrentRenderOutputSize_REAL;
pub const SDL_GetNumRenderDrivers = SDL_GetNumRenderDrivers_REAL;
pub const SDL_GetRenderClipRect = SDL_GetRenderClipRect_REAL;
pub const SDL_GetRenderColorScale = SDL_GetRenderColorScale_REAL;
pub const SDL_GetRenderDrawBlendMode = SDL_GetRenderDrawBlendMode_REAL;
pub const SDL_GetRenderDrawColor = SDL_GetRenderDrawColor_REAL;
pub const SDL_GetRenderDrawColorFloat = SDL_GetRenderDrawColorFloat_REAL;
pub const SDL_GetRenderDriver = SDL_GetRenderDriver_REAL;
pub const SDL_GetRenderLogicalPresentation = SDL_GetRenderLogicalPresentation_REAL;
pub const SDL_GetRenderLogicalPresentationRect = SDL_GetRenderLogicalPresentationRect_REAL;
pub const SDL_GetRenderMetalCommandEncoder = SDL_GetRenderMetalCommandEncoder_REAL;
pub const SDL_GetRenderMetalLayer = SDL_GetRenderMetalLayer_REAL;
pub const SDL_GetRenderOutputSize = SDL_GetRenderOutputSize_REAL;
pub const SDL_GetRenderSafeArea = SDL_GetRenderSafeArea_REAL;
pub const SDL_GetRenderScale = SDL_GetRenderScale_REAL;
pub const SDL_GetRenderTarget = SDL_GetRenderTarget_REAL;
pub const SDL_GetRenderVSync = SDL_GetRenderVSync_REAL;
pub const SDL_GetRenderViewport = SDL_GetRenderViewport_REAL;
pub const SDL_GetRenderWindow = SDL_GetRenderWindow_REAL;
pub const SDL_GetRenderer = SDL_GetRenderer_REAL;
pub const SDL_GetRendererFromTexture = SDL_GetRendererFromTexture_REAL;
pub const SDL_GetRendererName = SDL_GetRendererName_REAL;
pub const SDL_GetRendererProperties = SDL_GetRendererProperties_REAL;
pub const SDL_GetTextureAlphaMod = SDL_GetTextureAlphaMod_REAL;
pub const SDL_GetTextureAlphaModFloat = SDL_GetTextureAlphaModFloat_REAL;
pub const SDL_GetTextureBlendMode = SDL_GetTextureBlendMode_REAL;
pub const SDL_GetTextureColorMod = SDL_GetTextureColorMod_REAL;
pub const SDL_GetTextureColorModFloat = SDL_GetTextureColorModFloat_REAL;
pub const SDL_GetTextureProperties = SDL_GetTextureProperties_REAL;
pub const SDL_GetTextureScaleMode = SDL_GetTextureScaleMode_REAL;
pub const SDL_GetTextureSize = SDL_GetTextureSize_REAL;
pub const SDL_LockTexture = SDL_LockTexture_REAL;
pub const SDL_LockTextureToSurface = SDL_LockTextureToSurface_REAL;
pub const SDL_RenderClear = SDL_RenderClear_REAL;
pub const SDL_RenderClipEnabled = SDL_RenderClipEnabled_REAL;
pub const SDL_RenderCoordinatesFromWindow = SDL_RenderCoordinatesFromWindow_REAL;
pub const SDL_RenderCoordinatesToWindow = SDL_RenderCoordinatesToWindow_REAL;
pub const SDL_RenderFillRect = SDL_RenderFillRect_REAL;
pub const SDL_RenderFillRects = SDL_RenderFillRects_REAL;
pub const SDL_RenderGeometry = SDL_RenderGeometry_REAL;
pub const SDL_RenderGeometryRaw = SDL_RenderGeometryRaw_REAL;
pub const SDL_RenderLine = SDL_RenderLine_REAL;
pub const SDL_RenderLines = SDL_RenderLines_REAL;
pub const SDL_RenderPoint = SDL_RenderPoint_REAL;
pub const SDL_RenderPoints = SDL_RenderPoints_REAL;
pub const SDL_RenderPresent = SDL_RenderPresent_REAL;
pub const SDL_RenderReadPixels = SDL_RenderReadPixels_REAL;
pub const SDL_RenderRect = SDL_RenderRect_REAL;
pub const SDL_RenderRects = SDL_RenderRects_REAL;
pub const SDL_RenderTexture = SDL_RenderTexture_REAL;
pub const SDL_RenderTexture9Grid = SDL_RenderTexture9Grid_REAL;
pub const SDL_RenderTextureRotated = SDL_RenderTextureRotated_REAL;
pub const SDL_RenderTextureTiled = SDL_RenderTextureTiled_REAL;
pub const SDL_RenderViewportSet = SDL_RenderViewportSet_REAL;
pub const SDL_SetRenderClipRect = SDL_SetRenderClipRect_REAL;
pub const SDL_SetRenderColorScale = SDL_SetRenderColorScale_REAL;
pub const SDL_SetRenderDrawBlendMode = SDL_SetRenderDrawBlendMode_REAL;
pub const SDL_SetRenderDrawColor = SDL_SetRenderDrawColor_REAL;
pub const SDL_SetRenderDrawColorFloat = SDL_SetRenderDrawColorFloat_REAL;
pub const SDL_SetRenderLogicalPresentation = SDL_SetRenderLogicalPresentation_REAL;
pub const SDL_SetRenderScale = SDL_SetRenderScale_REAL;
pub const SDL_SetRenderTarget = SDL_SetRenderTarget_REAL;
pub const SDL_SetRenderVSync = SDL_SetRenderVSync_REAL;
pub const SDL_SetRenderViewport = SDL_SetRenderViewport_REAL;
pub const SDL_SetTextureAlphaMod = SDL_SetTextureAlphaMod_REAL;
pub const SDL_SetTextureAlphaModFloat = SDL_SetTextureAlphaModFloat_REAL;
pub const SDL_SetTextureBlendMode = SDL_SetTextureBlendMode_REAL;
pub const SDL_SetTextureColorMod = SDL_SetTextureColorMod_REAL;
pub const SDL_SetTextureColorModFloat = SDL_SetTextureColorModFloat_REAL;
pub const SDL_SetTextureScaleMode = SDL_SetTextureScaleMode_REAL;
pub const SDL_UnlockTexture = SDL_UnlockTexture_REAL;
pub const SDL_UpdateNVTexture = SDL_UpdateNVTexture_REAL;
pub const SDL_UpdateTexture = SDL_UpdateTexture_REAL;
pub const SDL_UpdateYUVTexture = SDL_UpdateYUVTexture_REAL;
pub const SDL_RenderDebugText = SDL_RenderDebugText_REAL;
pub const SDL_RenderTextureAffine = SDL_RenderTextureAffine_REAL;
pub const SDL_RenderDebugTextFormat = SDL_RenderDebugTextFormat_REAL;
pub const SDL_RenderTexture9GridTiled = SDL_RenderTexture9GridTiled_REAL;
pub const SDL_SetDefaultTextureScaleMode = SDL_SetDefaultTextureScaleMode_REAL;
pub const SDL_GetDefaultTextureScaleMode = SDL_GetDefaultTextureScaleMode_REAL;
pub const SDL_CreateGPURenderState = SDL_CreateGPURenderState_REAL;
pub const SDL_SetGPURenderStateFragmentUniforms = SDL_SetGPURenderStateFragmentUniforms_REAL;
pub const SDL_SetGPURenderState = SDL_SetGPURenderState_REAL;
pub const SDL_DestroyGPURenderState = SDL_DestroyGPURenderState_REAL;
pub const SDL_SetRenderTextureAddressMode = SDL_SetRenderTextureAddressMode_REAL;
pub const SDL_GetRenderTextureAddressMode = SDL_GetRenderTextureAddressMode_REAL;
pub const SDL_CreateGPURenderer = SDL_CreateGPURenderer_REAL;
pub const SDL_SetTexturePalette = SDL_SetTexturePalette_REAL;
pub const SDL_GetTexturePalette = SDL_GetTexturePalette_REAL;
pub const SDL_GetGPURendererDevice = SDL_GetGPURendererDevice_REAL;
pub const SDL_SetGPURenderStateSamplerBindings = SDL_SetGPURenderStateSamplerBindings_REAL;
pub const SDL_SetGPURenderStateStorageTextures = SDL_SetGPURenderStateStorageTextures_REAL;
pub const SDL_SetGPURenderStateStorageBuffers = SDL_SetGPURenderStateStorageBuffers_REAL;
pub const SDL_GDKSuspendRenderer = @compileError("unable to translate macro: undefined identifier `SDL_GDKSuspendRenderer_REAL`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/dynapi/SDL_dynapi_overrides.h:1312:9
pub const SDL_GDKResumeRenderer = @compileError("unable to translate macro: undefined identifier `SDL_GDKResumeRenderer_REAL`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/dynapi/SDL_dynapi_overrides.h:1313:9
pub const SDL_SetRenderViewportFloat = SDL_SetRenderViewportFloat_REAL;
pub const SDL_GetRenderViewportFloat = SDL_GetRenderViewportFloat_REAL;
pub const SDL_SetRenderClipRectFloat = SDL_SetRenderClipRectFloat_REAL;
pub const SDL_GetRenderClipRectFloat = SDL_GetRenderClipRectFloat_REAL;
pub const SDL_SetSoftwareRendererWindow = SDL_SetSoftwareRendererWindow_REAL;
pub const SDL_SetSoftwareRendererSurface = SDL_SetSoftwareRendererSurface_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:15:9
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
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
pub const SDL_SURFACE_LOCK_NEEDED = @as(c_uint, 0x00000002);
pub const SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = @as(c_int, 8);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_DEBUG_FONT_NUM_GLYPHS = @as(c_int, 190);
pub const SCRGB_NITS = @as(f32, 80.0);
pub const SDL_DEBUG_FONT_GLYPHS_PER_ROW = @as(c_int, 14);
