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
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
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
pub const struct_SDL_EGL_VideoData_17 = opaque {};
pub const struct_SDL_PrivateGLESData_18 = opaque {};
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
    egl_data: ?*struct_SDL_EGL_VideoData_17 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_18 = null,
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
pub extern fn SDL_UninitializedVideo() bool;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_SendClipboardUpdate(owner: bool, mime_types: [*c][*c]u8, num_mime_types: usize) void;
pub extern fn SDL_AllocateTemporaryMemory(size: usize) ?*anyopaque;
pub export fn SDL_FreeClipboardMimeTypes(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    if (_this.*.clipboard_mime_types != null) {
        {
            var i: usize = 0;
            _ = &i;
            while (i < _this.*.num_clipboard_mime_types) : (i +%= 1) {
                SDL_free_REAL(@ptrCast(@alignCast(_this.*.clipboard_mime_types[i])));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(_this.*.clipboard_mime_types)));
        _this.*.clipboard_mime_types = null;
        _this.*.num_clipboard_mime_types = 0;
    }
}
pub export fn SDL_CancelClipboardData(sequence: Uint32) void {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return;
    }
    if ((sequence != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(sequence != _this.*.clipboard_sequence)))) != 0)) {
        return;
    }
    if (_this.*.clipboard_cleanup != null) {
        _this.*.clipboard_cleanup.?(_this.*.clipboard_userdata);
    }
    SDL_FreeClipboardMimeTypes(_this);
    _this.*.clipboard_callback = null;
    _this.*.clipboard_cleanup = null;
    _this.*.clipboard_userdata = null;
}
pub export fn SDL_SaveClipboardMimeTypes(mime_types: [*c]const [*c]const u8, num_mime_types: usize) bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    SDL_FreeClipboardMimeTypes(_this);
    if ((mime_types != null) and (num_mime_types > @as(usize, 0))) {
        var num_allocated: usize = 0;
        _ = &num_allocated;
        _this.*.clipboard_mime_types = @ptrCast(@alignCast(SDL_malloc_REAL(num_mime_types *% @sizeOf([*c]u8))));
        if (_this.*.clipboard_mime_types != null) {
            {
                var i: usize = 0;
                _ = &i;
                while (i < num_mime_types) : (i +%= 1) {
                    _this.*.clipboard_mime_types[i] = SDL_strdup_REAL(mime_types[i]);
                    if (_this.*.clipboard_mime_types[i] != null) {
                        num_allocated +%= 1;
                    }
                }
            }
        }
        if (num_allocated < num_mime_types) {
            SDL_FreeClipboardMimeTypes(_this);
            return @"false" != 0;
        }
        _this.*.num_clipboard_mime_types = num_mime_types;
    }
    return @"true" != 0;
}
pub export fn SDL_SetClipboardData_REAL(callback: SDL_ClipboardDataCallback, cleanup: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque, mime_types: [*c]const [*c]const u8, num_mime_types: usize) bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (!((((callback != null) and (mime_types != null)) and (num_mime_types > @as(usize, 0))) or ((!(callback != null) and !(mime_types != null)) and (num_mime_types == @as(usize, 0))))) {
        return SDL_SetError_REAL("Invalid parameters");
    }
    SDL_CancelClipboardData(0);
    _this.*.clipboard_sequence +%= 1;
    if (!(_this.*.clipboard_sequence != 0)) {
        _this.*.clipboard_sequence = 1;
    }
    _this.*.clipboard_callback = callback;
    _this.*.clipboard_cleanup = cleanup;
    _this.*.clipboard_userdata = userdata;
    if (!SDL_SaveClipboardMimeTypes(mime_types, num_mime_types)) {
        _ = SDL_ClearClipboardData_REAL();
        return @"false" != 0;
    }
    if (_this.*.SetClipboardData != null) {
        if (!_this.*.SetClipboardData.?(_this)) {
            return @"false" != 0;
        }
    } else if (_this.*.SetClipboardText != null) {
        var text: [*c]u8 = null;
        _ = &text;
        var size: usize = undefined;
        _ = &size;
        {
            var i: usize = 0;
            _ = &i;
            while (i < num_mime_types) : (i +%= 1) {
                var mime_type: [*c]const u8 = _this.*.clipboard_mime_types[i];
                _ = &mime_type;
                if (SDL_IsTextMimeType(mime_type)) {
                    var data: ?*const anyopaque = _this.*.clipboard_callback.?(_this.*.clipboard_userdata, mime_type, &size);
                    _ = &data;
                    if (data != null) {
                        text = @ptrCast(@alignCast(SDL_malloc_REAL(size +% @as(usize, 1))));
                        _ = memcpy(@ptrCast(@alignCast(text)), data, size);
                        text[size] = '\x00';
                        if (!_this.*.SetClipboardText.?(_this, text)) {
                            SDL_free_REAL(@ptrCast(@alignCast(text)));
                            return @"false" != 0;
                        }
                        break;
                    }
                }
            }
        }
        if (text != null) {
            SDL_free_REAL(@ptrCast(@alignCast(text)));
        } else {
            if (!_this.*.SetClipboardText.?(_this, "")) {
                return @"false" != 0;
            }
        }
    }
    var mime_types_copy: [*c][*c]u8 = SDL_CopyClipboardMimeTypes(mime_types, num_mime_types, @"true" != 0);
    _ = &mime_types_copy;
    if (!(mime_types_copy != null)) {
        return SDL_SetError_REAL("unable to copy current mime types");
    }
    SDL_SendClipboardUpdate(@"true" != 0, mime_types_copy, num_mime_types);
    return @"true" != 0;
}
pub export fn SDL_ClearClipboardData_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_SetClipboardData_REAL(null, null, null, null, 0);
}
pub export fn SDL_GetInternalClipboardData(_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8, size: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var data: ?*anyopaque = null;
    _ = &data;
    if (_this.*.clipboard_callback != null) {
        if (!SDL_HasInternalClipboardData(_this, mime_type)) {
            return null;
        }
        var provided_data: ?*const anyopaque = _this.*.clipboard_callback.?(_this.*.clipboard_userdata, mime_type, size);
        _ = &provided_data;
        if (provided_data != null) {
            data = SDL_malloc_REAL(size.* +% @sizeOf(Uint32));
            if (data != null) {
                _ = memcpy(data, provided_data, size.*);
                _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(data))) + size.*)), 0, @sizeOf(Uint32));
            } else {
                size.* = 0;
            }
        }
    }
    return data;
}
pub export fn SDL_GetClipboardData_REAL(mime_type: [*c]const u8, arg_size: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var size = arg_size;
    _ = &size;
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    var unused: usize = undefined;
    _ = &unused;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (!(mime_type != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mime_type"))));
        return null;
    }
    if (!(size != null)) {
        size = &unused;
    }
    size.* = 0;
    if (_this.*.GetClipboardData != null) {
        return _this.*.GetClipboardData.?(_this, mime_type, size);
    } else if ((_this.*.GetClipboardText != null) and SDL_IsTextMimeType(mime_type)) {
        var text: [*c]u8 = _this.*.GetClipboardText.?(_this);
        _ = &text;
        if (text != null) {
            if (@as(c_int, text.*) == @as(c_int, '\x00')) {
                SDL_free_REAL(@ptrCast(@alignCast(text)));
                text = null;
            } else {
                size.* = SDL_strlen_REAL(text);
            }
        }
        return @ptrCast(@alignCast(text));
    } else {
        return SDL_GetInternalClipboardData(_this, mime_type, size);
    }
}
pub export fn SDL_HasInternalClipboardData(_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var i: usize = undefined;
    _ = &i;
    {
        i = 0;
        while (i < _this.*.num_clipboard_mime_types) : (i +%= 1) {
            if (SDL_strcmp_REAL(mime_type, _this.*.clipboard_mime_types[i]) == @as(c_int, 0)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_HasClipboardData_REAL(mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (!(mime_type != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("mime_type"))));
    }
    if (_this.*.HasClipboardData != null) {
        return _this.*.HasClipboardData.?(_this, mime_type);
    } else if ((_this.*.HasClipboardText != null) and SDL_IsTextMimeType(mime_type)) {
        return _this.*.HasClipboardText.?(_this);
    } else {
        return SDL_HasInternalClipboardData(_this, mime_type);
    }
}
pub export fn SDL_CopyClipboardMimeTypes(clipboard_mime_types: [*c]const [*c]const u8, num_mime_types: usize, temporary: bool) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    var allocSize: usize = @sizeOf([*c]u8);
    _ = &allocSize;
    {
        var i: usize = 0;
        _ = &i;
        while (i < num_mime_types) : (i +%= 1) {
            allocSize +%= (@sizeOf([*c]u8) +% SDL_strlen_REAL(clipboard_mime_types[i])) +% @as(c_ulong, 1);
        }
    }
    var ret: [*c]u8 = undefined;
    _ = &ret;
    if (temporary) {
        ret = @ptrCast(@alignCast(SDL_AllocateTemporaryMemory(allocSize)));
    } else {
        ret = @ptrCast(@alignCast(SDL_malloc_REAL(allocSize)));
    }
    if (!(ret != null)) {
        return null;
    }
    var result: [*c][*c]u8 = @ptrCast(@alignCast(ret));
    _ = &result;
    ret += @sizeOf([*c]u8) *% (num_mime_types +% @as(usize, 1));
    {
        var i: usize = 0;
        _ = &i;
        while (i < num_mime_types) : (i +%= 1) {
            result[i] = ret;
            var mime_type: [*c]const u8 = clipboard_mime_types[i];
            _ = &mime_type;
            var c: u8 = undefined;
            _ = &c;
            while (true) {
                c = blk: {
                    const tmp = (blk_1: {
                        const ref = &mime_type;
                        const tmp_2 = ref.*;
                        ref.* += 1;
                        break :blk_1 tmp_2;
                    }).*;
                    (blk_1: {
                        const ref = &ret;
                        const tmp_2 = ref.*;
                        ref.* += 1;
                        break :blk_1 tmp_2;
                    }).* = tmp;
                    break :blk tmp;
                };
                if (!(@as(c_int, c) != @as(c_int, '\x00'))) break;
            }
        }
    }
    result[num_mime_types] = null;
    return result;
}
pub export fn SDL_GetClipboardMimeTypes_REAL(num_mime_types: [*c]usize) [*c][*c]u8 {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (num_mime_types != null) {
        num_mime_types.* = 0;
    }
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return null;
    }
    if (num_mime_types != null) {
        num_mime_types.* = _this.*.num_clipboard_mime_types;
    }
    return SDL_CopyClipboardMimeTypes(@ptrCast(@alignCast(_this.*.clipboard_mime_types)), _this.*.num_clipboard_mime_types, @"false" != 0);
}
pub export fn SDL_IsTextMimeType(mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return SDL_strncmp_REAL(mime_type, "text", 4) == @as(c_int, 0);
}
pub fn SDL_GetTextMimeTypes(_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) callconv(.c) [*c]const [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (_this.*.GetTextMimeTypes != null) {
        return _this.*.GetTextMimeTypes.?(_this, num_mime_types);
    } else {
        const static_local_text_mime_types = struct {
            const text_mime_types: [1][*c]const u8 = [1][*c]const u8{
                "text/plain;charset=utf-8",
            };
        };
        _ = &static_local_text_mime_types;
        num_mime_types.* = @sizeOf(@TypeOf(static_local_text_mime_types.text_mime_types)) / @sizeOf(@TypeOf(static_local_text_mime_types.text_mime_types[@as(c_int, 0)]));
        return @ptrCast(@alignCast(&static_local_text_mime_types.text_mime_types));
    }
}
pub export fn SDL_ClipboardTextCallback(userdata: ?*anyopaque, _: [*c]const u8, size: [*c]usize) ?*const anyopaque {
    @setEvalBranchQuota(100000);
    var text: [*c]u8 = @ptrCast(@alignCast(userdata));
    _ = &text;
    if (text != null) {
        size.* = SDL_strlen_REAL(text);
    } else {
        size.* = 0;
    }
    return @ptrCast(@alignCast(text));
}
pub export fn SDL_SetClipboardText_REAL(text: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    var num_mime_types: usize = undefined;
    _ = &num_mime_types;
    var text_mime_types: [*c]const [*c]const u8 = undefined;
    _ = &text_mime_types;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if ((text != null) and (@as(c_int, text.*) != 0)) {
        text_mime_types = SDL_GetTextMimeTypes(_this, &num_mime_types);
        return SDL_SetClipboardData_REAL(SDL_ClipboardTextCallback, SDL_free_REAL, @ptrCast(@alignCast(SDL_strdup_REAL(text))), text_mime_types, num_mime_types);
    }
    return SDL_ClearClipboardData_REAL();
}
pub export fn SDL_GetClipboardText_REAL() [*c]u8 {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    var i: usize = undefined;
    _ = &i;
    var num_mime_types: usize = undefined;
    _ = &num_mime_types;
    var text_mime_types: [*c]const [*c]const u8 = undefined;
    _ = &text_mime_types;
    var length: usize = undefined;
    _ = &length;
    var text: [*c]u8 = null;
    _ = &text;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return SDL_strdup_REAL("");
    }
    text_mime_types = SDL_GetTextMimeTypes(_this, &num_mime_types);
    {
        i = 0;
        while (i < num_mime_types) : (i +%= 1) {
            var clipdata: ?*anyopaque = SDL_GetClipboardData_REAL(text_mime_types[i], &length);
            _ = &clipdata;
            if (clipdata != null) {
                text = @ptrCast(@alignCast(clipdata));
                break;
            }
        }
    }
    if (!(text != null)) {
        text = SDL_strdup_REAL("");
    }
    return text;
}
pub export fn SDL_HasClipboardText_REAL() bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    var i: usize = undefined;
    _ = &i;
    var num_mime_types: usize = undefined;
    _ = &num_mime_types;
    var text_mime_types: [*c]const [*c]const u8 = undefined;
    _ = &text_mime_types;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    text_mime_types = SDL_GetTextMimeTypes(_this, &num_mime_types);
    {
        i = 0;
        while (i < num_mime_types) : (i +%= 1) {
            if (SDL_HasClipboardData_REAL(text_mime_types[i])) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_SetPrimarySelectionText_REAL(arg_text: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    var text = arg_text;
    _ = &text;
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (!(text != null)) {
        text = "";
    }
    if (_this.*.SetPrimarySelectionText != null) {
        if (!_this.*.SetPrimarySelectionText.?(_this, text)) {
            return @"false" != 0;
        }
    } else {
        SDL_free_REAL(@ptrCast(@alignCast(_this.*.primary_selection_text)));
        _this.*.primary_selection_text = SDL_strdup_REAL(text);
    }
    var mime_types: [*c][*c]u8 = SDL_CopyClipboardMimeTypes(@ptrCast(@alignCast(_this.*.clipboard_mime_types)), _this.*.num_clipboard_mime_types, @"true" != 0);
    _ = &mime_types;
    if (!(mime_types != null)) {
        return SDL_SetError_REAL("unable to copy current mime types");
    }
    SDL_SendClipboardUpdate(@"true" != 0, mime_types, _this.*.num_clipboard_mime_types);
    return @"true" != 0;
}
pub export fn SDL_GetPrimarySelectionText_REAL() [*c]u8 {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        _ = SDL_UninitializedVideo();
        return SDL_strdup_REAL("");
    }
    if (_this.*.GetPrimarySelectionText != null) {
        return _this.*.GetPrimarySelectionText.?(_this);
    } else {
        var text: [*c]const u8 = _this.*.primary_selection_text;
        _ = &text;
        if (!(text != null)) {
            text = "";
        }
        return SDL_strdup_REAL(text);
    }
}
pub export fn SDL_HasPrimarySelectionText_REAL() bool {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (!(_this != null)) {
        return SDL_UninitializedVideo();
    }
    if (_this.*.HasPrimarySelectionText != null) {
        return _this.*.HasPrimarySelectionText.?(_this);
    } else {
        if ((_this.*.primary_selection_text != null) and (@as(c_int, _this.*.primary_selection_text[@as(c_int, 0)]) != @as(c_int, '\x00'))) {
            return @"true" != 0;
        } else {
            return @"false" != 0;
        }
    }
}

pub const SDL_ClearClipboardData = SDL_ClearClipboardData_REAL;
pub const SDL_GetClipboardData = SDL_GetClipboardData_REAL;
pub const SDL_GetClipboardMimeTypes = SDL_GetClipboardMimeTypes_REAL;
pub const SDL_GetClipboardText = SDL_GetClipboardText_REAL;
pub const SDL_GetPrimarySelectionText = SDL_GetPrimarySelectionText_REAL;
pub const SDL_HasClipboardData = SDL_HasClipboardData_REAL;
pub const SDL_HasClipboardText = SDL_HasClipboardText_REAL;
pub const SDL_HasPrimarySelectionText = SDL_HasPrimarySelectionText_REAL;
pub const SDL_SetClipboardData = SDL_SetClipboardData_REAL;
pub const SDL_SetClipboardText = SDL_SetClipboardText_REAL;
pub const SDL_SetPrimarySelectionText = SDL_SetPrimarySelectionText_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
