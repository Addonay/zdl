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
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_ceil_REAL(x: f64) f64;
pub extern fn SDL_floor_REAL(x: f64) f64;
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
pub inline fn SDL_RectEmpty(r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @"true" else @"false") != 0;
}
pub inline fn SDL_RectsEqual(a: [*c]const SDL_Rect, b: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((((((a != null) and (b != null)) and (a.*.x == b.*.x)) and (a.*.y == b.*.y)) and (a.*.w == b.*.w)) and (a.*.h == b.*.h)) @"true" else @"false") != 0;
}
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
const struct_unnamed_12 = extern struct {
    xdg: ?*struct_xdg_wm_base_13 = null,
    libdecor: ?*struct_libdecor_14 = null,
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
pub const struct_zwp_text_input_manager_v3_26 = opaque {
};
pub const struct_zxdg_output_manager_v1_27 = opaque {};
pub const struct_wp_viewporter_28 = opaque {};
pub const struct_wp_fractional_scale_manager_v1_29 = opaque {};
pub const struct_zwp_input_timestamps_manager_v1_30 = opaque {};
pub const struct_zxdg_exporter_v2_31 = opaque {};
pub const struct_xdg_wm_dialog_v1_32 = opaque {};
pub const struct_wp_alpha_modifier_v1_33 = opaque {};
pub const struct_xdg_toplevel_icon_manager_v1_34 = opaque {};
pub const struct_frog_color_management_factory_v1_35 = opaque {};
pub const struct_wp_color_manager_v1_36 = opaque {};
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
pub const struct_wl_seat = opaque {
};
pub const struct_wl_data_device = opaque {
};
pub const struct_wl_surface = opaque {
};
pub const struct_SDL_WaylandDataDevice = extern struct {
    data_device: ?*struct_wl_data_device = null,
    seat: [*c]struct_SDL_WaylandSeat = null,
    id_str: [*c]u8 = null,
    drag_serial: u32 = 0,
    drag_offer: [*c]SDL_WaylandDataOffer = null,
    selection_offer: [*c]SDL_WaylandDataOffer = null,
    mime_type: [*c]const u8 = null,
    has_mime_file: bool = false,
    has_mime_text: bool = false,
    dnd_window: [*c]SDL_Window = null,
    dnd_surface: ?*struct_wl_surface = null,
    selection_source: [*c]SDL_WaylandDataSource = null,
};
pub const SDL_WaylandDataDevice = struct_SDL_WaylandDataDevice;
pub const struct_zwp_primary_selection_device_v1_44 = opaque {};
pub const struct_SDL_WaylandPrimarySelectionDevice = extern struct {
    primary_selection_device: ?*struct_zwp_primary_selection_device_v1_44 = null,
    seat: [*c]struct_SDL_WaylandSeat = null,
    selection_source: [*c]SDL_WaylandPrimarySelectionSource = null,
    selection_offer: [*c]SDL_WaylandPrimarySelectionOffer = null,
};
pub const SDL_WaylandPrimarySelectionDevice = struct_SDL_WaylandPrimarySelectionDevice;
pub const struct_wl_keyboard = opaque {
};
pub const struct_zwp_input_timestamps_v1_46 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibitor_v1_47 = opaque {};
pub const struct_SDL_Keymap = opaque {
};
pub const SDL_Keymap = struct_SDL_Keymap;
pub const struct_wl_array = extern struct {
    size: usize = 0,
    alloc: usize = 0,
    data: ?*anyopaque = null,
};
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const struct_xkb_keymap = opaque {
};
pub const struct_xkb_state = opaque {
};
pub const struct_xkb_compose_table = opaque {
};
pub const struct_xkb_compose_state = opaque {
};
pub const xkb_layout_index_t = u32;
pub const xkb_mod_mask_t = u32;
const struct_unnamed_48 = extern struct {
    keymap: ?*struct_xkb_keymap = null,
    state: ?*struct_xkb_state = null,
    compose_table: ?*struct_xkb_compose_table = null,
    compose_state: ?*struct_xkb_compose_state = null,
    num_layouts: xkb_layout_index_t = 0,
    current_layout: xkb_layout_index_t = 0,
    shift_mask: xkb_mod_mask_t = 0,
    ctrl_mask: xkb_mod_mask_t = 0,
    alt_mask: xkb_mod_mask_t = 0,
    gui_mask: xkb_mod_mask_t = 0,
    level3_mask: xkb_mod_mask_t = 0,
    level5_mask: xkb_mod_mask_t = 0,
    num_mask: xkb_mod_mask_t = 0,
    caps_mask: xkb_mod_mask_t = 0,
    wl_pressed_modifiers: xkb_mod_mask_t = 0,
    wl_latched_modifiers: xkb_mod_mask_t = 0,
    wl_locked_modifiers: xkb_mod_mask_t = 0,
};
const struct_unnamed_45 = extern struct {
    wl_keyboard: ?*struct_wl_keyboard = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_46 = null,
    key_inhibitor: ?*struct_zwp_keyboard_shortcuts_inhibitor_v1_47 = null,
    focus: [*c]SDL_WindowData = null,
    sdl_keymap: [*c]?*SDL_Keymap = null,
    reserved_scancodes: struct_wl_array = @import("std").mem.zeroes(struct_wl_array),
    current_locale: [*c]u8 = null,
    repeat: SDL_WaylandKeyboardRepeat = @import("std").mem.zeroes(SDL_WaylandKeyboardRepeat),
    highres_timestamp_ns: Uint64 = 0,
    pressed_modifiers: SDL_Keymod = 0,
    locked_modifiers: SDL_Keymod = 0,
    sdl_id: SDL_KeyboardID = 0,
    is_virtual: bool = false,
    xkb: struct_unnamed_48 = @import("std").mem.zeroes(struct_unnamed_48),
};
pub const struct_wl_pointer = opaque {
};
pub const struct_zwp_relative_pointer_v1_50 = opaque {};
pub const struct_zwp_locked_pointer_v1_51 = opaque {};
pub const struct_zwp_confined_pointer_v1_52 = opaque {};
pub const struct_zwp_pointer_gesture_pinch_v1_53 = opaque {};
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseID = Uint32;
pub const wl_fixed_t = i32;
const struct_unnamed_55 = extern struct {
    sx: wl_fixed_t = 0,
    sy: wl_fixed_t = 0,
};
const struct_unnamed_56 = extern struct {
    dx: wl_fixed_t = 0,
    dy: wl_fixed_t = 0,
    dx_unaccel: wl_fixed_t = 0,
    dy_unaccel: wl_fixed_t = 0,
};
pub const enum_SDL_WaylandAxisEvent = c_uint;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
const struct_unnamed_57 = extern struct {
    x_axis_type: enum_SDL_WaylandAxisEvent = @import("std").mem.zeroes(enum_SDL_WaylandAxisEvent),
    x: f32 = 0,
    y_axis_type: enum_SDL_WaylandAxisEvent = @import("std").mem.zeroes(enum_SDL_WaylandAxisEvent),
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
};
const struct_unnamed_54 = extern struct {
    have_absolute: bool = false,
    have_relative: bool = false,
    have_warp: bool = false,
    have_axis: bool = false,
    buttons_pressed: Uint32 = 0,
    buttons_released: Uint32 = 0,
    absolute: struct_unnamed_55 = @import("std").mem.zeroes(struct_unnamed_55),
    relative: struct_unnamed_56 = @import("std").mem.zeroes(struct_unnamed_56),
    axis: struct_unnamed_57 = @import("std").mem.zeroes(struct_unnamed_57),
    enter_surface: ?*struct_wl_surface = null,
    leave_surface: ?*struct_wl_surface = null,
    timestamp_ns: Uint64 = 0,
};
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_wp_cursor_shape_device_v1_58 = opaque {};
pub const struct_wp_viewport_59 = opaque {};
pub const struct_wl_callback = opaque {
};
pub const struct_SDL_WaylandCursorState = extern struct {
    current_cursor: ?*SDL_CursorData = null,
    cursor_shape: ?*struct_wp_cursor_shape_device_v1_58 = null,
    surface: ?*struct_wl_surface = null,
    viewport: ?*struct_wp_viewport_59 = null,
    scale: f64 = 0,
    system_cursor_handle: ?*anyopaque = null,
    frame_callback: ?*struct_wl_callback = null,
    last_frame_callback_time_ms: Uint64 = 0,
    current_frame_time_ms: Uint32 = 0,
    current_frame: c_int = 0,
    hit_test_result: SDL_HitTestResult = @import("std").mem.zeroes(SDL_HitTestResult),
};
pub const SDL_WaylandCursorState = struct_SDL_WaylandCursorState;
const struct_unnamed_49 = extern struct {
    wl_pointer: ?*struct_wl_pointer = null,
    relative_pointer: ?*struct_zwp_relative_pointer_v1_50 = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_46 = null,
    locked_pointer: ?*struct_zwp_locked_pointer_v1_51 = null,
    confined_pointer: ?*struct_zwp_confined_pointer_v1_52 = null,
    gesture_pinch: ?*struct_zwp_pointer_gesture_pinch_v1_53 = null,
    focus: [*c]SDL_WindowData = null,
    focus_surface: ?*struct_wl_surface = null,
    gesture_focus: [*c]SDL_WindowData = null,
    highres_timestamp_ns: Uint64 = 0,
    enter_serial: Uint32 = 0,
    buttons_pressed: SDL_MouseButtonFlags = 0,
    last_motion: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    is_confined: bool = false,
    sdl_id: SDL_MouseID = 0,
    pending_frame: struct_unnamed_54 = @import("std").mem.zeroes(struct_unnamed_54),
    cursor_state: SDL_WaylandCursorState = @import("std").mem.zeroes(SDL_WaylandCursorState),
};
pub const struct_wl_touch = opaque {
};
const struct_unnamed_60 = extern struct {
    wl_touch: ?*struct_wl_touch = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_46 = null,
    highres_timestamp_ns: Uint64 = 0,
    points: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const struct_zwp_text_input_v3_62 = opaque {
};
const struct_unnamed_61 = extern struct {
    zwp_text_input: ?*struct_zwp_text_input_v3_62 = null,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    enabled: bool = false,
    has_preedit: bool = false,
};
pub const struct_zwp_tablet_seat_v2_64 = opaque {};
const struct_unnamed_63 = extern struct {
    wl_tablet_seat: ?*struct_zwp_tablet_seat_v2_64 = null,
    tool_list: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const struct_SDL_WaylandSeat = extern struct {
    display: [*c]SDL_VideoData = null,
    wl_seat: ?*struct_wl_seat = null,
    data_device: [*c]SDL_WaylandDataDevice = null,
    primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = null,
    name: [*c]u8 = null,
    link: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
    last_implicit_grab_serial: Uint32 = 0,
    registry_id: Uint32 = 0,
    keyboard: struct_unnamed_45 = @import("std").mem.zeroes(struct_unnamed_45),
    pointer: struct_unnamed_49 = @import("std").mem.zeroes(struct_unnamed_49),
    touch: struct_unnamed_60 = @import("std").mem.zeroes(struct_unnamed_60),
    text_input: struct_unnamed_61 = @import("std").mem.zeroes(struct_unnamed_61),
    tablet: struct_unnamed_63 = @import("std").mem.zeroes(struct_unnamed_63),
};
pub const struct_Wayland_EventThreadContext = opaque {
};
pub const Wayland_EventThreadContext = struct_Wayland_EventThreadContext;
pub const struct_wl_output_65 = opaque {
};
pub const struct_zxdg_output_v1_66 = opaque {};
pub const struct_wp_color_management_output_v1_67 = opaque {};
pub const struct_Wayland_ColorInfoState_68 = opaque {};
const struct_unnamed_69 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_70 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_71 = extern struct {
    width_mm: c_int = 0,
    height_mm: c_int = 0,
};
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
const struct_unnamed_72 = extern struct {
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
const struct_unnamed_73 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_74 = opaque {};
pub const struct_SDL_EGL_VideoData_75 = opaque {};
pub const struct_SDL_PrivateGLESData_76 = opaque {};
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
    gl_config: struct_unnamed_72 = @import("std").mem.zeroes(struct_unnamed_72),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_74 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_75 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_76 = null,
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
    output: ?*struct_wl_output_65 = null,
    xdg_output: ?*struct_zxdg_output_v1_66 = null,
    wp_color_management_output: ?*struct_wp_color_management_output_v1_67 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_68 = null,
    wl_output_name: [*c]u8 = null,
    scale_factor: f64 = 0,
    integer_scale_factor: c_int = 0,
    registry_id: Uint32 = 0,
    logical: struct_unnamed_69 = @import("std").mem.zeroes(struct_unnamed_69),
    pixel: struct_unnamed_70 = @import("std").mem.zeroes(struct_unnamed_70),
    physical: struct_unnamed_71 = @import("std").mem.zeroes(struct_unnamed_71),
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
    last_implicit_grab_seat: [*c]struct_SDL_WaylandSeat = null,
    current_data_offer_seat: [*c]struct_SDL_WaylandSeat = null,
    current_primary_selection_seat: [*c]struct_SDL_WaylandSeat = null,
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
pub const struct_wl_event_queue = opaque {
};
pub const struct_libdecor_frame = opaque {
};
const struct_unnamed_78 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {};
pub const struct_xdg_toplevel = opaque {};
const struct_unnamed_81 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_83 = opaque {};
pub const struct_xdg_positioner_84 = opaque {};
const struct_unnamed_82 = extern struct {
    xdg_popup: ?*struct_xdg_popup_83 = null,
    xdg_positioner: ?*struct_xdg_positioner_84 = null,
};
const union_unnamed_80 = extern union {
    toplevel: struct_unnamed_81,
    popup: struct_unnamed_82,
};
const struct_unnamed_79 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_80 = @import("std").mem.zeroes(union_unnamed_80),
    serial: Uint32 = 0,
};
const union_unnamed_77 = extern union {
    libdecor: struct_unnamed_78,
    xdg: struct_unnamed_79,
};
const enum_unnamed_85 = c_uint;
const enum_unnamed_86 = c_uint;
const enum_unnamed_87 = c_uint;
const enum_unnamed_88 = c_uint;
const enum_unnamed_89 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const EGLSurface = ?*anyopaque;
pub const struct_zxdg_toplevel_decoration_v1_90 = opaque {};
pub const struct_zwp_idle_inhibitor_v1_91 = opaque {};
pub const struct_xdg_activation_token_v1_92 = opaque {};
pub const struct_wp_fractional_scale_v1_93 = opaque {};
pub const struct_zxdg_exported_v2_94 = opaque {};
pub const struct_xdg_dialog_v1_95 = opaque {};
pub const struct_wp_alpha_modifier_surface_v1_96 = opaque {};
pub const struct_xdg_toplevel_icon_v1_97 = opaque {};
pub const struct_frog_color_managed_surface_98 = opaque {};
pub const struct_wp_color_management_surface_feedback_v1_99 = opaque {};
pub const struct_xdg_toplevel_session_v1_100 = opaque {};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_101 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_102 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_103 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_104 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_105 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_106 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_107 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_59 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_108 = extern struct {
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
    shell_surface: union_unnamed_77 = @import("std").mem.zeroes(union_unnamed_77),
    shell_surface_type: enum_unnamed_85 = @import("std").mem.zeroes(enum_unnamed_85),
    shell_surface_status: enum_unnamed_86 = @import("std").mem.zeroes(enum_unnamed_86),
    wm_caps: enum_unnamed_87 = @import("std").mem.zeroes(enum_unnamed_87),
    toplevel_constraints: enum_unnamed_88 = @import("std").mem.zeroes(enum_unnamed_88),
    resize_edge: enum_unnamed_89 = @import("std").mem.zeroes(enum_unnamed_89),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_90 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_91 = null,
    activation_token: ?*struct_xdg_activation_token_v1_92 = null,
    viewport: ?*struct_wp_viewport_59 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_93 = null,
    exported: ?*struct_zxdg_exported_v2_94 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_95 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_96 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_97 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_98 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_99 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_100 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_68 = null,
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
    pointer_scale: struct_unnamed_101 = @import("std").mem.zeroes(struct_unnamed_101),
    requested: struct_unnamed_102 = @import("std").mem.zeroes(struct_unnamed_102),
    current: struct_unnamed_103 = @import("std").mem.zeroes(struct_unnamed_103),
    last_configure: struct_unnamed_104 = @import("std").mem.zeroes(struct_unnamed_104),
    system_limits: struct_unnamed_105 = @import("std").mem.zeroes(struct_unnamed_105),
    toplevel_bounds: struct_unnamed_106 = @import("std").mem.zeroes(struct_unnamed_106),
    mask: struct_unnamed_107 = @import("std").mem.zeroes(struct_unnamed_107),
    text_input_props: struct_unnamed_108 = @import("std").mem.zeroes(struct_unnamed_108),
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
pub const SDL_SCANCODE_APPLICATION: c_int = 101;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub extern fn SDL_SetScancodeName_REAL(scancode: SDL_Scancode, name: [*c]const u8) bool;
pub const SDL_TEXTINPUT_TYPE_TEXT: c_int = 0;
pub const SDL_TEXTINPUT_TYPE_TEXT_NAME: c_int = 1;
pub const SDL_TEXTINPUT_TYPE_TEXT_EMAIL: c_int = 2;
pub const SDL_TEXTINPUT_TYPE_TEXT_USERNAME: c_int = 3;
pub const SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN: c_int = 4;
pub const SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE: c_int = 5;
pub const SDL_TEXTINPUT_TYPE_NUMBER: c_int = 6;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN: c_int = 7;
pub const SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE: c_int = 8;
pub const enum_SDL_TextInputType = c_uint;
pub const SDL_TextInputType = enum_SDL_TextInputType;
pub const SDL_CAPITALIZE_NONE: c_int = 0;
pub const SDL_CAPITALIZE_SENTENCES: c_int = 1;
pub const SDL_CAPITALIZE_WORDS: c_int = 2;
pub const SDL_CAPITALIZE_LETTERS: c_int = 3;
pub const enum_SDL_Capitalization = c_uint;
pub const SDL_Capitalization = enum_SDL_Capitalization;
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
pub extern fn SDL_GetTextInputType(props: SDL_PropertiesID) SDL_TextInputType;
pub extern fn SDL_GetTextInputCapitalization(props: SDL_PropertiesID) SDL_Capitalization;
pub extern fn SDL_GetTextInputAutocorrect(props: SDL_PropertiesID) bool;
pub extern fn SDL_GetTextInputMultiline(props: SDL_PropertiesID) bool;
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
pub extern fn SDL_IME_Init() bool;
pub extern fn SDL_IME_Quit() void;
pub extern fn SDL_IME_Reset() void;
pub extern fn SDL_IME_UpdateTextInputArea(window: [*c]SDL_Window) void;
pub const struct_wl_cursor_theme_115 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_115 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_reset = ?*const fn (?*struct_xkb_compose_state) callconv(.c) void;
pub extern var WAYLAND_xkb_compose_state_reset: SDL_DYNWAYLANDFN_xkb_compose_state_reset;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub const struct_SDL_WaylandUserdata = extern struct {
    data: ?*anyopaque = null,
    sequence: Uint32 = 0,
};
pub const SDL_WaylandUserdata = struct_SDL_WaylandUserdata;
pub const SDL_WaylandDataSource = extern struct {
    source: ?*struct_wl_data_source = null,
    data_device: [*c]SDL_WaylandDataDevice = null,
    data_callback: SDL_ClipboardDataCallback = null,
    cleanup_callback: SDL_ClipboardCleanupCallback = null,
    userdata: SDL_WaylandUserdata = @import("std").mem.zeroes(SDL_WaylandUserdata),
};
pub const struct_zwp_primary_selection_source_v1_116 = opaque {};
pub const SDL_WaylandPrimarySelectionSource = extern struct {
    source: ?*struct_zwp_primary_selection_source_v1_116 = null,
    primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = null,
    data_callback: SDL_ClipboardDataCallback = null,
    cleanup_callback: SDL_ClipboardCleanupCallback = null,
    userdata: SDL_WaylandUserdata = @import("std").mem.zeroes(SDL_WaylandUserdata),
};
pub const SDL_WaylandDataOffer = extern struct {
    offer: ?*struct_wl_data_offer = null,
    mimes: struct_wl_array = @import("std").mem.zeroes(struct_wl_array),
    data_device: [*c]SDL_WaylandDataDevice = null,
    callback: ?*struct_wl_callback = null,
    read_fd: c_int = 0,
};
pub const struct_zwp_primary_selection_offer_v1_117 = opaque {};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_117 = null,
    mimes: struct_wl_array = @import("std").mem.zeroes(struct_wl_array),
    primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = null,
};
pub const SDL_WaylandKeyboardRepeat = extern struct {
    repeat_rate: Sint32 = 0,
    repeat_delay_ms: Sint32 = 0,
    key: Uint32 = 0,
    scancode: Uint32 = 0,
    keyboard_id: Uint32 = 0,
    wl_press_time_ms: Uint32 = 0,
    base_time_ns: Uint64 = 0,
    sdl_press_time_ns: Uint64 = 0,
    next_repeat_ns: Uint64 = 0,
    text: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const SDL_WaylandSeat = struct_SDL_WaylandSeat;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_NONE: c_int = 0;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_COMPLETION: c_int = 1;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_SPELLCHECK: c_int = 2;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_AUTO_CAPITALIZATION: c_int = 4;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_UPPERCASE: c_int = 16;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_TITLECASE: c_int = 32;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_HIDDEN_TEXT: c_int = 64;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA: c_int = 128;
pub const ZWP_TEXT_INPUT_V3_CONTENT_HINT_MULTILINE: c_int = 512;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NORMAL: c_int = 0;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NUMBER: c_int = 3;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_EMAIL: c_int = 6;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NAME: c_int = 7;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PASSWORD: c_int = 8;
pub const ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PIN: c_int = 9;
pub fn zwp_text_input_v3_enable(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_ENABLE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), 0);
}
pub fn zwp_text_input_v3_disable(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_DISABLE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), 0);
}
pub fn zwp_text_input_v3_set_content_type(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, hint: u32, purpose: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_SET_CONTENT_TYPE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), 0, hint, purpose);
}
pub fn zwp_text_input_v3_set_cursor_rectangle(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_SET_CURSOR_RECTANGLE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), 0, x, y, width, height);
}
pub fn zwp_text_input_v3_commit(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_COMMIT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), 0);
}
pub export fn Wayland_InitKeyboard(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_VideoData = _this.*.internal;
    _ = &internal;
    if (!(internal.*.text_input_manager != null)) {
        _ = SDL_IME_Init();
    }
    _ = SDL_SetScancodeName_REAL(SDL_SCANCODE_APPLICATION, "Menu");
    return @"true" != 0;
}
pub export fn Wayland_QuitKeyboard(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_VideoData = _this.*.internal;
    _ = &internal;
    if (!(internal.*.text_input_manager != null)) {
        SDL_IME_Quit();
    }
}
pub export fn Wayland_SeatUpdateTextInput(seat: [*c]SDL_WaylandSeat) void {
    @setEvalBranchQuota(100000);
    if (seat.*.text_input.zwp_text_input != null) {
        var focus: [*c]SDL_WindowData = seat.*.keyboard.focus;
        _ = &focus;
        if ((focus != null) and focus.*.text_input_props.active) {
            var window: [*c]SDL_Window = focus.*.sdlwindow;
            _ = &window;
            if (!seat.*.text_input.enabled) {
                seat.*.text_input.enabled = @"true" != 0;
                zwp_text_input_v3_enable(seat.*.text_input.zwp_text_input);
                zwp_text_input_v3_set_content_type(seat.*.text_input.zwp_text_input, @bitCast(@as(c_int, focus.*.text_input_props.hint)), @bitCast(@as(c_int, focus.*.text_input_props.purpose)));
                if (!SDL_RectEmpty(&window.*.text_input_rect)) {
                    const scaled_rect: SDL_Rect = SDL_Rect{
                        .x = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.x)) / focus.*.pointer_scale.x)),
                        .y = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.y)) / focus.*.pointer_scale.y)),
                        .w = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.w)) / focus.*.pointer_scale.x)),
                        .h = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.h)) / focus.*.pointer_scale.y)),
                    };
                    _ = &scaled_rect;
                    const scaled_cursor: c_int = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_cursor)) / focus.*.pointer_scale.x));
                    _ = &scaled_cursor;
                    {
                        comptime {
                            if (!(@sizeOf(@TypeOf((&seat.*.text_input.text_input_rect).*)) == @sizeOf(@TypeOf((&scaled_rect).*)))) @compileError("static assertion failed \"sizeof (*(&seat->text_input.text_input_rect)) == sizeof (*( &scaled_rect))\"");
                        }
                    }
                    _ = memcpy(@ptrCast(@alignCast(&seat.*.text_input.text_input_rect)), @ptrCast(@alignCast(&scaled_rect)), @sizeOf(@TypeOf((&scaled_rect).*)));
                    seat.*.text_input.text_input_cursor = scaled_cursor;
                    zwp_text_input_v3_set_cursor_rectangle(seat.*.text_input.zwp_text_input, if ((scaled_rect.x + scaled_cursor) < (scaled_rect.x + scaled_rect.w)) scaled_rect.x + scaled_cursor else scaled_rect.x + scaled_rect.w, scaled_rect.y, 1, scaled_rect.h);
                }
                zwp_text_input_v3_commit(seat.*.text_input.zwp_text_input);
                if (seat.*.keyboard.xkb.compose_state != null) {
                    WAYLAND_xkb_compose_state_reset.?(seat.*.keyboard.xkb.compose_state);
                }
            }
        } else {
            if (seat.*.text_input.enabled) {
                seat.*.text_input.enabled = @"false" != 0;
                _ = memset(@ptrCast(@alignCast(&seat.*.text_input.text_input_rect)), 0, @sizeOf(@TypeOf(seat.*.text_input.text_input_rect)));
                seat.*.text_input.text_input_cursor = 0;
                zwp_text_input_v3_disable(seat.*.text_input.zwp_text_input);
                zwp_text_input_v3_commit(seat.*.text_input.zwp_text_input);
            }
            if (seat.*.keyboard.xkb.compose_state != null) {
                WAYLAND_xkb_compose_state_reset.?(seat.*.keyboard.xkb.compose_state);
            }
        }
    }
}
pub export fn Wayland_StartTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoData = undefined;
    _ = &display;
    var wind: [*c]SDL_WindowData = undefined;
    _ = &wind;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                display = _this.*.internal;
                if (display.*.text_input_manager != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                wind = window.*.internal;
                wind.*.text_input_props.hint = ZWP_TEXT_INPUT_V3_CONTENT_HINT_NONE;
                switch (SDL_GetTextInputType(props)) {
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_NAME) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_EMAIL) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_USERNAME) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_TextInputType, SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                return @"true" != 0;
            },
            4 => {
                switch (SDL_GetTextInputCapitalization(props)) {
                    @as(SDL_Capitalization, SDL_CAPITALIZE_NONE) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_Capitalization, SDL_CAPITALIZE_LETTERS) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_Capitalization, SDL_CAPITALIZE_WORDS) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_Capitalization, SDL_CAPITALIZE_SENTENCES) => {
                        sdl_pc = 20;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NORMAL;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NAME;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_EMAIL;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NORMAL;
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PASSWORD;
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_HIDDEN_TEXT | ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PASSWORD;
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_NUMBER;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PIN;
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_HIDDEN_TEXT | ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                wind.*.text_input_props.purpose = ZWP_TEXT_INPUT_V3_CONTENT_PURPOSE_PIN;
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_SENSITIVE_DATA;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            15 => {
                if (SDL_GetTextInputAutocorrect(props)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
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
                    sdl_pc = 15;
                    continue;
                }
            },
            18 => {
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_UPPERCASE;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_TITLECASE;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            20 => {
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_AUTO_CAPITALIZATION;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            21 => {
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_COMPLETION | ZWP_TEXT_INPUT_V3_CONTENT_HINT_SPELLCHECK;
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
                if (SDL_GetTextInputMultiline(props)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                wind.*.text_input_props.hint |= ZWP_TEXT_INPUT_V3_CONTENT_HINT_MULTILINE;
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
                wind.*.text_input_props.active = @"true" != 0;
                seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if ((&seat.*.link) != (&display.*.seat_list)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            28 => {
                if (seat.*.keyboard.focus == wind) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            31 => {
                Wayland_SeatUpdateTextInput(seat);
                {
                    sdl_pc = 33;
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
            else => unreachable,
        }
    }
}
pub export fn Wayland_StopTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoData = _this.*.internal;
    _ = &display;
    if (display.*.text_input_manager != null) {
        var seat: [*c]SDL_WaylandSeat = undefined;
        _ = &seat;
        var wind: [*c]SDL_WindowData = window.*.internal;
        _ = &wind;
        wind.*.text_input_props.active = @"false" != 0;
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                if (seat.*.keyboard.focus == wind) {
                    Wayland_SeatUpdateTextInput(seat);
                }
            }
        }
    } else {
        SDL_IME_Reset();
    }
    return @"true" != 0;
}
pub export fn Wayland_UpdateTextInputArea(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_VideoData = _this.*.internal;
    _ = &internal;
    if (internal.*.text_input_manager != null) {
        var seat: [*c]SDL_WaylandSeat = undefined;
        _ = &seat;
        var wind: [*c]SDL_WindowData = window.*.internal;
        _ = &wind;
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&internal.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&internal.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                if ((seat.*.text_input.zwp_text_input != null) and (seat.*.keyboard.focus == wind)) {
                    const scaled_rect: SDL_Rect = SDL_Rect{
                        .x = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.x)) / wind.*.pointer_scale.x)),
                        .y = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.y)) / wind.*.pointer_scale.y)),
                        .w = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.w)) / wind.*.pointer_scale.x)),
                        .h = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.text_input_rect.h)) / wind.*.pointer_scale.y)),
                    };
                    _ = &scaled_rect;
                    const scaled_cursor: c_int = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.text_input_cursor)) / wind.*.pointer_scale.x));
                    _ = &scaled_cursor;
                    if (!SDL_RectsEqual(&scaled_rect, &seat.*.text_input.text_input_rect) or (scaled_cursor != seat.*.text_input.text_input_cursor)) {
                        {
                            comptime {
                                if (!(@sizeOf(@TypeOf((&seat.*.text_input.text_input_rect).*)) == @sizeOf(@TypeOf((&scaled_rect).*)))) @compileError("static assertion failed \"sizeof (*(&seat->text_input.text_input_rect)) == sizeof (*( &scaled_rect))\"");
                            }
                        }
                        _ = memcpy(@ptrCast(@alignCast(&seat.*.text_input.text_input_rect)), @ptrCast(@alignCast(&scaled_rect)), @sizeOf(@TypeOf((&scaled_rect).*)));
                        seat.*.text_input.text_input_cursor = scaled_cursor;
                        zwp_text_input_v3_set_cursor_rectangle(seat.*.text_input.zwp_text_input, if ((scaled_rect.x + scaled_cursor) < (scaled_rect.x + scaled_rect.w)) scaled_rect.x + scaled_cursor else scaled_rect.x + scaled_rect.w, scaled_rect.y, 1, scaled_rect.h);
                        zwp_text_input_v3_commit(seat.*.text_input.zwp_text_input);
                    }
                }
            }
        }
    } else {
        SDL_IME_UpdateTextInputArea(window);
    }
    return @"true" != 0;
}
pub export fn Wayland_HasScreenKeyboardSupport(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_VideoData = _this.*.internal;
    _ = &internal;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var hastextmanager: bool = @as(?*anyopaque, @ptrCast(@alignCast(internal.*.text_input_manager))) != @as(?*anyopaque, null);
    _ = &hastextmanager;
    var haskeyboard: bool = @"false" != 0;
    _ = &haskeyboard;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&internal.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&internal.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.keyboard.wl_keyboard != null) {
                haskeyboard = @"true" != 0;
                break;
            }
        }
    }
    return !haskeyboard and hastextmanager;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const ZWP_TEXT_INPUT_V3_ENABLE = @as(c_int, 1);
pub const ZWP_TEXT_INPUT_V3_DISABLE = @as(c_int, 2);
pub const ZWP_TEXT_INPUT_V3_SET_CONTENT_TYPE = @as(c_int, 5);
pub const ZWP_TEXT_INPUT_V3_SET_CURSOR_RECTANGLE = @as(c_int, 6);
pub const ZWP_TEXT_INPUT_V3_COMMIT = @as(c_int, 7);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_touch = struct_wl_touch;
pub const xdg_toplevel = struct_xdg_toplevel;
