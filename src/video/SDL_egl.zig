// /*
//  *  Simple DirectMedia Layer
//  *  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
//  *
//  *  This software is provided 'as-is', without any express or implied
//  *  warranty.  In no event will the authors be held liable for any damages
//  *  arising from the use of this software.
//  *
//  *  Permission is granted to anyone to use this software for any purpose,
//  *  including commercial applications, and to alter it and redistribute it
//  *  freely, subject to the following restrictions:
//  *
//  *  1. The origin of this software must not be misrepresented; you must not
//  *     claim that you wrote the original software. If you use this software
//  *     in a product, an acknowledgment in the product documentation would be
//  *     appreciated but is not required.
//  *  2. Altered source versions must be plainly marked as such, and must not be
//  *     misrepresented as being the original software.
//  *  3. This notice may not be removed or altered from any source distribution.
//  */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub const __helpers = @import("std").zig.c_translation.helpers;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_sscanf_REAL(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
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
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
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
pub const SDL_ClipboardDataCallback = ?*const fn (userdata: ?*anyopaque, mime_type: [*c]const u8, size: [*c]usize) callconv(.c) ?*const anyopaque;
pub const SDL_ClipboardCleanupCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
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
pub const enum_SDL_DisplayOrientation = c_uint;
pub const SDL_DisplayOrientation = enum_SDL_DisplayOrientation;
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const struct_SDL_Renderer = opaque {
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
    renderers: [*c]?*SDL_Renderer = null,
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
pub extern fn SDL_GL_GetProcAddress_REAL(proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_GL_ExtensionSupported_REAL(extension: [*c]const u8) bool;
pub extern fn SDL_GL_GetCurrentContext_REAL() SDL_GLContext;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
const struct_unnamed_14 = extern struct {
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
const struct_unnamed_15 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_VideoData = opaque {};
pub const SDL_VideoData = struct_SDL_VideoData;
pub const struct_SDL_GLDriverData_16 = opaque {};
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
pub const struct_SDL_PrivateGLESData_17 = opaque {};
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
    gl_config: struct_unnamed_14 = @import("std").mem.zeroes(struct_unnamed_14),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_15 = @import("std").mem.zeroes(struct_unnamed_15),
    internal: ?*SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_16 = null,
    egl_data: [*c]struct_SDL_EGL_VideoData = null,
    gles_data: ?*struct_SDL_PrivateGLESData_17 = null,
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
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub const NativeDisplayType = EGLNativeDisplayType;
pub const NativeWindowType = EGLNativeWindowType;
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
pub const SDL_EGL_VideoData = struct_SDL_EGL_VideoData;
pub const SDL_EGL_DISPLAY_EXTENSION: c_int = 0;
pub const SDL_EGL_CLIENT_EXTENSION: c_int = 1;
pub const enum_SDL_EGL_ExtensionType = c_uint;
pub const SDL_EGL_ExtensionType = enum_SDL_EGL_ExtensionType;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub const GLenum = c_uint;
pub const GLint = c_int;
pub const PFNGLGETINTEGERVPROC = ?*const fn (pname: GLenum, params: [*c]GLint) callconv(.c) void;
pub fn SDL_EGL_GetErrorName(eglErrorCode: EGLint) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (eglErrorCode) {
                    EGL_SUCCESS => {
                        sdl_pc = 2;
                        continue;
                    },
                    EGL_NOT_INITIALIZED => {
                        sdl_pc = 3;
                        continue;
                    },
                    EGL_BAD_ACCESS => {
                        sdl_pc = 4;
                        continue;
                    },
                    EGL_BAD_ALLOC => {
                        sdl_pc = 5;
                        continue;
                    },
                    EGL_BAD_ATTRIBUTE => {
                        sdl_pc = 6;
                        continue;
                    },
                    EGL_BAD_CONTEXT => {
                        sdl_pc = 7;
                        continue;
                    },
                    EGL_BAD_CONFIG => {
                        sdl_pc = 8;
                        continue;
                    },
                    EGL_BAD_CURRENT_SURFACE => {
                        sdl_pc = 9;
                        continue;
                    },
                    EGL_BAD_DISPLAY => {
                        sdl_pc = 10;
                        continue;
                    },
                    EGL_BAD_SURFACE => {
                        sdl_pc = 11;
                        continue;
                    },
                    EGL_BAD_MATCH => {
                        sdl_pc = 12;
                        continue;
                    },
                    EGL_BAD_PARAMETER => {
                        sdl_pc = 13;
                        continue;
                    },
                    EGL_BAD_NATIVE_PIXMAP => {
                        sdl_pc = 14;
                        continue;
                    },
                    EGL_BAD_NATIVE_WINDOW => {
                        sdl_pc = 15;
                        continue;
                    },
                    EGL_CONTEXT_LOST => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                return "";
            },
            2 => {
                return "EGL_SUCCESS";
            },
            3 => {
                return "EGL_NOT_INITIALIZED";
            },
            4 => {
                return "EGL_BAD_ACCESS";
            },
            5 => {
                return "EGL_BAD_ALLOC";
            },
            6 => {
                return "EGL_BAD_ATTRIBUTE";
            },
            7 => {
                return "EGL_BAD_CONTEXT";
            },
            8 => {
                return "EGL_BAD_CONFIG";
            },
            9 => {
                return "EGL_BAD_CURRENT_SURFACE";
            },
            10 => {
                return "EGL_BAD_DISPLAY";
            },
            11 => {
                return "EGL_BAD_SURFACE";
            },
            12 => {
                return "EGL_BAD_MATCH";
            },
            13 => {
                return "EGL_BAD_PARAMETER";
            },
            14 => {
                return "EGL_BAD_NATIVE_PIXMAP";
            },
            15 => {
                return "EGL_BAD_NATIVE_WINDOW";
            },
            16 => {
                return "EGL_CONTEXT_LOST";
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_EGL_SetErrorEx(message: [*c]const u8, eglFunctionName: [*c]const u8, eglErrorCode: EGLint) bool {
    @setEvalBranchQuota(100000);
    var errorText: [*c]const u8 = SDL_EGL_GetErrorName(eglErrorCode);
    _ = &errorText;
    var altErrorText: [32]u8 = undefined;
    _ = &altErrorText;
    if (@as(c_int, errorText[@as(c_int, 0)]) == @as(c_int, '\x00')) {
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&altErrorText)), @sizeOf(@TypeOf(altErrorText)) / @sizeOf(@TypeOf(altErrorText[@as(c_int, 0)])), "0x%x", @as(c_uint, @bitCast(@as(c_int, eglErrorCode))));
        errorText = @ptrCast(@alignCast(&altErrorText));
    }
    return SDL_SetError_REAL("%s (call to %s failed, reporting an error of %s)", message, eglFunctionName, errorText);
}
pub export fn SDL_EGL_HasExtension(_this: [*c]SDL_VideoDevice, arg_type: SDL_EGL_ExtensionType, ext: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var ext_len: usize = undefined;
    _ = &ext_len;
    var ext_override: [*c]const u8 = undefined;
    _ = &ext_override;
    var egl_extstr: [*c]const u8 = undefined;
    _ = &egl_extstr;
    var ext_start: [*c]const u8 = undefined;
    _ = &ext_start;
    var disable_ext: c_int = undefined;
    _ = &disable_ext;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if ((!(ext != null) or (@as(c_int, ext.*) == @as(c_int, 0))) or (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strchr_REAL(ext, ' ')))) != @as(?*anyopaque, null))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                ext_override = SDL_GetHint_REAL(ext);
                if (ext_override != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                disable_ext = SDL_atoi_REAL(ext_override);
                if (((disable_ext & @as(c_int, 1)) != 0) and (@"type" == @as(SDL_EGL_ExtensionType, SDL_EGL_DISPLAY_EXTENSION))) {
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
                ext_len = SDL_strlen_REAL(ext);
                switch (@"type") {
                    @as(SDL_EGL_ExtensionType, SDL_EGL_DISPLAY_EXTENSION) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_EGL_ExtensionType, SDL_EGL_CLIENT_EXTENSION) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            7 => {
                return @"false" != 0;
            },
            8 => {
                if (((disable_ext & @as(c_int, 2)) != 0) and (@"type" == @as(SDL_EGL_ExtensionType, SDL_EGL_CLIENT_EXTENSION))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
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
                if (egl_extstr != null) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            14 => {
                egl_extstr = _this.*.egl_data.*.eglQueryString.?(_this.*.egl_data.*.egl_display, EGL_EXTENSIONS);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            15 => {
                egl_extstr = _this.*.egl_data.*.eglQueryString.?(null, EGL_EXTENSIONS);
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            16 => {
                return @"false" != 0;
            },
            17 => {
                ext_start = egl_extstr;
                {
                    sdl_pc = 20;
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
                return @"false" != 0;
            },
            20 => {
                if (@as(c_int, ext_start.*) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                ext_start = SDL_strstr_REAL(ext_start, ext);
                if (!(ext_start != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                return @"false" != 0;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if ((ext_start == egl_extstr) or (@as(c_int, (ext_start - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))).*) == @as(c_int, ' '))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if ((@as(c_int, ext_start[ext_len]) == @as(c_int, ' ')) or (@as(c_int, ext_start[ext_len]) == @as(c_int, 0))) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
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
                ext_start += ext_len;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                return @"true" != 0;
            },
            30 => {
                {
                    sdl_pc = 31;
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
                if ((@as(c_int, ext_start.*) != @as(c_int, ' ')) and (@as(c_int, ext_start.*) != @as(c_int, 0))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                ext_start += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_EGL_GetProcAddressInternal(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer {
    @setEvalBranchQuota(100000);
    var result: SDL_FunctionPointer = null;
    _ = &result;
    if (_this.*.egl_data != null) {
        const eglver: Uint32 = (@as(Uint32, @bitCast(@as(c_int, _this.*.egl_data.*.egl_version_major))) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, _this.*.egl_data.*.egl_version_minor)));
        _ = &eglver;
        const is_egl_15_or_later: bool = eglver >= ((@as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, 16))) | @as(Uint32, 5));
        _ = &is_egl_15_or_later;
        if ((!(result != null) and is_egl_15_or_later) and (_this.*.egl_data.*.eglGetProcAddress != null)) {
            result = _this.*.egl_data.*.eglGetProcAddress.?(proc);
        }
        if (!(result != null)) {
            result = SDL_LoadFunction_REAL(_this.*.egl_data.*.opengl_dll_handle, proc);
        }
        if ((!(result != null) and !is_egl_15_or_later) and (_this.*.egl_data.*.eglGetProcAddress != null)) {
            result = _this.*.egl_data.*.eglGetProcAddress.?(proc);
        }
    }
    return result;
}
pub export fn SDL_EGL_UnloadLibrary(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    if (_this.*.egl_data != null) {
        if (_this.*.egl_data.*.egl_display != null) {
            _ = _this.*.egl_data.*.eglTerminate.?(_this.*.egl_data.*.egl_display);
            _this.*.egl_data.*.egl_display = null;
        }
        if (_this.*.egl_data.*.egl_dll_handle != null) {
            SDL_UnloadObject_REAL(_this.*.egl_data.*.egl_dll_handle);
            _this.*.egl_data.*.egl_dll_handle = null;
        }
        if (_this.*.egl_data.*.opengl_dll_handle != null) {
            SDL_UnloadObject_REAL(_this.*.egl_data.*.opengl_dll_handle);
            _this.*.egl_data.*.opengl_dll_handle = null;
        }
        SDL_free_REAL(@ptrCast(@alignCast(_this.*.egl_data)));
        _this.*.egl_data = null;
    }
}
pub fn SDL_EGL_LoadLibraryInternal(_this: [*c]SDL_VideoDevice, egl_path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var egl_dll_handle: ?*SDL_SharedObject = null;
    _ = &egl_dll_handle;
    var opengl_dll_handle: ?*SDL_SharedObject = null;
    _ = &opengl_dll_handle;
    var path: [*c]const u8 = null;
    _ = &path;
    path = SDL_GetHint_REAL("SDL_OPENGL_LIBRARY");
    if (path != null) {
        opengl_dll_handle = SDL_LoadObject_REAL(path);
    }
    if (!(opengl_dll_handle != null)) {
        if (_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) {
            if (_this.*.gl_config.major_version > @as(c_int, 1)) {
                if (!(opengl_dll_handle != null)) {
                    path = "libGLESv2.so.2";
                    opengl_dll_handle = SDL_LoadObject_REAL(path);
                }
            } else {
                if (!(opengl_dll_handle != null)) {
                    path = "libGLESv1_CM.so.1";
                    opengl_dll_handle = SDL_LoadObject_REAL(path);
                }
                if (!(opengl_dll_handle != null)) {
                    path = "libGLES_CM.so.1";
                    opengl_dll_handle = SDL_LoadObject_REAL(path);
                }
            }
        } else {
            if (!(opengl_dll_handle != null)) {
                path = "libGL.so.1";
                opengl_dll_handle = SDL_LoadObject_REAL(path);
            }
            if (!(opengl_dll_handle != null)) {
                path = "libOpenGL.so.0";
                opengl_dll_handle = SDL_LoadObject_REAL(path);
            }
        }
    }
    _this.*.egl_data.*.opengl_dll_handle = opengl_dll_handle;
    if (!(opengl_dll_handle != null)) {
        return SDL_SetError_REAL("Could not initialize OpenGL / GLES library");
    }
    if (egl_path != null) {
        egl_dll_handle = SDL_LoadObject_REAL(egl_path);
    }
    if (!(egl_dll_handle != null) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(egl_dll_handle, "eglChooseConfig"))))) == @as(?*anyopaque, null))) {
        if (egl_dll_handle != null) {
            SDL_UnloadObject_REAL(egl_dll_handle);
        }
        path = SDL_GetHint_REAL("SDL_EGL_LIBRARY");
        if (!(path != null)) {
            path = "libEGL.so.1";
        }
        egl_dll_handle = SDL_LoadObject_REAL(path);
        if (!(egl_dll_handle != null) or (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(egl_dll_handle, "eglChooseConfig"))))) == @as(?*anyopaque, null))) {
            if (egl_dll_handle != null) {
                SDL_UnloadObject_REAL(egl_dll_handle);
            }
            return SDL_SetError_REAL("Could not load EGL library");
        }
        _ = SDL_ClearError_REAL();
    }
    _this.*.egl_data.*.egl_dll_handle = egl_dll_handle;
    _this.*.egl_data.*.eglGetDisplay = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglGetDisplay"))));
    if (!(_this.*.egl_data.*.eglGetDisplay != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglGetDisplay");
    }
    _this.*.egl_data.*.eglInitialize = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglInitialize"))));
    if (!(_this.*.egl_data.*.eglInitialize != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglInitialize");
    }
    _this.*.egl_data.*.eglTerminate = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglTerminate"))));
    if (!(_this.*.egl_data.*.eglTerminate != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglTerminate");
    }
    _this.*.egl_data.*.eglGetProcAddress = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglGetProcAddress"))));
    if (!(_this.*.egl_data.*.eglGetProcAddress != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglGetProcAddress");
    }
    _this.*.egl_data.*.eglChooseConfig = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglChooseConfig"))));
    if (!(_this.*.egl_data.*.eglChooseConfig != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglChooseConfig");
    }
    _this.*.egl_data.*.eglCreateContext = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglCreateContext"))));
    if (!(_this.*.egl_data.*.eglCreateContext != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglCreateContext");
    }
    _this.*.egl_data.*.eglDestroyContext = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglDestroyContext"))));
    if (!(_this.*.egl_data.*.eglDestroyContext != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglDestroyContext");
    }
    _this.*.egl_data.*.eglCreatePbufferSurface = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglCreatePbufferSurface"))));
    if (!(_this.*.egl_data.*.eglCreatePbufferSurface != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglCreatePbufferSurface");
    }
    _this.*.egl_data.*.eglCreateWindowSurface = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglCreateWindowSurface"))));
    if (!(_this.*.egl_data.*.eglCreateWindowSurface != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglCreateWindowSurface");
    }
    _this.*.egl_data.*.eglDestroySurface = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglDestroySurface"))));
    if (!(_this.*.egl_data.*.eglDestroySurface != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglDestroySurface");
    }
    _this.*.egl_data.*.eglMakeCurrent = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglMakeCurrent"))));
    if (!(_this.*.egl_data.*.eglMakeCurrent != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglMakeCurrent");
    }
    _this.*.egl_data.*.eglSwapBuffers = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglSwapBuffers"))));
    if (!(_this.*.egl_data.*.eglSwapBuffers != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglSwapBuffers");
    }
    _this.*.egl_data.*.eglSwapInterval = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglSwapInterval"))));
    if (!(_this.*.egl_data.*.eglSwapInterval != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglSwapInterval");
    }
    _this.*.egl_data.*.eglQueryString = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglQueryString"))));
    if (!(_this.*.egl_data.*.eglQueryString != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglQueryString");
    }
    _this.*.egl_data.*.eglGetConfigAttrib = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglGetConfigAttrib"))));
    if (!(_this.*.egl_data.*.eglGetConfigAttrib != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglGetConfigAttrib");
    }
    _this.*.egl_data.*.eglWaitNative = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglWaitNative"))));
    if (!(_this.*.egl_data.*.eglWaitNative != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglWaitNative");
    }
    _this.*.egl_data.*.eglWaitGL = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglWaitGL"))));
    if (!(_this.*.egl_data.*.eglWaitGL != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglWaitGL");
    }
    _this.*.egl_data.*.eglBindAPI = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglBindAPI"))));
    if (!(_this.*.egl_data.*.eglBindAPI != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglBindAPI");
    }
    _this.*.egl_data.*.eglGetError = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglGetError"))));
    if (!(_this.*.egl_data.*.eglGetError != null)) {
        return SDL_SetError_REAL("Could not retrieve EGL function eglGetError");
    }
    _this.*.egl_data.*.eglQueryDevicesEXT = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglQueryDevicesEXT"))));
    _this.*.egl_data.*.eglGetPlatformDisplayEXT = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglGetPlatformDisplayEXT"))));
    _this.*.egl_data.*.eglCreateSyncKHR = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglCreateSyncKHR"))));
    _this.*.egl_data.*.eglDestroySyncKHR = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglDestroySyncKHR"))));
    _this.*.egl_data.*.eglDupNativeFenceFDANDROID = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglDupNativeFenceFDANDROID"))));
    _this.*.egl_data.*.eglWaitSyncKHR = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglWaitSyncKHR"))));
    _this.*.egl_data.*.eglClientWaitSyncKHR = @ptrCast(@alignCast(@constCast(_this.*.egl_data.*.eglGetProcAddress.?("eglClientWaitSyncKHR"))));
    if (path != null) {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&_this.*.gl_config.driver_path)), path, @sizeOf(@TypeOf(_this.*.gl_config.driver_path)) -% @as(c_ulong, 1));
    } else {
        @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
    }
    return @"true" != 0;
}
pub export fn SDL_EGL_LoadLibraryOnly(_this: [*c]SDL_VideoDevice, egl_path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (_this.*.egl_data != null) {
        return SDL_SetError_REAL("EGL context already created");
    }
    _this.*.egl_data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_EGL_VideoData))));
    if (!(_this.*.egl_data != null)) {
        return @"false" != 0;
    }
    if (!SDL_EGL_LoadLibraryInternal(_this, egl_path)) {
        SDL_free_REAL(@ptrCast(@alignCast(_this.*.egl_data)));
        _this.*.egl_data = null;
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_EGL_GetVersion(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (_this.*.egl_data.*.eglQueryString != null) {
        var egl_version: [*c]const u8 = _this.*.egl_data.*.eglQueryString.?(_this.*.egl_data.*.egl_display, EGL_VERSION);
        _ = &egl_version;
        if (egl_version != null) {
            var major: c_int = 0;
            _ = &major;
            var minor: c_int = 0;
            _ = &minor;
            if (SDL_sscanf_REAL(egl_version, "%d.%d", &major, &minor) == @as(c_int, 2)) {
                _this.*.egl_data.*.egl_version_major = major;
                _this.*.egl_data.*.egl_version_minor = minor;
            } else {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "Could not parse EGL version string: %s", egl_version);
            }
        }
    }
}
pub export fn SDL_EGL_LoadLibrary(_this: [*c]SDL_VideoDevice, egl_path: [*c]const u8, native_display: NativeDisplayType) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_EGL_LoadLibraryOnly(_this, egl_path)) {
        return @"false" != 0;
    }
    _this.*.egl_data.*.egl_display = null;
    var platform: EGLenum = @bitCast(@as(c_int, _this.*.gl_config.egl_platform));
    _ = &platform;
    if (platform != 0) {
        SDL_EGL_GetVersion(_this);
        if ((_this.*.egl_data.*.egl_version_major == @as(c_int, 1)) and (_this.*.egl_data.*.egl_version_minor == @as(c_int, 5))) {
            _this.*.egl_data.*.eglGetPlatformDisplay = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.egl_data.*.egl_dll_handle, "eglGetPlatformDisplay"))));
            if (!(_this.*.egl_data.*.eglGetPlatformDisplay != null)) {
                return SDL_SetError_REAL("Could not retrieve EGL function eglGetPlatformDisplay");
            }
        }
        if (_this.*.egl_data.*.eglGetPlatformDisplay != null) {
            var attribs: [*c]EGLAttrib = null;
            _ = &attribs;
            if (_this.*.egl_platformattrib_callback != null) {
                attribs = _this.*.egl_platformattrib_callback.?(_this.*.egl_attrib_callback_userdata);
                if (!(attribs != null)) {
                    _this.*.gl_config.driver_loaded = 0;
                    @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
                    return SDL_SetError_REAL("EGL platform attribute callback returned NULL pointer");
                }
            }
            _this.*.egl_data.*.egl_display = _this.*.egl_data.*.eglGetPlatformDisplay.?(platform, @ptrFromInt(@as(usize, @intCast(@intFromPtr(native_display)))), attribs);
            SDL_free_REAL(@ptrCast(@alignCast(attribs)));
        } else {
            if (SDL_EGL_HasExtension(_this, SDL_EGL_CLIENT_EXTENSION, "EGL_EXT_platform_base")) {
                _this.*.egl_data.*.eglGetPlatformDisplayEXT = @ptrCast(@alignCast(@constCast(SDL_EGL_GetProcAddressInternal(_this, "eglGetPlatformDisplayEXT"))));
                if (_this.*.egl_data.*.eglGetPlatformDisplayEXT != null) {
                    _this.*.egl_data.*.egl_display = _this.*.egl_data.*.eglGetPlatformDisplayEXT.?(platform, @ptrFromInt(@as(usize, @intCast(@intFromPtr(native_display)))), null);
                }
            }
        }
    }
    if (((_this.*.egl_data.*.egl_display == @as(EGLDisplay, null)) and (_this.*.egl_data.*.eglGetDisplay != null)) and SDL_GetHintBoolean_REAL("SDL_VIDEO_EGL_ALLOW_GETDISPLAY_FALLBACK", @"true" != 0)) {
        _this.*.egl_data.*.egl_display = _this.*.egl_data.*.eglGetDisplay.?(native_display);
    }
    if (_this.*.egl_data.*.egl_display == @as(EGLDisplay, null)) {
        _this.*.gl_config.driver_loaded = 0;
        @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
        return SDL_SetError_REAL("Could not get EGL display");
    }
    if (_this.*.egl_data.*.eglInitialize.?(_this.*.egl_data.*.egl_display, null, null) != @as(EGLBoolean, EGL_TRUE)) {
        _this.*.gl_config.driver_loaded = 0;
        @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
        return SDL_SetError_REAL("Could not initialize EGL");
    }
    SDL_EGL_GetVersion(_this);
    _this.*.egl_data.*.is_offscreen = @"false" != 0;
    return @"true" != 0;
}
pub export fn SDL_EGL_InitializeOffscreen(_this: [*c]SDL_VideoDevice, arg_device: c_int) bool {
    @setEvalBranchQuota(100000);
    var device = arg_device;
    _ = &device;
    var egl_devices: [8]?*anyopaque = undefined;
    _ = &egl_devices;
    var num_egl_devices: EGLint = 0;
    _ = &num_egl_devices;
    var egl_device_hint: [*c]const u8 = undefined;
    _ = &egl_device_hint;
    if (_this.*.gl_config.driver_loaded <= @as(c_int, 0)) {
        return SDL_SetError_REAL("SDL_EGL_LoadLibraryOnly() has not been called or has failed.");
    }
    if (!(_this.*.egl_data.*.eglQueryDevicesEXT != null)) {
        return SDL_SetError_REAL("eglQueryDevicesEXT is missing (EXT_device_enumeration not supported by the drivers?)");
    }
    if (!(_this.*.egl_data.*.eglGetPlatformDisplayEXT != null)) {
        return SDL_SetError_REAL("eglGetPlatformDisplayEXT is missing (EXT_platform_base not supported by the drivers?)");
    }
    if (_this.*.egl_data.*.eglQueryDevicesEXT.?(SDL_EGL_MAX_DEVICES, @ptrCast(@alignCast(&egl_devices)), &num_egl_devices) != @as(EGLBoolean, EGL_TRUE)) {
        return SDL_SetError_REAL("eglQueryDevicesEXT() failed");
    }
    egl_device_hint = SDL_GetHint_REAL("SDL_HINT_EGL_DEVICE");
    if (egl_device_hint != null) {
        device = SDL_atoi_REAL(egl_device_hint);
        if (device >= num_egl_devices) {
            return SDL_SetError_REAL("Invalid EGL device is requested.");
        }
        _this.*.egl_data.*.egl_display = _this.*.egl_data.*.eglGetPlatformDisplayEXT.?(EGL_PLATFORM_DEVICE_EXT, egl_devices[@bitCast(@as(isize, @intCast(device)))], null);
        if (_this.*.egl_data.*.egl_display == @as(EGLDisplay, null)) {
            return SDL_SetError_REAL("eglGetPlatformDisplayEXT() failed.");
        }
        if (_this.*.egl_data.*.eglInitialize.?(_this.*.egl_data.*.egl_display, null, null) != @as(EGLBoolean, EGL_TRUE)) {
            return SDL_SetError_REAL("Could not initialize EGL");
        }
    } else {
        var i: c_int = undefined;
        _ = &i;
        var found: bool = @"false" != 0;
        _ = &found;
        var attempted_egl_display: EGLDisplay = undefined;
        _ = &attempted_egl_display;
        {
            i = 0;
            while (i < num_egl_devices) : (i += 1) {
                attempted_egl_display = _this.*.egl_data.*.eglGetPlatformDisplayEXT.?(EGL_PLATFORM_DEVICE_EXT, egl_devices[@bitCast(@as(isize, @intCast(i)))], null);
                if (attempted_egl_display == @as(EGLDisplay, null)) {
                    continue;
                }
                if (_this.*.egl_data.*.eglInitialize.?(attempted_egl_display, null, null) != @as(EGLBoolean, EGL_TRUE)) {
                    _ = _this.*.egl_data.*.eglTerminate.?(attempted_egl_display);
                    continue;
                }
                _this.*.egl_data.*.egl_display = attempted_egl_display;
                found = @"true" != 0;
                break;
            }
        }
        if (!found) {
            return SDL_SetError_REAL("Could not find a valid EGL device to initialize");
        }
    }
    SDL_EGL_GetVersion(_this);
    _this.*.egl_data.*.is_offscreen = @"true" != 0;
    return @"true" != 0;
}
pub export fn SDL_EGL_SetRequiredVisualId(_this: [*c]SDL_VideoDevice, visual_id: c_int) void {
    @setEvalBranchQuota(100000);
    _this.*.egl_data.*.egl_required_visual_id = visual_id;
}
pub fn SDL_EGL_PrivateChooseConfig(_this: [*c]SDL_VideoDevice, set_config_caveat_none: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_EGL_PrivateChooseConfig".*;
    };
    _ = &static_local___func__;
    var attribs: [64]EGLint = undefined;
    _ = &attribs;
    var found_configs: EGLint = 0;
    _ = &found_configs;
    var value: EGLint = undefined;
    _ = &value;
    var configs: [128]EGLConfig = undefined;
    _ = &configs;
    var has_matching_format: bool = @"false" != 0;
    _ = &has_matching_format;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var best_bitdiff: c_int = -@as(c_int, 1);
    _ = &best_bitdiff;
    var best_truecolor_bitdiff: c_int = -@as(c_int, 1);
    _ = &best_truecolor_bitdiff;
    var truecolor_config_idx: c_int = -@as(c_int, 1);
    _ = &truecolor_config_idx;
    i = 0;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_RED_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.red_size;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_GREEN_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.green_size;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_BLUE_SIZE;
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = _this.*.gl_config.blue_size;
    if (set_config_caveat_none) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_CONFIG_CAVEAT;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_NONE;
    }
    if (_this.*.gl_config.alpha_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_ALPHA_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.alpha_size;
    }
    if (_this.*.gl_config.buffer_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_BUFFER_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.buffer_size;
    }
    if (_this.*.gl_config.depth_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_DEPTH_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.depth_size;
    }
    if (_this.*.gl_config.stencil_size != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_STENCIL_SIZE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.stencil_size;
    }
    if (_this.*.gl_config.multisamplebuffers != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_SAMPLE_BUFFERS;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.multisamplebuffers;
    }
    if (_this.*.gl_config.multisamplesamples != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_SAMPLES;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.gl_config.multisamplesamples;
    }
    if (_this.*.gl_config.floatbuffers != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_COLOR_COMPONENT_TYPE_EXT;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT;
    }
    if (_this.*.egl_data.*.is_offscreen) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_SURFACE_TYPE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_PBUFFER_BIT;
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_RENDERABLE_TYPE;
    if (_this.*.gl_config.profile_mask == SDL_GL_CONTEXT_PROFILE_ES) {
        if ((_this.*.gl_config.major_version >= @as(c_int, 3)) and SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_KHR_create_context")) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_OPENGL_ES3_BIT_KHR;
        } else if (_this.*.gl_config.major_version >= @as(c_int, 2)) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_OPENGL_ES2_BIT;
        } else {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &i;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_OPENGL_ES_BIT;
        }
        _ = _this.*.egl_data.*.eglBindAPI.?(EGL_OPENGL_ES_API);
    } else {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_OPENGL_BIT;
        _ = _this.*.egl_data.*.eglBindAPI.?(EGL_OPENGL_API);
    }
    if (_this.*.egl_data.*.egl_surfacetype != 0) {
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_SURFACE_TYPE;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = _this.*.egl_data.*.egl_surfacetype;
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_NONE;
    while (true) {
        while (!(@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(attribs)) / @sizeOf(@TypeOf(attribs[@as(c_int, 0)]))))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "i < (sizeof(attribs)/sizeof(attribs[0]))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_egl.c", 875);
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
    if ((_this.*.egl_data.*.eglChooseConfig.?(_this.*.egl_data.*.egl_display, @ptrCast(@alignCast(&attribs)), @ptrCast(@alignCast(&configs)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(configs)) / @sizeOf(@TypeOf(configs[@as(c_int, 0)]))))), &found_configs) == @as(EGLBoolean, EGL_FALSE)) or (found_configs == @as(c_int, 0))) {
        return @"false" != 0;
    }
    if (_this.*.egl_data.*.egl_required_visual_id != 0) {
        {
            i = 0;
            while (i < found_configs) : (i += 1) {
                var format: EGLint = undefined;
                _ = &format;
                _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], EGL_NATIVE_VISUAL_ID, &format);
                if (_this.*.egl_data.*.egl_required_visual_id == format) {
                    has_matching_format = @"true" != 0;
                    break;
                }
            }
        }
    }
    {
        i = 0;
        while (i < found_configs) : (i += 1) {
            var is_truecolor: bool = @"false" != 0;
            _ = &is_truecolor;
            var bitdiff: c_int = 0;
            _ = &bitdiff;
            if (has_matching_format and (_this.*.egl_data.*.egl_required_visual_id != 0)) {
                var format: EGLint = undefined;
                _ = &format;
                _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], EGL_NATIVE_VISUAL_ID, &format);
                if (_this.*.egl_data.*.egl_required_visual_id != format) {
                    continue;
                }
            }
            _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], EGL_RED_SIZE, &value);
            if (value == @as(c_int, 8)) {
                _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], EGL_GREEN_SIZE, &value);
                if (value == @as(c_int, 8)) {
                    _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], EGL_BLUE_SIZE, &value);
                    if (value == @as(c_int, 8)) {
                        is_truecolor = @"true" != 0;
                    }
                }
            }
            {
                j = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, j))) < ((@sizeOf(@TypeOf(attribs)) / @sizeOf(@TypeOf(attribs[@as(c_int, 0)]))) -% @as(c_ulong, 1))) : (j += 2) {
                    if (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_NONE) {
                        break;
                    }
                    if ((attribs[@bitCast(@as(isize, @intCast(j + @as(c_int, 1))))] != -@as(c_int, 1)) and ((((((attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_RED_SIZE) or (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_GREEN_SIZE)) or (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_BLUE_SIZE)) or (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_ALPHA_SIZE)) or (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_DEPTH_SIZE)) or (attribs[@bitCast(@as(isize, @intCast(j)))] == EGL_STENCIL_SIZE))) {
                        _ = _this.*.egl_data.*.eglGetConfigAttrib.?(_this.*.egl_data.*.egl_display, configs[@bitCast(@as(isize, @intCast(i)))], attribs[@bitCast(@as(isize, @intCast(j)))], &value);
                        bitdiff += value - attribs[@bitCast(@as(isize, @intCast(j + @as(c_int, 1))))];
                    }
                }
            }
            if ((bitdiff < best_bitdiff) or (best_bitdiff == -@as(c_int, 1))) {
                _this.*.egl_data.*.egl_config = configs[@bitCast(@as(isize, @intCast(i)))];
                best_bitdiff = bitdiff;
            }
            if (is_truecolor and ((bitdiff < best_truecolor_bitdiff) or (best_truecolor_bitdiff == -@as(c_int, 1)))) {
                truecolor_config_idx = i;
                best_truecolor_bitdiff = bitdiff;
            }
        }
    }
    if (((_this.*.gl_config.red_size + _this.*.gl_config.blue_size) + _this.*.gl_config.green_size) <= @as(c_int, 16)) {
        if (truecolor_config_idx != -@as(c_int, 1)) {
            _this.*.egl_data.*.egl_config = configs[@bitCast(@as(isize, @intCast(truecolor_config_idx)))];
        }
    }
    return @"true" != 0;
}
pub export fn SDL_EGL_ChooseConfig(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    if (!(_this.*.egl_data != null)) {
        return SDL_SetError_REAL("EGL not initialized");
    }
    if (SDL_EGL_PrivateChooseConfig(_this, @"true" != 0)) {
        return @"true" != 0;
    }
    if (SDL_EGL_PrivateChooseConfig(_this, @"false" != 0)) {
        SDL_Log_REAL("SDL_EGL_ChooseConfig: found a slow EGL config");
        return @"true" != 0;
    }
    return SDL_EGL_SetErrorEx("Couldn't find matching EGL config", "eglChooseConfig", _this.*.egl_data.*.eglGetError.?());
}
pub export fn SDL_EGL_CreateContext(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) SDL_GLContext {
    @setEvalBranchQuota(100000);
    var attribs: [33]EGLint = undefined;
    _ = &attribs;
    var attr: c_int = 0;
    _ = &attr;
    var egl_context: EGLContext = undefined;
    _ = &egl_context;
    var share_context: EGLContext = null;
    _ = &share_context;
    var profile_mask: EGLint = _this.*.gl_config.profile_mask;
    _ = &profile_mask;
    var major_version: EGLint = _this.*.gl_config.major_version;
    _ = &major_version;
    var minor_version: EGLint = _this.*.gl_config.minor_version;
    _ = &minor_version;
    var profile_es: bool = profile_mask == SDL_GL_CONTEXT_PROFILE_ES;
    _ = &profile_es;
    if (!(_this.*.egl_data != null)) {
        _ = SDL_SetError_REAL("EGL not initialized");
        return null;
    }
    if (_this.*.gl_config.share_with_current_context != 0) {
        share_context = @ptrCast(@alignCast(SDL_GL_GetCurrentContext_REAL()));
    }
    if ((((major_version < @as(c_int, 3)) or ((minor_version == @as(c_int, 0)) and profile_es)) and (_this.*.gl_config.flags == @as(c_int, 0))) and ((profile_mask == @as(c_int, 0)) or profile_es)) {
        if (profile_es) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_CONTEXT_CLIENT_VERSION;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = if (major_version > @as(c_int, 1)) major_version else @as(c_int, 1);
        }
    } else {
        if (SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_KHR_create_context")) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_CONTEXT_MAJOR_VERSION_KHR;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = major_version;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_CONTEXT_MINOR_VERSION_KHR;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = minor_version;
            if ((profile_mask != @as(c_int, 0)) and (profile_mask != SDL_GL_CONTEXT_PROFILE_ES)) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = profile_mask;
            }
            if (_this.*.gl_config.flags != @as(c_int, 0)) {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = EGL_CONTEXT_FLAGS_KHR;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = _this.*.gl_config.flags;
            }
        } else {
            _ = SDL_SetError_REAL("Could not create EGL context (context attributes are not supported)");
            return null;
        }
    }
    if (_this.*.gl_config.no_error != 0) {
        if (SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_KHR_create_context_no_error")) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_CONTEXT_OPENGL_NO_ERROR_KHR;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = _this.*.gl_config.no_error;
        }
    }
    if (_this.*.egl_contextattrib_callback != null) {
        const maxAttribs: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(attribs)) / @sizeOf(@TypeOf(attribs[@as(c_int, 0)])))));
        _ = &maxAttribs;
        var userAttribs: [*c]EGLint = undefined;
        _ = &userAttribs;
        var userAttribP: [*c]EGLint = undefined;
        _ = &userAttribP;
        userAttribs = _this.*.egl_contextattrib_callback.?(_this.*.egl_attrib_callback_userdata, _this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config);
        if (!(userAttribs != null)) {
            _this.*.gl_config.driver_loaded = 0;
            @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
            _ = SDL_SetError_REAL("EGL context attribute callback returned NULL pointer");
            return null;
        }
        {
            userAttribP = userAttribs;
            while (userAttribP.* != EGL_NONE) {
                if ((attr + @as(c_int, 3)) >= maxAttribs) {
                    _this.*.gl_config.driver_loaded = 0;
                    @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
                    _ = SDL_SetError_REAL("EGL context attribute callback returned too many attributes");
                    return null;
                }
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = (blk: {
                    const ref = &userAttribP;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = (blk: {
                    const ref = &userAttribP;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(userAttribs)));
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &attr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_NONE;
    if (profile_es) {
        _this.*.egl_data.*.apitype = EGL_OPENGL_ES_API;
    } else {
        _this.*.egl_data.*.apitype = EGL_OPENGL_API;
    }
    if (!(_this.*.egl_data.*.eglBindAPI.?(_this.*.egl_data.*.apitype) != 0)) {
        _ = SDL_SetError_REAL("Could not bind EGL API");
        return null;
    }
    egl_context = _this.*.egl_data.*.eglCreateContext.?(_this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config, share_context, @ptrCast(@alignCast(&attribs)));
    if (egl_context == @as(EGLContext, null)) {
        _ = SDL_EGL_SetErrorEx("Could not create EGL context", "eglCreateContext", _this.*.egl_data.*.eglGetError.?());
        return null;
    }
    _this.*.egl_data.*.egl_swapinterval = 0;
    if (!SDL_EGL_MakeCurrent(_this, egl_surface, @ptrCast(@alignCast(egl_context)))) {
        _ = SDL_EGL_DestroyContext(_this, @ptrCast(@alignCast(egl_context)));
        return null;
    }
    if (((_this.*.egl_data.*.egl_version_major > @as(c_int, 1)) or ((_this.*.egl_data.*.egl_version_major == @as(c_int, 1)) and (_this.*.egl_data.*.egl_version_minor >= @as(c_int, 5)))) or SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_KHR_surfaceless_context")) {
        if (profile_es) {
            if (SDL_GL_ExtensionSupported_REAL("GL_OES_surfaceless_context")) {
                _this.*.gl_allow_no_surface = @"true" != 0;
            }
        } else {
            var glGetIntegervFunc: PFNGLGETINTEGERVPROC = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetIntegerv"))));
            _ = &glGetIntegervFunc;
            if (glGetIntegervFunc != null) {
                var v: GLint = 0;
                _ = &v;
                glGetIntegervFunc.?(GL_MAJOR_VERSION, &v);
                if (v >= @as(c_int, 3)) {
                    _this.*.gl_allow_no_surface = @"true" != 0;
                }
            }
        }
    }
    _ = SDL_EGL_SetSwapInterval(_this, 0);
    return @ptrCast(@alignCast(egl_context));
}
pub export fn SDL_EGL_MakeCurrent(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    var egl_context: EGLContext = @ptrCast(@alignCast(context));
    _ = &egl_context;
    if (!(_this.*.egl_data != null)) {
        return SDL_SetError_REAL("EGL not initialized");
    }
    if (!(_this.*.egl_data.*.eglMakeCurrent != null)) {
        if (!(egl_surface != null) and !(context != null)) {
            return @"true" != 0;
        } else {
            return SDL_SetError_REAL("EGL not initialized");
        }
    }
    if (_this.*.egl_data.*.eglBindAPI != null) {
        _ = _this.*.egl_data.*.eglBindAPI.?(_this.*.egl_data.*.apitype);
    }
    if (!(egl_context != null) or (!(egl_surface != null) and !_this.*.gl_allow_no_surface)) {
        _ = _this.*.egl_data.*.eglMakeCurrent.?(_this.*.egl_data.*.egl_display, null, null, null);
    } else {
        if (!(_this.*.egl_data.*.eglMakeCurrent.?(_this.*.egl_data.*.egl_display, egl_surface, egl_surface, egl_context) != 0)) {
            return SDL_EGL_SetErrorEx("Unable to make EGL context current", "eglMakeCurrent", _this.*.egl_data.*.eglGetError.?());
        }
    }
    return @"true" != 0;
}
pub export fn SDL_EGL_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool {
    @setEvalBranchQuota(100000);
    var status: EGLBoolean = undefined;
    _ = &status;
    if (!(_this.*.egl_data != null)) {
        return SDL_SetError_REAL("EGL not initialized");
    }
    if (interval < @as(c_int, 0)) {
        return SDL_SetError_REAL("Late swap tearing currently unsupported");
    }
    status = _this.*.egl_data.*.eglSwapInterval.?(_this.*.egl_data.*.egl_display, interval);
    if (status == @as(EGLBoolean, EGL_TRUE)) {
        _this.*.egl_data.*.egl_swapinterval = interval;
        return @"true" != 0;
    }
    return SDL_EGL_SetErrorEx("Unable to set the EGL swap interval", "eglSwapInterval", _this.*.egl_data.*.eglGetError.?());
}
pub export fn SDL_EGL_GetSwapInterval(_this: [*c]SDL_VideoDevice, interval: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this.*.egl_data != null)) {
        return SDL_SetError_REAL("EGL not initialized");
    }
    interval.* = _this.*.egl_data.*.egl_swapinterval;
    return @"true" != 0;
}
pub export fn SDL_EGL_SwapBuffers(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) bool {
    @setEvalBranchQuota(100000);
    if (!(_this.*.egl_data.*.eglSwapBuffers.?(_this.*.egl_data.*.egl_display, egl_surface) != 0)) {
        return SDL_EGL_SetErrorEx("unable to show color buffer in an OS-native window", "eglSwapBuffers", _this.*.egl_data.*.eglGetError.?());
    }
    return @"true" != 0;
}
pub export fn SDL_EGL_DestroyContext(_this: [*c]SDL_VideoDevice, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    var egl_context: EGLContext = @ptrCast(@alignCast(context));
    _ = &egl_context;
    if (!(_this.*.egl_data != null)) {
        return @"true" != 0;
    }
    if ((egl_context != @as(?*anyopaque, null)) and (egl_context != @as(EGLContext, null))) {
        _ = _this.*.egl_data.*.eglDestroyContext.?(_this.*.egl_data.*.egl_display, egl_context);
    }
    return @"true" != 0;
}
pub export fn SDL_EGL_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, nw: NativeWindowType) EGLSurface {
    @setEvalBranchQuota(100000);
    var attribs: [33]EGLint = undefined;
    _ = &attribs;
    var attr: c_int = 0;
    _ = &attr;
    var surface: EGLSurface = undefined;
    _ = &surface;
    if (!SDL_EGL_ChooseConfig(_this)) {
        return null;
    }
    if (SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_KHR_gl_colorspace")) {
        var srgbhint: [*c]const u8 = SDL_GetHint_REAL("SDL_OPENGL_FORCE_SRGB_FRAMEBUFFER");
        _ = &srgbhint;
        if ((srgbhint != null) and (@as(c_int, srgbhint.*) != 0)) {
            if (SDL_strcmp_REAL(srgbhint, "skip") == @as(c_int, 0)) {} else {
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = EGL_GL_COLORSPACE_KHR;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = if (SDL_GetStringBoolean(srgbhint, @"false" != 0)) EGL_GL_COLORSPACE_SRGB_KHR else EGL_GL_COLORSPACE_LINEAR_KHR;
            }
        } else if (_this.*.gl_config.framebuffer_srgb_capable >= @as(c_int, 0)) {
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = EGL_GL_COLORSPACE_KHR;
            attribs[
                @bitCast(@as(isize, @intCast(blk: {
                    const ref = &attr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                })))
            ] = if (_this.*.gl_config.framebuffer_srgb_capable != 0) EGL_GL_COLORSPACE_SRGB_KHR else EGL_GL_COLORSPACE_LINEAR_KHR;
        }
    }
    var opaque_ext_idx: c_int = -@as(c_int, 1);
    _ = &opaque_ext_idx;
    if (SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_EXT_present_opaque")) {
        opaque_ext_idx = attr;
        var allow_transparent: bool = @"false" != 0;
        _ = &allow_transparent;
        if ((window != null) and ((window.*.flags & @as(c_ulong, 1073741824)) != 0)) {
            allow_transparent = @"true" != 0;
        }
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &attr;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = EGL_PRESENT_OPAQUE_EXT;
        attribs[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &attr;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ] = if (allow_transparent) EGL_FALSE else EGL_TRUE;
    }
    if (_this.*.egl_surfaceattrib_callback != null) {
        const maxAttribs: c_int = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(attribs)) / @sizeOf(@TypeOf(attribs[@as(c_int, 0)])))));
        _ = &maxAttribs;
        var userAttribs: [*c]EGLint = undefined;
        _ = &userAttribs;
        var userAttribP: [*c]EGLint = undefined;
        _ = &userAttribP;
        userAttribs = _this.*.egl_surfaceattrib_callback.?(_this.*.egl_attrib_callback_userdata, _this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config);
        if (!(userAttribs != null)) {
            _this.*.gl_config.driver_loaded = 0;
            @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
            _ = SDL_SetError_REAL("EGL surface attribute callback returned NULL pointer");
            return null;
        }
        {
            userAttribP = userAttribs;
            while (userAttribP.* != EGL_NONE) {
                if ((attr + @as(c_int, 3)) >= maxAttribs) {
                    _this.*.gl_config.driver_loaded = 0;
                    @as([*c]u8, @ptrCast(@alignCast(&_this.*.gl_config.driver_path))).* = '\x00';
                    _ = SDL_SetError_REAL("EGL surface attribute callback returned too many attributes");
                    return null;
                }
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = (blk: {
                    const ref = &userAttribP;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                attribs[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &attr;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = (blk: {
                    const ref = &userAttribP;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(userAttribs)));
    }
    attribs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &attr;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = EGL_NONE;
    surface = _this.*.egl_data.*.eglCreateWindowSurface.?(_this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config, nw, &attribs[@as(c_int, 0)]);
    if (surface == @as(EGLSurface, null)) {
        if ((_this.*.egl_data.*.eglGetError.?() == EGL_BAD_ATTRIBUTE) and (opaque_ext_idx >= @as(c_int, 0))) {
            _ = memmove(@ptrCast(@alignCast(&attribs[@bitCast(@as(isize, @intCast(opaque_ext_idx)))])), @ptrCast(@alignCast(&attribs[@bitCast(@as(isize, @intCast(opaque_ext_idx + @as(c_int, 2))))])), @sizeOf(@TypeOf(attribs[@as(c_int, 0)])) *% @as(c_ulong, @bitCast(@as(c_long, (attr - opaque_ext_idx) - @as(c_int, 2)))));
            surface = _this.*.egl_data.*.eglCreateWindowSurface.?(_this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config, nw, &attribs[@as(c_int, 0)]);
        }
    }
    if (surface == @as(EGLSurface, null)) {
        _ = SDL_EGL_SetErrorEx("unable to create an EGL window surface", "eglCreateWindowSurface", _this.*.egl_data.*.eglGetError.?());
    }
    return surface;
}
pub export fn SDL_EGL_CreateOffscreenSurface(_this: [*c]SDL_VideoDevice, width: c_int, height: c_int) EGLSurface {
    @setEvalBranchQuota(100000);
    var attributes: [5]EGLint = [5]EGLint{
        EGL_WIDTH,
        0,
        EGL_HEIGHT,
        0,
        EGL_NONE,
    };
    _ = &attributes;
    attributes[@as(c_int, 1)] = width;
    attributes[@as(c_int, 3)] = height;
    if (!SDL_EGL_ChooseConfig(_this)) {
        return null;
    }
    return _this.*.egl_data.*.eglCreatePbufferSurface.?(_this.*.egl_data.*.egl_display, _this.*.egl_data.*.egl_config, @ptrCast(@alignCast(&attributes)));
}
pub export fn SDL_EGL_DestroySurface(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) void {
    @setEvalBranchQuota(100000);
    if (!(_this.*.egl_data != null)) {
        return;
    }
    if (egl_surface != @as(EGLSurface, null)) {
        _ = _this.*.egl_data.*.eglDestroySurface.?(_this.*.egl_data.*.egl_display, egl_surface);
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const EGL_ALPHA_SIZE = @as(c_int, 0x3021);
pub const EGL_BAD_ACCESS = @as(c_int, 0x3002);
pub const EGL_BAD_ALLOC = @as(c_int, 0x3003);
pub const EGL_BAD_ATTRIBUTE = @as(c_int, 0x3004);
pub const EGL_BAD_CONFIG = @as(c_int, 0x3005);
pub const EGL_BAD_CONTEXT = @as(c_int, 0x3006);
pub const EGL_BAD_CURRENT_SURFACE = @as(c_int, 0x3007);
pub const EGL_BAD_DISPLAY = @as(c_int, 0x3008);
pub const EGL_BAD_MATCH = @as(c_int, 0x3009);
pub const EGL_BAD_NATIVE_PIXMAP = @as(c_int, 0x300A);
pub const EGL_BAD_NATIVE_WINDOW = @as(c_int, 0x300B);
pub const EGL_BAD_PARAMETER = @as(c_int, 0x300C);
pub const EGL_BAD_SURFACE = @as(c_int, 0x300D);
pub const EGL_BLUE_SIZE = @as(c_int, 0x3022);
pub const EGL_BUFFER_SIZE = @as(c_int, 0x3020);
pub const EGL_CONFIG_CAVEAT = @as(c_int, 0x3027);
pub const EGL_DEPTH_SIZE = @as(c_int, 0x3025);
pub const EGL_EXTENSIONS = @as(c_int, 0x3055);
pub const EGL_FALSE = @as(c_int, 0);
pub const EGL_GREEN_SIZE = @as(c_int, 0x3023);
pub const EGL_HEIGHT = @as(c_int, 0x3056);
pub const EGL_NATIVE_VISUAL_ID = @as(c_int, 0x302E);
pub const EGL_NONE = @as(c_int, 0x3038);
pub const EGL_NOT_INITIALIZED = @as(c_int, 0x3001);
pub const EGL_PBUFFER_BIT = @as(c_int, 0x0001);
pub const EGL_RED_SIZE = @as(c_int, 0x3024);
pub const EGL_SAMPLES = @as(c_int, 0x3031);
pub const EGL_SAMPLE_BUFFERS = @as(c_int, 0x3032);
pub const EGL_STENCIL_SIZE = @as(c_int, 0x3026);
pub const EGL_SUCCESS = @as(c_int, 0x3000);
pub const EGL_SURFACE_TYPE = @as(c_int, 0x3033);
pub const EGL_TRUE = @as(c_int, 1);
pub const EGL_VERSION = @as(c_int, 0x3054);
pub const EGL_WIDTH = @as(c_int, 0x3057);
pub const EGL_CONTEXT_LOST = @as(c_int, 0x300E);
pub const EGL_OPENGL_ES_BIT = @as(c_int, 0x0001);
pub const EGL_OPENGL_ES_API = @as(c_int, 0x30A0);
pub const EGL_RENDERABLE_TYPE = @as(c_int, 0x3040);
pub const EGL_CONTEXT_CLIENT_VERSION = @as(c_int, 0x3098);
pub const EGL_OPENGL_ES2_BIT = @as(c_int, 0x0004);
pub const EGL_OPENGL_API = @as(c_int, 0x30A2);
pub const EGL_OPENGL_BIT = @as(c_int, 0x0008);
pub const EGL_CONTEXT_MAJOR_VERSION_KHR = @as(c_int, 0x3098);
pub const EGL_CONTEXT_MINOR_VERSION_KHR = @as(c_int, 0x30FB);
pub const EGL_CONTEXT_FLAGS_KHR = @as(c_int, 0x30FC);
pub const EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR = @as(c_int, 0x30FD);
pub const EGL_OPENGL_ES3_BIT_KHR = @as(c_int, 0x00000040);
pub const EGL_CONTEXT_OPENGL_NO_ERROR_KHR = @as(c_int, 0x31B3);
pub const EGL_GL_COLORSPACE_KHR = @as(c_int, 0x309D);
pub const EGL_GL_COLORSPACE_SRGB_KHR = @as(c_int, 0x3089);
pub const EGL_GL_COLORSPACE_LINEAR_KHR = @as(c_int, 0x308A);
pub const EGL_COLOR_COMPONENT_TYPE_EXT = @as(c_int, 0x3339);
pub const EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT = @as(c_int, 0x333B);
pub const EGL_PLATFORM_DEVICE_EXT = @as(c_int, 0x313F);
pub const EGL_PRESENT_OPAQUE_EXT = @as(c_int, 0x31DF);
pub const SDL_EGL_MAX_DEVICES = @as(c_int, 8);
pub const GL_MAJOR_VERSION = __helpers.promoteIntLiteral(c_int, 0x821B, .hex);
