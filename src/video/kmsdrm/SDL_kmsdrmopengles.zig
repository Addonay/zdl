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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
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
pub const struct_SDL_DisplayModeData = extern struct {
    mode_index: c_int = 0,
};
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
    internal: [*c]SDL_DisplayModeData = null,
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
pub const struct_SDL_WindowData = extern struct {
    viddata: [*c]SDL_VideoData = null,
    gs: ?*struct_gbm_surface = null,
    bo: ?*struct_gbm_bo = null,
    next_bo: ?*struct_gbm_bo = null,
    waiting_for_flip: bool = false,
    double_buffer: bool = false,
    egl_surface: EGLSurface = null,
    egl_surface_dirty: bool = false,
    swap_window: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool = null,
};
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
    internal: [*c]SDL_WindowData = null,
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
const struct_unnamed_9 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
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
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const khronos_int32_t = i32;
pub const khronos_uint64_t = u64;
pub const khronos_utime_nanoseconds_t = khronos_uint64_t;
pub const EGLNativeDisplayType = ?*struct_gbm_device;
pub const EGLNativeWindowType = ?*anyopaque;
pub const EGLint = khronos_int32_t;
pub const EGLBoolean = c_uint;
pub const EGLDisplay = ?*anyopaque;
pub const EGLConfig = ?*anyopaque;
pub const EGLSurface = ?*anyopaque;
pub const EGLContext = ?*anyopaque;
pub const __eglMustCastToProperFunctionPointerType = ?*const fn () callconv(.c) void;
pub const PFNEGLCHOOSECONFIGPROC = ?*const fn (dpy: EGLDisplay, attrib_list: [*c]const EGLint, configs: [*c]EGLConfig, config_size: EGLint, num_config: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLCREATECONTEXTPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, share_context: EGLContext, attrib_list: [*c]const EGLint) callconv(.c) EGLContext;
pub const PFNEGLCREATEPBUFFERSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const PFNEGLCREATEWINDOWSURFACEPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, win: EGLNativeWindowType, attrib_list: [*c]const EGLint) callconv(.c) EGLSurface;
pub const PFNEGLDESTROYCONTEXTPROC = ?*const fn (dpy: EGLDisplay, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const PFNEGLDESTROYSURFACEPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLGETCONFIGATTRIBPROC = ?*const fn (dpy: EGLDisplay, config: EGLConfig, attribute: EGLint, value: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLGETDISPLAYPROC = ?*const fn (display_id: EGLNativeDisplayType) callconv(.c) EGLDisplay;
pub const PFNEGLGETERRORPROC = ?*const fn () callconv(.c) EGLint;
pub const PFNEGLGETPROCADDRESSPROC = ?*const fn (procname: [*c]const u8) callconv(.c) __eglMustCastToProperFunctionPointerType;
pub const PFNEGLINITIALIZEPROC = ?*const fn (dpy: EGLDisplay, major: [*c]EGLint, minor: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLMAKECURRENTPROC = ?*const fn (dpy: EGLDisplay, draw: EGLSurface, read: EGLSurface, ctx: EGLContext) callconv(.c) EGLBoolean;
pub const PFNEGLQUERYSTRINGPROC = ?*const fn (dpy: EGLDisplay, name: EGLint) callconv(.c) [*c]const u8;
pub const PFNEGLSWAPBUFFERSPROC = ?*const fn (dpy: EGLDisplay, surface: EGLSurface) callconv(.c) EGLBoolean;
pub const PFNEGLTERMINATEPROC = ?*const fn (dpy: EGLDisplay) callconv(.c) EGLBoolean;
pub const PFNEGLWAITGLPROC = ?*const fn () callconv(.c) EGLBoolean;
pub const PFNEGLWAITNATIVEPROC = ?*const fn (engine: EGLint) callconv(.c) EGLBoolean;
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
pub const PFNEGLSWAPINTERVALPROC = ?*const fn (dpy: EGLDisplay, interval: EGLint) callconv(.c) EGLBoolean;
pub extern fn eglSwapInterval(dpy: EGLDisplay, interval: EGLint) EGLBoolean;
pub const EGLenum = c_uint;
pub const PFNEGLBINDAPIPROC = ?*const fn (api: EGLenum) callconv(.c) EGLBoolean;
pub extern fn eglBindAPI(api: EGLenum) EGLBoolean;
pub const EGLAttrib = isize;
pub const PFNEGLGETPLATFORMDISPLAYPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) callconv(.c) EGLDisplay;
pub extern fn eglGetPlatformDisplay(platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLAttrib) EGLDisplay;
pub const EGLSyncKHR = ?*anyopaque;
pub const EGLTimeKHR = khronos_utime_nanoseconds_t;
pub const PFNEGLCREATESYNCKHRPROC = ?*const fn (dpy: EGLDisplay, @"type": EGLenum, attrib_list: [*c]const EGLint) callconv(.c) EGLSyncKHR;
pub const PFNEGLDESTROYSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLBoolean;
pub const PFNEGLCLIENTWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint, timeout: EGLTimeKHR) callconv(.c) EGLint;
pub const PFNEGLWAITSYNCKHRPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR, flags: EGLint) callconv(.c) EGLint;
pub const PFNEGLDUPNATIVEFENCEFDANDROIDPROC = ?*const fn (dpy: EGLDisplay, sync: EGLSyncKHR) callconv(.c) EGLint;
pub const EGLDeviceEXT = ?*anyopaque;
pub const PFNEGLQUERYDEVICESEXTPROC = ?*const fn (max_devices: EGLint, devices: [*c]EGLDeviceEXT, num_devices: [*c]EGLint) callconv(.c) EGLBoolean;
pub const PFNEGLGETPLATFORMDISPLAYEXTPROC = ?*const fn (platform: EGLenum, native_display: ?*anyopaque, attrib_list: [*c]const EGLint) callconv(.c) EGLDisplay;
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
pub const struct_SDL_VideoData = extern struct {
    devindex: c_int = 0,
    drm_fd: c_int = 0,
    devpath: [32]u8 = @import("std").mem.zeroes([32]u8),
    gbm_dev: ?*struct_gbm_device = null,
    video_init: bool = false,
    vulkan_mode: bool = false,
    async_pageflip_support: bool = false,
    windows: [*c][*c]SDL_Window = null,
    max_windows: c_int = 0,
    num_windows: c_int = 0,
    gbm_init: bool = false,
    is_atomic: bool = false,
};
pub const SDL_VideoData = struct_SDL_VideoData;
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
    gl_config: struct_unnamed_8 = @import("std").mem.zeroes(struct_unnamed_8),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_9 = @import("std").mem.zeroes(struct_unnamed_9),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_10 = null,
    egl_data: [*c]struct_SDL_EGL_VideoData = null,
    gles_data: ?*struct_SDL_PrivateGLESData_11 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const struct_SDL_DisplayData = extern struct {
    display_plane: [*c]KMSDRM_plane = null,
    cursor_plane: [*c]KMSDRM_plane = null,
    crtc: KMSDRM_crtc = @import("std").mem.zeroes(KMSDRM_crtc),
    connector: KMSDRM_connector = @import("std").mem.zeroes(KMSDRM_connector),
    mode: drmModeModeInfo = @import("std").mem.zeroes(drmModeModeInfo),
    original_mode: drmModeModeInfo = @import("std").mem.zeroes(drmModeModeInfo),
    fullscreen_mode: drmModeModeInfo = @import("std").mem.zeroes(drmModeModeInfo),
    saved_crtc: [*c]drmModeCrtc = null,
    saved_vrr: bool = false,
    cursor_bo: ?*struct_gbm_bo = null,
    cursor_bo_drm_fd: c_int = 0,
    cursor_w: u64 = 0,
    cursor_h: u64 = 0,
    atomic_req: ?*drmModeAtomicReq = null,
    kms_in_fence_fd: c_int = 0,
    kms_out_fence_fd: c_int = 0,
    kms_fence: EGLSyncKHR = null,
    gpu_fence: EGLSyncKHR = null,
    default_cursor_init: bool = false,
};
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
    internal: [*c]SDL_DisplayData = null,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub const SDL_EGL_DISPLAY_EXTENSION: c_int = 0;
