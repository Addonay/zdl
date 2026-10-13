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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __uint32_t = c_uint;
pub const __uid_t = c_uint;
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const __clock_t = c_long;
pub const __time_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
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
pub const struct_zwp_primary_selection_device_manager_v1_21 = opaque {
};
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
pub const struct_zwp_primary_selection_device_v1_44 = opaque {
};
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
pub const struct_zwp_text_input_v3_62 = opaque {};
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
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogTrace_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn pipe2(__pipedes: [*c]c_int, __flags: c_int) c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_119 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
};
const struct_unnamed_120 = extern struct {
    si_tid: c_int = 0,
    si_overrun: c_int = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_121 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_122 = extern struct {
    si_pid: __pid_t = 0,
    si_uid: __uid_t = 0,
    si_status: c_int = 0,
    si_utime: __clock_t = 0,
    si_stime: __clock_t = 0,
};
const struct_unnamed_125 = extern struct {
    _lower: ?*anyopaque = null,
    _upper: ?*anyopaque = null,
};
const union_unnamed_124 = extern union {
    _addr_bnd: struct_unnamed_125,
    _pkey: __uint32_t,
};
const struct_unnamed_123 = extern struct {
    si_addr: ?*anyopaque = null,
    si_addr_lsb: c_short = 0,
    _bounds: union_unnamed_124 = @import("std").mem.zeroes(union_unnamed_124),
};
const struct_unnamed_126 = extern struct {
    si_band: c_long = 0,
    si_fd: c_int = 0,
};
const struct_unnamed_127 = extern struct {
    _call_addr: ?*anyopaque = null,
    _syscall: c_int = 0,
    _arch: c_uint = 0,
};
const union_unnamed_118 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_119,
    _timer: struct_unnamed_120,
    _rt: struct_unnamed_121,
    _sigchld: struct_unnamed_122,
    _sigfault: struct_unnamed_123,
    _sigpoll: struct_unnamed_126,
    _sigsys: struct_unnamed_127,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = 0,
    si_errno: c_int = 0,
    si_code: c_int = 0,
    __pad0: c_int = 0,
    _sifields: union_unnamed_118 = @import("std").mem.zeroes(union_unnamed_118),
};
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigtimedwait(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t, noalias __timeout: [*c]const struct_timespec) c_int;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn SDL_IOReady(fd: c_int, flags: c_int, timeoutNS: Sint64) c_int;
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
pub extern fn SDL_SendClipboardUpdate(owner: bool, mime_types: [*c][*c]u8, num_mime_types: usize) void;
pub extern fn SDL_AllocateTemporaryMemory(size: usize) ?*anyopaque;
pub extern fn SDL_CancelClipboardData(sequence: Uint32) void;
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
pub const struct_wl_cursor_theme_144 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_144 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub extern var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_user_data = ?*const fn (?*struct_wl_proxy, ?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_set_user_data: SDL_DYNWAYLANDFN_wl_proxy_set_user_data;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_display_flush = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_flush: SDL_DYNWAYLANDFN_wl_display_flush;
pub const SDL_DYNWAYLANDFN_wl_array_release = ?*const fn ([*c]struct_wl_array) callconv(.c) void;
pub extern var WAYLAND_wl_array_release: SDL_DYNWAYLANDFN_wl_array_release;
pub const SDL_DYNWAYLANDFN_wl_array_add = ?*const fn ([*c]struct_wl_array, usize) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_array_add: SDL_DYNWAYLANDFN_wl_array_add;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub extern const wl_callback_interface: struct_wl_interface;
pub extern const wl_data_source_interface: struct_wl_interface;
pub fn wl_display_sync(wl_display: ?*struct_wl_display_8) callconv(.c) ?*struct_wl_callback {
    @setEvalBranchQuota(100000);
    var callback: ?*struct_wl_proxy = undefined;
    _ = &callback;
    callback = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_display)), WL_DISPLAY_SYNC, &wl_callback_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_display))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(callback));
}
pub const struct_wl_callback_listener = extern struct {
    done: ?*const fn (data: ?*anyopaque, wl_callback: ?*struct_wl_callback, callback_data: u32) callconv(.c) void = null,
};
pub fn wl_callback_add_listener(wl_callback_1: ?*struct_wl_callback, listener: [*c]const struct_wl_callback_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_callback_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_callback_destroy(wl_callback_1: ?*struct_wl_callback) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_callback_1)));
}
pub fn wl_data_offer_receive(wl_data_offer_1: ?*struct_wl_data_offer, mime_type: [*c]const u8, fd: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_offer_1)), WL_DATA_OFFER_RECEIVE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1))), 0, mime_type, fd);
}
pub fn wl_data_offer_destroy(wl_data_offer_1: ?*struct_wl_data_offer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_offer_1)), WL_DATA_OFFER_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_wl_data_source_listener = extern struct {
    target: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source, mime_type: [*c]const u8) callconv(.c) void = null,
    send: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source, mime_type: [*c]const u8, fd: i32) callconv(.c) void = null,
    cancelled: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source) callconv(.c) void = null,
    dnd_drop_performed: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source) callconv(.c) void = null,
    dnd_finished: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source) callconv(.c) void = null,
    action: ?*const fn (data: ?*anyopaque, wl_data_source: ?*struct_wl_data_source, dnd_action: u32) callconv(.c) void = null,
};
pub fn wl_data_source_add_listener(wl_data_source_1: ?*struct_wl_data_source, listener: [*c]const struct_wl_data_source_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_data_source_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_data_source_set_user_data(wl_data_source_1: ?*struct_wl_data_source, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_data_source_1)), user_data);
}
pub fn wl_data_source_offer(wl_data_source_1: ?*struct_wl_data_source, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_source_1)), WL_DATA_SOURCE_OFFER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_source_1))), 0, mime_type);
}
pub fn wl_data_source_destroy(wl_data_source_1: ?*struct_wl_data_source) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_source_1)), WL_DATA_SOURCE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_source_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_data_device_set_selection(wl_data_device_1: ?*struct_wl_data_device, source: ?*struct_wl_data_source, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_device_1)), WL_DATA_DEVICE_SET_SELECTION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_device_1))), 0, source, serial);
}
pub fn wl_data_device_manager_create_data_source(wl_data_device_manager: ?*struct_wl_data_device_manager_20) callconv(.c) ?*struct_wl_data_source {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_device_manager)), WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE, &wl_data_source_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_device_manager))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
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
pub const struct_zwp_primary_selection_source_v1_145 = opaque {
};
pub const SDL_WaylandPrimarySelectionSource = extern struct {
    source: ?*struct_zwp_primary_selection_source_v1_145 = null,
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
pub const struct_zwp_primary_selection_offer_v1_146 = opaque {
};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_146 = null,
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
pub extern const zwp_primary_selection_source_v1_interface: struct_wl_interface;
pub fn zwp_primary_selection_device_manager_v1_create_source(zwp_primary_selection_device_manager_v1: ?*struct_zwp_primary_selection_device_manager_v1_21) callconv(.c) ?*struct_zwp_primary_selection_source_v1_145 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1)), ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_CREATE_SOURCE, &zwp_primary_selection_source_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn zwp_primary_selection_device_v1_set_selection(zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44, source: ?*struct_zwp_primary_selection_source_v1_145, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1)), ZWP_PRIMARY_SELECTION_DEVICE_V1_SET_SELECTION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1))), 0, source, serial);
}
pub fn zwp_primary_selection_offer_v1_receive(zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_146, mime_type: [*c]const u8, fd: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1)), ZWP_PRIMARY_SELECTION_OFFER_V1_RECEIVE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1))), 0, mime_type, fd);
}
pub fn zwp_primary_selection_offer_v1_destroy(zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_146) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1)), ZWP_PRIMARY_SELECTION_OFFER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_zwp_primary_selection_source_v1_listener = extern struct {
    send: ?*const fn (data: ?*anyopaque, zwp_primary_selection_source_v1: ?*struct_zwp_primary_selection_source_v1_145, mime_type: [*c]const u8, fd: i32) callconv(.c) void = null,
    cancelled: ?*const fn (data: ?*anyopaque, zwp_primary_selection_source_v1: ?*struct_zwp_primary_selection_source_v1_145) callconv(.c) void = null,
};
pub fn zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1: ?*struct_zwp_primary_selection_source_v1_145, listener: [*c]const struct_zwp_primary_selection_source_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_primary_selection_source_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_primary_selection_source_v1_offer(zwp_primary_selection_source_v1: ?*struct_zwp_primary_selection_source_v1_145, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_source_v1)), ZWP_PRIMARY_SELECTION_SOURCE_V1_OFFER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_source_v1))), 0, mime_type);
}
pub fn zwp_primary_selection_source_v1_destroy(zwp_primary_selection_source_v1: ?*struct_zwp_primary_selection_source_v1_145) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_source_v1)), ZWP_PRIMARY_SELECTION_SOURCE_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_source_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn WritePipe(fd: c_int, buffer: ?*const anyopaque, total_length: usize, pos: [*c]usize) callconv(.c) isize {
    @setEvalBranchQuota(100000);
    var bytes_written: isize = 0;
    _ = &bytes_written;
    const length: isize = @bitCast(@as(c_ulong, @truncate(total_length -% pos.*)));
    _ = &length;
    var sig_set: sigset_t = undefined;
    _ = &sig_set;
    var old_sig_set: sigset_t = undefined;
    _ = &old_sig_set;
    var zerotime: struct_timespec = struct_timespec{
        .tv_sec = 0,
        .tv_nsec = 0,
    };
    _ = &zerotime;
    const ready: c_int = SDL_IOReady(fd, SDL_IOR_WRITE, @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 14)))) *% @as(Uint64, SDL_NS_PER_MS)))));
    _ = &ready;
    _ = sigemptyset(&sig_set);
    _ = sigaddset(&sig_set, SIGPIPE);
    _ = pthread_sigmask(SIG_BLOCK, &sig_set, &old_sig_set);
    if (ready > @as(c_int, 0)) {
        if (length > @as(isize, 0)) {
            bytes_written = write(fd, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(@constCast(buffer)))) + pos.*)), @bitCast(@as(c_long, if (length < @as(isize, PIPE_BUF)) length else @as(isize, PIPE_BUF))));
        }
        if (bytes_written > @as(isize, 0)) {
            pos.* +%= @bitCast(@as(c_long, bytes_written));
        }
    } else if (ready == @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Pipe timeout");
    } else {
        _ = SDL_SetError_REAL("Pipe poll error");
    }
    _ = sigtimedwait(&sig_set, null, &zerotime);
    _ = pthread_sigmask(SIG_SETMASK, &old_sig_set, null);
    return bytes_written;
}
pub fn ReadPipe(fd: c_int, buffer: [*c]?*anyopaque, total_length: [*c]usize, timeout_ns: Sint64) callconv(.c) isize {
    @setEvalBranchQuota(100000);
    var output_buffer: ?*anyopaque = null;
    _ = &output_buffer;
    var temp: [4096]u8 = undefined;
    _ = &temp;
    var bytes_read: isize = 0;
    _ = &bytes_read;
    const ready: c_int = SDL_IOReady(fd, SDL_IOR_READ, timeout_ns);
    _ = &ready;
    if (ready > @as(c_int, 0)) {
        bytes_read = read(fd, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&temp))))), @sizeOf(@TypeOf(temp)));
    } else if (ready == @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Pipe timeout");
    } else {
        _ = SDL_SetError_REAL("Pipe poll error");
    }
    if (bytes_read > @as(isize, 0)) {
        const pos: usize = total_length.*;
        _ = &pos;
        total_length.* +%= @bitCast(@as(c_long, bytes_read));
        const new_buffer_length: usize = total_length.* +% @sizeOf(Uint32);
        _ = &new_buffer_length;
        if (!(buffer.* != null)) {
            output_buffer = SDL_malloc_REAL(new_buffer_length);
        } else {
            output_buffer = SDL_realloc_REAL(buffer.*, new_buffer_length);
        }
        if (!(output_buffer != null)) {
            bytes_read = -@as(c_int, 1);
        } else {
            _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(output_buffer))) + pos)), @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&temp))))), @bitCast(@as(c_long, bytes_read)));
            _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(output_buffer))) + (new_buffer_length -% @sizeOf(Uint32)))), 0, @sizeOf(Uint32));
            buffer.* = output_buffer;
        }
    }
    return bytes_read;
}
pub fn MIMEDataListHasType(list: [*c]struct_wl_array, mime_type: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var item: [*c][*c]const u8 = undefined;
    _ = &item;
    {
        item = @ptrCast(@alignCast(list.*.data));
        while ((list.*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(item))) < (@as([*c]const u8, @ptrCast(@alignCast(list.*.data))) + list.*.size))) : (item += 1) {
            if (SDL_strcmp_REAL(item.*, mime_type) == @as(c_int, 0)) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn MIMEDataListAdd(list: [*c]struct_wl_array, mime_type: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!MIMEDataListHasType(list, mime_type)) {
        var item: [*c][*c]u8 = @ptrCast(@alignCast(WAYLAND_wl_array_add.?(list, @sizeOf([*c]u8))));
        _ = &item;
        item.* = SDL_strdup_REAL(mime_type);
    }
    return @"true" != 0;
}
pub fn MIMEDataListFree(list: [*c]struct_wl_array) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c][*c]u8 = undefined;
    _ = &item;
    {
        item = @ptrCast(@alignCast(list.*.data));
        while ((list.*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(item))) < (@as([*c]const u8, @ptrCast(@alignCast(list.*.data))) + list.*.size))) : (item += 1) {
            SDL_free_REAL(@ptrCast(@alignCast(item.*)));
        }
    }
    WAYLAND_wl_array_release.?(list);
}
pub fn data_source_handle_target(_: ?*anyopaque, _: ?*struct_wl_data_source, _: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn data_source_handle_send(data: ?*anyopaque, _: ?*struct_wl_data_source, mime_type: [*c]const u8, fd: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = Wayland_DataSourceSend(@ptrCast(@alignCast(data)), mime_type, fd);
}
pub fn data_source_handle_cancelled(data: ?*anyopaque, _: ?*struct_wl_data_source) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var source: [*c]SDL_WaylandDataSource = @ptrCast(@alignCast(data));
    _ = &source;
    if (source != null) {
        Wayland_DataSourceDestroy(source);
    }
}
pub fn data_source_handle_dnd_drop_performed(_: ?*anyopaque, _: ?*struct_wl_data_source) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn data_source_handle_dnd_finished(_: ?*anyopaque, _: ?*struct_wl_data_source) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn data_source_handle_action(_: ?*anyopaque, _: ?*struct_wl_data_source, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const data_source_listener: struct_wl_data_source_listener = struct_wl_data_source_listener{
    .target = data_source_handle_target,
    .send = data_source_handle_send,
    .cancelled = data_source_handle_cancelled,
    .dnd_drop_performed = data_source_handle_dnd_drop_performed,
    .dnd_finished = data_source_handle_dnd_finished,
    .action = data_source_handle_action,
};
pub export fn Wayland_DataSourceCreate(video_data: [*c]SDL_VideoData) [*c]SDL_WaylandDataSource {
    @setEvalBranchQuota(100000);
    var data_source: [*c]SDL_WaylandDataSource = undefined;
    data_source = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data_source.*)))));
    _ = &data_source;
    if (!(data_source != null)) {
        return null;
    }
    var id: ?*struct_wl_data_source = wl_data_device_manager_create_data_source(video_data.*.data_device_manager);
    _ = &id;
    data_source.*.source = id;
    wl_data_source_set_user_data(id, @ptrCast(@alignCast(data_source)));
    _ = wl_data_source_add_listener(id, &data_source_listener, @ptrCast(@alignCast(data_source)));
    return data_source;
}
pub fn primary_selection_source_send(data: ?*anyopaque, _: ?*struct_zwp_primary_selection_source_v1_145, mime_type: [*c]const u8, fd: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = Wayland_PrimarySelectionSourceSend(@ptrCast(@alignCast(data)), mime_type, fd);
}
pub fn primary_selection_source_cancelled(data: ?*anyopaque, _: ?*struct_zwp_primary_selection_source_v1_145) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Wayland_PrimarySelectionSourceDestroy(@ptrCast(@alignCast(data)));
}
pub const primary_selection_source_listener: struct_zwp_primary_selection_source_v1_listener = struct_zwp_primary_selection_source_v1_listener{
    .send = primary_selection_source_send,
    .cancelled = primary_selection_source_cancelled,
};
pub export fn Wayland_PrimarySelectionSourceCreate(video_data: [*c]SDL_VideoData) [*c]SDL_WaylandPrimarySelectionSource {
    @setEvalBranchQuota(100000);
    var primary_selection_source: [*c]SDL_WaylandPrimarySelectionSource = undefined;
    primary_selection_source = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(primary_selection_source.*)))));
    _ = &primary_selection_source;
    if (!(primary_selection_source != null)) {
        return null;
    }
    var id: ?*struct_zwp_primary_selection_source_v1_145 = zwp_primary_selection_device_manager_v1_create_source(video_data.*.primary_selection_device_manager);
    _ = &id;
    primary_selection_source.*.source = id;
    _ = zwp_primary_selection_source_v1_add_listener(id, &primary_selection_source_listener, @ptrCast(@alignCast(primary_selection_source)));
    return primary_selection_source;
}
pub fn SendData(data: ?*const anyopaque, length: usize, fd: c_int) callconv(.c) usize {
    @setEvalBranchQuota(100000);
    var result: usize = 0;
    _ = &result;
    if ((length > @as(usize, 0)) and (data != null)) {
        while (WritePipe(fd, data, length, &result) > @as(isize, 0)) {}
    }
    _ = close(fd);
    return result;
}
pub export fn Wayland_DataSourceSend(source: [*c]SDL_WaylandDataSource, mime_type: [*c]const u8, fd: c_int) isize {
    @setEvalBranchQuota(100000);
    var data: ?*const anyopaque = null;
    _ = &data;
    var length: usize = 0;
    _ = &length;
    if (SDL_strcmp_REAL(mime_type, "application/x-sdl3-source-id") == @as(c_int, 0)) {
        data = @ptrCast(@alignCast(source.*.data_device.*.id_str));
        length = SDL_strlen_REAL(source.*.data_device.*.id_str);
    } else if (source.*.data_callback != null) {
        data = source.*.data_callback.?(source.*.userdata.data, mime_type, &length);
    }
    return @bitCast(@as(c_ulong, @truncate(SendData(data, length, fd))));
}
pub export fn Wayland_PrimarySelectionSourceSend(source: [*c]SDL_WaylandPrimarySelectionSource, mime_type: [*c]const u8, fd: c_int) isize {
    @setEvalBranchQuota(100000);
    var data: ?*const anyopaque = null;
    _ = &data;
    var length: usize = 0;
    _ = &length;
    if (source.*.data_callback != null) {
        data = source.*.data_callback.?(source.*.userdata.data, mime_type, &length);
    }
    return @bitCast(@as(c_ulong, @truncate(SendData(data, length, fd))));
}
pub export fn Wayland_DataSourceSetCallback(source: [*c]SDL_WaylandDataSource, data_callback: SDL_ClipboardDataCallback, cleanup_callback: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque, sequence: Uint32) void {
    @setEvalBranchQuota(100000);
    if (source != null) {
        source.*.data_callback = data_callback;
        source.*.cleanup_callback = cleanup_callback;
        source.*.userdata.sequence = sequence;
        source.*.userdata.data = userdata;
    }
}
pub export fn Wayland_PrimarySelectionSourceSetCallback(source: [*c]SDL_WaylandPrimarySelectionSource, data_callback: SDL_ClipboardDataCallback, cleanup_callback: SDL_ClipboardCleanupCallback, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (source != null) {
        source.*.data_callback = data_callback;
        source.*.cleanup_callback = cleanup_callback;
        source.*.userdata.sequence = 0;
        source.*.userdata.data = userdata;
    }
}
pub fn CloneDataBuffer(buffer: ?*const anyopaque, len: [*c]const usize) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var clone: ?*anyopaque = null;
    _ = &clone;
    if ((len.* > @as(usize, 0)) and (buffer != null)) {
        clone = SDL_malloc_REAL(len.* +% @sizeOf(Uint32));
        if (clone != null) {
            _ = memcpy(clone, buffer, len.*);
            _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(clone))) + len.*)), 0, @sizeOf(Uint32));
        }
    }
    return clone;
}
pub export fn Wayland_DataSourceGetData(source: [*c]SDL_WaylandDataSource, mime_type: [*c]const u8, length: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var buffer: ?*anyopaque = null;
    _ = &buffer;
    length.* = 0;
    if (!(source != null)) {
        _ = SDL_SetError_REAL("Invalid data source");
    } else if (source.*.data_callback != null) {
        var internal_buffer: ?*const anyopaque = source.*.data_callback.?(source.*.userdata.data, mime_type, length);
        _ = &internal_buffer;
        buffer = CloneDataBuffer(internal_buffer, length);
    }
    return buffer;
}
pub export fn Wayland_PrimarySelectionSourceGetData(source: [*c]SDL_WaylandPrimarySelectionSource, mime_type: [*c]const u8, length: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var buffer: ?*anyopaque = null;
    _ = &buffer;
    length.* = 0;
    if (!(source != null)) {
        _ = SDL_SetError_REAL("Invalid primary selection source");
    } else if (source.*.data_callback != null) {
        var internal_buffer: ?*const anyopaque = source.*.data_callback.?(source.*.userdata.data, mime_type, length);
        _ = &internal_buffer;
        buffer = CloneDataBuffer(internal_buffer, length);
    }
    return buffer;
}
pub export fn Wayland_DataSourceDestroy(source: [*c]SDL_WaylandDataSource) void {
    @setEvalBranchQuota(100000);
    if (source != null) {
        var data_device: [*c]SDL_WaylandDataDevice = source.*.data_device;
        _ = &data_device;
        if ((data_device != null) and (data_device.*.selection_source == source)) {
            data_device.*.selection_source = null;
        }
        wl_data_source_destroy(source.*.source);
        if (source.*.userdata.sequence != 0) {
            SDL_CancelClipboardData(source.*.userdata.sequence);
        } else if (source.*.cleanup_callback != null) {
            source.*.cleanup_callback.?(source.*.userdata.data);
        }
        SDL_free_REAL(@ptrCast(@alignCast(source)));
    }
}
pub export fn Wayland_PrimarySelectionSourceDestroy(source: [*c]SDL_WaylandPrimarySelectionSource) void {
    @setEvalBranchQuota(100000);
    if (source != null) {
        var primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = source.*.primary_selection_device;
        _ = &primary_selection_device;
        if ((primary_selection_device != null) and (primary_selection_device.*.selection_source == source)) {
            primary_selection_device.*.selection_source = null;
        }
        zwp_primary_selection_source_v1_destroy(source.*.source);
        if (source.*.cleanup_callback != null) {
            source.*.cleanup_callback.?(source.*.userdata.data);
        }
        SDL_free_REAL(@ptrCast(@alignCast(source)));
    }
}
pub fn offer_source_done_handler(data: ?*anyopaque, callback: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(callback != null)) {
        return;
    }
    var offer: [*c]SDL_WaylandDataOffer = @ptrCast(@alignCast(data));
    _ = &offer;
    var id: [*c]u8 = null;
    _ = &id;
    var length: usize = 0;
    _ = &length;
    wl_callback_destroy(offer.*.callback);
    offer.*.callback = null;
    while (ReadPipe(offer.*.read_fd, @ptrCast(@alignCast(&id)), &length, @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 14)))) *% @as(Uint64, SDL_NS_PER_MS))))) > @as(isize, 0)) {}
    _ = close(offer.*.read_fd);
    offer.*.read_fd = -@as(c_int, 1);
    if (id != null) {
        const source_is_external: bool = SDL_strncmp_REAL(offer.*.data_device.*.id_str, id, length) != @as(c_int, 0);
        _ = &source_is_external;
        SDL_free_REAL(@ptrCast(@alignCast(id)));
        if (source_is_external) {
            SelectionOfferNotifyFromMIMEs(offer.*.data_device, @"false" != 0);
        } else {
            var data_device: [*c]SDL_WaylandDataDevice = offer.*.data_device;
            _ = &data_device;
            Wayland_DataOfferDestroy(offer);
            data_device.*.selection_offer = null;
        }
    }
}
pub var offer_source_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = offer_source_done_handler,
};
pub fn DataOfferCheckSource(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var pipefd: [2]c_int = undefined;
    _ = &pipefd;
    if (!(offer != null)) {
        return;
    }
    var data_device: [*c]SDL_WaylandDataDevice = offer.*.data_device;
    _ = &data_device;
    if (pipe2(@ptrCast(@alignCast(&pipefd)), __O_CLOEXEC | O_NONBLOCK) == @as(c_int, 0)) {
        if (offer.*.callback != null) {
            wl_callback_destroy(offer.*.callback);
        }
        if (offer.*.read_fd >= @as(c_int, 0)) {
            _ = close(offer.*.read_fd);
        }
        offer.*.read_fd = pipefd[@as(c_int, 0)];
        wl_data_offer_receive(offer.*.offer, mime_type, pipefd[@as(c_int, 1)]);
        _ = close(pipefd[@as(c_int, 1)]);
        offer.*.callback = wl_display_sync(offer.*.data_device.*.seat.*.display.*.display);
        _ = wl_callback_add_listener(offer.*.callback, &offer_source_listener, @ptrCast(@alignCast(offer)));
        _ = WAYLAND_wl_display_flush.?(data_device.*.seat.*.display.*.display);
    }
}
pub fn UpdateSeatOffers(data_device: [*c]SDL_WaylandDataDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var offer_seat: [*c]SDL_WaylandSeat = data_device.*.seat;
    _ = &offer_seat;
    var video_data: [*c]SDL_VideoData = offer_seat.*.display;
    _ = &video_data;
    var s: [*c]SDL_WaylandSeat = undefined;
    _ = &s;
    {
        s = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&video_data.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(s.*), @ptrFromInt(0)).link)));
        while ((&s.*.link) != (&video_data.*.seat_list)) : (s = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(s.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(s.*), @ptrFromInt(0)).link)))) {
            if (s.*.data_device != null) {
                Wayland_DataSourceDestroy(s.*.data_device.*.selection_source);
                s.*.data_device.*.selection_source = null;
                if (s != offer_seat) {
                    Wayland_DataOfferDestroy(s.*.data_device.*.selection_offer);
                    s.*.data_device.*.selection_offer = null;
                }
            }
        }
    }
    video_data.*.current_data_offer_seat = offer_seat;
}
pub fn SelectionOfferNotifyFromMIMEs(data_device: [*c]SDL_WaylandDataDevice, check_origin: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var offer: [*c]SDL_WaylandDataOffer = data_device.*.selection_offer;
    _ = &offer;
    var new_mime_types: [*c][*c]u8 = null;
    _ = &new_mime_types;
    var num_formats: usize = 0;
    _ = &num_formats;
    if (offer != null) {
        var alloc_size: usize = 0;
        _ = &alloc_size;
        var item: [*c][*c]const u8 = undefined;
        _ = &item;
        {
            item = @ptrCast(@alignCast((&offer.*.mimes).*.data));
            while (((&offer.*.mimes).*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(item))) < (@as([*c]const u8, @ptrCast(@alignCast((&offer.*.mimes).*.data))) + (&offer.*.mimes).*.size))) : (item += 1) {
                if (check_origin and (SDL_strcmp_REAL(item.*, "application/x-sdl3-source-id") == @as(c_int, 0))) {
                    DataOfferCheckSource(offer, item.*);
                    return;
                }
                num_formats +%= 1;
                alloc_size +%= SDL_strlen_REAL(item.*) +% @as(usize, 1);
            }
        }
        alloc_size +%= (num_formats +% @as(usize, 1)) *% @sizeOf([*c]u8);
        new_mime_types = @ptrCast(@alignCast(SDL_AllocateTemporaryMemory(alloc_size)));
        if (!(new_mime_types != null)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_INPUT, "unable to allocate new_mime_types");
            return;
        }
        var strPtr: [*c]u8 = @ptrCast(@alignCast((new_mime_types + num_formats) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))));
        _ = &strPtr;
        alloc_size -%= @as(usize, @intCast(@intFromPtr(strPtr))) -% @as(usize, @intCast(@intFromPtr(new_mime_types)));
        item = null;
        var i: c_int = 0;
        _ = &i;
        {
            item = @ptrCast(@alignCast((&offer.*.mimes).*.data));
            while (((&offer.*.mimes).*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(item))) < (@as([*c]const u8, @ptrCast(@alignCast((&offer.*.mimes).*.data))) + (&offer.*.mimes).*.size))) : (item += 1) {
                if (!(item != null)) {
                    continue;
                }
                new_mime_types[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &i;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = strPtr;
                const len: usize = SDL_strlcpy_REAL(strPtr, item.*, alloc_size) +% @as(usize, 1);
                _ = &len;
                strPtr += len;
                alloc_size -%= len;
            }
        }
        new_mime_types[num_formats] = null;
    }
    UpdateSeatOffers(data_device);
    SDL_SendClipboardUpdate(@"false" != 0, new_mime_types, num_formats);
}
pub export fn Wayland_DataDeviceSetSelectionOffer(data_device: [*c]SDL_WaylandDataDevice, offer: [*c]SDL_WaylandDataOffer) void {
    @setEvalBranchQuota(100000);
    const notify: bool = (offer != null) or ((!(offer != null) and (data_device.*.selection_offer != null)) and (!(data_device.*.selection_offer.*.callback != null) or !(data_device.*.selection_source != null)));
    _ = &notify;
    Wayland_DataOfferDestroy(data_device.*.selection_offer);
    data_device.*.selection_offer = offer;
    if (notify) {
        SelectionOfferNotifyFromMIMEs(data_device, @"true" != 0);
    }
}
pub export fn Wayland_DataOfferReceive(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8, length: [*c]usize, extended_timeout: bool) ?*anyopaque {
    @setEvalBranchQuota(100000);
    const timeout: Sint64 = @bitCast(@as(c_ulong, @truncate(if (extended_timeout) @as(Uint64, @bitCast(@as(c_long, @as(c_int, 5000)))) *% @as(Uint64, SDL_NS_PER_MS) else @as(Uint64, @bitCast(@as(c_long, @as(c_int, 14)))) *% @as(Uint64, SDL_NS_PER_MS))));
    _ = &timeout;
    var pipefd: [2]c_int = undefined;
    _ = &pipefd;
    var buffer: ?*anyopaque = null;
    _ = &buffer;
    length.* = 0;
    if (!(offer != null)) {
        _ = SDL_SetError_REAL("Invalid data offer");
        return null;
    }
    var data_device: [*c]SDL_WaylandDataDevice = offer.*.data_device;
    _ = &data_device;
    if (pipe2(@ptrCast(@alignCast(&pipefd)), __O_CLOEXEC | O_NONBLOCK) == @as(c_int, 0)) {
        wl_data_offer_receive(offer.*.offer, mime_type, pipefd[@as(c_int, 1)]);
        _ = close(pipefd[@as(c_int, 1)]);
        _ = WAYLAND_wl_display_flush.?(data_device.*.seat.*.display.*.display);
        while (ReadPipe(pipefd[@as(c_int, 0)], &buffer, length, timeout) > @as(isize, 0)) {}
        _ = close(pipefd[@as(c_int, 0)]);
    } else {
        _ = SDL_SetError_REAL("Could not create pipe");
    }
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In Wayland_data_offer_receive for '%s', buffer (%zu) at %p", mime_type, length.*, buffer);
    return buffer;
}
pub export fn Wayland_PrimarySelectionOfferReceive(offer: [*c]SDL_WaylandPrimarySelectionOffer, mime_type: [*c]const u8, length: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var pipefd: [2]c_int = undefined;
    _ = &pipefd;
    var buffer: ?*anyopaque = null;
    _ = &buffer;
    length.* = 0;
    if (!(offer != null)) {
        _ = SDL_SetError_REAL("Invalid data offer");
        return null;
    }
    var primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = offer.*.primary_selection_device;
    _ = &primary_selection_device;
    if (pipe2(@ptrCast(@alignCast(&pipefd)), __O_CLOEXEC | O_NONBLOCK) == @as(c_int, 0)) {
        zwp_primary_selection_offer_v1_receive(offer.*.offer, mime_type, pipefd[@as(c_int, 1)]);
        _ = close(pipefd[@as(c_int, 1)]);
        _ = WAYLAND_wl_display_flush.?(primary_selection_device.*.seat.*.display.*.display);
        while (ReadPipe(pipefd[@as(c_int, 0)], &buffer, length, @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 5000)))) *% @as(Uint64, SDL_NS_PER_MS))))) > @as(isize, 0)) {}
        _ = close(pipefd[@as(c_int, 0)]);
    } else {
        _ = SDL_SetError_REAL("Could not create pipe");
    }
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In Wayland_primary_selection_offer_receive for '%s', buffer (%zu) at %p", mime_type, length.*, buffer);
    return buffer;
}
pub export fn Wayland_DataOfferAddMIME(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return MIMEDataListAdd(&offer.*.mimes, mime_type);
}
pub export fn Wayland_PrimarySelectionOfferAddMIME(offer: [*c]SDL_WaylandPrimarySelectionOffer, mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    return MIMEDataListAdd(&offer.*.mimes, mime_type);
}
pub export fn Wayland_DataOfferHasMIME(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (offer != null) {
        return MIMEDataListHasType(&offer.*.mimes, mime_type);
    }
    return @"false" != 0;
}
pub export fn Wayland_PrimarySelectionOfferHasMIME(offer: [*c]SDL_WaylandPrimarySelectionOffer, mime_type: [*c]const u8) bool {
    @setEvalBranchQuota(100000);
    if (offer != null) {
        return MIMEDataListHasType(&offer.*.mimes, mime_type);
    }
    return @"false" != 0;
}
pub export fn Wayland_DataOfferDestroy(offer: [*c]SDL_WaylandDataOffer) void {
    @setEvalBranchQuota(100000);
    if (offer != null) {
        if (offer.*.callback != null) {
            wl_callback_destroy(offer.*.callback);
        }
        if (offer.*.read_fd >= @as(c_int, 0)) {
            _ = close(offer.*.read_fd);
        }
        wl_data_offer_destroy(offer.*.offer);
        MIMEDataListFree(&offer.*.mimes);
        SDL_free_REAL(@ptrCast(@alignCast(offer)));
    }
}
pub export fn Wayland_PrimarySelectionOfferDestroy(offer: [*c]SDL_WaylandPrimarySelectionOffer) void {
    @setEvalBranchQuota(100000);
    if (offer != null) {
        zwp_primary_selection_offer_v1_destroy(offer.*.offer);
        MIMEDataListFree(&offer.*.mimes);
        SDL_free_REAL(@ptrCast(@alignCast(offer)));
    }
}
pub export fn Wayland_DataDeviceSetSelectionSource(data_device: [*c]SDL_WaylandDataDevice, source: [*c]SDL_WaylandDataSource, mime_types: [*c][*c]const u8, mime_count: usize) bool {
    @setEvalBranchQuota(100000);
    if (!(data_device != null)) {
        return SDL_SetError_REAL("Invalid Data Device");
    }
    if (!(source != null)) {
        return SDL_SetError_REAL("Invalid source");
    }
    if (mime_count != 0) {
        {
            var index_1: usize = 0;
            _ = &index_1;
            while (index_1 < mime_count) : (index_1 +%= 1) {
                var mime_type: [*c]const u8 = mime_types[index_1];
                _ = &mime_type;
                wl_data_source_offer(source.*.source, mime_type);
            }
        }
        wl_data_source_offer(source.*.source, "application/x-sdl3-source-id");
        wl_data_device_set_selection(data_device.*.data_device, source.*.source, data_device.*.seat.*.last_implicit_grab_serial);
        if (data_device.*.selection_source != null) {
            Wayland_DataSourceDestroy(data_device.*.selection_source);
        }
        data_device.*.selection_source = source;
        source.*.data_device = data_device;
    } else {
        Wayland_DataSourceDestroy(data_device.*.selection_source);
        data_device.*.selection_source = null;
        return SDL_SetError_REAL("No mime data");
    }
    return @"true" != 0;
}
pub export fn Wayland_PrimarySelectionDeviceSetSelection(primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice, source: [*c]SDL_WaylandPrimarySelectionSource, mime_types: [*c]const [*c]const u8, mime_count: usize) bool {
    @setEvalBranchQuota(100000);
    if (!(primary_selection_device != null)) {
        return SDL_SetError_REAL("Invalid Primary Selection Device");
    }
    if (!(source != null)) {
        return SDL_SetError_REAL("Invalid source");
    }
    if (mime_count != 0) {
        {
            var index_1: usize = 0;
            _ = &index_1;
            while (index_1 < mime_count) : (index_1 +%= 1) {
                var mime_type: [*c]const u8 = mime_types[index_1];
                _ = &mime_type;
                zwp_primary_selection_source_v1_offer(source.*.source, mime_type);
            }
        }
        zwp_primary_selection_device_v1_set_selection(primary_selection_device.*.primary_selection_device, source.*.source, primary_selection_device.*.seat.*.last_implicit_grab_serial);
        if (primary_selection_device.*.selection_source != null) {
            Wayland_PrimarySelectionSourceDestroy(primary_selection_device.*.selection_source);
        }
        primary_selection_device.*.selection_source = source;
        source.*.primary_selection_device = primary_selection_device;
    } else {
        Wayland_PrimarySelectionSourceDestroy(primary_selection_device.*.selection_source);
        primary_selection_device.*.selection_source = null;
        return SDL_SetError_REAL("No mime data");
    }
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub inline fn SDL_MS_TO_NS(MS: anytype) @TypeOf(__helpers.cast(Uint64, MS) * SDL_NS_PER_MS) {
    @setEvalBranchQuota(100000);
    _ = &MS;
    return __helpers.cast(Uint64, MS) * SDL_NS_PER_MS;
}
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const PIPE_BUF = @as(c_int, 4096);
pub const SIGPIPE = @as(c_int, 13);
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:129:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:134:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:139:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:144:9
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_SETMASK = @as(c_int, 2);
pub const SDL_IOR_READ = @as(c_int, 0x1);
pub const SDL_IOR_WRITE = @as(c_int, 0x2);
pub const WL_DISPLAY_SYNC = @as(c_int, 0);
pub const WL_DATA_OFFER_RECEIVE = @as(c_int, 1);
pub const WL_DATA_OFFER_DESTROY = @as(c_int, 2);
pub const WL_DATA_SOURCE_OFFER = @as(c_int, 0);
pub const WL_DATA_SOURCE_DESTROY = @as(c_int, 1);
pub const WL_DATA_DEVICE_SET_SELECTION = @as(c_int, 1);
pub const WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_CREATE_SOURCE = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_DEVICE_V1_SET_SELECTION = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_OFFER_V1_RECEIVE = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_OFFER_V1_DESTROY = @as(c_int, 1);
pub const ZWP_PRIMARY_SELECTION_SOURCE_V1_OFFER = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_SOURCE_V1_DESTROY = @as(c_int, 1);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_callback = struct_wl_callback;
pub const wl_touch = struct_wl_touch;
pub const xdg_toplevel = struct_xdg_toplevel;
pub const wl_data_source = struct_wl_data_source;
