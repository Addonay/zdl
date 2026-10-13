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
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
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
pub const struct_SDL_WindowData = extern struct {
    sdlwindow: [*c]SDL_Window = null,
    waylandData: [*c]SDL_VideoData = null,
    surface: ?*struct_wl_surface = null,
    gles_swap_frame_callback: ?*struct_wl_callback = null,
    gles_swap_frame_event_queue: ?*struct_wl_event_queue = null,
    gles_swap_frame_surface_wrapper: ?*struct_wl_surface = null,
    surface_frame_callback: ?*struct_wl_callback = null,
    shell_surface: union_unnamed_57 = @import("std").mem.zeroes(union_unnamed_57),
    shell_surface_type: enum_unnamed_65 = @import("std").mem.zeroes(enum_unnamed_65),
    shell_surface_status: enum_unnamed_66 = @import("std").mem.zeroes(enum_unnamed_66),
    wm_caps: enum_unnamed_67 = @import("std").mem.zeroes(enum_unnamed_67),
    toplevel_constraints: enum_unnamed_68 = @import("std").mem.zeroes(enum_unnamed_68),
    resize_edge: enum_unnamed_69 = @import("std").mem.zeroes(enum_unnamed_69),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_70 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_71 = null,
    activation_token: ?*struct_xdg_activation_token_v1_72 = null,
    viewport: ?*struct_wp_viewport_73 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_74 = null,
    exported: ?*struct_zxdg_exported_v2_75 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_76 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_77 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_78 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_79 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_80 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_81 = null,
    color_info_state: [*c]struct_Wayland_ColorInfoState = null,
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
    pointer_scale: struct_unnamed_82 = @import("std").mem.zeroes(struct_unnamed_82),
    requested: struct_unnamed_83 = @import("std").mem.zeroes(struct_unnamed_83),
    current: struct_unnamed_84 = @import("std").mem.zeroes(struct_unnamed_84),
    last_configure: struct_unnamed_85 = @import("std").mem.zeroes(struct_unnamed_85),
    system_limits: struct_unnamed_86 = @import("std").mem.zeroes(struct_unnamed_86),
    toplevel_bounds: struct_unnamed_87 = @import("std").mem.zeroes(struct_unnamed_87),
    mask: struct_unnamed_88 = @import("std").mem.zeroes(struct_unnamed_88),
    text_input_props: struct_unnamed_89 = @import("std").mem.zeroes(struct_unnamed_89),
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
const struct_unnamed_12 = extern struct {
    xdg: ?*struct_xdg_wm_base_13 = null,
    libdecor: ?*struct_libdecor_14 = null,
};
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED: c_int = 530;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
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
pub const struct_SDL_VideoData = extern struct {
    display: ?*struct_wl_display_8 = null,
    registry: ?*struct_wl_registry_9 = null,
    compositor: ?*struct_wl_compositor_10 = null,
    shm: ?*struct_wl_shm_11 = null,
    cursor_themes: [*c]SDL_WaylandCursorTheme = null,
    num_cursor_themes: c_int = 0,
    shell: struct_unnamed_12 = @import("std").mem.zeroes(struct_unnamed_12),
    subcompositor: ?*struct_wl_subcompositor_15 = null,
    relative_pointer_manager: ?*struct_zwp_relative_pointer_manager_v1_16 = null,
    pointer_constraints: ?*struct_zwp_pointer_constraints_v1_17 = null,
    wp_pointer_warp_v1: ?*struct_wp_pointer_warp_v1_18 = null,
    cursor_shape_manager: ?*struct_wp_cursor_shape_manager_v1_19 = null,
    data_device_manager: ?*struct_wl_data_device_manager_20 = null,
    primary_selection_device_manager: ?*struct_zwp_primary_selection_device_manager_v1_21 = null,
    decoration_manager: ?*struct_zxdg_decoration_manager_v1_22 = null,
    key_inhibitor_manager: ?*struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23 = null,
    idle_inhibit_manager: ?*struct_zwp_idle_inhibit_manager_v1_24 = null,
    activation_manager: ?*struct_xdg_activation_v1_25 = null,
    text_input_manager: ?*struct_zwp_text_input_manager_v3_26 = null,
    xdg_output_manager: ?*struct_zxdg_output_manager_v1_27 = null,
    viewporter: ?*struct_wp_viewporter_28 = null,
    fractional_scale_manager: ?*struct_wp_fractional_scale_manager_v1_29 = null,
    input_timestamps_manager: ?*struct_zwp_input_timestamps_manager_v1_30 = null,
    zxdg_exporter_v2: ?*struct_zxdg_exporter_v2_31 = null,
    xdg_wm_dialog_v1: ?*struct_xdg_wm_dialog_v1_32 = null,
    wp_alpha_modifier_v1: ?*struct_wp_alpha_modifier_v1_33 = null,
    xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_34 = null,
    frog_color_management_factory_v1: ?*struct_frog_color_management_factory_v1_35 = null,
    wp_color_manager_v1: ?*struct_wp_color_manager_v1_36 = null,
    tablet_manager: ?*struct_zwp_tablet_manager_v2_37 = null,
    wl_fixes: ?*struct_wl_fixes_38 = null,
    zwp_pointer_gestures: ?*struct_zwp_pointer_gestures_v1_39 = null,
    single_pixel_buffer_manager: ?*struct_wp_single_pixel_buffer_manager_v1_40 = null,
    xdg_session_manager: ?*struct_xdg_session_manager_v1_41 = null,
    xdg_toplevel_tag_manager: ?*struct_xdg_toplevel_tag_manager_v1_42 = null,
    xdg_session: ?*struct_xdg_session_v1_43 = null,
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
    gl_config: struct_unnamed_52 = @import("std").mem.zeroes(struct_unnamed_52),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_53 = @import("std").mem.zeroes(struct_unnamed_53),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_54 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_55 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_56 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const struct_SDL_DisplayData = extern struct {
    videodata: [*c]SDL_VideoData = null,
    output: ?*struct_wl_output_44 = null,
    xdg_output: ?*struct_zxdg_output_v1_45 = null,
    wp_color_management_output: ?*struct_wp_color_management_output_v1_46 = null,
    color_info_state: [*c]struct_Wayland_ColorInfoState = null,
    wl_output_name: [*c]u8 = null,
    scale_factor: f64 = 0,
    integer_scale_factor: c_int = 0,
    registry_id: Uint32 = 0,
    logical: struct_unnamed_49 = @import("std").mem.zeroes(struct_unnamed_49),
    pixel: struct_unnamed_50 = @import("std").mem.zeroes(struct_unnamed_50),
    physical: struct_unnamed_51 = @import("std").mem.zeroes(struct_unnamed_51),
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
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_SetDisplayHDRProperties(display: [*c]SDL_VideoDisplay, HDR: [*c]const SDL_HDROutputProperties) void;
pub extern fn SDL_GetVideoDisplay(display: SDL_DisplayID) [*c]SDL_VideoDisplay;
pub extern fn SDL_SetWindowHDRProperties(window: [*c]SDL_Window, HDR: [*c]const SDL_HDROutputProperties, send_event: bool) void;
pub const struct_Wayland_ColorInfoState = extern struct {
    wp_image_description: ?*struct_wp_image_description_v1 = null,
    wp_image_description_info: ?*struct_wp_image_description_info_v1 = null,
    queue: ?*struct_wl_event_queue = null,
    unnamed_0: union_unnamed_47 = @import("std").mem.zeroes(union_unnamed_47),
    object_type: enum_unnamed_48 = @import("std").mem.zeroes(enum_unnamed_48),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    icc_fd: c_int = 0,
    icc_size: Uint32 = 0,
    deferred_event_processing: bool = false,
};
pub export fn Wayland_FreeColorInfoState(state: [*c]Wayland_ColorInfoState) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (state != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                Wayland_CancelColorInfoRequest(state);
                if (state.*.queue != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
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
                {}
            },
            4 => {
                WAYLAND_wl_event_queue_destroy.?(state.*.queue);
                {
                    sdl_pc = 6;
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
                switch (state.*.object_type) {
                    @as(enum_unnamed_48, WAYLAND_COLOR_OBJECT_TYPE_WINDOW) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(enum_unnamed_48, WAYLAND_COLOR_OBJECT_TYPE_DISPLAY) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            7 => {
                SDL_free_REAL(@ptrCast(@alignCast(state)));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            8 => {
                state.*.unnamed_0.window_data.*.color_info_state = null;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                state.*.unnamed_0.display_data.*.color_info_state = null;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn Wayland_GetColorInfoForWindow(window_data: [*c]SDL_WindowData, defer_event_processing: bool) void {
    @setEvalBranchQuota(100000);
    Wayland_FreeColorInfoState(window_data.*.color_info_state);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(Wayland_ColorInfoState))));
    _ = &state;
    if (state != null) {
        window_data.*.color_info_state = state;
        state.*.unnamed_0.window_data = window_data;
        state.*.object_type = WAYLAND_COLOR_OBJECT_TYPE_WINDOW;
        state.*.deferred_event_processing = defer_event_processing;
        if (!defer_event_processing) {
            state.*.queue = Wayland_DisplayCreateQueue(window_data.*.waylandData.*.display, "SDL Color Management Queue");
            var surface_feedback_wrapper: ?*struct_wl_proxy = @ptrCast(@alignCast(WAYLAND_wl_proxy_create_wrapper.?(@ptrCast(@alignCast(window_data.*.wp_color_management_surface_feedback)))));
            _ = &surface_feedback_wrapper;
            WAYLAND_wl_proxy_set_queue.?(surface_feedback_wrapper, state.*.queue);
            state.*.wp_image_description = wp_color_management_surface_feedback_v1_get_preferred(@ptrCast(@alignCast(surface_feedback_wrapper)));
            WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(surface_feedback_wrapper)));
        } else {
            state.*.wp_image_description = wp_color_management_surface_feedback_v1_get_preferred(window_data.*.wp_color_management_surface_feedback);
        }
        _ = wp_image_description_v1_add_listener(state.*.wp_image_description, &image_description_listener, @ptrCast(@alignCast(state)));
        if (!defer_event_processing) {
            PumpColorspaceEvents(state);
        }
    }
}
pub export fn Wayland_GetColorInfoForOutput(display_data: [*c]SDL_DisplayData, defer_event_processing: bool) void {
    @setEvalBranchQuota(100000);
    Wayland_FreeColorInfoState(display_data.*.color_info_state);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(Wayland_ColorInfoState))));
    _ = &state;
    if (state != null) {
        display_data.*.color_info_state = state;
        state.*.unnamed_0.display_data = display_data;
        state.*.object_type = WAYLAND_COLOR_OBJECT_TYPE_DISPLAY;
        state.*.deferred_event_processing = defer_event_processing;
        if (!defer_event_processing) {
            state.*.queue = Wayland_DisplayCreateQueue(display_data.*.videodata.*.display, "SDL Color Management Queue");
            var output_feedback_wrapper: ?*struct_wl_proxy = @ptrCast(@alignCast(WAYLAND_wl_proxy_create_wrapper.?(@ptrCast(@alignCast(display_data.*.wp_color_management_output)))));
            _ = &output_feedback_wrapper;
            WAYLAND_wl_proxy_set_queue.?(output_feedback_wrapper, state.*.queue);
            state.*.wp_image_description = wp_color_management_output_v1_get_image_description(@ptrCast(@alignCast(output_feedback_wrapper)));
            WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(output_feedback_wrapper)));
        } else {
            state.*.wp_image_description = wp_color_management_output_v1_get_image_description(display_data.*.wp_color_management_output);
        }
        _ = wp_image_description_v1_add_listener(state.*.wp_image_description, &image_description_listener, @ptrCast(@alignCast(state)));
        if (!defer_event_processing) {
            PumpColorspaceEvents(state);
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const Wayland_ColorInfoState = struct_Wayland_ColorInfoState;
pub const struct_wl_display_8 = opaque {
};
pub const struct_wl_registry_9 = opaque {
};
pub const struct_wl_compositor_10 = opaque {
};
pub const struct_wl_shm_11 = opaque {
};
pub const struct_xdg_wm_base_13 = opaque {};
pub const struct_libdecor_14 = opaque {
};
pub const struct_wl_subcompositor_15 = opaque {
};
pub const struct_zwp_relative_pointer_manager_v1_16 = opaque {};
pub const struct_zwp_pointer_constraints_v1_17 = opaque {};
pub const struct_wp_pointer_warp_v1_18 = opaque {};
pub const struct_wp_cursor_shape_manager_v1_19 = opaque {};
pub const struct_wl_data_device_manager_20 = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_21 = opaque {};
pub const struct_zxdg_decoration_manager_v1_22 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23 = opaque {};
pub const struct_zwp_idle_inhibit_manager_v1_24 = opaque {};
pub const struct_xdg_activation_v1_25 = opaque {};
pub const struct_zwp_text_input_manager_v3_26 = opaque {};
pub const struct_zxdg_output_manager_v1_27 = opaque {};
pub const struct_wp_viewporter_28 = opaque {};
pub const struct_wp_fractional_scale_manager_v1_29 = opaque {};
pub const struct_zwp_input_timestamps_manager_v1_30 = opaque {};
pub const struct_zxdg_exporter_v2_31 = opaque {};
pub const struct_xdg_wm_dialog_v1_32 = opaque {};
pub const struct_wp_alpha_modifier_v1_33 = opaque {};
pub const struct_xdg_toplevel_icon_manager_v1_34 = opaque {};
pub const struct_frog_color_management_factory_v1_35 = opaque {};
pub const struct_wp_color_manager_v1_36 = opaque {
};
pub const struct_zwp_tablet_manager_v2_37 = opaque {};
pub const struct_wl_fixes_38 = opaque {
};
pub const struct_zwp_pointer_gestures_v1_39 = opaque {};
pub const struct_wp_single_pixel_buffer_manager_v1_40 = opaque {};
pub const struct_xdg_session_manager_v1_41 = opaque {};
pub const struct_xdg_toplevel_tag_manager_v1_42 = opaque {};
pub const struct_xdg_session_v1_43 = opaque {};
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
pub const struct_wl_output_44 = opaque {
};
pub const struct_zxdg_output_v1_45 = opaque {};
pub const struct_wp_color_management_output_v1_46 = opaque {
};
pub const struct_wp_image_description_v1 = opaque {
};
pub const struct_wp_image_description_info_v1 = opaque {
};
pub const struct_wl_event_queue = opaque {
};
const union_unnamed_47 = extern union {
    window_data: [*c]SDL_WindowData,
    display_data: [*c]SDL_DisplayData,
};
pub const WAYLAND_COLOR_OBJECT_TYPE_WINDOW: c_int = 0;
pub const WAYLAND_COLOR_OBJECT_TYPE_DISPLAY: c_int = 1;
const enum_unnamed_48 = c_uint;
const struct_unnamed_49 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_50 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_51 = extern struct {
    width_mm: c_int = 0,
    height_mm: c_int = 0,
};
const struct_unnamed_52 = extern struct {
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
const struct_unnamed_53 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_54 = opaque {};
pub const struct_SDL_EGL_VideoData_55 = opaque {};
pub const struct_SDL_PrivateGLESData_56 = opaque {};
pub const struct_wl_surface = opaque {
};
pub const struct_wl_callback = opaque {
};
pub const struct_libdecor_frame = opaque {
};
const struct_unnamed_58 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {};
pub const struct_xdg_toplevel = opaque {};
const struct_unnamed_61 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_63 = opaque {};
pub const struct_xdg_positioner_64 = opaque {};
const struct_unnamed_62 = extern struct {
    xdg_popup: ?*struct_xdg_popup_63 = null,
    xdg_positioner: ?*struct_xdg_positioner_64 = null,
};
const union_unnamed_60 = extern union {
    toplevel: struct_unnamed_61,
    popup: struct_unnamed_62,
};
const struct_unnamed_59 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_60 = @import("std").mem.zeroes(union_unnamed_60),
    serial: Uint32 = 0,
};
const union_unnamed_57 = extern union {
    libdecor: struct_unnamed_58,
    xdg: struct_unnamed_59,
};
const enum_unnamed_65 = c_uint;
const enum_unnamed_66 = c_uint;
const enum_unnamed_67 = c_uint;
const enum_unnamed_68 = c_uint;
const enum_unnamed_69 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const EGLSurface = ?*anyopaque;
pub const struct_zxdg_toplevel_decoration_v1_70 = opaque {};
pub const struct_zwp_idle_inhibitor_v1_71 = opaque {};
pub const struct_xdg_activation_token_v1_72 = opaque {};
pub const struct_wp_viewport_73 = opaque {};
pub const struct_wp_fractional_scale_v1_74 = opaque {};
pub const struct_zxdg_exported_v2_75 = opaque {};
pub const struct_xdg_dialog_v1_76 = opaque {};
pub const struct_wp_alpha_modifier_surface_v1_77 = opaque {};
pub const struct_xdg_toplevel_icon_v1_78 = opaque {};
pub const struct_frog_color_managed_surface_79 = opaque {};
pub const struct_wp_color_management_surface_feedback_v1_80 = opaque {
};
pub const struct_xdg_toplevel_session_v1_81 = opaque {};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_82 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_83 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_84 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_85 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_86 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_87 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_88 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_73 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_89 = extern struct {
    hint: c_int = 0,
    purpose: c_int = 0,
    active: bool = false,
};
pub const struct_wl_interface = extern struct {
    name: [*c]const u8 = null,
    version: c_int = 0,
    method_count: c_int = 0,
    methods: [*c]const struct_wl_message = null,
    event_count: c_int = 0,
    events: [*c]const struct_wl_message = null,
};
pub const struct_wl_message = extern struct {
    name: [*c]const u8 = null,
    signature: [*c]const u8 = null,
    types: [*c][*c]const struct_wl_interface = null,
};
pub const struct_wl_cursor_theme_96 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_96 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub extern var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_queue = ?*const fn (?*struct_wl_proxy, ?*struct_wl_event_queue) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_set_queue: SDL_DYNWAYLANDFN_wl_proxy_set_queue;
pub const SDL_DYNWAYLANDFN_wl_proxy_create_wrapper = ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_proxy_create_wrapper: SDL_DYNWAYLANDFN_wl_proxy_create_wrapper;
pub const SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_wrapper_destroy: SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_queue = ?*const fn (?*struct_wl_display_8, ?*struct_wl_event_queue) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_dispatch_queue: SDL_DYNWAYLANDFN_wl_display_dispatch_queue;
pub const SDL_DYNWAYLANDFN_wl_event_queue_destroy = ?*const fn (?*struct_wl_event_queue) callconv(.c) void;
pub extern var WAYLAND_wl_event_queue_destroy: SDL_DYNWAYLANDFN_wl_event_queue_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub extern fn Wayland_DisplayCreateQueue(display: ?*struct_wl_display_8, name: [*c]const u8) ?*struct_wl_event_queue;
pub extern const wp_image_description_v1_interface: struct_wl_interface;
pub extern const wp_image_description_info_v1_interface: struct_wl_interface;
pub fn wp_color_management_output_v1_get_image_description(wp_color_management_output_v1: ?*struct_wp_color_management_output_v1_46) callconv(.c) ?*struct_wp_image_description_v1 {
    @setEvalBranchQuota(100000);
    var image_description: ?*struct_wl_proxy = undefined;
    _ = &image_description;
    image_description = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_management_output_v1)), WP_COLOR_MANAGEMENT_OUTPUT_V1_GET_IMAGE_DESCRIPTION, &wp_image_description_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_management_output_v1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(image_description));
}
pub fn wp_color_management_surface_feedback_v1_get_preferred(wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_80) callconv(.c) ?*struct_wp_image_description_v1 {
    @setEvalBranchQuota(100000);
    var image_description: ?*struct_wl_proxy = undefined;
    _ = &image_description;
    image_description = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_management_surface_feedback_v1)), WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_GET_PREFERRED, &wp_image_description_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_management_surface_feedback_v1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(image_description));
}
pub const struct_wp_image_description_v1_listener = extern struct {
    failed: ?*const fn (data: ?*anyopaque, wp_image_description_v1: ?*struct_wp_image_description_v1, cause: u32, msg: [*c]const u8) callconv(.c) void = null,
    ready: ?*const fn (data: ?*anyopaque, wp_image_description_v1: ?*struct_wp_image_description_v1, identity: u32) callconv(.c) void = null,
    ready2: ?*const fn (data: ?*anyopaque, wp_image_description_v1: ?*struct_wp_image_description_v1, identity_hi: u32, identity_lo: u32) callconv(.c) void = null,
};
pub fn wp_image_description_v1_add_listener(wp_image_description_v1_1: ?*struct_wp_image_description_v1, listener: [*c]const struct_wp_image_description_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wp_image_description_v1_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wp_image_description_v1_destroy(wp_image_description_v1_1: ?*struct_wp_image_description_v1) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_image_description_v1_1)), WP_IMAGE_DESCRIPTION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_image_description_v1_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_image_description_v1_get_information(wp_image_description_v1_1: ?*struct_wp_image_description_v1) callconv(.c) ?*struct_wp_image_description_info_v1 {
    @setEvalBranchQuota(100000);
    var information: ?*struct_wl_proxy = undefined;
    _ = &information;
    information = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_image_description_v1_1)), WP_IMAGE_DESCRIPTION_V1_GET_INFORMATION, &wp_image_description_info_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_image_description_v1_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(information));
}
pub const struct_wp_image_description_info_v1_listener = extern struct {
    done: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1) callconv(.c) void = null,
    icc_file: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, icc: i32, icc_size: u32) callconv(.c) void = null,
    primaries: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, r_x: i32, r_y: i32, g_x: i32, g_y: i32, b_x: i32, b_y: i32, w_x: i32, w_y: i32) callconv(.c) void = null,
    primaries_named: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, primaries: u32) callconv(.c) void = null,
    tf_power: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, eexp: u32) callconv(.c) void = null,
    tf_named: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, tf: u32) callconv(.c) void = null,
    luminances: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, min_lum: u32, max_lum: u32, reference_lum: u32) callconv(.c) void = null,
    target_primaries: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, r_x: i32, r_y: i32, g_x: i32, g_y: i32, b_x: i32, b_y: i32, w_x: i32, w_y: i32) callconv(.c) void = null,
    target_luminance: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, min_lum: u32, max_lum: u32) callconv(.c) void = null,
    target_max_cll: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, max_cll: u32) callconv(.c) void = null,
    target_max_fall: ?*const fn (data: ?*anyopaque, wp_image_description_info_v1: ?*struct_wp_image_description_info_v1, max_fall: u32) callconv(.c) void = null,
};
pub fn wp_image_description_info_v1_add_listener(wp_image_description_info_v1_1: ?*struct_wp_image_description_info_v1, listener: [*c]const struct_wp_image_description_info_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wp_image_description_info_v1_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wp_image_description_info_v1_destroy(wp_image_description_info_v1_1: ?*struct_wp_image_description_info_v1) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wp_image_description_info_v1_1)));
}
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub fn Wayland_CancelColorInfoRequest(state: [*c]Wayland_ColorInfoState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (state != null) {
        if (state.*.wp_image_description_info != null) {
            wp_image_description_info_v1_destroy(state.*.wp_image_description_info);
            state.*.wp_image_description_info = null;
        }
        if (state.*.wp_image_description != null) {
            wp_image_description_v1_destroy(state.*.wp_image_description);
            state.*.wp_image_description = null;
        }
    }
}
pub fn image_description_info_handle_done(data: ?*anyopaque, _: ?*struct_wp_image_description_info_v1) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]Wayland_ColorInfoState = undefined;
    _ = &state;
    var disp: [*c]SDL_VideoDisplay = undefined;
    _ = &disp;
    comptime {
        if (!(@sizeOf(@TypeOf((&state.*.unnamed_0.display_data.*.HDR).*)) == @sizeOf(@TypeOf((&state.*.HDR).*)))) @compileError("static assertion failed \"sizeof (*(&state->display_data->HDR)) == sizeof (*( &state->HDR))\"");
    }
    comptime {
        if (!(@sizeOf(@TypeOf((&state.*.unnamed_0.display_data.*.placeholder.HDR).*)) == @sizeOf(@TypeOf((&state.*.HDR).*)))) @compileError("static assertion failed \"sizeof (*(&state->display_data->placeholder.HDR)) == sizeof (*( &state->HDR))\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                state = @ptrCast(@alignCast(data));
                Wayland_CancelColorInfoRequest(state);
                switch (state.*.object_type) {
                    @as(enum_unnamed_48, WAYLAND_COLOR_OBJECT_TYPE_WINDOW) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(enum_unnamed_48, WAYLAND_COLOR_OBJECT_TYPE_DISPLAY) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 1;
                        continue;
                    },
                }
            },
            1 => {
                {}
            },
            2 => {
                SDL_SetWindowHDRProperties(state.*.unnamed_0.window_data.*.sdlwindow, &state.*.HDR, @"true" != 0);
                if (state.*.icc_size != 0) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                state.*.unnamed_0.window_data.*.icc_fd = state.*.icc_fd;
                state.*.unnamed_0.window_data.*.icc_size = state.*.icc_size;
                _ = SDL_SendWindowEvent(state.*.unnamed_0.window_data.*.sdlwindow, SDL_EVENT_WINDOW_ICCPROF_CHANGED, 0, 0);
                {
                    sdl_pc = 5;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                _ = memcpy(@ptrCast(@alignCast(&state.*.unnamed_0.display_data.*.HDR)), @ptrCast(@alignCast(&state.*.HDR)), @sizeOf(@TypeOf((&state.*.HDR).*)));
                if (state.*.unnamed_0.display_data.*.display != 0) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                disp = SDL_GetVideoDisplay(state.*.unnamed_0.display_data.*.display);
                if (disp != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                _ = memcpy(@ptrCast(@alignCast(&state.*.unnamed_0.display_data.*.placeholder.HDR)), @ptrCast(@alignCast(&state.*.HDR)), @sizeOf(@TypeOf((&state.*.HDR).*)));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                SDL_SetDisplayHDRProperties(disp, &state.*.HDR);
                {
                    sdl_pc = 12;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn image_description_info_handle_icc_file(data: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, icc: i32, icc_size: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(data));
    _ = &state;
    state.*.icc_fd = icc;
    state.*.icc_size = icc_size;
}
pub fn image_description_info_handle_primaries(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_primaries_named(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_tf_power(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_tf_named(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_luminances(data: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32, max_lum: u32, reference_lum: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(data));
    _ = &state;
    state.*.HDR.HDR_headroom = @as(f32, @floatFromInt(max_lum)) / @as(f32, @floatFromInt(reference_lum));
    state.*.HDR.SDR_white_level = @as(f32, @floatFromInt(reference_lum)) / @as(f32, 80.0);
}
pub fn image_description_info_handle_target_primaries(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32, _: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_target_luminance(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_target_max_cll(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn image_description_info_handle_target_max_fall(_: ?*anyopaque, _: ?*struct_wp_image_description_info_v1, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const image_description_info_listener: struct_wp_image_description_info_v1_listener = struct_wp_image_description_info_v1_listener{
    .done = image_description_info_handle_done,
    .icc_file = image_description_info_handle_icc_file,
    .primaries = image_description_info_handle_primaries,
    .primaries_named = image_description_info_handle_primaries_named,
    .tf_power = image_description_info_handle_tf_power,
    .tf_named = image_description_info_handle_tf_named,
    .luminances = image_description_info_handle_luminances,
    .target_primaries = image_description_info_handle_target_primaries,
    .target_luminance = image_description_info_handle_target_luminance,
    .target_max_cll = image_description_info_handle_target_max_cll,
    .target_max_fall = image_description_info_handle_target_max_fall,
};
pub fn PumpColorspaceEvents(state: [*c]Wayland_ColorInfoState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vid: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &vid;
    while (state.*.wp_image_description != null) {
        _ = WAYLAND_wl_display_dispatch_queue.?(vid.*.display, state.*.queue);
    }
    Wayland_FreeColorInfoState(state);
}
pub fn image_description_handle_failed(data: ?*anyopaque, _: ?*struct_wp_image_description_v1, _: u32, _: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(data));
    _ = &state;
    Wayland_CancelColorInfoRequest(state);
    if (state.*.deferred_event_processing) {
        Wayland_FreeColorInfoState(state);
    }
}
pub fn image_description_handle_ready2(data: ?*anyopaque, _: ?*struct_wp_image_description_v1, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]Wayland_ColorInfoState = @ptrCast(@alignCast(data));
    _ = &state;
    if (state.*.deferred_event_processing) {
        var vid: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
        _ = &vid;
        state.*.queue = Wayland_DisplayCreateQueue(vid.*.display, "SDL Color Management Queue");
        var image_desc_wrapper: ?*struct_wl_proxy = @ptrCast(@alignCast(WAYLAND_wl_proxy_create_wrapper.?(@ptrCast(@alignCast(state.*.wp_image_description)))));
        _ = &image_desc_wrapper;
        WAYLAND_wl_proxy_set_queue.?(image_desc_wrapper, state.*.queue);
        state.*.wp_image_description_info = wp_image_description_v1_get_information(@ptrCast(@alignCast(image_desc_wrapper)));
        WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(image_desc_wrapper)));
    } else {
        state.*.wp_image_description_info = wp_image_description_v1_get_information(state.*.wp_image_description);
    }
    _ = wp_image_description_info_v1_add_listener(state.*.wp_image_description_info, &image_description_info_listener, data);
    if (state.*.deferred_event_processing) {
        PumpColorspaceEvents(state);
    }
}
pub fn image_description_handle_ready(data: ?*anyopaque, wp_image_description_v1_1: ?*struct_wp_image_description_v1, identity: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    image_description_handle_ready2(data, wp_image_description_v1_1, 0, identity);
}
pub const image_description_listener: struct_wp_image_description_v1_listener = struct_wp_image_description_v1_listener{
    .failed = image_description_handle_failed,
    .ready = image_description_handle_ready,
    .ready2 = image_description_handle_ready2,
};
pub const WP_COLOR_MANAGEMENT_OUTPUT_V1_GET_IMAGE_DESCRIPTION = @as(c_int, 1);
pub const WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_GET_PREFERRED = @as(c_int, 1);
pub const WP_IMAGE_DESCRIPTION_V1_DESTROY = @as(c_int, 0);
pub const WP_IMAGE_DESCRIPTION_V1_GET_INFORMATION = @as(c_int, 1);
pub const xkb_context = struct_xkb_context;
pub const wp_image_description_v1 = struct_wp_image_description_v1;
pub const wp_image_description_info_v1 = struct_wp_image_description_info_v1;
pub const xdg_toplevel = struct_xdg_toplevel;
