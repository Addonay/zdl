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
pub const __off_t = c_long;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_roundf_REAL(x: f32) f32;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
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
pub extern fn SDL_PremultiplyAlpha_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) bool;
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
pub const struct_SDL_EGL_VideoData_11 = opaque {};
pub const struct_SDL_PrivateGLESData_12 = opaque {};
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
    egl_data: ?*struct_SDL_EGL_VideoData_11 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_12 = null,
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
pub const SDL_MouseID = Uint32;
pub const struct_SDL_CursorData = extern struct {
    hot_x: c_int = 0,
    hot_y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
    buffer: [*c]u32 = null,
    buffer_size: usize = 0,
    buffer_pitch: usize = 0,
};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: [*c]SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const struct_SDL_CursorFrameInfo = extern struct {
    surface: [*c]SDL_Surface = null,
    duration: Uint32 = 0,
};
pub const SDL_CursorFrameInfo = struct_SDL_CursorFrameInfo;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub extern fn SDL_CreateCursor_REAL(data: [*c]const Uint8, mask: [*c]const Uint8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) [*c]SDL_Cursor;
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
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_GetVideoDisplay(display: SDL_DisplayID) [*c]SDL_VideoDisplay;
pub extern fn SDL_GetVideoDisplayForWindow(window: [*c]SDL_Window) [*c]SDL_VideoDisplay;
pub extern fn SDL_GetDisplayDriverDataForWindow(window: [*c]SDL_Window) [*c]SDL_DisplayData;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const drmModeConnection = c_uint;
pub const drmModeSubPixel = c_uint;
pub const drmModeAtomicReqPtr = ?*struct__drmModeAtomicReq;
pub const union_gbm_bo_handle = extern union {
    ptr: ?*anyopaque,
    s32: i32,
    u32: u32,
    s64: i64,
    u64: u64,
};
pub const GBM_BO_USE_CURSOR: c_int = 2;
pub const GBM_BO_USE_WRITE: c_int = 8;
pub const GBM_BO_USE_LINEAR: c_int = 16;
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
pub extern fn KMSDRM_FBFromBO(_this: [*c]SDL_VideoDevice, bo: ?*struct_gbm_bo) [*c]KMSDRM_FBInfo;
pub extern fn drm_atomic_set_plane_props(dispdata: [*c]SDL_DisplayData, info: [*c]struct_KMSDRM_PlaneInfo) void;
pub extern fn drm_atomic_commit(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData, blocking: bool, allow_modeset: bool) c_int;
pub extern fn add_plane_property(req: ?*drmModeAtomicReq, plane: [*c]struct_KMSDRM_plane, name: [*c]const u8, value: u64) c_int;
pub extern fn setup_plane(_this: [*c]SDL_VideoDevice, dispdata: [*c]SDL_DisplayData, plane: [*c][*c]struct_KMSDRM_plane, plane_type: u32) bool;
pub extern fn free_plane(plane: [*c][*c]struct_KMSDRM_plane) void;
pub extern fn KMSDRM_CreateWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) bool;
pub extern fn KMSDRM_DestroyWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub const SDL_DYNKMSDRMFN_drmGetCap = ?*const fn (fd: c_int, capability: u64, value: [*c]u64) callconv(.c) c_int;
pub extern var KMSDRM_drmGetCap: SDL_DYNKMSDRMFN_drmGetCap;
pub const SDL_DYNKMSDRMFN_drmModeSetCursor = ?*const fn (fd: c_int, crtcId: u32, bo_handle: u32, width: u32, height: u32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeSetCursor: SDL_DYNKMSDRMFN_drmModeSetCursor;
pub const SDL_DYNKMSDRMFN_drmModeSetCursor2 = ?*const fn (fd: c_int, crtcId: u32, bo_handle: u32, width: u32, height: u32, hot_x: i32, hot_y: i32) callconv(.c) c_int;
pub extern var KMSDRM_drmModeSetCursor2: SDL_DYNKMSDRMFN_drmModeSetCursor2;
pub const SDL_DYNKMSDRMFN_drmModeMoveCursor = ?*const fn (fd: c_int, crtcId: u32, x: c_int, y: c_int) callconv(.c) c_int;
pub extern var KMSDRM_drmModeMoveCursor: SDL_DYNKMSDRMFN_drmModeMoveCursor;
pub const SDL_DYNKMSDRMFN_gbm_device_is_format_supported = ?*const fn (gbm: ?*struct_gbm_device, format: u32, usage: u32) callconv(.c) c_int;
pub extern var KMSDRM_gbm_device_is_format_supported: SDL_DYNKMSDRMFN_gbm_device_is_format_supported;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_stride = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) u32;
pub extern var KMSDRM_gbm_bo_get_stride: SDL_DYNKMSDRMFN_gbm_bo_get_stride;
pub const SDL_DYNKMSDRMFN_gbm_bo_get_handle = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) union_gbm_bo_handle;
pub extern var KMSDRM_gbm_bo_get_handle: SDL_DYNKMSDRMFN_gbm_bo_get_handle;
pub const SDL_DYNKMSDRMFN_gbm_bo_write = ?*const fn (bo: ?*struct_gbm_bo, buf: ?*const anyopaque, count: usize) callconv(.c) c_int;
pub extern var KMSDRM_gbm_bo_write: SDL_DYNKMSDRMFN_gbm_bo_write;
pub const SDL_DYNKMSDRMFN_gbm_bo_destroy = ?*const fn (bo: ?*struct_gbm_bo) callconv(.c) void;
pub extern var KMSDRM_gbm_bo_destroy: SDL_DYNKMSDRMFN_gbm_bo_destroy;
pub const SDL_DYNKMSDRMFN_gbm_bo_create = ?*const fn (gbm: ?*struct_gbm_device, width: u32, height: u32, format: u32, usage: u32) callconv(.c) ?*struct_gbm_bo;
pub extern var KMSDRM_gbm_bo_create: SDL_DYNKMSDRMFN_gbm_bo_create;
pub const SDL_DYNKMSDRMFN_drmModeAtomicAlloc = ?*const fn () callconv(.c) drmModeAtomicReqPtr;
pub extern var KMSDRM_drmModeAtomicAlloc: SDL_DYNKMSDRMFN_drmModeAtomicAlloc;
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
pub extern fn SDL_GetMouse() [*c]SDL_Mouse;
pub extern fn SDL_SetDefaultCursor(cursor: [*c]SDL_Cursor) void;
pub extern fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void;
pub const default_cdata: [32]u8 = [32]u8{
    0,
    0,
    64,
    0,
    96,
    0,
    112,
    0,
    120,
    0,
    124,
    0,
    126,
    0,
    127,
    0,
    127,
    128,
    124,
    0,
    108,
    0,
    70,
    0,
    6,
    0,
    3,
    0,
    3,
    0,
    0,
    0,
};
pub const default_cmask: [32]u8 = [32]u8{
    192,
    0,
    224,
    0,
    240,
    0,
    248,
    0,
    252,
    0,
    254,
    0,
    255,
    0,
    255,
    128,
    255,
    192,
    255,
    224,
    254,
    0,
    239,
    0,
    207,
    0,
    135,
    128,
    7,
    128,
    3,
    0,
};
pub fn KMSDRM_CreateDefaultCursor() callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    return SDL_CreateCursor_REAL(@ptrCast(@alignCast(&default_cdata)), @ptrCast(@alignCast(&default_cmask)), DEFAULT_CWIDTH, DEFAULT_CHEIGHT, DEFAULT_CHOTX, DEFAULT_CHOTY);
}
pub export fn KMSDRM_DestroyCursorBO(_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) void {
    @setEvalBranchQuota(100000);
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    if (dispdata.*.cursor_bo != null) {
        var viddata: [*c]SDL_VideoData = _this.*.internal;
        _ = &viddata;
        if (false and viddata.*.is_atomic) {
            if (dispdata.*.cursor_plane != null) {
                var info: KMSDRM_PlaneInfo = undefined;
                _ = &info;
                _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
                info.plane = dispdata.*.cursor_plane;
                drm_atomic_set_plane_props(dispdata, &info);
                if (drm_atomic_commit(_this, dispdata, @"true" != 0, @"false" != 0) != 0) {
                    _ = SDL_SetError_REAL("Failed atomic commit in KMSDRM_DenitMouse.");
                }
                free_plane(&dispdata.*.cursor_plane);
            }
        }
        KMSDRM_gbm_bo_destroy.?(dispdata.*.cursor_bo);
        dispdata.*.cursor_bo = null;
        dispdata.*.cursor_bo_drm_fd = -@as(c_int, 1);
    }
}
pub export fn KMSDRM_CreateCursorBO(display: [*c]SDL_VideoDisplay) bool {
    @setEvalBranchQuota(100000);
    var dev: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &dev;
    var viddata: [*c]SDL_VideoData = dev.*.internal;
    _ = &viddata;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    if (false and viddata.*.is_atomic) {
        _ = setup_plane(dev, dispdata, &dispdata.*.cursor_plane, DRM_PLANE_TYPE_CURSOR);
    }
    if (!(KMSDRM_gbm_device_is_format_supported.?(viddata.*.gbm_dev, ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))), @bitCast(@as(c_int, GBM_BO_USE_CURSOR | GBM_BO_USE_WRITE))) != 0)) {
        return SDL_SetError_REAL("Unsupported pixel format for cursor");
    }
    if ((KMSDRM_drmGetCap.?(viddata.*.drm_fd, DRM_CAP_CURSOR_WIDTH, &dispdata.*.cursor_w) != 0) or (KMSDRM_drmGetCap.?(viddata.*.drm_fd, DRM_CAP_CURSOR_HEIGHT, &dispdata.*.cursor_h) != 0)) {
        return SDL_SetError_REAL("Could not get the recommended GBM cursor size");
    }
    if ((dispdata.*.cursor_w == @as(u64, 0)) or (dispdata.*.cursor_h == @as(u64, 0))) {
        return SDL_SetError_REAL("Could not get an usable GBM cursor size");
    }
    dispdata.*.cursor_bo = KMSDRM_gbm_bo_create.?(viddata.*.gbm_dev, @truncate(dispdata.*.cursor_w), @truncate(dispdata.*.cursor_h), ((@as(u32, @bitCast(@as(c_int, @as(c_int, 'A')))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, 'R')))) << @intCast(@as(u32, 8)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '2')))) << @intCast(@as(u32, 16)))) | (@as(u32, @bitCast(@as(c_int, @as(c_int, '4')))) << @intCast(@as(u32, 24))), @bitCast(@as(c_int, (GBM_BO_USE_CURSOR | GBM_BO_USE_WRITE) | GBM_BO_USE_LINEAR)));
    if (!(dispdata.*.cursor_bo != null)) {
        return SDL_SetError_REAL("Could not create GBM cursor BO");
    }
    dispdata.*.cursor_bo_drm_fd = viddata.*.drm_fd;
    return @"true" != 0;
}
pub fn KMSDRM_RemoveCursorFromBO(display: [*c]SDL_VideoDisplay) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    var video_device: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &video_device;
    var viddata: [*c]SDL_VideoData = video_device.*.internal;
    _ = &viddata;
    if (false and viddata.*.is_atomic) {
        if (dispdata.*.cursor_plane != null) {
            var info: KMSDRM_PlaneInfo = undefined;
            _ = &info;
            _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
            info.plane = dispdata.*.cursor_plane;
            drm_atomic_set_plane_props(dispdata, &info);
            if (drm_atomic_commit(video_device, dispdata, @"true" != 0, @"false" != 0) != 0) {
                result = SDL_SetError_REAL("Failed atomic commit in KMSDRM_ShowCursor.");
            }
        }
    } else {
        const rc: c_int = KMSDRM_drmModeSetCursor.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, 0, 0, 0);
        _ = &rc;
        if (rc < @as(c_int, 0)) {
            result = SDL_SetError_REAL("drmModeSetCursor() failed: %s", strerror(-rc));
        }
    }
    return result;
}
pub fn KMSDRM_DumpCursorToBO(display: [*c]SDL_VideoDisplay, mouse: [*c]SDL_Mouse, cursor: [*c]SDL_Cursor) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dispdata: [*c]SDL_DisplayData = undefined;
    _ = &dispdata;
    var curdata: [*c]SDL_CursorData = undefined;
    _ = &curdata;
    var video_device: [*c]SDL_VideoDevice = undefined;
    _ = &video_device;
    var viddata: [*c]SDL_VideoData = undefined;
    _ = &viddata;
    var bo_handle: u32 = undefined;
    _ = &bo_handle;
    var bo_stride: usize = undefined;
    _ = &bo_stride;
    var bufsize: usize = undefined;
    _ = &bufsize;
    var ready_buffer: [*c]u8 = undefined;
    _ = &ready_buffer;
    var src_row: [*c]u8 = undefined;
    _ = &src_row;
    var i: c_int = undefined;
    _ = &i;
    var rc: c_int = undefined;
    _ = &rc;
    var result: bool = undefined;
    _ = &result;
    var fb: [*c]KMSDRM_FBInfo = undefined;
    _ = &fb;
    var info: KMSDRM_PlaneInfo = undefined;
    _ = &info;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dispdata = display.*.internal;
                curdata = cursor.*.internal;
                video_device = SDL_GetVideoDevice();
                viddata = video_device.*.internal;
                ready_buffer = null;
                result = @"true" != 0;
                if (!(curdata != null) or !(dispdata.*.cursor_bo != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(ready_buffer)));
                return result;
            },
            2 => {
                return SDL_SetError_REAL("Cursor or display not initialized properly.");
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                bo_stride = KMSDRM_gbm_bo_get_stride.?(dispdata.*.cursor_bo);
                bufsize = bo_stride *% dispdata.*.cursor_h;
                ready_buffer = @ptrCast(@alignCast(SDL_calloc_REAL(1, bufsize)));
                if (!(ready_buffer != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                result = @"false" != 0;
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
                if (i < curdata.*.h) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                src_row = &@as([*c]u8, @ptrCast(@alignCast(curdata.*.buffer)))[@bitCast(@as(isize, @intCast((i * curdata.*.w) * @as(c_int, 4))))];
                _ = memcpy(@ptrCast(@alignCast(ready_buffer + (@as(usize, @bitCast(@as(c_long, i))) *% bo_stride))), @ptrCast(@alignCast(src_row)), @as(usize, @bitCast(@as(c_long, @as(c_int, 4)))) *% @as(usize, @bitCast(@as(c_long, curdata.*.w))));
                {
                    sdl_pc = 10;
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
                if (KMSDRM_gbm_bo_write.?(dispdata.*.cursor_bo, @ptrCast(@alignCast(ready_buffer)), bufsize) != 0) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                result = SDL_SetError_REAL("Could not write to GBM cursor BO");
                {
                    sdl_pc = 1;
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
                if (false and viddata.*.is_atomic) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                fb = KMSDRM_FBFromBO(video_device, dispdata.*.cursor_bo);
                if (!(fb != null)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            16 => {
                bo_handle = KMSDRM_gbm_bo_get_handle.?(dispdata.*.cursor_bo).u32;
                if ((curdata.*.hot_x == @as(c_int, 0)) and (curdata.*.hot_y == @as(c_int, 0))) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
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
                result = SDL_SetError_REAL("Failed to get cursor FB from BO");
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
                _ = memset(@ptrCast(@alignCast(&info)), 0, @sizeOf(@TypeOf(info)));
                info.plane = dispdata.*.cursor_plane;
                info.crtc_id = dispdata.*.crtc.crtc.*.crtc_id;
                info.fb_id = fb.*.fb_id;
                info.src_w = @bitCast(@as(c_uint, @truncate(dispdata.*.cursor_w)));
                info.src_h = @bitCast(@as(c_uint, @truncate(dispdata.*.cursor_h)));
                info.crtc_x = @as(i32, @intFromFloat(SDL_roundf_REAL(mouse.*.x))) - curdata.*.hot_x;
                info.crtc_y = @as(i32, @intFromFloat(SDL_roundf_REAL(mouse.*.y))) - curdata.*.hot_y;
                info.crtc_w = curdata.*.w;
                info.crtc_h = curdata.*.h;
                drm_atomic_set_plane_props(dispdata, &info);
                if (drm_atomic_commit(video_device, dispdata, @"true" != 0, @"false" != 0) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                result = SDL_SetError_REAL("Failed atomic commit in KMSDRM_ShowCursor.");
                {
                    sdl_pc = 1;
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
                    sdl_pc = 17;
                    continue;
                }
            },
            24 => {
                rc = KMSDRM_drmModeSetCursor.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, bo_handle, @truncate(dispdata.*.cursor_w), @truncate(dispdata.*.cursor_h));
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                rc = KMSDRM_drmModeSetCursor2.?(viddata.*.drm_fd, dispdata.*.crtc.crtc.*.crtc_id, bo_handle, @truncate(dispdata.*.cursor_w), @truncate(dispdata.*.cursor_h), curdata.*.hot_x, curdata.*.hot_y);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                if (rc < @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                result = SDL_SetError_REAL("Failed to set DRM cursor: %s", strerror(-rc));
                {
                    sdl_pc = 1;
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
                    sdl_pc = 17;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn KMSDRM_FreeCursor(cursor: [*c]SDL_Cursor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var curdata: [*c]SDL_CursorData = undefined;
    _ = &curdata;
    if (cursor != null) {
        curdata = cursor.*.internal;
        if (curdata.*.buffer != null) {
            SDL_free_REAL(@ptrCast(@alignCast(curdata.*.buffer)));
            curdata.*.buffer = null;
        }
        SDL_free_REAL(@ptrCast(@alignCast(cursor.*.internal)));
        SDL_free_REAL(@ptrCast(@alignCast(cursor)));
    }
}
pub fn KMSDRM_CreateCursor(surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var curdata: [*c]SDL_CursorData = undefined;
    _ = &curdata;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    var result: [*c]SDL_Cursor = undefined;
    _ = &result;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                curdata = null;
                result = null;
                cursor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cursor.*)))));
                if (!(cursor != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (!(result != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            2 => {
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
                curdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(curdata.*)))));
                if (!(curdata != null)) {
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
                curdata.*.hot_x = hot_x;
                curdata.*.hot_y = hot_y;
                curdata.*.w = surface.*.w;
                curdata.*.h = surface.*.h;
                curdata.*.buffer = null;
                curdata.*.buffer_pitch = @bitCast(@as(c_long, surface.*.w));
                curdata.*.buffer_size = (@as(usize, @bitCast(@as(c_long, surface.*.w))) *% @as(usize, @bitCast(@as(c_long, surface.*.h)))) *% @as(usize, 4);
                curdata.*.buffer = @ptrCast(@alignCast(SDL_malloc_REAL(curdata.*.buffer_size)));
                if (!(curdata.*.buffer != null)) {
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
                _ = SDL_PremultiplyAlpha_REAL(surface.*.w, surface.*.h, surface.*.format, surface.*.pixels, surface.*.pitch, SDL_PIXELFORMAT_ARGB8888, @ptrCast(@alignCast(curdata.*.buffer)), surface.*.w * @as(c_int, 4), @"true" != 0);
                cursor.*.internal = curdata;
                result = cursor;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                if (curdata != null) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                return result;
            },
            14 => {
                SDL_free_REAL(@ptrCast(@alignCast(curdata.*.buffer)));
                SDL_free_REAL(@ptrCast(@alignCast(curdata)));
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
                SDL_free_REAL(@ptrCast(@alignCast(cursor)));
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn KMSDRM_ShowCursor(cursor: [*c]SDL_Cursor) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoDisplay = undefined;
    _ = &display;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var i: c_int = undefined;
    _ = &i;
    var result: bool = @"true" != 0;
    _ = &result;
    window = mouse.*.focus;
    if (!(window != null) or !(cursor != null)) {
        var displays: [*c]SDL_DisplayID = SDL_GetDisplays_REAL(null);
        _ = &displays;
        if (displays != null) {
            {
                i = 0;
                while (@as(SDL_DisplayID, @bitCast(@as(c_int, i))) < displays[@bitCast(@as(isize, @intCast(i)))]) : (i += 1) {
                    display = SDL_GetVideoDisplay(displays[@bitCast(@as(isize, @intCast(i)))]);
                    result = KMSDRM_RemoveCursorFromBO(display);
                }
            }
            SDL_free_REAL(@ptrCast(@alignCast(displays)));
        }
    } else {
        display = SDL_GetVideoDisplayForWindow(window);
        if (display != null) {
            if (cursor != null) {
                result = KMSDRM_DumpCursorToBO(display, mouse, cursor);
            } else {
                result = KMSDRM_RemoveCursorFromBO(display);
            }
        }
    }
    return result;
}
pub fn drm_atomic_movecursor(dispdata: [*c]SDL_DisplayData, curdata: [*c]const SDL_CursorData, x: u16, y: u16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (dispdata.*.cursor_plane != null) {
        if (!(dispdata.*.atomic_req != null)) {
            dispdata.*.atomic_req = KMSDRM_drmModeAtomicAlloc.?();
        }
        _ = add_plane_property(dispdata.*.atomic_req, dispdata.*.cursor_plane, "CRTC_X", @bitCast(@as(c_long, @as(c_int, x) - curdata.*.hot_x)));
        _ = add_plane_property(dispdata.*.atomic_req, dispdata.*.cursor_plane, "CRTC_Y", @bitCast(@as(c_long, @as(c_int, y) - curdata.*.hot_y)));
    }
}
pub fn KMSDRM_WarpMouseGlobal(x: f32, y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (((mouse != null) and (mouse.*.cur_cursor != null)) and (mouse.*.focus != null)) {
        var window: [*c]SDL_Window = mouse.*.focus;
        _ = &window;
        var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
        _ = &dispdata;
        SDL_SendMouseMotion(0, mouse.*.focus, SDL_GLOBAL_MOUSE_ID, @"false" != 0, x, y);
        if (dispdata.*.cursor_bo != null) {
            var dev: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
            _ = &dev;
            var viddata: [*c]SDL_VideoData = dev.*.internal;
            _ = &viddata;
            if (false and viddata.*.is_atomic) {
                var curdata: [*c]const SDL_CursorData = @ptrCast(@alignCast(mouse.*.cur_cursor.*.internal));
                _ = &curdata;
                drm_atomic_movecursor(dispdata, curdata, @bitCast(@as(c_short, @truncate(@as(c_int, @intFromFloat(x))))), @bitCast(@as(c_short, @truncate(@as(c_int, @intFromFloat(y))))));
            } else {
                const rc: c_int = KMSDRM_drmModeMoveCursor.?(dispdata.*.cursor_bo_drm_fd, dispdata.*.crtc.crtc.*.crtc_id, @intFromFloat(x), @intFromFloat(y));
                _ = &rc;
                if (rc < @as(c_int, 0)) {
                    return SDL_SetError_REAL("drmModeMoveCursor() failed: %s", strerror(-rc));
                }
            }
        } else {
            return SDL_SetError_REAL("Cursor not initialized properly.");
        }
    } else {
        return SDL_SetError_REAL("No mouse or current cursor.");
    }
    return @"true" != 0;
}
pub fn KMSDRM_WarpMouse(_: [*c]SDL_Window, x: f32, y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return KMSDRM_WarpMouseGlobal(x, y);
}
pub export fn KMSDRM_InitMouse(_: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var dispdata: [*c]SDL_DisplayData = display.*.internal;
    _ = &dispdata;
    mouse.*.CreateCursor = KMSDRM_CreateCursor;
    mouse.*.ShowCursor = KMSDRM_ShowCursor;
    mouse.*.MoveCursor = KMSDRM_MoveCursor;
    mouse.*.FreeCursor = KMSDRM_FreeCursor;
    mouse.*.WarpMouse = KMSDRM_WarpMouse;
    mouse.*.WarpMouseGlobal = KMSDRM_WarpMouseGlobal;
    if (!dispdata.*.default_cursor_init) {
        SDL_SetDefaultCursor(KMSDRM_CreateDefaultCursor());
        dispdata.*.default_cursor_init = @"true" != 0;
    }
}
pub export fn KMSDRM_QuitMouse(_: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
}
pub fn KMSDRM_MoveCursor(_: [*c]SDL_Cursor) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (((mouse != null) and (mouse.*.cur_cursor != null)) and (mouse.*.focus != null)) {
        var window: [*c]SDL_Window = mouse.*.focus;
        _ = &window;
        var dispdata: [*c]SDL_DisplayData = SDL_GetDisplayDriverDataForWindow(window);
        _ = &dispdata;
        var dev: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
        _ = &dev;
        var viddata: [*c]SDL_VideoData = dev.*.internal;
        _ = &viddata;
        if (!(dispdata.*.cursor_bo != null)) {
            return SDL_SetError_REAL("Cursor not initialized properly.");
        }
        if (false and viddata.*.is_atomic) {
            var curdata: [*c]const SDL_CursorData = @ptrCast(@alignCast(mouse.*.cur_cursor.*.internal));
            _ = &curdata;
            drm_atomic_movecursor(dispdata, curdata, @bitCast(@as(c_short, @truncate(@as(c_int, @intFromFloat(mouse.*.x))))), @bitCast(@as(c_short, @truncate(@as(c_int, @intFromFloat(mouse.*.y))))));
        } else {
            const rc: c_int = KMSDRM_drmModeMoveCursor.?(dispdata.*.cursor_bo_drm_fd, dispdata.*.crtc.crtc.*.crtc_id, @intFromFloat(mouse.*.x), @intFromFloat(mouse.*.y));
            _ = &rc;
            if (rc < @as(c_int, 0)) {
                return SDL_SetError_REAL("drmModeMoveCursor() failed: %s", strerror(-rc));
            }
        }
    }
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const DRM_CAP_CURSOR_WIDTH = @as(c_int, 0x8);
pub const DRM_CAP_CURSOR_HEIGHT = @as(c_int, 0x9);
pub const DRM_PLANE_TYPE_CURSOR = @as(c_int, 2);
pub const SDL_GLOBAL_MOUSE_ID = @as(c_int, 0);
pub const DEFAULT_CWIDTH = @as(c_int, 16);
pub const DEFAULT_CHEIGHT = @as(c_int, 16);
pub const DEFAULT_CHOTX = @as(c_int, 0);
pub const DEFAULT_CHOTY = @as(c_int, 0);
