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
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
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
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_itoa_REAL(value: c_int, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_ceilf_REAL(x: f32) f32;
pub extern fn SDL_fabsf_REAL(x: f32) f32;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_CompareAndSwapAtomicPointer_REAL(a: [*c]?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) bool;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_CopyProperties_REAL(src: SDL_PropertiesID, dst: SDL_PropertiesID) bool;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub extern fn SDL_SetFloatProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: f32) bool;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub extern fn SDL_HasProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub extern fn SDL_DestroyProperties_REAL(props: SDL_PropertiesID) void;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub extern fn SDL_GetCurrentThreadID_REAL() SDL_ThreadID;
pub extern fn SDL_GetTLS_REAL(id: [*c]SDL_TLSID) ?*anyopaque;
pub const SDL_TLSDestructorCallback = ?*const fn (value: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetTLS_REAL(id: [*c]SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub const SDL_AudioDeviceID = Uint32;
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
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_P010: c_int = 808530000;
pub const SDL_PIXELFORMAT_I0FL: c_int = 1279668297;
pub const SDL_PIXELFORMAT_I4FL: c_int = 1279669321;
pub const SDL_PIXELFORMAT_ARGB32: c_int = 377888772;
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
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
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
pub inline fn SDL_RectEmpty(r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @"true" else @"false") != 0;
}
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectUnion_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub extern fn SDL_GetRectEnclosingPoints_REAL(points: [*c]const SDL_Point, count: c_int, clip: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
pub const SDL_SurfaceFlags = Uint32;
pub const enum_SDL_ScaleMode = c_int;
pub const SDL_ScaleMode = enum_SDL_ScaleMode;
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
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_CameraID = Uint32;
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const SDL_SYSTEM_THEME_UNKNOWN: c_int = 0;
pub const enum_SDL_SystemTheme = c_uint;
pub const SDL_SystemTheme = enum_SDL_SystemTheme;
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
pub const SDL_ORIENTATION_UNKNOWN: c_int = 0;
pub const SDL_ORIENTATION_LANDSCAPE: c_int = 1;
pub const enum_SDL_DisplayOrientation = c_uint;
pub const SDL_DisplayOrientation = enum_SDL_DisplayOrientation;
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const SDL_PROGRESS_STATE_INVALID: c_int = -1;
pub const SDL_PROGRESS_STATE_NONE: c_int = 0;
pub const SDL_PROGRESS_STATE_ERROR: c_int = 4;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const SDL_EVENT_TERMINATING: c_int = 257;
pub const SDL_EVENT_LOW_MEMORY: c_int = 258;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND: c_int = 259;
pub const SDL_EVENT_DID_ENTER_BACKGROUND: c_int = 260;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND: c_int = 261;
pub const SDL_EVENT_DID_ENTER_FOREGROUND: c_int = 262;
pub const SDL_EVENT_DISPLAY_ADDED: c_int = 338;
pub const SDL_EVENT_DISPLAY_REMOVED: c_int = 339;
pub const SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED: c_int = 341;
pub const SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED: c_int = 342;
pub const SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED: c_int = 343;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_HIDDEN: c_int = 515;
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED: c_int = 531;
pub const SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED: c_int = 532;
pub const SDL_EVENT_WINDOW_SAFE_AREA_CHANGED: c_int = 533;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const SDL_EVENT_WINDOW_DESTROYED: c_int = 537;
pub const SDL_EVENT_WINDOW_HDR_STATE_CHANGED: c_int = 538;
pub const SDL_EVENT_SCREEN_KEYBOARD_SHOWN: c_int = 776;
pub const SDL_EVENT_SCREEN_KEYBOARD_HIDDEN: c_int = 777;
pub const SDL_EVENT_DROP_FILE: c_int = 4096;
pub const SDL_EVENT_DROP_TEXT: c_int = 4097;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
pub const enum_SDL_TextureAccess = c_uint;
pub const SDL_TextureAccess = enum_SDL_TextureAccess;
pub const enum_SDL_RendererLogicalPresentation = c_uint;
pub const SDL_RendererLogicalPresentation = enum_SDL_RendererLogicalPresentation;
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
const struct_unnamed_9 = extern struct {
    first: usize = 0,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
const struct_unnamed_10 = extern struct {
    enabled: bool = false,
    rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
};
pub const enum_SDL_TextureAddressMode = c_int;
pub const SDL_TextureAddressMode = enum_SDL_TextureAddressMode;
pub const struct_SDL_GPUShader = opaque {};
pub const SDL_GPUShader = struct_SDL_GPUShader;
pub const struct_SDL_GPUTexture = opaque {};
pub const SDL_GPUTexture = struct_SDL_GPUTexture;
pub const struct_SDL_GPUSampler = opaque {};
pub const SDL_GPUSampler = struct_SDL_GPUSampler;
pub const struct_SDL_GPUTextureSamplerBinding = extern struct {
    texture: ?*SDL_GPUTexture = null,
    sampler: ?*SDL_GPUSampler = null,
};
pub const SDL_GPUTextureSamplerBinding = struct_SDL_GPUTextureSamplerBinding;
pub const struct_SDL_GPUBuffer = opaque {};
pub const SDL_GPUBuffer = struct_SDL_GPUBuffer;
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
const struct_unnamed_11 = extern struct {
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
const struct_unnamed_12 = extern struct {
    first: usize = 0,
    color_scale: f32 = 0,
    color: SDL_FColor = @import("std").mem.zeroes(SDL_FColor),
};
const union_unnamed_8 = extern union {
    viewport: struct_unnamed_9,
    cliprect: struct_unnamed_10,
    draw: struct_unnamed_11,
    color: struct_unnamed_12,
};
pub const struct_SDL_RenderCommand = extern struct {
    command: SDL_RenderCommandType = @import("std").mem.zeroes(SDL_RenderCommandType),
    data: union_unnamed_8 = @import("std").mem.zeroes(union_unnamed_8),
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
    window: [*c]SDL_Window = null,
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
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_WindowData = opaque {};
pub const SDL_WindowData = struct_SDL_WindowData;
pub const struct_SDL_Window = extern struct {
    id: SDL_WindowID = 0,
    title: [*c]u8 = null,
    icon: [*c]SDL_Surface = null,
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
    min_w: c_int = 0,
    min_h: c_int = 0,
    max_w: c_int = 0,
    max_h: c_int = 0,
    min_aspect: f32 = 0,
    max_aspect: f32 = 0,
    last_pixel_w: c_int = 0,
    last_pixel_h: c_int = 0,
    flags: SDL_WindowFlags = 0,
    pending_flags: SDL_WindowFlags = 0,
    display_scale: f32 = 0,
    external_graphics_context: bool = false,
    fullscreen_exclusive: bool = false,
    last_fullscreen_exclusive_display: SDL_DisplayID = 0,
    displayID: SDL_DisplayID = 0,
    pending_displayID: SDL_DisplayID = 0,
    windowed: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    floating: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    pending: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    tiled: bool = false,
    undefined_x: bool = false,
    undefined_y: bool = false,
    requested_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    opacity: f32 = 0,
    surface: [*c]SDL_Surface = null,
    surface_valid: bool = false,
    is_hiding: bool = false,
    restore_on_show: bool = false,
    last_position_pending: bool = false,
    last_size_pending: bool = false,
    update_fullscreen_on_display_changed: bool = false,
    constrain_popup: bool = false,
    is_destroying: bool = false,
    is_dropping: bool = false,
    safe_inset_left: c_int = 0,
    safe_inset_right: c_int = 0,
    safe_inset_top: c_int = 0,
    safe_inset_bottom: c_int = 0,
    safe_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_props: SDL_PropertiesID = 0,
    text_input_active: bool = false,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    mouse_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    hit_test: SDL_HitTest = null,
    hit_test_data: ?*anyopaque = null,
    progress_state: SDL_ProgressState = @import("std").mem.zeroes(SDL_ProgressState),
    progress_value: f32 = 0,
    props: SDL_PropertiesID = 0,
    num_renderers: c_int = 0,
    renderers: [*c][*c]SDL_Renderer = null,
    internal: ?*SDL_WindowData = null,
    keyboard_focus: [*c]SDL_Window = null,
    prev: [*c]SDL_Window = null,
    next: [*c]SDL_Window = null,
    parent: [*c]SDL_Window = null,
    first_child: [*c]SDL_Window = null,
    prev_sibling: [*c]SDL_Window = null,
    next_sibling: [*c]SDL_Window = null,
};
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const struct_SDL_GLContextState = opaque {
};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLSurface = ?*anyopaque;
pub const SDL_EGLAttrib = isize;
pub const SDL_EGLint = c_int;
pub const SDL_EGLAttribArrayCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_EGLAttrib;
pub const SDL_EGLIntArrayCallback = ?*const fn (userdata: ?*anyopaque, display: SDL_EGLDisplay, config: SDL_EGLConfig) callconv(.c) [*c]SDL_EGLint;
pub const SDL_GL_RED_SIZE: c_int = 0;
pub const SDL_GL_GREEN_SIZE: c_int = 1;
pub const SDL_GL_BLUE_SIZE: c_int = 2;
pub const SDL_GL_ALPHA_SIZE: c_int = 3;
pub const SDL_GL_BUFFER_SIZE: c_int = 4;
pub const SDL_GL_DOUBLEBUFFER: c_int = 5;
pub const SDL_GL_DEPTH_SIZE: c_int = 6;
pub const SDL_GL_STENCIL_SIZE: c_int = 7;
pub const SDL_GL_ACCUM_RED_SIZE: c_int = 8;
pub const SDL_GL_ACCUM_GREEN_SIZE: c_int = 9;
pub const SDL_GL_ACCUM_BLUE_SIZE: c_int = 10;
pub const SDL_GL_ACCUM_ALPHA_SIZE: c_int = 11;
pub const SDL_GL_STEREO: c_int = 12;
pub const SDL_GL_MULTISAMPLEBUFFERS: c_int = 13;
pub const SDL_GL_MULTISAMPLESAMPLES: c_int = 14;
pub const SDL_GL_ACCELERATED_VISUAL: c_int = 15;
pub const SDL_GL_RETAINED_BACKING: c_int = 16;
pub const SDL_GL_CONTEXT_MAJOR_VERSION: c_int = 17;
pub const SDL_GL_CONTEXT_MINOR_VERSION: c_int = 18;
pub const SDL_GL_CONTEXT_FLAGS: c_int = 19;
pub const SDL_GL_CONTEXT_PROFILE_MASK: c_int = 20;
pub const SDL_GL_SHARE_WITH_CURRENT_CONTEXT: c_int = 21;
pub const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE: c_int = 22;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR: c_int = 23;
pub const SDL_GL_CONTEXT_RESET_NOTIFICATION: c_int = 24;
pub const SDL_GL_CONTEXT_NO_ERROR: c_int = 25;
pub const SDL_GL_FLOATBUFFERS: c_int = 26;
pub const SDL_GL_EGL_PLATFORM: c_int = 27;
pub const enum_SDL_GLAttr = c_uint;
pub const SDL_GLAttr = enum_SDL_GLAttr;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_HasKeyboard_REAL() bool;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
pub extern fn SDL_ResetKeyboard_REAL() void;
pub const SDL_TEXTINPUT_TYPE_TEXT: c_int = 0;
pub const SDL_TEXTINPUT_TYPE_TEXT_NAME: c_int = 1;
pub const enum_SDL_TextInputType = c_uint;
pub const SDL_TextInputType = enum_SDL_TextInputType;
pub const SDL_CAPITALIZE_NONE: c_int = 0;
pub const SDL_CAPITALIZE_SENTENCES: c_int = 1;
pub const SDL_CAPITALIZE_WORDS: c_int = 2;
pub const enum_SDL_Capitalization = c_uint;
pub const SDL_Capitalization = enum_SDL_Capitalization;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: ?*SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const SDL_SYSTEM_CURSOR_DEFAULT: c_int = 0;
pub const SDL_SYSTEM_CURSOR_TEXT: c_int = 1;
pub const SDL_SYSTEM_CURSOR_WAIT: c_int = 2;
pub const SDL_SYSTEM_CURSOR_CROSSHAIR: c_int = 3;
pub const SDL_SYSTEM_CURSOR_PROGRESS: c_int = 4;
pub const SDL_SYSTEM_CURSOR_NWSE_RESIZE: c_int = 5;
pub const SDL_SYSTEM_CURSOR_NESW_RESIZE: c_int = 6;
pub const SDL_SYSTEM_CURSOR_EW_RESIZE: c_int = 7;
pub const SDL_SYSTEM_CURSOR_NS_RESIZE: c_int = 8;
pub const SDL_SYSTEM_CURSOR_MOVE: c_int = 9;
pub const SDL_SYSTEM_CURSOR_NOT_ALLOWED: c_int = 10;
pub const SDL_SYSTEM_CURSOR_POINTER: c_int = 11;
pub const SDL_SYSTEM_CURSOR_NW_RESIZE: c_int = 12;
pub const SDL_SYSTEM_CURSOR_N_RESIZE: c_int = 13;
pub const SDL_SYSTEM_CURSOR_NE_RESIZE: c_int = 14;
pub const SDL_SYSTEM_CURSOR_E_RESIZE: c_int = 15;
pub const SDL_SYSTEM_CURSOR_SE_RESIZE: c_int = 16;
pub const SDL_SYSTEM_CURSOR_S_RESIZE: c_int = 17;
pub const SDL_SYSTEM_CURSOR_SW_RESIZE: c_int = 18;
pub const SDL_SYSTEM_CURSOR_W_RESIZE: c_int = 19;
pub const SDL_SYSTEM_CURSOR_CONTEXT_MENU: c_int = 20;
pub const SDL_SYSTEM_CURSOR_HELP: c_int = 21;
pub const SDL_SYSTEM_CURSOR_CELL: c_int = 22;
pub const SDL_SYSTEM_CURSOR_VERTICAL_TEXT: c_int = 23;
pub const SDL_SYSTEM_CURSOR_ALIAS: c_int = 24;
pub const SDL_SYSTEM_CURSOR_COPY: c_int = 25;
pub const SDL_SYSTEM_CURSOR_NO_DROP: c_int = 26;
pub const SDL_SYSTEM_CURSOR_GRAB: c_int = 27;
pub const SDL_SYSTEM_CURSOR_GRABBING: c_int = 28;
pub const SDL_SYSTEM_CURSOR_COL_RESIZE: c_int = 29;
pub const SDL_SYSTEM_CURSOR_ROW_RESIZE: c_int = 30;
pub const SDL_SYSTEM_CURSOR_ALL_SCROLL: c_int = 31;
pub const SDL_SYSTEM_CURSOR_ZOOM_IN: c_int = 32;
pub const SDL_SYSTEM_CURSOR_ZOOM_OUT: c_int = 33;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const struct_SDL_CursorFrameInfo = extern struct {
    surface: [*c]SDL_Surface = null,
    duration: Uint32 = 0,
};
pub const SDL_CursorFrameInfo = struct_SDL_CursorFrameInfo;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub extern fn SDL_GetMouseFocus_REAL() [*c]SDL_Window;
pub extern fn SDL_ShowCursor_REAL() bool;
pub extern fn SDL_HideCursor_REAL() bool;
pub extern fn SDL_CursorVisible_REAL() bool;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
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
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub const SDL_InitFlags = Uint32;
pub const enum_SDL_AppResult = c_uint;
pub const SDL_AppResult = enum_SDL_AppResult;
pub extern fn SDL_Init_REAL(flags: SDL_InitFlags) bool;
pub extern fn SDL_InitSubSystem_REAL(flags: SDL_InitFlags) bool;
pub extern fn SDL_QuitSubSystem_REAL(flags: SDL_InitFlags) void;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = 0,
    buttonID: c_int = 0,
    text: [*c]const u8 = null,
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = 0,
    window: [*c]SDL_Window = null,
    title: [*c]const u8 = null,
    message: [*c]const u8 = null,
    numbuttons: c_int = 0,
    buttons: [*c]const SDL_MessageBoxButtonData = null,
    colorScheme: [*c]const SDL_MessageBoxColorScheme = null,
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub const SDL_MetalView = ?*anyopaque;
pub extern fn SDL_GetNumRenderDrivers_REAL() c_int;
pub extern fn SDL_GetRenderDriver_REAL(index: c_int) [*c]const u8;
pub extern fn SDL_CreateRenderer_REAL(window: [*c]SDL_Window, name: [*c]const u8) [*c]SDL_Renderer;
pub extern fn SDL_GetRenderer_REAL(window: [*c]SDL_Window) [*c]SDL_Renderer;
pub extern fn SDL_GetRendererProperties_REAL(renderer: [*c]SDL_Renderer) SDL_PropertiesID;
pub extern fn SDL_CreateTexture_REAL(renderer: [*c]SDL_Renderer, format: SDL_PixelFormat, access: SDL_TextureAccess, w: c_int, h: c_int) [*c]SDL_Texture;
pub extern fn SDL_SetTextureBlendMode_REAL(texture: [*c]SDL_Texture, blendMode: SDL_BlendMode) bool;
pub extern fn SDL_UpdateTexture_REAL(texture: [*c]SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) bool;
pub extern fn SDL_SetRenderViewport_REAL(renderer: [*c]SDL_Renderer, rect: [*c]const SDL_Rect) bool;
pub extern fn SDL_RenderTexture_REAL(renderer: [*c]SDL_Renderer, texture: [*c]SDL_Texture, srcrect: [*c]const SDL_FRect, dstrect: [*c]const SDL_FRect) bool;
pub extern fn SDL_RenderPresent_REAL(renderer: [*c]SDL_Renderer) bool;
pub extern fn SDL_DestroyTexture_REAL(texture: [*c]SDL_Texture) void;
pub extern fn SDL_DestroyRenderer_REAL(renderer: [*c]SDL_Renderer) void;
pub extern fn SDL_SetRenderVSync_REAL(renderer: [*c]SDL_Renderer, vsync: c_int) bool;
pub extern fn SDL_GetRenderVSync_REAL(renderer: [*c]SDL_Renderer, vsync: [*c]c_int) bool;
pub extern fn SDL_IsUbuntuTouch_REAL() bool;
pub extern fn SDL_CalculateFraction(x: f32, numerator: [*c]c_int, denominator: [*c]c_int) void;
pub const SDL_OBJECT_TYPE_WINDOW: c_int = 1;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_GetNextObjectID() Uint32;
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
pub extern fn SDL_DebugLogBackend(subsystem: [*c]const u8, backend: [*c]const u8) void;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const struct_VkAllocationCallbacks = opaque {};
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
pub const SDL_VideoDisplay = struct_SDL_VideoDisplay;
const struct_unnamed_19 = extern struct {
    red_size: c_int = 0,
    green_size: c_int = 0,
    blue_size: c_int = 0,
    alpha_size: c_int = 0,
    depth_size: c_int = 0,
    buffer_size: c_int = 0,
    stencil_size: c_int = 0,
    double_buffer: c_int = 0,
    accum_red_size: c_int = 0,
    accum_green_size: c_int = 0,
    accum_blue_size: c_int = 0,
    accum_alpha_size: c_int = 0,
    stereo: c_int = 0,
    multisamplebuffers: c_int = 0,
    multisamplesamples: c_int = 0,
    floatbuffers: c_int = 0,
    accelerated: c_int = 0,
    major_version: c_int = 0,
    minor_version: c_int = 0,
    flags: c_int = 0,
    profile_mask: c_int = 0,
    share_with_current_context: c_int = 0,
    release_behavior: c_int = 0,
    reset_notification: c_int = 0,
    framebuffer_srgb_capable: c_int = 0,
    no_error: c_int = 0,
    retained_backing: c_int = 0,
    egl_platform: c_int = 0,
    driver_loaded: c_int = 0,
    HAS_GL_ARB_color_buffer_float: c_int = 0,
    driver_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    dll_handle: ?*SDL_SharedObject = null,
};
const struct_unnamed_20 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_VideoData = opaque {};
pub const SDL_VideoData = struct_SDL_VideoData;
pub const struct_SDL_GLDriverData_21 = opaque {};
pub const EGLDisplay = ?*anyopaque;
pub const EGLConfig = ?*anyopaque;
pub const khronos_int32_t = i32;
pub const EGLint = khronos_int32_t;
pub const EGLenum = c_uint;
pub const EGLNativeDisplayType = ?*anyopaque;
pub const PFNEGLGETDISPLAYPROC = ?*const fn (display_id: EGLNativeDisplayType) callconv(.c) EGLDisplay;
pub const EGLBoolean = c_uint;
pub const PFNEGLINITIALIZEPROC = ?*const fn (dpy: EGLDisplay, major: [*c]EGLint, minor: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLTERMINATEPROC = ?*const fn (dpy: EGLDisplay) callconv(.c) EGLBoolean;
pub const __eglMustCastToProperFunctionPointerType = ?*const fn () callconv(.c) void;
pub const PFNEGLGETPROCADDRESSPROC = ?*const fn (procname: [*c]const u8) callconv(.c) __eglMustCastToProperFunctionPointerType;
pub const PFNEGLCHOOSECONFIGPROC = ?*const fn (dpy: EGLDisplay, attrib_list: [*c]const EGLint, configs: [*c]EGLConfig, config_size: EGLint, num_config: [*c]EGLint) callconv(.c) EGLBoolean;
pub const EGLContext = ?*anyopaque;
pub const PFNEGLCREATECONTEXTPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, share_context: EGLContext, attrib_list: [*c]const EGLint) callconv(.c) EGLContext;
pub const PFNEGLDESTROYCONTEXTPROC = ?*const fn (dpy: EGLDisplay, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const EGLSurface = ?*anyopaque;
pub const PFNEGLCREATEPBUFFERSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const khronos_uintptr_t = c_ulong;
pub const EGLNativeWindowType = khronos_uintptr_t;
pub const PFNEGLCREATEWINDOWSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, win: EGLNativeWindowType, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const PFNEGLDESTROYSURFACEPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLMAKECURRENTPROC = ?*const fn (dpy: EGLDisplay, draw: EGLSurface, read: EGLSurface, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const PFNEGLSWAPBUFFERSPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLSWAPINTERVALPROC = ?*const fn (dpy: EGLDisplay, interval: EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLQUERYSTRINGPROC = ?*const fn (dpy: EGLDisplay, name: EGLint) callconv(.c) [*c]const u8;
pub const PFNEGLGETCONFIGATTRIBPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attribute: EGLint, value: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLWAITNATIVEPROC = ?*const fn (engine: EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLWAITGLPROC = ?*const fn () callconv(.c) EGLBoolean;
pub const PFNEGLBINDAPIPROC = ?*const fn (api: EGLenum) callconv(.c) EGLBoolean;
pub const PFNEGLGETERRORPROC = ?*const fn () callconv(.c) EGLint;
pub const EGLDeviceEXT = ?*anyopaque;
pub const PFNEGLQUERYDEVICESEXTPROC = ?*const fn (max_devices: EGLint, devices: [*c]EGLDeviceEXT, num_devices: [*c]EGLint) callconv(.c) EGLBoolean;
pub const EGLAttrib = isize;
pub const PFNEGLGETPLATFORMDISPLAYPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) callconv(.c) EGLDisplay;
pub const PFNEGLGETPLATFORMDISPLAYEXTPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLint) callconv(.c) EGLDisplay;
pub const EGLSyncKHR = ?*anyopaque;
pub const PFNEGLCREATESYNCKHRPROC = ?*const fn (dpy: EGLDisplay, @"type": EGLenum, attrib_list: [*c]const EGLint) callconv(.c) EGLSyncKHR;
pub const PFNEGLDESTROYSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLBoolean;
pub const PFNEGLDUPNATIVEFENCEFDANDROIDPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLint;
pub const PFNEGLWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint) callconv(.c) EGLint;
pub const khronos_uint64_t = u64;
pub const khronos_utime_nanoseconds_t = khronos_uint64_t;
pub const EGLTimeKHR = khronos_utime_nanoseconds_t;
pub const PFNEGLCLIENTWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint, timeout: EGLTimeKHR) callconv(.c) EGLint;
pub const struct_SDL_EGL_VideoData = extern struct {
    opengl_dll_handle: ?*SDL_SharedObject = null,
    egl_dll_handle: ?*SDL_SharedObject = null,
    egl_display: EGLDisplay = null,
    egl_config: EGLConfig = null,
    egl_swapinterval: c_int = 0,
    egl_surfacetype: c_int = 0,
    egl_version_major: c_int = 0,
    egl_version_minor: c_int = 0,
    egl_required_visual_id: EGLint = 0,
    is_offscreen: bool = false,
    apitype: EGLenum = 0,
    eglGetDisplay: PFNEGLGETDISPLAYPROC = null,
    eglInitialize: PFNEGLINITIALIZEPROC = null,
    eglTerminate: PFNEGLTERMINATEPROC = null,
    eglGetProcAddress: PFNEGLGETPROCADDRESSPROC = null,
    eglChooseConfig: PFNEGLCHOOSECONFIGPROC = null,
    eglCreateContext: PFNEGLCREATECONTEXTPROC = null,
    eglDestroyContext: PFNEGLDESTROYCONTEXTPROC = null,
    eglCreatePbufferSurface: PFNEGLCREATEPBUFFERSURFACEPROC = null,
    eglCreateWindowSurface: PFNEGLCREATEWINDOWSURFACEPROC = null,
    eglDestroySurface: PFNEGLDESTROYSURFACEPROC = null,
    eglMakeCurrent: PFNEGLMAKECURRENTPROC = null,
    eglSwapBuffers: PFNEGLSWAPBUFFERSPROC = null,
    eglSwapInterval: PFNEGLSWAPINTERVALPROC = null,
    eglQueryString: PFNEGLQUERYSTRINGPROC = null,
    eglGetConfigAttrib: PFNEGLGETCONFIGATTRIBPROC = null,
    eglWaitNative: PFNEGLWAITNATIVEPROC = null,
    eglWaitGL: PFNEGLWAITGLPROC = null,
    eglBindAPI: PFNEGLBINDAPIPROC = null,
    eglGetError: PFNEGLGETERRORPROC = null,
    eglQueryDevicesEXT: PFNEGLQUERYDEVICESEXTPROC = null,
    eglGetPlatformDisplay: PFNEGLGETPLATFORMDISPLAYPROC = null,
    eglGetPlatformDisplayEXT: PFNEGLGETPLATFORMDISPLAYEXTPROC = null,
    eglCreateSyncKHR: PFNEGLCREATESYNCKHRPROC = null,
    eglDestroySyncKHR: PFNEGLDESTROYSYNCKHRPROC = null,
    eglDupNativeFenceFDANDROID: PFNEGLDUPNATIVEFENCEFDANDROIDPROC = null,
    eglWaitSyncKHR: PFNEGLWAITSYNCKHRPROC = null,
    eglClientWaitSyncKHR: PFNEGLCLIENTWAITSYNCKHRPROC = null,
};
pub const struct_SDL_PrivateGLESData_22 = opaque {};
pub const struct_SDL_VideoDevice = extern struct {
    name: [*c]const u8 = null,
    VideoInit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    VideoQuit: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    ResetTouch: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    RefreshDisplays: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GetDisplayBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayUsableBounds: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool = null,
    GetDisplayModes: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) callconv(.c) bool = null,
    SetDisplayMode: ?*const fn (_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) callconv(.c) bool = null,
    CreateSDLWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) callconv(.c) bool = null,
    SetWindowTitle: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowIcon: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) callconv(.c) bool = null,
    SetWindowPosition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMinimumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowMaximumSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowAspectRatio: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    GetWindowBordersSize: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) callconv(.c) bool = null,
    GetWindowContentScale: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) f32 = null,
    GetWindowSizeInPixels: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) callconv(.c) void = null,
    SetWindowOpacity: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) callconv(.c) bool = null,
    SetWindowParent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowModal: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) callconv(.c) bool = null,
    ShowWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    HideWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RaiseWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MaximizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    MinimizeWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    RestoreWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetWindowBordered: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) callconv(.c) void = null,
    SetWindowResizable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, resizable: bool) callconv(.c) void = null,
    SetWindowAlwaysOnTop: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, on_top: bool) callconv(.c) void = null,
    SetWindowFullscreen: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) callconv(.c) SDL_FullscreenResult = null,
    GetWindowICCProfile: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    GetDisplayForWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_DisplayID = null,
    SetWindowMouseRect: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowMouseGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    SetWindowKeyboardGrab: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) callconv(.c) bool = null,
    DestroyWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    CreateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, format: [*c]SDL_PixelFormat, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool = null,
    SetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: c_int) callconv(.c) bool = null,
    GetWindowFramebufferVSync: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: [*c]c_int) callconv(.c) bool = null,
    UpdateWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) callconv(.c) bool = null,
    DestroyWindowFramebuffer: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    OnWindowEnter: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    UpdateWindowShape: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, shape: [*c]SDL_Surface) callconv(.c) bool = null,
    FlashWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) callconv(.c) bool = null,
    ApplyWindowProgress: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    SetWindowFocusable: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) callconv(.c) bool = null,
    SetWindowFillDocument: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, fill: bool) callconv(.c) bool = null,
    SyncWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ReconfigureWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) bool = null,
    GL_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    GL_GetProcAddress: ?*const fn (_this: [*c]SDL_VideoDevice, proc: [*c]const u8) callconv(.c) SDL_FunctionPointer = null,
    GL_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    GL_CreateContext: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_GLContext = null,
    GL_MakeCurrent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) callconv(.c) bool = null,
    GL_GetEGLSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_EGLSurface = null,
    GL_SetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: c_int) callconv(.c) bool = null,
    GL_GetSwapInterval: ?*const fn (_this: [*c]SDL_VideoDevice, interval: [*c]c_int) callconv(.c) bool = null,
    GL_SwapWindow: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    GL_DestroyContext: ?*const fn (_this: [*c]SDL_VideoDevice, context: SDL_GLContext) callconv(.c) bool = null,
    GL_SetDefaultProfileConfig: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_LoadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice, path: [*c]const u8) callconv(.c) bool = null,
    Vulkan_UnloadLibrary: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    Vulkan_GetInstanceExtensions: ?*const fn (_this: [*c]SDL_VideoDevice, count: [*c]Uint32) callconv(.c) [*c]const [*c]const u8 = null,
    Vulkan_CreateSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) callconv(.c) bool = null,
    Vulkan_DestroySurface: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) callconv(.c) void = null,
    Vulkan_GetPresentationSupport: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) callconv(.c) bool = null,
    Metal_CreateView: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) SDL_MetalView = null,
    Metal_DestroyView: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) void = null,
    Metal_GetLayer: ?*const fn (_this: [*c]SDL_VideoDevice, view: SDL_MetalView) callconv(.c) ?*anyopaque = null,
    WaitEventTimeout: ?*const fn (_this: [*c]SDL_VideoDevice, timeoutNS: Sint64) callconv(.c) c_int = null,
    SendWakeupEvent: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    PumpEvents: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
    SuspendScreenSaver: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    StartTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) bool = null,
    StopTextInput: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    UpdateTextInputArea: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    ClearComposition: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
    HasScreenKeyboardSupport: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    HideScreenKeyboard: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void = null,
    SetTextInputProperties: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) callconv(.c) void = null,
    GetTextMimeTypes: ?*const fn (_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) callconv(.c) [*c]const [*c]const u8 = null,
    SetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    GetClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*anyopaque = null,
    HasClipboardData: ?*const fn (_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8) callconv(.c) bool = null,
    SetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasClipboardText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    SetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice, text: [*c]const u8) callconv(.c) bool = null,
    GetPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) [*c]u8 = null,
    HasPrimarySelectionText: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) bool = null,
    ShowMessageBox: ?*const fn (_this: [*c]SDL_VideoDevice, messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) callconv(.c) bool = null,
    SetWindowHitTest: ?*const fn (window: [*c]SDL_Window, enabled: bool) callconv(.c) bool = null,
    AcceptDragAndDrop: ?*const fn (window: [*c]SDL_Window, accept: bool) callconv(.c) void = null,
    ShowWindowSystemMenu: ?*const fn (window: [*c]SDL_Window, x: c_int, y: c_int) callconv(.c) void = null,
    thread: SDL_ThreadID = 0,
    checked_texture_framebuffer: bool = false,
    suspend_screensaver: bool = false,
    wakeup_window: ?*anyopaque = null,
    num_displays: c_int = 0,
    displays: [*c][*c]SDL_VideoDisplay = null,
    desktop_bounds: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    windows: [*c]SDL_Window = null,
    grabbed_window: [*c]SDL_Window = null,
    clipboard_sequence: Uint32 = 0,
    clipboard_callback: SDL_ClipboardDataCallback = null,
    clipboard_cleanup: SDL_ClipboardCleanupCallback = null,
    clipboard_userdata: ?*anyopaque = null,
    clipboard_mime_types: [*c][*c]u8 = null,
    num_clipboard_mime_types: usize = 0,
    primary_selection_text: [*c]u8 = null,
    setting_display_mode: bool = false,
    device_caps: Uint32 = 0,
    system_theme: SDL_SystemTheme = @import("std").mem.zeroes(SDL_SystemTheme),
    screen_keyboard_shown: bool = false,
    is_quitting: bool = false,
    gl_config: struct_unnamed_19 = @import("std").mem.zeroes(struct_unnamed_19),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_20 = @import("std").mem.zeroes(struct_unnamed_20),
    internal: ?*SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_21 = null,
    egl_data: [*c]struct_SDL_EGL_VideoData = null,
    gles_data: ?*struct_SDL_PrivateGLESData_22 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const struct_SDL_DisplayData = opaque {};