pub const enum_SDL_EGL_ExtensionType = c_uint;
pub const SDL_EGL_ExtensionType = enum_SDL_EGL_ExtensionType;
pub extern fn SDL_EGL_HasExtension(_this: [*c]SDL_VideoDevice, @"type": SDL_EGL_ExtensionType, ext: [*c]const u8) bool;
pub extern fn SDL_EGL_CreateContext(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) SDL_GLContext;
pub extern fn SDL_EGL_MakeCurrent(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface, context: SDL_GLContext) bool;
pub extern fn SDL_EGL_SetErrorEx(message: [*c]const u8, eglFunctionName: [*c]const u8, eglErrorCode: EGLint) bool;
pub export fn KMSDRM_GLES_SetDefaultProfileConfig(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    _this.*.gl_config.egl_platform = EGL_PLATFORM_GBM_KHR;
}
pub export fn KMSDRM_GLES_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool {
    @setEvalBranchQuota(100000);
    if (!(_this.*.egl_data != null)) {
        return SDL_SetError_REAL("EGL not initialized");
    }
    if ((interval == @as(c_int, 0)) or (interval == @as(c_int, 1))) {
        _this.*.egl_data.*.egl_swapinterval = interval;
    } else {
        return SDL_SetError_REAL("Only swap intervals of 0 or 1 are supported");
    }
    return @"true" != 0;
}
pub export fn KMSDRM_GLES_LoadLibrary(_: [*c]SDL_VideoDevice, _: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub export fn KMSDRM_GLES_UnloadLibrary(_: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_GLES_CreateContext(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_GLContext {
    @setEvalBranchQuota(100000);
    return SDL_EGL_CreateContext(_this, window.*.internal.*.egl_surface);
}
pub export fn KMSDRM_GLES_SwapWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(windata.*.swap_window)))) == @as(?*anyopaque, null)) {
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        if (viddata.*.is_atomic) {
            if (SDL_GetHintBoolean_REAL("SDL_VIDEO_DOUBLE_BUFFER", @"false" != 0) or !SDL_EGL_HasExtension(_this, SDL_EGL_DISPLAY_EXTENSION, "EGL_ANDROID_native_fence_sync")) {
                windata.*.swap_window = KMSDRM_GLES_SwapWindowDoubleBuffered;
            } else {
                windata.*.swap_window = KMSDRM_GLES_SwapWindowFenced;
            }
        } else {
            windata.*.swap_window = KMSDRM_GLES_SwapWindowLegacy;
        }
    }
    return windata.*.swap_window.?(_this, window);
}
pub export fn KMSDRM_GLES_MakeCurrent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) bool {
    @setEvalBranchQuota(100000);
    return SDL_EGL_MakeCurrent(_this, if (window != null) window.*.internal.*.egl_surface else @as(EGLSurface, null), context);
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const EGL_NONE = @as(c_int, 0x3038);
pub const EGL_PLATFORM_GBM_KHR = @as(c_int, 0x31D7);
pub const EGL_SYNC_NATIVE_FENCE_ANDROID = @as(c_int, 0x3144);
pub const EGL_SYNC_NATIVE_FENCE_FD_ANDROID = @as(c_int, 0x3145);
pub const SDL_EGL_CreateContext_impl = @compileError("unable to translate macro: undefined identifier `_GLES_CreateContext`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/video/SDL_egl_c.h:160:9
pub const struct_gbm_device = opaque {
};
pub const struct_gbm_surface = opaque {
};
pub const struct_gbm_bo = opaque {
};
pub const struct__drmModePlane = extern struct {
    count_formats: u32 = 0,
    formats: [*c]u32 = null,
    plane_id: u32 = 0,
    crtc_id: u32 = 0,
    fb_id: u32 = 0,
    crtc_x: u32 = 0,
    crtc_y: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    possible_crtcs: u32 = 0,
    gamma_size: u32 = 0,
};
pub const drmModePlane = struct__drmModePlane;
pub const struct__drmModeObjectProperties = extern struct {
    count_props: u32 = 0,
    props: [*c]u32 = null,
    prop_values: [*c]u64 = null,
};
pub const drmModeObjectProperties = struct__drmModeObjectProperties;
pub const __u64 = c_ulonglong;
pub const struct_drm_mode_property_enum = extern struct {
    value: __u64 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const struct__drmModeProperty = extern struct {
    prop_id: u32 = 0,
    flags: u32 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
    count_values: c_int = 0,
    values: [*c]u64 = null,
    count_enums: c_int = 0,
    enums: [*c]struct_drm_mode_property_enum = null,
    count_blobs: c_int = 0,
    blob_ids: [*c]u32 = null,
};
pub const drmModePropertyRes = struct__drmModeProperty;
pub const struct_KMSDRM_plane = extern struct {
    plane: [*c]drmModePlane = null,
    props: [*c]drmModeObjectProperties = null,
    props_info: [*c][*c]drmModePropertyRes = null,
};
pub const KMSDRM_plane = struct_KMSDRM_plane;
pub const struct__drmModeModeInfo = extern struct {
    clock: u32 = 0,
    hdisplay: u16 = 0,
    hsync_start: u16 = 0,
    hsync_end: u16 = 0,
    htotal: u16 = 0,
    hskew: u16 = 0,
    vdisplay: u16 = 0,
    vsync_start: u16 = 0,
    vsync_end: u16 = 0,
    vtotal: u16 = 0,
    vscan: u16 = 0,
    vrefresh: u32 = 0,
    flags: u32 = 0,
    type: u32 = 0,
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const drmModeModeInfo = struct__drmModeModeInfo;
pub const struct__drmModeCrtc = extern struct {
    crtc_id: u32 = 0,
    buffer_id: u32 = 0,
    x: u32 = 0,
    y: u32 = 0,
    width: u32 = 0,
    height: u32 = 0,
    mode_valid: c_int = 0,
    mode: drmModeModeInfo = @import("std").mem.zeroes(drmModeModeInfo),
    gamma_size: c_int = 0,
};
pub const drmModeCrtc = struct__drmModeCrtc;
pub const struct_KMSDRM_crtc = extern struct {
    crtc: [*c]drmModeCrtc = null,
    props: [*c]drmModeObjectProperties = null,
    props_info: [*c][*c]drmModePropertyRes = null,
};
pub const KMSDRM_crtc = struct_KMSDRM_crtc;
pub const drmModeModeInfoPtr = [*c]struct__drmModeModeInfo;
pub const struct__drmModeConnector = extern struct {
    connector_id: u32 = 0,
    encoder_id: u32 = 0,
    connector_type: u32 = 0,
    connector_type_id: u32 = 0,
    connection: drmModeConnection = @import("std").mem.zeroes(drmModeConnection),
    mmWidth: u32 = 0,
    mmHeight: u32 = 0,
    subpixel: drmModeSubPixel = @import("std").mem.zeroes(drmModeSubPixel),
    count_modes: c_int = 0,
    modes: drmModeModeInfoPtr = null,
    count_props: c_int = 0,
    props: [*c]u32 = null,
    prop_values: [*c]u64 = null,
    count_encoders: c_int = 0,
    encoders: [*c]u32 = null,
};
pub const drmModeConnector = struct__drmModeConnector;
pub const struct_KMSDRM_connector = extern struct {
    connector: [*c]drmModeConnector = null,
    props: [*c]drmModeObjectProperties = null,
    props_info: [*c][*c]drmModePropertyRes = null,
};
pub const KMSDRM_connector = struct_KMSDRM_connector;
pub const struct__drmModeAtomicReq = opaque {
};
pub const drmModeAtomicReq = struct__drmModeAtomicReq;
const struct_unnamed_8 = extern struct {
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
pub const struct_SDL_GLDriverData_10 = opaque {};
pub const struct_SDL_PrivateGLESData_11 = opaque {};
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn sync() void;
pub const drmModeConnection = c_uint;
pub const drmModeSubPixel = c_uint;
pub const struct_KMSDRM_FBInfo = extern struct {
    drm_fd: c_int = 0,
    fb_id: u32 = 0,
};
pub const KMSDRM_FBInfo = struct_KMSDRM_FBInfo;
pub const struct_KMSDRM_PlaneInfo = extern struct {
    plane: [*c]struct_KMSDRM_plane = null,
    fb_id: u32 = 0,
    crtc_id: u32 = 0,
    src_x: i32 = 0,
    src_y: i32 = 0,
    src_w: i32 = 0,
    src_h: i32 = 0,
    crtc_x: i32 = 0,
    crtc_y: i32 = 0,
    crtc_w: i32 = 0,
    crtc_h: i32 = 0,
};
pub const KMSDRM_PlaneInfo = struct_KMSDRM_PlaneInfo;
pub extern fn KMSDRM_CreateSurfaces(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn KMSDRM_FBFromBO(_this: [*c]SDL_VideoDevice, bo: ?*struct_gbm_bo) [*c]KMSDRM_FBInfo;
pub extern fn KMSDRM_WaitPageflip(_this: [*c]SDL_VideoDevice, windata: [*c]SDL_WindowData) bool;
pub extern fn drm_atomic_set_plane_props(dispdata: [*c]SDL_DisplayData, info: [*c]struct_KMSDRM_PlaneInfo) void;
pub extern fn drm_atomic_commit(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData, blocking: bool, allow_modeset: bool) c_int;
pub extern fn add_plane_property(req: ?*drmModeAtomicReq, plane: [*c]struct_KMSDRM_plane, name: [*c]const u8, value: u64) c_int;
pub extern fn add_crtc_property(req: ?*drmModeAtomicReq, crtc: [*c]struct_KMSDRM_crtc, name: [*c]const u8, value: u64) c_int;
pub extern fn add_connector_property(req: ?*drmModeAtomicReq, connector: [*c]struct_KMSDRM_connector, name: [*c]const u8, value: u64) c_int;
pub const SDL_DYNKMSDRMFN_drmModeSetCrtc = ?*const fn (fd: c_int, crtcId: u32, bufferId: u32, x: u32, y: u32, connectors: [*c]u32, count: c_int, mode: drmModeModeInfoPtr) callconv(.c) c_int;
pub extern var KMSDRM_drmModeSetCrtc: SDL_DYNKMSDRMFN_drmModeSetCrtc;
pub const SDL_DYNKMSDRMFN_drmModePageFlip = ?*const fn (fd: c_int, crtc_id: u32, fb_id: u32, flags: u32, user_data: ?*anyopaque) callconv(.c) c_int;
pub extern var KMSDRM_drmModePageFlip: SDL_DYNKMSDRMFN_drmModePageFlip;
pub const SDL_DYNKMSDRMFN_gbm_surface_lock_front_buffer = ?*const fn (surf: ?*struct_gbm_surface) callconv(.c) ?*struct_gbm_bo;
pub extern var KMSDRM_gbm_surface_lock_front_buffer: SDL_DYNKMSDRMFN_gbm_surface_lock_front_buffer;
pub const SDL_DYNKMSDRMFN_gbm_surface_release_buffer = ?*const fn (surf: ?*struct_gbm_surface, bo: ?*struct_gbm_bo) callconv(.c) void;
pub extern var KMSDRM_gbm_surface_release_buffer: SDL_DYNKMSDRMFN_gbm_surface_release_buffer;
pub const SDL_DYNKMSDRMFN_drmModeCreatePropertyBlob = ?*const fn (fd: c_int, data: ?*const anyopaque, size: usize, id: [*c]u32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeCreatePropertyBlob: SDL_DYNKMSDRMFN_drmModeCreatePropertyBlob;
pub fn create_fence(_this: [*c]SDL_VideoDevice, fd: c_int) callconv(.c) EGLSyncKHR {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "create_fence".*;
    };
    _ = &static_local___func__;
    var attrib_list: [3]EGLint = [3]EGLint{
        EGL_SYNC_NATIVE_FENCE_FD_ANDROID,
        fd,
        EGL_NONE,
    };
    _ = &attrib_list;
    var fence: EGLSyncKHR = _this.*.egl_data.*.eglCreateSyncKHR.?(_this.*.egl_data.*.egl_display, EGL_SYNC_NATIVE_FENCE_ANDROID, @ptrCast(@alignCast(&attrib_list)));
    _ = &fence;
    while (true) {
        while (!(fence != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "fence",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_kmsdrmopengles.c", 112);
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
    return fence;
}
pub fn KMSDRM_GLES_SwapWindowFenced(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "KMSDRM_GLES_SwapWindowFenced".*;
    };
    _ = &static_local___func__;
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &dispdata;
    var fb: [*c]KMSDRM_FBInfo = undefined;
    _ = &fb;
    var info: KMSDRM_PlaneInfo = undefined;
    _ = &info;
    const modesetting: bool = windata.*.egl_surface_dirty;
    _ = &modesetting;
    if (modesetting) {
        _ = KMSDRM_CreateSurfaces(_this, window);
    }
    _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
    dispdata.*.gpu_fence = create_fence(_this, -@as(c_int, 1));
    while (true) {
        while (!(dispdata.*.gpu_fence != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dispdata->gpu_fence",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_kmsdrmopengles.c", 142);
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
    if (!(_this.*.egl_data.*.eglSwapBuffers.?(_this.*.egl_data.*.egl_display, windata.*.egl_surface) != 0)) {
        return SDL_EGL_SetErrorEx("Failed to swap EGL buffers", "eglSwapBuffers", _this.*.egl_data.*.eglGetError.?());
    }
    dispdata.*.kms_in_fence_fd = _this.*.egl_data.*.eglDupNativeFenceFDANDROID.?(_this.*.egl_data.*.egl_display, dispdata.*.gpu_fence);
    _ = _this.*.egl_data.*.eglDestroySyncKHR.?(_this.*.egl_data.*.egl_display, dispdata.*.gpu_fence);
    while (true) {
        while (!(dispdata.*.kms_in_fence_fd != -@as(c_int, 1))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dispdata->kms_in_fence_fd != -1",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_kmsdrmopengles.c", 170);
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
    windata.*.next_bo = KMSDRM_gbm_surface_lock_front_buffer.?(windata.*.gs);
    if (!(windata.*.next_bo != null)) {
        return SDL_SetError_REAL("Failed to lock frontbuffer");
    }
    fb = KMSDRM_FBFromBO(_this, windata.*.next_bo);
    if (!(fb != null)) {
        return SDL_SetError_REAL("Failed to get a new framebuffer from BO");
    }
    if (!(windata.*.bo != null)) {
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        const ret: c_int = KMSDRM_drmModeSetCrtc.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, fb.*.fb_id, 0, 0, &dispdata.*.connector.connector.*.connector_id, 1, &dispdata.*.mode);
        _ = &ret;
        if (ret != 0) {
            return SDL_SetError_REAL("Could not set videomode on CRTC.");
        }
    }
    info.plane = dispdata.*.display_plane;
    info.crtc_id = dispdata.*.crtc.crtc.*.crtc_id;
    info.fb_id = fb.*.fb_id;
    info.src_w = window.*.w;
    info.src_h = window.*.h;
    info.crtc_w = dispdata.*.mode.hdisplay;
    info.crtc_h = dispdata.*.mode.vdisplay;
    info.crtc_x = 0;
    drm_atomic_set_plane_props(dispdata, &info);
    if (dispdata.*.kms_in_fence_fd != -@as(c_int, 1)) {
        _ = add_plane_property(dispdata.*.atomic_req, dispdata.*.display_plane, "IN_FENCE_FD", @bitCast(@as(c_long, dispdata.*.kms_in_fence_fd)));
        _ = add_crtc_property(dispdata.*.atomic_req, &dispdata.*.crtc, "OUT_FENCE_PTR", @as(u64, @intCast(@intFromPtr(&dispdata.*.kms_out_fence_fd))));
    }
    if (modesetting) {
        var blob_id: u32 = undefined;
        _ = &blob_id;
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        _ = add_connector_property(dispdata.*.atomic_req, &dispdata.*.connector, "CRTC_ID", dispdata.*.crtc.crtc.*.crtc_id);
        _ = KMSDRM_drmModeCreatePropertyBlob.?(viddata.*.drm_fd, @ptrCast(@alignCast(&dispdata.*.mode)), @sizeOf(@TypeOf(dispdata.*.mode)), &blob_id);
        _ = add_crtc_property(dispdata.*.atomic_req, &dispdata.*.crtc, "MODE_ID", blob_id);
        _ = add_crtc_property(dispdata.*.atomic_req, &dispdata.*.crtc, "active", 1);
    }
    if (drm_atomic_commit(_this, dispdata, @"false" != 0, modesetting) != 0) {
        return SDL_SetError_REAL("Failed to issue atomic commit on pageflip");
    }
    if (windata.*.bo != null) {
        KMSDRM_gbm_surface_release_buffer.?(windata.*.gs, windata.*.bo);
    }
    windata.*.bo = windata.*.next_bo;
    dispdata.*.kms_fence = create_fence(_this, dispdata.*.kms_out_fence_fd);
    while (true) {
        while (!(dispdata.*.kms_fence != null)) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "dispdata->kms_fence",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_kmsdrmopengles.c", 273);
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
    dispdata.*.kms_out_fence_fd = -@as(c_int, 1);
    _ = _this.*.egl_data.*.eglWaitSyncKHR.?(_this.*.egl_data.*.egl_display, dispdata.*.kms_fence, 0);
    return @"true" != 0;
}
pub fn KMSDRM_GLES_SwapWindowDoubleBuffered(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &dispdata;
    var fb: [*c]KMSDRM_FBInfo = undefined;
    _ = &fb;
    var info: KMSDRM_PlaneInfo = undefined;
    _ = &info;
    const modesetting: bool = windata.*.egl_surface_dirty;
    _ = &modesetting;
    if (modesetting) {
        _ = KMSDRM_CreateSurfaces(_this, window);
    }
    _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
    if (!(_this.*.egl_data.*.eglSwapBuffers.?(_this.*.egl_data.*.egl_display, windata.*.egl_surface) != 0)) {
        return SDL_EGL_SetErrorEx("Failed to swap EGL buffers", "eglSwapBuffers", _this.*.egl_data.*.eglGetError.?());
    }
    windata.*.next_bo = KMSDRM_gbm_surface_lock_front_buffer.?(windata.*.gs);
    if (!(windata.*.next_bo != null)) {
        return SDL_SetError_REAL("Failed to lock frontbuffer");
    }
    fb = KMSDRM_FBFromBO(_this, windata.*.next_bo);
    if (!(fb != null)) {
        return SDL_SetError_REAL("Failed to get a new framebuffer BO");
    }
    if (!(windata.*.bo != null)) {
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        const ret: c_int = KMSDRM_drmModeSetCrtc.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, fb.*.fb_id, 0, 0, &dispdata.*.connector.connector.*.connector_id, 1, &dispdata.*.mode);
        _ = &ret;
        if (ret != 0) {
            return SDL_SetError_REAL("Could not set videomode on CRTC.");
        }
    }
    info.plane = dispdata.*.display_plane;
    info.crtc_id = dispdata.*.crtc.crtc.*.crtc_id;
    info.fb_id = fb.*.fb_id;
    info.src_w = window.*.w;
    info.src_h = window.*.h;
    info.crtc_w = dispdata.*.mode.hdisplay;
    info.crtc_h = dispdata.*.mode.vdisplay;
    info.crtc_x = 0;
    drm_atomic_set_plane_props(dispdata, &info);
    if (modesetting) {
        var blob_id: u32 = undefined;
        _ = &blob_id;
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        _ = add_connector_property(dispdata.*.atomic_req, &dispdata.*.connector, "CRTC_ID", dispdata.*.crtc.crtc.*.crtc_id);
        _ = KMSDRM_drmModeCreatePropertyBlob.?(viddata.*.drm_fd, @ptrCast(@alignCast(&dispdata.*.mode)), @sizeOf(@TypeOf(dispdata.*.mode)), &blob_id);
        _ = add_crtc_property(dispdata.*.atomic_req, &dispdata.*.crtc, "MODE_ID", blob_id);
        _ = add_crtc_property(dispdata.*.atomic_req, &dispdata.*.crtc, "active", 1);
    }
    if (drm_atomic_commit(_this, dispdata, @"true" != 0, modesetting) != 0) {
        return SDL_SetError_REAL("Failed to issue atomic commit on pageflip");
    }
    if (windata.*.bo != null) {
        KMSDRM_gbm_surface_release_buffer.?(windata.*.gs, windata.*.bo);
    }
    windata.*.bo = windata.*.next_bo;
    return @"true" != 0;
}
pub fn KMSDRM_GLES_SwapWindowLegacy(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &dispdata;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var fb_info: [*c]KMSDRM_FBInfo = undefined;
    _ = &fb_info;
    var ret: c_int = 0;
    _ = &ret;
    var flip_flags: u32 = DRM_MODE_PAGE_FLIP_EVENT;
    _ = &flip_flags;
    if (windata.*.egl_surface == @as(EGLSurface, null)) {
        SDL_Delay_REAL(10);
        return @"true" != 0;
    }
    if (windata.*.egl_surface_dirty) {
        _ = KMSDRM_CreateSurfaces(_this, window);
    }
    if (!KMSDRM_WaitPageflip(_this, windata)) {
        return SDL_SetError_REAL("Wait for previous pageflip failed");
    }
    if (windata.*.bo != null) {
        KMSDRM_gbm_surface_release_buffer.?(windata.*.gs, windata.*.bo);
    }
    windata.*.bo = windata.*.next_bo;
    if (!(_this.*.egl_data.*.eglSwapBuffers.?(_this.*.egl_data.*.egl_display, windata.*.egl_surface) != 0)) {
        return SDL_SetError_REAL("eglSwapBuffers failed");
    }
    windata.*.next_bo = KMSDRM_gbm_surface_lock_front_buffer.?(windata.*.gs);
    if (!(windata.*.next_bo != null)) {
        return SDL_SetError_REAL("Could not lock front buffer on GBM surface");
    }
    fb_info = KMSDRM_FBFromBO(_this, windata.*.next_bo);
    if (!(fb_info != null)) {
        return SDL_SetError_REAL("Could not get a framebuffer");
    }
    if (!(windata.*.bo != null)) {
        ret = KMSDRM_drmModeSetCrtc.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, fb_info.*.fb_id, 0, 0, &dispdata.*.connector.connector.*.connector_id, 1, &dispdata.*.mode);
        if (ret != 0) {
            return SDL_SetError_REAL("Could not set videomode on CRTC.");
        }
    } else {
        if ((_this.*.egl_data.*.egl_swapinterval == @as(c_int, 0)) and viddata.*.async_pageflip_support) {
            flip_flags |= DRM_MODE_PAGE_FLIP_ASYNC;
        }
        ret = KMSDRM_drmModePageFlip.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, fb_info.*.fb_id, flip_flags, @ptrCast(@alignCast(&windata.*.waiting_for_flip)));
        if ((@as(u32, @bitCast(@as(c_int, @intFromBool(ret == -EINVAL)))) != 0) and ((flip_flags & @as(u32, DRM_MODE_PAGE_FLIP_ASYNC)) != 0)) {
            flip_flags &= @bitCast(@as(c_int, ~DRM_MODE_PAGE_FLIP_ASYNC));
            ret = KMSDRM_drmModePageFlip.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, fb_info.*.fb_id, flip_flags, @ptrCast(@alignCast(&windata.*.waiting_for_flip)));
        }
        if (ret == @as(c_int, 0)) {
            windata.*.waiting_for_flip = @"true" != 0;
        } else {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Could not queue pageflip: %d", ret);
        }
        if (windata.*.double_buffer) {
            if (!KMSDRM_WaitPageflip(_this, windata)) {
                return SDL_SetError_REAL("Immediate wait for previous pageflip failed");
            }
        }
    }
    return @"true" != 0;
}
pub const DRM_MODE_PAGE_FLIP_EVENT = @as(c_int, 0x01);
pub const DRM_MODE_PAGE_FLIP_ASYNC = @as(c_int, 0x02);
pub const EINVAL = @as(c_int, 22);
pub inline fn VOID2U64(x: anytype) u64 {
    @setEvalBranchQuota(100000);
    _ = &x;
    return __helpers.cast(u64, __helpers.cast(usize, x));
}
