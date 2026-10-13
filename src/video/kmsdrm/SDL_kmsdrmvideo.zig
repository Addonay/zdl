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
pub const __ino_t = c_ulong;
pub const __off_t = c_long;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strtol_REAL(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub extern fn SDL_GetError_REAL() [*c]const u8;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: Sint64) bool;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
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
pub const struct_gbm_device = opaque {
};
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
pub const struct_gbm_surface = opaque {
};
pub const struct_gbm_bo = opaque {
};
pub const EGLSurface = ?*anyopaque;
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
pub const EGLSyncKHR = ?*anyopaque;
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
pub const SDL_VideoDisplay = struct_SDL_VideoDisplay;
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const struct_SDL_GLContextState = opaque {
};
pub const SDL_GLContext = ?*struct_SDL_GLContextState;
pub const SDL_EGLSurface = ?*anyopaque;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkAllocationCallbacks = opaque {};
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const SDL_MetalView = ?*anyopaque;
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
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
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
pub const SDL_EGLAttrib = isize;
pub const SDL_EGLAttribArrayCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) [*c]SDL_EGLAttrib;
pub const SDL_EGLDisplay = ?*anyopaque;
pub const SDL_EGLConfig = ?*anyopaque;
pub const SDL_EGLint = c_int;
pub const SDL_EGLIntArrayCallback = ?*const fn (userdata: ?*anyopaque, display: SDL_EGLDisplay, config: SDL_EGLConfig) callconv(.c) [*c]SDL_EGLint;
const struct_unnamed_9 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_10 = opaque {};
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
pub const struct_SDL_PrivateGLESData_11 = opaque {};
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
pub extern fn SDL_GetDisplays_REAL(count: [*c]c_int) [*c]SDL_DisplayID;
pub extern fn SDL_GetPrimaryDisplay_REAL() SDL_DisplayID;
pub extern fn SDL_GetDisplayProperties_REAL(displayID: SDL_DisplayID) SDL_PropertiesID;
pub extern fn SDL_GetDisplayBounds_REAL(displayID: SDL_DisplayID, rect: [*c]SDL_Rect) bool;
pub extern fn SDL_GetClosestFullscreenDisplayMode_REAL(displayID: SDL_DisplayID, w: c_int, h: c_int, refresh_rate: f32, include_high_density_modes: bool, closest: [*c]SDL_DisplayMode) bool;
pub extern fn SDL_GetDisplayForWindow_REAL(window: [*c]SDL_Window) SDL_DisplayID;
pub extern fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID;
pub extern fn SDL_GL_GetCurrentContext_REAL() SDL_GLContext;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
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
pub extern fn SDL_AddVideoDisplay(display: [*c]const SDL_VideoDisplay, send_event: bool) SDL_DisplayID;
pub extern fn SDL_AddFullscreenDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) bool;
pub extern fn SDL_GetVideoDisplayForWindow(window: [*c]SDL_Window) [*c]SDL_VideoDisplay;
pub extern fn SDL_GetDisplayDriverData(display: SDL_DisplayID) [*c]SDL_DisplayData;
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub extern fn SDL_EGL_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8, native_display: NativeDisplayType) bool;
pub extern fn SDL_EGL_GetProcAddressInternal(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_EGL_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn SDL_EGL_SetRequiredVisualId(_this: [*c]SDL_VideoDevice, visual_id: c_int) void;
pub extern fn SDL_EGL_GetSwapInterval(_this: [*c]SDL_VideoDevice, interval: [*c]c_int) bool;
pub extern fn SDL_EGL_DestroyContext(_this: [*c]SDL_VideoDevice, context: SDL_GLContext) bool;
pub extern fn SDL_EGL_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, nw: NativeWindowType) EGLSurface;
pub extern fn SDL_EGL_DestroySurface(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) void;
pub extern fn SDL_EGL_MakeCurrent(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface, context: SDL_GLContext) bool;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_SetMouseFocus(window: [*c]SDL_Window) void;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_EVDEV_Init() bool;
pub extern fn SDL_EVDEV_Quit() void;
pub extern fn SDL_EVDEV_SetVTSwitchCallbacks(release_callback: ?*const fn (?*anyopaque) callconv(.c) void, release_callback_data: ?*anyopaque, acquire_callback: ?*const fn (?*anyopaque) callconv(.c) void, acquire_callback_data: ?*anyopaque) void;
pub const drm_magic_t = c_uint;
pub const struct__drmEventContext = extern struct {
    version: c_int = 0,
    vblank_handler: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    page_flip_handler: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    page_flip_handler2: ?*const fn (fd: c_int, sequence: c_uint, tv_sec: c_uint, tv_usec: c_uint, crtc_id: c_uint, user_data: ?*anyopaque) callconv(.c) void = null,
    sequence_handler: ?*const fn (fd: c_int, sequence: u64, ns: u64, user_data: u64) callconv(.c) void = null,
};
pub const drmEventContext = struct__drmEventContext;
pub const drmEventContextPtr = [*c]struct__drmEventContext;
pub const struct__drmModeRes = extern struct {
    count_fbs: c_int = 0,
    fbs: [*c]u32 = null,
    count_crtcs: c_int = 0,
    crtcs: [*c]u32 = null,
    count_connectors: c_int = 0,
    connectors: [*c]u32 = null,
    count_encoders: c_int = 0,
    encoders: [*c]u32 = null,
    min_width: u32 = 0,
    max_width: u32 = 0,
    min_height: u32 = 0,
    max_height: u32 = 0,
};
pub const drmModeRes = struct__drmModeRes;
pub const drmModeResPtr = [*c]struct__drmModeRes;
pub const drmModePropertyPtr = [*c]struct__drmModeProperty;
pub const drmModeCrtcPtr = [*c]struct__drmModeCrtc;
pub const struct__drmModeEncoder = extern struct {
    encoder_id: u32 = 0,
    encoder_type: u32 = 0,
    crtc_id: u32 = 0,
    possible_crtcs: u32 = 0,
    possible_clones: u32 = 0,
};
pub const drmModeEncoder = struct__drmModeEncoder;
pub const drmModeEncoderPtr = [*c]struct__drmModeEncoder;
pub const DRM_MODE_CONNECTED: c_int = 1;
pub const drmModeConnection = c_uint;
pub const drmModeSubPixel = c_uint;
pub const drmModeConnectorPtr = [*c]struct__drmModeConnector;
pub const drmModeObjectPropertiesPtr = [*c]struct__drmModeObjectProperties;
pub const drmModePlanePtr = [*c]struct__drmModePlane;
pub const struct__drmModePlaneRes = extern struct {
    count_planes: u32 = 0,
    planes: [*c]u32 = null,
};
pub const drmModePlaneResPtr = [*c]struct__drmModePlaneRes;
pub const drmModeAtomicReqPtr = ?*struct__drmModeAtomicReq;
pub const union_gbm_bo_handle = extern union {
    ptr: ?*anyopaque,
    s32: i32,
    u32: u32,
    s64: i64,
    u64: u64,
};
pub const GBM_BO_USE_SCANOUT: c_int = 1;
pub const GBM_BO_USE_RENDERING: c_int = 4;
pub extern fn SDL_KMSDRM_LoadSymbols() bool;
pub extern fn SDL_KMSDRM_UnloadSymbols() void;
pub const SDL_DYNKMSDRMFN_drmModeFreeResources = ?*const fn (ptr: drmModeResPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeResources: SDL_DYNKMSDRMFN_drmModeFreeResources;
pub const SDL_DYNKMSDRMFN_drmModeFreeCrtc = ?*const fn (ptr: drmModeCrtcPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeCrtc: SDL_DYNKMSDRMFN_drmModeFreeCrtc;
pub const SDL_DYNKMSDRMFN_drmModeFreeConnector = ?*const fn (ptr: drmModeConnectorPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeConnector: SDL_DYNKMSDRMFN_drmModeFreeConnector;
pub const SDL_DYNKMSDRMFN_drmModeFreeEncoder = ?*const fn (ptr: drmModeEncoderPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeEncoder: SDL_DYNKMSDRMFN_drmModeFreeEncoder;
pub const SDL_DYNKMSDRMFN_drmGetCap = ?*const fn (fd: c_int, capability: u64, value: [*c]u64) callconv(.c) c_int;
pub extern var KMSDRM_drmGetCap: SDL_DYNKMSDRMFN_drmGetCap;
pub const SDL_DYNKMSDRMFN_drmSetMaster = ?*const fn (fd: c_int) callconv(.c) c_int;
pub extern var KMSDRM_drmSetMaster: SDL_DYNKMSDRMFN_drmSetMaster;
pub const SDL_DYNKMSDRMFN_drmDropMaster = ?*const fn (fd: c_int) callconv(.c) c_int;
pub extern var KMSDRM_drmDropMaster: SDL_DYNKMSDRMFN_drmDropMaster;
pub const SDL_DYNKMSDRMFN_drmAuthMagic = ?*const fn (fd: c_int, magic: drm_magic_t) callconv(.c) c_int;
pub extern var KMSDRM_drmAuthMagic: SDL_DYNKMSDRMFN_drmAuthMagic;
pub const SDL_DYNKMSDRMFN_drmModeGetResources = ?*const fn (fd: c_int) callconv(.c) drmModeResPtr;
pub extern var KMSDRM_drmModeGetResources: SDL_DYNKMSDRMFN_drmModeGetResources;
pub const SDL_DYNKMSDRMFN_drmModeAddFB = ?*const fn (fd: c_int, width: u32, height: u32, depth: u8, bpp: u8, pitch: u32, bo_handle: u32, buf_id: [*c]u32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeAddFB: SDL_DYNKMSDRMFN_drmModeAddFB;
pub const SDL_DYNKMSDRMFN_drmModeAddFB2WithModifiers = ?*const fn (fd: c_int, width: u32, height: u32, pixel_format: u32, bo_handles: [*c]const u32, pitches: [*c]const u32, offsets: [*c]const u32, modifier: [*c]const u64, buf_id: [*c]u32, flags: u32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeAddFB2WithModifiers: SDL_DYNKMSDRMFN_drmModeAddFB2WithModifiers;
pub const SDL_DYNKMSDRMFN_drmModeGetConnectorTypeName = ?*const fn (connector_type: u32) callconv(.c) [*c]const u8;
pub extern var KMSDRM_drmModeGetConnectorTypeName: SDL_DYNKMSDRMFN_drmModeGetConnectorTypeName;
pub const SDL_DYNKMSDRMFN_drmModeRmFB = ?*const fn (fd: c_int, bufferId: u32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeRmFB: SDL_DYNKMSDRMFN_drmModeRmFB;
pub const SDL_DYNKMSDRMFN_drmModeGetCrtc = ?*const fn (fd: c_int, crtcId: u32) callconv(.c) drmModeCrtcPtr;
pub extern var KMSDRM_drmModeGetCrtc: SDL_DYNKMSDRMFN_drmModeGetCrtc;
pub const SDL_DYNKMSDRMFN_drmModeSetCrtc = ?*const fn (fd: c_int, crtcId: u32, bufferId: u32, x: u32, y: u32, connectors: [*c]u32, count: c_int, mode: drmModeModeInfoPtr) callconv(.c) c_int;
pub extern var KMSDRM_drmModeSetCrtc: SDL_DYNKMSDRMFN_drmModeSetCrtc;
pub const SDL_DYNKMSDRMFN_drmModeGetEncoder = ?*const fn (fd: c_int, encoder_id: u32) callconv(.c) drmModeEncoderPtr;
pub extern var KMSDRM_drmModeGetEncoder: SDL_DYNKMSDRMFN_drmModeGetEncoder;
pub const SDL_DYNKMSDRMFN_drmModeGetConnector = ?*const fn (fd: c_int, connector_id: u32) callconv(.c) drmModeConnectorPtr;
pub extern var KMSDRM_drmModeGetConnector: SDL_DYNKMSDRMFN_drmModeGetConnector;
pub const SDL_DYNKMSDRMFN_drmHandleEvent = ?*const fn (fd: c_int, evctx: drmEventContextPtr) callconv(.c) c_int;
pub extern var KMSDRM_drmHandleEvent: SDL_DYNKMSDRMFN_drmHandleEvent;
pub const SDL_DYNKMSDRMFN_drmSetClientCap = ?*const fn (fd: c_int, capability: u64, value: u64) callconv(.c) c_int;
pub extern var KMSDRM_drmSetClientCap: SDL_DYNKMSDRMFN_drmSetClientCap;
pub const SDL_DYNKMSDRMFN_drmModeGetPlaneResources = ?*const fn (fd: c_int) callconv(.c) drmModePlaneResPtr;
pub extern var KMSDRM_drmModeGetPlaneResources: SDL_DYNKMSDRMFN_drmModeGetPlaneResources;
pub const SDL_DYNKMSDRMFN_drmModeGetPlane = ?*const fn (fd: c_int, plane_id: u32) callconv(.c) drmModePlanePtr;
pub extern var KMSDRM_drmModeGetPlane: SDL_DYNKMSDRMFN_drmModeGetPlane;
pub const SDL_DYNKMSDRMFN_drmModeObjectGetProperties = ?*const fn (fd: c_int, object_id: u32, object_type: u32) callconv(.c) drmModeObjectPropertiesPtr;
pub extern var KMSDRM_drmModeObjectGetProperties: SDL_DYNKMSDRMFN_drmModeObjectGetProperties;
pub const SDL_DYNKMSDRMFN_drmModeObjectSetProperty = ?*const fn (fd: c_int, object_id: u32, object_type: u32, property_id: u32, value: u64) callconv(.c) c_int;
pub extern var KMSDRM_drmModeObjectSetProperty: SDL_DYNKMSDRMFN_drmModeObjectSetProperty;
pub const SDL_DYNKMSDRMFN_drmModeGetProperty = ?*const fn (fd: c_int, propertyId: u32) callconv(.c) drmModePropertyPtr;
pub extern var KMSDRM_drmModeGetProperty: SDL_DYNKMSDRMFN_drmModeGetProperty;
pub const SDL_DYNKMSDRMFN_drmModeFreeProperty = ?*const fn (ptr: drmModePropertyPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeProperty: SDL_DYNKMSDRMFN_drmModeFreeProperty;
pub const SDL_DYNKMSDRMFN_drmModeFreeObjectProperties = ?*const fn (ptr: drmModeObjectPropertiesPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreeObjectProperties: SDL_DYNKMSDRMFN_drmModeFreeObjectProperties;
pub const SDL_DYNKMSDRMFN_drmModeFreePlane = ?*const fn (ptr: drmModePlanePtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreePlane: SDL_DYNKMSDRMFN_drmModeFreePlane;
pub const SDL_DYNKMSDRMFN_drmModeFreePlaneResources = ?*const fn (ptr: drmModePlaneResPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeFreePlaneResources: SDL_DYNKMSDRMFN_drmModeFreePlaneResources;
pub const SDL_DYNKMSDRMFN_gbm_device_is_format_supported = ?*const fn (gbm: ?*struct_gbm_device, format: u32, usage: u32) callconv(.c) c_int;
pub extern var KMSDRM_gbm_device_is_format_supported: SDL_DYNKMSDRMFN_gbm_device_is_format_supported;
pub const SDL_DYNKMSDRMFN_gbm_device_destroy = ?*const fn (gbm: ?*struct_gbm_device) callconv(.c) void;
pub extern var KMSDRM_gbm_device_destroy: SDL_DYNKMSDRMFN_gbm_device_destroy;
pub const SDL_DYNKMSDRMFN_gbm_create_device = ?*const fn (fd: c_int) callconv(.c) ?*struct_gbm_device;
pub extern var KMSDRM_gbm_create_device: SDL_DYNKMSDRMFN_gbm_create_device;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_width = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_uint;
pub extern var KMSDRM_gbm_bo_get_width: SDL_DYNKMSDRMFN_gbm_bo_get_width;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_height = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_uint;
pub extern var KMSDRM_gbm_bo_get_height: SDL_DYNKMSDRMFN_gbm_bo_get_height;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_stride = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u32;
pub extern var KMSDRM_gbm_bo_get_stride: SDL_DYNKMSDRMFN_gbm_bo_get_stride;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_format = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u32;
pub extern var KMSDRM_gbm_bo_get_format: SDL_DYNKMSDRMFN_gbm_bo_get_format;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_handle = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) union_gbm_bo_handle;
pub extern var KMSDRM_gbm_bo_get_handle: SDL_DYNKMSDRMFN_gbm_bo_get_handle;
pub const SDL_DYNKMSDRMFN_gbm_bo_set_user_data = ?*const fn (bo: ?*struct_gbm_bo, data: ?*anyopaque, destroy_user_data: ?*const fn (?*struct_gbm_bo, ?*anyopaque) callconv(.c) void) callconv(.c) void;
pub extern var KMSDRM_gbm_bo_set_user_data: SDL_DYNKMSDRMFN_gbm_bo_set_user_data;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_user_data = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) ?*anyopaque;
pub extern var KMSDRM_gbm_bo_get_user_data: SDL_DYNKMSDRMFN_gbm_bo_get_user_data;
pub const SDL_DYNKMSDRMFN_gbm_surface_create = ?*const fn (gbm: ?*struct_gbm_device, width: u32, height: u32, format: u32, flags: u32) callconv(.c) ?*struct_gbm_surface;
pub extern var KMSDRM_gbm_surface_create: SDL_DYNKMSDRMFN_gbm_surface_create;
pub const SDL_DYNKMSDRMFN_gbm_surface_destroy = ?*const fn (surf: ?*struct_gbm_surface) callconv(.c) void;
pub extern var KMSDRM_gbm_surface_destroy: SDL_DYNKMSDRMFN_gbm_surface_destroy;
pub const SDL_DYNKMSDRMFN_gbm_surface_release_buffer = ?*const fn (surf: ?*struct_gbm_surface, bo: ?*struct_gbm_bo) callconv(.c) void;
pub extern var KMSDRM_gbm_surface_release_buffer: SDL_DYNKMSDRMFN_gbm_surface_release_buffer;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_modifier = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u64;
pub extern var KMSDRM_gbm_bo_get_modifier: SDL_DYNKMSDRMFN_gbm_bo_get_modifier;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_plane_count = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) c_int;
pub extern var KMSDRM_gbm_bo_get_plane_count: SDL_DYNKMSDRMFN_gbm_bo_get_plane_count;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_offset = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) u32;
pub extern var KMSDRM_gbm_bo_get_offset: SDL_DYNKMSDRMFN_gbm_bo_get_offset;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_stride_for_plane = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) u32;
pub extern var KMSDRM_gbm_bo_get_stride_for_plane: SDL_DYNKMSDRMFN_gbm_bo_get_stride_for_plane;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_handle_for_plane = ?*const fn (bo: ?*struct_gbm_bo, plane: c_int) callconv(.c) union_gbm_bo_handle;
pub extern var KMSDRM_gbm_bo_get_handle_for_plane: SDL_DYNKMSDRMFN_gbm_bo_get_handle_for_plane;
pub const SDL_DYNKMSDRMFN_drmModeAtomicAlloc = ?*const fn () callconv(.c) drmModeAtomicReqPtr;
pub extern var KMSDRM_drmModeAtomicAlloc: SDL_DYNKMSDRMFN_drmModeAtomicAlloc;
pub const SDL_DYNKMSDRMFN_drmModeAtomicFree = ?*const fn (req: drmModeAtomicReqPtr) callconv(.c) void;
pub extern var KMSDRM_drmModeAtomicFree: SDL_DYNKMSDRMFN_drmModeAtomicFree;
pub const SDL_DYNKMSDRMFN_drmModeAtomicCommit = ?*const fn (fd: c_int, req: drmModeAtomicReqPtr, flags: u32, user_data: ?*anyopaque) callconv(.c) c_int;
pub extern var KMSDRM_drmModeAtomicCommit: SDL_DYNKMSDRMFN_drmModeAtomicCommit;
pub const SDL_DYNKMSDRMFN_drmModeAtomicAddProperty = ?*const fn (req: drmModeAtomicReqPtr, object_id: u32, property_id: u32, value: u64) callconv(.c) c_int;
pub extern var KMSDRM_drmModeAtomicAddProperty: SDL_DYNKMSDRMFN_drmModeAtomicAddProperty;
pub extern fn KMSDRM_PumpEvents(_this: [*c]SDL_VideoDevice) void;
pub extern fn KMSDRM_InitMouse(_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) void;
pub extern fn KMSDRM_CreateCursorBO(display: [*c]SDL_VideoDisplay) bool;
pub extern fn KMSDRM_DestroyCursorBO(_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) void;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn sync() void;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
pub extern fn KMSDRM_GLES_SetDefaultProfileConfig(_this: [*c]SDL_VideoDevice) void;
pub extern fn KMSDRM_GLES_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool;
pub extern fn KMSDRM_GLES_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8) bool;
pub extern fn KMSDRM_GLES_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn KMSDRM_GLES_CreateContext(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_GLContext;
pub extern fn KMSDRM_GLES_SwapWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn KMSDRM_GLES_MakeCurrent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) bool;
pub extern fn KMSDRM_Vulkan_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8) bool;
pub extern fn KMSDRM_Vulkan_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn KMSDRM_Vulkan_GetInstanceExtensions(_this: [*c]SDL_VideoDevice, count: [*c]Uint32) [*c]const [*c]const u8;
pub extern fn KMSDRM_Vulkan_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool;
pub extern fn KMSDRM_Vulkan_DestroySurface(_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) void;
pub const struct_dirent = extern struct {
    d_ino: __ino_t = 0,
    d_off: __off_t = 0,
    d_reclen: c_ushort = 0,
    d_type: u8 = 0,
    d_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const struct___dirstream = opaque {
};
pub const DIR = struct___dirstream;
pub extern fn closedir(__dirp: ?*DIR) c_int;
pub extern fn opendir(__name: [*c]const u8) ?*DIR;
pub extern fn readdir(__dirp: ?*DIR) [*c]struct_dirent;
pub extern fn __errno_location() [*c]c_int;
pub const nfds_t = c_ulong;
pub const struct_pollfd = extern struct {
    fd: c_int = 0,
    events: c_short = 0,
    revents: c_short = 0,
};
pub extern fn poll(__fds: [*c]struct_pollfd, __nfds: nfds_t, __timeout: c_int) c_int;
pub var moderndri: bool = @"true" != 0;
pub var kmsdrm_dri_path: [16]u8 = @import("std").mem.zeroes([16]u8);
pub var kmsdrm_dri_pathsize: c_int = 0;
pub var kmsdrm_dri_devname: [8]u8 = @import("std").mem.zeroes([8]u8);
pub var kmsdrm_dri_devnamesize: c_int = 0;
pub var kmsdrm_dri_cardpath: [32]u8 = @import("std").mem.zeroes([32]u8);
pub fn get_driindex() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var available: c_int = -ENOENT;
    _ = &available;
    var device: [32]u8 = undefined;
    _ = &device;
    var drm_fd: c_int = undefined;
    _ = &drm_fd;
    var i: c_int = undefined;
    _ = &i;
    var devindex: c_int = -@as(c_int, 1);
    _ = &devindex;
    var folder: ?*DIR = undefined;
    _ = &folder;
    var hint: [*c]const u8 = undefined;
    _ = &hint;
    var res: [*c]struct_dirent = undefined;
    _ = &res;
    hint = SDL_GetHint_REAL("SDL_KMSDRM_DEVICE_INDEX");
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        var endptr: [*c]u8 = null;
        _ = &endptr;
        const idx: c_int = @truncate(SDL_strtol_REAL(hint, &endptr, 10));
        _ = &idx;
        if ((@as(c_int, endptr.*) == @as(c_int, '\x00')) and (idx >= @as(c_int, 0))) {
            return idx;
        }
    }
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&device)), @ptrCast(@alignCast(&kmsdrm_dri_path)), @sizeOf(@TypeOf(device)));
    folder = opendir(@ptrCast(@alignCast(&device)));
    if (!(folder != null)) {
        _ = SDL_SetError_REAL("Failed to open directory '%s'", @as([*c]u8, @ptrCast(@alignCast(&device))));
        return -ENOENT;
    }
    _ = SDL_strlcpy_REAL(@as([*c]u8, @ptrCast(@alignCast(&device))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_pathsize)))), @ptrCast(@alignCast(&kmsdrm_dri_devname)), @sizeOf(@TypeOf(device)) -% @as(c_ulong, @bitCast(@as(c_long, kmsdrm_dri_pathsize))));
    while ((@as(?*anyopaque, @ptrCast(@alignCast(blk: {
        const tmp = readdir(folder);
        res = tmp;
        break :blk tmp;
    }))) != @as(?*anyopaque, null)) and (available < @as(c_int, 0))) {
        if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&res.*.d_name))))), @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&kmsdrm_dri_devname))))), @bitCast(@as(c_long, kmsdrm_dri_devnamesize))) == @as(c_int, 0)) {
            _ = SDL_strlcpy_REAL((@as([*c]u8, @ptrCast(@alignCast(&device))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_pathsize))))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_devnamesize)))), @as([*c]u8, @ptrCast(@alignCast(&res.*.d_name))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_devnamesize)))), (@sizeOf(@TypeOf(device)) -% @as(c_ulong, @bitCast(@as(c_long, kmsdrm_dri_pathsize)))) -% @as(c_ulong, @bitCast(@as(c_long, kmsdrm_dri_devnamesize))));
            drm_fd = open(@ptrCast(@alignCast(&device)), O_RDWR | __O_CLOEXEC);
            if (drm_fd >= @as(c_int, 0)) {
                devindex = SDL_atoi_REAL((@as([*c]u8, @ptrCast(@alignCast(&device))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_pathsize))))) + @as(usize, @bitCast(@as(isize, @intCast(kmsdrm_dri_devnamesize)))));
                if (SDL_KMSDRM_LoadSymbols()) {
                    var resources: [*c]drmModeRes = KMSDRM_drmModeGetResources.?(drm_fd);
                    _ = &resources;
                    if (resources != null) {
                        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "%s%d connector, encoder and CRTC counts are: %d %d %d", @as([*c]u8, @ptrCast(@alignCast(&kmsdrm_dri_cardpath))), devindex, resources.*.count_connectors, resources.*.count_encoders, resources.*.count_crtcs);
                        if (((resources.*.count_connectors > @as(c_int, 0)) and (resources.*.count_encoders > @as(c_int, 0))) and (resources.*.count_crtcs > @as(c_int, 0))) {
                            available = -ENOENT;
                            {
                                i = 0;
                                while ((i < resources.*.count_connectors) and (available < @as(c_int, 0))) : (i += 1) {
                                    var conn: [*c]drmModeConnector = KMSDRM_drmModeGetConnector.?(drm_fd, resources.*.connectors[@bitCast(@as(isize, @intCast(i)))]);
                                    _ = &conn;
                                    if (!(conn != null)) {
                                        continue;
                                    }
                                    if ((conn.*.connection == @as(drmModeConnection, DRM_MODE_CONNECTED)) and (conn.*.count_modes != 0)) {
                                        var access_denied: bool = @"false" != 0;
                                        _ = &access_denied;
                                        if (SDL_GetHintBoolean_REAL("SDL_KMSDRM_REQUIRE_DRM_MASTER", @"true" != 0)) {
                                            _ = KMSDRM_drmSetMaster.?(drm_fd);
                                            if (KMSDRM_drmAuthMagic.?(drm_fd, 0) == -EACCES) {
                                                access_denied = @"true" != 0;
                                            }
                                        }
                                        if (!access_denied) {
                                            available = devindex;
                                        }
                                    }
                                    KMSDRM_drmModeFreeConnector.?(conn);
                                }
                            }
                        }
                        KMSDRM_drmModeFreeResources.?(resources);
                    }
                    SDL_KMSDRM_UnloadSymbols();
                }
                _ = close(drm_fd);
            } else {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Failed to open KMSDRM device %s, errno: %d", @as([*c]u8, @ptrCast(@alignCast(&device))), __errno_location().*);
            }
        }
    }
    _ = closedir(folder);
    return available;
}
pub fn CalculateRefreshRate(mode: [*c]drmModeModeInfo, numerator: [*c]c_int, denominator: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    numerator.* = @bitCast(@as(c_uint, @truncate(mode.*.clock *% @as(u32, 1000))));
    denominator.* = @as(c_int, mode.*.htotal) * @as(c_int, mode.*.vtotal);
    if ((mode.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 4)))))) != 0) {
        numerator.* *= 2;
    }
    if ((mode.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 5)))))) != 0) {
        denominator.* *= 2;
    }
    if (@as(c_int, mode.*.vscan) > @as(c_int, 1)) {
        denominator.* *= mode.*.vscan;
    }
}
pub export fn add_connector_property(req: ?*drmModeAtomicReq, conn: [*c]KMSDRM_connector, name: [*c]const u8, value: u64) c_int {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var prop_id: c_int = 0;
    _ = &prop_id;
    {
        i = 0;
        while (i < conn.*.props.*.count_props) : (i +%= 1) {
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&conn.*.props_info[i].*.name)), name) == @as(c_int, 0)) {
                prop_id = @bitCast(@as(c_uint, @truncate(conn.*.props_info[i].*.prop_id)));
                break;
            }
        }
    }
    if (prop_id < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("no connector property: %s", name);
        return -EINVAL;
    }
    return KMSDRM_drmModeAtomicAddProperty.?(req, conn.*.connector.*.connector_id, @bitCast(@as(c_int, prop_id)), value);
}
pub export fn add_crtc_property(req: ?*drmModeAtomicReq, c: [*c]KMSDRM_crtc, name: [*c]const u8, value: u64) c_int {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var prop_id: c_int = -@as(c_int, 1);
    _ = &prop_id;
    {
        i = 0;
        while (i < c.*.props.*.count_props) : (i +%= 1) {
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&c.*.props_info[i].*.name)), name) == @as(c_int, 0)) {
                prop_id = @bitCast(@as(c_uint, @truncate(c.*.props_info[i].*.prop_id)));
                break;
            }
        }
    }
    if (prop_id < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("no crtc property: %s", name);
        return -EINVAL;
    }
    return KMSDRM_drmModeAtomicAddProperty.?(req, c.*.crtc.*.crtc_id, @bitCast(@as(c_int, prop_id)), value);
}
pub export fn add_plane_property(req: ?*drmModeAtomicReq, p: [*c]KMSDRM_plane, name: [*c]const u8, value: u64) c_int {
    @setEvalBranchQuota(100000);
    var i: c_uint = undefined;
    _ = &i;
    var prop_id: c_int = -@as(c_int, 1);
    _ = &prop_id;
    {
        i = 0;
        while (i < p.*.props.*.count_props) : (i +%= 1) {
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&p.*.props_info[i].*.name)), name) == @as(c_int, 0)) {
                prop_id = @bitCast(@as(c_uint, @truncate(p.*.props_info[i].*.prop_id)));
                break;
            }
        }
    }
    if (prop_id < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("no plane property: %s", name);
        return -EINVAL;
    }
    return KMSDRM_drmModeAtomicAddProperty.?(req, p.*.plane.*.plane_id, @bitCast(@as(c_int, prop_id)), value);
}
pub fn get_plane_id(_this: [*c]SDL_VideoDevice, crtc_id: c_uint, plane_type: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var resources: [*c]drmModeRes = null;
    _ = &resources;
    var plane_resources: drmModePlaneResPtr = null;
    _ = &plane_resources;
    var i: u32 = undefined;
    _ = &i;
    var j: u32 = undefined;
    _ = &j;
    var crtc_index: c_uint = 0;
    _ = &crtc_index;
    var ret: c_int = -EINVAL;
    _ = &ret;
    var found: c_int = 0;
    _ = &found;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    resources = KMSDRM_drmModeGetResources.?(viddata.*.drm_fd);
    {
        i = 0;
        while (i < @as(u32, @bitCast(@as(c_int, resources.*.count_crtcs)))) : (i +%= 1) {
            if (resources.*.crtcs[i] == crtc_id) {
                crtc_index = i;
                break;
            }
        }
    }
    plane_resources = KMSDRM_drmModeGetPlaneResources.?(viddata.*.drm_fd);
    if (!(plane_resources != null)) {
        return @intFromBool(SDL_SetError_REAL("drmModeGetPlaneResources failed."));
    }
    {
        i = 0;
        while ((i < plane_resources.*.count_planes) and !(found != 0)) : (i +%= 1) {
            var plane_id: u32 = plane_resources.*.planes[i];
            _ = &plane_id;
            var plane: drmModePlanePtr = KMSDRM_drmModeGetPlane.?(viddata.*.drm_fd, plane_id);
            _ = &plane;
            if (!(plane != null)) {
                continue;
            }
            if ((plane.*.possible_crtcs & (@as(c_uint, 1) << @intCast(crtc_index))) != 0) {
                var props: drmModeObjectPropertiesPtr = KMSDRM_drmModeObjectGetProperties.?(viddata.*.drm_fd, plane_id, DRM_MODE_OBJECT_PLANE);
                _ = &props;
                ret = @bitCast(@as(c_uint, @truncate(plane_id)));
                {
                    j = 0;
                    while (j < props.*.count_props) : (j +%= 1) {
                        var p: drmModePropertyPtr = KMSDRM_drmModeGetProperty.?(viddata.*.drm_fd, props.*.props[j]);
                        _ = &p;
                        if ((SDL_strcmp_REAL(@ptrCast(@alignCast(&p.*.name)), "type") == @as(c_int, 0)) and (props.*.prop_values[j] == @as(u64, plane_type))) {
                            found = 1;
                        }
                        KMSDRM_drmModeFreeProperty.?(p);
                    }
                }
                KMSDRM_drmModeFreeObjectProperties.?(props);
            }
            KMSDRM_drmModeFreePlane.?(plane);
        }
    }
    KMSDRM_drmModeFreePlaneResources.?(plane_resources);
    KMSDRM_drmModeFreeResources.?(resources);
    return ret;
}
pub export fn setup_plane(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData, _plane: [*c][*c]KMSDRM_plane, plane_type: u32) bool {
    @setEvalBranchQuota(100000);
    var plane_id: u32 = undefined;
    _ = &plane_id;
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var ret: bool = undefined;
    _ = &ret;
    var i: c_uint = undefined;
    _ = &i;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                viddata = _this.*.internal;
                ret = @"true" != 0;
                _plane.* = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(_plane.*.*)))));
                if (!(_plane.* != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (!ret) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            2 => {
                ret = @"false" != 0;
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
                plane_id = @bitCast(@as(c_int, get_plane_id(_this, dispdata.*.crtc.crtc.*.crtc_id, plane_type)));
                if (!(plane_id != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                ret = SDL_SetError_REAL("Invalid Plane ID");
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
                _plane.*.*.plane = KMSDRM_drmModeGetPlane.?(viddata.*.drm_fd, plane_id);
                if (_plane.*.*.plane != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _plane.*.*.props = KMSDRM_drmModeObjectGetProperties.?(viddata.*.drm_fd, _plane.*.*.plane.*.plane_id, DRM_MODE_OBJECT_PLANE);
                _plane.*.*.props_info = @ptrCast(@alignCast(SDL_calloc_REAL(_plane.*.*.props.*.count_props, @sizeOf(@TypeOf(_plane.*.*.props_info.*)))));
                if (!(_plane.*.*.props_info != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                ret = @"false" != 0;
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
                i = 0;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (i < _plane.*.*.props.*.count_props) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                _plane.*.*.props_info[i] = KMSDRM_drmModeGetProperty.?(viddata.*.drm_fd, _plane.*.*.props.*.props[i]);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                i +%= 1;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                if (_plane.* != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                return ret;
            },
            21 => {
                SDL_free_REAL(@ptrCast(@alignCast(_plane.*)));
                _plane.* = null;
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn free_plane(_plane: [*c][*c]KMSDRM_plane) void {
    @setEvalBranchQuota(100000);
    if (_plane.* != null) {
        if (_plane.*.*.plane != null) {
            KMSDRM_drmModeFreePlane.?(_plane.*.*.plane);
            _plane.*.*.plane = null;
        }
        if (_plane.*.*.props_info != null) {
            SDL_free_REAL(@ptrCast(@alignCast(_plane.*.*.props_info)));
            _plane.*.*.props_info = null;
        }
        SDL_free_REAL(@ptrCast(@alignCast(_plane.*)));
        _plane.* = null;
    }
}
pub export fn drm_atomic_set_plane_props(dispdata: [*c]SDL_DisplayData, info: [*c]struct_KMSDRM_PlaneInfo) void {
    @setEvalBranchQuota(100000);
    if (!(dispdata.*.atomic_req != null)) {
        dispdata.*.atomic_req = KMSDRM_drmModeAtomicAlloc.?();
    }
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "FB_ID", info.*.fb_id);
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "CRTC_ID", info.*.crtc_id);
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "SRC_W", @bitCast(@as(c_long, info.*.src_w << @intCast(@as(c_int, 16)))));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "SRC_H", @bitCast(@as(c_long, info.*.src_h << @intCast(@as(c_int, 16)))));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "SRC_X", @bitCast(@as(c_long, info.*.src_x)));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "SRC_Y", @bitCast(@as(c_long, info.*.src_y)));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "CRTC_W", @bitCast(@as(c_long, info.*.crtc_w)));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "CRTC_H", @bitCast(@as(c_long, info.*.crtc_h)));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "CRTC_X", @bitCast(@as(c_long, info.*.crtc_x)));
    _ = add_plane_property(dispdata.*.atomic_req, info.*.plane, "CRTC_Y", @bitCast(@as(c_long, info.*.crtc_y)));
}
pub export fn drm_atomic_commit(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData, blocking: bool, allow_modeset: bool) c_int {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var atomic_flags: u32 = undefined;
    _ = &atomic_flags;
    var ret: c_int = undefined;
    _ = &ret;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                viddata = _this.*.internal;
                atomic_flags = 0;
                if (!blocking) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                KMSDRM_drmModeAtomicFree.?(dispdata.*.atomic_req);
                dispdata.*.atomic_req = null;
                return ret;
            },
            2 => {
                atomic_flags |= DRM_MODE_ATOMIC_NONBLOCK;
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
                if (allow_modeset) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                atomic_flags |= DRM_MODE_ATOMIC_ALLOW_MODESET;
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
                drm_atomic_waitpending(_this, dispdata);
                ret = KMSDRM_drmModeAtomicCommit.?(viddata.*.drm_fd, dispdata.*.atomic_req, atomic_flags, null);
                if (ret != 0) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Atomic commit failed, returned %d.", ret);
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
                if (dispdata.*.kms_in_fence_fd != -@as(c_int, 1)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = close(dispdata.*.kms_in_fence_fd);
                dispdata.*.kms_in_fence_fd = -@as(c_int, 1);
                {
                    sdl_pc = 13;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn drm_atomic_waitpending(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData) void {
    @setEvalBranchQuota(100000);
    if (dispdata.*.kms_fence != null) {
        var status: EGLint = undefined;
        _ = &status;
        while (true) {
            status = _this.*.egl_data.*.eglClientWaitSyncKHR.?(_this.*.egl_data.*.egl_display, dispdata.*.kms_fence, 0, EGL_FOREVER_KHR);
            if (!(status != EGL_CONDITION_SATISFIED_KHR)) break;
        }
        _ = _this.*.egl_data.*.eglDestroySyncKHR.?(_this.*.egl_data.*.egl_display, dispdata.*.kms_fence);
        dispdata.*.kms_fence = null;
    }
}
pub fn KMSDRM_Available() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ret: c_int = -ENOENT;
    _ = &ret;
    if (moderndri) {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&kmsdrm_dri_path)), "/dev/dri/", @sizeOf(@TypeOf(kmsdrm_dri_path)));
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&kmsdrm_dri_devname)), "card", @sizeOf(@TypeOf(kmsdrm_dri_devname)));
    } else {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&kmsdrm_dri_path)), "/dev/", @sizeOf(@TypeOf(kmsdrm_dri_path)));
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&kmsdrm_dri_devname)), "drm", @sizeOf(@TypeOf(kmsdrm_dri_devname)));
    }
    kmsdrm_dri_pathsize = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(@ptrCast(@alignCast(&kmsdrm_dri_path))))));
    kmsdrm_dri_devnamesize = @bitCast(@as(c_uint, @truncate(SDL_strlen_REAL(@ptrCast(@alignCast(&kmsdrm_dri_devname))))));
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&kmsdrm_dri_cardpath)), @sizeOf(@TypeOf(kmsdrm_dri_cardpath)), "%s%s", @as([*c]u8, @ptrCast(@alignCast(&kmsdrm_dri_path))), @as([*c]u8, @ptrCast(@alignCast(&kmsdrm_dri_devname))));
    ret = get_driindex();
    if (ret >= @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn KMSDRM_DeleteDevice(device: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (device.*.internal != null) {
        SDL_free_REAL(@ptrCast(@alignCast(device.*.internal)));
        device.*.internal = null;
    }
    SDL_free_REAL(@ptrCast(@alignCast(device)));
    SDL_KMSDRM_UnloadSymbols();
}
pub fn KMSDRM_CreateDevice() callconv(.c) [*c]SDL_VideoDevice {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_VideoDevice = undefined;
    _ = &device;
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var devindex: c_int = undefined;
    _ = &devindex;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!KMSDRM_Available()) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(device)));
                SDL_free_REAL(@ptrCast(@alignCast(viddata)));
                return null;
            },
            2 => {
                return null;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                devindex = get_driindex();
                if (devindex < @as(c_int, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("devindex (%d) must not be negative.", devindex);
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!SDL_KMSDRM_LoadSymbols()) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_VideoDevice))));
                if (!(device != null)) {
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
                viddata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_VideoData))));
                if (!(viddata != null)) {
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
                viddata.*.devindex = devindex;
                viddata.*.drm_fd = -@as(c_int, 1);
                device.*.internal = viddata;
                device.*.VideoInit = KMSDRM_VideoInit;
                device.*.VideoQuit = KMSDRM_VideoQuit;
                device.*.GetDisplayModes = KMSDRM_GetDisplayModes;
                device.*.SetDisplayMode = KMSDRM_SetDisplayMode;
                device.*.CreateSDLWindow = KMSDRM_CreateWindow;
                device.*.SetWindowTitle = KMSDRM_SetWindowTitle;
                device.*.SetWindowPosition = KMSDRM_SetWindowPosition;
                device.*.SetWindowSize = KMSDRM_SetWindowSize;
                device.*.SetWindowFullscreen = KMSDRM_SetWindowFullscreen;
                device.*.ShowWindow = KMSDRM_ShowWindow;
                device.*.HideWindow = KMSDRM_HideWindow;
                device.*.RaiseWindow = KMSDRM_RaiseWindow;
                device.*.MaximizeWindow = KMSDRM_MaximizeWindow;
                device.*.MinimizeWindow = KMSDRM_MinimizeWindow;
                device.*.RestoreWindow = KMSDRM_RestoreWindow;
                device.*.DestroyWindow = KMSDRM_DestroyWindow;
                device.*.SetWindowFocusable = KMSDRM_SetWindowFocusable;
                device.*.GL_LoadLibrary = KMSDRM_GLES_LoadLibrary;
                device.*.GL_GetProcAddress = SDL_EGL_GetProcAddressInternal;
                device.*.GL_UnloadLibrary = KMSDRM_GLES_UnloadLibrary;
                device.*.GL_CreateContext = KMSDRM_GLES_CreateContext;
                device.*.GL_MakeCurrent = KMSDRM_GLES_MakeCurrent;
                device.*.GL_SetSwapInterval = KMSDRM_GLES_SetSwapInterval;
                device.*.GL_GetSwapInterval = SDL_EGL_GetSwapInterval;
                device.*.GL_SwapWindow = KMSDRM_GLES_SwapWindow;
                device.*.GL_DestroyContext = SDL_EGL_DestroyContext;
                device.*.GL_SetDefaultProfileConfig = KMSDRM_GLES_SetDefaultProfileConfig;
                device.*.Vulkan_LoadLibrary = KMSDRM_Vulkan_LoadLibrary;
                device.*.Vulkan_UnloadLibrary = KMSDRM_Vulkan_UnloadLibrary;
                device.*.Vulkan_GetInstanceExtensions = KMSDRM_Vulkan_GetInstanceExtensions;
                device.*.Vulkan_CreateSurface = KMSDRM_Vulkan_CreateSurface;
                device.*.Vulkan_DestroySurface = KMSDRM_Vulkan_DestroySurface;
                device.*.PumpEvents = KMSDRM_PumpEvents;
                device.*.free = KMSDRM_DeleteDevice;
                return device;
            },
            else => unreachable,
        }
    }
}
pub export var KMSDRM_bootstrap: VideoBootStrap = VideoBootStrap{
    .name = "kmsdrm",
    .desc = "KMS/DRM Video Driver",
    .create = KMSDRM_CreateDevice,
    .ShowMessageBox = null,
    .is_preferred = @"false" != 0,
};
pub fn KMSDRM_FBDestroyCallback(_: ?*struct_gbm_bo, data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var fb_info: [*c]KMSDRM_FBInfo = @ptrCast(@alignCast(data));
    _ = &fb_info;
    if (((fb_info != null) and (fb_info.*.drm_fd >= @as(c_int, 0))) and (fb_info.*.fb_id != @as(u32, 0))) {
        _ = KMSDRM_drmModeRmFB.?(fb_info.*.drm_fd, fb_info.*.fb_id);
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Delete DRM FB %u", fb_info.*.fb_id);
    }
    SDL_free_REAL(@ptrCast(@alignCast(fb_info)));
}
pub export fn KMSDRM_FBFromBO(_this: [*c]SDL_VideoDevice, bo: ?*struct_gbm_bo) [*c]KMSDRM_FBInfo {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var w: c_uint = undefined;
    _ = &w;
    var h: c_uint = undefined;
    _ = &h;
    var rc: c_int = -@as(c_int, 1);
    _ = &rc;
    var num_planes: c_int = 0;
    _ = &num_planes;
    var format: u32 = undefined;
    _ = &format;
    var strides: [4]u32 = [1]u32{
        0,
    } ++ @as([3]u32, @splat(0));
    _ = &strides;
    var handles: [4]u32 = [1]u32{
        0,
    } ++ @as([3]u32, @splat(0));
    _ = &handles;
    var offsets: [4]u32 = [1]u32{
        0,
    } ++ @as([3]u32, @splat(0));
    _ = &offsets;
    var flags: u32 = 0;
    _ = &flags;
    var modifiers: [4]u64 = [1]u64{
        0,
    } ++ @as([3]u64, @splat(0));
    _ = &modifiers;
    var fb_info: [*c]KMSDRM_FBInfo = @ptrCast(@alignCast(KMSDRM_gbm_bo_get_user_data.?(bo)));
    _ = &fb_info;
    if (fb_info != null) {
        return fb_info;
    }
    fb_info = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(KMSDRM_FBInfo))));
    if (!(fb_info != null)) {
        return null;
    }
    fb_info.*.drm_fd = viddata.*.drm_fd;
    w = KMSDRM_gbm_bo_get_width.?(bo);
    h = KMSDRM_gbm_bo_get_height.?(bo);
    format = KMSDRM_gbm_bo_get_format.?(bo);
    if ((((((KMSDRM_drmModeAddFB2WithModifiers != null) and (KMSDRM_gbm_bo_get_modifier != null)) and (KMSDRM_gbm_bo_get_plane_count != null)) and (KMSDRM_gbm_bo_get_offset != null)) and (KMSDRM_gbm_bo_get_stride_for_plane != null)) and (KMSDRM_gbm_bo_get_handle_for_plane != null)) {
        modifiers[@as(c_int, 0)] = KMSDRM_gbm_bo_get_modifier.?(bo);
        num_planes = KMSDRM_gbm_bo_get_plane_count.?(bo);
        {
            var i: c_int = 0;
            _ = &i;
            while (i < num_planes) : (i += 1) {
                strides[@bitCast(@as(isize, @intCast(i)))] = KMSDRM_gbm_bo_get_stride_for_plane.?(bo, i);
                handles[@bitCast(@as(isize, @intCast(i)))] = KMSDRM_gbm_bo_get_handle_for_plane.?(bo, i).u32;
                offsets[@bitCast(@as(isize, @intCast(i)))] = KMSDRM_gbm_bo_get_offset.?(bo, i);
                modifiers[@bitCast(@as(isize, @intCast(i)))] = modifiers[@as(c_int, 0)];
            }
        }
        if ((modifiers[@as(c_int, 0)] != 0) and (@as(u64, @bitCast(@as(c_long, @intFromBool(@as(c_ulonglong, modifiers[@as(c_int, 0)]) != DRM_FORMAT_MOD_INVALID)))) != 0)) {
            flags = @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 1))));
        }
        rc = KMSDRM_drmModeAddFB2WithModifiers.?(viddata.*.drm_fd, w, h, format, @ptrCast(@alignCast(&handles)), @ptrCast(@alignCast(&strides)), @ptrCast(@alignCast(&offsets)), @ptrCast(@alignCast(&modifiers)), &fb_info.*.fb_id, flags);
    }
    if (rc < @as(c_int, 0)) {
        strides[@as(c_int, 0)] = KMSDRM_gbm_bo_get_stride.?(bo);
        handles[@as(c_int, 0)] = KMSDRM_gbm_bo_get_handle.?(bo).u32;
        rc = KMSDRM_drmModeAddFB.?(viddata.*.drm_fd, w, h, 24, 32, strides[@as(c_int, 0)], handles[@as(c_int, 0)], &fb_info.*.fb_id);
    }
    if (rc < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(fb_info)));
        return null;
    }
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "New DRM FB (%u): %ux%u, from BO %p", fb_info.*.fb_id, w, h, @as(?*anyopaque, @ptrCast(@alignCast(bo))));
    KMSDRM_gbm_bo_set_user_data.?(bo, @ptrCast(@alignCast(fb_info)), KMSDRM_FBDestroyCallback);
    return fb_info;
}
pub fn KMSDRM_FlipHandler(_: c_int, _: c_uint, _: c_uint, _: c_uint, data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    @as([*c]bool, @ptrCast(@alignCast(data))).* = @"false" != 0;
}
pub export fn KMSDRM_WaitPageflip(_this: [*c]SDL_VideoDevice, windata: [*c]SDL_WindowData) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var ev: drmEventContext = drmEventContext{
        .version = 0,
        .vblank_handler = null,
        .page_flip_handler = null,
        .page_flip_handler2 = null,
        .sequence_handler = null,
    };
    _ = &ev;
    var pfd: struct_pollfd = struct_pollfd{
        .fd = 0,
        .events = 0,
        .revents = 0,
    };
    _ = &pfd;
    var ret: c_int = undefined;
    _ = &ret;
    ev.version = DRM_EVENT_CONTEXT_VERSION;
    ev.page_flip_handler = KMSDRM_FlipHandler;
    pfd.fd = viddata.*.drm_fd;
    pfd.events = POLLIN;
    while (windata.*.waiting_for_flip) {
        pfd.revents = 0;
        ret = poll(&pfd, 1, -@as(c_int, 1));
        if (ret < @as(c_int, 0)) {
            if (__errno_location().* == EINTR) {
                continue;
            } else {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "DRM poll error");
                return @"false" != 0;
            }
        }
        if ((@as(c_int, pfd.revents) & (POLLHUP | POLLERR)) != 0) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "DRM poll hup or error");
            return @"false" != 0;
        }
        if ((@as(c_int, pfd.revents) & POLLIN) != 0) {
            _ = KMSDRM_drmHandleEvent.?(viddata.*.drm_fd, &ev);
        }
    }
    return @"true" != 0;
}
pub fn KMSDRM_GetClosestDisplayMode(display: [*c]SDL_VideoDisplay, width: c_int, height: c_int) callconv(.c) [*c]drmModeModeInfo {
    @setEvalBranchQuota(100000);
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var conn: [*c]drmModeConnector = dispdata.*.connector.connector;
    _ = &conn;
    var closest: SDL_DisplayMode = undefined;
    _ = &closest;
    var drm_mode: [*c]drmModeModeInfo = undefined;
    _ = &drm_mode;
    if (SDL_GetClosestFullscreenDisplayMode_REAL(display.*.id, width, height, 0.0, @"false" != 0, &closest)) {
        var modedata: [*c]const SDL_DisplayModeData = closest.internal;
        _ = &modedata;
        drm_mode = &conn.*.modes[@bitCast(@as(isize, @intCast(modedata.*.mode_index)))];
        return drm_mode;
    } else {
        return null;
    }
}
pub fn KMSDRM_DropMaster(_this: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    if (viddata.*.is_atomic) {
        _ = KMSDRM_drmSetClientCap.?(viddata.*.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0);
        _ = KMSDRM_drmSetClientCap.?(viddata.*.drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
    }
    if (KMSDRM_drmAuthMagic.?(viddata.*.drm_fd, 0) == -EACCES) {
        return @"true" != 0;
    }
    return KMSDRM_drmDropMaster.?(viddata.*.drm_fd) == @as(c_int, 0);
}
pub fn KMSDRM_DeinitDisplays(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var displays: [*c]SDL_DisplayID = undefined;
    _ = &displays;
    var dispdata: [*c]SDL_DisplayData = undefined;
    _ = &dispdata;
    var i: c_int = undefined;
    _ = &i;
    displays = SDL_GetDisplays_REAL(null);
    if (displays != null) {
        {
            i = 0;
            while (displays[@bitCast(@as(isize, @intCast(i)))] != 0) : (i += 1) {
                dispdata = SDL_GetDisplayDriverData(displays[@bitCast(@as(isize, @intCast(i)))]);
                if ((dispdata != null) and (dispdata.*.connector.connector != null)) {
                    KMSDRM_drmModeFreeConnector.?(dispdata.*.connector.connector);
                    dispdata.*.connector.connector = null;
                }
                if ((dispdata != null) and (dispdata.*.crtc.crtc != null)) {
                    KMSDRM_drmModeFreeCrtc.?(dispdata.*.crtc.crtc);
                    dispdata.*.crtc.crtc = null;
                }
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(displays)));
    }
    if (viddata.*.drm_fd >= @as(c_int, 0)) {
        _ = close(viddata.*.drm_fd);
        viddata.*.drm_fd = -@as(c_int, 1);
    }
}
pub fn KMSDRM_ConnectorCheckVrrCapable(drm_fd: u32, output_id: u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var found: bool = @"false" != 0;
    _ = &found;
    var prop_value: u64 = 0;
    _ = &prop_value;
    var props: drmModeObjectPropertiesPtr = KMSDRM_drmModeObjectGetProperties.?(@bitCast(@as(c_uint, @truncate(drm_fd))), output_id, DRM_MODE_OBJECT_CONNECTOR);
    _ = &props;
    if (props != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (!found and (i < props.*.count_props)) : (i +%= 1) {
                var prop: drmModePropertyPtr = KMSDRM_drmModeGetProperty.?(@bitCast(@as(c_uint, @truncate(drm_fd))), props.*.props[i]);
                _ = &prop;
                if (prop != null) {
                    if (SDL_strcasecmp_REAL(@ptrCast(@alignCast(&prop.*.name)), "VRR_CAPABLE") == @as(c_int, 0)) {
                        prop_value = props.*.prop_values[i];
                        found = @"true" != 0;
                    }
                    KMSDRM_drmModeFreeProperty.?(prop);
                }
            }
        }
        KMSDRM_drmModeFreeObjectProperties.?(props);
    }
    if (found) {
        return (if (prop_value != 0) @"true" else @"false") != 0;
    }
    return @"false" != 0;
}
pub fn KMSDRM_VrrPropId(drm_fd: u32, crtc_id: u32, vrr_prop_id: [*c]u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var found: bool = @"false" != 0;
    _ = &found;
    var props: drmModeObjectPropertiesPtr = KMSDRM_drmModeObjectGetProperties.?(@bitCast(@as(c_uint, @truncate(drm_fd))), crtc_id, DRM_MODE_OBJECT_CRTC);
    _ = &props;
    if (props != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (!found and (i < props.*.count_props)) : (i +%= 1) {
                var prop: drmModePropertyPtr = KMSDRM_drmModeGetProperty.?(@bitCast(@as(c_uint, @truncate(drm_fd))), props.*.props[i]);
                _ = &prop;
                if (prop != null) {
                    if (SDL_strcmp_REAL(@ptrCast(@alignCast(&prop.*.name)), "VRR_ENABLED") == @as(c_int, 0)) {
                        vrr_prop_id.* = prop.*.prop_id;
                        found = @"true" != 0;
                    }
                    KMSDRM_drmModeFreeProperty.?(prop);
                }
            }
        }
        KMSDRM_drmModeFreeObjectProperties.?(props);
    }
    return found;
}
pub fn KMSDRM_CrtcSetVrr(drm_fd: u32, crtc_id: u32, enabled: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vrr_prop_id: u32 = undefined;
    _ = &vrr_prop_id;
    if (!KMSDRM_VrrPropId(drm_fd, crtc_id, &vrr_prop_id)) {
        return;
    }
    _ = KMSDRM_drmModeObjectSetProperty.?(@bitCast(@as(c_uint, @truncate(drm_fd))), crtc_id, DRM_MODE_OBJECT_CRTC, vrr_prop_id, @intFromBool(enabled));
}
pub fn KMSDRM_CrtcGetVrr(drm_fd: u32, crtc_id: u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vrr_prop_id: u32 = 0;
    _ = &vrr_prop_id;
    var found: bool = @"false" != 0;
    _ = &found;
    var prop_value: u64 = 0;
    _ = &prop_value;
    if (!KMSDRM_VrrPropId(drm_fd, crtc_id, &vrr_prop_id)) {
        return @"false" != 0;
    }
    var props: drmModeObjectPropertiesPtr = KMSDRM_drmModeObjectGetProperties.?(@bitCast(@as(c_uint, @truncate(drm_fd))), crtc_id, DRM_MODE_OBJECT_CRTC);
    _ = &props;
    if (props != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (!found and (i < props.*.count_props)) : (i +%= 1) {
                var prop: drmModePropertyPtr = KMSDRM_drmModeGetProperty.?(@bitCast(@as(c_uint, @truncate(drm_fd))), props.*.props[i]);
                _ = &prop;
                if (prop != null) {
                    if (prop.*.prop_id == vrr_prop_id) {
                        prop_value = props.*.prop_values[i];
                        found = @"true" != 0;
                    }
                    KMSDRM_drmModeFreeProperty.?(prop);
                }
            }
        }
        KMSDRM_drmModeFreeObjectProperties.?(props);
    }
    if (found) {
        return (if (prop_value != 0) @"true" else @"false") != 0;
    }
    return @"false" != 0;
}
pub fn KMSDRM_CrtcGetOrientation(drm_fd: u32, crtc_id: u32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var found: bool = @"false" != 0;
    _ = &found;
    var orientation: c_int = 0;
    _ = &orientation;
    var props: drmModeObjectPropertiesPtr = KMSDRM_drmModeObjectGetProperties.?(@bitCast(@as(c_uint, @truncate(drm_fd))), crtc_id, DRM_MODE_OBJECT_CONNECTOR);
    _ = &props;
    if (props != null) {
        {
            var i: u32 = 0;
            _ = &i;
            while (!found and (i < props.*.count_props)) : (i +%= 1) {
                var prop: drmModePropertyPtr = KMSDRM_drmModeGetProperty.?(@bitCast(@as(c_uint, @truncate(drm_fd))), props.*.props[i]);
                _ = &prop;
                if (prop != null) {
                    if ((@as(u32, @bitCast(@as(c_int, @intFromBool(SDL_strcasecmp_REAL(@ptrCast(@alignCast(&prop.*.name)), "panel orientation") == @as(c_int, 0))))) != 0) and ((prop.*.flags & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3)))))) != 0)) {
                        if (prop.*.count_enums != 0) {
                            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&prop.*.enums[@as(c_int, 0)].name)), "Left Side Up") == @as(c_int, 0)) {
                                orientation = 90;
                            } else if (SDL_strcmp_REAL(@ptrCast(@alignCast(&prop.*.enums[@as(c_int, 0)].name)), "Upside Down") == @as(c_int, 0)) {
                                orientation = 180;
                            } else if (SDL_strcmp_REAL(@ptrCast(@alignCast(&prop.*.enums[@as(c_int, 0)].name)), "Right Side Up") == @as(c_int, 0)) {
                                orientation = 270;
                            }
                        }
                        found = @"true" != 0;
                    }
                    KMSDRM_drmModeFreeProperty.?(prop);
                }
            }
        }
        KMSDRM_drmModeFreeObjectProperties.?(props);
    }
    return orientation;
}
pub fn KMSDRM_AddDisplay(_this: [*c]SDL_VideoDevice, conn: [*c]drmModeConnector, resources: [*c]drmModeRes) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var dispdata: [*c]SDL_DisplayData = undefined;
    _ = &dispdata;
    var display: SDL_VideoDisplay = undefined;
    _ = &display;
    var modedata: [*c]SDL_DisplayModeData = undefined;
    _ = &modedata;
    var encoder: [*c]drmModeEncoder = undefined;
    _ = &encoder;
    var crtc: [*c]drmModeCrtc = undefined;
    _ = &crtc;
    var connector_type: [*c]const u8 = undefined;
    _ = &connector_type;
    var display_id: SDL_DisplayID = undefined;
    _ = &display_id;
    var display_properties: SDL_PropertiesID = undefined;
    _ = &display_properties;
    var name_fmt: [64]u8 = undefined;
    _ = &name_fmt;
    var orientation: c_int = undefined;
    _ = &orientation;
    var mode_index: c_int = undefined;
    _ = &mode_index;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var ret: c_int = undefined;
    _ = &ret;
    var mode: [*c]drmModeModeInfo = undefined;
    _ = &mode;
    var current_area: c_int = undefined;
    _ = &current_area;
    var largest_area: c_int = undefined;
    _ = &largest_area;
    var mode_1: [*c]drmModeModeInfo = undefined;
    _ = &mode_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                viddata = _this.*.internal;
                dispdata = null;
                display = SDL_VideoDisplay{
                    .id = 0,
                    .name = null,
                    .max_fullscreen_modes = 0,
                    .num_fullscreen_modes = 0,
                    .fullscreen_modes = null,
                    .desktop_mode = @import("std").mem.zeroes(SDL_DisplayMode),
                    .current_mode = null,
                    .natural_orientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
                    .current_orientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
                    .content_scale = 0,
                    .HDR = @import("std").mem.zeroes(SDL_HDROutputProperties),
                    .fullscreen_active = false,
                    .fullscreen_window = null,
                    .device = null,
                    .props = 0,
                    .internal = null,
                };
                modedata = null;
                encoder = null;
                crtc = null;
                connector_type = null;
                ret = 0;
                dispdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayData))));
                if (!(dispdata != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (encoder != null) {
                    sdl_pc = 112;
                    continue;
                } else {
                    sdl_pc = 113;
                    continue;
                }
            },
            2 => {
                ret = -@as(c_int, 1);
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
                dispdata.*.cursor_bo = null;
                dispdata.*.cursor_bo_drm_fd = -@as(c_int, 1);
                dispdata.*.kms_in_fence_fd = -@as(c_int, 1);
                dispdata.*.kms_out_fence_fd = -@as(c_int, 1);
                dispdata.*.default_cursor_init = @"false" != 0;
                i = 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (i < resources.*.count_encoders) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                encoder = KMSDRM_drmModeGetEncoder.?(viddata.*.drm_fd, resources.*.encoders[@bitCast(@as(isize, @intCast(i)))]);
                if (!(encoder != null)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                i += 1;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                if (!(encoder != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 7;
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
                if (encoder.*.encoder_id == conn.*.encoder_id) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 8;
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
                KMSDRM_drmModeFreeEncoder.?(encoder);
                encoder = null;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            15 => {
                i = 0;
                {
                    sdl_pc = 18;
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
                if (!(encoder != null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            18 => {
                if (i < resources.*.count_encoders) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                encoder = KMSDRM_drmModeGetEncoder.?(viddata.*.drm_fd, resources.*.encoders[@bitCast(@as(isize, @intCast(i)))]);
                if (!(encoder != null)) {
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 20;
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
                j = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (j < conn.*.count_encoders) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                if (conn.*.encoders[@bitCast(@as(isize, @intCast(j)))] == encoder.*.encoder_id) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                j += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                if (j != conn.*.count_encoders) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 28;
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
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 21;
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
                KMSDRM_drmModeFreeEncoder.?(encoder);
                encoder = null;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            35 => {
                ret = @intFromBool(SDL_SetError_REAL("No connected encoder found for connector."));
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
                crtc = KMSDRM_drmModeGetCrtc.?(viddata.*.drm_fd, encoder.*.crtc_id);
                if (!(crtc != null)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                i = 0;
                {
                    sdl_pc = 41;
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
                if (!(crtc != null)) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            41 => {
                if (i < resources.*.count_crtcs) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            42 => {
                if ((encoder.*.possible_crtcs & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(i))))) != 0) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            43 => {
                i += 1;
                {
                    sdl_pc = 41;
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
                encoder.*.crtc_id = resources.*.crtcs[@bitCast(@as(isize, @intCast(i)))];
                crtc = KMSDRM_drmModeGetCrtc.?(viddata.*.drm_fd, encoder.*.crtc_id);
                {
                    sdl_pc = 44;
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
                    sdl_pc = 43;
                    continue;
                }
            },
            48 => {
                ret = @intFromBool(SDL_SetError_REAL("No CRTC found for connector."));
                {
                    sdl_pc = 1;
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
                mode_index = -@as(c_int, 1);
                i = 0;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                if (i < conn.*.count_modes) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            52 => {
                mode = &conn.*.modes[@bitCast(@as(isize, @intCast(i)))];
                if (!(SDL_memcmp_REAL(@ptrCast(@alignCast(mode)), @ptrCast(@alignCast(&crtc.*.mode)), @sizeOf(@TypeOf(crtc.*.mode))) != 0)) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            53 => {
                i += 1;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            54 => {
                if (mode_index == -@as(c_int, 1)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            55 => {
                mode_index = i;
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
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            58 => {
                largest_area = 0;
                i = 0;
                {
                    sdl_pc = 61;
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
                if (mode_index == -@as(c_int, 1)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            61 => {
                if (i < conn.*.count_modes) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                mode_1 = &conn.*.modes[@bitCast(@as(isize, @intCast(i)))];
                if ((mode_1.*.type & @as(u32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 3)))))) != 0) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                i += 1;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            64 => {
                if (mode_index != -@as(c_int, 1)) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            65 => {
                mode_index = i;
                {
                    sdl_pc = 64;
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
                current_area = @as(c_int, mode_1.*.hdisplay) * @as(c_int, mode_1.*.vdisplay);
                if (current_area > largest_area) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                mode_index = i;
                largest_area = current_area;
                {
                    sdl_pc = 70;
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
                    sdl_pc = 63;
                    continue;
                }
            },
            71 => {
                crtc.*.mode = conn.*.modes[@bitCast(@as(isize, @intCast(mode_index)))];
                {
                    sdl_pc = 73;
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
                    sdl_pc = 60;
                    continue;
                }
            },
            74 => {
                ret = @intFromBool(SDL_SetError_REAL("Failed to find index of mode attached to the CRTC."));
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
                dispdata.*.mode = crtc.*.mode;
                dispdata.*.original_mode = crtc.*.mode;
                dispdata.*.fullscreen_mode = crtc.*.mode;
                if ((@as(c_int, dispdata.*.mode.hdisplay) == @as(c_int, 0)) or (@as(c_int, dispdata.*.mode.vdisplay) == @as(c_int, 0))) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                ret = @intFromBool(SDL_SetError_REAL("Couldn't get a valid connector videomode."));
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
                dispdata.*.connector.connector = conn;
                dispdata.*.crtc.crtc = crtc;
                dispdata.*.saved_vrr = KMSDRM_CrtcGetVrr(@bitCast(@as(c_int, viddata.*.drm_fd)), crtc.*.crtc_id);
                if (KMSDRM_ConnectorCheckVrrCapable(@bitCast(@as(c_int, viddata.*.drm_fd)), conn.*.connector_id)) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            80 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Enabling VRR");
                KMSDRM_CrtcSetVrr(@bitCast(@as(c_int, viddata.*.drm_fd)), crtc.*.crtc_id, @"true" != 0);
                {
                    sdl_pc = 82;
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
                if (KMSDRM_drmModeGetConnectorTypeName != null) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                connector_type = KMSDRM_drmModeGetConnectorTypeName.?(conn.*.connector_type);
                if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(connector_type)))) == @as(?*anyopaque, null)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
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
                dispdata.*.crtc.props = KMSDRM_drmModeObjectGetProperties.?(viddata.*.drm_fd, crtc.*.crtc_id, DRM_MODE_OBJECT_CRTC);
                dispdata.*.crtc.props_info = @ptrCast(@alignCast(SDL_calloc_REAL(dispdata.*.crtc.props.*.count_props, @sizeOf(@TypeOf(dispdata.*.crtc.props_info.*)))));
                if (!(dispdata.*.crtc.props_info != null)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            86 => {
                connector_type = "Unknown";
                {
                    sdl_pc = 88;
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
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s-%u", connector_type, conn.*.connector_type_id);
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                ret = @"false";
                {
                    sdl_pc = 1;
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
                i = 0;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                if (@as(u32, @bitCast(@as(c_int, i))) < dispdata.*.crtc.props.*.count_props) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 95;
                    continue;
                }
            },
            93 => {
                dispdata.*.crtc.props_info[@bitCast(@as(isize, @intCast(i)))] = KMSDRM_drmModeGetProperty.?(viddata.*.drm_fd, dispdata.*.crtc.props.*.props[@bitCast(@as(isize, @intCast(i)))]);
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                i += 1;
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            95 => {
                dispdata.*.connector.props = KMSDRM_drmModeObjectGetProperties.?(viddata.*.drm_fd, conn.*.connector_id, DRM_MODE_OBJECT_CONNECTOR);
                dispdata.*.connector.props_info = @ptrCast(@alignCast(SDL_calloc_REAL(dispdata.*.connector.props.*.count_props, @sizeOf(@TypeOf(dispdata.*.connector.props_info.*)))));
                if (!(dispdata.*.connector.props_info != null)) {
                    sdl_pc = 96;
                    continue;
                } else {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                ret = @"false";
                {
                    sdl_pc = 1;
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
                i = 0;
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            99 => {
                if (@as(u32, @bitCast(@as(c_int, i))) < dispdata.*.connector.props.*.count_props) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            100 => {
                dispdata.*.connector.props_info[@bitCast(@as(isize, @intCast(i)))] = KMSDRM_drmModeGetProperty.?(viddata.*.drm_fd, dispdata.*.connector.props.*.props[@bitCast(@as(isize, @intCast(i)))]);
                {
                    sdl_pc = 101;
                    continue;
                }
            },
            101 => {
                i += 1;
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            102 => {
                modedata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayModeData))));
                if (!(modedata != null)) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            103 => {
                ret = -@as(c_int, 1);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                modedata.*.mode_index = mode_index;
                display.internal = dispdata;
                display.desktop_mode.w = dispdata.*.mode.hdisplay;
                display.desktop_mode.h = dispdata.*.mode.vdisplay;
                CalculateRefreshRate(&dispdata.*.mode, &display.desktop_mode.refresh_rate_numerator, &display.desktop_mode.refresh_rate_denominator);
                display.desktop_mode.format = SDL_PIXELFORMAT_ARGB8888;
                display.desktop_mode.internal = modedata;
                if (connector_type != null) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                display.name = @ptrCast(@alignCast(&name_fmt));
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                display_id = SDL_AddVideoDisplay(&display, @"false" != 0);
                if (!(display_id != 0)) {
                    sdl_pc = 109;
                    continue;
                } else {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                ret = -@as(c_int, 1);
                {
                    sdl_pc = 1;
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
                orientation = KMSDRM_CrtcGetOrientation(@bitCast(@as(c_int, viddata.*.drm_fd)), crtc.*.crtc_id);
                display_properties = SDL_GetDisplayProperties_REAL(display_id);
                _ = SDL_SetNumberProperty_REAL(display_properties, "SDL.display.KMSDRM.panel_orientation", orientation);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            112 => {
                KMSDRM_drmModeFreeEncoder.?(encoder);
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
                if (ret != 0) {
                    sdl_pc = 115;
                    continue;
                } else {
                    sdl_pc = 116;
                    continue;
                }
            },
            115 => {
                if (dispdata != null) {
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
                {}
            },
            118 => {
                if (dispdata.*.connector.connector != null) {
                    sdl_pc = 121;
                    continue;
                } else {
                    sdl_pc = 122;
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
                    sdl_pc = 117;
                    continue;
                }
            },
            121 => {
                KMSDRM_drmModeFreeConnector.?(dispdata.*.connector.connector);
                {
                    sdl_pc = 123;
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
                if (dispdata.*.crtc.crtc != null) {
                    sdl_pc = 124;
                    continue;
                } else {
                    sdl_pc = 125;
                    continue;
                }
            },
            124 => {
                KMSDRM_drmModeFreeCrtc.?(dispdata.*.crtc.crtc);
                {
                    sdl_pc = 126;
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
                SDL_free_REAL(@ptrCast(@alignCast(dispdata.*.connector.props_info)));
                SDL_free_REAL(@ptrCast(@alignCast(dispdata.*.crtc.props_info)));
                SDL_free_REAL(@ptrCast(@alignCast(dispdata.*.display_plane)));
                SDL_free_REAL(@ptrCast(@alignCast(dispdata)));
                {
                    sdl_pc = 120;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn KMSDRM_SortDisplays(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var name_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_DISPLAY_PRIORITY");
    _ = &name_hint;
    if (name_hint != null) {
        var saveptr: [*c]u8 = undefined;
        _ = &saveptr;
        var str: [*c]u8 = SDL_strdup_REAL(name_hint);
        _ = &str;
        var sorted_list: [*c][*c]SDL_VideoDisplay = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]SDL_VideoDisplay) *% @as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays))))));
        _ = &sorted_list;
        if ((str != null) and (sorted_list != null)) {
            var sorted_index: c_int = 0;
            _ = &sorted_index;
            var token: [*c]const u8 = SDL_strtok_r_REAL(str, ",", &saveptr);
            _ = &token;
            while (token != null) {
                {
                    var i: c_int = 0;
                    _ = &i;
                    while (i < _this.*.num_displays) : (i += 1) {
                        var d: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                        _ = &d;
                        if ((d != null) and (SDL_strcmp_REAL(token, d.*.name) == @as(c_int, 0))) {
                            sorted_list[
                                @bitCast(@as(isize, @intCast(blk: {
                                    const ref = &sorted_index;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                })))
                            ] = d;
                            _this.*.displays[@bitCast(@as(isize, @intCast(i)))] = null;
                            break;
                        }
                    }
                }
                token = SDL_strtok_r_REAL(null, ",", &saveptr);
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (i < _this.*.num_displays) : (i += 1) {
                    if (_this.*.displays[@bitCast(@as(isize, @intCast(i)))] != null) {
                        sorted_list[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &sorted_index;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ] = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
                    }
                }
            }
            _ = memcpy(@ptrCast(@alignCast(_this.*.displays)), @ptrCast(@alignCast(sorted_list)), @sizeOf([*c]SDL_VideoDisplay) *% @as(c_ulong, @bitCast(@as(c_long, _this.*.num_displays))));
        }
        SDL_free_REAL(@ptrCast(@alignCast(str)));
        SDL_free_REAL(@ptrCast(@alignCast(sorted_list)));
    }
}
pub fn set_client_atomic_caps(fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!SDL_GetHintBoolean_REAL("SDL_KMSDRM_ATOMIC", @"true" != 0)) {
        return @"false" != 0;
    } else if (KMSDRM_drmSetClientCap.?(fd, DRM_CLIENT_CAP_ATOMIC, 1) != 0) {
        return @"false" != 0;
    } else if (KMSDRM_drmSetClientCap.?(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1) != 0) {
        _ = KMSDRM_drmSetClientCap.?(fd, DRM_CLIENT_CAP_ATOMIC, 0);
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn KMSDRM_InitDisplays(_this: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var resources: [*c]drmModeRes = undefined;
    _ = &resources;
    var async_pageflip: u64 = undefined;
    _ = &async_pageflip;
    var i: c_int = undefined;
    _ = &i;
    var result: bool = undefined;
    _ = &result;
    var conn: [*c]drmModeConnector = undefined;
    _ = &conn;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                viddata = _this.*.internal;
                resources = null;
                async_pageflip = 0;
                result = @"true" != 0;
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&viddata.*.devpath)), @sizeOf(@TypeOf(viddata.*.devpath)), "%s%d", @as([*c]u8, @ptrCast(@alignCast(&kmsdrm_dri_cardpath))), viddata.*.devindex);
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Opening device %s", @as([*c]u8, @ptrCast(@alignCast(&viddata.*.devpath))));
                viddata.*.drm_fd = open(@ptrCast(@alignCast(&viddata.*.devpath)), O_RDWR | __O_CLOEXEC);
                if (viddata.*.drm_fd < @as(c_int, 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (resources != null) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            2 => {
                result = SDL_SetError_REAL("Could not open %s", @as([*c]u8, @ptrCast(@alignCast(&viddata.*.devpath))));
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
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Opened DRM FD (%d)", viddata.*.drm_fd);
                viddata.*.is_atomic = set_client_atomic_caps(viddata.*.drm_fd);
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "DRM FD (%d) %s atomic", viddata.*.drm_fd, if (viddata.*.is_atomic) @as([*c]u8, @as([*c]u8, @constCast("SUPPORTS"))) else @as([*c]u8, @as([*c]u8, @constCast("DOES NOT SUPPORT"))));
                resources = KMSDRM_drmModeGetResources.?(viddata.*.drm_fd);
                if (!(resources != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                result = SDL_SetError_REAL("drmModeGetResources(%d) failed", viddata.*.drm_fd);
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
                i = 0;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (i < resources.*.count_connectors) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                conn = KMSDRM_drmModeGetConnector.?(viddata.*.drm_fd, resources.*.connectors[@bitCast(@as(isize, @intCast(i)))]);
                if (!(conn != null)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                i += 1;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                if (SDL_GetPrimaryDisplay_REAL() == @as(SDL_DisplayID, 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if ((conn.*.connection == @as(drmModeConnection, DRM_MODE_CONNECTED)) and (conn.*.count_modes != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                KMSDRM_AddDisplay(_this, conn, resources);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                KMSDRM_drmModeFreeConnector.?(conn);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                result = SDL_SetError_REAL("No connected displays found.");
                {
                    sdl_pc = 1;
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
                KMSDRM_SortDisplays(_this);
                if (KMSDRM_drmGetCap.?(viddata.*.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP, &async_pageflip) != @as(c_int, 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Could not determine async page flip capability.");
                {
                    sdl_pc = 23;
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
                viddata.*.async_pageflip_support = (if (async_pageflip != 0) @"true" else @"false") != 0;
                if (!KMSDRM_DropMaster(_this)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                _ = close(viddata.*.drm_fd);
                viddata.*.drm_fd = -@as(c_int, 1);
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
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                KMSDRM_drmModeFreeResources.?(resources);
                {
                    sdl_pc = 29;
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
                if (!result) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                if (viddata.*.drm_fd >= @as(c_int, 0)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
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
                return result;
            },
            33 => {
                _ = close(viddata.*.drm_fd);
                viddata.*.drm_fd = -@as(c_int, 1);
                {
                    sdl_pc = 35;
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
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn KMSDRM_GBMInit(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var result: bool = @"true" != 0;
    _ = &result;
    if (viddata.*.drm_fd < @as(c_int, 0)) {
        viddata.*.drm_fd = open(@ptrCast(@alignCast(&viddata.*.devpath)), O_RDWR | __O_CLOEXEC);
        if (viddata.*.drm_fd < @as(c_int, 0)) {
            return SDL_SetError_REAL("Could not reopen %s", @as([*c]u8, @ptrCast(@alignCast(&viddata.*.devpath))));
        }
    }
    viddata.*.is_atomic = set_client_atomic_caps(viddata.*.drm_fd);
    _ = KMSDRM_drmSetMaster.?(viddata.*.drm_fd);
    viddata.*.gbm_dev = KMSDRM_gbm_create_device.?(viddata.*.drm_fd);
    if (!(viddata.*.gbm_dev != null)) {
        result = SDL_SetError_REAL("Couldn't create gbm device.");
    } else {
        result = setup_plane(_this, dispdata, &dispdata.*.display_plane, DRM_PLANE_TYPE_PRIMARY);
        if (!result) {
            _ = SDL_SetError_REAL("can't find suitable display plane.");
        }
    }
    viddata.*.gbm_init = @"true" != 0;
    return result;
}
pub fn KMSDRM_GBMDeinit(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    free_plane(&dispdata.*.display_plane);
    free_plane(&dispdata.*.cursor_plane);
    if (viddata.*.gbm_dev != null) {
        KMSDRM_gbm_device_destroy.?(viddata.*.gbm_dev);
        viddata.*.gbm_dev = null;
    }
    if ((viddata.*.drm_fd >= @as(c_int, 0)) and !KMSDRM_DropMaster(_this)) {
        _ = close(viddata.*.drm_fd);
        viddata.*.drm_fd = -@as(c_int, 1);
    }
    viddata.*.gbm_init = @"false" != 0;
}
pub fn KMSDRM_DestroySurfaces(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &dispdata;
    var ret: c_int = undefined;
    _ = &ret;
    if (viddata.*.is_atomic) {
        var plane_info: KMSDRM_PlaneInfo = undefined;
        _ = &plane_info;
        _ = memset(@ptrCast(@alignCast(&plane_info)), 0, @sizeOf(@TypeOf(plane_info)));
        plane_info.plane = dispdata.*.display_plane;
        plane_info.crtc_id = dispdata.*.crtc.crtc.*.crtc_id;
        plane_info.fb_id = dispdata.*.crtc.crtc.*.buffer_id;
        plane_info.src_w = dispdata.*.original_mode.hdisplay;
        plane_info.src_h = dispdata.*.original_mode.vdisplay;
        plane_info.crtc_w = dispdata.*.original_mode.hdisplay;
        plane_info.crtc_h = dispdata.*.original_mode.vdisplay;
        drm_atomic_set_plane_props(dispdata, &plane_info);
        if (drm_atomic_commit(_this, dispdata, @"true" != 0, @"false" != 0) != 0) {
            _ = SDL_SetError_REAL("Failed to issue atomic commit on surfaces destruction.");
        }
    }
    ret = KMSDRM_drmModeSetCrtc.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, dispdata.*.crtc.crtc.*.buffer_id, 0, 0, &dispdata.*.connector.connector.*.connector_id, 1, &dispdata.*.original_mode);
    if ((ret != 0) and (dispdata.*.crtc.crtc.*.mode_valid == @as(c_int, 0))) {
        ret = KMSDRM_drmModeSetCrtc.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, dispdata.*.crtc.crtc.*.buffer_id, 0, 0, &dispdata.*.connector.connector.*.connector_id, 1, &dispdata.*.original_mode);
    }
    if (ret != 0) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Could not restore CRTC");
    }
    if (windata.*.bo != null) {
        if (windata.*.bo != windata.*.next_bo) {
            KMSDRM_gbm_surface_release_buffer.?(windata.*.gs, windata.*.bo);
        }
        windata.*.bo = null;
    }
    if (windata.*.next_bo != null) {
        KMSDRM_gbm_surface_release_buffer.?(windata.*.gs, windata.*.next_bo);
        windata.*.next_bo = null;
    }
    _ = SDL_EGL_MakeCurrent(_this, null, null);
    if (windata.*.egl_surface != @as(EGLSurface, null)) {
        SDL_EGL_DestroySurface(_this, windata.*.egl_surface);
        windata.*.egl_surface = null;
    }
    if (windata.*.gs != null) {
        KMSDRM_gbm_surface_destroy.?(windata.*.gs);
        windata.*.gs = null;
    }
}
pub fn KMSDRM_GetModeToSet(window: [*c]SDL_Window, out_mode: [*c]drmModeModeInfo) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForWindow(window);
    _ = &display;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    if (window.*.fullscreen_exclusive) {
        out_mode.* = dispdata.*.fullscreen_mode;
    } else {
        var mode: [*c]drmModeModeInfo = KMSDRM_GetClosestDisplayMode(display, window.*.windowed.w, window.*.windowed.h);
        _ = &mode;
        if (mode != null) {
            out_mode.* = mode.*;
        } else {
            out_mode.* = dispdata.*.original_mode;
        }
    }
}
pub fn KMSDRM_DirtySurfaces(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var mode: drmModeModeInfo = undefined;
    _ = &mode;
    windata.*.egl_surface_dirty = @"true" != 0;
    KMSDRM_GetModeToSet(window, &mode);
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, mode.hdisplay, mode.vdisplay);
}
pub export fn KMSDRM_CreateSurfaces(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "KMSDRM_CreateSurfaces".*;
    };
    _ = &static_local___func__;
    const struct_unnamed_57 = extern struct {
        fmt: u32 = 0,
        name: [*c]const u8 = null,
        r: c_int = 0,
        g: c_int = 0,
        b: c_int = 0,
        a: c_int = 0,
    };
    _ = &struct_unnamed_57;
    const static_local_gbm_formats = struct {
        const gbm_formats: [26]struct_unnamed_57 = [26]struct_unnamed_57{
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "ARGB8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 8,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "ABGR8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 8,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "BGRA8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 8,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "RGBA8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 8,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "BGRX8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "RGBX8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "XRGB8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))),
                .name = "XBGR8888",
                .r = 8,
                .g = 8,
                .b = 8,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "RGBA1010102",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 2,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "BGRA1010102",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 2,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "ARGB2101010",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 2,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "ABGR2101010",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 2,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "XRGB2101010",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "XBGR2101010",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "RGBX1010102",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '3')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '0')))) << @intCast(@as(u32, 24))),
                .name = "BGRX1010102",
                .r = 10,
                .g = 10,
                .b = 10,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "ARGB1555",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 1,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "ABGR1555",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 1,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "RGBA5551",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 1,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "BGRA5551",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 1,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "XRGB1555",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "XBGR1555",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "RGBX5551",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'X')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '5')))) << @intCast(@as(u32, 24))),
                .name = "BGRX5551",
                .r = 5,
                .g = 5,
                .b = 5,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'G')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '6')))) << @intCast(@as(u32, 24))),
                .name = "RGB565",
                .r = 5,
                .g = 6,
                .b = 5,
                .a = 0,
            },
            struct_unnamed_57{
                .fmt = ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'B')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'G')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '1')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '6')))) << @intCast(@as(u32, 24))),
                .name = "BGR565",
                .r = 5,
                .g = 6,
                .b = 5,
                .a = 0,
            },
        };
    };
    _ = &static_local_gbm_formats;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForWindow(window);
    _ = &display;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var egl_context: EGLContext = undefined;
    _ = &egl_context;
    var result: bool = @"false" != 0;
    _ = &result;
    if (windata.*.gs != null) {
        KMSDRM_DestroySurfaces(_this, window);
    }
    var tried_setting_format: bool = @"false" != 0;
    _ = &tried_setting_format;
    const surface_flags: u32 = @bitCast(@as(c_int, GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING));
    _ = &surface_flags;
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(static_local_gbm_formats.gbm_formats)) / @sizeOf(@TypeOf(static_local_gbm_formats.gbm_formats[@as(c_int, 0)])))) : (i += 1) {
            const surface_fmt: u32 = static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].fmt;
            _ = &surface_fmt;
            SDL_Log_REAL("KMSDRM: Trying format GBM_FORMAT_%s", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name);
            if (!(KMSDRM_gbm_device_is_format_supported.?(viddata.*.gbm_dev, surface_fmt, surface_flags) != 0)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM: GBM_FORMAT_%s is not supported.", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name);
                continue;
            }
            tried_setting_format = @"true" != 0;
            KMSDRM_GetModeToSet(window, &dispdata.*.mode);
            windata.*.gs = KMSDRM_gbm_surface_create.?(viddata.*.gbm_dev, dispdata.*.mode.hdisplay, dispdata.*.mode.vdisplay, surface_fmt, surface_flags);
            if (!(windata.*.gs != null) and (__errno_location().* == ENOSYS)) {
                windata.*.gs = KMSDRM_gbm_surface_create.?(viddata.*.gbm_dev, dispdata.*.mode.hdisplay, dispdata.*.mode.vdisplay, surface_fmt, 0);
            }
            if (!(windata.*.gs != null)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM: gbm_surface_create(GBM_FORMAT_%s) failed.", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name);
                _ = SDL_SetError_REAL("Could not create %s GBM surface: %s", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name, strerror(__errno_location().*));
                continue;
            }
            SDL_EGL_SetRequiredVisualId(_this, @bitCast(@as(c_uint, @truncate(surface_fmt))));
            windata.*.egl_surface = SDL_EGL_CreateSurface(_this, window, @intCast(@intFromPtr(windata.*.gs)));
            if (windata.*.egl_surface == @as(EGLSurface, null)) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM: SDL_EGL_CreateSurface(GBM_FORMAT_%s) failed: %s", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name, SDL_GetError_REAL());
                KMSDRM_gbm_surface_destroy.?(windata.*.gs);
                windata.*.gs = null;
                continue;
            }
            egl_context = @ptrCast(@alignCast(SDL_GL_GetCurrentContext_REAL()));
            result = SDL_EGL_MakeCurrent(_this, windata.*.egl_surface, @ptrCast(@alignCast(egl_context)));
            if (!result) {
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM: SDL_EGL_MakeCurrent with GBM_FORMAT_%s failed: %s", static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].name, SDL_GetError_REAL());
                continue;
            }
            _this.*.gl_config.red_size = static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].r;
            _this.*.gl_config.green_size = static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].g;
            _this.*.gl_config.blue_size = static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].b;
            _this.*.gl_config.alpha_size = static_local_gbm_formats.gbm_formats[@bitCast(@as(isize, @intCast(i)))].a;
            windata.*.egl_surface_dirty = @"false" != 0;
            result = @"true" != 0;
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, dispdata.*.mode.hdisplay, dispdata.*.mode.vdisplay);
            break;
        }
    }
    while (true) {
        while (!(result or (@as(?*anyopaque, @ptrCast(@alignCast(windata.*.gs))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "result || (windata->gs == ((void*)0))",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_kmsdrmvideo.c", 1883);
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
    if (!result) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM: Failed to create surfaces in _any_ format!");
        if (!tried_setting_format) {
            _ = SDL_SetError_REAL("Could not find any supported GBM surface format.");
        }
    }
    return result;
}
pub fn KMSDRM_ReleaseVT(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = @ptrCast(@alignCast(userdata));
    _ = &_this;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < viddata.*.num_windows) : (i += 1) {
            var window: [*c]SDL_Window = viddata.*.windows[@bitCast(@as(isize, @intCast(i)))];
            _ = &window;
            if (!((window.*.flags & @as(c_ulong, 268435456)) != 0)) {
                KMSDRM_DestroySurfaces(_this, window);
            }
        }
    }
    _ = KMSDRM_drmDropMaster.?(viddata.*.drm_fd);
}
pub fn KMSDRM_AcquireVT(userdata: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = @ptrCast(@alignCast(userdata));
    _ = &_this;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var i: c_int = undefined;
    _ = &i;
    _ = KMSDRM_drmSetMaster.?(viddata.*.drm_fd);
    {
        i = 0;
        while (i < viddata.*.num_windows) : (i += 1) {
            var window: [*c]SDL_Window = viddata.*.windows[@bitCast(@as(isize, @intCast(i)))];
            _ = &window;
            if (!((window.*.flags & @as(c_ulong, 268435456)) != 0)) {
                _ = KMSDRM_CreateSurfaces(_this, window);
            }
        }
    }
}
pub export fn KMSDRM_VideoInit(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "KMSDRM_VideoInit()");
    viddata.*.video_init = @"false" != 0;
    viddata.*.gbm_init = @"false" != 0;
    if (!KMSDRM_InitDisplays(_this)) {
        result = SDL_SetError_REAL("error getting KMSDRM displays information");
    }
    _ = SDL_EVDEV_Init();
    SDL_EVDEV_SetVTSwitchCallbacks(KMSDRM_ReleaseVT, @ptrCast(@alignCast(_this)), KMSDRM_AcquireVT, @ptrCast(@alignCast(_this)));
    viddata.*.video_init = @"true" != 0;
    return result;
}
pub export fn KMSDRM_VideoQuit(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    KMSDRM_DeinitDisplays(_this);
    SDL_EVDEV_SetVTSwitchCallbacks(null, null, null, null);
    SDL_EVDEV_Quit();
    SDL_free_REAL(@ptrCast(@alignCast(viddata.*.windows)));
    viddata.*.windows = null;
    viddata.*.max_windows = 0;
    viddata.*.num_windows = 0;
    viddata.*.video_init = @"false" != 0;
}
pub export fn KMSDRM_GetDisplayModes(_: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) bool {
    @setEvalBranchQuota(100000);
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var conn: [*c]drmModeConnector = dispdata.*.connector.connector;
    _ = &conn;
    var mode: SDL_DisplayMode = undefined;
    _ = &mode;
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < conn.*.count_modes) : (i += 1) {
            var modedata: [*c]SDL_DisplayModeData = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisplayModeData))));
            _ = &modedata;
            if (modedata != null) {
                modedata.*.mode_index = i;
            }
            _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
            mode.w = conn.*.modes[@bitCast(@as(isize, @intCast(i)))].hdisplay;
            mode.h = conn.*.modes[@bitCast(@as(isize, @intCast(i)))].vdisplay;
            CalculateRefreshRate(&conn.*.modes[@bitCast(@as(isize, @intCast(i)))], &mode.refresh_rate_numerator, &mode.refresh_rate_denominator);
            mode.format = SDL_PIXELFORMAT_ARGB8888;
            mode.internal = modedata;
            if (!SDL_AddFullscreenDisplayMode(display, &mode)) {
                SDL_free_REAL(@ptrCast(@alignCast(modedata)));
            }
        }
    }
    return @"true" != 0;
}
pub export fn KMSDRM_SetDisplayMode(_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, mode: [*c]SDL_DisplayMode) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var modedata: [*c]SDL_DisplayModeData = mode.*.internal;
    _ = &modedata;
    var conn: [*c]drmModeConnector = dispdata.*.connector.connector;
    _ = &conn;
    var i: c_int = undefined;
    _ = &i;
    if (viddata.*.vulkan_mode) {
        return @"true" != 0;
    }
    if (!(modedata != null)) {
        return SDL_SetError_REAL("Mode doesn't have an associated index");
    }
    dispdata.*.fullscreen_mode = conn.*.modes[@bitCast(@as(isize, @intCast(modedata.*.mode_index)))];
    {
        i = 0;
        while (i < viddata.*.num_windows) : (i += 1) {
            KMSDRM_DirtySurfaces(viddata.*.windows[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    return @"true" != 0;
}
pub export fn KMSDRM_DestroyWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = window.*.internal;
    _ = &windata;
    var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
    _ = &dispdata;
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var is_vulkan: bool = (window.*.flags & @as(c_ulong, 268435456)) != 0;
    _ = &is_vulkan;
    var i: c_uint = undefined;
    _ = &i;
    var j: c_uint = undefined;
    _ = &j;
    if (!(windata != null)) {
        return;
    }
    KMSDRM_CrtcSetVrr(@bitCast(@as(c_int, windata.*.viddata.*.drm_fd)), dispdata.*.crtc.crtc.*.crtc_id, dispdata.*.saved_vrr);
    viddata = windata.*.viddata;
    if (!is_vulkan and viddata.*.gbm_init) {
        KMSDRM_DestroyCursorBO(_this, SDL_GetVideoDisplayForWindow(window));
        KMSDRM_DestroySurfaces(_this, window);
        if (viddata.*.num_windows <= @as(c_int, 1)) {
            if (_this.*.egl_data != null) {
                SDL_EGL_UnloadLibrary(_this);
                _this.*.gl_config.driver_loaded = 0;
            }
            KMSDRM_GBMDeinit(_this, dispdata);
        }
    } else {
        if (viddata.*.vulkan_mode) {
            viddata.*.vulkan_mode = @"false" != 0;
        }
    }
    {
        i = 0;
        while (i < @as(c_uint, @bitCast(@as(c_int, viddata.*.num_windows)))) : (i +%= 1) {
            if (viddata.*.windows[i] == window) {
                viddata.*.num_windows -= 1;
                {
                    j = i;
                    while (j < @as(c_uint, @bitCast(@as(c_int, viddata.*.num_windows)))) : (j +%= 1) {
                        viddata.*.windows[j] = viddata.*.windows[j +% @as(c_uint, 1)];
                    }
                }
                break;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(window.*.internal)));
    window.*.internal = null;
}
pub export fn KMSDRM_CreateWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var windata: [*c]SDL_WindowData = null;
    _ = &windata;
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForWindow(window);
    _ = &display;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var is_vulkan: bool = (window.*.flags & @as(c_ulong, 268435456)) != 0;
    _ = &is_vulkan;
    var vulkan_mode: bool = viddata.*.vulkan_mode;
    _ = &vulkan_mode;
    var egl_display: NativeDisplayType = undefined;
    _ = &egl_display;
    var mode: [*c]drmModeModeInfo = undefined;
    _ = &mode;
    var result: bool = @"true" != 0;
    _ = &result;
    windata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_WindowData))));
    if (!(windata != null)) {
        return @"false" != 0;
    }
    windata.*.viddata = viddata;
    window.*.internal = windata;
    windata.*.double_buffer = @"false" != 0;
    if (SDL_GetHintBoolean_REAL("SDL_VIDEO_DOUBLE_BUFFER", @"false" != 0)) {
        windata.*.double_buffer = @"true" != 0;
    }
    if (!is_vulkan and !vulkan_mode) {
        window.*.flags |= 2;
        if (!viddata.*.gbm_init) {
            if (!KMSDRM_GBMInit(_this, dispdata)) {
                return SDL_SetError_REAL("Can't init GBM on window creation.");
            }
        }
        if (!(_this.*.egl_data != null)) {
            egl_display = @ptrCast(@alignCast(_this.*.internal.*.gbm_dev));
            if (!SDL_EGL_LoadLibrary(_this, null, egl_display)) {
                _this.*.gl_config.profile_mask = SDL_GL_CONTEXT_PROFILE_ES;
                _this.*.gl_config.major_version = 2;
                _this.*.gl_config.minor_version = 0;
                if (!SDL_EGL_LoadLibrary(_this, null, egl_display)) {
                    return SDL_SetError_REAL("Can't load EGL/GL library on window creation.");
                }
            }
            _this.*.gl_config.driver_loaded = 1;
        }
        _ = KMSDRM_CreateCursorBO(display);
        KMSDRM_InitMouse(_this, display);
        mode = KMSDRM_GetClosestDisplayMode(display, window.*.windowed.w, window.*.windowed.h);
        if (mode != null) {
            dispdata.*.fullscreen_mode = mode.*;
        } else {
            dispdata.*.fullscreen_mode = dispdata.*.original_mode;
        }
        if (!KMSDRM_CreateSurfaces(_this, window)) {
            return @"false" != 0;
        }
    }
    if (viddata.*.num_windows >= viddata.*.max_windows) {
        var new_max_windows: c_uint = @bitCast(@as(c_int, viddata.*.max_windows + @as(c_int, 1)));
        _ = &new_max_windows;
        var new_windows: [*c][*c]SDL_Window = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(viddata.*.windows)), @as(c_ulong, new_max_windows) *% @sizeOf([*c]SDL_Window))));
        _ = &new_windows;
        if (!(new_windows != null)) {
            return @"false" != 0;
        }
        viddata.*.windows = new_windows;
        viddata.*.max_windows = @bitCast(@as(c_uint, @truncate(new_max_windows)));
    }
    viddata.*.windows[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &viddata.*.num_windows;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = window;
    viddata.*.vulkan_mode = is_vulkan;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.kmsdrm.dev_index", viddata.*.devindex);
    _ = SDL_SetNumberProperty_REAL(props, "SDL.window.kmsdrm.drm_fd", viddata.*.drm_fd);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.kmsdrm.gbm_dev", @ptrCast(@alignCast(viddata.*.gbm_dev)));
    if ((window.*.flags & @as(c_ulong, 2147483648)) == @as(SDL_WindowFlags, 0)) {
        SDL_SetMouseFocus(window);
        _ = SDL_SetKeyboardFocus(window);
    }
    var display_bounds: SDL_Rect = undefined;
    _ = &display_bounds;
    _ = SDL_GetDisplayBounds_REAL(SDL_GetDisplayForWindow_REAL(window), &display_bounds);
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, display_bounds.x, display_bounds.y);
    return result;
}
pub export fn KMSDRM_SetWindowTitle(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_SetWindowPosition(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn KMSDRM_SetWindowSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    if (!viddata.*.vulkan_mode) {
        KMSDRM_DirtySurfaces(window);
    }
}
pub export fn KMSDRM_SetWindowFullscreen(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: [*c]SDL_VideoDisplay, _: SDL_FullscreenOp) SDL_FullscreenResult {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    if (!viddata.*.vulkan_mode) {
        KMSDRM_DirtySurfaces(window);
    }
    return SDL_FULLSCREEN_SUCCEEDED;
}
pub export fn KMSDRM_ShowWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_HideWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_RaiseWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_MaximizeWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_MinimizeWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_RestoreWindow(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
}
pub export fn KMSDRM_SetWindowFocusable(_: [*c]SDL_VideoDevice, _: [*c]SDL_Window, _: bool) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_GL_CONTEXT_PROFILE_ES = @as(c_int, 0x0004);
pub const EGL_CONDITION_SATISFIED_KHR = @as(c_int, 0x30F6);
pub const EGL_FOREVER_KHR = @as(c_ulonglong, 0xFFFFFFFFFFFFFFFF);
pub const DRM_CAP_ASYNC_PAGE_FLIP = @as(c_int, 0x7);
pub const DRM_CLIENT_CAP_UNIVERSAL_PLANES = @as(c_int, 2);
pub const DRM_CLIENT_CAP_ATOMIC = @as(c_int, 3);
pub const DRM_MODE_OBJECT_CRTC = __helpers.promoteIntLiteral(c_int, 0xcccccccc, .hex);
pub const DRM_MODE_OBJECT_CONNECTOR = __helpers.promoteIntLiteral(c_int, 0xc0c0c0c0, .hex);
pub const DRM_MODE_OBJECT_PLANE = __helpers.promoteIntLiteral(c_int, 0xeeeeeeee, .hex);
pub const DRM_MODE_ATOMIC_NONBLOCK = @as(c_int, 0x0200);
pub const DRM_MODE_ATOMIC_ALLOW_MODESET = @as(c_int, 0x0400);
pub const DRM_EVENT_CONTEXT_VERSION = @as(c_int, 4);
pub const DRM_PLANE_TYPE_PRIMARY = @as(c_int, 1);
pub const O_RDWR = @as(c_int, 0o2);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const DRM_FORMAT_MOD_INVALID = @as(c_ulonglong, 0x00ffffffffffffff);
pub const ENOENT = @as(c_int, 2);
pub const EINTR = @as(c_int, 4);
pub const EACCES = @as(c_int, 13);
pub const EINVAL = @as(c_int, 22);
pub const ENOSYS = @as(c_int, 38);
pub const POLLIN = @as(c_int, 0x001);
pub const POLLERR = @as(c_int, 0x008);
pub const POLLHUP = @as(c_int, 0x010);