pub const SDL_DisplayData = struct_SDL_DisplayData;
pub const struct_SDL_VideoDisplay = extern struct {
    id: SDL_DisplayID = 0,
    name: [*c]u8 = null,
    max_fullscreen_modes: c_int = 0,
    num_fullscreen_modes: c_int = 0,
    fullscreen_modes: [*c]SDL_DisplayMode = null,
    desktop_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_mode: [*c]const SDL_DisplayMode = null,
    natural_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    current_orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    content_scale: f32 = 0,
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    fullscreen_active: bool = false,
    fullscreen_window: [*c]SDL_Window = null,
    device: [*c]SDL_VideoDevice = null,
    props: SDL_PropertiesID = 0,
    internal: ?*SDL_DisplayData = null,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const VIDEO_DEVICE_CAPS_MODE_SWITCHING_EMULATED: c_int = 1;
pub const VIDEO_DEVICE_CAPS_HAS_POPUP_WINDOW_SUPPORT: c_int = 2;
pub const VIDEO_DEVICE_CAPS_SENDS_FULLSCREEN_DIMENSIONS: c_int = 4;
pub const VIDEO_DEVICE_CAPS_FULLSCREEN_ONLY: c_int = 8;
pub const VIDEO_DEVICE_CAPS_SENDS_DISPLAY_CHANGES: c_int = 16;
pub const VIDEO_DEVICE_CAPS_SENDS_HDR_CHANGES: c_int = 32;
pub const VIDEO_DEVICE_CAPS_SLOW_FRAMEBUFFER: c_int = 64;
pub const SDL_FULLSCREEN_OP_LEAVE: c_int = 0;
pub const SDL_FULLSCREEN_OP_ENTER: c_int = 1;
pub const SDL_FULLSCREEN_OP_UPDATE: c_int = 2;
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FULLSCREEN_FAILED: c_int = 0;
pub const SDL_FULLSCREEN_SUCCEEDED: c_int = 1;
pub const SDL_FullscreenResult = c_uint;
pub const struct_VideoBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn () callconv(.c) [*c]SDL_VideoDevice = null,
    ShowMessageBox: ?*const fn (messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) callconv(.c) bool = null,
    is_preferred: bool = false,
};
pub const VideoBootStrap = struct_VideoBootStrap;
pub extern var X11_bootstrap: VideoBootStrap;
pub extern var KMSDRM_bootstrap: VideoBootStrap;
pub extern var DUMMY_bootstrap: VideoBootStrap;
pub extern var DUMMY_evdev_bootstrap: VideoBootStrap;
pub extern var Wayland_preferred_bootstrap: VideoBootStrap;
pub extern var Wayland_bootstrap: VideoBootStrap;
pub extern var OFFSCREEN_bootstrap: VideoBootStrap;
pub extern fn SDL_CancelClipboardData(sequence: Uint32) void;
pub extern fn eglChooseConfig(dpy: EGLDisplay, attrib_list: [*c]const EGLint, configs: [*c]EGLConfig, config_size: EGLint, num_config: [*c]EGLint) EGLBoolean;
pub extern fn eglCreateContext(dpy: EGLDisplay, config: EGLConfig, share_context: EGLContext, attrib_list: [*c]const EGLint) EGLContext;
pub extern fn eglCreatePbufferSurface(dpy: EGLDisplay, config: EGLConfig, attrib_list: [*c]const EGLint) EGLSurface;
pub extern fn eglCreateWindowSurface(dpy: EGLDisplay, config: EGLConfig, win: EGLNativeWindowType, attrib_list: [*c]const EGLint) EGLSurface;
pub extern fn eglDestroyContext(dpy: EGLDisplay, ctx: EGLContext) EGLBoolean;
pub extern fn eglDestroySurface(dpy: EGLDisplay, surface: EGLSurface) EGLBoolean;
pub extern fn eglGetConfigAttrib(dpy: EGLDisplay, config: EGLConfig, attribute: EGLint, value: [*c]EGLint) EGLBoolean;
pub extern fn eglGetDisplay(display_id: EGLNativeDisplayType) EGLDisplay;
pub extern fn eglGetError() EGLint;
pub extern fn eglGetProcAddress(procname: [*c]const u8) __eglMustCastToProperFunctionPointerType;
pub extern fn eglInitialize(dpy: EGLDisplay, major: [*c]EGLint, minor: [*c]EGLint) EGLBoolean;
pub extern fn eglMakeCurrent(dpy: EGLDisplay, draw: EGLSurface, read: EGLSurface, ctx: EGLContext) EGLBoolean;
pub extern fn eglQueryString(dpy: EGLDisplay, name: EGLint) [*c]const u8;
pub extern fn eglSwapBuffers(dpy: EGLDisplay, surface: EGLSurface) EGLBoolean;
pub extern fn eglTerminate(dpy: EGLDisplay) EGLBoolean;
pub extern fn eglWaitGL() EGLBoolean;
pub extern fn eglWaitNative(engine: EGLint) EGLBoolean;
pub extern fn eglSwapInterval(dpy: EGLDisplay, interval: EGLint) EGLBoolean;
pub extern fn eglBindAPI(api: EGLenum) EGLBoolean;
pub extern fn eglGetPlatformDisplay(platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) EGLDisplay;
pub extern fn SDL_EGL_GetProcAddressInternal(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_GetSpanEnclosingRect(width: c_int, height: c_int, numrects: c_int, rects: [*c]const SDL_Rect, span: [*c]SDL_Rect) bool;
pub extern fn SDL_SendDisplayEvent(display: [*c]SDL_VideoDisplay, displayevent: SDL_EventType, data1: c_int, data2: c_int) void;
pub extern fn SDL_InitKeyboard() bool;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_QuitKeyboard() void;
pub const SDL_CursorAnimation = extern struct {
    last_update: Uint64 = 0,
    num_frames: c_int = 0,
    current_frame: c_int = 0,
    frames: [*c][*c]struct_SDL_Cursor = null,
    durations: [*c]Uint32 = null,
};
pub const SDL_MouseClickState = extern struct {
    last_timestamp: Uint64 = 0,
    click_motion_x: f64 = 0,
    click_motion_y: f64 = 0,
    click_count: Uint8 = 0,
};
pub const SDL_MouseInputSource = extern struct {
    mouseID: SDL_MouseID = 0,
    buttonstate: Uint32 = 0,
    num_clickstates: c_int = 0,
    clickstate: [*c]SDL_MouseClickState = null,
};
pub const SDL_Mouse = extern struct {
    CreateCursor: ?*const fn (surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor = null,
    CreateAnimatedCursor: ?*const fn (frames: [*c]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor = null,
    CreateSystemCursor: ?*const fn (id: SDL_SystemCursor) callconv(.c) [*c]SDL_Cursor = null,
    ShowCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) bool = null,
    MoveCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) bool = null,
    FreeCursor: ?*const fn (cursor: [*c]SDL_Cursor) callconv(.c) void = null,
    WarpMouse: ?*const fn (window: [*c]SDL_Window, x: f32, y: f32) callconv(.c) bool = null,
    WarpMouseGlobal: ?*const fn (x: f32, y: f32) callconv(.c) bool = null,
    SetRelativeMouseMode: ?*const fn (enabled: bool) callconv(.c) bool = null,
    CaptureMouse: ?*const fn (window: [*c]SDL_Window) callconv(.c) bool = null,
    GetGlobalMouseState: ?*const fn (x: [*c]f32, y: [*c]f32) callconv(.c) SDL_MouseButtonFlags = null,
    ApplySystemScale: SDL_MouseMotionTransformCallback = null,
    system_scale_data: ?*anyopaque = null,
    InputTransform: SDL_MouseMotionTransformCallback = null,
    input_transform_data: ?*anyopaque = null,
    integer_mode_flags: Uint8 = 0,
    integer_mode_residual_motion_x: f32 = 0,
    integer_mode_residual_motion_y: f32 = 0,
    focus: [*c]SDL_Window = null,
    x: f32 = 0,
    y: f32 = 0,
    x_accu: f32 = 0,
    y_accu: f32 = 0,
    last_x: f32 = 0,
    last_y: f32 = 0,
    residual_scroll_x: f32 = 0,
    residual_scroll_y: f32 = 0,
    click_motion_x: f64 = 0,
    click_motion_y: f64 = 0,
    has_position: bool = false,
    relative_mode: bool = false,
    relative_mode_warp_motion: bool = false,
    relative_mode_hide_cursor: bool = false,
    relative_mode_center: bool = false,
    warp_emulation_hint: bool = false,
    warp_emulation_active: bool = false,
    warp_emulation_prohibited: bool = false,
    have_explicit_warp_event: bool = false,
    last_center_warp_time_ns: Uint64 = 0,
    enable_normal_speed_scale: bool = false,
    normal_speed_scale: f32 = 0,
    enable_relative_speed_scale: bool = false,
    relative_speed_scale: f32 = 0,
    enable_relative_system_scale: bool = false,
    double_click_time: Uint32 = 0,
    double_click_radius: c_int = 0,
    touch_mouse_events: bool = false,
    mouse_touch_events: bool = false,
    pen_mouse_events: bool = false,
    pen_touch_events: bool = false,
    was_touch_mouse_events: bool = false,
    added_mouse_touch_device: bool = false,
    added_pen_touch_device: bool = false,
    auto_capture: bool = false,
    capture_desired: bool = false,
    capture_window: [*c]SDL_Window = null,
    num_sources: c_int = 0,
    sources: [*c]SDL_MouseInputSource = null,
    cursors: [*c]SDL_Cursor = null,
    def_cursor: [*c]SDL_Cursor = null,
    cur_cursor: [*c]SDL_Cursor = null,
    cursor_visible: bool = false,
    internal: ?*anyopaque = null,
};
pub extern fn SDL_PreInitMouse() bool;
pub extern fn SDL_PostInitMouse() void;
pub extern fn SDL_GetMouse() [*c]SDL_Mouse;
pub extern fn SDL_SetMouseFocus(window: [*c]SDL_Window) void;
pub extern fn SDL_UpdateMouseCapture(force_release: bool) bool;
pub extern fn SDL_SetRelativeMouseMode(enabled: bool) bool;
pub extern fn SDL_UpdateRelativeMouseMode() bool;
pub extern fn SDL_DisableMouseWarpEmulation() void;
pub extern fn SDL_QuitMouse() void;
pub extern fn SDL_InitTouch() bool;
pub extern fn SDL_QuitTouch() void;
pub extern fn SDL_InitPen() bool;
pub extern fn SDL_QuitPen() void;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_SendAppEvent(eventType: SDL_EventType) void;
pub extern fn SDL_SendSystemThemeChangedEvent() void;
pub extern fn SDL_PumpEventMaintenance() void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_SetSurfaceProperty(props: SDL_PropertiesID, name: [*c]const u8, surface: [*c]SDL_Surface) bool;
pub extern fn SDL_InitTicks() void;
pub const SDL_RenderCommandType = c_uint;
pub const SDL_RenderLineMethod = c_uint;
pub extern fn SDL_DestroyRendererWithoutFreeing(renderer: [*c]SDL_Renderer) void;
pub extern fn SDL_HasMainCallbacks() bool;
pub extern fn SDL_IterateMainCallbacks(pump_events: bool) SDL_AppResult;
pub const GLenum = c_uint;
pub const GLint = c_int;
pub const GLubyte = u8;
pub const GLuint = c_uint;
pub const PFNGLGETSTRINGIPROC = ?*const fn (name: GLenum, index: GLuint) callconv(.c) [*c]const GLubyte;
pub const PFNGLBINDFRAMEBUFFERPROC = ?*const fn (target: GLenum, framebuffer: GLuint) callconv(.c) void;
pub const PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = ?*const fn (target: GLenum, attachment: GLenum, pname: GLenum, params: [*c]GLint) callconv(.c) void;
pub var bootstrap: [8][*c]VideoBootStrap = [8][*c]VideoBootStrap{
    &Wayland_preferred_bootstrap,
    &X11_bootstrap,
    &Wayland_bootstrap,
    &KMSDRM_bootstrap,
    &OFFSCREEN_bootstrap,
    &DUMMY_bootstrap,
    &DUMMY_evdev_bootstrap,
    null,
};
pub fn SDL_ModeSwitchingEmulated(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_MODE_SWITCHING_EMULATED)) != 0) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn SDL_SendsFullscreenDimensions(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return !!((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_SENDS_FULLSCREEN_DIMENSIONS)) != 0);
}
pub fn IsFullscreenOnly(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return !!((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_FULLSCREEN_ONLY)) != 0);
}
pub fn SDL_SendsDisplayChanges(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return !!((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_SENDS_DISPLAY_CHANGES)) != 0);
}
pub fn SDL_DriverSendsHDRChanges(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return !!((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_SENDS_HDR_CHANGES)) != 0);
}
pub fn SDL_DriverHasSlowFramebuffer(_this_1: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return !!((_this_1.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_SLOW_FRAMEBUFFER)) != 0);
}
pub var syncHint: bool = false;
pub fn SDL_SyncHintWatcher(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, newValue: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    syncHint = SDL_GetStringBoolean(newValue, @"false" != 0);
}
pub fn SDL_SyncIfRequired(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (syncHint) {
        _ = SDL_SyncWindow_REAL(window);
    }
}
pub fn SDL_UpdateWindowHierarchy(window: [*c]SDL_Window, parent: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (window.*.parent != null) {
        if (window.*.next_sibling != null) {
            window.*.next_sibling.*.prev_sibling = window.*.prev_sibling;
        }
        if (window.*.prev_sibling != null) {
            window.*.prev_sibling.*.next_sibling = window.*.next_sibling;
        } else {
            window.*.parent.*.first_child = window.*.next_sibling;
        }
        window.*.parent = null;
    }
    if (parent != null) {
        window.*.parent = parent;
        window.*.next_sibling = parent.*.first_child;
        if (parent.*.first_child != null) {
            parent.*.first_child.*.prev_sibling = window;
        }
        parent.*.first_child = window;
    }
}
pub const SDL_WindowTextureData = extern struct {
    renderer: [*c]SDL_Renderer = null,
    texture: [*c]SDL_Texture = null,
    pixels: ?*anyopaque = null,
    pitch: c_int = 0,
    bytes_per_pixel: c_int = 0,
};
pub fn SDL_DefaultGraphicsBackends(_: [*c]SDL_VideoDevice) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn SDL_CreateWindowTexture(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, format: [*c]SDL_PixelFormat, pixels: [*c]?*anyopaque, pitch: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_CreateWindowTexture".*;
    };
    _ = &static_local___func__;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    var data: [*c]SDL_WindowTextureData = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.internal.window.texturedata", null)));
    _ = &data;
    const transparent: bool = (if ((window.*.flags & @as(c_ulong, 1073741824)) != 0) @"true" else @"false") != 0;
    _ = &transparent;
    var i: c_int = undefined;
    _ = &i;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var texture_formats: [*c]const SDL_PixelFormat = undefined;
    _ = &texture_formats;
    _ = SDL_GetWindowSizeInPixels_REAL(window, &w, &h);
    if (!(data != null)) {
        var renderer: [*c]SDL_Renderer = null;
        _ = &renderer;
        var render_driver: [*c]const u8 = null;
        _ = &render_driver;
        var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_FRAMEBUFFER_ACCELERATION");
        _ = &hint;
        if ((((((hint != null) and (@as(c_int, hint.*) != @as(c_int, '0'))) and (@as(c_int, hint.*) != @as(c_int, '1'))) and (SDL_strcasecmp_REAL(hint, "true") != @as(c_int, 0))) and (SDL_strcasecmp_REAL(hint, "false") != @as(c_int, 0))) and (SDL_strcasecmp_REAL(hint, "software") != @as(c_int, 0))) {
            render_driver = hint;
        }
        if (!(render_driver != null)) {
            render_driver = SDL_GetHint_REAL("SDL_RENDER_DRIVER");
        }
        if ((render_driver != null) and (SDL_strcasecmp_REAL(render_driver, "software") == @as(c_int, 0))) {
            render_driver = null;
        }
        var render_driver_copy: [*c]u8 = null;
        _ = &render_driver_copy;
        if ((render_driver != null) and (@as(c_int, render_driver.*) != 0)) {
            render_driver_copy = SDL_strdup_REAL(render_driver);
            render_driver = render_driver_copy;
            if (render_driver_copy != null) {
                var prev: [*c]u8 = render_driver_copy;
                _ = &prev;
                var ptr: [*c]u8 = prev;
                _ = &ptr;
                while (@as(?*anyopaque, @ptrCast(@alignCast(blk: {
                    const tmp = SDL_strchr_REAL(ptr, ',');
                    ptr = tmp;
                    break :blk tmp;
                }))) != @as(?*anyopaque, null)) {
                    ptr.* = '\x00';
                    const is_sw: bool = SDL_strcasecmp_REAL(prev, "software") == @as(c_int, 0);
                    _ = &is_sw;
                    ptr.* = ',';
                    if (is_sw) {
                        _ = memset(@ptrCast(@alignCast(prev)), 'x', SDL_strlen_REAL("software"));
                        ptr = prev;
                    } else {
                        ptr += 1;
                        prev = ptr;
                    }
                }
                if (SDL_strcasecmp_REAL(prev, "software") == @as(c_int, 0)) {
                    _ = memset(@ptrCast(@alignCast(prev)), 'x', SDL_strlen_REAL("software"));
                }
            }
        }
        if (render_driver != null) {
            renderer = SDL_CreateRenderer_REAL(window, render_driver);
            SDL_free_REAL(@ptrCast(@alignCast(render_driver_copy)));
            if (!(renderer != null)) {
                return @"false" != 0;
            }
        } else {
            while (true) {
                while (!(@as(?*anyopaque, @ptrCast(@alignCast(render_driver_copy))) == @as(?*anyopaque, null))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "render_driver_copy == ((void*)0)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_video.c", 376);
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
            const total: c_int = SDL_GetNumRenderDrivers_REAL();
            _ = &total;
            {
                i = 0;
                while (i < total) : (i += 1) {
                    var name: [*c]const u8 = SDL_GetRenderDriver_REAL(i);
                    _ = &name;
                    if ((name != null) and (SDL_strcmp_REAL(name, "software") != @as(c_int, 0))) {
                        renderer = SDL_CreateRenderer_REAL(window, name);
                        if (renderer != null) {
                            break;
                        }
                    }
                }
            }
            if (!(renderer != null)) {
                return SDL_SetError_REAL("No hardware accelerated renderers available");
            }
        }
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
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_video.c", 392);
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
        data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
        if (!(data != null)) {
            SDL_DestroyRenderer_REAL(renderer);
            return @"false" != 0;
        }
        if (!SDL_SetPointerProperty_REAL(props, "SDL.internal.window.texturedata", @ptrCast(@alignCast(data)))) {
            SDL_DestroyRenderer_REAL(renderer);
            return @"false" != 0;
        }
        data.*.renderer = renderer;
    }
    texture_formats = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetRendererProperties_REAL(data.*.renderer), "SDL.renderer.texture_formats", null)));
    if (!(texture_formats != null)) {
        return @"false" != 0;
    }
    if (data.*.texture != null) {
        SDL_DestroyTexture_REAL(data.*.texture);
        data.*.texture = null;
    }
    SDL_free_REAL(data.*.pixels);
    data.*.pixels = null;
    format.* = texture_formats[@as(c_int, 0)];
    {
        i = 0;
        while (texture_formats[@bitCast(@as(isize, @intCast(i)))] != @as(SDL_PixelFormat, SDL_PIXELFORMAT_UNKNOWN)) : (i += 1) {
            var texture_format: SDL_PixelFormat = texture_formats[@bitCast(@as(isize, @intCast(i)))];
            _ = &texture_format;
            if ((((!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and !(!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)) and (((texture_format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDLAYOUT_2101010))))) and !(!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32))))) and !(!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and ((((((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX1)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX2))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX4))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_INDEX8))))) and (!transparent or (((!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED8)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED16))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_PACKED32)))) and ((((((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ARGB)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_RGBA))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_ABGR))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PACKEDORDER_BGRA)))) or ((!((texture_format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((texture_format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) and (((((((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU8)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU16))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYU32))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF16))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 24))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_PIXELTYPE_ARRAYF32)))) and ((((((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ARGB)) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_RGBA))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_ABGR))) or (((texture_format >> @intCast(@as(SDL_PixelFormat, 20))) & @as(SDL_PixelFormat, 15)) == @as(SDL_PixelFormat, SDL_ARRAYORDER_BGRA))))))) {
                format.* = texture_format;
                break;
            }
        }
    }
    data.*.texture = SDL_CreateTexture_REAL(data.*.renderer, format.*, SDL_TEXTUREACCESS_STREAMING, w, h);
    if (!(data.*.texture != null)) {
        return @"false" != 0;
    }
    _ = SDL_SetTextureBlendMode_REAL(data.*.texture, SDL_BLENDMODE_NONE);
    data.*.bytes_per_pixel = if ((format.* != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((format.* >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (format.* == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((format.* >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)));
    data.*.pitch = ((w * data.*.bytes_per_pixel) + @as(c_int, 3)) & ~@as(c_int, 3);
    {
        const allocsize: usize = @as(usize, @bitCast(@as(c_long, h))) *% @as(usize, @bitCast(@as(c_long, data.*.pitch)));
        _ = &allocsize;
        data.*.pixels = SDL_malloc_REAL(if (allocsize > @as(usize, 0)) allocsize else @as(usize, 1));
        if (!(data.*.pixels != null)) {
            return @"false" != 0;
        }
    }
    pixels.* = data.*.pixels;
    pitch.* = data.*.pitch;
    _ = SDL_SetRenderViewport_REAL(data.*.renderer, null);
    return @"true" != 0;
}
pub export fn SDL_SetWindowTextureVSync(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: c_int) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowTextureData = undefined;
    _ = &data;
    data = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.window.texturedata", null)));
    if (!(data != null)) {
        return @"false" != 0;
    }
    if (!(data.*.renderer != null)) {
        return @"false" != 0;
    }
    return SDL_SetRenderVSync_REAL(data.*.renderer, vsync);
}
pub fn SDL_GetWindowTextureVSync(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, vsync: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowTextureData = undefined;
    _ = &data;
    data = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.window.texturedata", null)));
    if (!(data != null)) {
        return @"false" != 0;
    }
    if (!(data.*.renderer != null)) {
        return @"false" != 0;
    }
    return SDL_GetRenderVSync_REAL(data.*.renderer, vsync);
}
pub fn SDL_UpdateWindowTexture(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowTextureData = undefined;
    _ = &data;
    var rect: SDL_Rect = undefined;
    _ = &rect;
    var src: ?*anyopaque = undefined;
    _ = &src;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    _ = SDL_GetWindowSizeInPixels_REAL(window, &w, &h);
    data = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.window.texturedata", null)));
    if (!(data != null) or !(data.*.texture != null)) {
        return SDL_SetError_REAL("No window texture data");
    }
    if (SDL_GetSpanEnclosingRect(w, h, numrects, rects, &rect)) {
        src = @ptrCast(@alignCast((@as([*c]Uint8, @ptrCast(@alignCast(data.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(rect.y * data.*.pitch))))) + @as(usize, @bitCast(@as(isize, @intCast(rect.x * data.*.bytes_per_pixel))))));
        if (!SDL_UpdateTexture_REAL(data.*.texture, &rect, src, data.*.pitch)) {
            return @"false" != 0;
        }
        if (!SDL_RenderTexture_REAL(data.*.renderer, data.*.texture, null, null)) {
            return @"false" != 0;
        }
        _ = SDL_RenderPresent_REAL(data.*.renderer);
    }
    return @"true" != 0;
}
pub fn SDL_DestroyWindowTexture(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    if (SDL_HasProperty_REAL(props, "SDL.internal.window.texturedata")) {
        var data: [*c]SDL_WindowTextureData = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.internal.window.texturedata", null)));
        _ = &data;
        if (data.*.texture != null) {
            SDL_DestroyTexture_REAL(data.*.texture);
        }
        if (data.*.renderer != null) {
            SDL_DestroyRenderer_REAL(data.*.renderer);
        }
        SDL_free_REAL(data.*.pixels);
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        _ = SDL_ClearProperty_REAL(props, "SDL.internal.window.texturedata");
    }
}
pub var _this: [*c]SDL_VideoDevice = null;
pub var SDL_messagebox_count: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub fn cmpmodes(A: ?*const anyopaque, B: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a: [*c]const SDL_DisplayMode = @ptrCast(@alignCast(A));
    _ = &a;
    var b: [*c]const SDL_DisplayMode = @ptrCast(@alignCast(B));
    _ = &b;
    var a_refresh_rate: c_int = @intFromFloat(a.*.refresh_rate * @as(f32, @floatFromInt(@as(c_int, 100))));
    _ = &a_refresh_rate;
    var b_refresh_rate: c_int = @intFromFloat(b.*.refresh_rate * @as(f32, @floatFromInt(@as(c_int, 100))));
    _ = &b_refresh_rate;
    var a_pixel_density: c_int = @intFromFloat(a.*.pixel_density * @as(f32, @floatFromInt(@as(c_int, 100))));
    _ = &a_pixel_density;
    var b_pixel_density: c_int = @intFromFloat(b.*.pixel_density * @as(f32, @floatFromInt(@as(c_int, 100))));
    _ = &b_pixel_density;
    if (a.*.w != b.*.w) {
        return b.*.w - a.*.w;
    } else if (a.*.h != b.*.h) {
        return b.*.h - a.*.h;
    } else if ((if ((a.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((a.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((a.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) != (if ((b.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((b.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((b.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))))) {
        return (if ((b.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((b.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((b.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255)))) - (if ((a.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((a.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) @as(c_int, 0) else @as(c_int, @bitCast((a.*.format >> @intCast(@as(SDL_PixelFormat, 8))) & @as(SDL_PixelFormat, 255))));
    } else if (((a.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) != ((b.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15))) {
        return @bitCast(((b.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)) -% ((a.*.format >> @intCast(@as(SDL_PixelFormat, 16))) & @as(SDL_PixelFormat, 15)));
    } else if (a_refresh_rate != b_refresh_rate) {
        return b_refresh_rate - a_refresh_rate;
    } else if (a_pixel_density != b_pixel_density) {
        return a_pixel_density - b_pixel_density;
    }
    return 0;
}
pub export fn SDL_UninitializedVideo() bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("Video subsystem has not been initialized");
}
pub var deduped_bootstrap: [7][*c]const VideoBootStrap = @import("std").mem.zeroes([7][*c]const VideoBootStrap);
pub export fn SDL_GetNumVideoDrivers_REAL() c_int {
    @setEvalBranchQuota(100000);
    const static_local_num_drivers = struct {
        var num_drivers: c_int = -@as(c_int, 1);
    };
    _ = &static_local_num_drivers;
    if (static_local_num_drivers.num_drivers >= @as(c_int, 0)) {
        return static_local_num_drivers.num_drivers;
    }
    static_local_num_drivers.num_drivers = 0;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(?*anyopaque, @ptrCast(@alignCast(bootstrap[@bitCast(@as(isize, @intCast(i)))]))) != @as(?*anyopaque, null)) : (i += 1) {
            var duplicate: bool = @"false" != 0;
            _ = &duplicate;
            {
                var j: c_int = 0;
                _ = &j;
                while (j < i) : (j += 1) {
                    if (SDL_strcmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, bootstrap[@bitCast(@as(isize, @intCast(j)))].*.name) == @as(c_int, 0)) {
                        duplicate = @"true" != 0;
                        break;
                    }
                }
            }
            if (!duplicate) {
                deduped_bootstrap[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &static_local_num_drivers.num_drivers;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = bootstrap[@bitCast(@as(isize, @intCast(i)))];
            }
        }
    }
    return static_local_num_drivers.num_drivers;
}
pub export fn SDL_GetVideoDriver_REAL(arg_index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var index_1 = arg_index_1;
    _ = &index_1;
    if ((index_1 < @as(c_int, 0)) or (index_1 >= SDL_GetNumVideoDrivers_REAL())) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("index"))));
        return null;
    }
    return deduped_bootstrap[@bitCast(@as(isize, @intCast(index_1)))].*.name;
}
pub export fn SDL_InitVideo(arg_driver_name: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var driver_name = arg_driver_name;
    _ = &driver_name;
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "SDL_InitVideo".*;
    };
    _ = &static_local___func__;
    var video: [*c]SDL_VideoDevice = undefined;
    _ = &video;
    var init_events: bool = undefined;
    _ = &init_events;
    var init_keyboard: bool = undefined;
    _ = &init_keyboard;
    var init_mouse: bool = undefined;
    _ = &init_mouse;
    var init_touch: bool = undefined;
    _ = &init_touch;
    var init_pen: bool = undefined;
    _ = &init_pen;
    var i: c_int = undefined;
    _ = &i;
    var driver_attempt: [*c]const u8 = undefined;
    _ = &driver_attempt;
    var driver_attempt_end: [*c]const u8 = undefined;
    _ = &driver_attempt_end;
    var driver_attempt_len: usize = undefined;
    _ = &driver_attempt_len;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "_this == ((void*)0)",
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
                init_events = @"false" != 0;
                init_keyboard = @"false" != 0;
                init_mouse = @"false" != 0;
                init_touch = @"false" != 0;
                init_pen = @"false" != 0;
                i = 0;
                if (_this != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            2 => {
                SDL_QuitVideo();
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
                SDL_InitTicks();
                if (!SDL_InitSubSystem_REAL(SDL_INIT_EVENTS)) {
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
                init_events = @"true" != 0;
                if (!SDL_InitKeyboard()) {
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
                init_keyboard = @"true" != 0;
                if (!SDL_PreInitMouse()) {
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
                init_mouse = @"true" != 0;
                if (!SDL_InitTouch()) {
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
                init_touch = @"true" != 0;
                if (!SDL_InitPen()) {
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
                init_pen = @"true" != 0;
                video = null;
                if (SDL_IsUbuntuTouch_REAL()) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                driver_name = "wayland";
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
                if (!(driver_name != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                driver_name = SDL_GetHint_REAL("SDL_VIDEO_DRIVER");
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
                if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                driver_attempt = driver_name;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            27 => {
                i = 0;
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            28 => {
                if (video != null) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            29 => {
                if (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !(video != null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                driver_attempt_end = SDL_strchr_REAL(driver_attempt, ',');
                driver_attempt_len = if (driver_attempt_end != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(driver_attempt_end) -% @intFromPtr(driver_attempt))), @sizeOf(u8))))) else SDL_strlen_REAL(driver_attempt);
                i = 0;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                if ((!bootstrap[@bitCast(@as(isize, @intCast(i)))].*.is_preferred and (driver_attempt_len == SDL_strlen_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name))) and (SDL_strncasecmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt, driver_attempt_len) == @as(c_int, 0))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            34 => {
                i += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*const anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            36 => {
                video = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?();
                if (video != null) {
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
                {
                    sdl_pc = 34;
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
                if (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            43 => {
                video = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.create.?();
                if (video != null) {
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
                    sdl_pc = 28;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 45;
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
                SDL_DebugLogBackend("video", bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name);
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                if (driver_name != null) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                _this = video;
                _this.*.name = bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name;
                _this.*.thread = SDL_GetCurrentThreadID_REAL();
                _this.*.gl_config.driver_loaded = 0;
                _this.*.gl_config.dll_handle = null;
                SDL_GL_ResetAttributes_REAL();
                if (!_this.*.VideoInit.?(_this)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            52 => {
                _ = SDL_SetError_REAL("%s not available", driver_name);
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
                _ = SDL_SetError_REAL("No available video device");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            55 => {
                SDL_QuitVideo();
                return @"false" != 0;
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                if (_this.*.num_displays == @as(c_int, 0)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                SDL_QuitVideo();
                return SDL_SetError_REAL("The video driver did not add any displays");
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                _ = SDL_AddHintCallback_REAL("SDL_VIDEO_SYNC_WINDOW_OPERATIONS", SDL_SyncHintWatcher, null);
                if (!SDL_GetHintBoolean_REAL("SDL_VIDEO_ALLOW_SCREENSAVER", @"false" != 0)) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                _ = SDL_DisableScreenSaver_REAL();
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
                SDL_PostInitMouse();
                return @"true" != 0;
            },
            64 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                if (init_pen) {
                    sdl_pc = 76;
                    continue;
                } else {
                    sdl_pc = 77;
                    continue;
                }
            },
            67 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(_this))) == @as(?*anyopaque, null))) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_video.c", 752);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            71 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 73;
                    continue;
                } else {
                    sdl_pc = 74;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            73 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 75;
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
                    sdl_pc = 72;
                    continue;
                }
            },
            76 => {
                SDL_QuitPen();
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
                if (init_touch) {
                    sdl_pc = 79;
                    continue;
                } else {
                    sdl_pc = 80;
                    continue;
                }
            },
            79 => {
                SDL_QuitTouch();
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
                if (init_mouse) {
                    sdl_pc = 82;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            82 => {
                SDL_QuitMouse();
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
                if (init_keyboard) {
                    sdl_pc = 85;
                    continue;
                } else {
                    sdl_pc = 86;
                    continue;
                }
            },
            85 => {
                SDL_QuitKeyboard();
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
                if (init_events) {
                    sdl_pc = 88;
                    continue;
                } else {
                    sdl_pc = 89;
                    continue;
                }
            },
            88 => {
                SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetCurrentVideoDriver_REAL() [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    return _this.*.name;
}
pub export fn SDL_GetVideoDevice() [*c]SDL_VideoDevice {
    @setEvalBranchQuota(100000);
    return _this;
}
pub export fn SDL_OnVideoThread() bool {
    @setEvalBranchQuota(100000);
    return (_this != null) and (SDL_GetCurrentThreadID_REAL() == _this.*.thread);
}
pub export fn SDL_SetSystemTheme(theme: SDL_SystemTheme) void {
    @setEvalBranchQuota(100000);
    if ((_this != null) and (theme != _this.*.system_theme)) {
        _this.*.system_theme = theme;
        SDL_SendSystemThemeChangedEvent();
    }
}
pub export fn SDL_GetSystemTheme_REAL() SDL_SystemTheme {
    @setEvalBranchQuota(100000);
    if (_this != null) {
        return _this.*.system_theme;
    } else {
        return SDL_SYSTEM_THEME_UNKNOWN;
    }
}
pub export fn SDL_UpdateDesktopBounds() void {
    @setEvalBranchQuota(100000);
    var rect: SDL_Rect = undefined;
    _ = &rect;
    _ = memset(@ptrCast(@alignCast(&rect)), 0, @sizeOf(@TypeOf(rect)));
    var displays: [*c]SDL_DisplayID = SDL_GetDisplays_REAL(null);
    _ = &displays;
    if (displays != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (displays[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                var bounds: SDL_Rect = undefined;
                _ = &bounds;
                if (SDL_GetDisplayBounds_REAL(displays[@bitCast(@as(isize, @intCast(i)))], &bounds)) {
                    if (i == @as(c_int, 0)) {
                        {
                            comptime {
                                if (!(@sizeOf(@TypeOf((&rect).*)) == @sizeOf(@TypeOf((&bounds).*)))) @compileError("static assertion failed \"sizeof (*(&rect)) == sizeof (*( &bounds))\"");
                            }
                        }
                        _ = memcpy(@ptrCast(@alignCast(&rect)), @ptrCast(@alignCast(&bounds)), @sizeOf(@TypeOf((&bounds).*)));
                    } else {
                        _ = SDL_GetRectUnion_REAL(&rect, &bounds, &rect);
                    }
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(displays)));
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&_this.*.desktop_bounds).*)) == @sizeOf(@TypeOf((&rect).*)))) @compileError("static assertion failed \"sizeof (*(&_this->desktop_bounds)) == sizeof (*( &rect))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&_this.*.desktop_bounds)), @ptrCast(@alignCast(&rect)), @sizeOf(@TypeOf((&rect).*)));
}
pub fn SDL_FinalizeDisplayMode(mode: [*c]SDL_DisplayMode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (mode.*.pixel_density <= @as(f32, 0.0)) {
        mode.*.pixel_density = 1.0;
    }
    if (mode.*.refresh_rate_numerator > @as(c_int, 0)) {
        if (mode.*.refresh_rate_denominator <= @as(c_int, 0)) {
            mode.*.refresh_rate_denominator = 1;
        }
        mode.*.refresh_rate = @as(f32, @floatFromInt(mode.*.refresh_rate_numerator)) / @as(f32, @floatFromInt(mode.*.refresh_rate_denominator));
    } else {
        SDL_CalculateFraction(mode.*.refresh_rate, &mode.*.refresh_rate_numerator, &mode.*.refresh_rate_denominator);
    }
    mode.*.refresh_rate = SDL_roundf_REAL(mode.*.refresh_rate * @as(f32, @floatFromInt(@as(c_int, 100)))) / @as(f32, 100.0);
}
pub export fn SDL_AddBasicVideoDisplay(desktop_mode: [*c]const SDL_DisplayMode) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var display: SDL_VideoDisplay = undefined;
    _ = &display;
    _ = memset(@ptrCast(@alignCast(&display)), 0, @sizeOf(@TypeOf(display)));
    if (desktop_mode != null) {
        _ = memcpy(@ptrCast(@alignCast(&display.desktop_mode)), @ptrCast(@alignCast(desktop_mode)), @sizeOf(@TypeOf(display.desktop_mode)));
    }
    return SDL_AddVideoDisplay(&display, @"false" != 0);
}
pub export fn SDL_AddVideoDisplay(display: [*c]const SDL_VideoDisplay, send_event: bool) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var displays: [*c][*c]SDL_VideoDisplay = undefined;
    _ = &displays;
    var new_display: [*c]SDL_VideoDisplay = undefined;
    _ = &new_display;
    var id: SDL_DisplayID = undefined;
    _ = &id;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var i: c_int = undefined;
    _ = &i;
    new_display = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(new_display.*)))));
    if (!(new_display != null)) {
        return 0;
    }
    displays = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(_this.*.displays)), @as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays + @as(c_int, 1)))) *% @sizeOf(@TypeOf(displays.*)))));
    if (!(displays != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(new_display)));
        return 0;
    }
    _this.*.displays = displays;
    _this.*.displays[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &_this.*.num_displays;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = new_display;
    id = SDL_GetNextObjectID();
    {
        comptime {
            if (!(@sizeOf(@TypeOf(new_display.*)) == @sizeOf(@TypeOf(display.*)))) @compileError("static assertion failed \"sizeof (*(new_display)) == sizeof (*( display))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(new_display)), @ptrCast(@alignCast(display)), @sizeOf(@TypeOf(display.*)));
    new_display.*.id = id;
    new_display.*.device = _this;
    if (display.*.name != null) {
        new_display.*.name = SDL_strdup_REAL(display.*.name);
    } else {
        var name: [32]u8 = undefined;
        _ = &name;
        _ = SDL_itoa_REAL(@bitCast(@as(c_uint, @truncate(id))), @ptrCast(@alignCast(&name)), 10);
        new_display.*.name = SDL_strdup_REAL(@ptrCast(@alignCast(&name)));
    }
    if (new_display.*.content_scale == @as(f32, 0.0)) {
        new_display.*.content_scale = 1.0;
    }
    new_display.*.desktop_mode.displayID = id;
    new_display.*.current_mode = &new_display.*.desktop_mode;
    SDL_FinalizeDisplayMode(&new_display.*.desktop_mode);
    {
        i = 0;
        while (i < new_display.*.num_fullscreen_modes) : (i += 1) {
            new_display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))].displayID = id;
        }
    }
    new_display.*.HDR.HDR_headroom = if (display.*.HDR.HDR_headroom > @as(f32, 1.0)) display.*.HDR.HDR_headroom else @as(f32, 1.0);
    new_display.*.HDR.SDR_white_level = if (display.*.HDR.SDR_white_level > @as(f32, 1.0)) display.*.HDR.SDR_white_level else @as(f32, 1.0);
    props = SDL_GetDisplayProperties_REAL(id);
    _ = SDL_SetBooleanProperty_REAL(props, "SDL.display.HDR_enabled", new_display.*.HDR.HDR_headroom > @as(f32, 1.0));
    SDL_UpdateDesktopBounds();
    if (send_event) {
        SDL_SendDisplayEvent(new_display, SDL_EVENT_DISPLAY_ADDED, 0, 0);
    }
    return id;
}
pub export fn SDL_OnDisplayAdded(_: [*c]SDL_VideoDisplay) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    {
        window = _this.*.windows;
        while (window != null) : (window = window.*.next) {
            SDL_CheckWindowDisplayChanged(window);
        }
    }
}
pub export fn SDL_OnDisplayMoved(_: [*c]SDL_VideoDisplay) void {
    @setEvalBranchQuota(100000);
    SDL_UpdateDesktopBounds();
}
pub export fn SDL_DelVideoDisplay(displayID: SDL_DisplayID, send_event: bool) void {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = undefined;
    _ = &display;
    var display_index: c_int = SDL_GetDisplayIndex(displayID);
    _ = &display_index;
    if (display_index < @as(c_int, 0)) {
        return;
    }
    display = _this.*.displays[@bitCast(@as(isize, @intCast(display_index)))];
    if (send_event) {
        SDL_SendDisplayEvent(display, SDL_EVENT_DISPLAY_REMOVED, 0, 0);
    }
    SDL_DestroyProperties_REAL(display.*.props);
    SDL_free_REAL(@ptrCast(@alignCast(display.*.name)));
    SDL_ResetFullscreenDisplayModes(display);
    SDL_free_REAL(@ptrCast(@alignCast(display.*.desktop_mode.internal)));
    display.*.desktop_mode.internal = null;
    SDL_free_REAL(@ptrCast(@alignCast(display.*.internal)));
    display.*.internal = null;
    SDL_free_REAL(@ptrCast(@alignCast(display)));
    if (display_index < (_this.*.num_displays - @as(c_int, 1))) {
        _ = memmove(@ptrCast(@alignCast(&_this.*.displays[@bitCast(@as(isize, @intCast(display_index)))])), @ptrCast(@alignCast(&_this.*.displays[@bitCast(@as(isize, @intCast(display_index + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, (_this.*.num_displays - display_index) - @as(c_int, 1)))) *% @sizeOf(@TypeOf(_this.*.displays[@bitCast(@as(isize, @intCast(display_index)))])));
    }
    _this.*.num_displays -= 1;
    SDL_UpdateDesktopBounds();
}
pub export fn SDL_GetDisplays_REAL(count: [*c]c_int) [*c]SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var displays: [*c]SDL_DisplayID = undefined;
    _ = &displays;
    if (!(_this != null)) {
        if (count != null) {
            count.* = 0;
        }
        _ = SDL_UninitializedVideo();
        return null;
    }
    displays = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays + @as(c_int, 1)))) *% @sizeOf(@TypeOf(displays.*)))));
    if (displays != null) {
        if (count != null) {
            count.* = _this.*.num_displays;
        }
        {
            i = 0;
            while (i < _this.*.num_displays) : (i += 1) {
                displays[@bitCast(@as(isize, @intCast(i)))] = _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.id;
            }
        }
        displays[@bitCast(@as(isize, @intCast(i)))] = 0;
    } else {
        if (count != null) {
            count.* = 0;
        }
    }
    return displays;
}
pub export fn SDL_GetVideoDisplay(displayID: SDL_DisplayID) [*c]SDL_VideoDisplay {
    @setEvalBranchQuota(100000);
    var display_index: c_int = undefined;
    _ = &display_index;
    display_index = SDL_GetDisplayIndex(displayID);
    if (display_index < @as(c_int, 0)) {
        return null;
    }
    return _this.*.displays[@bitCast(@as(isize, @intCast(display_index)))];
}
pub fn GetDisplayForWindow(window: [*c]SDL_Window) callconv(.c) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var displayID: SDL_DisplayID = 0;
    _ = &displayID;
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        displayID = window.*.current_fullscreen_mode.displayID;
    }
    if (!(displayID != 0)) {
        displayID = SDL_GetDisplayForWindowPosition(window);
    }
    return displayID;
}
pub export fn SDL_GetVideoDisplayForWindow(window: [*c]SDL_Window) [*c]SDL_VideoDisplay {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    return SDL_GetVideoDisplay(GetDisplayForWindow(window));
}
pub export fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID {
    @setEvalBranchQuota(100000);
    if (!(_this != null) or (_this.*.num_displays == @as(c_int, 0))) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    return _this.*.displays[@as(c_int, 0)].*.id;
}
pub export fn SDL_GetDisplayIndex(displayID: SDL_DisplayID) c_int {
    @setEvalBranchQuota(100000);
    var display_index: c_int = undefined;
    _ = &display_index;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return -@as(c_int, 1);
    }
    {
        display_index = 0;
        while (display_index < _this.*.num_displays) : (display_index += 1) {
            if (displayID == _this.*.displays[@bitCast(@as(isize, @intCast(display_index)))].*.id) {
                return display_index;
            }
        }
    }
    _ = SDL_SetError_REAL("Invalid display");
    return -@as(c_int, 1);
}
pub export fn SDL_GetDisplayDriverData(displayID: SDL_DisplayID) ?*SDL_DisplayData {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return null;
    }
    return display.*.internal;
}
pub export fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) ?*SDL_DisplayData {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    return SDL_GetDisplayDriverData(GetDisplayForWindow(window));
}
pub export fn SDL_GetDisplayProperties_REAL(displayID: SDL_DisplayID) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return 0;
    }
    if (display.*.props == @as(SDL_PropertiesID, 0)) {
        display.*.props = SDL_CreateProperties_REAL();
    }
    return display.*.props;
}
pub export fn SDL_GetDisplayName_REAL(displayID: SDL_DisplayID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return null;
    }
    return display.*.name;
}
pub export fn SDL_GetDisplayBounds_REAL(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return @"false" != 0;
    }
    if (!(rect != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
    }
    if (_this.*.GetDisplayBounds != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
        if (_this.*.GetDisplayBounds.?(_this, display, rect)) {
            return @"true" != 0;
        }
    }
    if (displayID == SDL_GetPrimaryDisplay_REAL()) {
        rect.*.x = 0;
        rect.*.y = 0;
    } else {
        _ = SDL_GetDisplayBounds_REAL(_this.*.displays[@bitCast(@as(isize, @intCast(SDL_GetDisplayIndex(displayID) - @as(c_int, 1))))].*.id, rect);
        rect.*.x += rect.*.w;
    }
    rect.*.w = display.*.current_mode.*.w;
    rect.*.h = display.*.current_mode.*.h;
    return @"true" != 0;
}
pub fn ParseDisplayUsableBoundsHint(rect: [*c]SDL_Rect) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_DISPLAY_USABLE_BOUNDS");
    _ = &hint;
    return @intFromBool((hint != null) and (SDL_sscanf_REAL(hint, "%d,%d,%d,%d", &rect.*.x, &rect.*.y, &rect.*.w, &rect.*.h) == @as(c_int, 4)));
}
pub export fn SDL_GetDisplayUsableBounds_REAL(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return @"false" != 0;
    }
    if (!(rect != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
    }
    if ((displayID == SDL_GetPrimaryDisplay_REAL()) and (ParseDisplayUsableBoundsHint(rect) != 0)) {
        return @"true" != 0;
    }
    if (_this.*.GetDisplayUsableBounds != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
        if (_this.*.GetDisplayUsableBounds.?(_this, display, rect)) {
            return @"true" != 0;
        }
    }
    return SDL_GetDisplayBounds_REAL(displayID, rect);
}
pub export fn SDL_GetNaturalDisplayOrientation_REAL(displayID: SDL_DisplayID) SDL_DisplayOrientation {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return SDL_ORIENTATION_UNKNOWN;
    }
    if (display.*.natural_orientation != @as(SDL_DisplayOrientation, SDL_ORIENTATION_UNKNOWN)) {
        return display.*.natural_orientation;
    } else {
        return SDL_ORIENTATION_LANDSCAPE;
    }
}
pub export fn SDL_GetCurrentDisplayOrientation_REAL(displayID: SDL_DisplayID) SDL_DisplayOrientation {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return SDL_ORIENTATION_UNKNOWN;
    }
    if (display.*.current_orientation != @as(SDL_DisplayOrientation, SDL_ORIENTATION_UNKNOWN)) {
        return display.*.current_orientation;
    } else {
        return SDL_ORIENTATION_LANDSCAPE;
    }
}
pub export fn SDL_SetDisplayContentScale(display: [*c]SDL_VideoDisplay, scale: f32) void {
    @setEvalBranchQuota(100000);
    if (scale != display.*.content_scale) {
        var window: [*c]SDL_Window = undefined;
        _ = &window;
        display.*.content_scale = scale;
        SDL_SendDisplayEvent(display, SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED, 0, 0);
        {
            window = _this.*.windows;
            while (window != null) : (window = window.*.next) {
                if (display.*.id == window.*.displayID) {
                    SDL_CheckWindowDisplayScaleChanged(window);
                }
            }
        }
    }
}
pub export fn SDL_GetDisplayContentScale_REAL(displayID: SDL_DisplayID) f32 {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return 0.0;
    }
    return display.*.content_scale;
}
pub export fn SDL_SetWindowHDRProperties(window: [*c]SDL_Window, HDR: [*c]const SDL_HDROutputProperties, send_event: bool) void {
    @setEvalBranchQuota(100000);
    const HDR_clamped: SDL_HDROutputProperties = SDL_HDROutputProperties{
        .SDR_white_level = if (HDR.*.SDR_white_level > @as(f32, 1.0)) HDR.*.SDR_white_level else @as(f32, 1.0),
        .HDR_headroom = if (HDR.*.HDR_headroom > @as(f32, 1.0)) HDR.*.HDR_headroom else @as(f32, 1.0),
    };
    _ = &HDR_clamped;
    if ((window.*.HDR.HDR_headroom != HDR_clamped.HDR_headroom) or (window.*.HDR.SDR_white_level != HDR_clamped.SDR_white_level)) {
        var window_props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
        _ = &window_props;
        _ = SDL_SetFloatProperty_REAL(window_props, "SDL.window.HDR_headroom", HDR_clamped.HDR_headroom);
        _ = SDL_SetFloatProperty_REAL(window_props, "SDL.window.SDR_white_level", HDR_clamped.SDR_white_level);
        _ = SDL_SetBooleanProperty_REAL(window_props, "SDL.window.HDR_enabled", HDR_clamped.HDR_headroom > @as(f32, 1.0));
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&window.*.HDR).*)) == @sizeOf(@TypeOf((&HDR_clamped).*)))) @compileError("static assertion failed \"sizeof (*(&window->HDR)) == sizeof (*( &HDR_clamped))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&window.*.HDR)), @ptrCast(@alignCast(&HDR_clamped)), @sizeOf(@TypeOf((&HDR_clamped).*)));
        if (send_event) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_HDR_STATE_CHANGED, @intFromBool(HDR_clamped.HDR_headroom > @as(f32, 1.0)), 0);
        }
    }
}
pub export fn SDL_SetDisplayHDRProperties(display: [*c]SDL_VideoDisplay, HDR: [*c]const SDL_HDROutputProperties) void {
    @setEvalBranchQuota(100000);
    const HDR_clamped: SDL_HDROutputProperties = SDL_HDROutputProperties{
        .SDR_white_level = if (HDR.*.SDR_white_level > @as(f32, 1.0)) HDR.*.SDR_white_level else @as(f32, 1.0),
        .HDR_headroom = if (HDR.*.HDR_headroom > @as(f32, 1.0)) HDR.*.HDR_headroom else @as(f32, 1.0),
    };
    _ = &HDR_clamped;
    const changed: bool = (HDR_clamped.SDR_white_level != display.*.HDR.SDR_white_level) or (HDR_clamped.HDR_headroom != display.*.HDR.HDR_headroom);
    _ = &changed;
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&display.*.HDR).*)) == @sizeOf(@TypeOf((&HDR_clamped).*)))) @compileError("static assertion failed \"sizeof (*(&display->HDR)) == sizeof (*( &HDR_clamped))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&display.*.HDR)), @ptrCast(@alignCast(&HDR_clamped)), @sizeOf(@TypeOf((&HDR_clamped).*)));
    if (changed and !SDL_DriverSendsHDRChanges(_this)) {
        {
            var w: [*c]SDL_Window = display.*.device.*.windows;
            _ = &w;
            while (w != null) : (w = w.*.next) {
                if (GetDisplayForWindow(w) == display.*.id) {
                    SDL_SetWindowHDRProperties(w, &display.*.HDR, @"true" != 0);
                }
            }
        }
    }
}
pub fn SDL_UpdateFullscreenDisplayModes(display: [*c]SDL_VideoDisplay) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((display.*.num_fullscreen_modes == @as(c_int, 0)) and (_this.*.GetDisplayModes != null)) {
        _ = _this.*.GetDisplayModes.?(_this, display);
    }
}
pub fn SDL_GetFullscreenModeMatch(arg_mode: [*c]const SDL_DisplayMode) callconv(.c) [*c]const SDL_DisplayMode {
    @setEvalBranchQuota(100000);
    var mode = arg_mode;
    _ = &mode;
    var display: [*c]SDL_VideoDisplay = undefined;
    _ = &display;
    var fullscreen_mode: SDL_DisplayMode = undefined;
    _ = &fullscreen_mode;
    if ((mode.*.w <= @as(c_int, 0)) or (mode.*.h <= @as(c_int, 0))) {
        return null;
    }
    _ = memcpy(@ptrCast(@alignCast(&fullscreen_mode)), @ptrCast(@alignCast(mode)), @sizeOf(@TypeOf(fullscreen_mode)));
    if (fullscreen_mode.displayID == @as(SDL_DisplayID, 0)) {
        fullscreen_mode.displayID = SDL_GetPrimaryDisplay_REAL();
    }
    SDL_FinalizeDisplayMode(&fullscreen_mode);
    mode = null;
    display = SDL_GetVideoDisplay(fullscreen_mode.displayID);
    if (display != null) {
        SDL_UpdateFullscreenDisplayModes(display);
        if (!(mode != null)) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < display.*.num_fullscreen_modes) : (i += 1) {
                    if (SDL_memcmp_REAL(@ptrCast(@alignCast(&fullscreen_mode)), @ptrCast(@alignCast(&display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))])), @sizeOf(@TypeOf(fullscreen_mode))) == @as(c_int, 0)) {
                        mode = &display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))];
                        break;
                    }
                }
            }
        }
        if (!(mode != null)) {
            {
                var i: c_int = 0;
                _ = &i;
                while (i < display.*.num_fullscreen_modes) : (i += 1) {
                    if (cmpmodes(@ptrCast(@alignCast(&fullscreen_mode)), @ptrCast(@alignCast(&display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))]))) == @as(c_int, 0)) {
                        mode = &display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))];
                        break;
                    }
                }
            }
        }
    }
    return mode;
}
pub export fn SDL_AddFullscreenDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    var modes: [*c]SDL_DisplayMode = undefined;
    _ = &modes;
    var new_mode: SDL_DisplayMode = undefined;
    _ = &new_mode;
    var i: c_int = undefined;
    _ = &i;
    var nmodes: c_int = undefined;
    _ = &nmodes;
    _ = memcpy(@ptrCast(@alignCast(&new_mode)), @ptrCast(@alignCast(mode)), @sizeOf(@TypeOf(new_mode)));
    new_mode.displayID = display.*.id;
    SDL_FinalizeDisplayMode(&new_mode);
    modes = display.*.fullscreen_modes;
    nmodes = display.*.num_fullscreen_modes;
    {
        i = 0;
        while (i < nmodes) : (i += 1) {
            if (cmpmodes(@ptrCast(@alignCast(&new_mode)), @ptrCast(@alignCast(&modes[@bitCast(@as(isize, @intCast(i)))]))) == @as(c_int, 0)) {
                return @"false" != 0;
            }
        }
    }
    if (nmodes == display.*.max_fullscreen_modes) {
        modes = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, display.*.max_fullscreen_modes + @as(c_int, 32)))) *% @sizeOf(@TypeOf(modes.*)))));
        if (!(modes != null)) {
            return @"false" != 0;
        }
        if (display.*.fullscreen_modes != null) {
            _ = memcpy(@ptrCast(@alignCast(modes)), @ptrCast(@alignCast(display.*.fullscreen_modes)), @as(c_ulong, @bitCast(@as(c_long, nmodes))) *% @sizeOf(@TypeOf(modes.*)));
            {
                i = 0;
                while (i < nmodes) : (i += 1) {
                    if (display.*.current_mode == (&display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))])) {
                        display.*.current_mode = &modes[@bitCast(@as(isize, @intCast(i)))];
                    }
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(display.*.fullscreen_modes)));
        }
        display.*.fullscreen_modes = modes;
        display.*.max_fullscreen_modes += 32;
    }
    _ = memcpy(@ptrCast(@alignCast(&modes[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &display.*.num_fullscreen_modes;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ])), @ptrCast(@alignCast(&new_mode)), @sizeOf(@TypeOf(new_mode)));
    SDL_qsort_REAL(@ptrCast(@alignCast(display.*.fullscreen_modes)), @bitCast(@as(c_long, display.*.num_fullscreen_modes)), @sizeOf(SDL_DisplayMode), cmpmodes);
    return @"true" != 0;
}
pub export fn SDL_ResetFullscreenDisplayModes(display: [*c]SDL_VideoDisplay) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = display.*.num_fullscreen_modes;
        while ((blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            SDL_free_REAL(@ptrCast(@alignCast(display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))].internal)));
            display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))].internal = null;
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(display.*.fullscreen_modes)));
    display.*.fullscreen_modes = null;
    display.*.num_fullscreen_modes = 0;
    display.*.max_fullscreen_modes = 0;
    display.*.current_mode = &display.*.desktop_mode;
}
pub export fn SDL_GetFullscreenDisplayModes_REAL(displayID: SDL_DisplayID, count: [*c]c_int) [*c][*c]SDL_DisplayMode {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var num_modes: c_int = undefined;
    _ = &num_modes;
    var result: [*c][*c]SDL_DisplayMode = undefined;
    _ = &result;
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (count != null) {
        count.* = 0;
    }
    if (!(display != null)) {
        return null;
    }
    SDL_UpdateFullscreenDisplayModes(display);
    num_modes = display.*.num_fullscreen_modes;
    result = @ptrCast(@alignCast(SDL_malloc_REAL((@as(c_ulong, @bitCast(@as(c_long, num_modes + @as(c_int, 1)))) *% @sizeOf(@TypeOf(result.*))) +% (@as(c_ulong, @bitCast(@as(c_long, num_modes))) *% @sizeOf(@TypeOf(result.*.*))))));
    if (result != null) {
        var modes: [*c]SDL_DisplayMode = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(result))) + (@as(c_ulong, @bitCast(@as(c_long, num_modes + @as(c_int, 1)))) *% @sizeOf(@TypeOf(result.*)))));
        _ = &modes;
        if (num_modes != 0) {
            _ = memcpy(@ptrCast(@alignCast(modes)), @ptrCast(@alignCast(display.*.fullscreen_modes)), @as(c_ulong, @bitCast(@as(c_long, num_modes))) *% @sizeOf(@TypeOf(modes.*)));
        }
        {
            i = 0;
            while (i < num_modes) : (i += 1) {
                result[@bitCast(@as(isize, @intCast(i)))] = blk: {
                    const ref = &modes;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                };
            }
        }
        result[@bitCast(@as(isize, @intCast(i)))] = null;
        if (count != null) {
            count.* = num_modes;
        }
    } else {
        if (count != null) {
            count.* = 0;
        }
    }
    return result;
}
pub export fn SDL_GetClosestFullscreenDisplayMode_REAL(displayID: SDL_DisplayID, w: c_int, h: c_int, arg_refresh_rate: f32, include_high_density_modes: bool, result: [*c]SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    var refresh_rate = arg_refresh_rate;
    _ = &refresh_rate;
    if (!(result != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("closest"))));
    }
    var mode: [*c]const SDL_DisplayMode = undefined;
    _ = &mode;
    var closest: [*c]const SDL_DisplayMode = null;
    _ = &closest;
    var aspect_ratio: f32 = undefined;
    _ = &aspect_ratio;
    var i: c_int = undefined;
    _ = &i;
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    _ = memset(@ptrCast(@alignCast(result)), 0, @sizeOf(@TypeOf(result.*)));
    if (!(display != null)) {
        return @"false" != 0;
    }
    if (h > @as(c_int, 0)) {
        aspect_ratio = @as(f32, @floatFromInt(w)) / @as(f32, @floatFromInt(h));
    } else {
        aspect_ratio = 1.0;
    }
    if (refresh_rate == @as(f32, 0.0)) {
        refresh_rate = display.*.desktop_mode.refresh_rate;
    }
    SDL_UpdateFullscreenDisplayModes(display);
    {
        i = 0;
        while (i < display.*.num_fullscreen_modes) : (i += 1) {
            mode = &display.*.fullscreen_modes[@bitCast(@as(isize, @intCast(i)))];
            if (w > mode.*.w) {
                break;
            }
            if (h > mode.*.h) {
                continue;
            }
            if ((mode.*.pixel_density > @as(f32, 1.0)) and !include_high_density_modes) {
                continue;
            }
            if (closest != null) {
                var current_aspect_ratio: f32 = @as(f32, @floatFromInt(mode.*.w)) / @as(f32, @floatFromInt(mode.*.h));
                _ = &current_aspect_ratio;
                var closest_aspect_ratio: f32 = @as(f32, @floatFromInt(closest.*.w)) / @as(f32, @floatFromInt(closest.*.h));
                _ = &closest_aspect_ratio;
                if (SDL_fabsf_REAL(aspect_ratio - closest_aspect_ratio) < SDL_fabsf_REAL(aspect_ratio - current_aspect_ratio)) {
                    continue;
                }
                if ((mode.*.w == closest.*.w) and (mode.*.h == closest.*.h)) {
                    if (SDL_fabsf_REAL(closest.*.refresh_rate - refresh_rate) < SDL_fabsf_REAL(mode.*.refresh_rate - refresh_rate)) {
                        continue;
                    }
                    if ((if ((closest.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((closest.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (closest.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((closest.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255)))) > (if ((mode.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(((mode.*.format >> @intCast(@as(SDL_PixelFormat, 28))) & @as(SDL_PixelFormat, 15)) != @as(SDL_PixelFormat, 1)))) != 0)) if ((((((mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YUY2)) or (mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_UYVY))) or (mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_YVYU))) or (mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_P010))) or (mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I0FL))) or (mode.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_I4FL))) @as(c_int, 2) else @as(c_int, 1) else @as(c_int, @bitCast((mode.*.format >> @intCast(@as(SDL_PixelFormat, 0))) & @as(SDL_PixelFormat, 255))))) {
                        continue;
                    }
                }
            }
            closest = mode;
        }
    }
    if (!(closest != null)) {
        return SDL_SetError_REAL("Couldn't find any matching video modes");
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf(result.*)) == @sizeOf(@TypeOf(closest.*)))) @compileError("static assertion failed \"sizeof (*(result)) == sizeof (*( closest))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(result)), @ptrCast(@alignCast(closest)), @sizeOf(@TypeOf(closest.*)));
    return @"true" != 0;
}
pub fn DisplayModeChanged(old_mode: [*c]const SDL_DisplayMode, new_mode: [*c]const SDL_DisplayMode) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (((((old_mode.*.displayID != 0) and (@as(SDL_DisplayID, @bitCast(@as(c_int, @intFromBool(old_mode.*.displayID != new_mode.*.displayID)))) != 0)) or ((old_mode.*.format != 0) and (@as(SDL_PixelFormat, @intCast(@intFromBool(old_mode.*.format != new_mode.*.format))) != 0))) or (((old_mode.*.w != 0) and (old_mode.*.h != 0)) and ((old_mode.*.w != new_mode.*.w) or (old_mode.*.h != new_mode.*.h)))) or ((old_mode.*.pixel_density != @as(f32, 0.0)) and (old_mode.*.pixel_density != new_mode.*.pixel_density))) or ((old_mode.*.refresh_rate != @as(f32, 0.0)) and (old_mode.*.refresh_rate != new_mode.*.refresh_rate));
}
pub export fn SDL_SetDesktopDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) void {
    @setEvalBranchQuota(100000);
    var last_mode: SDL_DisplayMode = undefined;
    _ = &last_mode;
    if (display.*.fullscreen_active) {
        return;
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&last_mode).*)) == @sizeOf(@TypeOf((&display.*.desktop_mode).*)))) @compileError("static assertion failed \"sizeof (*(&last_mode)) == sizeof (*( &display->desktop_mode))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&last_mode)), @ptrCast(@alignCast(&display.*.desktop_mode)), @sizeOf(@TypeOf((&display.*.desktop_mode).*)));
    SDL_free_REAL(@ptrCast(@alignCast(display.*.desktop_mode.internal)));
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&display.*.desktop_mode).*)) == @sizeOf(@TypeOf(mode.*)))) @compileError("static assertion failed \"sizeof (*(&display->desktop_mode)) == sizeof (*( mode))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&display.*.desktop_mode)), @ptrCast(@alignCast(mode)), @sizeOf(@TypeOf(mode.*)));
    display.*.desktop_mode.displayID = display.*.id;
    SDL_FinalizeDisplayMode(&display.*.desktop_mode);
    if (DisplayModeChanged(&last_mode, &display.*.desktop_mode)) {
        SDL_SendDisplayEvent(display, SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED, mode.*.w, mode.*.h);
        if (display.*.current_mode == (&display.*.desktop_mode)) {
            SDL_SendDisplayEvent(display, SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED, mode.*.w, mode.*.h);
        }
    }
}
pub export fn SDL_GetDesktopDisplayMode_REAL(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return null;
    }
    return &display.*.desktop_mode;
}
pub export fn SDL_SetCurrentDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) void {
    @setEvalBranchQuota(100000);
    var last_mode: SDL_DisplayMode = undefined;
    _ = &last_mode;
    if (display.*.current_mode != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&last_mode).*)) == @sizeOf(@TypeOf(display.*.current_mode.*)))) @compileError("static assertion failed \"sizeof (*(&last_mode)) == sizeof (*( display->current_mode))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&last_mode)), @ptrCast(@alignCast(display.*.current_mode)), @sizeOf(@TypeOf(display.*.current_mode.*)));
    } else {
        _ = memset(@ptrCast(@alignCast(&last_mode)), 0, @sizeOf(@TypeOf(last_mode)));
    }
    display.*.current_mode = mode;
    if (DisplayModeChanged(&last_mode, mode)) {
        SDL_SendDisplayEvent(display, SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED, mode.*.w, mode.*.h);
    }
}
pub export fn SDL_GetCurrentDisplayMode_REAL(displayID: SDL_DisplayID) [*c]const SDL_DisplayMode {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(displayID);
    _ = &display;
    if (!(display != null)) {
        return null;
    }
    return display.*.current_mode;
}
pub export fn SDL_SetDisplayModeForDisplay(display: [*c]SDL_VideoDisplay, arg_mode: [*c]SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    var mode = arg_mode;
    _ = &mode;
    if (SDL_ModeSwitchingEmulated(_this) and (SDL_strcmp_REAL(_this.*.name, "x11") != @as(c_int, 0))) {
        return @"true" != 0;
    }
    if (!(mode != null)) {
        mode = &display.*.desktop_mode;
    }
    if (mode == display.*.current_mode) {
        return @"true" != 0;
    }
    if (_this.*.SetDisplayMode != null) {
        var result: bool = undefined;
        _ = &result;
        _this.*.setting_display_mode = @"true" != 0;
        result = _this.*.SetDisplayMode.?(_this, display, mode);
        _this.*.setting_display_mode = @"false" != 0;
        if (!result) {
            return @"false" != 0;
        }
    }
    SDL_SetCurrentDisplayMode(display, mode);
    return @"true" != 0;
}
pub fn SDL_GetClosestPointOnRect(rect: [*c]const SDL_Rect, point: [*c]SDL_Point) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const right: c_int = (rect.*.x + rect.*.w) - @as(c_int, 1);
    _ = &right;
    const bottom: c_int = (rect.*.y + rect.*.h) - @as(c_int, 1);
    _ = &bottom;
    if (point.*.x < rect.*.x) {
        point.*.x = rect.*.x;
    } else if (point.*.x > right) {
        point.*.x = right;
    }
    if (point.*.y < rect.*.y) {
        point.*.y = rect.*.y;
    } else if (point.*.y > bottom) {
        point.*.y = bottom;
    }
}
pub fn GetDisplayForRect(x: c_int, y: c_int, w: c_int, h: c_int) callconv(.c) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var dist: c_int = undefined;
    _ = &dist;
    var closest: SDL_DisplayID = 0;
    _ = &closest;
    var closest_dist: c_int = 2147483647;
    _ = &closest_dist;
    var closest_point_on_display: SDL_Point = undefined;
    _ = &closest_point_on_display;
    var delta: SDL_Point = undefined;
    _ = &delta;
    var center: SDL_Point = undefined;
    _ = &center;
    center.x = x + @divTrunc(w, @as(c_int, 2));
    center.y = y + @divTrunc(h, @as(c_int, 2));
    if (_this != null) {
        {
            i = 0;
            while (i < _this.*.num_displays) : (i += 1) {
                var display: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                _ = &display;
                var display_rect: SDL_Rect = undefined;
                _ = &display_rect;
                _ = SDL_GetDisplayBounds_REAL(display.*.id, &display_rect);
                if (SDL_GetRectEnclosingPoints_REAL(&center, 1, &display_rect, null)) {
                    return display.*.id;
                }
                closest_point_on_display = center;
                SDL_GetClosestPointOnRect(&display_rect, &closest_point_on_display);
                delta.x = center.x - closest_point_on_display.x;
                delta.y = center.y - closest_point_on_display.y;
                dist = (delta.x * delta.x) + (delta.y * delta.y);
                if (dist < closest_dist) {
                    closest = display.*.id;
                    closest_dist = dist;
                }
            }
        }
    }
    if (closest == @as(SDL_DisplayID, 0)) {
        _ = SDL_SetError_REAL("Couldn't find any displays");
    }
    return closest;
}
pub export fn SDL_RelativeToGlobalForWindow(window: [*c]SDL_Window, arg_rel_x: c_int, arg_rel_y: c_int, abs_x: [*c]c_int, abs_y: [*c]c_int) void {
    @setEvalBranchQuota(100000);
    var rel_x = arg_rel_x;
    _ = &rel_x;
    var rel_y = arg_rel_y;
    _ = &rel_y;
    var w: [*c]SDL_Window = undefined;
    _ = &w;
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        {
            w = window.*.parent;
            while (w != null) : (w = w.*.parent) {
                rel_x += w.*.x;
                rel_y += w.*.y;
                if (!((w.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
                    break;
                }
            }
        }
    }
    if (abs_x != null) {
        abs_x.* = rel_x;
    }
    if (abs_y != null) {
        abs_y.* = rel_y;
    }
}
pub export fn SDL_GlobalToRelativeForWindow(window: [*c]SDL_Window, arg_abs_x: c_int, arg_abs_y: c_int, rel_x: [*c]c_int, rel_y: [*c]c_int) void {
    @setEvalBranchQuota(100000);
    var abs_x = arg_abs_x;
    _ = &abs_x;
    var abs_y = arg_abs_y;
    _ = &abs_y;
    var w: [*c]SDL_Window = undefined;
    _ = &w;
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        {
            w = window.*.parent;
            while (w != null) : (w = w.*.parent) {
                abs_x -= w.*.x;
                abs_y -= w.*.y;
                if (!((w.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
                    break;
                }
            }
        }
    }
    if (rel_x != null) {
        rel_x.* = abs_x;
    }
    if (rel_y != null) {
        rel_y.* = abs_y;
    }
}
pub export fn SDL_GetDisplayForPoint_REAL(point: [*c]const SDL_Point) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    if (!(point != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("point"))));
        return 0;
    }
    return GetDisplayForRect(point.*.x, point.*.y, 1, 1);
}
pub export fn SDL_GetDisplayForRect_REAL(rect: [*c]const SDL_Rect) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    if (!(rect != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
        return 0;
    }
    return GetDisplayForRect(rect.*.x, rect.*.y, rect.*.w, rect.*.h);
}
pub fn GetDisplayAtOrigin(x: c_int, y: c_int) callconv(.c) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < _this.*.num_displays) : (i += 1) {
            var rect: SDL_Rect = undefined;
            _ = &rect;
            const cur_id: SDL_DisplayID = _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.id;
            _ = &cur_id;
            if (SDL_GetDisplayBounds_REAL(cur_id, &rect)) {
                if ((x == rect.x) and (y == rect.y)) {
                    return cur_id;
                }
            }
        }
    }
    return 0;
}
pub export fn SDL_GetDisplayForWindowPosition(window: [*c]SDL_Window) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var displayID: SDL_DisplayID = 0;
    _ = &displayID;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0;
    }
    if (_this.*.GetDisplayForWindow != null) {
        displayID = _this.*.GetDisplayForWindow.?(_this, window);
    }
    SDL_RelativeToGlobalForWindow(window, window.*.x, window.*.y, &x, &y);
    if (!(displayID != 0)) {
        if ((window.*.flags & @as(c_ulong, 1)) != 0) {
            displayID = GetDisplayForRect(x, y, 1, 1);
        } else {
            displayID = GetDisplayForRect(x, y, window.*.w, window.*.h);
        }
    }
    if (!(displayID != 0)) {
        displayID = SDL_GetPrimaryDisplay_REAL();
    }
    return displayID;
}
pub export fn SDL_GetVideoDisplayForFullscreenWindow(window: [*c]SDL_Window) [*c]SDL_VideoDisplay {
    @setEvalBranchQuota(100000);
    var displayID: SDL_DisplayID = 0;
    _ = &displayID;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if (window.*.current_fullscreen_mode.displayID != 0) {
        displayID = window.*.current_fullscreen_mode.displayID;
    }
    if (!(displayID != 0)) {
        displayID = window.*.pending_displayID;
    }
    if (!(displayID != 0)) {
        const x: c_int = if (window.*.last_position_pending) window.*.pending.x else window.*.x;
        _ = &x;
        const y: c_int = if (window.*.last_position_pending) window.*.pending.y else window.*.y;
        _ = &y;
        const w: c_int = if (window.*.last_size_pending) window.*.pending.w else window.*.w;
        _ = &w;
        const h: c_int = if (window.*.last_size_pending) window.*.pending.h else window.*.h;
        _ = &h;
        displayID = GetDisplayAtOrigin(x, y);
        if (!(displayID != 0)) {
            displayID = GetDisplayForRect(x, y, w, h);
        }
    }
    if (!(displayID != 0)) {
        displayID = SDL_GetPrimaryDisplay_REAL();
    }
    return SDL_GetVideoDisplay(displayID);
}
pub export fn SDL_GetDisplayForWindow_REAL(window: [*c]SDL_Window) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0;
    }
    var window_props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &window_props;
    var fs_display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForFullscreenWindow(window);
    _ = &fs_display;
    if (fs_display != null) {
        _ = SDL_SetNumberProperty_REAL(window_props, "sdl2-compat.window.preferred_fullscreen_display", fs_display.*.id);
    } else {
        _ = SDL_ClearProperty_REAL(window_props, "sdl2-compat.window.preferred_fullscreen_display");
    }
    return GetDisplayForWindow(window);
}
pub fn SDL_CheckWindowDisplayChanged(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (SDL_SendsDisplayChanges(_this)) {
        return;
    }
    var displayID: SDL_DisplayID = SDL_GetDisplayForWindowPosition(window);
    _ = &displayID;
    if (displayID != window.*.displayID) {
        var old_bounds: SDL_Rect = undefined;
        _ = &old_bounds;
        var new_bounds: SDL_Rect = undefined;
        _ = &new_bounds;
        var window_rect: SDL_Rect = undefined;
        _ = &window_rect;
        var old_overlap: SDL_Rect = undefined;
        _ = &old_overlap;
        var new_overlap: SDL_Rect = undefined;
        _ = &new_overlap;
        if (SDL_GetDisplayBounds_REAL(window.*.displayID, &old_bounds) and SDL_GetDisplayBounds_REAL(displayID, &new_bounds)) {
            window_rect.x = window.*.x;
            window_rect.y = window.*.y;
            window_rect.w = window.*.w;
            window_rect.h = window.*.h;
            if (SDL_GetRectIntersection_REAL(&old_bounds, &window_rect, &old_overlap) and SDL_GetRectIntersection_REAL(&new_bounds, &window_rect, &new_overlap)) {
                var old_area: c_int = old_overlap.w * old_overlap.h;
                _ = &old_area;
                var new_area: c_int = new_overlap.w * new_overlap.h;
                _ = &new_area;
                var new_overlap_ratio: f32 = @as(f32, @floatFromInt(new_area)) / (@as(f32, @floatFromInt(old_area)) + @as(f32, @floatFromInt(new_area)));
                _ = &new_overlap_ratio;
                if (@as(f64, @floatCast(new_overlap_ratio)) < @as(f64, 0.8)) {
                    return;
                }
            }
        }
    }
    if (displayID != window.*.displayID) {
        var i: c_int = undefined;
        _ = &i;
        var display_index: c_int = undefined;
        _ = &display_index;
        display_index = SDL_GetDisplayIndex(displayID);
        {
            i = 0;
            while (i < _this.*.num_displays) : (i += 1) {
                var display: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                _ = &display;
                if (display.*.fullscreen_window == window) {
                    if (display_index != i) {
                        if (display_index < @as(c_int, 0)) {
                            display_index = i;
                        } else {
                            var new_display: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(display_index)))];
                            _ = &new_display;
                            if ((new_display.*.fullscreen_window != null) and (new_display.*.fullscreen_window != window)) {
                                _ = SDL_MinimizeWindow_REAL(new_display.*.fullscreen_window);
                            }
                            new_display.*.fullscreen_window = window;
                            display.*.fullscreen_window = null;
                        }
                    }
                    break;
                }
            }
        }
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_DISPLAY_CHANGED, @bitCast(@as(c_uint, @truncate(displayID))), 0);
    }
}
pub export fn SDL_GetWindowPixelDensity_REAL(window: [*c]SDL_Window) f32 {
    @setEvalBranchQuota(100000);
    var window_w: c_int = undefined;
    _ = &window_w;
    var window_h: c_int = undefined;
    _ = &window_h;
    var pixel_w: c_int = undefined;
    _ = &pixel_w;
    var pixel_h: c_int = undefined;
    _ = &pixel_h;
    var pixel_density: f32 = 1.0;
    _ = &pixel_density;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0.0;
    }
    if (SDL_GetWindowSize_REAL(window, &window_w, &window_h) and SDL_GetWindowSizeInPixels_REAL(window, &pixel_w, &pixel_h)) {
        pixel_density = @as(f32, @floatFromInt(pixel_w)) / @as(f32, @floatFromInt(window_w));
    }
    return pixel_density;
}
pub export fn SDL_GetWindowDisplayScale_REAL(window: [*c]SDL_Window) f32 {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0.0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0.0;
    }
    return window.*.display_scale;
}
pub fn SDL_CheckWindowDisplayScaleChanged(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var display_scale: f32 = undefined;
    _ = &display_scale;
    if (_this.*.GetWindowContentScale != null) {
        display_scale = _this.*.GetWindowContentScale.?(_this, window);
    } else {
        const pixel_density: f32 = SDL_GetWindowPixelDensity_REAL(window);
        _ = &pixel_density;
        const content_scale: f32 = SDL_GetDisplayContentScale_REAL(window.*.displayID);
        _ = &content_scale;
        display_scale = pixel_density * content_scale;
    }
    if (display_scale != window.*.display_scale) {
        window.*.display_scale = display_scale;
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED, 0, 0);
    }
}
pub export fn SDL_UpdateFullscreenMode(window: [*c]SDL_Window, arg_fullscreen: SDL_FullscreenOp, commit: bool) bool {
    @setEvalBranchQuota(100000);
    var fullscreen = arg_fullscreen;
    _ = &fullscreen;
    var display: [*c]SDL_VideoDisplay = undefined;
    _ = &display;
    var mode: [*c]SDL_DisplayMode = undefined;
    _ = &mode;
    var i: c_int = undefined;
    _ = &i;
    var other: [*c]SDL_VideoDisplay = undefined;
    _ = &other;
    var mode_w: c_int = undefined;
    _ = &mode_w;
    var mode_h: c_int = undefined;
    _ = &mode_h;
    var resized: bool = undefined;
    _ = &resized;
    var ret: SDL_FullscreenResult = undefined;
    _ = &ret;
    var displayRect: SDL_Rect = undefined;
    _ = &displayRect;
    var resized_1: bool = undefined;
    _ = &resized_1;
    var ret_2: SDL_FullscreenResult = undefined;
    _ = &ret_2;
    var full_screen_display: [*c]SDL_VideoDisplay = undefined;
    _ = &full_screen_display;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                display = null;
                mode = null;
                if (!(_this != null)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            1 => {
                window.*.last_fullscreen_exclusive_display = if (((display != null) and ((window.*.flags & @as(c_ulong, 1)) != 0)) and window.*.fullscreen_exclusive) display.*.id else @as(SDL_DisplayID, 0);
                return @"true" != 0;
            },
            2 => {
                if (fullscreen != 0) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            3 => {
                _ = SDL_UninitializedVideo();
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                _ = SDL_SetError_REAL("Invalid window");
                return @"false" != 0;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                window.*.fullscreen_exclusive = @"false" != 0;
                window.*.update_fullscreen_on_display_changed = @"false" != 0;
                if (window.*.is_destroying or window.*.is_hiding) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                fullscreen = SDL_FULLSCREEN_OP_LEAVE;
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
                if (fullscreen != 0) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                display = SDL_GetVideoDisplayForFullscreenWindow(window);
                if (!(display != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i = 0;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                if (fullscreen != 0) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
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
                if (i < _this.*.num_displays) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                display = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                if (display.*.fullscreen_window == window) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                i += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                if (!(display != null) or (i == _this.*.num_displays)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 21;
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
                    sdl_pc = 20;
                    continue;
                }
            },
            25 => {
                display = null;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            28 => {
                mode = @ptrCast(@alignCast(@constCast(SDL_GetWindowFullscreenMode_REAL(window))));
                if (mode != null) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
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
                if (display != null) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            31 => {
                window.*.fullscreen_exclusive = @"true" != 0;
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                _ = memset(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), 0, @sizeOf(@TypeOf(window.*.current_fullscreen_mode)));
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            34 => {
                i = 0;
                {
                    sdl_pc = 37;
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
                if (fullscreen != 0) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            37 => {
                if (i < _this.*.num_displays) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                other = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                if ((other != display) and (other.*.fullscreen_window == window)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            39 => {
                i += 1;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            41 => {
                _ = SDL_SetDisplayModeForDisplay(other, null);
                other.*.fullscreen_window = null;
                {
                    sdl_pc = 43;
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
                    sdl_pc = 39;
                    continue;
                }
            },
            44 => {
                mode_w = 0;
                mode_h = 0;
                resized = @"false" != 0;
                if ((display.*.fullscreen_window != null) and (display.*.fullscreen_window != window)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            45 => {
                resized_1 = @"false" != 0;
                if (display != null) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
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
                _ = SDL_MinimizeWindow_REAL(display.*.fullscreen_window);
                {
                    sdl_pc = 49;
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
                display.*.fullscreen_active = window.*.fullscreen_exclusive;
                if (!SDL_SetDisplayModeForDisplay(display, mode)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 2;
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
                if (commit) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                ret = SDL_FULLSCREEN_SUCCEEDED;
                if (_this.*.SetWindowFullscreen != null) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
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
                if ((window.*.flags & @as(c_ulong, 1)) != 0) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            56 => {
                ret = _this.*.SetWindowFullscreen.?(_this, window, display, fullscreen);
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                resized = @"true" != 0;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (ret == @as(SDL_FullscreenResult, SDL_FULLSCREEN_SUCCEEDED)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            60 => {
                if (ret == @as(SDL_FullscreenResult, SDL_FULLSCREEN_FAILED)) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            62 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_ENTER_FULLSCREEN, 0, 0);
                {
                    sdl_pc = 64;
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
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            65 => {
                display.*.fullscreen_active = @"false" != 0;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            68 => {
                display.*.fullscreen_window = window;
                if (!SDL_SendsFullscreenDimensions(_this)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            71 => {
                if (mode != null) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
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
                    sdl_pc = 70;
                    continue;
                }
            },
            74 => {
                mode_w = mode.*.w;
                mode_h = mode.*.h;
                _ = SDL_GetDisplayBounds_REAL(mode.*.displayID, &displayRect);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                mode_w = display.*.desktop_mode.w;
                mode_h = display.*.desktop_mode.h;
                _ = SDL_GetDisplayBounds_REAL(display.*.id, &displayRect);
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                if ((window.*.w != mode_w) or (window.*.h != mode_h)) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                resized = @"true" != 0;
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
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, displayRect.x, displayRect.y);
                if (resized) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, mode_w, mode_h);
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                SDL_OnWindowResized(window);
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            83 => {
                display.*.fullscreen_active = @"false" != 0;
                _ = SDL_SetDisplayModeForDisplay(display, null);
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
                if (commit) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                ret_2 = SDL_FULLSCREEN_SUCCEEDED;
                if (_this.*.SetWindowFullscreen != null) {
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
                if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            89 => {
                full_screen_display = if (display != null) display else SDL_GetVideoDisplayForFullscreenWindow(window);
                if (full_screen_display != null) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            90 => {
                resized_1 = @"true" != 0;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                if (ret_2 == @as(SDL_FullscreenResult, SDL_FULLSCREEN_SUCCEEDED)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            92 => {
                ret_2 = _this.*.SetWindowFullscreen.?(_this, window, full_screen_display, SDL_FULLSCREEN_OP_LEAVE);
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            95 => {
                if ((window.*.flags & @as(c_ulong, 1)) != 0) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            96 => {
                if (ret_2 == @as(SDL_FullscreenResult, SDL_FULLSCREEN_FAILED)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            97 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            98 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_LEAVE_FULLSCREEN, 0, 0);
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
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 2;
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
                    sdl_pc = 97;
                    continue;
                }
            },
            104 => {
                if (display != null) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
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
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            107 => {
                display.*.fullscreen_window = null;
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
                if (!SDL_SendsFullscreenDimensions(_this)) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, window.*.windowed.x, window.*.windowed.y);
                if (resized_1) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            113 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, window.*.windowed.w, window.*.windowed.h);
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                SDL_OnWindowResized(window);
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_LEAVE, commit);
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SetWindowFullscreenMode_REAL(window: [*c]SDL_Window, mode: [*c]const SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (mode != null) {
        if (!(SDL_GetFullscreenModeMatch(mode) != null)) {
            return SDL_SetError_REAL("Invalid fullscreen display mode");
        }
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)) == @sizeOf(@TypeOf(mode.*)))) @compileError("static assertion failed \"sizeof (*(&window->requested_fullscreen_mode)) == sizeof (*( mode))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&window.*.requested_fullscreen_mode)), @ptrCast(@alignCast(mode)), @sizeOf(@TypeOf(mode.*)));
    } else {
        _ = memset(@ptrCast(@alignCast(&window.*.requested_fullscreen_mode)), 0, @sizeOf(@TypeOf(window.*.requested_fullscreen_mode)));
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&window.*.current_fullscreen_mode).*)) == @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)))) @compileError("static assertion failed \"sizeof (*(&window->current_fullscreen_mode)) == sizeof (*( &window->requested_fullscreen_mode))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), @ptrCast(@alignCast(&window.*.requested_fullscreen_mode)), @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)));
    if ((((window.*.flags & @as(c_ulong, 1)) != @as(SDL_WindowFlags, 0)) and ((window.*.flags & @as(c_ulong, 8)) == @as(SDL_WindowFlags, 0))) and ((window.*.flags & @as(c_ulong, 64)) == @as(SDL_WindowFlags, 0))) {
        _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_UPDATE, @"true" != 0);
        SDL_SyncIfRequired(window);
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowFullscreenMode_REAL(window: [*c]SDL_Window) [*c]const SDL_DisplayMode {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return null;
    }
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        return SDL_GetFullscreenModeMatch(&window.*.current_fullscreen_mode);
    } else {
        return SDL_GetFullscreenModeMatch(&window.*.requested_fullscreen_mode);
    }
}
pub export fn SDL_GetWindowICCProfile_REAL(window: [*c]SDL_Window, size: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if (!(_this.*.GetWindowICCProfile != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return null;
    }
    return _this.*.GetWindowICCProfile.?(_this, window, size);
}
pub export fn SDL_GetWindowPixelFormat_REAL(window: [*c]SDL_Window) SDL_PixelFormat {
    @setEvalBranchQuota(100000);
    var displayID: SDL_DisplayID = undefined;
    _ = &displayID;
    var mode: [*c]const SDL_DisplayMode = undefined;
    _ = &mode;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return SDL_PIXELFORMAT_UNKNOWN;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return SDL_PIXELFORMAT_UNKNOWN;
    }
    displayID = GetDisplayForWindow(window);
    mode = SDL_GetCurrentDisplayMode_REAL(displayID);
    if (mode != null) {
        return mode.*.format;
    } else {
        return SDL_PIXELFORMAT_UNKNOWN;
    }
}
pub fn IsAcceptingDragAndDrop() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_EventEnabled_REAL(SDL_EVENT_DROP_FILE) or SDL_EventEnabled_REAL(SDL_EVENT_DROP_TEXT)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn PrepareDragAndDropSupport(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (_this.*.AcceptDragAndDrop != null) {
        _this.*.AcceptDragAndDrop.?(window, IsAcceptingDragAndDrop());
    }
}
pub export fn SDL_ToggleDragAndDropSupport() void {
    @setEvalBranchQuota(100000);
    if ((_this != null) and (_this.*.AcceptDragAndDrop != null)) {
        const enable: bool = IsAcceptingDragAndDrop();
        _ = &enable;
        var window: [*c]SDL_Window = undefined;
        _ = &window;
        {
            window = _this.*.windows;
            while (window != null) : (window = window.*.next) {
                _this.*.AcceptDragAndDrop.?(window, enable);
            }
        }
    }
}
pub export fn SDL_GetWindows_REAL(count: [*c]c_int) [*c][*c]SDL_Window {
    @setEvalBranchQuota(100000);
    if (count != null) {
        count.* = 0;
    }
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var num_added: c_int = 0;
    _ = &num_added;
    var num_windows: c_int = 0;
    _ = &num_windows;
    {
        window = _this.*.windows;
        while (window != null) : (window = window.*.next) {
            num_windows += 1;
        }
    }
    var windows: [*c][*c]SDL_Window = undefined;
    windows = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, num_windows + @as(c_int, 1)))) *% @sizeOf(@TypeOf(windows.*)))));
    _ = &windows;
    if (!(windows != null)) {
        return null;
    }
    {
        window = _this.*.windows;
        while (window != null) : (window = window.*.next) {
            windows[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &num_added;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = window;
            if (num_added == num_windows) {
                break;
            }
        }
    }
    windows[@bitCast(@as(isize, @intCast(num_added)))] = null;
    if (count != null) {
        count.* = num_added;
    }
    return windows;
}
pub fn ApplyWindowFlags(window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
        if (!((flags & (@as(c_ulong, 64) | @as(c_ulong, 128))) != 0)) {
            _ = SDL_RestoreWindow_REAL(window);
        }
        if ((flags & @as(c_ulong, 128)) != 0) {
            _ = SDL_MaximizeWindow_REAL(window);
        }
        _ = SDL_SetWindowFullscreen_REAL(window, (flags & @as(c_ulong, 1)) != @as(SDL_WindowFlags, 0));
        if ((flags & @as(c_ulong, 64)) != 0) {
            _ = SDL_MinimizeWindow_REAL(window);
        }
        if ((flags & @as(c_ulong, 4096)) != 0) {
            _ = SDL_SetWindowModal_REAL(window, @"true" != 0);
        }
        if ((flags & @as(c_ulong, 256)) != 0) {
            _ = SDL_SetWindowMouseGrab_REAL(window, @"true" != 0);
        }
        if ((flags & @as(c_ulong, 1048576)) != 0) {
            _ = SDL_SetWindowKeyboardGrab_REAL(window, @"true" != 0);
        }
    }
}
pub fn SDL_FinishWindowCreation(window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) void {
    @setEvalBranchQuota(100000);
    PrepareDragAndDropSupport(window);
    if ((window.*.flags & @as(c_ulong, 2048)) != 0) {} else {
        ApplyWindowFlags(window, flags);
        if (!((flags & @as(c_ulong, 8)) != 0)) {
            _ = SDL_ShowWindow_REAL(window);
        }
    }
    if (!((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
        _ = SDL_SetWindowProgressState_REAL(window, SDL_PROGRESS_STATE_NONE);
        _ = SDL_SetWindowProgressValue_REAL(window, 0.0);
    }
}
pub fn SDL_ContextNotSupported(name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("%s support is either not configured in SDL or not available in current SDL video driver (%s) or platform", name, _this.*.name);
}
pub fn SDL_DllNotSupported(name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("No dynamic %s support in current SDL video driver (%s)", name, _this.*.name);
}
const struct_unnamed_23 = extern struct {
    property_name: [*c]const u8 = null,
    flag: SDL_WindowFlags = 0,
    invert_value: bool = false,
};
pub var SDL_WindowFlagProperties: [18]struct_unnamed_23 = [18]struct_unnamed_23{
    struct_unnamed_23{
        .property_name = "SDL.window.create.always_on_top",
        .flag = 65536,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.borderless",
        .flag = 16,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.focusable",
        .flag = 2147483648,
        .invert_value = @"true" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.fullscreen",
        .flag = 1,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.hidden",
        .flag = 8,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.high_pixel_density",
        .flag = 8192,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.maximized",
        .flag = 128,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.menu",
        .flag = 524288,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.metal",
        .flag = 536870912,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.minimized",
        .flag = 64,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.modal",
        .flag = 4096,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.mouse_grabbed",
        .flag = 256,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.opengl",
        .flag = 2,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.resizable",
        .flag = 32,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.transparent",
        .flag = 1073741824,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.tooltip",
        .flag = 262144,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.utility",
        .flag = 131072,
        .invert_value = @"false" != 0,
    },
    struct_unnamed_23{
        .property_name = "SDL.window.create.vulkan",
        .flag = 268435456,
        .invert_value = @"false" != 0,
    },
};
pub fn SDL_GetWindowFlagProperties(props: SDL_PropertiesID) callconv(.c) SDL_WindowFlags {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var flags: SDL_WindowFlags = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(props, "SDL.window.create.flags", 0)));
    _ = &flags;
    {
        i = 0;
        while (@as(c_ulong, i) < (@sizeOf(@TypeOf(SDL_WindowFlagProperties)) / @sizeOf(@TypeOf(SDL_WindowFlagProperties[@as(c_int, 0)])))) : (i +%= 1) {
            if (SDL_WindowFlagProperties[i].invert_value) {
                if (!SDL_GetBooleanProperty_REAL(props, SDL_WindowFlagProperties[i].property_name, @"true" != 0)) {
                    flags |= SDL_WindowFlagProperties[i].flag;
                }
            } else {
                if (SDL_GetBooleanProperty_REAL(props, SDL_WindowFlagProperties[i].property_name, @"false" != 0)) {
                    flags |= SDL_WindowFlagProperties[i].flag;
                }
            }
        }
    }
    return flags;
}
pub export fn SDL_CreateWindowWithProperties_REAL(props: SDL_PropertiesID) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var title: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.window.create.title", null);
    _ = &title;
    var x: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.window.create.x", SDL_WINDOWPOS_UNDEFINED_MASK | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))));
    _ = &x;
    var y: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.window.create.y", SDL_WINDOWPOS_UNDEFINED_MASK | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0))))));
    _ = &y;
    var w: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.window.create.width", 0));
    _ = &w;
    var h: c_int = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.window.create.height", 0));
    _ = &h;
    var parent: [*c]SDL_Window = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.window.create.parent", null)));
    _ = &parent;
    var flags: SDL_WindowFlags = SDL_GetWindowFlagProperties(props);
    _ = &flags;
    var type_flags: SDL_WindowFlags = undefined;
    _ = &type_flags;
    var graphics_flags: SDL_WindowFlags = undefined;
    _ = &graphics_flags;
    var displayID: SDL_DisplayID = 0;
    _ = &displayID;
    var undefined_x: bool = @"false" != 0;
    _ = &undefined_x;
    var undefined_y: bool = @"false" != 0;
    _ = &undefined_y;
    var external_graphics_context: bool = SDL_GetBooleanProperty_REAL(props, "SDL.window.create.external_graphics_context", @"false" != 0);
    _ = &external_graphics_context;
    if (!(_this != null)) {
        if (!SDL_Init_REAL(SDL_INIT_VIDEO)) {
            return null;
        }
        if (!(_this != null)) {
            return null;
        }
    }
    if (((flags & @as(c_ulong, 4096)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!SDL_ObjectValid(@ptrCast(@alignCast(parent)), SDL_OBJECT_TYPE_WINDOW))))) != 0)) {
        _ = SDL_SetError_REAL("Modal windows must specify a parent window");
        return null;
    }
    if ((flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        if (!((_this.*.device_caps & @as(Uint32, VIDEO_DEVICE_CAPS_HAS_POPUP_WINDOW_SUPPORT)) != 0)) {
            _ = SDL_SetError_REAL("That operation is not supported");
            return null;
        }
        if (!SDL_ObjectValid(@ptrCast(@alignCast(parent)), SDL_OBJECT_TYPE_WINDOW)) {
            _ = SDL_SetError_REAL("Tooltip and popup menu windows must specify a parent window");
            return null;
        }
        flags &= ~(((@as(c_ulong, 64) | @as(c_ulong, 128)) | @as(c_ulong, 1)) | @as(c_ulong, 16));
    }
    type_flags = flags & (((@as(c_ulong, 131072) | @as(c_ulong, 262144)) | @as(c_ulong, 524288)) | @as(c_ulong, 4096));
    if ((type_flags & (type_flags -% @as(SDL_WindowFlags, 1))) != 0) {
        _ = SDL_SetError_REAL("Conflicting window type flags specified: 0x%.8x", @as(c_uint, @truncate(type_flags)));
        return null;
    }
    if (_this.*.RefreshDisplays != null) {
        _this.*.RefreshDisplays.?(_this);
    }
    if (w < @as(c_int, 1)) {
        w = 1;
    }
    if (h < @as(c_int, 1)) {
        h = 1;
    }
    if (((((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK)) or ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK)) or ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK)) {
        var bounds: SDL_Rect = undefined;
        _ = &bounds;
        if ((((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK)) and ((x & @as(c_int, 65535)) != 0)) {
            displayID = @bitCast(@as(c_int, x & @as(c_int, 65535)));
        } else if ((((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK)) and ((y & @as(c_int, 65535)) != 0)) {
            displayID = @bitCast(@as(c_int, y & @as(c_int, 65535)));
        }
        if ((displayID == @as(SDL_DisplayID, 0)) or (SDL_GetDisplayIndex(displayID) < @as(c_int, 0))) {
            displayID = SDL_GetPrimaryDisplay_REAL();
        }
        _ = memset(@ptrCast(@alignCast(&bounds)), 0, @sizeOf(@TypeOf(bounds)));
        _ = SDL_GetDisplayUsableBounds_REAL(displayID, &bounds);
        if ((w > bounds.w) or (h > bounds.h)) {
            _ = SDL_GetDisplayBounds_REAL(displayID, &bounds);
        }
        if (((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK)) {
            if ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) {
                undefined_x = @"true" != 0;
            }
            x = bounds.x + @divTrunc(bounds.w - w, @as(c_int, 2));
        }
        if (((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK)) {
            if ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) {
                undefined_y = @"true" != 0;
            }
            y = bounds.y + @divTrunc(bounds.h - h, @as(c_int, 2));
        }
    }
    graphics_flags = flags & ((@as(c_ulong, 2) | @as(c_ulong, 536870912)) | @as(c_ulong, 268435456));
    if ((graphics_flags & (graphics_flags -% @as(SDL_WindowFlags, 1))) != 0) {
        _ = SDL_SetError_REAL("Conflicting window graphics flags specified: 0x%.8x", @as(c_uint, @truncate(graphics_flags)));
        return null;
    }
    if (!(graphics_flags != 0) and !external_graphics_context) {
        flags |= SDL_DefaultGraphicsBackends(_this);
    }
    if ((flags & @as(c_ulong, 2)) != 0) {
        if (!(_this.*.GL_CreateContext != null)) {
            _ = SDL_ContextNotSupported("OpenGL");
            return null;
        }
        if (!SDL_GL_LoadLibrary_REAL(null)) {
            return null;
        }
    }
    if ((flags & @as(c_ulong, 268435456)) != 0) {
        if (!(_this.*.Vulkan_CreateSurface != null)) {
            _ = SDL_ContextNotSupported("Vulkan");
            return null;
        }
        if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
            return null;
        }
    }
    if ((flags & @as(c_ulong, 536870912)) != 0) {
        if (!(_this.*.Metal_CreateView != null)) {
            _ = SDL_ContextNotSupported("Metal");
            return null;
        }
    }
    window = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(window.*)))));
    if (!(window != null)) {
        return null;
    }
    SDL_SetObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW, @"true" != 0);
    window.*.id = SDL_GetNextObjectID();
    window.*.floating.x = blk: {
        const tmp = blk_1: {
            const tmp_2 = x;
            window.*.x = tmp_2;
            break :blk_1 tmp_2;
        };
        window.*.windowed.x = tmp;
        break :blk tmp;
    };
    window.*.floating.y = blk: {
        const tmp = blk_1: {
            const tmp_2 = y;
            window.*.y = tmp_2;
            break :blk_1 tmp_2;
        };
        window.*.windowed.y = tmp;
        break :blk tmp;
    };
    window.*.floating.w = blk: {
        const tmp = blk_1: {
            const tmp_2 = w;
            window.*.w = tmp_2;
            break :blk_1 tmp_2;
        };
        window.*.windowed.w = tmp;
        break :blk tmp;
    };
    window.*.floating.h = blk: {
        const tmp = blk_1: {
            const tmp_2 = h;
            window.*.h = tmp_2;
            break :blk_1 tmp_2;
        };
        window.*.windowed.h = tmp;
        break :blk tmp;
    };
    window.*.undefined_x = undefined_x;
    window.*.undefined_y = undefined_y;
    window.*.pending_displayID = displayID;
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForWindow(window);
    _ = &display;
    if (display != null) {
        SDL_SetWindowHDRProperties(window, &display.*.HDR, @"false" != 0);
    }
    if (((flags & @as(c_ulong, 1)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(IsFullscreenOnly(_this)))))) != 0)) {
        var bounds: SDL_Rect = undefined;
        _ = &bounds;
        _ = SDL_GetDisplayBounds_REAL(if (display != null) display.*.id else SDL_GetPrimaryDisplay_REAL(), &bounds);
        window.*.x = bounds.x;
        window.*.y = bounds.y;
        window.*.w = bounds.w;
        window.*.h = bounds.h;
        window.*.pending_flags |= 1;
        flags |= 1;
    }
    window.*.flags = (flags & (((((((((((((@as(c_ulong, 2) | @as(c_ulong, 16)) | @as(c_ulong, 32)) | @as(c_ulong, 8192)) | @as(c_ulong, 65536)) | @as(c_ulong, 524288)) | @as(c_ulong, 131072)) | @as(c_ulong, 262144)) | @as(c_ulong, 268435456)) | @as(c_ulong, 64)) | @as(c_ulong, 536870912)) | @as(c_ulong, 1073741824)) | @as(c_ulong, 2147483648)) | @as(c_ulong, 2097152))) | @as(c_ulong, 8);
    window.*.display_scale = 1.0;
    window.*.opacity = 1.0;
    window.*.next = _this.*.windows;
    window.*.is_destroying = @"false" != 0;
    window.*.displayID = GetDisplayForWindow(window);
    window.*.external_graphics_context = external_graphics_context;
    window.*.constrain_popup = SDL_GetBooleanProperty_REAL(props, "SDL.window.create.constrain_popup", @"true" != 0);
    if (!(_this.*.SetWindowFillDocument != null)) {
        window.*.flags &= ~@as(c_ulong, 2097152);
    }
    if (_this.*.windows != null) {
        _this.*.windows.*.prev = window;
    }
    _this.*.windows = window;
    SDL_UpdateWindowHierarchy(window, parent);
    if ((_this.*.CreateSDLWindow != null) and !_this.*.CreateSDLWindow.?(_this, window, props)) {
        while (true) {
            var saved_error: [*c]u8 = SDL_strdup_REAL(SDL_GetError_REAL());
            _ = &saved_error;
            SDL_DestroyWindow_REAL(window);
            if (saved_error != null) {
                _ = SDL_SetError_REAL("%s", saved_error);
                SDL_free_REAL(@ptrCast(@alignCast(saved_error)));
            }
            if (!false) break;
        }
        return null;
    }
    if ((window.*.flags & @as(c_ulong, 64)) != 0) {
        window.*.flags &= ~@as(c_ulong, 64);
    }
    if (title != null) {
        _ = SDL_SetWindowTitle_REAL(window, title);
    }
    SDL_FinishWindowCreation(window, flags);
    SDL_CheckWindowPixelSizeChanged(window);
    _ = SDL_ClearError_REAL();
    return window;
}
pub export fn SDL_CreateWindow_REAL(title: [*c]const u8, w: c_int, h: c_int, flags: SDL_WindowFlags) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    if ((title != null) and (@as(c_int, title.*) != 0)) {
        _ = SDL_SetStringProperty_REAL(props, "SDL.window.create.title", title);
    }
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.width", w);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.height", h);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.flags", @bitCast(@as(c_ulong, @truncate(flags))));
    window = SDL_CreateWindowWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return window;
}
pub export fn SDL_CreatePopupWindow_REAL(parent: [*c]SDL_Window, offset_x: c_int, offset_y: c_int, w: c_int, h: c_int, flags: SDL_WindowFlags) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var props: SDL_PropertiesID = SDL_CreateProperties_REAL();
    _ = &props;
    if (!((flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != 0)) {
        _ = SDL_SetError_REAL("Popup windows must specify either the 'SDL_WINDOW_TOOLTIP' or the 'SDL_WINDOW_POPUP_MENU' flag");
        return null;
    }
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.create.parent", @ptrCast(@alignCast(parent)));
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.x", offset_x);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.y", offset_y);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.width", w);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.height", h);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.create.flags", @bitCast(@as(c_ulong, @truncate(flags))));
    window = SDL_CreateWindowWithProperties_REAL(props);
    SDL_DestroyProperties_REAL(props);
    return window;
}
pub fn SDL_ReconfigureWindowInternal(window: [*c]SDL_Window, flags: SDL_WindowFlags) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var loaded_opengl: bool = @"false" != 0;
    _ = &loaded_opengl;
    var loaded_vulkan: bool = @"false" != 0;
    _ = &loaded_vulkan;
    if (!(_this.*.ReconfigureWindow != null)) {
        return @"false" != 0;
    }
    const graphics_flags: SDL_WindowFlags = flags & ((@as(c_ulong, 2) | @as(c_ulong, 536870912)) | @as(c_ulong, 268435456));
    _ = &graphics_flags;
    if ((graphics_flags & (graphics_flags -% @as(SDL_WindowFlags, 1))) != 0) {
        return SDL_SetError_REAL("Conflicting window flags specified");
    }
    if (((flags & @as(c_ulong, 2)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.GL_CreateContext != null))))) != 0)) {
        return SDL_ContextNotSupported("OpenGL");
    }
    if (((flags & @as(c_ulong, 268435456)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.Vulkan_CreateSurface != null))))) != 0)) {
        return SDL_ContextNotSupported("Vulkan");
    }
    if (((flags & @as(c_ulong, 536870912)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.Metal_CreateView != null))))) != 0)) {
        return SDL_ContextNotSupported("Metal");
    }
    if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
        if ((window.*.flags & ((@as(c_ulong, 2) | @as(c_ulong, 536870912)) | @as(c_ulong, 268435456))) != 0) {
            return @"false" != 0;
        }
    } else {
        if (!_this.*.ReconfigureWindow.?(_this, window, 0)) {
            return @"false" != 0;
        }
        if ((window.*.flags & @as(c_ulong, 2)) != 0) {
            SDL_GL_UnloadLibrary_REAL();
        }
        if ((window.*.flags & @as(c_ulong, 268435456)) != 0) {
            SDL_Vulkan_UnloadLibrary_REAL();
        }
        window.*.flags &= ~((@as(c_ulong, 2) | @as(c_ulong, 536870912)) | @as(c_ulong, 268435456));
    }
    _ = SDL_DestroyWindowSurface_REAL(window);
    if ((graphics_flags & @as(c_ulong, 2)) != 0) {
        loaded_opengl = SDL_GL_LoadLibrary_REAL(null);
        if (!loaded_opengl) {
            return @"false" != 0;
        }
    } else if ((graphics_flags & @as(c_ulong, 268435456)) != 0) {
        loaded_vulkan = SDL_Vulkan_LoadLibrary_REAL(null);
        if (!loaded_vulkan) {
            return @"false" != 0;
        }
    }
    if (!_this.*.ReconfigureWindow.?(_this, window, graphics_flags)) {
        if (loaded_opengl) {
            SDL_GL_UnloadLibrary_REAL();
        }
        if (loaded_vulkan) {
            SDL_Vulkan_UnloadLibrary_REAL();
        }
        return @"false" != 0;
    }
    window.*.flags |= graphics_flags;
    return @"true" != 0;
}
pub export fn SDL_RecreateWindow(window: [*c]SDL_Window, arg_flags: SDL_WindowFlags) bool {
    @setEvalBranchQuota(100000);
    var flags = arg_flags;
    _ = &flags;
    var loaded_opengl: bool = @"false" != 0;
    _ = &loaded_opengl;
    var need_gl_unload: bool = @"false" != 0;
    _ = &need_gl_unload;
    var need_gl_load: bool = @"false" != 0;
    _ = &need_gl_load;
    var loaded_vulkan: bool = @"false" != 0;
    _ = &loaded_vulkan;
    var need_vulkan_unload: bool = @"false" != 0;
    _ = &need_vulkan_unload;
    var need_vulkan_load: bool = @"false" != 0;
    _ = &need_vulkan_load;
    var graphics_flags: SDL_WindowFlags = undefined;
    _ = &graphics_flags;
    graphics_flags = flags & ((@as(c_ulong, 2) | @as(c_ulong, 536870912)) | @as(c_ulong, 268435456));
    if ((graphics_flags & (graphics_flags -% @as(SDL_WindowFlags, 1))) != 0) {
        return SDL_SetError_REAL("Conflicting window flags specified");
    }
    if (((flags & @as(c_ulong, 2)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.GL_CreateContext != null))))) != 0)) {
        return SDL_ContextNotSupported("OpenGL");
    }
    if (((flags & @as(c_ulong, 268435456)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.Vulkan_CreateSurface != null))))) != 0)) {
        return SDL_ContextNotSupported("Vulkan");
    }
    if (((flags & @as(c_ulong, 536870912)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.Metal_CreateView != null))))) != 0)) {
        return SDL_ContextNotSupported("Metal");
    }
    if ((window.*.flags & @as(c_ulong, 2048)) != 0) {
        flags |= 2048;
    } else {
        flags &= ~@as(c_ulong, 2048);
    }
    if ((window.*.flags & @as(c_ulong, 4096)) != 0) {
        _ = SDL_SetWindowModal_REAL(window, @"false" != 0);
    }
    if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
        const restore_on_show: bool = window.*.restore_on_show;
        _ = &restore_on_show;
        _ = SDL_HideWindow_REAL(window);
        window.*.restore_on_show = restore_on_show;
    }
    _ = SDL_DestroyWindowSurface_REAL(window);
    if ((window.*.flags & @as(c_ulong, 2)) != (flags & @as(c_ulong, 2))) {
        if ((flags & @as(c_ulong, 2)) != 0) {
            need_gl_load = @"true" != 0;
        } else {
            need_gl_unload = @"true" != 0;
        }
    } else if ((window.*.flags & @as(c_ulong, 2)) != 0) {
        need_gl_unload = @"true" != 0;
        need_gl_load = @"true" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 268435456)) != (flags & @as(c_ulong, 268435456))) {
        if ((flags & @as(c_ulong, 268435456)) != 0) {
            need_vulkan_load = @"true" != 0;
        } else {
            need_vulkan_unload = @"true" != 0;
        }
    } else if ((window.*.flags & @as(c_ulong, 268435456)) != 0) {
        need_vulkan_unload = @"true" != 0;
        need_vulkan_load = @"true" != 0;
    }
    if (need_gl_unload) {
        SDL_GL_UnloadLibrary_REAL();
    }
    if (need_vulkan_unload) {
        SDL_Vulkan_UnloadLibrary_REAL();
    }
    if ((_this.*.DestroyWindow != null) and !((flags & @as(c_ulong, 2048)) != 0)) {
        _this.*.DestroyWindow.?(_this, window);
    }
    if (need_gl_load) {
        if (!SDL_GL_LoadLibrary_REAL(null)) {
            return @"false" != 0;
        }
        loaded_opengl = @"true" != 0;
    }
    if (need_vulkan_load) {
        if (!SDL_Vulkan_LoadLibrary_REAL(null)) {
            return @"false" != 0;
        }
        loaded_vulkan = @"true" != 0;
    }
    window.*.flags = (flags & (((((((((((((@as(c_ulong, 2) | @as(c_ulong, 16)) | @as(c_ulong, 32)) | @as(c_ulong, 8192)) | @as(c_ulong, 65536)) | @as(c_ulong, 524288)) | @as(c_ulong, 131072)) | @as(c_ulong, 262144)) | @as(c_ulong, 268435456)) | @as(c_ulong, 64)) | @as(c_ulong, 536870912)) | @as(c_ulong, 1073741824)) | @as(c_ulong, 2147483648)) | @as(c_ulong, 2097152))) | @as(c_ulong, 8);
    window.*.is_destroying = @"false" != 0;
    if ((_this.*.CreateSDLWindow != null) and !((flags & @as(c_ulong, 2048)) != 0)) {
        window.*.x = blk: {
            const tmp = window.*.floating.x;
            window.*.windowed.x = tmp;
            break :blk tmp;
        };
        window.*.y = blk: {
            const tmp = window.*.floating.y;
            window.*.windowed.y = tmp;
            break :blk tmp;
        };
        window.*.w = blk: {
            const tmp = window.*.floating.w;
            window.*.windowed.w = tmp;
            break :blk tmp;
        };
        window.*.h = blk: {
            const tmp = window.*.floating.h;
            window.*.windowed.h = tmp;
            break :blk tmp;
        };
        if (!_this.*.CreateSDLWindow.?(_this, window, 0)) {
            if (loaded_opengl) {
                SDL_GL_UnloadLibrary_REAL();
                window.*.flags &= ~@as(c_ulong, 2);
            }
            if (loaded_vulkan) {
                SDL_Vulkan_UnloadLibrary_REAL();
                window.*.flags &= ~@as(c_ulong, 268435456);
            }
            return @"false" != 0;
        }
    }
    if ((flags & @as(c_ulong, 2048)) != 0) {
        window.*.flags |= 2048;
    }
    if ((_this.*.SetWindowTitle != null) and (window.*.title != null)) {
        _this.*.SetWindowTitle.?(_this, window);
    }
    if ((_this.*.SetWindowIcon != null) and (window.*.icon != null)) {
        _ = _this.*.SetWindowIcon.?(_this, window, window.*.icon);
    }
    if ((_this.*.SetWindowMinimumSize != null) and ((window.*.min_w != 0) or (window.*.min_h != 0))) {
        _this.*.SetWindowMinimumSize.?(_this, window);
    }
    if ((_this.*.SetWindowMaximumSize != null) and ((window.*.max_w != 0) or (window.*.max_h != 0))) {
        _this.*.SetWindowMaximumSize.?(_this, window);
    }
    if ((_this.*.SetWindowAspectRatio != null) and ((window.*.min_aspect > @as(f32, 0.0)) or (window.*.max_aspect > @as(f32, 0.0)))) {
        _this.*.SetWindowAspectRatio.?(_this, window);
    }
    if (window.*.hit_test != null) {
        _ = _this.*.SetWindowHitTest.?(window, @"true" != 0);
    }
    SDL_FinishWindowCreation(window, flags);
    return @"true" != 0;
}
pub export fn SDL_ReconfigureWindow(window: [*c]SDL_Window, flags: SDL_WindowFlags) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_ReconfigureWindowInternal(window, flags)) {
        return SDL_RecreateWindow(window, flags);
    }
    return @"true" != 0;
}
pub export fn SDL_HasWindows() bool {
    @setEvalBranchQuota(100000);
    return (_this != null) and (_this.*.windows != null);
}
pub export fn SDL_GetWindowID_REAL(window: [*c]SDL_Window) SDL_WindowID {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0;
    }
    return window.*.id;
}
pub export fn SDL_GetWindowFromID_REAL(id: SDL_WindowID) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (id != 0) {
        {
            window = _this.*.windows;
            while (window != null) : (window = window.*.next) {
                if (window.*.id == id) {
                    return window;
                }
            }
        }
    }
    _ = SDL_SetError_REAL("Invalid window ID");
    return null;
}
pub export fn SDL_GetWindowParent_REAL(window: [*c]SDL_Window) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    return window.*.parent;
}
pub export fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0;
    }
    if (window.*.props == @as(SDL_PropertiesID, 0)) {
        window.*.props = SDL_CreateProperties_REAL();
    }
    return window.*.props;
}
pub export fn SDL_GetWindowFlags_REAL(window: [*c]SDL_Window) SDL_WindowFlags {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return 0;
    }
    return window.*.flags | window.*.pending_flags;
}
pub export fn SDL_SetWindowTitle_REAL(window: [*c]SDL_Window, arg_title: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var title = arg_title;
    _ = &title;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (title == window.*.title) {
        return @"true" != 0;
    }
    if (!(title != null)) {
        title = "";
    }
    if ((window.*.title != null) and (SDL_strcmp_REAL(title, window.*.title) == @as(c_int, 0))) {
        return @"true" != 0;
    }
    SDL_free_REAL(@ptrCast(@alignCast(window.*.title)));
    window.*.title = SDL_strdup_REAL(title);
    if (_this.*.SetWindowTitle != null) {
        _this.*.SetWindowTitle.?(_this, window);
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowTitle_REAL(window: [*c]SDL_Window) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return "";
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return "";
    }
    return if (window.*.title != null) window.*.title else @as([*c]u8, @as([*c]u8, @constCast("")));
}
pub export fn SDL_SetWindowIcon_REAL(window: [*c]SDL_Window, icon: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(icon != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("icon"))));
    }
    SDL_DestroySurface_REAL(window.*.icon);
    window.*.icon = SDL_ConvertSurface_REAL(icon, SDL_PIXELFORMAT_ARGB8888);
    if (!(window.*.icon != null)) {
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowIcon != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return _this.*.SetWindowIcon.?(_this, window, window.*.icon);
}
pub export fn SDL_SetWindowPosition_REAL(window: [*c]SDL_Window, arg_x: c_int, arg_y: c_int) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var original_displayID: SDL_DisplayID = undefined;
    _ = &original_displayID;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    const w: c_int = if (window.*.last_size_pending) window.*.pending.w else window.*.windowed.w;
    _ = &w;
    const h: c_int = if (window.*.last_size_pending) window.*.pending.h else window.*.windowed.h;
    _ = &h;
    original_displayID = GetDisplayForWindow(window);
    window.*.pending_displayID = 0;
    if ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) {
        x = window.*.windowed.x;
    }
    if ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_UNDEFINED_MASK) {
        y = window.*.windowed.y;
    }
    if (((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) or ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK)) {
        var displayID: SDL_DisplayID = original_displayID;
        _ = &displayID;
        var bounds: SDL_Rect = undefined;
        _ = &bounds;
        if (((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) and ((x & @as(c_int, 65535)) != 0)) {
            displayID = @bitCast(@as(c_int, x & @as(c_int, 65535)));
        } else if (((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) and ((y & @as(c_int, 65535)) != 0)) {
            displayID = @bitCast(@as(c_int, y & @as(c_int, 65535)));
        }
        if ((displayID == @as(SDL_DisplayID, 0)) or (SDL_GetDisplayIndex(displayID) < @as(c_int, 0))) {
            displayID = SDL_GetPrimaryDisplay_REAL();
        }
        window.*.pending_displayID = displayID;
        _ = memset(@ptrCast(@alignCast(&bounds)), 0, @sizeOf(@TypeOf(bounds)));
        if ((!SDL_GetDisplayUsableBounds_REAL(displayID, &bounds) or (w > bounds.w)) or (h > bounds.h)) {
            if (!SDL_GetDisplayBounds_REAL(displayID, &bounds)) {
                return @"false" != 0;
            }
        }
        if ((@as(c_uint, @bitCast(@as(c_int, x))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) {
            x = bounds.x + @divTrunc(bounds.w - w, @as(c_int, 2));
        }
        if ((@as(c_uint, @bitCast(@as(c_int, y))) & @as(c_uint, 4294901760)) == SDL_WINDOWPOS_CENTERED_MASK) {
            y = bounds.y + @divTrunc(bounds.h - h, @as(c_int, 2));
        }
    } else {
        window.*.pending_displayID = GetDisplayAtOrigin(x, y);
    }
    window.*.pending.x = x;
    window.*.pending.y = y;
    if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!(_this.*.SyncWindow != null))))) != 0) and ((window.*.flags & @as(c_ulong, 1)) != 0)) {
        window.*.floating.x = blk: {
            const tmp = x;
            window.*.windowed.x = tmp;
            break :blk tmp;
        };
        window.*.floating.y = blk: {
            const tmp = y;
            window.*.windowed.y = tmp;
            break :blk tmp;
        };
    }
    window.*.undefined_x = @"false" != 0;
    window.*.undefined_y = @"false" != 0;
    window.*.last_position_pending = @"true" != 0;
    if (_this.*.SetWindowPosition != null) {
        const result: bool = _this.*.SetWindowPosition.?(_this, window);
        _ = &result;
        if (result) {
            SDL_SyncIfRequired(window);
        }
        return result;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_GetWindowPosition_REAL(window: [*c]SDL_Window, x: [*c]c_int, y: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    var use_display_origin: bool = (window.*.flags & @as(c_ulong, 1)) != @as(SDL_WindowFlags, 0);
    _ = &use_display_origin;
    if (use_display_origin) {
        var displayID: SDL_DisplayID = undefined;
        _ = &displayID;
        if (x != null) {
            x.* = 0;
        }
        if (y != null) {
            y.* = 0;
        }
        displayID = GetDisplayForWindow(window);
        if (displayID != @as(SDL_DisplayID, 0)) {
            var bounds: SDL_Rect = undefined;
            _ = &bounds;
            _ = memset(@ptrCast(@alignCast(&bounds)), 0, @sizeOf(@TypeOf(bounds)));
            _ = SDL_GetDisplayBounds_REAL(displayID, &bounds);
            if (x != null) {
                x.* = bounds.x;
            }
            if (y != null) {
                y.* = bounds.y;
            }
        }
    } else {
        const use_pending: bool = ((window.*.flags & @as(c_ulong, 8)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(window.*.last_position_pending))))) != 0);
        _ = &use_pending;
        if (x != null) {
            x.* = if (use_pending) window.*.pending.x else window.*.x;
        }
        if (y != null) {
            y.* = if (use_pending) window.*.pending.y else window.*.y;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowBordered_REAL(window: [*c]SDL_Window, bordered: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowBordered != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    const want: bool = bordered;
    _ = &want;
    const have: bool = !((window.*.flags & @as(c_ulong, 16)) != 0);
    _ = &have;
    if (@as(c_int, @intFromBool(want)) != @as(c_int, @intFromBool(have))) {
        if (want) {
            window.*.flags &= ~@as(c_ulong, 16);
        } else {
            window.*.flags |= 16;
        }
        _this.*.SetWindowBordered.?(_this, window, want);
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowResizable_REAL(window: [*c]SDL_Window, resizable: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowResizable != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    const want: bool = resizable;
    _ = &want;
    const have: bool = (window.*.flags & @as(c_ulong, 32)) != @as(SDL_WindowFlags, 0);
    _ = &have;
    if (@as(c_int, @intFromBool(want)) != @as(c_int, @intFromBool(have))) {
        if (want) {
            window.*.flags |= 32;
        } else {
            window.*.flags &= ~@as(c_ulong, 32);
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&window.*.windowed).*)) == @sizeOf(@TypeOf((&window.*.floating).*)))) @compileError("static assertion failed \"sizeof (*(&window->windowed)) == sizeof (*( &window->floating))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&window.*.windowed)), @ptrCast(@alignCast(&window.*.floating)), @sizeOf(@TypeOf((&window.*.floating).*)));
        }
        _this.*.SetWindowResizable.?(_this, window, want);
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowAlwaysOnTop_REAL(window: [*c]SDL_Window, on_top: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowAlwaysOnTop != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    const want: bool = on_top;
    _ = &want;
    const have: bool = (window.*.flags & @as(c_ulong, 65536)) != @as(SDL_WindowFlags, 0);
    _ = &have;
    if (@as(c_int, @intFromBool(want)) != @as(c_int, @intFromBool(have))) {
        if (want) {
            window.*.flags |= 65536;
        } else {
            window.*.flags &= ~@as(c_ulong, 65536);
        }
        _this.*.SetWindowAlwaysOnTop.?(_this, window, want);
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowSize_REAL(window: [*c]SDL_Window, arg_w: c_int, arg_h: c_int) bool {
    @setEvalBranchQuota(100000);
    var w = arg_w;
    _ = &w;
    var h = arg_h;
    _ = &h;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (w <= @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("w"))));
    }
    if (h <= @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("h"))));
    }
    var new_aspect: f32 = @as(f32, @floatFromInt(w)) / @as(f32, @floatFromInt(h));
    _ = &new_aspect;
    if ((window.*.max_aspect > @as(f32, 0.0)) and (new_aspect > window.*.max_aspect)) {
        w = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(h)) * window.*.max_aspect));
    } else if ((window.*.min_aspect > @as(f32, 0.0)) and (new_aspect < window.*.min_aspect)) {
        h = @intFromFloat(SDL_roundf_REAL(@as(f32, @floatFromInt(w)) / window.*.min_aspect));
    }
    if ((window.*.min_w != 0) and (w < window.*.min_w)) {
        w = window.*.min_w;
    }
    if ((window.*.max_w != 0) and (w > window.*.max_w)) {
        w = window.*.max_w;
    }
    if ((window.*.min_h != 0) and (h < window.*.min_h)) {
        h = window.*.min_h;
    }
    if ((window.*.max_h != 0) and (h > window.*.max_h)) {
        h = window.*.max_h;
    }
    window.*.last_size_pending = @"true" != 0;
    window.*.pending.w = w;
    window.*.pending.h = h;
    if (_this.*.SetWindowSize != null) {
        _this.*.SetWindowSize.?(_this, window);
        SDL_SyncIfRequired(window);
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowSize_REAL(window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (w != null) {
        w.* = window.*.w;
    }
    if (h != null) {
        h.* = window.*.h;
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowAspectRatio_REAL(window: [*c]SDL_Window, min_aspect: f32, max_aspect: f32) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    window.*.min_aspect = min_aspect;
    window.*.max_aspect = max_aspect;
    if (_this.*.SetWindowAspectRatio != null) {
        _this.*.SetWindowAspectRatio.?(_this, window);
    }
    var w: c_int = if (window.*.last_size_pending) window.*.pending.w else window.*.floating.w;
    _ = &w;
    var h: c_int = if (window.*.last_size_pending) window.*.pending.h else window.*.floating.h;
    _ = &h;
    return SDL_SetWindowSize_REAL(window, w, h);
}
pub export fn SDL_GetWindowAspectRatio_REAL(window: [*c]SDL_Window, min_aspect: [*c]f32, max_aspect: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (min_aspect != null) {
        min_aspect.* = window.*.min_aspect;
    }
    if (max_aspect != null) {
        max_aspect.* = window.*.max_aspect;
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowBordersSize_REAL(window: [*c]SDL_Window, arg_top: [*c]c_int, arg_left: [*c]c_int, arg_bottom: [*c]c_int, arg_right: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var top = arg_top;
    _ = &top;
    var left = arg_left;
    _ = &left;
    var bottom = arg_bottom;
    _ = &bottom;
    var right = arg_right;
    _ = &right;
    var dummy: c_int = 0;
    _ = &dummy;
    if (!(top != null)) {
        top = &dummy;
    }
    if (!(left != null)) {
        left = &dummy;
    }
    if (!(right != null)) {
        right = &dummy;
    }
    if (!(bottom != null)) {
        bottom = &dummy;
    }
    top.* = blk: {
        const tmp = blk_1: {
            const tmp_2 = blk_2: {
                const tmp_3 = @as(c_int, 0);
                right.* = tmp_3;
                break :blk_2 tmp_3;
            };
            bottom.* = tmp_2;
            break :blk_1 tmp_2;
        };
        left.* = tmp;
        break :blk tmp;
    };
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.GetWindowBordersSize != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return _this.*.GetWindowBordersSize.?(_this, window, top, left, bottom, right);
}
pub export fn SDL_GetWindowSizeInPixels_REAL(window: [*c]SDL_Window, arg_w: [*c]c_int, arg_h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var w = arg_w;
    _ = &w;
    var h = arg_h;
    _ = &h;
    var filter: c_int = undefined;
    _ = &filter;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(w != null)) {
        w = &filter;
    }
    if (!(h != null)) {
        h = &filter;
    }
    if (_this.*.GetWindowSizeInPixels != null) {
        _this.*.GetWindowSizeInPixels.?(_this, window, w, h);
    } else {
        var displayID: SDL_DisplayID = GetDisplayForWindow(window);
        _ = &displayID;
        var mode: [*c]const SDL_DisplayMode = undefined;
        _ = &mode;
        _ = SDL_GetWindowSize_REAL(window, w, h);
        if (((window.*.flags & @as(c_ulong, 1)) != 0) and (SDL_GetWindowFullscreenMode_REAL(window) != null)) {
            mode = SDL_GetCurrentDisplayMode_REAL(displayID);
        } else {
            mode = SDL_GetDesktopDisplayMode_REAL(displayID);
        }
        if (mode != null) {
            w.* = @intFromFloat(SDL_ceilf_REAL(@as(f32, @floatFromInt(w.*)) * mode.*.pixel_density));
            h.* = @intFromFloat(SDL_ceilf_REAL(@as(f32, @floatFromInt(h.*)) * mode.*.pixel_density));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowMinimumSize_REAL(window: [*c]SDL_Window, min_w: c_int, min_h: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (min_w < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("min_w"))));
    }
    if (min_h < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("min_h"))));
    }
    if (((window.*.max_w != 0) and (min_w > window.*.max_w)) or ((window.*.max_h != 0) and (min_h > window.*.max_h))) {
        return SDL_SetError_REAL("SDL_SetWindowMinimumSize(): Tried to set minimum size larger than maximum size");
    }
    window.*.min_w = min_w;
    window.*.min_h = min_h;
    if (_this.*.SetWindowMinimumSize != null) {
        _this.*.SetWindowMinimumSize.?(_this, window);
    }
    var w: c_int = if (window.*.last_size_pending) window.*.pending.w else window.*.floating.w;
    _ = &w;
    var h: c_int = if (window.*.last_size_pending) window.*.pending.h else window.*.floating.h;
    _ = &h;
    return SDL_SetWindowSize_REAL(window, w, h);
}
pub export fn SDL_GetWindowMinimumSize_REAL(window: [*c]SDL_Window, min_w: [*c]c_int, min_h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (min_w != null) {
        min_w.* = window.*.min_w;
    }
    if (min_h != null) {
        min_h.* = window.*.min_h;
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowMaximumSize_REAL(window: [*c]SDL_Window, max_w: c_int, max_h: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (max_w < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("max_w"))));
    }
    if (max_h < @as(c_int, 0)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("max_h"))));
    }
    if (((max_w != 0) and (max_w < window.*.min_w)) or ((max_h != 0) and (max_h < window.*.min_h))) {
        return SDL_SetError_REAL("SDL_SetWindowMaximumSize(): Tried to set maximum size smaller than minimum size");
    }
    window.*.max_w = max_w;
    window.*.max_h = max_h;
    if (_this.*.SetWindowMaximumSize != null) {
        _this.*.SetWindowMaximumSize.?(_this, window);
    }
    var w: c_int = if (window.*.last_size_pending) window.*.pending.w else window.*.floating.w;
    _ = &w;
    var h: c_int = if (window.*.last_size_pending) window.*.pending.h else window.*.floating.h;
    _ = &h;
    return SDL_SetWindowSize_REAL(window, w, h);
}
pub export fn SDL_GetWindowMaximumSize_REAL(window: [*c]SDL_Window, max_w: [*c]c_int, max_h: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (max_w != null) {
        max_w.* = window.*.max_w;
    }
    if (max_h != null) {
        max_h.* = window.*.max_h;
    }
    return @"true" != 0;
}
pub export fn SDL_ShowWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var child: [*c]SDL_Window = undefined;
    _ = &child;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!((window.*.flags & @as(c_ulong, 8)) != 0)) {
        return @"true" != 0;
    }
    if ((window.*.parent != null) and ((window.*.parent.*.flags & @as(c_ulong, 8)) != 0)) {
        window.*.restore_on_show = @"true" != 0;
        return @"true" != 0;
    }
    if (_this.*.ShowWindow != null) {
        _this.*.ShowWindow.?(_this, window);
    } else {
        SDL_SetMouseFocus(window);
        _ = SDL_SetKeyboardFocus(window);
    }
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_SHOWN, 0, 0);
    {
        child = window.*.first_child;
        while (child != null) : (child = child.*.next_sibling) {
            if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!child.*.restore_on_show)))) != 0) and ((child.*.flags & @as(c_ulong, 8)) != 0)) {
                break;
            }
            _ = SDL_ShowWindow_REAL(child);
            child.*.restore_on_show = @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_HideWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var child: [*c]SDL_Window = undefined;
    _ = &child;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        window.*.restore_on_show = @"false" != 0;
        return @"true" != 0;
    }
    {
        child = window.*.first_child;
        while (child != null) : (child = child.*.next_sibling) {
            if ((child.*.flags & @as(c_ulong, 8)) != 0) {
                break;
            }
            _ = SDL_HideWindow_REAL(child);
            child.*.restore_on_show = @"true" != 0;
        }
    }
    const pending_mask: SDL_WindowFlags = (((@as(c_ulong, 128) | @as(c_ulong, 64)) | @as(c_ulong, 1)) | @as(c_ulong, 1048576)) | @as(c_ulong, 256);
    _ = &pending_mask;
    window.*.pending_flags = window.*.flags & pending_mask;
    window.*.is_hiding = @"true" != 0;
    if (_this.*.HideWindow != null) {
        _this.*.HideWindow.?(_this, window);
    } else {
        SDL_SetMouseFocus(null);
        _ = SDL_SetKeyboardFocus(null);
    }
    window.*.is_hiding = @"false" != 0;
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_HIDDEN, 0, 0);
    return @"true" != 0;
}
pub export fn SDL_RaiseWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        return @"true" != 0;
    }
    if (_this.*.RaiseWindow != null) {
        _this.*.RaiseWindow.?(_this, window);
    }
    return @"true" != 0;
}
pub export fn SDL_MaximizeWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.MaximizeWindow != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!((window.*.flags & @as(c_ulong, 32)) != 0)) {
        return SDL_SetError_REAL("A window without the 'SDL_WINDOW_RESIZABLE' flag can't be maximized");
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        window.*.pending_flags |= 128;
        return @"true" != 0;
    }
    _this.*.MaximizeWindow.?(_this, window);
    SDL_SyncIfRequired(window);
    return @"true" != 0;
}
pub export fn SDL_MinimizeWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.MinimizeWindow != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        window.*.pending_flags |= 64;
        return @"true" != 0;
    }
    _this.*.MinimizeWindow.?(_this, window);
    SDL_SyncIfRequired(window);
    return @"true" != 0;
}
pub export fn SDL_RestoreWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.RestoreWindow != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        window.*.pending_flags &= ~(@as(c_ulong, 128) | @as(c_ulong, 64));
        return @"true" != 0;
    }
    _this.*.RestoreWindow.?(_this, window);
    SDL_SyncIfRequired(window);
    return @"true" != 0;
}
pub export fn SDL_SetWindowFullscreen_REAL(window: [*c]SDL_Window, fullscreen: bool) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        if (fullscreen) {
            window.*.pending_flags |= 1;
        } else {
            window.*.pending_flags &= ~@as(c_ulong, 1);
        }
        return @"true" != 0;
    }
    if (fullscreen) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&window.*.current_fullscreen_mode).*)) == @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)))) @compileError("static assertion failed \"sizeof (*(&window->current_fullscreen_mode)) == sizeof (*( &window->requested_fullscreen_mode))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), @ptrCast(@alignCast(&window.*.requested_fullscreen_mode)), @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)));
    }
    result = SDL_UpdateFullscreenMode(window, @bitCast(if (fullscreen) SDL_FULLSCREEN_OP_ENTER else SDL_FULLSCREEN_OP_LEAVE), @"true" != 0);
    if (!fullscreen or !result) {
        _ = memset(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), 0, @sizeOf(@TypeOf(window.*.current_fullscreen_mode)));
    }
    if (result) {
        SDL_SyncIfRequired(window);
    }
    return result;
}
pub export fn SDL_SyncWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (_this.*.SyncWindow != null) {
        return _this.*.SyncWindow.?(_this, window);
    } else {
        return @"true" != 0;
    }
}
pub fn ShouldAttemptTextureFramebuffer() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var attempt_texture_framebuffer: bool = undefined;
    _ = &attempt_texture_framebuffer;
    if (!(_this.*.CreateWindowFramebuffer != null)) {
        return @"true" != 0;
    }
    hint = SDL_GetHint_REAL("SDL_FRAMEBUFFER_ACCELERATION");
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        if (((@as(c_int, hint.*) == @as(c_int, '0')) or (SDL_strcasecmp_REAL(hint, "false") == @as(c_int, 0))) or (SDL_strcasecmp_REAL(hint, "software") == @as(c_int, 0))) {
            attempt_texture_framebuffer = @"false" != 0;
        } else {
            attempt_texture_framebuffer = @"true" != 0;
        }
    } else {
        if (SDL_DriverHasSlowFramebuffer(_this)) {
            attempt_texture_framebuffer = @"true" != 0;
        } else {
            attempt_texture_framebuffer = @"false" != 0;
        }
    }
    return attempt_texture_framebuffer;
}
pub fn SDL_CreateWindowFramebuffer(window: [*c]SDL_Window) callconv(.c) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    var format: SDL_PixelFormat = SDL_PIXELFORMAT_UNKNOWN;
    _ = &format;
    var pixels: ?*anyopaque = null;
    _ = &pixels;
    var pitch: c_int = 0;
    _ = &pitch;
    var created_framebuffer: bool = @"false" != 0;
    _ = &created_framebuffer;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    _ = SDL_GetWindowSizeInPixels_REAL(window, &w, &h);
    if (!_this.*.checked_texture_framebuffer) {
        if (ShouldAttemptTextureFramebuffer()) {
            if (!SDL_CreateWindowTexture(_this, window, &format, &pixels, &pitch)) {} else {
                _this.*.CreateWindowFramebuffer = SDL_CreateWindowTexture;
                _this.*.SetWindowFramebufferVSync = SDL_SetWindowTextureVSync;
                _this.*.GetWindowFramebufferVSync = SDL_GetWindowTextureVSync;
                _this.*.UpdateWindowFramebuffer = SDL_UpdateWindowTexture;
                _this.*.DestroyWindowFramebuffer = SDL_DestroyWindowTexture;
                created_framebuffer = @"true" != 0;
            }
        }
        _this.*.checked_texture_framebuffer = @"true" != 0;
    }
    if (!created_framebuffer) {
        if (!(_this.*.CreateWindowFramebuffer != null) or !(_this.*.UpdateWindowFramebuffer != null)) {
            _ = SDL_SetError_REAL("Window framebuffer support not available");
            return null;
        }
        if (!_this.*.CreateWindowFramebuffer.?(_this, window, &format, &pixels, &pitch)) {
            return null;
        }
    }
    if (window.*.surface != null) {
        return window.*.surface;
    }
    return SDL_CreateSurfaceFrom_REAL(w, h, format, pixels, pitch);
}
pub export fn SDL_WindowHasSurface_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    return (if (window.*.surface != null) @"true" else @"false") != 0;
}
pub export fn SDL_GetWindowSurface_REAL(window: [*c]SDL_Window) [*c]SDL_Surface {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if (!window.*.surface_valid) {
        if (window.*.surface != null) {
            window.*.surface.*.internal_flags &= ~SDL_INTERNAL_SURFACE_DONTFREE;
            SDL_DestroySurface_REAL(window.*.surface);
            window.*.surface = null;
        }
        window.*.surface = SDL_CreateWindowFramebuffer(window);
        if (window.*.surface != null) {
            window.*.surface_valid = @"true" != 0;
            window.*.surface.*.internal_flags |= SDL_INTERNAL_SURFACE_DONTFREE;
        }
    }
    return window.*.surface;
}
pub export fn SDL_SetWindowSurfaceVSync_REAL(window: [*c]SDL_Window, vsync: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowFramebufferVSync != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return _this.*.SetWindowFramebufferVSync.?(_this, window, vsync);
}
pub export fn SDL_GetWindowSurfaceVSync_REAL(window: [*c]SDL_Window, vsync: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.GetWindowFramebufferVSync != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    return _this.*.GetWindowFramebufferVSync.?(_this, window, vsync);
}
pub export fn SDL_UpdateWindowSurface_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var full_rect: SDL_Rect = undefined;
    _ = &full_rect;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    full_rect.x = 0;
    full_rect.y = 0;
    _ = SDL_GetWindowSizeInPixels_REAL(window, &full_rect.w, &full_rect.h);
    return SDL_UpdateWindowSurfaceRects_REAL(window, &full_rect, 1);
}
pub export fn SDL_UpdateWindowSurfaceRects_REAL(window: [*c]SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [33:0]u8 = "SDL_UpdateWindowSurfaceRects_REAL".*;
    };
    _ = &static_local___func__;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!window.*.surface_valid) {
        return SDL_SetError_REAL("Window surface is invalid, please call SDL_GetWindowSurface() to get a new surface");
    }
    while (true) {
        while (!_this.*.checked_texture_framebuffer) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "_this->checked_texture_framebuffer",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_video.c", 3798);
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
    return _this.*.UpdateWindowFramebuffer.?(_this, window, rects, numrects);
}
pub export fn SDL_DestroyWindowSurface_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (window.*.surface != null) {
        window.*.surface.*.internal_flags &= ~SDL_INTERNAL_SURFACE_DONTFREE;
        SDL_DestroySurface_REAL(window.*.surface);
        window.*.surface = null;
        window.*.surface_valid = @"false" != 0;
    }
    if (_this.*.checked_texture_framebuffer) {
        if (_this.*.DestroyWindowFramebuffer != null) {
            _this.*.DestroyWindowFramebuffer.?(_this, window);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowOpacity_REAL(window: [*c]SDL_Window, arg_opacity: f32) bool {
    @setEvalBranchQuota(100000);
    var opacity = arg_opacity;
    _ = &opacity;
    var result: bool = undefined;
    _ = &result;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowOpacity != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (opacity < @as(f32, 0.0)) {
        opacity = 0.0;
    } else if (opacity > @as(f32, 1.0)) {
        opacity = 1.0;
    }
    result = _this.*.SetWindowOpacity.?(_this, window, opacity);
    if (result) {
        window.*.opacity = opacity;
    }
    return result;
}
pub export fn SDL_GetWindowOpacity_REAL(window: [*c]SDL_Window) f32 {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return -@as(f32, 1.0);
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return -@as(f32, 1.0);
    }
    return window.*.opacity;
}
pub export fn SDL_SetWindowParent_REAL(window: [*c]SDL_Window, parent: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (parent != null) {
        if (!(_this != null)) {
            _ = SDL_UninitializedVideo();
            return @"false" != 0;
        }
        if (!SDL_ObjectValid(@ptrCast(@alignCast(parent)), SDL_OBJECT_TYPE_WINDOW)) {
            _ = SDL_SetError_REAL("Invalid window");
            return @"false" != 0;
        }
        if ((parent.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
            _ = SDL_SetError_REAL("Operation invalid on popup windows");
            return @"false" != 0;
        }
    }
    if (window == parent) {
        return SDL_SetError_REAL("Cannot set the parent of a window to itself.");
    }
    if (!(_this.*.SetWindowParent != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if ((window.*.flags & @as(c_ulong, 4096)) != 0) {
        return SDL_SetError_REAL("Modal windows cannot change parents; call SDL_SetWindowModal() to clear modal status first.");
    }
    if (window.*.parent == parent) {
        return @"true" != 0;
    }
    const ret: bool = _this.*.SetWindowParent.?(_this, window, parent);
    _ = &ret;
    SDL_UpdateWindowHierarchy(window, @ptrCast(@alignCast(if (ret) @as(?*anyopaque, @ptrCast(@alignCast(parent))) else @as(?*anyopaque, null))));
    return ret;
}
pub export fn SDL_SetWindowModal_REAL(window: [*c]SDL_Window, modal: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowModal != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (modal) {
        if (!(window.*.parent != null)) {
            return SDL_SetError_REAL("Window must have a parent to enable the modal state; use SDL_SetWindowParent() to set the parent first.");
        }
        window.*.flags |= 4096;
    } else if ((window.*.flags & @as(c_ulong, 4096)) != 0) {
        window.*.flags &= ~@as(c_ulong, 4096);
    } else {
        return @"true" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        return @"true" != 0;
    }
    return _this.*.SetWindowModal.?(_this, window, modal);
}
pub export fn SDL_ShouldRelinquishPopupFocus(window: [*c]SDL_Window, new_focus: [*c][*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var focus: [*c]SDL_Window = window.*.parent;
    _ = &focus;
    var set_focus: bool = !!((window.*.flags & @as(c_ulong, 512)) != 0);
    _ = &set_focus;
    while (((focus.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) and ((((focus.*.flags & @as(c_ulong, 2147483648)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(focus.*.is_hiding))))) != 0)) or focus.*.is_destroying)) {
        focus = focus.*.parent;
        if (!set_focus) {
            set_focus = !!((focus.*.flags & @as(c_ulong, 512)) != 0);
        }
    }
    new_focus.* = focus;
    return set_focus;
}
pub export fn SDL_ShouldFocusPopup(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var toplevel_parent: [*c]SDL_Window = undefined;
    _ = &toplevel_parent;
    {
        toplevel_parent = window.*.parent;
        while ((toplevel_parent.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) : (toplevel_parent = toplevel_parent.*.parent) {}
    }
    var current_focus: [*c]SDL_Window = toplevel_parent.*.keyboard_focus;
    _ = &current_focus;
    var found_higher_focus: bool = @"false" != 0;
    _ = &found_higher_focus;
    var w: [*c]SDL_Window = undefined;
    _ = &w;
    {
        w = current_focus;
        while (w != toplevel_parent) : (w = w.*.parent) {
            if (w == window) {
                found_higher_focus = @"true" != 0;
                break;
            }
        }
    }
    return !found_higher_focus or (w == toplevel_parent);
}
pub export fn SDL_SetWindowFocusable_REAL(window: [*c]SDL_Window, focusable: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    const want: bool = @as(c_int, @intFromBool(focusable)) != @"false";
    _ = &want;
    const have: bool = !((window.*.flags & @as(c_ulong, 2147483648)) != 0);
    _ = &have;
    if ((@as(c_int, @intFromBool(want)) != @as(c_int, @intFromBool(have))) and (_this.*.SetWindowFocusable != null)) {
        if (want) {
            window.*.flags &= ~@as(c_ulong, 2147483648);
        } else {
            window.*.flags |= 2147483648;
        }
        if (!_this.*.SetWindowFocusable.?(_this, window, want)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowFillDocument_REAL(window: [*c]SDL_Window, fill: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    const want: bool = @as(c_int, @intFromBool(fill)) != @"false";
    _ = &want;
    const have: bool = (window.*.flags & @as(c_ulong, 2097152)) != @as(SDL_WindowFlags, 0);
    _ = &have;
    if ((@as(c_int, @intFromBool(want)) != @as(c_int, @intFromBool(have))) and (_this.*.SetWindowFillDocument != null)) {
        if (!_this.*.SetWindowFillDocument.?(_this, window, want)) {
            return @"false" != 0;
        } else if (want) {
            window.*.flags |= 2097152;
        } else {
            window.*.flags &= ~@as(c_ulong, 2097152);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_UpdateWindowGrab(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var keyboard_grabbed: bool = undefined;
    _ = &keyboard_grabbed;
    var mouse_grabbed: bool = undefined;
    _ = &mouse_grabbed;
    if ((window.*.flags & @as(c_ulong, 512)) != 0) {
        if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(SDL_GetMouse().*.relative_mode))))) != 0) or ((window.*.flags & @as(c_ulong, 256)) != 0)) {
            mouse_grabbed = @"true" != 0;
        } else {
            mouse_grabbed = @"false" != 0;
        }
        if ((window.*.flags & @as(c_ulong, 1048576)) != 0) {
            keyboard_grabbed = @"true" != 0;
        } else {
            keyboard_grabbed = @"false" != 0;
        }
    } else {
        mouse_grabbed = @"false" != 0;
        keyboard_grabbed = @"false" != 0;
    }
    if (mouse_grabbed or keyboard_grabbed) {
        if ((_this.*.grabbed_window != null) and (_this.*.grabbed_window != window)) {
            _this.*.grabbed_window.*.flags &= ~(@as(c_ulong, 256) | @as(c_ulong, 1048576));
            if (_this.*.SetWindowMouseGrab != null) {
                _ = _this.*.SetWindowMouseGrab.?(_this, _this.*.grabbed_window, @"false" != 0);
            }
            if (_this.*.SetWindowKeyboardGrab != null) {
                _ = _this.*.SetWindowKeyboardGrab.?(_this, _this.*.grabbed_window, @"false" != 0);
            }
        }
        _this.*.grabbed_window = window;
    } else if (_this.*.grabbed_window == window) {
        _this.*.grabbed_window = null;
    }
    if (_this.*.SetWindowMouseGrab != null) {
        if (!_this.*.SetWindowMouseGrab.?(_this, window, mouse_grabbed)) {
            window.*.flags &= ~@as(c_ulong, 256);
        }
    }
    if (_this.*.SetWindowKeyboardGrab != null) {
        if (!_this.*.SetWindowKeyboardGrab.?(_this, window, keyboard_grabbed)) {
            window.*.flags &= ~@as(c_ulong, 1048576);
        }
    }
    if ((_this.*.grabbed_window != null) and !((_this.*.grabbed_window.*.flags & (@as(c_ulong, 256) | @as(c_ulong, 1048576))) != 0)) {
        _this.*.grabbed_window = null;
    }
}
pub export fn SDL_SetWindowKeyboardGrab_REAL(window: [*c]SDL_Window, grabbed: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        if (grabbed) {
            window.*.pending_flags |= 1048576;
        } else {
            window.*.pending_flags &= ~@as(c_ulong, 1048576);
        }
        return @"true" != 0;
    }
    if (@intFromBool(!!grabbed) == @intFromBool(!!((window.*.flags & @as(c_ulong, 1048576)) != 0))) {
        return @"true" != 0;
    }
    if (grabbed) {
        window.*.flags |= 1048576;
    } else {
        window.*.flags &= ~@as(c_ulong, 1048576);
    }
    SDL_UpdateWindowGrab(window);
    if (grabbed and !((window.*.flags & @as(c_ulong, 1048576)) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_SetWindowMouseGrab_REAL(window: [*c]SDL_Window, grabbed: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 8)) != 0) {
        if (grabbed) {
            window.*.pending_flags |= 256;
        } else {
            window.*.pending_flags &= ~@as(c_ulong, 256);
        }
        return @"true" != 0;
    }
    if (@intFromBool(!!grabbed) == @intFromBool(!!((window.*.flags & @as(c_ulong, 256)) != 0))) {
        return @"true" != 0;
    }
    if (grabbed) {
        window.*.flags |= 256;
    } else {
        window.*.flags &= ~@as(c_ulong, 256);
    }
    SDL_UpdateWindowGrab(window);
    if (grabbed and !((window.*.flags & @as(c_ulong, 256)) != 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowKeyboardGrab_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    return (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(window == _this.*.grabbed_window)))) != 0) and ((_this.*.grabbed_window.*.flags & @as(c_ulong, 1048576)) != 0);
}
pub export fn SDL_GetWindowMouseGrab_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    return (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(window == _this.*.grabbed_window)))) != 0) and ((_this.*.grabbed_window.*.flags & @as(c_ulong, 256)) != 0);
}
pub export fn SDL_GetGrabbedWindow_REAL() [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    if (((_this != null) and (_this.*.grabbed_window != null)) and ((_this.*.grabbed_window.*.flags & (@as(c_ulong, 256) | @as(c_ulong, 1048576))) != @as(SDL_WindowFlags, 0))) {
        return _this.*.grabbed_window;
    } else {
        return null;
    }
}
pub export fn SDL_SetWindowMouseRect_REAL(window: [*c]SDL_Window, arg_rect: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var rect = arg_rect;
    _ = &rect;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowMouseRect != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    var zero: SDL_Rect = SDL_Rect{
        .x = 0,
        .y = 0,
        .w = 0,
        .h = 0,
    };
    _ = &zero;
    if (!(rect != null)) {
        rect = &zero;
    }
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(&window.*.mouse_rect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*))) == @as(c_int, 0)) {
        return @"true" != 0;
    }
    _ = memcpy(@ptrCast(@alignCast(&window.*.mouse_rect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
    return _this.*.SetWindowMouseRect.?(_this, window);
}
pub export fn SDL_GetWindowMouseRect_REAL(window: [*c]SDL_Window) [*c]const SDL_Rect {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if (SDL_RectEmpty(&window.*.mouse_rect)) {
        return null;
    } else {
        return &window.*.mouse_rect;
    }
}
pub export fn SDL_SetWindowRelativeMouseMode_REAL(window: [*c]SDL_Window, enabled: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    SDL_DisableMouseWarpEmulation();
    if (@as(c_int, @intFromBool(enabled)) == @as(c_int, @intFromBool(SDL_GetWindowRelativeMouseMode_REAL(window)))) {
        return @"true" != 0;
    }
    if (enabled) {
        window.*.flags |= 32768;
    } else {
        window.*.flags &= ~@as(c_ulong, 32768);
    }
    if (!SDL_UpdateRelativeMouseMode()) {
        if (enabled) {
            window.*.flags &= ~@as(c_ulong, 32768);
        } else {
            window.*.flags |= 32768;
        }
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowRelativeMouseMode_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & @as(c_ulong, 32768)) != 0) {
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub export fn SDL_FlashWindow_REAL(window: [*c]SDL_Window, operation: SDL_FlashOperation) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (_this.*.FlashWindow != null) {
        return _this.*.FlashWindow.?(_this, window, operation);
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SetWindowProgressState_REAL(window: [*c]SDL_Window, state: SDL_ProgressState) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if ((state < SDL_PROGRESS_STATE_NONE) or (state > SDL_PROGRESS_STATE_ERROR)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("state"))));
    }
    window.*.progress_state = state;
    if (_this.*.ApplyWindowProgress != null) {
        if (!_this.*.ApplyWindowProgress.?(_this, window)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowProgressState_REAL(window: [*c]SDL_Window) SDL_ProgressState {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return SDL_PROGRESS_STATE_INVALID;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return SDL_PROGRESS_STATE_INVALID;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return SDL_PROGRESS_STATE_INVALID;
    }
    return window.*.progress_state;
}
pub export fn SDL_SetWindowProgressValue_REAL(window: [*c]SDL_Window, arg_value: f32) bool {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    value = if (value < @as(f32, 0.0)) @as(f32, 0.0) else if (value > @as(f32, 1.0)) @as(f32, 1.0) else value;
    window.*.progress_value = value;
    if (_this.*.ApplyWindowProgress != null) {
        if (!_this.*.ApplyWindowProgress.?(_this, window)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetWindowProgressValue_REAL(window: [*c]SDL_Window) f32 {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return -@as(f32, 1.0);
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return -@as(f32, 1.0);
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return -@as(f32, 1.0);
    }
    return window.*.progress_value;
}
pub export fn SDL_OnWindowShown(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    ApplyWindowFlags(window, window.*.pending_flags);
    window.*.pending_flags = 0;
}
pub export fn SDL_OnWindowHidden(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    window.*.pending_flags |= window.*.flags & (@as(c_ulong, 1) | @as(c_ulong, 128));
    _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_LEAVE, @"false" != 0);
}
pub export fn SDL_OnWindowDisplayChanged(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(window.*.update_fullscreen_on_display_changed))))) != 0) and ((window.*.flags & @as(c_ulong, 1)) != 0)) {
        const auto_mode_switch: bool = SDL_GetHintBoolean_REAL("SDL_VIDEO_MATCH_EXCLUSIVE_MODE_ON_MOVE", @"true" != 0);
        _ = &auto_mode_switch;
        if (auto_mode_switch and ((window.*.requested_fullscreen_mode.w != @as(c_int, 0)) or (window.*.requested_fullscreen_mode.h != @as(c_int, 0)))) {
            var displayID: SDL_DisplayID = SDL_GetDisplayForWindowPosition(window);
            _ = &displayID;
            var include_high_density_modes: bool = @"false" != 0;
            _ = &include_high_density_modes;
            if (window.*.requested_fullscreen_mode.pixel_density > @as(f32, 1.0)) {
                include_high_density_modes = @"true" != 0;
            }
            const found_match: bool = SDL_GetClosestFullscreenDisplayMode_REAL(displayID, window.*.requested_fullscreen_mode.w, window.*.requested_fullscreen_mode.h, window.*.requested_fullscreen_mode.refresh_rate, include_high_density_modes, &window.*.current_fullscreen_mode);
            _ = &found_match;
            if ((!found_match or (window.*.requested_fullscreen_mode.w != window.*.current_fullscreen_mode.w)) or (window.*.requested_fullscreen_mode.h != window.*.current_fullscreen_mode.h)) {
                _ = memset(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), 0, @sizeOf(@TypeOf(window.*.current_fullscreen_mode)));
            }
        } else {
            _ = memset(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), 0, @sizeOf(@TypeOf(window.*.current_fullscreen_mode)));
        }
        if ((((window.*.flags & @as(c_ulong, 1)) != @as(SDL_WindowFlags, 0)) and ((window.*.flags & @as(c_ulong, 8)) == @as(SDL_WindowFlags, 0))) and ((window.*.flags & @as(c_ulong, 64)) == @as(SDL_WindowFlags, 0))) {
            _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_UPDATE, @"true" != 0);
        }
    }
    SDL_CheckWindowPixelSizeChanged(window);
}
pub export fn SDL_OnWindowMoved(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    SDL_CheckWindowDisplayChanged(window);
}
pub export fn SDL_OnWindowResized(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    SDL_CheckWindowDisplayChanged(window);
    SDL_CheckWindowPixelSizeChanged(window);
    SDL_CheckWindowSafeAreaChanged(window);
    if (((window.*.flags & @as(c_ulong, 1073741824)) != 0) and (_this.*.UpdateWindowShape != null)) {
        var surface: [*c]SDL_Surface = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(window.*.props, "SDL.window.shape", null)));
        _ = &surface;
        if (surface != null) {
            _ = _this.*.UpdateWindowShape.?(_this, window, surface);
        }
    }
}
pub export fn SDL_CheckWindowPixelSizeChanged(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var pixel_w: c_int = 0;
    _ = &pixel_w;
    var pixel_h: c_int = 0;
    _ = &pixel_h;
    _ = SDL_GetWindowSizeInPixels_REAL(window, &pixel_w, &pixel_h);
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED, pixel_w, pixel_h);
    SDL_CheckWindowDisplayScaleChanged(window);
}
pub export fn SDL_OnWindowPixelSizeChanged(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    window.*.surface_valid = @"false" != 0;
}
pub export fn SDL_OnWindowLiveResizeUpdate(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (SDL_HasMainCallbacks()) {
        _ = SDL_IterateMainCallbacks(@"false" != 0);
    } else {
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_EXPOSED, 1, 0);
    }
    SDL_PumpEventMaintenance();
}
pub fn SDL_CheckWindowSafeAreaChanged(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var rect: SDL_Rect = undefined;
    _ = &rect;
    rect.x = window.*.safe_inset_left;
    rect.y = window.*.safe_inset_top;
    rect.w = window.*.w - (window.*.safe_inset_right + window.*.safe_inset_left);
    rect.h = window.*.h - (window.*.safe_inset_top + window.*.safe_inset_bottom);
    if (SDL_memcmp_REAL(@ptrCast(@alignCast(&rect)), @ptrCast(@alignCast(&window.*.safe_rect)), @sizeOf(@TypeOf(rect))) != @as(c_int, 0)) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&window.*.safe_rect).*)) == @sizeOf(@TypeOf((&rect).*)))) @compileError("static assertion failed \"sizeof (*(&window->safe_rect)) == sizeof (*( &rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&window.*.safe_rect)), @ptrCast(@alignCast(&rect)), @sizeOf(@TypeOf((&rect).*)));
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_SAFE_AREA_CHANGED, 0, 0);
    }
}
pub export fn SDL_SetWindowSafeAreaInsets(window: [*c]SDL_Window, left: c_int, right: c_int, top: c_int, bottom: c_int) void {
    @setEvalBranchQuota(100000);
    window.*.safe_inset_left = left;
    window.*.safe_inset_right = right;
    window.*.safe_inset_top = top;
    window.*.safe_inset_bottom = bottom;
    SDL_CheckWindowSafeAreaChanged(window);
}
pub export fn SDL_GetWindowSafeArea_REAL(window: [*c]SDL_Window, rect: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    if (rect != null) {
        _ = memset(@ptrCast(@alignCast(rect)), 0, @sizeOf(@TypeOf(rect.*)));
    }
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (rect != null) {
        if (SDL_RectEmpty(&window.*.safe_rect)) {
            rect.*.w = window.*.w;
            rect.*.h = window.*.h;
        } else {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf(rect.*)) == @sizeOf(@TypeOf((&window.*.safe_rect).*)))) @compileError("static assertion failed \"sizeof (*(rect)) == sizeof (*( &window->safe_rect))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(rect)), @ptrCast(@alignCast(&window.*.safe_rect)), @sizeOf(@TypeOf((&window.*.safe_rect).*)));
        }
    }
    return @"true" != 0;
}
pub export fn SDL_OnWindowMinimized(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_LEAVE, @"false" != 0);
    }
}
pub export fn SDL_OnWindowMaximized(_: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn SDL_OnWindowRestored(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if ((window.*.flags & @as(c_ulong, 1)) != 0) {
        _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_ENTER, @"false" != 0);
    }
}
pub export fn SDL_OnWindowEnter(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (_this.*.OnWindowEnter != null) {
        _this.*.OnWindowEnter.?(_this, window);
    }
    _ = SDL_UpdateRelativeMouseMode();
}
pub export fn SDL_OnWindowLeave(_: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    _ = SDL_UpdateRelativeMouseMode();
}
pub export fn SDL_OnWindowFocusGained(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if ((mouse != null) and mouse.*.relative_mode) {
        SDL_SetMouseFocus(window);
    }
    SDL_UpdateWindowGrab(window);
}
pub fn SDL_ShouldMinimizeOnFocusLoss(window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    if (!((window.*.flags & @as(c_ulong, 1)) != 0) or window.*.is_destroying) {
        return @"false" != 0;
    }
    hint = SDL_GetHint_REAL("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS");
    if ((!(hint != null) or !(@as(c_int, hint.*) != 0)) or (SDL_strcasecmp_REAL(hint, "auto") == @as(c_int, 0))) {
        if (window.*.fullscreen_exclusive and !SDL_ModeSwitchingEmulated(_this)) {
            return @"true" != 0;
        } else {
            return @"false" != 0;
        }
    }
    return SDL_GetHintBoolean_REAL("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS", @"false" != 0);
}
pub export fn SDL_OnWindowFocusLost(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    SDL_UpdateWindowGrab(window);
    if (SDL_ShouldMinimizeOnFocusLoss(window)) {
        _ = SDL_MinimizeWindow_REAL(window);
    }
}
pub export fn SDL_GetToplevelForKeyboardFocus() [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var focus: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
    _ = &focus;
    if (focus != null) {
        while (focus.*.parent != null) {
            focus = focus.*.parent;
        }
    }
    return focus;
}
pub export fn SDL_AddWindowRenderer(window: [*c]SDL_Window, renderer: [*c]SDL_Renderer) bool {
    @setEvalBranchQuota(100000);
    var renderers: [*c][*c]SDL_Renderer = undefined;
    renderers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(window.*.renderers)), @as(c_ulong, @bitCast(@as(c_long, window.*.num_renderers + @as(c_int, 1)))) *% @sizeOf(@TypeOf(renderers.*)))));
    _ = &renderers;
    if (!(renderers != null)) {
        return @"false" != 0;
    }
    window.*.renderers = renderers;
    window.*.renderers[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &window.*.num_renderers;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = renderer;
    _ = SDL_SetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.internal.window.renderer", @ptrCast(@alignCast(renderer)));
    return @"true" != 0;
}
pub export fn SDL_RemoveWindowRenderer(window: [*c]SDL_Window, renderer: [*c]SDL_Renderer) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < window.*.num_renderers) : (i += 1) {
            if (window.*.renderers[@bitCast(@as(isize, @intCast(i)))] == renderer) {
                if (i < (window.*.num_renderers - @as(c_int, 1))) {
                    _ = memmove(@ptrCast(@alignCast(&window.*.renderers[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&window.*.renderers[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, (window.*.num_renderers - i) - @as(c_int, 1)))) *% @sizeOf(@TypeOf(window.*.renderers[@bitCast(@as(isize, @intCast(i)))])));
                }
                window.*.num_renderers -= 1;
                break;
            }
        }
    }
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    if (SDL_GetPointerProperty_REAL(props, "SDL.internal.window.renderer", null) == @as(?*anyopaque, @ptrCast(@alignCast(renderer)))) {
        _ = SDL_ClearProperty_REAL(props, "SDL.internal.window.renderer");
    }
}
pub export fn SDL_DestroyWindow_REAL(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return;
    }
    window.*.is_destroying = @"true" != 0;
    while (window.*.first_child != null) {
        SDL_DestroyWindow_REAL(window.*.first_child);
    }
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_DESTROYED, 0, 0);
    _ = SDL_DestroyWindowSurface_REAL(window);
    var renderer: [*c]SDL_Renderer = SDL_GetRenderer_REAL(window);
    _ = &renderer;
    if (renderer != null) {
        SDL_DestroyRendererWithoutFreeing(renderer);
    }
    _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_LEAVE, @"true" != 0);
    if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
        _ = SDL_HideWindow_REAL(window);
    }
    SDL_DestroyProperties_REAL(window.*.text_input_props);
    SDL_DestroyWindowTexture(_this, window);
    SDL_DestroyProperties_REAL(window.*.props);
    if ((_this.*.SetWindowModal != null) and ((window.*.flags & @as(c_ulong, 4096)) != 0)) {
        _ = _this.*.SetWindowModal.?(_this, window, @"false" != 0);
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < _this.*.num_displays) : (i += 1) {
            if (_this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.fullscreen_window == window) {
                _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.fullscreen_window = null;
            }
        }
    }
    if (SDL_GetKeyboardFocus_REAL() == window) {
        _ = SDL_SetKeyboardFocus(null);
    }
    if ((window.*.flags & @as(c_ulong, 16384)) != 0) {
        _ = SDL_UpdateMouseCapture(@"true" != 0);
    }
    if (SDL_GetMouseFocus_REAL() == window) {
        SDL_SetMouseFocus(null);
    }
    if ((window.*.flags & @as(c_ulong, 2)) != 0) {
        if (_this.*.current_glwin == window) {
            _ = SDL_GL_MakeCurrent_REAL(window, null);
        }
    }
    if (_this.*.DestroyWindow != null) {
        _this.*.DestroyWindow.?(_this, window);
    }
    if ((window.*.flags & @as(c_ulong, 2)) != 0) {
        SDL_GL_UnloadLibrary_REAL();
    }
    if ((window.*.flags & @as(c_ulong, 268435456)) != 0) {
        SDL_Vulkan_UnloadLibrary_REAL();
    }
    if (_this.*.grabbed_window == window) {
        _this.*.grabbed_window = null;
    }
    if (_this.*.current_glwin == window) {
        _this.*.current_glwin = null;
    }
    _ = SDL_CompareAndSwapAtomicPointer_REAL(&_this.*.wakeup_window, @ptrCast(@alignCast(window)), null);
    SDL_SetObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW, @"false" != 0);
    SDL_free_REAL(@ptrCast(@alignCast(window.*.title)));
    SDL_DestroySurface_REAL(window.*.icon);
    SDL_UpdateWindowHierarchy(window, null);
    if (window.*.next != null) {
        window.*.next.*.prev = window.*.prev;
    }
    if (window.*.prev != null) {
        window.*.prev.*.next = window.*.next;
    } else {
        _this.*.windows = window.*.next;
    }
    SDL_free_REAL(@ptrCast(@alignCast(window.*.renderers)));
    SDL_free_REAL(@ptrCast(@alignCast(window)));
}
pub export fn SDL_ScreenSaverEnabled_REAL() bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return @"true" != 0;
    }
    return !_this.*.suspend_screensaver;
}
pub export fn SDL_EnableScreenSaver_REAL() bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (!_this.*.suspend_screensaver) {
        return @"true" != 0;
    }
    _this.*.suspend_screensaver = @"false" != 0;
    if (_this.*.SuspendScreenSaver != null) {
        return _this.*.SuspendScreenSaver.?(_this);
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_DisableScreenSaver_REAL() bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (_this.*.suspend_screensaver) {
        return @"true" != 0;
    }
    _this.*.suspend_screensaver = @"true" != 0;
    if (_this.*.SuspendScreenSaver != null) {
        return _this.*.SuspendScreenSaver.?(_this);
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_QuitVideo() void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "SDL_QuitVideo".*;
    };
    _ = &static_local___func__;
    var i: c_int = undefined;
    _ = &i;
    if (!(_this != null)) {
        return;
    }
    _this.*.is_quitting = @"true" != 0;
    SDL_QuitTouch();
    SDL_QuitMouse();
    SDL_QuitKeyboard();
    SDL_QuitSubSystem_REAL(SDL_INIT_EVENTS);
    _ = SDL_EnableScreenSaver_REAL();
    while (_this.*.windows != null) {
        SDL_DestroyWindow_REAL(_this.*.windows);
    }
    if ((_this.*.gl_config.driver_loaded != 0) and (_this.*.GL_UnloadLibrary != null)) {
        _this.*.GL_UnloadLibrary.?(_this);
        _this.*.gl_config.driver_loaded = 0;
    }
    if ((_this.*.vulkan_config.loader_loaded != 0) and (_this.*.Vulkan_UnloadLibrary != null)) {
        _this.*.Vulkan_UnloadLibrary.?(_this);
        _this.*.vulkan_config.loader_loaded = 0;
    }
    _this.*.VideoQuit.?(_this);
    {
        i = _this.*.num_displays;
        while ((blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            var display: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
            _ = &display;
            SDL_DelVideoDisplay(display.*.id, @"false" != 0);
        }
    }
    while (true) {
        while (!(_this.*.num_displays == @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "_this->num_displays == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_video.c", 4749);
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
    SDL_free_REAL(@ptrCast(@alignCast(_this.*.displays)));
    _this.*.displays = null;
    SDL_CancelClipboardData(0);
    if (_this.*.primary_selection_text != null) {
        SDL_free_REAL(@ptrCast(@alignCast(_this.*.primary_selection_text)));
        _this.*.primary_selection_text = null;
    }
    _this.*.free.?(_this);
    _this = null;
    SDL_QuitPen();
}
pub export fn SDL_GL_LoadLibrary_REAL(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (_this.*.gl_config.driver_loaded != 0) {
        if ((path != null) and (SDL_strcmp_REAL(path, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))) != @as(c_int, 0))) {
            return SDL_SetError_REAL("OpenGL library already loaded");
        }
        result = @"true" != 0;
    } else {
        if (!(_this.*.GL_LoadLibrary != null)) {
            return SDL_DllNotSupported("OpenGL");
        }
        result = _this.*.GL_LoadLibrary.?(_this, path);
    }
    if (result) {
        _this.*.gl_config.driver_loaded += 1;
    } else {
        if (_this.*.GL_UnloadLibrary != null) {
            _this.*.GL_UnloadLibrary.?(_this);
        }
    }
    return result;
}
pub export fn SDL_GL_GetProcAddress_REAL(proc: [*c]const u8) SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    var func: SDL_FunctionPointer = undefined;
    _ = &func;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    func = null;
    if (_this.*.GL_GetProcAddress != null) {
        if (_this.*.gl_config.driver_loaded != 0) {
            func = _this.*.GL_GetProcAddress.?(_this, proc);
        } else {
            _ = SDL_SetError_REAL("No GL driver has been loaded");
        }
    } else {
        _ = SDL_SetError_REAL("No dynamic GL support in current SDL video driver (%s)", _this.*.name);
    }
    return func;
}
pub export fn SDL_EGL_GetProcAddress_REAL(proc: [*c]const u8) SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    var func: SDL_FunctionPointer = undefined;
    _ = &func;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    func = null;
    if (_this.*.egl_data != null) {
        func = SDL_EGL_GetProcAddressInternal(_this, proc);
    } else {
        _ = SDL_SetError_REAL("No EGL library has been loaded");
    }
    return func;
}
pub export fn SDL_GL_UnloadLibrary_REAL() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return;
    }
    if (_this.*.gl_config.driver_loaded > @as(c_int, 0)) {
        if ((blk: {
            const ref = &_this.*.gl_config.driver_loaded;
            ref.* -= 1;
            break :blk ref.*;
        }) > @as(c_int, 0)) {
            return;
        }
        if (_this.*.GL_UnloadLibrary != null) {
            _this.*.GL_UnloadLibrary.?(_this);
        }
    }
}
pub const PFNGLGETERRORPROC = ?*const fn () callconv(.c) GLenum;
pub const PFNGLGETINTEGERVPROC = ?*const fn (pname: GLenum, params: [*c]GLint) callconv(.c) void;
pub const PFNGLGETSTRINGPROC = ?*const fn (name: GLenum) callconv(.c) [*c]const GLubyte;
pub const PFNGLENABLEPROC = ?*const fn (cap: GLenum) callconv(.c) void;
pub fn isAtLeastGL3(verstr: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return (verstr != null) and (SDL_atoi_REAL(verstr) >= @as(c_int, 3));
}
pub export fn SDL_GL_ExtensionSupported_REAL(extension: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var glGetStringFunc: PFNGLGETSTRINGPROC = undefined;
    _ = &glGetStringFunc;
    var extensions: [*c]const u8 = undefined;
    _ = &extensions;
    var start: [*c]const u8 = undefined;
    _ = &start;
    var where: [*c]const u8 = undefined;
    _ = &where;
    var terminator: [*c]const u8 = undefined;
    _ = &terminator;
    where = SDL_strchr_REAL(extension, ' ');
    if ((where != null) or (@as(c_int, extension.*) == @as(c_int, '\x00'))) {
        return @"false" != 0;
    }
    start = SDL_GetHint_REAL(extension);
    if ((start != null) and (@as(c_int, start.*) == @as(c_int, '0'))) {
        return @"false" != 0;
    }
    glGetStringFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetString"))));
    if (!(glGetStringFunc != null)) {
        return @"false" != 0;
    }
    if (isAtLeastGL3(@ptrCast(@alignCast(glGetStringFunc.?(GL_VERSION))))) {
        var glGetStringiFunc: PFNGLGETSTRINGIPROC = undefined;
        _ = &glGetStringiFunc;
        var glGetIntegervFunc: PFNGLGETINTEGERVPROC = undefined;
        _ = &glGetIntegervFunc;
        var num_exts: GLint = 0;
        _ = &num_exts;
        var i: GLint = undefined;
        _ = &i;
        glGetStringiFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetStringi"))));
        glGetIntegervFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
        if (!(glGetStringiFunc != null) or !(glGetIntegervFunc != null)) {
            return @"false" != 0;
        }
        glGetIntegervFunc.?(GL_NUM_EXTENSIONS, &num_exts);
        {
            i = 0;
            while (i < num_exts) : (i += 1) {
                var thisext: [*c]const u8 = @ptrCast(@alignCast(glGetStringiFunc.?(GL_EXTENSIONS, @bitCast(@as(c_int, i)))));
                _ = &thisext;
                if (SDL_strcmp_REAL(thisext, extension) == @as(c_int, 0)) {
                    return @"true" != 0;
                }
            }
        }
        return @"false" != 0;
    }
    extensions = @ptrCast(@alignCast(glGetStringFunc.?(GL_EXTENSIONS)));
    if (!(extensions != null)) {
        return @"false" != 0;
    }
    start = extensions;
    while (true) {
        where = SDL_strstr_REAL(start, extension);
        if (!(where != null)) {
            break;
        }
        terminator = where + SDL_strlen_REAL(extension);
        if ((where == extensions) or (@as(c_int, (where - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))).*) == @as(c_int, ' '))) {
            if ((@as(c_int, terminator.*) == @as(c_int, ' ')) or (@as(c_int, terminator.*) == @as(c_int, '\x00'))) {
                return @"true" != 0;
            }
        }
        start = terminator;
    }
    return @"false" != 0;
}
pub export fn SDL_GL_DeduceMaxSupportedESProfile(major: [*c]c_int, minor: [*c]c_int) void {
    @setEvalBranchQuota(100000);
    if (SDL_GL_ExtensionSupported_REAL("GL_ARB_ES3_2_compatibility")) {
        major.* = 3;
        minor.* = 2;
    } else if (SDL_GL_ExtensionSupported_REAL("GL_ARB_ES3_1_compatibility")) {
        major.* = 3;
        minor.* = 1;
    } else if (SDL_GL_ExtensionSupported_REAL("GL_ARB_ES3_compatibility")) {
        major.* = 3;
        minor.* = 0;
    } else {
        major.* = 2;
        minor.* = 0;
    }
}
pub export fn SDL_EGL_SetAttributeCallbacks_REAL(platformAttribCallback: SDL_EGLAttribArrayCallback, surfaceAttribCallback: SDL_EGLIntArrayCallback, contextAttribCallback: SDL_EGLIntArrayCallback, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return;
    }
    _this.*.egl_platformattrib_callback = platformAttribCallback;
    _this.*.egl_surfaceattrib_callback = surfaceAttribCallback;
    _this.*.egl_contextattrib_callback = contextAttribCallback;
    _this.*.egl_attrib_callback_userdata = userdata;
}
pub export fn SDL_GL_ResetAttributes_REAL() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return;
    }
    _this.*.egl_platformattrib_callback = null;
    _this.*.egl_surfaceattrib_callback = null;
    _this.*.egl_contextattrib_callback = null;
    _this.*.egl_attrib_callback_userdata = null;
    _this.*.gl_config.red_size = 8;
    _this.*.gl_config.green_size = 8;
    _this.*.gl_config.blue_size = 8;
    _this.*.gl_config.alpha_size = 8;
    _this.*.gl_config.buffer_size = 0;
    _this.*.gl_config.depth_size = 16;
    _this.*.gl_config.stencil_size = 0;
    _this.*.gl_config.double_buffer = 1;
    _this.*.gl_config.accum_red_size = 0;
    _this.*.gl_config.accum_green_size = 0;
    _this.*.gl_config.accum_blue_size = 0;
    _this.*.gl_config.accum_alpha_size = 0;
    _this.*.gl_config.stereo = 0;
    _this.*.gl_config.multisamplebuffers = 0;
    _this.*.gl_config.multisamplesamples = 0;
    _this.*.gl_config.floatbuffers = 0;
    _this.*.gl_config.retained_backing = 1;
    _this.*.gl_config.accelerated = -@as(c_int, 1);
    _this.*.gl_config.major_version = 2;
    _this.*.gl_config.minor_version = 1;
    _this.*.gl_config.profile_mask = 0;
    _this.*.gl_config.flags = 0;
    _this.*.gl_config.framebuffer_srgb_capable = 0;
    _this.*.gl_config.no_error = 0;
    _this.*.gl_config.release_behavior = SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH;
    _this.*.gl_config.reset_notification = SDL_GL_CONTEXT_RESET_NO_NOTIFICATION;
    _this.*.gl_config.share_with_current_context = 0;
    _this.*.gl_config.egl_platform = 0;
    if (_this.*.GL_SetDefaultProfileConfig != null) {
        _this.*.GL_SetDefaultProfileConfig.?(_this);
    }
}
pub export fn SDL_GL_SetAttribute_REAL(attr: SDL_GLAttr, value: c_int) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(_this != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_UninitializedVideo();
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                result = @"true" != 0;
                switch (attr) {
                    @as(SDL_GLAttr, SDL_GL_RED_SIZE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_GREEN_SIZE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_BLUE_SIZE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ALPHA_SIZE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_DOUBLEBUFFER) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_BUFFER_SIZE) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_DEPTH_SIZE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_STENCIL_SIZE) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_RED_SIZE) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_GREEN_SIZE) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_BLUE_SIZE) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_ALPHA_SIZE) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_STEREO) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_MULTISAMPLEBUFFERS) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_MULTISAMPLESAMPLES) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_FLOATBUFFERS) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCELERATED_VISUAL) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_RETAINED_BACKING) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_MAJOR_VERSION) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_MINOR_VERSION) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_FLAGS) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_PROFILE_MASK) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_SHARE_WITH_CURRENT_CONTEXT) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_FRAMEBUFFER_SRGB_CAPABLE) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_RELEASE_BEHAVIOR) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_RESET_NOTIFICATION) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_NO_ERROR) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_EGL_PLATFORM) => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 39;
                        continue;
                    },
                }
            },
            4 => {
                return result;
            },
            5 => {
                _this.*.gl_config.red_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                _this.*.gl_config.green_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                _this.*.gl_config.blue_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                _this.*.gl_config.alpha_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                _this.*.gl_config.double_buffer = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                _this.*.gl_config.buffer_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                _this.*.gl_config.depth_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                _this.*.gl_config.stencil_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                _this.*.gl_config.accum_red_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                _this.*.gl_config.accum_green_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            15 => {
                _this.*.gl_config.accum_blue_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            16 => {
                _this.*.gl_config.accum_alpha_size = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            17 => {
                _this.*.gl_config.stereo = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            18 => {
                _this.*.gl_config.multisamplebuffers = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            19 => {
                _this.*.gl_config.multisamplesamples = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            20 => {
                _this.*.gl_config.floatbuffers = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            21 => {
                _this.*.gl_config.accelerated = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            22 => {
                _this.*.gl_config.retained_backing = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            23 => {
                _this.*.gl_config.major_version = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            24 => {
                _this.*.gl_config.minor_version = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            25 => {
                if ((value & ~(((SDL_GL_CONTEXT_DEBUG_FLAG | SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG) | SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG) | SDL_GL_CONTEXT_RESET_ISOLATION_FLAG)) != 0) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                result = SDL_SetError_REAL("Unknown OpenGL context flag %d", value);
                {
                    sdl_pc = 4;
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
                _this.*.gl_config.flags = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            29 => {
                if ((((value != @as(c_int, 0)) and (value != SDL_GL_CONTEXT_PROFILE_CORE)) and (value != SDL_GL_CONTEXT_PROFILE_COMPATIBILITY)) and (value != SDL_GL_CONTEXT_PROFILE_ES)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                result = SDL_SetError_REAL("Unknown OpenGL context profile %d", value);
                {
                    sdl_pc = 4;
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
                _this.*.gl_config.profile_mask = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            33 => {
                _this.*.gl_config.share_with_current_context = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            34 => {
                _this.*.gl_config.framebuffer_srgb_capable = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            35 => {
                _this.*.gl_config.release_behavior = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            36 => {
                _this.*.gl_config.reset_notification = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            37 => {
                _this.*.gl_config.no_error = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            38 => {
                _this.*.gl_config.egl_platform = value;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            39 => {
                result = SDL_SetError_REAL("Unknown OpenGL attribute");
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GL_GetAttribute_REAL(attr: SDL_GLAttr, value: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var glGetErrorFunc: PFNGLGETERRORPROC = undefined;
    _ = &glGetErrorFunc;
    var attrib: GLenum = undefined;
    _ = &attrib;
    var @"error": GLenum = undefined;
    _ = &@"error";
    var glGetStringFunc: PFNGLGETSTRINGPROC = undefined;
    _ = &glGetStringFunc;
    var glGetFramebufferAttachmentParameterivFunc: PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = undefined;
    _ = &glGetFramebufferAttachmentParameterivFunc;
    var attachment: GLenum = undefined;
    _ = &attachment;
    var attachmentattrib: GLenum = undefined;
    _ = &attachmentattrib;
    var rsize: c_int = undefined;
    _ = &rsize;
    var gsize: c_int = undefined;
    _ = &gsize;
    var bsize: c_int = undefined;
    _ = &bsize;
    var asize: c_int = undefined;
    _ = &asize;
    var current_fbo: GLint = undefined;
    _ = &current_fbo;
    var glGetIntegervFunc: PFNGLGETINTEGERVPROC = undefined;
    _ = &glGetIntegervFunc;
    var glBindFramebufferFunc: PFNGLBINDFRAMEBUFFERPROC = undefined;
    _ = &glBindFramebufferFunc;
    var fbo_type: GLint = undefined;
    _ = &fbo_type;
    var glGetIntegervFunc_1: PFNGLGETINTEGERVPROC = undefined;
    _ = &glGetIntegervFunc_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                attrib = 0;
                @"error" = 0;
                attachment = GL_BACK_LEFT;
                attachmentattrib = 0;
                if (!(value != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("value"))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                value.* = 0;
                if (!(_this != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return SDL_UninitializedVideo();
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (attr) {
                    @as(SDL_GLAttr, SDL_GL_RED_SIZE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_BLUE_SIZE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_GREEN_SIZE) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ALPHA_SIZE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_DOUBLEBUFFER) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_DEPTH_SIZE) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_STENCIL_SIZE) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_RED_SIZE) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_GREEN_SIZE) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_BLUE_SIZE) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCUM_ALPHA_SIZE) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_STEREO) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_MULTISAMPLEBUFFERS) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_MULTISAMPLESAMPLES) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_RELEASE_BEHAVIOR) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_BUFFER_SIZE) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_ACCELERATED_VISUAL) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_RETAINED_BACKING) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_MAJOR_VERSION) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_MINOR_VERSION) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_FLAGS) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_PROFILE_MASK) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_SHARE_WITH_CURRENT_CONTEXT) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_FRAMEBUFFER_SRGB_CAPABLE) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_CONTEXT_NO_ERROR) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_EGL_PLATFORM) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_GLAttr, SDL_GL_FLOATBUFFERS) => {
                        sdl_pc = 46;
                        continue;
                    },
                    else => {
                        sdl_pc = 50;
                        continue;
                    },
                }
            },
            7 => {
                glGetStringFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetString"))));
                if (!(glGetStringFunc != null)) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            8 => {
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE;
                attrib = GL_RED_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE;
                attrib = GL_BLUE_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE;
                attrib = GL_GREEN_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE;
                attrib = GL_ALPHA_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                attrib = GL_DOUBLEBUFFER;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            13 => {
                attachment = GL_DEPTH;
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE;
                attrib = GL_DEPTH_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                attachment = GL_STENCIL;
                attachmentattrib = GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE;
                attrib = GL_STENCIL_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                attrib = GL_ACCUM_RED_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                attrib = GL_ACCUM_GREEN_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            17 => {
                attrib = GL_ACCUM_BLUE_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            18 => {
                attrib = GL_ACCUM_ALPHA_BITS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            19 => {
                attrib = GL_STEREO;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            20 => {
                attrib = GL_SAMPLE_BUFFERS;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            21 => {
                attrib = GL_SAMPLES;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            22 => {
                attrib = GL_CONTEXT_RELEASE_BEHAVIOR;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            23 => {
                rsize = 0;
                gsize = 0;
                bsize = 0;
                asize = 0;
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_RED_SIZE, &rsize)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                return @"false" != 0;
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_GREEN_SIZE, &gsize)) {
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
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_BLUE_SIZE, &bsize)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                return @"false" != 0;
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                if (!SDL_GL_GetAttribute_REAL(SDL_GL_ALPHA_SIZE, &asize)) {
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
                value.* = ((rsize + gsize) + bsize) + asize;
                return @"true" != 0;
            },
            36 => {
                value.* = @intFromBool(_this.*.gl_config.accelerated != @as(c_int, 0));
                return @"true" != 0;
            },
            37 => {
                value.* = _this.*.gl_config.retained_backing;
                return @"true" != 0;
            },
            38 => {
                value.* = _this.*.gl_config.major_version;
                return @"true" != 0;
            },
            39 => {
                value.* = _this.*.gl_config.minor_version;
                return @"true" != 0;
            },
            40 => {
                value.* = _this.*.gl_config.flags;
                return @"true" != 0;
            },
            41 => {
                value.* = _this.*.gl_config.profile_mask;
                return @"true" != 0;
            },
            42 => {
                value.* = _this.*.gl_config.share_with_current_context;
                return @"true" != 0;
            },
            43 => {
                value.* = _this.*.gl_config.framebuffer_srgb_capable;
                return @"true" != 0;
            },
            44 => {
                value.* = _this.*.gl_config.no_error;
                return @"true" != 0;
            },
            45 => {
                value.* = _this.*.gl_config.egl_platform;
                return @"true" != 0;
            },
            46 => {
                if (_this.*.gl_config.HAS_GL_ARB_color_buffer_float != 0) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                attrib = GL_RGBA_FLOAT_MODE_ARB;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            48 => {
                return @as(c_int, 0) != 0;
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                return SDL_SetError_REAL("Unknown OpenGL attribute");
            },
            51 => {
                return @"false" != 0;
            },
            52 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                if ((attachmentattrib != 0) and (@as(GLenum, @bitCast(@as(c_int, @as(c_int, @intFromBool(isAtLeastGL3(@ptrCast(@alignCast(glGetStringFunc.?(GL_VERSION))))))))) != 0)) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                current_fbo = 0;
                glGetIntegervFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
                glBindFramebufferFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glBindFramebuffer"))));
                if ((glGetIntegervFunc != null) and (glBindFramebufferFunc != null)) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            55 => {
                glGetIntegervFunc_1 = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
                if (glGetIntegervFunc_1 != null) {
                    sdl_pc = 75;
                    continue;
                } else {
                    sdl_pc = 76;
                    continue;
                }
            },
            56 => {
                glGetErrorFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetError"))));
                if (!(glGetErrorFunc != null)) {
                    sdl_pc = 78;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            57 => {
                glGetIntegervFunc.?(GL_DRAW_FRAMEBUFFER_BINDING, &current_fbo);
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            59 => {
                glGetFramebufferAttachmentParameterivFunc = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetFramebufferAttachmentParameteriv"))));
                if (glGetFramebufferAttachmentParameterivFunc != null) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                if ((glBindFramebufferFunc != null) and (current_fbo != @as(c_int, 0))) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            61 => {
                return @"false" != 0;
            },
            62 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            63 => {
                glBindFramebufferFunc.?(GL_DRAW_FRAMEBUFFER, 0);
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
                fbo_type = GL_FRAMEBUFFER_DEFAULT;
                if ((attachment == @as(GLenum, GL_DEPTH)) or (attachment == @as(GLenum, GL_STENCIL))) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                glGetFramebufferAttachmentParameterivFunc.?(GL_FRAMEBUFFER, attachment, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, &fbo_type);
                {
                    sdl_pc = 68;
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
                if (fbo_type != GL_NONE) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                glGetFramebufferAttachmentParameterivFunc.?(GL_FRAMEBUFFER, attachment, attachmentattrib, value);
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                value.* = 0;
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                if ((glBindFramebufferFunc != null) and (current_fbo != @as(c_int, 0))) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                glBindFramebufferFunc.?(GL_DRAW_FRAMEBUFFER, @bitCast(@as(c_int, current_fbo)));
                {
                    sdl_pc = 74;
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
                    sdl_pc = 62;
                    continue;
                }
            },
            75 => {
                glGetIntegervFunc_1.?(attrib, value);
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            76 => {
                return @"false" != 0;
            },
            77 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            78 => {
                return @"false" != 0;
            },
            79 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                @"error" = glGetErrorFunc.?();
                if (@"error" != @as(GLenum, GL_NO_ERROR)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                if (@"error" == @as(GLenum, GL_INVALID_ENUM)) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 83;
                    continue;
                }
            },
            83 => {
                if (attr == @as(SDL_GLAttr, SDL_GL_CONTEXT_RELEASE_BEHAVIOR)) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            84 => {
                return SDL_SetError_REAL("OpenGL error: GL_INVALID_ENUM");
            },
            85 => {
                if (@"error" == @as(GLenum, GL_INVALID_VALUE)) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            86 => {
                return SDL_SetError_REAL("OpenGL error: %08X", @"error");
            },
            87 => {
                return SDL_SetError_REAL("OpenGL error: GL_INVALID_VALUE");
            },
            88 => {
                {
                    sdl_pc = 89;
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
                value.* = if (value.* == GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH) SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH else SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE;
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
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GL_CreateContext_REAL(window: [*c]SDL_Window) SDL_GLContext {
    @setEvalBranchQuota(100000);
    var ctx: SDL_GLContext = null;
    _ = &ctx;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if (!((window.*.flags & @as(c_ulong, 2)) != 0)) {
        _ = SDL_SetError_REAL("The specified window isn't an OpenGL window");
        return null;
    }
    var srgb_requested: c_int = -@as(c_int, 1);
    _ = &srgb_requested;
    var srgbhint: [*c]const u8 = SDL_GetHint_REAL("SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER");
    _ = &srgbhint;
    if ((srgbhint != null) and (@as(c_int, srgbhint.*) != 0)) {
        srgb_requested = if (SDL_GetStringBoolean(srgbhint, @"false" != 0)) @as(c_int, 1) else @as(c_int, 0);
    }
    ctx = _this.*.GL_CreateContext.?(_this, window);
    if (ctx != null) {
        _this.*.current_glwin = window;
        _this.*.current_glctx = ctx;
        _ = SDL_SetTLS_REAL(&_this.*.current_glwin_tls, @ptrCast(@alignCast(window)), null);
        _ = SDL_SetTLS_REAL(&_this.*.current_glctx_tls, @ptrCast(@alignCast(ctx)), null);
    }
    if (srgb_requested != -@as(c_int, 1)) {
        var glToggleFunc: PFNGLENABLEPROC = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL(if (srgb_requested != 0) @as([*c]u8, @as([*c]u8, @constCast("glEnable"))) else @as([*c]u8, @as([*c]u8, @constCast("glDisable")))))));
        _ = &glToggleFunc;
        var glGetStringFunc: PFNGLGETSTRINGPROC = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetString"))));
        _ = &glGetStringFunc;
        if ((glToggleFunc != null) and (glGetStringFunc != null)) {
            var supported: bool = @"false" != 0;
            _ = &supported;
            if ((_this.*.gl_config.profile_mask & SDL_GL_CONTEXT_PROFILE_ES) != 0) {
                supported = SDL_GL_ExtensionSupported_REAL("GL_EXT_sRGB_write_control");
            } else {
                supported = (isAtLeastGL3(@ptrCast(@alignCast(glGetStringFunc.?(GL_VERSION)))) or SDL_GL_ExtensionSupported_REAL("GL_EXT_framebuffer_sRGB")) or SDL_GL_ExtensionSupported_REAL("GL_ARB_framebuffer_sRGB");
            }
            if (supported) {
                glToggleFunc.?(GL_FRAMEBUFFER_SRGB);
            }
        }
    }
    return ctx;
}
pub export fn SDL_GL_MakeCurrent_REAL(arg_window: [*c]SDL_Window, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    var window = arg_window;
    _ = &window;
    var result: bool = undefined;
    _ = &result;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if ((window == SDL_GL_GetCurrentWindow_REAL()) and (context == SDL_GL_GetCurrentContext_REAL())) {
        return @"true" != 0;
    }
    if (!(context != null)) {
        window = null;
    } else if (window != null) {
        if (!(_this != null)) {
            _ = SDL_UninitializedVideo();
            return @"false" != 0;
        }
        if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
            _ = SDL_SetError_REAL("Invalid window");
            return @"false" != 0;
        }
        if (!((window.*.flags & @as(c_ulong, 2)) != 0)) {
            return SDL_SetError_REAL("The specified window isn't an OpenGL window");
        }
    } else if (!_this.*.gl_allow_no_surface) {
        return SDL_SetError_REAL("Use of OpenGL without a window is not supported on this platform");
    }
    result = _this.*.GL_MakeCurrent.?(_this, window, context);
    if (result) {
        _this.*.current_glwin = window;
        _this.*.current_glctx = context;
        _ = SDL_SetTLS_REAL(&_this.*.current_glwin_tls, @ptrCast(@alignCast(window)), null);
        _ = SDL_SetTLS_REAL(&_this.*.current_glctx_tls, @ptrCast(@alignCast(context)), null);
    }
    return result;
}
pub export fn SDL_GL_GetCurrentWindow_REAL() [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    return @ptrCast(@alignCast(SDL_GetTLS_REAL(&_this.*.current_glwin_tls)));
}
pub export fn SDL_GL_GetCurrentContext_REAL() SDL_GLContext {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    return @ptrCast(@alignCast(SDL_GetTLS_REAL(&_this.*.current_glctx_tls)));
}
pub export fn SDL_EGL_GetCurrentDisplay_REAL() SDL_EGLDisplay {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!(_this.*.egl_data != null)) {
        _ = SDL_SetError_REAL("There is no current EGL display");
        return null;
    }
    return _this.*.egl_data.*.egl_display;
}
pub export fn SDL_EGL_GetCurrentConfig_REAL() SDL_EGLConfig {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!(_this.*.egl_data != null)) {
        _ = SDL_SetError_REAL("There is no current EGL display");
        return null;
    }
    return _this.*.egl_data.*.egl_config;
}
pub export fn SDL_EGL_GetWindowSurface_REAL(window: [*c]SDL_Window) SDL_EGLConfig {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!(_this.*.egl_data != null)) {
        _ = SDL_SetError_REAL("There is no current EGL display");
        return null;
    }
    if (_this.*.GL_GetEGLSurface != null) {
        return _this.*.GL_GetEGLSurface.?(_this, window);
    }
    return null;
}
pub export fn SDL_GL_SetSwapInterval_REAL(interval: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    } else if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_GL_GetCurrentContext_REAL()))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("No OpenGL context has been made current");
    } else if (_this.*.GL_SetSwapInterval != null) {
        return _this.*.GL_SetSwapInterval.?(_this, interval);
    } else {
        return SDL_SetError_REAL("Setting the swap interval is not supported");
    }
}
pub export fn SDL_GL_GetSwapInterval_REAL(interval: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(interval != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("interval"))));
    }
    interval.* = 0;
    if (!(_this != null)) {
        return SDL_SetError_REAL("no video driver");
    } else if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_GL_GetCurrentContext_REAL()))) == @as(?*anyopaque, null)) {
        return SDL_SetError_REAL("no current context");
    } else if (_this.*.GL_GetSwapInterval != null) {
        return _this.*.GL_GetSwapInterval.?(_this, interval);
    } else {
        return SDL_SetError_REAL("not implemented");
    }
}
pub export fn SDL_GL_SwapWindow_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!((window.*.flags & @as(c_ulong, 2)) != 0)) {
        return SDL_SetError_REAL("The specified window isn't an OpenGL window");
    }
    if (SDL_GL_GetCurrentWindow_REAL() != window) {
        return SDL_SetError_REAL("The specified window has not been made current");
    }
    return _this.*.GL_SwapWindow.?(_this, window);
}
pub export fn SDL_GL_DestroyContext_REAL(context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (!(context != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("context"))));
    }
    if (SDL_GL_GetCurrentContext_REAL() == context) {
        _ = SDL_GL_MakeCurrent_REAL(null, null);
    }
    return _this.*.GL_DestroyContext.?(_this, context);
}
pub export fn SDL_GetTextInputType(props: SDL_PropertiesID) SDL_TextInputType {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.textinput.type", SDL_TEXTINPUT_TYPE_TEXT))));
}
pub export fn SDL_GetTextInputCapitalization(props: SDL_PropertiesID) SDL_Capitalization {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_HasProperty_REAL(props, "SDL.textinput.capitalization")) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.textinput.capitalization", SDL_CAPITALIZE_NONE))));
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (SDL_GetTextInputType(props)) {
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_NAME) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                return undefined;
            },
            5 => {
                return SDL_CAPITALIZE_SENTENCES;
            },
            6 => {
                return SDL_CAPITALIZE_WORDS;
            },
            7 => {
                return SDL_CAPITALIZE_NONE;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetTextInputAutocorrect(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetBooleanProperty_REAL(props, "SDL.textinput.autocorrect", @"true" != 0);
}
pub export fn SDL_GetTextInputMultiline(props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    if (SDL_HasProperty_REAL(props, "SDL.textinput.multiline")) {
        return SDL_GetBooleanProperty_REAL(props, "SDL.textinput.multiline", @"false" != 0);
    }
    if (SDL_GetHintBoolean_REAL("SDL_RETURN_KEY_HIDES_IME", @"false" != 0)) {
        return @"false" != 0;
    } else {
        return @"true" != 0;
    }
}
pub fn AutoShowingScreenKeyboard() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_ENABLE_SCREEN_KEYBOARD");
    _ = &hint;
    if (!(hint != null)) {
        if (SDL_strcmp_REAL(_this.*.name, "x11") == @as(c_int, 0)) {
            hint = SDL_GetHint_REAL("SDL_ENABLE_STEAM_SCREEN_KEYBOARD");
        }
    }
    if (((!(hint != null) or (SDL_strcasecmp_REAL(hint, "auto") == @as(c_int, 0))) and !SDL_HasKeyboard_REAL()) or SDL_GetStringBoolean(hint, @"false" != 0)) {
        return @"true" != 0;
    } else {
        return @"false" != 0;
    }
}
pub export fn SDL_StartTextInput_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    return SDL_StartTextInputWithProperties_REAL(window, 0);
}
pub export fn SDL_StartTextInputWithProperties_REAL(window: [*c]SDL_Window, props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (window.*.text_input_props != 0) {
        SDL_DestroyProperties_REAL(window.*.text_input_props);
        window.*.text_input_props = 0;
    }
    if (props != 0) {
        window.*.text_input_props = SDL_CreateProperties_REAL();
        if (!(window.*.text_input_props != 0)) {
            return @"false" != 0;
        }
        if (!SDL_CopyProperties_REAL(props, window.*.text_input_props)) {
            return @"false" != 0;
        }
    }
    if (_this.*.SetTextInputProperties != null) {
        _this.*.SetTextInputProperties.?(_this, window, props);
    }
    if (!window.*.text_input_active) {
        if (_this.*.StartTextInput != null) {
            if (!_this.*.StartTextInput.?(_this, window, props)) {
                return @"false" != 0;
            }
        }
        window.*.text_input_active = @"true" != 0;
    }
    if (AutoShowingScreenKeyboard() and !SDL_ScreenKeyboardShown_REAL(window)) {
        if (_this.*.ShowScreenKeyboard != null) {
            _this.*.ShowScreenKeyboard.?(_this, window, props);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_TextInputActive_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    return window.*.text_input_active;
}
pub export fn SDL_StopTextInput_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (window.*.text_input_active) {
        if (_this.*.StopTextInput != null) {
            _ = _this.*.StopTextInput.?(_this, window);
        }
        window.*.text_input_active = @"false" != 0;
    }
    if (AutoShowingScreenKeyboard() and SDL_ScreenKeyboardShown_REAL(window)) {
        if (_this.*.HideScreenKeyboard != null) {
            _this.*.HideScreenKeyboard.?(_this, window);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SetTextInputArea_REAL(window: [*c]SDL_Window, rect: [*c]const SDL_Rect, cursor: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (rect != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf((&window.*.text_input_rect).*)) == @sizeOf(@TypeOf(rect.*)))) @compileError("static assertion failed \"sizeof (*(&window->text_input_rect)) == sizeof (*( rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(&window.*.text_input_rect)), @ptrCast(@alignCast(rect)), @sizeOf(@TypeOf(rect.*)));
        window.*.text_input_cursor = cursor;
    } else {
        _ = memset(@ptrCast(@alignCast(&window.*.text_input_rect)), 0, @sizeOf(@TypeOf(window.*.text_input_rect)));
        window.*.text_input_cursor = 0;
    }
    if ((_this != null) and (_this.*.UpdateTextInputArea != null)) {
        if (!_this.*.UpdateTextInputArea.?(_this, window)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_GetTextInputArea_REAL(window: [*c]SDL_Window, rect: [*c]SDL_Rect, cursor: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (rect != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(rect.*)) == @sizeOf(@TypeOf((&window.*.text_input_rect).*)))) @compileError("static assertion failed \"sizeof (*(rect)) == sizeof (*( &window->text_input_rect))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(rect)), @ptrCast(@alignCast(&window.*.text_input_rect)), @sizeOf(@TypeOf((&window.*.text_input_rect).*)));
    }
    if (cursor != null) {
        cursor.* = window.*.text_input_cursor;
    }
    return @"true" != 0;
}
pub export fn SDL_ClearComposition_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (_this.*.ClearComposition != null) {
        return _this.*.ClearComposition.?(_this, window);
    }
    return @"true" != 0;
}
pub export fn SDL_HasScreenKeyboardSupport_REAL() bool {
    @setEvalBranchQuota(100000);
    if ((_this != null) and (_this.*.HasScreenKeyboardSupport != null)) {
        return _this.*.HasScreenKeyboardSupport.?(_this);
    }
    return @"false" != 0;
}
pub export fn SDL_ScreenKeyboardShown_REAL(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    return _this.*.screen_keyboard_shown;
}
pub export fn SDL_SendScreenKeyboardShown() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null) or _this.*.screen_keyboard_shown) {
        return;
    }
    _this.*.screen_keyboard_shown = @"true" != 0;
    if (SDL_EventEnabled_REAL(SDL_EVENT_SCREEN_KEYBOARD_SHOWN)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_SCREEN_KEYBOARD_SHOWN;
        event.common.timestamp = 0;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_SendScreenKeyboardHidden() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null) or !_this.*.screen_keyboard_shown) {
        return;
    }
    _this.*.screen_keyboard_shown = @"false" != 0;
    if (SDL_EventEnabled_REAL(SDL_EVENT_SCREEN_KEYBOARD_HIDDEN)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_SCREEN_KEYBOARD_HIDDEN;
        event.common.timestamp = 0;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_GetMessageBoxCount() c_int {
    @setEvalBranchQuota(100000);
    return SDL_GetAtomicInt_REAL(&SDL_messagebox_count);
}
pub export fn SDL_ShowMessageBox_REAL(arg_messageboxdata: [*c]const SDL_MessageBoxData, arg_buttonID: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    var messageboxdata = arg_messageboxdata;
    _ = &messageboxdata;
    var buttonID = arg_buttonID;
    _ = &buttonID;
    var dummybutton: c_int = undefined;
    _ = &dummybutton;
    var result: bool = @"false" != 0;
    _ = &result;
    var show_cursor_prev: bool = undefined;
    _ = &show_cursor_prev;
    var current_window: [*c]SDL_Window = undefined;
    _ = &current_window;
    var mbdata: SDL_MessageBoxData = undefined;
    _ = &mbdata;
    if (!(messageboxdata != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("messageboxdata"))));
    }
    if (messageboxdata.*.numbuttons < @as(c_int, 0)) {
        return SDL_SetError_REAL("Invalid number of buttons");
    }
    var titleisstack: bool = @"false" != 0;
    _ = &titleisstack;
    var msgisstack: bool = @"false" != 0;
    _ = &msgisstack;
    var titlecpy: [*c]u8 = null;
    _ = &titlecpy;
    var msgcpy: [*c]u8 = null;
    _ = &msgcpy;
    if (messageboxdata.*.title != null) {
        const slen: usize = SDL_strlen_REAL(messageboxdata.*.title) +% @as(usize, 1);
        _ = &slen;
        titlecpy = blk: {
            (&titleisstack).* = (@sizeOf(u8) *% slen) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&titleisstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% slen)))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% slen))));
        };
        if (!(titlecpy != null)) {
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(titlecpy)), @ptrCast(@alignCast(messageboxdata.*.title)), slen);
    }
    if (messageboxdata.*.message != null) {
        const slen: usize = SDL_strlen_REAL(messageboxdata.*.message) +% @as(usize, 1);
        _ = &slen;
        msgcpy = blk: {
            (&msgisstack).* = (@sizeOf(u8) *% slen) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&msgisstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% slen)))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% slen))));
        };
        if (!(msgcpy != null)) {
            if (titleisstack) {
                SDL_free_REAL(@ptrCast(@alignCast(titlecpy)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(titlecpy)));
            }
            return @"false" != 0;
        }
        _ = memcpy(@ptrCast(@alignCast(msgcpy)), @ptrCast(@alignCast(messageboxdata.*.message)), slen);
    }
    _ = SDL_AddAtomicInt_REAL(&SDL_messagebox_count, 1);
    current_window = SDL_GetKeyboardFocus_REAL();
    _ = SDL_UpdateMouseCapture(@"false" != 0);
    _ = SDL_SetRelativeMouseMode(@"false" != 0);
    show_cursor_prev = SDL_CursorVisible_REAL();
    _ = SDL_ShowCursor_REAL();
    SDL_ResetKeyboard_REAL();
    if (!(buttonID != null)) {
        buttonID = &dummybutton;
    }
    _ = memcpy(@ptrCast(@alignCast(&mbdata)), @ptrCast(@alignCast(messageboxdata)), @sizeOf(@TypeOf(messageboxdata.*)));
    mbdata.title = titlecpy;
    if (!(mbdata.title != null)) {
        mbdata.title = "";
    }
    mbdata.message = msgcpy;
    if (!(mbdata.message != null)) {
        mbdata.message = "";
    }
    messageboxdata = &mbdata;
    _ = SDL_ClearError_REAL();
    if ((_this != null) and (_this.*.ShowMessageBox != null)) {
        result = _this.*.ShowMessageBox.?(_this, messageboxdata, buttonID);
    } else {
        var driver_name: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_DRIVER");
        _ = &driver_name;
        if ((driver_name != null) and (@as(c_int, driver_name.*) != @as(c_int, 0))) {
            var driver_attempt: [*c]const u8 = driver_name;
            _ = &driver_attempt;
            while (((driver_attempt != null) and (@as(c_int, driver_attempt.*) != @as(c_int, 0))) and !result) {
                var driver_attempt_end: [*c]const u8 = SDL_strchr_REAL(driver_attempt, ',');
                _ = &driver_attempt_end;
                var driver_attempt_len: usize = if (driver_attempt_end != null) @as(usize, @bitCast(@as(c_long, @divExact(@as(c_long, @bitCast(@intFromPtr(driver_attempt_end) -% @intFromPtr(driver_attempt))), @sizeOf(u8))))) else SDL_strlen_REAL(driver_attempt);
                _ = &driver_attempt_len;
                {
                    var i: c_int = 0;
                    _ = &i;
                    while (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                        if (((bootstrap[@bitCast(@as(isize, @intCast(i)))].*.ShowMessageBox != null) and (driver_attempt_len == SDL_strlen_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name))) and (SDL_strncasecmp_REAL(bootstrap[@bitCast(@as(isize, @intCast(i)))].*.name, driver_attempt, driver_attempt_len) == @as(c_int, 0))) {
                            if (bootstrap[@bitCast(@as(isize, @intCast(i)))].*.ShowMessageBox.?(messageboxdata, buttonID)) {
                                result = @"true" != 0;
                            }
                            break;
                        }
                    }
                }
                driver_attempt = @ptrCast(@alignCast(if (driver_attempt_end != null) @as(?*const anyopaque, @ptrCast(@alignCast(driver_attempt_end + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))))) else @as(?*const anyopaque, @ptrCast(@alignCast(@as(?*anyopaque, null))))));
            }
        } else {
            {
                var i: c_int = 0;
                _ = &i;
                while (bootstrap[@bitCast(@as(isize, @intCast(i)))] != null) : (i += 1) {
                    if ((bootstrap[@bitCast(@as(isize, @intCast(i)))].*.ShowMessageBox != null) and bootstrap[@bitCast(@as(isize, @intCast(i)))].*.ShowMessageBox.?(messageboxdata, buttonID)) {
                        result = @"true" != 0;
                        break;
                    }
                }
            }
        }
    }
    if (!result) {
        var @"error": [*c]const u8 = SDL_GetError_REAL();
        _ = &@"error";
        if (!(@as(c_int, @"error".*) != 0)) {
            _ = SDL_SetError_REAL("No message system available");
        }
    } else {
        _ = SDL_ClearError_REAL();
    }
    _ = SDL_AddAtomicInt_REAL(&SDL_messagebox_count, -@as(c_int, 1)) == @as(c_int, 1);
    if (current_window != null) {
        _ = SDL_RaiseWindow_REAL(current_window);
    }
    if (!show_cursor_prev) {
        _ = SDL_HideCursor_REAL();
    }
    _ = SDL_UpdateRelativeMouseMode();
    _ = SDL_UpdateMouseCapture(@"false" != 0);
    if (msgisstack) {
        SDL_free_REAL(@ptrCast(@alignCast(msgcpy)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(msgcpy)));
    }
    if (titleisstack) {
        SDL_free_REAL(@ptrCast(@alignCast(titlecpy)));
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(titlecpy)));
    }
    return result;
}
pub export fn SDL_ShowSimpleMessageBox_REAL(flags: SDL_MessageBoxFlags, title: [*c]const u8, message: [*c]const u8, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: SDL_MessageBoxData = undefined;
    _ = &data;
    var button: SDL_MessageBoxButtonData = undefined;
    _ = &button;
    _ = memset(@ptrCast(@alignCast(&data)), 0, @sizeOf(@TypeOf(data)));
    data.flags = flags;
    data.title = title;
    data.message = message;
    data.numbuttons = 1;
    data.buttons = &button;
    data.window = window;
    _ = memset(@ptrCast(@alignCast(&button)), 0, @sizeOf(@TypeOf(button)));
    button.flags |= SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT;
    button.flags |= SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT;
    button.text = "OK";
    return SDL_ShowMessageBox_REAL(&data, null);
}
pub export fn SDL_ShouldAllowTopmost() bool {
    @setEvalBranchQuota(100000);
    return SDL_GetHintBoolean_REAL("SDL_WINDOW_ALLOW_TOPMOST", @"true" != 0);
}
pub export fn SDL_ShowWindowSystemMenu_REAL(window: [*c]SDL_Window, x: c_int, y: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        _ = SDL_SetError_REAL("Operation invalid on popup windows");
        return @"false" != 0;
    }
    if (_this.*.ShowWindowSystemMenu != null) {
        _this.*.ShowWindowSystemMenu.?(window, x, y);
        return @"true" != 0;
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SetWindowHitTest_REAL(window: [*c]SDL_Window, callback: SDL_HitTest, callback_data: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.SetWindowHitTest != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    window.*.hit_test = callback;
    window.*.hit_test_data = callback_data;
    return _this.*.SetWindowHitTest.?(window, @as(?*anyopaque, @ptrCast(@alignCast(@constCast(callback)))) != @as(?*anyopaque, null));
}
pub export fn SDL_SetWindowShape_REAL(window: [*c]SDL_Window, shape: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!((window.*.flags & @as(c_ulong, 1073741824)) != 0)) {
        return SDL_SetError_REAL("Window must be created with SDL_WINDOW_TRANSPARENT");
    }
    props = SDL_GetWindowProperties_REAL(window);
    if (!(props != 0)) {
        return @"false" != 0;
    }
    if (shape != null) {
        surface = SDL_ConvertSurface_REAL(shape, SDL_PIXELFORMAT_ARGB32);
        if (!(surface != null)) {
            return @"false" != 0;
        }
    } else {
        surface = null;
    }
    if (!SDL_SetSurfaceProperty(props, "SDL.window.shape", surface)) {
        return @"false" != 0;
    }
    if (_this.*.UpdateWindowShape != null) {
        if (!_this.*.UpdateWindowShape.?(_this, window, surface)) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_OnApplicationWillTerminate_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_TERMINATING);
}
pub export fn SDL_OnApplicationDidReceiveMemoryWarning_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_LOW_MEMORY);
}
pub export fn SDL_OnApplicationWillEnterBackground_REAL() void {
    @setEvalBranchQuota(100000);
    if (_this != null) {
        var window: [*c]SDL_Window = undefined;
        _ = &window;
        {
            window = _this.*.windows;
            while (window != null) : (window = window.*.next) {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
            }
        }
        _ = SDL_SetKeyboardFocus(null);
    }
    SDL_SendAppEvent(SDL_EVENT_WILL_ENTER_BACKGROUND);
}
pub export fn SDL_OnApplicationDidEnterBackground_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_DID_ENTER_BACKGROUND);
}
pub export fn SDL_OnApplicationWillEnterForeground_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_WILL_ENTER_FOREGROUND);
}
pub export fn SDL_OnApplicationDidEnterForeground_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_DID_ENTER_FOREGROUND);
    if (_this != null) {
        var window: [*c]SDL_Window = undefined;
        _ = &window;
        {
            window = _this.*.windows;
            while (window != null) : (window = window.*.next) {
                _ = SDL_SetKeyboardFocus(window);
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
            }
        }
    }
}
pub export fn SDL_Vulkan_LoadLibrary_REAL(path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var result: bool = undefined;
    _ = &result;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (_this.*.vulkan_config.loader_loaded != 0) {
        if ((path != null) and (SDL_strcmp_REAL(path, @ptrCast(@alignCast(&_this.*.vulkan_config.loader_path))) != @as(c_int, 0))) {
            return SDL_SetError_REAL("Vulkan loader library already loaded");
        }
        result = @"true" != 0;
    } else {
        if (!(_this.*.Vulkan_LoadLibrary != null)) {
            return SDL_DllNotSupported("Vulkan");
        }
        result = _this.*.Vulkan_LoadLibrary.?(_this, path);
    }
    if (result) {
        _this.*.vulkan_config.loader_loaded += 1;
    }
    return result;
}
pub export fn SDL_Vulkan_GetVkGetInstanceProcAddr_REAL() SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!(_this.*.vulkan_config.loader_loaded != 0)) {
        _ = SDL_SetError_REAL("No Vulkan loader has been loaded");
        return null;
    }
    return _this.*.vulkan_config.vkGetInstanceProcAddr;
}
pub export fn SDL_Vulkan_UnloadLibrary_REAL() void {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return;
    }
    if (_this.*.vulkan_config.loader_loaded > @as(c_int, 0)) {
        if ((blk: {
            const ref = &_this.*.vulkan_config.loader_loaded;
            ref.* -= 1;
            break :blk ref.*;
        }) > @as(c_int, 0)) {
            return;
        }
        if (_this.*.Vulkan_UnloadLibrary != null) {
            _this.*.Vulkan_UnloadLibrary.?(_this);
        }
    }
}
pub export fn SDL_Vulkan_GetInstanceExtensions_REAL(arg_count: [*c]Uint32) [*c]const [*c]const u8 {
    @setEvalBranchQuota(100000);
    var count = arg_count;
    _ = &count;
    var tmpcount: Uint32 = 0;
    _ = &tmpcount;
    if (!(count != null)) {
        count = &tmpcount;
    }
    if (!(_this.*.Vulkan_GetInstanceExtensions != null)) {
        count.* = 0;
        _ = SDL_SetError_REAL("That operation is not supported");
        return null;
    }
    return _this.*.Vulkan_GetInstanceExtensions.?(_this, count);
}
pub export fn SDL_Vulkan_CreateSurface_REAL(window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return @"false" != 0;
    }
    if (!(_this.*.Vulkan_CreateSurface != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return @"false" != 0;
    }
    if (!(instance != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("instance"))));
    }
    if (!(surface != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
    }
    if (!((window.*.flags & @as(c_ulong, 268435456)) != 0)) {
        if ((window.*.flags & @as(c_ulong, 2)) != 0) {
            window.*.flags &= ~@as(c_ulong, 2);
            SDL_GL_UnloadLibrary_REAL();
        }
        if ((window.*.flags & @as(c_ulong, 536870912)) != 0) {
            window.*.flags &= ~@as(c_ulong, 536870912);
        }
        if (SDL_Vulkan_LoadLibrary_REAL(null)) {
            window.*.flags |= 268435456;
        } else {
            return SDL_SetError_REAL("failed to load Vulkan library");
        }
    }
    return _this.*.Vulkan_CreateSurface.?(_this, window, instance, allocator, surface);
}
pub export fn SDL_Vulkan_DestroySurface_REAL(instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) void {
    @setEvalBranchQuota(100000);
    if ((((_this != null) and (instance != null)) and (surface != null)) and (_this.*.Vulkan_DestroySurface != null)) {
        _this.*.Vulkan_DestroySurface.?(_this, instance, surface, allocator);
    }
}
pub export fn SDL_Vulkan_GetPresentationSupport_REAL(instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) bool {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return @"false" != 0;
    }
    if (!(instance != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("instance"))));
        return @"false" != 0;
    }
    if (!(physicalDevice != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("physicalDevice"))));
        return @"false" != 0;
    }
    if (_this.*.Vulkan_GetPresentationSupport != null) {
        return _this.*.Vulkan_GetPresentationSupport.?(_this, instance, physicalDevice, queueFamilyIndex);
    }
    return @"true" != 0;
}
pub export fn SDL_Metal_CreateView_REAL(window: [*c]SDL_Window) SDL_MetalView {
    @setEvalBranchQuota(100000);
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW)) {
        _ = SDL_SetError_REAL("Invalid window");
        return null;
    }
    if (!(_this.*.Metal_CreateView != null)) {
        _ = SDL_SetError_REAL("That operation is not supported");
        return null;
    }
    if (!((window.*.flags & @as(c_ulong, 536870912)) != 0)) {
        if ((window.*.flags & @as(c_ulong, 2)) != 0) {
            window.*.flags &= ~@as(c_ulong, 2);
            SDL_GL_UnloadLibrary_REAL();
        }
        if ((window.*.flags & @as(c_ulong, 268435456)) != 0) {
            window.*.flags &= ~@as(c_ulong, 268435456);
            SDL_Vulkan_UnloadLibrary_REAL();
        }
        window.*.flags |= 536870912;
    }
    return _this.*.Metal_CreateView.?(_this, window);
}
pub export fn SDL_Metal_DestroyView_REAL(view: SDL_MetalView) void {
    @setEvalBranchQuota(100000);
    if (((_this != null) and (view != null)) and (_this.*.Metal_DestroyView != null)) {
        _this.*.Metal_DestroyView.?(_this, view);
    }
}
pub export fn SDL_Metal_GetLayer_REAL(view: SDL_MetalView) ?*anyopaque {
    @setEvalBranchQuota(100000);
    if ((_this != null) and (_this.*.Metal_GetLayer != null)) {
        if (!(view != null)) {
            _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("view"))));
            return null;
        }
        return _this.*.Metal_GetLayer.?(_this, view);
    } else {
        _ = SDL_SetError_REAL("Metal is not supported.");
        return null;
    }
}
pub export fn SDL_GetCSSCursorName(id: SDL_SystemCursor, fallback_name: [*c][*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (id) {
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_DEFAULT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_TEXT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_WAIT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CROSSHAIR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_PROGRESS) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NWSE_RESIZE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NESW_RESIZE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_EW_RESIZE) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NS_RESIZE) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_MOVE) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NOT_ALLOWED) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_POINTER) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NW_RESIZE) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_N_RESIZE) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NE_RESIZE) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_E_RESIZE) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_SE_RESIZE) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_S_RESIZE) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_SW_RESIZE) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_W_RESIZE) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CONTEXT_MENU) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_HELP) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CELL) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_VERTICAL_TEXT) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ALIAS) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_COPY) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NO_DROP) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_GRAB) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_GRABBING) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_COL_RESIZE) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ROW_RESIZE) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ALL_SCROLL) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ZOOM_IN) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ZOOM_OUT) => {
                        sdl_pc = 53;
                        continue;
                    },
                    else => {
                        sdl_pc = 54;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return "default";
            },
            3 => {
                return "text";
            },
            4 => {
                return "wait";
            },
            5 => {
                return "crosshair";
            },
            6 => {
                return "progress";
            },
            7 => {
                if (fallback_name != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                fallback_name.* = "nw-resize";
                {
                    sdl_pc = 10;
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
                return "nwse-resize";
            },
            11 => {
                if (fallback_name != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                fallback_name.* = "ne-resize";
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
                return "nesw-resize";
            },
            15 => {
                if (fallback_name != null) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                fallback_name.* = "col-resize";
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
                return "ew-resize";
            },
            19 => {
                if (fallback_name != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                fallback_name.* = "row-resize";
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
                return "ns-resize";
            },
            23 => {
                if (fallback_name != null) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                fallback_name.* = "all-scroll";
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
                return "move";
            },
            27 => {
                return "not-allowed";
            },
            28 => {
                return "pointer";
            },
            29 => {
                return "nw-resize";
            },
            30 => {
                return "n-resize";
            },
            31 => {
                return "ne-resize";
            },
            32 => {
                return "e-resize";
            },
            33 => {
                return "se-resize";
            },
            34 => {
                return "s-resize";
            },
            35 => {
                return "sw-resize";
            },
            36 => {
                return "w-resize";
            },
            37 => {
                return "context-menu";
            },
            38 => {
                return "help";
            },
            39 => {
                return "cell";
            },
            40 => {
                return "vertical-text";
            },
            41 => {
                return "alias";
            },
            42 => {
                return "copy";
            },
            43 => {
                return "no-drop";
            },
            44 => {
                return "grab";
            },
            45 => {
                return "grabbing";
            },
            46 => {
                return "col-resize";
            },
            47 => {
                return "row-resize";
            },
            48 => {
                if (fallback_name != null) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                fallback_name.* = "move";
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
                return "all-scroll";
            },
            52 => {
                return "zoom-in";
            },
            53 => {
                return "zoom-out";
            },
            54 => {
                return "default";
            },
            else => unreachable,
        }
    }
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_ClearComposition = SDL_ClearComposition_REAL;
pub const SDL_CreatePopupWindow = SDL_CreatePopupWindow_REAL;
pub const SDL_CreateWindow = SDL_CreateWindow_REAL;
pub const SDL_CreateWindowWithProperties = SDL_CreateWindowWithProperties_REAL;
pub const SDL_DestroyWindow = SDL_DestroyWindow_REAL;
pub const SDL_DestroyWindowSurface = SDL_DestroyWindowSurface_REAL;
pub const SDL_DisableScreenSaver = SDL_DisableScreenSaver_REAL;
pub const SDL_EGL_GetCurrentConfig = SDL_EGL_GetCurrentConfig_REAL;
pub const SDL_EGL_GetCurrentDisplay = SDL_EGL_GetCurrentDisplay_REAL;
pub const SDL_EGL_GetProcAddress = SDL_EGL_GetProcAddress_REAL;
pub const SDL_EGL_GetWindowSurface = SDL_EGL_GetWindowSurface_REAL;
pub const SDL_EGL_SetAttributeCallbacks = SDL_EGL_SetAttributeCallbacks_REAL;
pub const SDL_EnableScreenSaver = SDL_EnableScreenSaver_REAL;
pub const SDL_FlashWindow = SDL_FlashWindow_REAL;
pub const SDL_GL_CreateContext = SDL_GL_CreateContext_REAL;
pub const SDL_GL_DestroyContext = SDL_GL_DestroyContext_REAL;
pub const SDL_GL_ExtensionSupported = SDL_GL_ExtensionSupported_REAL;
pub const SDL_GL_GetAttribute = SDL_GL_GetAttribute_REAL;
pub const SDL_GL_GetCurrentContext = SDL_GL_GetCurrentContext_REAL;
pub const SDL_GL_GetCurrentWindow = SDL_GL_GetCurrentWindow_REAL;
pub const SDL_GL_GetProcAddress = SDL_GL_GetProcAddress_REAL;
pub const SDL_GL_GetSwapInterval = SDL_GL_GetSwapInterval_REAL;
pub const SDL_GL_LoadLibrary = SDL_GL_LoadLibrary_REAL;
pub const SDL_GL_MakeCurrent = SDL_GL_MakeCurrent_REAL;
pub const SDL_GL_ResetAttributes = SDL_GL_ResetAttributes_REAL;
pub const SDL_GL_SetAttribute = SDL_GL_SetAttribute_REAL;
pub const SDL_GL_SetSwapInterval = SDL_GL_SetSwapInterval_REAL;
pub const SDL_GL_SwapWindow = SDL_GL_SwapWindow_REAL;
pub const SDL_GL_UnloadLibrary = SDL_GL_UnloadLibrary_REAL;
pub const SDL_GetClosestFullscreenDisplayMode = SDL_GetClosestFullscreenDisplayMode_REAL;
pub const SDL_GetCurrentDisplayMode = SDL_GetCurrentDisplayMode_REAL;
pub const SDL_GetCurrentDisplayOrientation = SDL_GetCurrentDisplayOrientation_REAL;
pub const SDL_GetCurrentVideoDriver = SDL_GetCurrentVideoDriver_REAL;
pub const SDL_GetDesktopDisplayMode = SDL_GetDesktopDisplayMode_REAL;
pub const SDL_GetDisplayBounds = SDL_GetDisplayBounds_REAL;
pub const SDL_GetDisplayContentScale = SDL_GetDisplayContentScale_REAL;
pub const SDL_GetDisplayForPoint = SDL_GetDisplayForPoint_REAL;
pub const SDL_GetDisplayForRect = SDL_GetDisplayForRect_REAL;
pub const SDL_GetDisplayForWindow = SDL_GetDisplayForWindow_REAL;
pub const SDL_GetDisplayName = SDL_GetDisplayName_REAL;
pub const SDL_GetDisplayProperties = SDL_GetDisplayProperties_REAL;
pub const SDL_GetDisplayUsableBounds = SDL_GetDisplayUsableBounds_REAL;
pub const SDL_GetDisplays = SDL_GetDisplays_REAL;
pub const SDL_GetFullscreenDisplayModes = SDL_GetFullscreenDisplayModes_REAL;
pub const SDL_GetGrabbedWindow = SDL_GetGrabbedWindow_REAL;
pub const SDL_GetNaturalDisplayOrientation = SDL_GetNaturalDisplayOrientation_REAL;
pub const SDL_GetNumVideoDrivers = SDL_GetNumVideoDrivers_REAL;
pub const SDL_GetPrimaryDisplay = SDL_GetPrimaryDisplay_REAL;
pub const SDL_GetSystemTheme = SDL_GetSystemTheme_REAL;
pub const SDL_GetTextInputArea = SDL_GetTextInputArea_REAL;
pub const SDL_GetVideoDriver = SDL_GetVideoDriver_REAL;
pub const SDL_GetWindowAspectRatio = SDL_GetWindowAspectRatio_REAL;
pub const SDL_GetWindowBordersSize = SDL_GetWindowBordersSize_REAL;
pub const SDL_GetWindowDisplayScale = SDL_GetWindowDisplayScale_REAL;
pub const SDL_GetWindowFlags = SDL_GetWindowFlags_REAL;
pub const SDL_GetWindowFromID = SDL_GetWindowFromID_REAL;
pub const SDL_GetWindowFullscreenMode = SDL_GetWindowFullscreenMode_REAL;
pub const SDL_GetWindowICCProfile = SDL_GetWindowICCProfile_REAL;
pub const SDL_GetWindowID = SDL_GetWindowID_REAL;
pub const SDL_GetWindowKeyboardGrab = SDL_GetWindowKeyboardGrab_REAL;
pub const SDL_GetWindowMaximumSize = SDL_GetWindowMaximumSize_REAL;
pub const SDL_GetWindowMinimumSize = SDL_GetWindowMinimumSize_REAL;
pub const SDL_GetWindowMouseGrab = SDL_GetWindowMouseGrab_REAL;
pub const SDL_GetWindowMouseRect = SDL_GetWindowMouseRect_REAL;
pub const SDL_GetWindowOpacity = SDL_GetWindowOpacity_REAL;
pub const SDL_GetWindowParent = SDL_GetWindowParent_REAL;
pub const SDL_GetWindowPixelDensity = SDL_GetWindowPixelDensity_REAL;
pub const SDL_GetWindowPixelFormat = SDL_GetWindowPixelFormat_REAL;
pub const SDL_GetWindowPosition = SDL_GetWindowPosition_REAL;
pub const SDL_GetWindowProperties = SDL_GetWindowProperties_REAL;
pub const SDL_GetWindowRelativeMouseMode = SDL_GetWindowRelativeMouseMode_REAL;
pub const SDL_GetWindowSafeArea = SDL_GetWindowSafeArea_REAL;
pub const SDL_GetWindowSize = SDL_GetWindowSize_REAL;
pub const SDL_GetWindowSizeInPixels = SDL_GetWindowSizeInPixels_REAL;
pub const SDL_GetWindowSurface = SDL_GetWindowSurface_REAL;
pub const SDL_GetWindowSurfaceVSync = SDL_GetWindowSurfaceVSync_REAL;
pub const SDL_GetWindowTitle = SDL_GetWindowTitle_REAL;
pub const SDL_GetWindows = SDL_GetWindows_REAL;
pub const SDL_HasScreenKeyboardSupport = SDL_HasScreenKeyboardSupport_REAL;
pub const SDL_HideWindow = SDL_HideWindow_REAL;
pub const SDL_MaximizeWindow = SDL_MaximizeWindow_REAL;
pub const SDL_Metal_CreateView = SDL_Metal_CreateView_REAL;
pub const SDL_Metal_DestroyView = SDL_Metal_DestroyView_REAL;
pub const SDL_Metal_GetLayer = SDL_Metal_GetLayer_REAL;
pub const SDL_MinimizeWindow = SDL_MinimizeWindow_REAL;
pub const SDL_OnApplicationDidEnterBackground = SDL_OnApplicationDidEnterBackground_REAL;
pub const SDL_OnApplicationDidEnterForeground = SDL_OnApplicationDidEnterForeground_REAL;
pub const SDL_OnApplicationDidReceiveMemoryWarning = SDL_OnApplicationDidReceiveMemoryWarning_REAL;
pub const SDL_OnApplicationWillEnterBackground = SDL_OnApplicationWillEnterBackground_REAL;
pub const SDL_OnApplicationWillEnterForeground = SDL_OnApplicationWillEnterForeground_REAL;
pub const SDL_OnApplicationWillTerminate = SDL_OnApplicationWillTerminate_REAL;
pub const SDL_RaiseWindow = SDL_RaiseWindow_REAL;
pub const SDL_RestoreWindow = SDL_RestoreWindow_REAL;
pub const SDL_ScreenKeyboardShown = SDL_ScreenKeyboardShown_REAL;
pub const SDL_ScreenSaverEnabled = SDL_ScreenSaverEnabled_REAL;
pub const SDL_SetTextInputArea = SDL_SetTextInputArea_REAL;
pub const SDL_SetWindowAlwaysOnTop = SDL_SetWindowAlwaysOnTop_REAL;
pub const SDL_SetWindowAspectRatio = SDL_SetWindowAspectRatio_REAL;
pub const SDL_SetWindowBordered = SDL_SetWindowBordered_REAL;
pub const SDL_SetWindowFocusable = SDL_SetWindowFocusable_REAL;
pub const SDL_SetWindowFullscreen = SDL_SetWindowFullscreen_REAL;
pub const SDL_SetWindowFullscreenMode = SDL_SetWindowFullscreenMode_REAL;
pub const SDL_SetWindowHitTest = SDL_SetWindowHitTest_REAL;
pub const SDL_SetWindowIcon = SDL_SetWindowIcon_REAL;
pub const SDL_SetWindowKeyboardGrab = SDL_SetWindowKeyboardGrab_REAL;
pub const SDL_SetWindowMaximumSize = SDL_SetWindowMaximumSize_REAL;
pub const SDL_SetWindowMinimumSize = SDL_SetWindowMinimumSize_REAL;
pub const SDL_SetWindowModal = SDL_SetWindowModal_REAL;
pub const SDL_SetWindowMouseGrab = SDL_SetWindowMouseGrab_REAL;
pub const SDL_SetWindowMouseRect = SDL_SetWindowMouseRect_REAL;
pub const SDL_SetWindowOpacity = SDL_SetWindowOpacity_REAL;
pub const SDL_SetWindowParent = SDL_SetWindowParent_REAL;
pub const SDL_SetWindowPosition = SDL_SetWindowPosition_REAL;
pub const SDL_SetWindowRelativeMouseMode = SDL_SetWindowRelativeMouseMode_REAL;
pub const SDL_SetWindowResizable = SDL_SetWindowResizable_REAL;
pub const SDL_SetWindowShape = SDL_SetWindowShape_REAL;
pub const SDL_SetWindowSize = SDL_SetWindowSize_REAL;
pub const SDL_SetWindowSurfaceVSync = SDL_SetWindowSurfaceVSync_REAL;
pub const SDL_SetWindowTitle = SDL_SetWindowTitle_REAL;
pub const SDL_ShowMessageBox = SDL_ShowMessageBox_REAL;
pub const SDL_ShowSimpleMessageBox = SDL_ShowSimpleMessageBox_REAL;
pub const SDL_ShowWindow = SDL_ShowWindow_REAL;
pub const SDL_ShowWindowSystemMenu = SDL_ShowWindowSystemMenu_REAL;
pub const SDL_StartTextInput = SDL_StartTextInput_REAL;
pub const SDL_StartTextInputWithProperties = SDL_StartTextInputWithProperties_REAL;
pub const SDL_StopTextInput = SDL_StopTextInput_REAL;
pub const SDL_SyncWindow = SDL_SyncWindow_REAL;
pub const SDL_TextInputActive = SDL_TextInputActive_REAL;
pub const SDL_UpdateWindowSurface = SDL_UpdateWindowSurface_REAL;
pub const SDL_UpdateWindowSurfaceRects = SDL_UpdateWindowSurfaceRects_REAL;
pub const SDL_Vulkan_CreateSurface = SDL_Vulkan_CreateSurface_REAL;
pub const SDL_Vulkan_DestroySurface = SDL_Vulkan_DestroySurface_REAL;
pub const SDL_Vulkan_GetInstanceExtensions = SDL_Vulkan_GetInstanceExtensions_REAL;
pub const SDL_Vulkan_GetPresentationSupport = SDL_Vulkan_GetPresentationSupport_REAL;
pub const SDL_Vulkan_GetVkGetInstanceProcAddr = SDL_Vulkan_GetVkGetInstanceProcAddr_REAL;
pub const SDL_Vulkan_LoadLibrary = SDL_Vulkan_LoadLibrary_REAL;
pub const SDL_Vulkan_UnloadLibrary = SDL_Vulkan_UnloadLibrary_REAL;
pub const SDL_WindowHasSurface = SDL_WindowHasSurface_REAL;
pub const SDL_SetWindowProgressState = SDL_SetWindowProgressState_REAL;
pub const SDL_SetWindowProgressValue = SDL_SetWindowProgressValue_REAL;
pub const SDL_GetWindowProgressState = SDL_GetWindowProgressState_REAL;
pub const SDL_GetWindowProgressValue = SDL_GetWindowProgressValue_REAL;
pub const SDL_SetWindowFillDocument = SDL_SetWindowFillDocument_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BLENDMODE_NONE = @as(c_uint, 0x00000000);
pub const SDL_WINDOWPOS_UNDEFINED_MASK = __helpers.promoteIntLiteral(c_uint, 0x1FFF0000, .hex);
pub const SDL_WINDOWPOS_CENTERED_MASK = __helpers.promoteIntLiteral(c_uint, 0x2FFF0000, .hex);
pub const SDL_GL_CONTEXT_PROFILE_CORE = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = @as(c_int, 0x0002);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_DEBUG_FLAG = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = @as(c_int, 0x0002);
pub const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = @as(c_int, 0x0004);
pub const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = @as(c_int, 0x0008);
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = @as(c_int, 0x0000);
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = @as(c_int, 0x0001);
pub const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = @as(c_int, 0x0000);
pub const SDL_INIT_VIDEO = @as(c_uint, 0x00000020);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = @as(c_uint, 0x00000001);
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = @as(c_uint, 0x00000002);
pub const SDL_INTERNAL_SURFACE_DONTFREE = @as(c_uint, 0x00000001);
pub const GL_DEPTH_BITS = @as(c_int, 0x0D56);
pub const GL_ACCUM_RED_BITS = @as(c_int, 0x0D58);
pub const GL_ACCUM_GREEN_BITS = @as(c_int, 0x0D59);
pub const GL_ACCUM_BLUE_BITS = @as(c_int, 0x0D5A);
pub const GL_ACCUM_ALPHA_BITS = @as(c_int, 0x0D5B);
pub const GL_STENCIL_BITS = @as(c_int, 0x0D57);
pub const GL_NONE = @as(c_int, 0);
pub const GL_BACK_LEFT = @as(c_int, 0x0402);
pub const GL_ALPHA_BITS = @as(c_int, 0x0D55);
pub const GL_RED_BITS = @as(c_int, 0x0D52);
pub const GL_GREEN_BITS = @as(c_int, 0x0D53);
pub const GL_BLUE_BITS = @as(c_int, 0x0D54);
pub const GL_DOUBLEBUFFER = @as(c_int, 0x0C32);
pub const GL_STEREO = @as(c_int, 0x0C33);
pub const GL_DEPTH = @as(c_int, 0x1801);
pub const GL_STENCIL = @as(c_int, 0x1802);
pub const GL_VERSION = @as(c_int, 0x1F02);
pub const GL_EXTENSIONS = @as(c_int, 0x1F03);
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_INVALID_ENUM = @as(c_int, 0x0500);
pub const GL_INVALID_VALUE = @as(c_int, 0x0501);
pub const GL_SAMPLE_BUFFERS = __helpers.promoteIntLiteral(c_int, 0x80A8, .hex);
pub const GL_SAMPLES = __helpers.promoteIntLiteral(c_int, 0x80A9, .hex);
pub const GL_NUM_EXTENSIONS = __helpers.promoteIntLiteral(c_int, 0x821D, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = __helpers.promoteIntLiteral(c_int, 0x8212, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = __helpers.promoteIntLiteral(c_int, 0x8213, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = __helpers.promoteIntLiteral(c_int, 0x8214, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = __helpers.promoteIntLiteral(c_int, 0x8215, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = __helpers.promoteIntLiteral(c_int, 0x8216, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = __helpers.promoteIntLiteral(c_int, 0x8217, .hex);
pub const GL_FRAMEBUFFER_DEFAULT = __helpers.promoteIntLiteral(c_int, 0x8218, .hex);
pub const GL_DRAW_FRAMEBUFFER_BINDING = __helpers.promoteIntLiteral(c_int, 0x8CA6, .hex);
pub const GL_DRAW_FRAMEBUFFER = __helpers.promoteIntLiteral(c_int, 0x8CA9, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = __helpers.promoteIntLiteral(c_int, 0x8CD0, .hex);
pub const GL_FRAMEBUFFER = __helpers.promoteIntLiteral(c_int, 0x8D40, .hex);
pub const GL_FRAMEBUFFER_SRGB = __helpers.promoteIntLiteral(c_int, 0x8DB9, .hex);
pub const GL_CONTEXT_RELEASE_BEHAVIOR = __helpers.promoteIntLiteral(c_int, 0x82FB, .hex);
pub const GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = __helpers.promoteIntLiteral(c_int, 0x82FC, .hex);
pub const GL_RGBA_FLOAT_MODE_ARB = __helpers.promoteIntLiteral(c_int, 0x8820, .hex);
