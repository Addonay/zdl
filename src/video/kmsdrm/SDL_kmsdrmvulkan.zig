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
pub const __clock_t = c_long;
pub const clock_t = __clock_t;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub const SDL_Surface = struct_SDL_Surface;
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
pub const SDL_Window = struct_SDL_Window;
pub const SDL_WindowFlags = Uint64;
pub const enum_SDL_FlashOperation = c_uint;
pub const SDL_FlashOperation = enum_SDL_FlashOperation;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
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
pub extern fn SDL_GetDisplayForWindow_REAL(window: [*c]SDL_Window) SDL_DisplayID;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
const struct_unnamed_9 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
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
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
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
pub const struct_VkAllocationCallbacks = extern struct {
    pUserData: ?*anyopaque = null,
    pfnAllocation: PFN_vkAllocationFunction = null,
    pfnReallocation: PFN_vkReallocationFunction = null,
    pfnFree: PFN_vkFreeFunction = null,
    pfnInternalAllocation: PFN_vkInternalAllocationNotification = null,
    pfnInternalFree: PFN_vkInternalFreeNotification = null,
};
pub extern fn SDL_Vulkan_GetInstanceExtensions_REAL(count: [*c]Uint32) [*c]const [*c]const u8;
pub const SDL_Vulkan_GetInstanceExtensions = SDL_Vulkan_GetInstanceExtensions_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const VkAllocationCallbacks = struct_VkAllocationCallbacks;
pub const SDL_SurfaceDataFlags = Uint32;
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
pub const enum_VkSystemAllocationScope = c_uint;
pub const VkSystemAllocationScope = enum_VkSystemAllocationScope;
pub const PFN_vkAllocationFunction = ?*const fn (pUserData: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkReallocationFunction = ?*const fn (pUserData: ?*anyopaque, pOriginal: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkFreeFunction = ?*const fn (pUserData: ?*anyopaque, pMemory: ?*anyopaque) callconv(.c) void;
pub const enum_VkInternalAllocationType = c_uint;
pub const VkInternalAllocationType = enum_VkInternalAllocationType;
pub const PFN_vkInternalAllocationNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkInternalFreeNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
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
    Vulkan_CreateSurface: ?*const fn (_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) callconv(.c) bool = null,
    Vulkan_DestroySurface: ?*const fn (_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) callconv(.c) void = null,
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
pub const VkBool32 = u32;
pub const VkDeviceSize = u64;
pub const VkFlags = u32;
pub const VK_SUCCESS: c_int = 0;
pub const enum_VkResult = c_int;
pub const VkResult = enum_VkResult;
pub const VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR: c_int = 1000002000;
pub const VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR: c_int = 1000002001;
pub const enum_VkStructureType = c_uint;
pub const VkStructureType = enum_VkStructureType;
pub const enum_VkPhysicalDeviceType = c_uint;
pub const VkPhysicalDeviceType = enum_VkPhysicalDeviceType;
pub const VkSampleCountFlags = VkFlags;
pub const struct_VkExtent2D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const VkExtent2D = struct_VkExtent2D;
pub const struct_VkOffset2D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
};
pub const VkOffset2D = struct_VkOffset2D;
pub const PFN_vkVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_VkPhysicalDeviceLimits = extern struct {
    maxImageDimension1D: u32 = 0,
    maxImageDimension2D: u32 = 0,
    maxImageDimension3D: u32 = 0,
    maxImageDimensionCube: u32 = 0,
    maxImageArrayLayers: u32 = 0,
    maxTexelBufferElements: u32 = 0,
    maxUniformBufferRange: u32 = 0,
    maxStorageBufferRange: u32 = 0,
    maxPushConstantsSize: u32 = 0,
    maxMemoryAllocationCount: u32 = 0,
    maxSamplerAllocationCount: u32 = 0,
    bufferImageGranularity: VkDeviceSize = 0,
    sparseAddressSpaceSize: VkDeviceSize = 0,
    maxBoundDescriptorSets: u32 = 0,
    maxPerStageDescriptorSamplers: u32 = 0,
    maxPerStageDescriptorUniformBuffers: u32 = 0,
    maxPerStageDescriptorStorageBuffers: u32 = 0,
    maxPerStageDescriptorSampledImages: u32 = 0,
    maxPerStageDescriptorStorageImages: u32 = 0,
    maxPerStageDescriptorInputAttachments: u32 = 0,
    maxPerStageResources: u32 = 0,
    maxDescriptorSetSamplers: u32 = 0,
    maxDescriptorSetUniformBuffers: u32 = 0,
    maxDescriptorSetUniformBuffersDynamic: u32 = 0,
    maxDescriptorSetStorageBuffers: u32 = 0,
    maxDescriptorSetStorageBuffersDynamic: u32 = 0,
    maxDescriptorSetSampledImages: u32 = 0,
    maxDescriptorSetStorageImages: u32 = 0,
    maxDescriptorSetInputAttachments: u32 = 0,
    maxVertexInputAttributes: u32 = 0,
    maxVertexInputBindings: u32 = 0,
    maxVertexInputAttributeOffset: u32 = 0,
    maxVertexInputBindingStride: u32 = 0,
    maxVertexOutputComponents: u32 = 0,
    maxTessellationGenerationLevel: u32 = 0,
    maxTessellationPatchSize: u32 = 0,
    maxTessellationControlPerVertexInputComponents: u32 = 0,
    maxTessellationControlPerVertexOutputComponents: u32 = 0,
    maxTessellationControlPerPatchOutputComponents: u32 = 0,
    maxTessellationControlTotalOutputComponents: u32 = 0,
    maxTessellationEvaluationInputComponents: u32 = 0,
    maxTessellationEvaluationOutputComponents: u32 = 0,
    maxGeometryShaderInvocations: u32 = 0,
    maxGeometryInputComponents: u32 = 0,
    maxGeometryOutputComponents: u32 = 0,
    maxGeometryOutputVertices: u32 = 0,
    maxGeometryTotalOutputComponents: u32 = 0,
    maxFragmentInputComponents: u32 = 0,
    maxFragmentOutputAttachments: u32 = 0,
    maxFragmentDualSrcAttachments: u32 = 0,
    maxFragmentCombinedOutputResources: u32 = 0,
    maxComputeSharedMemorySize: u32 = 0,
    maxComputeWorkGroupCount: [3]u32 = @import("std").mem.zeroes([3]u32),
    maxComputeWorkGroupInvocations: u32 = 0,
    maxComputeWorkGroupSize: [3]u32 = @import("std").mem.zeroes([3]u32),
    subPixelPrecisionBits: u32 = 0,
    subTexelPrecisionBits: u32 = 0,
    mipmapPrecisionBits: u32 = 0,
    maxDrawIndexedIndexValue: u32 = 0,
    maxDrawIndirectCount: u32 = 0,
    maxSamplerLodBias: f32 = 0,
    maxSamplerAnisotropy: f32 = 0,
    maxViewports: u32 = 0,
    maxViewportDimensions: [2]u32 = @import("std").mem.zeroes([2]u32),
    viewportBoundsRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    viewportSubPixelBits: u32 = 0,
    minMemoryMapAlignment: usize = 0,
    minTexelBufferOffsetAlignment: VkDeviceSize = 0,
    minUniformBufferOffsetAlignment: VkDeviceSize = 0,
    minStorageBufferOffsetAlignment: VkDeviceSize = 0,
    minTexelOffset: i32 = 0,
    maxTexelOffset: u32 = 0,
    minTexelGatherOffset: i32 = 0,
    maxTexelGatherOffset: u32 = 0,
    minInterpolationOffset: f32 = 0,
    maxInterpolationOffset: f32 = 0,
    subPixelInterpolationOffsetBits: u32 = 0,
    maxFramebufferWidth: u32 = 0,
    maxFramebufferHeight: u32 = 0,
    maxFramebufferLayers: u32 = 0,
    framebufferColorSampleCounts: VkSampleCountFlags = 0,
    framebufferDepthSampleCounts: VkSampleCountFlags = 0,
    framebufferStencilSampleCounts: VkSampleCountFlags = 0,
    framebufferNoAttachmentsSampleCounts: VkSampleCountFlags = 0,
    maxColorAttachments: u32 = 0,
    sampledImageColorSampleCounts: VkSampleCountFlags = 0,
    sampledImageIntegerSampleCounts: VkSampleCountFlags = 0,
    sampledImageDepthSampleCounts: VkSampleCountFlags = 0,
    sampledImageStencilSampleCounts: VkSampleCountFlags = 0,
    storageImageSampleCounts: VkSampleCountFlags = 0,
    maxSampleMaskWords: u32 = 0,
    timestampComputeAndGraphics: VkBool32 = 0,
    timestampPeriod: f32 = 0,
    maxClipDistances: u32 = 0,
    maxCullDistances: u32 = 0,
    maxCombinedClipAndCullDistances: u32 = 0,
    discreteQueuePriorities: u32 = 0,
    pointSizeRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    lineWidthRange: [2]f32 = @import("std").mem.zeroes([2]f32),
    pointSizeGranularity: f32 = 0,
    lineWidthGranularity: f32 = 0,
    strictLines: VkBool32 = 0,
    standardSampleLocations: VkBool32 = 0,
    optimalBufferCopyOffsetAlignment: VkDeviceSize = 0,
    optimalBufferCopyRowPitchAlignment: VkDeviceSize = 0,
    nonCoherentAtomSize: VkDeviceSize = 0,
};
pub const VkPhysicalDeviceLimits = struct_VkPhysicalDeviceLimits;
pub const struct_VkPhysicalDeviceSparseProperties = extern struct {
    residencyStandard2DBlockShape: VkBool32 = 0,
    residencyStandard2DMultisampleBlockShape: VkBool32 = 0,
    residencyStandard3DBlockShape: VkBool32 = 0,
    residencyAlignedMipSize: VkBool32 = 0,
    residencyNonResidentStrict: VkBool32 = 0,
};
pub const VkPhysicalDeviceSparseProperties = struct_VkPhysicalDeviceSparseProperties;
pub const struct_VkPhysicalDeviceProperties = extern struct {
    apiVersion: u32 = 0,
    driverVersion: u32 = 0,
    vendorID: u32 = 0,
    deviceID: u32 = 0,
    deviceType: VkPhysicalDeviceType = @import("std").mem.zeroes(VkPhysicalDeviceType),
    deviceName: [256]u8 = @import("std").mem.zeroes([256]u8),
    pipelineCacheUUID: [16]u8 = @import("std").mem.zeroes([16]u8),
    limits: VkPhysicalDeviceLimits = @import("std").mem.zeroes(VkPhysicalDeviceLimits),
    sparseProperties: VkPhysicalDeviceSparseProperties = @import("std").mem.zeroes(VkPhysicalDeviceSparseProperties),
};
pub const VkPhysicalDeviceProperties = struct_VkPhysicalDeviceProperties;
pub const struct_VkExtensionProperties = extern struct {
    extensionName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
};
pub const VkExtensionProperties = struct_VkExtensionProperties;
pub const PFN_vkEnumeratePhysicalDevices = ?*const fn (instance: VkInstance, pPhysicalDeviceCount: [*c]u32, pPhysicalDevices: [*c]VkPhysicalDevice) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceProperties = ?*const fn (physicalDevice: VkPhysicalDevice, pProperties: [*c]VkPhysicalDeviceProperties) callconv(.c) void;
pub const PFN_vkGetInstanceProcAddr = ?*const fn (instance: VkInstance, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkEnumerateInstanceExtensionProperties = ?*const fn (pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR: c_int = 1;
pub const enum_VkSurfaceTransformFlagBitsKHR = c_uint;
pub const VkSurfaceTransformFlagBitsKHR = enum_VkSurfaceTransformFlagBitsKHR;
pub const VkSurfaceTransformFlagsKHR = VkFlags;
pub const struct_VkDisplayKHR_T = opaque {};
pub const VkDisplayKHR = ?*struct_VkDisplayKHR_T;
pub const struct_VkDisplayModeKHR_T = opaque {};
pub const VkDisplayModeKHR = ?*struct_VkDisplayModeKHR_T;
pub const VkDisplayModeCreateFlagsKHR = VkFlags;
pub const VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR: c_int = 1;
pub const enum_VkDisplayPlaneAlphaFlagBitsKHR = c_uint;
pub const VkDisplayPlaneAlphaFlagBitsKHR = enum_VkDisplayPlaneAlphaFlagBitsKHR;
pub const VkDisplayPlaneAlphaFlagsKHR = VkFlags;
pub const VkDisplaySurfaceCreateFlagsKHR = VkFlags;
pub const struct_VkDisplayModeParametersKHR = extern struct {
    visibleRegion: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    refreshRate: u32 = 0,
};
pub const VkDisplayModeParametersKHR = struct_VkDisplayModeParametersKHR;
pub const struct_VkDisplayModeCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDisplayModeCreateFlagsKHR = 0,
    parameters: VkDisplayModeParametersKHR = @import("std").mem.zeroes(VkDisplayModeParametersKHR),
};
pub const VkDisplayModeCreateInfoKHR = struct_VkDisplayModeCreateInfoKHR;
pub const struct_VkDisplayModePropertiesKHR = extern struct {
    displayMode: VkDisplayModeKHR = null,
    parameters: VkDisplayModeParametersKHR = @import("std").mem.zeroes(VkDisplayModeParametersKHR),
};
pub const VkDisplayModePropertiesKHR = struct_VkDisplayModePropertiesKHR;
pub const struct_VkDisplayPlaneCapabilitiesKHR = extern struct {
    supportedAlpha: VkDisplayPlaneAlphaFlagsKHR = 0,
    minSrcPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    maxSrcPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    minSrcExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxSrcExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    minDstPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    maxDstPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    minDstExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxDstExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkDisplayPlaneCapabilitiesKHR = struct_VkDisplayPlaneCapabilitiesKHR;
pub const struct_VkDisplayPlanePropertiesKHR = extern struct {
    currentDisplay: VkDisplayKHR = null,
    currentStackIndex: u32 = 0,
};
pub const VkDisplayPlanePropertiesKHR = struct_VkDisplayPlanePropertiesKHR;
pub const struct_VkDisplayPropertiesKHR = extern struct {
    display: VkDisplayKHR = null,
    displayName: [*c]const u8 = null,
    physicalDimensions: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    physicalResolution: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    supportedTransforms: VkSurfaceTransformFlagsKHR = 0,
    planeReorderPossible: VkBool32 = 0,
    persistentContent: VkBool32 = 0,
};
pub const VkDisplayPropertiesKHR = struct_VkDisplayPropertiesKHR;
pub const struct_VkDisplaySurfaceCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDisplaySurfaceCreateFlagsKHR = 0,
    displayMode: VkDisplayModeKHR = null,
    planeIndex: u32 = 0,
    planeStackIndex: u32 = 0,
    transform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    globalAlpha: f32 = 0,
    alphaMode: VkDisplayPlaneAlphaFlagBitsKHR = @import("std").mem.zeroes(VkDisplayPlaneAlphaFlagBitsKHR),
    imageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkDisplaySurfaceCreateInfoKHR = struct_VkDisplaySurfaceCreateInfoKHR;
pub const PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayPropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayPlanePropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayPlaneSupportedDisplaysKHR = ?*const fn (physicalDevice: VkPhysicalDevice, planeIndex: u32, pDisplayCount: [*c]u32, pDisplays: [*c]VkDisplayKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayModePropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayModePropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkCreateDisplayModeKHR = ?*const fn (physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pCreateInfo: [*c]const VkDisplayModeCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pMode: [*c]VkDisplayModeKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayPlaneCapabilitiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, mode: VkDisplayModeKHR, planeIndex: u32, pCapabilities: [*c]VkDisplayPlaneCapabilitiesKHR) callconv(.c) VkResult;
pub const PFN_vkCreateDisplayPlaneSurfaceKHR = ?*const fn (instance: VkInstance, pCreateInfo: [*c]const VkDisplaySurfaceCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pSurface: [*c]VkSurfaceKHR) callconv(.c) VkResult;
pub extern fn clock() clock_t;
pub extern fn SDL_Vulkan_GetResultString(result: VkResult) [*c]const u8;
pub extern fn SDL_Vulkan_CreateInstanceExtensionsList(vkEnumerateInstanceExtensionProperties: PFN_vkEnumerateInstanceExtensionProperties, extensionCount: [*c]Uint32) [*c]VkExtensionProperties;
pub extern fn SDL_Vulkan_DestroySurface_Internal(vkGetInstanceProcAddr: ?*anyopaque, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) void;
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
pub extern fn SDL_GetDisplayIndex(displayID: SDL_DisplayID) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const drmModeConnection = c_uint;
pub const drmModeSubPixel = c_uint;
pub export fn KMSDRM_Vulkan_LoadLibrary(_this: [*c]SDL_VideoDevice, arg_path: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var path = arg_path;
    _ = &path;
    var extensions: [*c]VkExtensionProperties = undefined;
    _ = &extensions;
    var i: Uint32 = undefined;
    _ = &i;
    var extensionCount: Uint32 = undefined;
    _ = &extensionCount;
    var hasSurfaceExtension: bool = undefined;
    _ = &hasSurfaceExtension;
    var hasDisplayExtension: bool = undefined;
    _ = &hasDisplayExtension;
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = undefined;
    _ = &vkGetInstanceProcAddr;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                extensions = null;
                extensionCount = 0;
                hasSurfaceExtension = @"false" != 0;
                hasDisplayExtension = @"false" != 0;
                vkGetInstanceProcAddr = null;
                if (_this.*.vulkan_config.loader_handle != null) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_UnloadObject_REAL(_this.*.vulkan_config.loader_handle);
                _this.*.vulkan_config.loader_handle = null;
                return @"false" != 0;
            },
            2 => {
                return SDL_SetError_REAL("Vulkan already loaded");
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!(path != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                path = SDL_GetHint_REAL("SDL_VULKAN_LIBRARY");
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
                if (!(path != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                path = "libvulkan.so.1";
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
                _this.*.vulkan_config.loader_handle = SDL_LoadObject_REAL(path);
                if (!(_this.*.vulkan_config.loader_handle != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&_this.*.vulkan_config.loader_path)), path, @sizeOf(@TypeOf(_this.*.vulkan_config.loader_path)) / @sizeOf(@TypeOf(_this.*.vulkan_config.loader_path[@as(c_int, 0)])));
                vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(_this.*.vulkan_config.loader_handle, "vkGetInstanceProcAddr"))));
                if (!(vkGetInstanceProcAddr != null)) {
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
                _this.*.vulkan_config.vkGetInstanceProcAddr = @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr))))));
                _this.*.vulkan_config.vkEnumerateInstanceExtensionProperties = @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(@alignCast(@constCast(@as(PFN_vkGetInstanceProcAddr, @ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr)))).?(null, "vkEnumerateInstanceExtensionProperties")))))));
                if (!(_this.*.vulkan_config.vkEnumerateInstanceExtensionProperties != null)) {
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
                extensions = SDL_Vulkan_CreateInstanceExtensionsList(@ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkEnumerateInstanceExtensionProperties))), &extensionCount);
                if (!(extensions != null)) {
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
                i = 0;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                if (i < extensionCount) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (SDL_strcmp_REAL("VK_KHR_surface", @ptrCast(@alignCast(&extensions[i].extensionName))) == @as(c_int, 0)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            25 => {
                i +%= 1;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                SDL_free_REAL(@ptrCast(@alignCast(extensions)));
                if (!hasSurfaceExtension) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            27 => {
                hasSurfaceExtension = @"true" != 0;
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                if (SDL_strcmp_REAL("VK_KHR_display", @ptrCast(@alignCast(&extensions[i].extensionName))) == @as(c_int, 0)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                hasDisplayExtension = @"true" != 0;
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
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            33 => {
                _ = SDL_SetError_REAL("Installed Vulkan doesn't implement the VK_KHR_surface extension");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            34 => {
                if (!hasDisplayExtension) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                return @"true" != 0;
            },
            36 => {
                _ = SDL_SetError_REAL("Installed Vulkan doesn't implement the VK_KHR_display extension");
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
                    sdl_pc = 35;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn KMSDRM_Vulkan_UnloadLibrary(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    if (_this.*.vulkan_config.loader_handle != null) {
        SDL_UnloadObject_REAL(_this.*.vulkan_config.loader_handle);
        _this.*.vulkan_config.loader_handle = null;
    }
}
pub export fn KMSDRM_Vulkan_GetInstanceExtensions(_: [*c]SDL_VideoDevice, count: [*c]Uint32) [*c]const [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local_extensionsForKMSDRM = struct {
        const extensionsForKMSDRM: [2][*c]const u8 = [2][*c]const u8{
            "VK_KHR_surface",
            "VK_KHR_display",
        };
    };
    _ = &static_local_extensionsForKMSDRM;
    count.* = @truncate(@sizeOf(@TypeOf(static_local_extensionsForKMSDRM.extensionsForKMSDRM)) / @sizeOf(@TypeOf(static_local_extensionsForKMSDRM.extensionsForKMSDRM[@as(c_int, 0)])));
    return @ptrCast(@alignCast(&static_local_extensionsForKMSDRM.extensionsForKMSDRM));
}
pub fn display_mode_comparator(a_opaque: ?*const anyopaque, b_opaque: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a: [*c]const VkDisplayModePropertiesKHR = @ptrCast(@alignCast(a_opaque));
    _ = &a;
    var b: [*c]const VkDisplayModePropertiesKHR = @ptrCast(@alignCast(b_opaque));
    _ = &b;
    if (a.*.parameters.refreshRate > b.*.parameters.refreshRate) return -@as(c_int, 1) else if (a.*.parameters.refreshRate < b.*.parameters.refreshRate) return 1 else return 0;
}
pub export fn KMSDRM_Vulkan_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool {
    @setEvalBranchQuota(100000);
    var gpu: VkPhysicalDevice = undefined;
    _ = &gpu;
    var gpu_count: u32 = undefined;
    _ = &gpu_count;
    var display_count: u32 = undefined;
    _ = &display_count;
    var mode_count: u32 = undefined;
    _ = &mode_count;
    var plane_count: u32 = undefined;
    _ = &plane_count;
    var _plane: u32 = undefined;
    _ = &_plane;
    var physical_devices: [*c]VkPhysicalDevice = undefined;
    _ = &physical_devices;
    var device_props: [*c]VkPhysicalDeviceProperties = undefined;
    _ = &device_props;
    var display_props: [*c]VkDisplayPropertiesKHR = undefined;
    _ = &display_props;
    var mode_props: [*c]VkDisplayModePropertiesKHR = undefined;
    _ = &mode_props;
    var plane_props: [*c]VkDisplayPlanePropertiesKHR = undefined;
    _ = &plane_props;
    var plane_caps: VkDisplayPlaneCapabilitiesKHR = undefined;
    _ = &plane_caps;
    var display_mode_create_info: VkDisplayModeCreateInfoKHR = undefined;
    _ = &display_mode_create_info;
    var display_plane_surface_create_info: VkDisplaySurfaceCreateInfoKHR = undefined;
    _ = &display_plane_surface_create_info;
    var image_size: VkExtent2D = undefined;
    _ = &image_size;
    var display: VkDisplayKHR = undefined;
    _ = &display;
    var display_mode: VkDisplayModeKHR = undefined;
    _ = &display_mode;
    var display_mode_props: VkDisplayModePropertiesKHR = undefined;
    _ = &display_mode_props;
    var new_mode_parameters: VkDisplayModeParametersKHR = undefined;
    _ = &new_mode_parameters;
    var alpha_mode: VkDisplayPlaneAlphaFlagBitsKHR = undefined;
    _ = &alpha_mode;
    var result: VkResult = undefined;
    _ = &result;
    var ret: bool = undefined;
    _ = &ret;
    var valid_gpu: bool = undefined;
    _ = &valid_gpu;
    var mode_found: bool = undefined;
    _ = &mode_found;
    var plane_supports_display: bool = undefined;
    _ = &plane_supports_display;
    var display_index: c_int = undefined;
    _ = &display_index;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = undefined;
    _ = &vkGetInstanceProcAddr;
    var vkCreateDisplayPlaneSurfaceKHR: PFN_vkCreateDisplayPlaneSurfaceKHR = undefined;
    _ = &vkCreateDisplayPlaneSurfaceKHR;
    var vkEnumeratePhysicalDevices: PFN_vkEnumeratePhysicalDevices = undefined;
    _ = &vkEnumeratePhysicalDevices;
    var vkGetPhysicalDeviceProperties: PFN_vkGetPhysicalDeviceProperties = undefined;
    _ = &vkGetPhysicalDeviceProperties;
    var vkGetPhysicalDeviceDisplayPropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = undefined;
    _ = &vkGetPhysicalDeviceDisplayPropertiesKHR;
    var vkGetDisplayModePropertiesKHR: PFN_vkGetDisplayModePropertiesKHR = undefined;
    _ = &vkGetDisplayModePropertiesKHR;
    var vkGetPhysicalDeviceDisplayPlanePropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = undefined;
    _ = &vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
    var vkGetDisplayPlaneSupportedDisplaysKHR: PFN_vkGetDisplayPlaneSupportedDisplaysKHR = undefined;
    _ = &vkGetDisplayPlaneSupportedDisplaysKHR;
    var vkGetDisplayPlaneCapabilitiesKHR: PFN_vkGetDisplayPlaneCapabilitiesKHR = undefined;
    _ = &vkGetDisplayPlaneCapabilitiesKHR;
    var vkCreateDisplayModeKHR: PFN_vkCreateDisplayModeKHR = undefined;
    _ = &vkCreateDisplayModeKHR;
    var supported_displays_count: u32 = undefined;
    _ = &supported_displays_count;
    var supported_displays: [*c]VkDisplayKHR = undefined;
    _ = &supported_displays;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                gpu = null;
                _plane = @as(c_uint, 4294967295);
                physical_devices = null;
                device_props = null;
                display_props = null;
                mode_props = null;
                plane_props = null;
                display_mode = null;
                display_mode_props = VkDisplayModePropertiesKHR{
                    .displayMode = null,
                    .parameters = @import("std").mem.zeroes(VkDisplayModeParametersKHR),
                };
                new_mode_parameters = VkDisplayModeParametersKHR{
                    .visibleRegion = VkExtent2D{
                        .width = 0,
                        .height = 0,
                    },
                    .refreshRate = 0,
                };
                alpha_mode = VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR;
                ret = @"false" != 0;
                valid_gpu = @"false" != 0;
                mode_found = @"false" != 0;
                plane_supports_display = @"false" != 0;
                display_index = SDL_GetDisplayIndex(SDL_GetDisplayForWindow_REAL(window));
                vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr)));
                vkCreateDisplayPlaneSurfaceKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkCreateDisplayPlaneSurfaceKHR"))));
                vkEnumeratePhysicalDevices = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkEnumeratePhysicalDevices"))));
                vkGetPhysicalDeviceProperties = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceProperties"))));
                vkGetPhysicalDeviceDisplayPropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceDisplayPropertiesKHR"))));
                vkGetDisplayModePropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayModePropertiesKHR"))));
                vkGetPhysicalDeviceDisplayPlanePropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"))));
                vkGetDisplayPlaneSupportedDisplaysKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayPlaneSupportedDisplaysKHR"))));
                vkGetDisplayPlaneCapabilitiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayPlaneCapabilitiesKHR"))));
                vkCreateDisplayModeKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkCreateDisplayModeKHR"))));
                if (!(_this.*.vulkan_config.loader_handle != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(physical_devices)));
                SDL_free_REAL(@ptrCast(@alignCast(display_props)));
                SDL_free_REAL(@ptrCast(@alignCast(device_props)));
                SDL_free_REAL(@ptrCast(@alignCast(plane_props)));
                SDL_free_REAL(@ptrCast(@alignCast(mode_props)));
                return ret;
            },
            2 => {
                _ = SDL_SetError_REAL("Vulkan is not loaded");
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
                if (!(vkCreateDisplayPlaneSurfaceKHR != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("VK_KHR_display extension is not enabled in the Vulkan instance.");
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
                _ = vkEnumeratePhysicalDevices.?(instance, &gpu_count, null);
                if (gpu_count == @as(u32, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Vulkan can't find physical devices (gpus).");
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
                physical_devices = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPhysicalDevice) *% @as(c_ulong, gpu_count))));
                device_props = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPhysicalDeviceProperties))));
                _ = vkEnumeratePhysicalDevices.?(instance, &gpu_count, physical_devices);
                i = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (@as(u32, @bitCast(@as(c_int, i))) < gpu_count) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                vkGetPhysicalDeviceProperties.?(physical_devices[@bitCast(@as(isize, @intCast(i)))], device_props);
                if ((device_props.*.apiVersion >= @as(u32, 1)) and ((device_props.*.deviceType == @as(VkPhysicalDeviceType, 1)) or (device_props.*.deviceType == @as(VkPhysicalDeviceType, 2)))) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                i += 1;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                if (!valid_gpu) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            15 => {
                gpu = physical_devices[@bitCast(@as(isize, @intCast(i)))];
                valid_gpu = @"true" != 0;
                {
                    sdl_pc = 14;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                _ = SDL_SetError_REAL("Vulkan can't find a valid physical device (gpu).");
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
                _ = vkGetPhysicalDeviceDisplayPropertiesKHR.?(gpu, &display_count, null);
                if (display_count == @as(u32, 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                _ = SDL_SetError_REAL("Vulkan can't find any displays.");
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
                display_props = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, display_count) *% @sizeOf(@TypeOf(display_props.*)))));
                _ = vkGetPhysicalDeviceDisplayPropertiesKHR.?(gpu, &display_count, display_props);
                display = display_props[@bitCast(@as(isize, @intCast(display_index)))].display;
                _ = vkGetDisplayModePropertiesKHR.?(gpu, display, &mode_count, null);
                if (mode_count == @as(u32, 0)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                _ = SDL_SetError_REAL("Vulkan can't find any video modes for display %i (%s)", @as(c_int, 0), display_props[@bitCast(@as(isize, @intCast(display_index)))].displayName);
                {
                    sdl_pc = 1;
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
                mode_props = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, mode_count) *% @sizeOf(@TypeOf(mode_props.*)))));
                _ = vkGetDisplayModePropertiesKHR.?(gpu, display, &mode_count, mode_props);
                SDL_qsort_REAL(@ptrCast(@alignCast(mode_props)), mode_count, @sizeOf(@TypeOf(mode_props.*)), display_mode_comparator);
                i = 0;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (@as(u32, @bitCast(@as(c_int, i))) < mode_count) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                if ((mode_props[@bitCast(@as(isize, @intCast(i)))].parameters.visibleRegion.width == @as(u32, @bitCast(@as(c_int, window.*.w)))) and (mode_props[@bitCast(@as(isize, @intCast(i)))].parameters.visibleRegion.height == @as(u32, @bitCast(@as(c_int, window.*.h))))) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                i += 1;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            30 => {
                if ((mode_found and (display_mode_props.parameters.visibleRegion.width > @as(u32, 0))) and (display_mode_props.parameters.visibleRegion.height > @as(u32, 0))) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            31 => {
                display_mode_props = mode_props[@bitCast(@as(isize, @intCast(i)))];
                mode_found = @"true" != 0;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            34 => {
                display_mode = display_mode_props.displayMode;
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                new_mode_parameters.visibleRegion.width = @bitCast(@as(c_int, window.*.w));
                new_mode_parameters.visibleRegion.height = @bitCast(@as(c_int, window.*.h));
                new_mode_parameters.refreshRate = @intFromFloat(window.*.current_fullscreen_mode.refresh_rate * @as(f32, @floatFromInt(@as(c_int, 1000))));
                _ = memset(@ptrCast(@alignCast(&display_mode_create_info)), 0, @sizeOf(@TypeOf(display_mode_create_info)));
                display_mode_create_info.sType = VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR;
                display_mode_create_info.parameters = new_mode_parameters;
                result = vkCreateDisplayModeKHR.?(gpu, display, &display_mode_create_info, null, &display_mode);
                if (result != VK_SUCCESS) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                if (!(display_mode != null)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            37 => {
                _ = SDL_SetError_REAL("Vulkan couldn't find a predefined mode for that window size and couldn't create a suitable mode.");
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            40 => {
                _ = SDL_SetError_REAL("Vulkan couldn't get a display mode.");
                {
                    sdl_pc = 1;
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
                _ = vkGetPhysicalDeviceDisplayPlanePropertiesKHR.?(gpu, &plane_count, null);
                if (plane_count == @as(u32, 0)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                _ = SDL_SetError_REAL("Vulkan can't find any planes.");
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
                plane_props = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayPlanePropertiesKHR) *% @as(c_ulong, plane_count))));
                _ = vkGetPhysicalDeviceDisplayPlanePropertiesKHR.?(gpu, &plane_count, plane_props);
                i = 0;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (@as(u32, @bitCast(@as(c_int, i))) < plane_count) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            47 => {
                supported_displays_count = 0;
                _ = vkGetDisplayPlaneSupportedDisplaysKHR.?(gpu, @bitCast(@as(c_int, i)), &supported_displays_count, null);
                if (supported_displays_count == @as(u32, 0)) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                i += 1;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            49 => {
                if (_plane == @as(c_uint, 4294967295)) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 48;
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
                supported_displays = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayKHR) *% @as(c_ulong, supported_displays_count))));
                _ = vkGetDisplayPlaneSupportedDisplaysKHR.?(gpu, @bitCast(@as(c_int, i)), &supported_displays_count, supported_displays);
                if (!((plane_props[@bitCast(@as(isize, @intCast(i)))].currentDisplay == display) or (@as(?*anyopaque, @ptrCast(@alignCast(plane_props[@bitCast(@as(isize, @intCast(i)))].currentDisplay))) == @as(?*anyopaque, null)))) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 48;
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
                plane_supports_display = @"false" != 0;
                j = 0;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                if (@as(u32, @bitCast(@as(c_int, j))) < supported_displays_count) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            57 => {
                if (supported_displays[@bitCast(@as(isize, @intCast(j)))] == display) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            58 => {
                j += 1;
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            59 => {
                SDL_free_REAL(@ptrCast(@alignCast(supported_displays)));
                if (!plane_supports_display) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            60 => {
                plane_supports_display = @"true" != 0;
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 48;
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
                _ = vkGetDisplayPlaneCapabilitiesKHR.?(gpu, display_mode, @bitCast(@as(c_int, i)), &plane_caps);
                if (plane_caps.supportedAlpha == alpha_mode) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                _plane = @bitCast(@as(c_int, i));
                {
                    sdl_pc = 49;
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
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            69 => {
                _ = SDL_SetError_REAL("Vulkan couldn't find an appropriate plane.");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            70 => {
                {
                    sdl_pc = 71;
                    continue;
                }
            },
            71 => {
                image_size.width = @bitCast(@as(c_int, window.*.w));
                image_size.height = @bitCast(@as(c_int, window.*.h));
                _ = memset(@ptrCast(@alignCast(&display_plane_surface_create_info)), 0, @sizeOf(@TypeOf(display_plane_surface_create_info)));
                display_plane_surface_create_info.sType = VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR;
                display_plane_surface_create_info.displayMode = display_mode;
                display_plane_surface_create_info.planeIndex = _plane;
                display_plane_surface_create_info.imageExtent = image_size;
                display_plane_surface_create_info.transform = VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;
                display_plane_surface_create_info.alphaMode = alpha_mode;
                result = vkCreateDisplayPlaneSurfaceKHR.?(instance, &display_plane_surface_create_info, allocator, surface);
                if (result != VK_SUCCESS) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                _ = SDL_SetError_REAL("vkCreateDisplayPlaneSurfaceKHR failed: %s", SDL_Vulkan_GetResultString(result));
                {
                    sdl_pc = 1;
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
                ret = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn KMSDRM_Vulkan_DestroySurface(_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) void {
    @setEvalBranchQuota(100000);
    if (_this.*.vulkan_config.loader_handle != null) {
        SDL_Vulkan_DestroySurface_Internal(@ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr))), instance, surface, allocator);
    }
}

