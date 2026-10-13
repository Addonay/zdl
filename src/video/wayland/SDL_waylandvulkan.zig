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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
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
pub const struct_wl_display = opaque {
};
pub const struct_wl_registry = opaque {
};
pub const struct_wl_compositor = opaque {
};
pub const struct_wl_shm = opaque {
};
pub const struct_xdg_wm_base_9 = opaque {};
pub const struct_libdecor = opaque {
};
const struct_unnamed_8 = extern struct {
    xdg: ?*struct_xdg_wm_base_9 = null,
    libdecor: ?*struct_libdecor = null,
};
pub const struct_wl_subcompositor = opaque {
};
pub const struct_zwp_relative_pointer_manager_v1_10 = opaque {};
pub const struct_zwp_pointer_constraints_v1_11 = opaque {};
pub const struct_wp_pointer_warp_v1_12 = opaque {};
pub const struct_wp_cursor_shape_manager_v1_13 = opaque {};
pub const struct_wl_data_device_manager = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_14 = opaque {};
pub const struct_zxdg_decoration_manager_v1_15 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_16 = opaque {};
pub const struct_zwp_idle_inhibit_manager_v1_17 = opaque {};
pub const struct_xdg_activation_v1_18 = opaque {};
pub const struct_zwp_text_input_manager_v3_19 = opaque {};
pub const struct_zxdg_output_manager_v1_20 = opaque {};
pub const struct_wp_viewporter_21 = opaque {};
pub const struct_wp_fractional_scale_manager_v1_22 = opaque {};
pub const struct_zwp_input_timestamps_manager_v1_23 = opaque {};
pub const struct_zxdg_exporter_v2_24 = opaque {};
pub const struct_xdg_wm_dialog_v1_25 = opaque {};
pub const struct_wp_alpha_modifier_v1_26 = opaque {};
pub const struct_xdg_toplevel_icon_manager_v1_27 = opaque {};
pub const struct_frog_color_management_factory_v1_28 = opaque {};
pub const struct_wp_color_manager_v1_29 = opaque {};
pub const struct_zwp_tablet_manager_v2_30 = opaque {};
pub const struct_wl_fixes = opaque {
};
pub const struct_zwp_pointer_gestures_v1_31 = opaque {};
pub const struct_wp_single_pixel_buffer_manager_v1_32 = opaque {};
pub const struct_xdg_session_manager_v1_33 = opaque {};
pub const struct_xdg_toplevel_tag_manager_v1_34 = opaque {};
pub const struct_xdg_session_v1_35 = opaque {};
pub const struct_xkb_context = opaque {
};
pub const struct_wl_list = extern struct {
    prev: [*c]struct_wl_list = null,
    next: [*c]struct_wl_list = null,
};
pub const struct_SDL_WaylandSeat = opaque {};
pub const struct_Wayland_EventThreadContext = opaque {
};
pub const Wayland_EventThreadContext = struct_Wayland_EventThreadContext;
pub const struct_wl_output = opaque {
};
pub const struct_zxdg_output_v1_36 = opaque {};
pub const struct_wp_color_management_output_v1_37 = opaque {};
pub const struct_Wayland_ColorInfoState_38 = opaque {};
const struct_unnamed_39 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_40 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_41 = extern struct {
    width_mm: c_int = 0,
    height_mm: c_int = 0,
};
pub const enum_VkSystemAllocationScope = c_uint;
pub const VkSystemAllocationScope = enum_VkSystemAllocationScope;
pub const PFN_vkAllocationFunction = ?*const fn (pUserData: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkReallocationFunction = ?*const fn (pUserData: ?*anyopaque, pOriginal: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkFreeFunction = ?*const fn (pUserData: ?*anyopaque, pMemory: ?*anyopaque) callconv(.c) void;
pub const enum_VkInternalAllocationType = c_uint;
pub const VkInternalAllocationType = enum_VkInternalAllocationType;
pub const PFN_vkInternalAllocationNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkInternalFreeNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
const struct_unnamed_42 = extern struct {
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
const struct_unnamed_43 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_44 = opaque {};
pub const struct_SDL_EGL_VideoData_45 = opaque {};
pub const struct_SDL_PrivateGLESData_46 = opaque {};
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
    gl_config: struct_unnamed_42 = @import("std").mem.zeroes(struct_unnamed_42),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_43 = @import("std").mem.zeroes(struct_unnamed_43),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_44 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_45 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_46 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
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
pub const struct_SDL_DisplayData = extern struct {
    videodata: [*c]SDL_VideoData = null,
    output: ?*struct_wl_output = null,
    xdg_output: ?*struct_zxdg_output_v1_36 = null,
    wp_color_management_output: ?*struct_wp_color_management_output_v1_37 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_38 = null,
    wl_output_name: [*c]u8 = null,
    scale_factor: f64 = 0,
    integer_scale_factor: c_int = 0,
    registry_id: Uint32 = 0,
    logical: struct_unnamed_39 = @import("std").mem.zeroes(struct_unnamed_39),
    pixel: struct_unnamed_40 = @import("std").mem.zeroes(struct_unnamed_40),
    physical: struct_unnamed_41 = @import("std").mem.zeroes(struct_unnamed_41),
    refresh: c_int = 0,
    transform: c_int = 0,
    orientation: SDL_DisplayOrientation = @import("std").mem.zeroes(SDL_DisplayOrientation),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    display: SDL_DisplayID = 0,
    placeholder: SDL_VideoDisplay = @import("std").mem.zeroes(SDL_VideoDisplay),
    wl_output_done_count: c_int = 0,
    has_logical_position: bool = false,
    has_logical_size: bool = false,
    geometry_changed: bool = false,
};
pub const SDL_DisplayData = struct_SDL_DisplayData;
pub const struct_SDL_VideoData = extern struct {
    display: ?*struct_wl_display = null,
    registry: ?*struct_wl_registry = null,
    compositor: ?*struct_wl_compositor = null,
    shm: ?*struct_wl_shm = null,
    cursor_themes: [*c]SDL_WaylandCursorTheme = null,
    num_cursor_themes: c_int = 0,
    shell: struct_unnamed_8 = @import("std").mem.zeroes(struct_unnamed_8),
    subcompositor: ?*struct_wl_subcompositor = null,
    relative_pointer_manager: ?*struct_zwp_relative_pointer_manager_v1_10 = null,
    pointer_constraints: ?*struct_zwp_pointer_constraints_v1_11 = null,
    wp_pointer_warp_v1: ?*struct_wp_pointer_warp_v1_12 = null,
    cursor_shape_manager: ?*struct_wp_cursor_shape_manager_v1_13 = null,
    data_device_manager: ?*struct_wl_data_device_manager = null,
    primary_selection_device_manager: ?*struct_zwp_primary_selection_device_manager_v1_14 = null,
    decoration_manager: ?*struct_zxdg_decoration_manager_v1_15 = null,
    key_inhibitor_manager: ?*struct_zwp_keyboard_shortcuts_inhibit_manager_v1_16 = null,
    idle_inhibit_manager: ?*struct_zwp_idle_inhibit_manager_v1_17 = null,
    activation_manager: ?*struct_xdg_activation_v1_18 = null,
    text_input_manager: ?*struct_zwp_text_input_manager_v3_19 = null,
    xdg_output_manager: ?*struct_zxdg_output_manager_v1_20 = null,
    viewporter: ?*struct_wp_viewporter_21 = null,
    fractional_scale_manager: ?*struct_wp_fractional_scale_manager_v1_22 = null,
    input_timestamps_manager: ?*struct_zwp_input_timestamps_manager_v1_23 = null,
    zxdg_exporter_v2: ?*struct_zxdg_exporter_v2_24 = null,
    xdg_wm_dialog_v1: ?*struct_xdg_wm_dialog_v1_25 = null,
    wp_alpha_modifier_v1: ?*struct_wp_alpha_modifier_v1_26 = null,
    xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_27 = null,
    frog_color_management_factory_v1: ?*struct_frog_color_management_factory_v1_28 = null,
    wp_color_manager_v1: ?*struct_wp_color_manager_v1_29 = null,
    tablet_manager: ?*struct_zwp_tablet_manager_v2_30 = null,
    wl_fixes: ?*struct_wl_fixes = null,
    zwp_pointer_gestures: ?*struct_zwp_pointer_gestures_v1_31 = null,
    single_pixel_buffer_manager: ?*struct_wp_single_pixel_buffer_manager_v1_32 = null,
    xdg_session_manager: ?*struct_xdg_session_manager_v1_33 = null,
    xdg_toplevel_tag_manager: ?*struct_xdg_toplevel_tag_manager_v1_34 = null,
    xdg_session: ?*struct_xdg_session_v1_35 = null,
    xkb_context: ?*struct_xkb_context = null,
    seat_list: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
    last_implicit_grab_seat: ?*struct_SDL_WaylandSeat = null,
    current_data_offer_seat: ?*struct_SDL_WaylandSeat = null,
    current_primary_selection_seat: ?*struct_SDL_WaylandSeat = null,
    event_thread_context: ?*Wayland_EventThreadContext = null,
    output_list: [*c][*c]SDL_DisplayData = null,
    output_count: c_int = 0,
    output_max: c_int = 0,
    initializing: bool = false,
    display_disconnected: bool = false,
    display_externally_owned: bool = false,
    scale_to_display_enabled: bool = false,
};
pub const SDL_VideoData = struct_SDL_VideoData;
pub const struct_wl_surface = opaque {
};
pub const struct_wl_callback = opaque {
};
pub const struct_wl_event_queue = opaque {
};
pub const struct_libdecor_frame = opaque {
};
const struct_unnamed_48 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {};
pub const struct_xdg_toplevel = opaque {};
const struct_unnamed_51 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_53 = opaque {};
pub const struct_xdg_positioner_54 = opaque {};
const struct_unnamed_52 = extern struct {
    xdg_popup: ?*struct_xdg_popup_53 = null,
    xdg_positioner: ?*struct_xdg_positioner_54 = null,
};
const union_unnamed_50 = extern union {
    toplevel: struct_unnamed_51,
    popup: struct_unnamed_52,
};
const struct_unnamed_49 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_50 = @import("std").mem.zeroes(union_unnamed_50),
    serial: Uint32 = 0,
};
const union_unnamed_47 = extern union {
    libdecor: struct_unnamed_48,
    xdg: struct_unnamed_49,
};
const enum_unnamed_55 = c_uint;
const enum_unnamed_56 = c_uint;
const enum_unnamed_57 = c_uint;
const enum_unnamed_58 = c_uint;
const enum_unnamed_59 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const EGLSurface = ?*anyopaque;
pub const struct_zxdg_toplevel_decoration_v1_60 = opaque {};
pub const struct_zwp_idle_inhibitor_v1_61 = opaque {};
pub const struct_xdg_activation_token_v1_62 = opaque {};
pub const struct_wp_viewport_63 = opaque {};
pub const struct_wp_fractional_scale_v1_64 = opaque {};
pub const struct_zxdg_exported_v2_65 = opaque {};
pub const struct_xdg_dialog_v1_66 = opaque {};
pub const struct_wp_alpha_modifier_surface_v1_67 = opaque {};
pub const struct_xdg_toplevel_icon_v1_68 = opaque {};
pub const struct_frog_color_managed_surface_69 = opaque {};
pub const struct_wp_color_management_surface_feedback_v1_70 = opaque {};
pub const struct_xdg_toplevel_session_v1_71 = opaque {};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_72 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_73 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_74 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_75 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_76 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_77 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_78 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_63 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_79 = extern struct {
    hint: c_int = 0,
    purpose: c_int = 0,
    active: bool = false,
};
pub const struct_SDL_WindowData = extern struct {
    sdlwindow: [*c]SDL_Window = null,
    waylandData: [*c]SDL_VideoData = null,
    surface: ?*struct_wl_surface = null,
    gles_swap_frame_callback: ?*struct_wl_callback = null,
    gles_swap_frame_event_queue: ?*struct_wl_event_queue = null,
    gles_swap_frame_surface_wrapper: ?*struct_wl_surface = null,
    surface_frame_callback: ?*struct_wl_callback = null,
    shell_surface: union_unnamed_47 = @import("std").mem.zeroes(union_unnamed_47),
    shell_surface_type: enum_unnamed_55 = @import("std").mem.zeroes(enum_unnamed_55),
    shell_surface_status: enum_unnamed_56 = @import("std").mem.zeroes(enum_unnamed_56),
    wm_caps: enum_unnamed_57 = @import("std").mem.zeroes(enum_unnamed_57),
    toplevel_constraints: enum_unnamed_58 = @import("std").mem.zeroes(enum_unnamed_58),
    resize_edge: enum_unnamed_59 = @import("std").mem.zeroes(enum_unnamed_59),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_60 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_61 = null,
    activation_token: ?*struct_xdg_activation_token_v1_62 = null,
    viewport: ?*struct_wp_viewport_63 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_64 = null,
    exported: ?*struct_zxdg_exported_v2_65 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_66 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_67 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_68 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_69 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_70 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_71 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_38 = null,
    swap_interval_ready: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    outputs: [*c][*c]SDL_DisplayData = null,
    num_outputs: c_int = 0,
    app_id: [*c]u8 = null,
    session_id: [*c]u8 = null,
    scale_factor: f64 = 0,
    icon_buffers: [*c]?*struct_wl_buffer = null,
    icon_buffer_count: c_int = 0,
    keyboard_focus_count: c_int = 0,
    pointer_focus_count: c_int = 0,
    active_touch_count: c_int = 0,
    pointer_scale: struct_unnamed_72 = @import("std").mem.zeroes(struct_unnamed_72),
    requested: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    current: struct_unnamed_74 = @import("std").mem.zeroes(struct_unnamed_74),
    last_configure: struct_unnamed_75 = @import("std").mem.zeroes(struct_unnamed_75),
    system_limits: struct_unnamed_76 = @import("std").mem.zeroes(struct_unnamed_76),
    toplevel_bounds: struct_unnamed_77 = @import("std").mem.zeroes(struct_unnamed_77),
    mask: struct_unnamed_78 = @import("std").mem.zeroes(struct_unnamed_78),
    text_input_props: struct_unnamed_79 = @import("std").mem.zeroes(struct_unnamed_79),
    explicit_geometry: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    last_displayID: SDL_DisplayID = 0,
    pending_state_deadline_count: c_int = 0,
    last_focus_event_time_ns: Uint64 = 0,
    last_resize_event_time_ns: Uint64 = 0,
    icc_fd: c_int = 0,
    icc_size: Uint32 = 0,
    floating: bool = false,
    suspended: bool = false,
    resizing: bool = false,
    active: bool = false,
    pending_config_ack: bool = false,
    pending_state_commit: bool = false,
    limits_changed: bool = false,
    is_fullscreen: bool = false,
    fullscreen_exclusive: bool = false,
    drop_fullscreen_requests: bool = false,
    showing_window: bool = false,
    fullscreen_was_positioned: bool = false,
    show_hide_sync_required: bool = false,
    scale_to_display: bool = false,
    reparenting_required: bool = false,
    double_buffer: bool = false,
    accepts_drag_and_drop: bool = false,
    enable_insets: bool = false,
    hit_test_result: SDL_HitTestResult = @import("std").mem.zeroes(SDL_HitTestResult),
    external_window_list_link: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const SDL_WindowData = struct_SDL_WindowData;
pub const struct_wl_cursor_theme = opaque {
};
pub const VkBool32 = u32;
pub const VkFlags = u32;
pub const VK_SUCCESS: c_int = 0;
pub const enum_VkResult = c_int;
pub const VkResult = enum_VkResult;
pub const VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR: c_int = 1000006000;
pub const enum_VkStructureType = c_uint;
pub const VkStructureType = enum_VkStructureType;
pub const PFN_vkVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_VkExtensionProperties = extern struct {
    extensionName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
};
pub const VkExtensionProperties = struct_VkExtensionProperties;
pub const PFN_vkGetInstanceProcAddr = ?*const fn (instance: VkInstance, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkEnumerateInstanceExtensionProperties = ?*const fn (pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const VkWaylandSurfaceCreateFlagsKHR = VkFlags;
pub const struct_VkWaylandSurfaceCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkWaylandSurfaceCreateFlagsKHR = 0,
    display: ?*struct_wl_display = null,
    surface: ?*struct_wl_surface = null,
};
pub const VkWaylandSurfaceCreateInfoKHR = struct_VkWaylandSurfaceCreateInfoKHR;
pub const PFN_vkCreateWaylandSurfaceKHR = ?*const fn (instance: VkInstance, pCreateInfo: [*c]const VkWaylandSurfaceCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pSurface: [*c]VkSurfaceKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR = ?*const fn (physicalDevice: VkPhysicalDevice, queueFamilyIndex: u32, display: ?*struct_wl_display) callconv(.c) VkBool32;
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
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme = null,
    size: c_int = 0,
};
pub export fn Wayland_Vulkan_LoadLibrary(_this: [*c]SDL_VideoDevice, arg_path: [*c]const u8) bool {
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
    var hasWaylandSurfaceExtension: bool = undefined;
    _ = &hasWaylandSurfaceExtension;
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = undefined;
    _ = &vkGetInstanceProcAddr;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                extensions = null;
                extensionCount = 0;
                hasSurfaceExtension = @"false" != 0;
                hasWaylandSurfaceExtension = @"false" != 0;
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
                if (SDL_strcmp_REAL("VK_KHR_wayland_surface", @ptrCast(@alignCast(&extensions[i].extensionName))) == @as(c_int, 0)) {
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
                hasWaylandSurfaceExtension = @"true" != 0;
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
                if (!hasWaylandSurfaceExtension) {
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
                _ = SDL_SetError_REAL("Installed Vulkan doesn't implement the VK_KHR_wayland_surface extension");
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
pub export fn Wayland_Vulkan_UnloadLibrary(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    if (_this.*.vulkan_config.loader_handle != null) {
        SDL_UnloadObject_REAL(_this.*.vulkan_config.loader_handle);
        _this.*.vulkan_config.loader_handle = null;
    }
}
pub export fn Wayland_Vulkan_GetInstanceExtensions(_: [*c]SDL_VideoDevice, count: [*c]Uint32) [*c]const [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local_extensionsForWayland = struct {
        const extensionsForWayland: [2][*c]const u8 = [2][*c]const u8{
            "VK_KHR_surface",
            "VK_KHR_wayland_surface",
        };
    };
    _ = &static_local_extensionsForWayland;
    count.* = @truncate(@sizeOf(@TypeOf(static_local_extensionsForWayland.extensionsForWayland)) / @sizeOf(@TypeOf(static_local_extensionsForWayland.extensionsForWayland[@as(c_int, 0)])));
    return @ptrCast(@alignCast(&static_local_extensionsForWayland.extensionsForWayland));
}
pub export fn Wayland_Vulkan_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool {
    @setEvalBranchQuota(100000);
    var windowData: [*c]SDL_WindowData = window.*.internal;
    _ = &windowData;
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr)));
    _ = &vkGetInstanceProcAddr;
    var vkCreateWaylandSurfaceKHR: PFN_vkCreateWaylandSurfaceKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkCreateWaylandSurfaceKHR"))));
    _ = &vkCreateWaylandSurfaceKHR;
    var createInfo: VkWaylandSurfaceCreateInfoKHR = undefined;
    _ = &createInfo;
    var result: VkResult = undefined;
    _ = &result;
    if (!(_this.*.vulkan_config.loader_handle != null)) {
        return SDL_SetError_REAL("Vulkan is not loaded");
    }
    if (!(vkCreateWaylandSurfaceKHR != null)) {
        return SDL_SetError_REAL("VK_KHR_wayland_surface extension is not enabled in the Vulkan instance.");
    }
    _ = memset(@ptrCast(@alignCast(&createInfo)), 0, @sizeOf(@TypeOf(createInfo)));
    createInfo.sType = VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR;
    createInfo.pNext = null;
    createInfo.flags = 0;
    createInfo.display = windowData.*.waylandData.*.display;
    createInfo.surface = windowData.*.surface;
    result = vkCreateWaylandSurfaceKHR.?(instance, &createInfo, allocator, surface);
    if (result != VK_SUCCESS) {
        return SDL_SetError_REAL("vkCreateWaylandSurfaceKHR failed: %s", SDL_Vulkan_GetResultString(result));
    }
    return @"true" != 0;
}
pub export fn Wayland_Vulkan_DestroySurface(_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) void {
    @setEvalBranchQuota(100000);
    if (_this.*.vulkan_config.loader_handle != null) {
        SDL_Vulkan_DestroySurface_Internal(@ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr))), instance, surface, allocator);
    }
}
pub export fn Wayland_Vulkan_GetPresentationSupport(_this: [*c]SDL_VideoDevice, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) bool {
    @setEvalBranchQuota(100000);
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = @ptrCast(@alignCast(@constCast(_this.*.vulkan_config.vkGetInstanceProcAddr)));
    _ = &vkGetInstanceProcAddr;
    var vkGetPhysicalDeviceWaylandPresentationSupportKHR: PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR"))));
    _ = &vkGetPhysicalDeviceWaylandPresentationSupportKHR;
    if (!(_this.*.vulkan_config.loader_handle != null)) {
        return SDL_SetError_REAL("Vulkan is not loaded");
    }
    if (!(vkGetPhysicalDeviceWaylandPresentationSupportKHR != null)) {
        return SDL_SetError_REAL("VK_KHR_wayland_surface extension is not enabled in the Vulkan instance.");
    }
    return vkGetPhysicalDeviceWaylandPresentationSupportKHR.?(physicalDevice, queueFamilyIndex, _this.*.internal.*.display) != 0;
}

pub const libdecor = struct_libdecor;
pub const wl_fixes = struct_wl_fixes;
pub const xkb_context = struct_xkb_context;
pub const xdg_toplevel = struct_xdg_toplevel;
