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
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const gid_t = __gid_t;
pub const uid_t = __uid_t;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
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
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_abs_REAL(x: c_int) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetGlobalProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_CreateProperties_REAL() SDL_PropertiesID;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_ClearProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8) bool;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_WaitThread_REAL(thread: ?*SDL_Thread, status: [*c]c_int) void;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
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
pub const SDL_ORIENTATION_LANDSCAPE: c_int = 1;
pub const SDL_ORIENTATION_LANDSCAPE_FLIPPED: c_int = 2;
pub const SDL_ORIENTATION_PORTRAIT: c_int = 3;
pub const SDL_ORIENTATION_PORTRAIT_FLIPPED: c_int = 4;
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
pub const struct_xdg_wm_base_13 = opaque {
};
pub const struct_libdecor_14 = opaque {
};
const struct_unnamed_12 = extern struct {
    xdg: ?*struct_xdg_wm_base_13 = null,
    libdecor: ?*struct_libdecor_14 = null,
};
pub const struct_wl_subcompositor_15 = opaque {
};
pub const struct_zwp_relative_pointer_manager_v1_16 = opaque {
};
pub const struct_zwp_pointer_constraints_v1_17 = opaque {
};
pub const struct_wp_pointer_warp_v1_18 = opaque {
};
pub const struct_wp_cursor_shape_manager_v1_19 = opaque {
};
pub const struct_wl_data_device_manager_20 = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_21 = opaque {
};
pub const struct_zxdg_decoration_manager_v1_22 = opaque {
};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23 = opaque {
};
pub const struct_zwp_idle_inhibit_manager_v1_24 = opaque {
};
pub const struct_xdg_activation_v1_25 = opaque {
};
pub const struct_zwp_text_input_manager_v3_26 = opaque {
};
pub const struct_zxdg_output_manager_v1_27 = opaque {
};
pub const struct_wp_viewporter_28 = opaque {
};
pub const struct_wp_fractional_scale_manager_v1_29 = opaque {
};
pub const struct_zwp_input_timestamps_manager_v1_30 = opaque {
};
pub const struct_zxdg_exporter_v2_31 = opaque {
};
pub const struct_xdg_wm_dialog_v1_32 = opaque {
};
pub const struct_wp_alpha_modifier_v1_33 = opaque {
};
pub const struct_xdg_toplevel_icon_manager_v1_34 = opaque {
};
pub const struct_frog_color_management_factory_v1_35 = opaque {
};
pub const struct_wp_color_manager_v1_36 = opaque {
};
pub const struct_zwp_tablet_manager_v2_37 = opaque {
};
pub const struct_wl_fixes_38 = opaque {
};
pub const struct_zwp_pointer_gestures_v1_39 = opaque {
};
pub const struct_wp_single_pixel_buffer_manager_v1_40 = opaque {
};
pub const struct_xdg_session_manager_v1_41 = opaque {
};
pub const struct_xdg_toplevel_tag_manager_v1_42 = opaque {
};
pub const struct_xdg_session_v1_43 = opaque {
};
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
pub const struct_zwp_input_timestamps_v1_46 = opaque {
};
pub const struct_zwp_keyboard_shortcuts_inhibitor_v1_47 = opaque {
};
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
pub const struct_zwp_relative_pointer_v1_50 = opaque {
};
pub const struct_zwp_locked_pointer_v1_51 = opaque {
};
pub const struct_zwp_confined_pointer_v1_52 = opaque {
};
pub const struct_zwp_pointer_gesture_pinch_v1_53 = opaque {
};
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
pub const struct_wp_cursor_shape_device_v1_58 = opaque {
};
pub const struct_wp_viewport_59 = opaque {
};
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
pub const struct_zwp_tablet_seat_v2_64 = opaque {
};
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
pub const struct_zxdg_output_v1_66 = opaque {
};
pub const struct_wp_color_management_output_v1_67 = opaque {
};
pub const struct_Wayland_ColorInfoState = opaque {
};
const struct_unnamed_68 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_69 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_70 = extern struct {
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
const struct_unnamed_71 = extern struct {
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
const struct_unnamed_72 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_73 = opaque {};
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
pub const struct_SDL_PrivateGLESData = extern struct {
    dummy: c_int = 0,
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
    gl_config: struct_unnamed_71 = @import("std").mem.zeroes(struct_unnamed_71),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_72 = @import("std").mem.zeroes(struct_unnamed_72),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_73 = null,
    egl_data: [*c]struct_SDL_EGL_VideoData = null,
    gles_data: [*c]struct_SDL_PrivateGLESData = null,
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
    color_info_state: ?*struct_Wayland_ColorInfoState = null,
    wl_output_name: [*c]u8 = null,
    scale_factor: f64 = 0,
    integer_scale_factor: c_int = 0,
    registry_id: Uint32 = 0,
    logical: struct_unnamed_68 = @import("std").mem.zeroes(struct_unnamed_68),
    pixel: struct_unnamed_69 = @import("std").mem.zeroes(struct_unnamed_69),
    physical: struct_unnamed_70 = @import("std").mem.zeroes(struct_unnamed_70),
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
const struct_unnamed_75 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {
};
pub const struct_xdg_toplevel = opaque {
};
const struct_unnamed_78 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_80 = opaque {
};
pub const struct_xdg_positioner_81 = opaque {
};
const struct_unnamed_79 = extern struct {
    xdg_popup: ?*struct_xdg_popup_80 = null,
    xdg_positioner: ?*struct_xdg_positioner_81 = null,
};
const union_unnamed_77 = extern union {
    toplevel: struct_unnamed_78,
    popup: struct_unnamed_79,
};
const struct_unnamed_76 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_77 = @import("std").mem.zeroes(union_unnamed_77),
    serial: Uint32 = 0,
};
const union_unnamed_74 = extern union {
    libdecor: struct_unnamed_75,
    xdg: struct_unnamed_76,
};
const enum_unnamed_82 = c_uint;
const enum_unnamed_83 = c_uint;
const enum_unnamed_84 = c_uint;
const enum_unnamed_85 = c_uint;
const enum_unnamed_86 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const struct_zxdg_toplevel_decoration_v1_87 = opaque {
};
pub const struct_zwp_idle_inhibitor_v1_88 = opaque {
};
pub const struct_xdg_activation_token_v1_89 = opaque {
};
pub const struct_wp_fractional_scale_v1_90 = opaque {
};
pub const struct_zxdg_exported_v2_91 = opaque {
};
pub const struct_xdg_dialog_v1_92 = opaque {
};
pub const struct_wp_alpha_modifier_surface_v1_93 = opaque {
};
pub const struct_xdg_toplevel_icon_v1_94 = opaque {
};
pub const struct_frog_color_managed_surface_95 = opaque {
};
pub const struct_wp_color_management_surface_feedback_v1_96 = opaque {
};
pub const struct_xdg_toplevel_session_v1_97 = opaque {
};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_98 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_99 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_100 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_101 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_102 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_103 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_104 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_59 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_105 = extern struct {
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
    shell_surface: union_unnamed_74 = @import("std").mem.zeroes(union_unnamed_74),
    shell_surface_type: enum_unnamed_82 = @import("std").mem.zeroes(enum_unnamed_82),
    shell_surface_status: enum_unnamed_83 = @import("std").mem.zeroes(enum_unnamed_83),
    wm_caps: enum_unnamed_84 = @import("std").mem.zeroes(enum_unnamed_84),
    toplevel_constraints: enum_unnamed_85 = @import("std").mem.zeroes(enum_unnamed_85),
    resize_edge: enum_unnamed_86 = @import("std").mem.zeroes(enum_unnamed_86),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_87 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_88 = null,
    activation_token: ?*struct_xdg_activation_token_v1_89 = null,
    viewport: ?*struct_wp_viewport_59 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_90 = null,
    exported: ?*struct_zxdg_exported_v2_91 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_92 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_93 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_94 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_95 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_96 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_97 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState = null,
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
    pointer_scale: struct_unnamed_98 = @import("std").mem.zeroes(struct_unnamed_98),
    requested: struct_unnamed_99 = @import("std").mem.zeroes(struct_unnamed_99),
    current: struct_unnamed_100 = @import("std").mem.zeroes(struct_unnamed_100),
    last_configure: struct_unnamed_101 = @import("std").mem.zeroes(struct_unnamed_101),
    system_limits: struct_unnamed_102 = @import("std").mem.zeroes(struct_unnamed_102),
    toplevel_bounds: struct_unnamed_103 = @import("std").mem.zeroes(struct_unnamed_103),
    mask: struct_unnamed_104 = @import("std").mem.zeroes(struct_unnamed_104),
    text_input_props: struct_unnamed_105 = @import("std").mem.zeroes(struct_unnamed_105),
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
pub const SDL_EVENT_DISPLAY_ORIENTATION: c_int = 337;
pub const SDL_EVENT_DISPLAY_MOVED: c_int = 340;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_SYSTEM: c_int = 3;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn SDL_SystemTheme_Init() bool;
pub extern fn SDL_SystemTheme_Get() SDL_SystemTheme;
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
pub const VIDEO_DEVICE_CAPS_MODE_SWITCHING_EMULATED: c_int = 1;
pub const VIDEO_DEVICE_CAPS_HAS_POPUP_WINDOW_SUPPORT: c_int = 2;
pub const VIDEO_DEVICE_CAPS_SENDS_FULLSCREEN_DIMENSIONS: c_int = 4;
pub const VIDEO_DEVICE_CAPS_SENDS_DISPLAY_CHANGES: c_int = 16;
pub const VIDEO_DEVICE_CAPS_SENDS_HDR_CHANGES: c_int = 32;
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub const struct_VideoBootStrap = extern struct {
    name: [*c]const u8 = null,
    desc: [*c]const u8 = null,
    create: ?*const fn () callconv(.c) [*c]SDL_VideoDevice = null,
    ShowMessageBox: ?*const fn (messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) callconv(.c) bool = null,
    is_preferred: bool = false,
};
pub const VideoBootStrap = struct_VideoBootStrap;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_AddVideoDisplay(display: [*c]const SDL_VideoDisplay, send_event: bool) SDL_DisplayID;
pub extern fn SDL_DelVideoDisplay(display: SDL_DisplayID, send_event: bool) void;
pub extern fn SDL_AddFullscreenDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) bool;
pub extern fn SDL_ResetFullscreenDisplayModes(display: [*c]SDL_VideoDisplay) void;
pub extern fn SDL_SetDesktopDisplayMode(display: [*c]SDL_VideoDisplay, mode: [*c]const SDL_DisplayMode) void;
pub extern fn SDL_SetDisplayContentScale(display: [*c]SDL_VideoDisplay, scale: f32) void;
pub extern fn SDL_GetVideoDisplay(display: SDL_DisplayID) [*c]SDL_VideoDisplay;
pub extern fn DBUS_ApplyWindowProgress(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn SDL_SendDisplayEvent(display: [*c]SDL_VideoDisplay, displayevent: SDL_EventType, data1: c_int, data2: c_int) void;
pub extern fn SDL_SendQuit() void;
pub extern fn Wayland_GetTextMimeTypes(_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) [*c]const [*c]const u8;
pub extern fn Wayland_SetClipboardData(_this: [*c]SDL_VideoDevice) bool;
pub extern fn Wayland_GetClipboardData(_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8, length: [*c]usize) ?*anyopaque;
pub extern fn Wayland_HasClipboardData(_this: [*c]SDL_VideoDevice, mime_type: [*c]const u8) bool;
pub extern fn Wayland_SetPrimarySelectionText(_this: [*c]SDL_VideoDevice, text: [*c]const u8) bool;
pub extern fn Wayland_GetPrimarySelectionText(_this: [*c]SDL_VideoDevice) [*c]u8;
pub extern fn Wayland_HasPrimarySelectionText(_this: [*c]SDL_VideoDevice) bool;
pub extern fn Wayland_FreeColorInfoState(state: ?*struct_Wayland_ColorInfoState) void;
pub extern fn Wayland_GetColorInfoForOutput(display_data: [*c]SDL_DisplayData, defer_event_processing: bool) void;
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
pub const dbus_uint32_t = c_uint;
pub const dbus_bool_t = dbus_uint32_t;
pub const struct_DBusError = extern struct {
    name: [*c]const u8 = null,
    message: [*c]const u8 = null,
    reserved_bits: c_uint = 0,
    padding1: ?*anyopaque = null,
};
pub const DBusError = struct_DBusError;
pub const DBusFreeFunction = ?*const fn (memory: ?*anyopaque) callconv(.c) void;
pub const struct_DBusMessage = opaque {
};
pub const DBusMessage = struct_DBusMessage;
pub const struct_DBusMessageIter = extern struct {
    dummy1: ?*anyopaque = null,
    dummy2: ?*anyopaque = null,
    dummy3: dbus_uint32_t = 0,
    dummy4: c_int = 0,
    dummy5: c_int = 0,
    dummy6: c_int = 0,
    dummy7: c_int = 0,
    dummy8: c_int = 0,
    dummy9: c_int = 0,
    dummy10: c_int = 0,
    dummy11: c_int = 0,
    pad1: c_int = 0,
    pad2: ?*anyopaque = null,
    pad3: ?*anyopaque = null,
};
pub const DBusMessageIter = struct_DBusMessageIter;
pub const DBusBusType = c_uint;
pub const DBusHandlerResult = c_uint;
pub const struct_DBusConnection = opaque {
};
pub const DBusConnection = struct_DBusConnection;
pub const DBusObjectPathUnregisterFunction = ?*const fn (connection: ?*DBusConnection, user_data: ?*anyopaque) callconv(.c) void;
pub const DBusObjectPathMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_DBusObjectPathVTable = extern struct {
    unregister_function: DBusObjectPathUnregisterFunction = null,
    message_function: DBusObjectPathMessageFunction = null,
    dbus_internal_pad1: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad2: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad3: ?*const fn (?*anyopaque) callconv(.c) void = null,
    dbus_internal_pad4: ?*const fn (?*anyopaque) callconv(.c) void = null,
};
pub const DBusObjectPathVTable = struct_DBusObjectPathVTable;
pub const DBusDispatchStatus = c_uint;
pub const DBusHandleMessageFunction = ?*const fn (connection: ?*DBusConnection, message: ?*DBusMessage, user_data: ?*anyopaque) callconv(.c) DBusHandlerResult;
pub const struct_SDL_DBusContext = extern struct {
    session_conn: ?*DBusConnection = null,
    system_conn: ?*DBusConnection = null,
    bus_get_private: ?*const fn (DBusBusType, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    bus_register: ?*const fn (?*DBusConnection, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    bus_add_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_remove_match: ?*const fn (?*DBusConnection, [*c]const u8, [*c]DBusError) callconv(.c) void = null,
    bus_get_unique_name: ?*const fn (?*DBusConnection) callconv(.c) [*c]const u8 = null,
    connection_open_private: ?*const fn ([*c]const u8, [*c]DBusError) callconv(.c) ?*DBusConnection = null,
    connection_set_exit_on_disconnect: ?*const fn (?*DBusConnection, dbus_bool_t) callconv(.c) void = null,
    connection_get_is_connected: ?*const fn (?*DBusConnection) callconv(.c) dbus_bool_t = null,
    connection_add_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque, DBusFreeFunction) callconv(.c) dbus_bool_t = null,
    connection_remove_filter: ?*const fn (?*DBusConnection, DBusHandleMessageFunction, ?*anyopaque) callconv(.c) dbus_bool_t = null,
    connection_try_register_object_path: ?*const fn (?*DBusConnection, [*c]const u8, [*c]const DBusObjectPathVTable, ?*anyopaque, [*c]DBusError) callconv(.c) dbus_bool_t = null,
    connection_send: ?*const fn (?*DBusConnection, ?*DBusMessage, [*c]dbus_uint32_t) callconv(.c) dbus_bool_t = null,
    connection_send_with_reply_and_block: ?*const fn (?*DBusConnection, ?*DBusMessage, c_int, [*c]DBusError) callconv(.c) ?*DBusMessage = null,
    connection_close: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_ref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_unref: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_flush: ?*const fn (?*DBusConnection) callconv(.c) void = null,
    connection_read_write: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_read_write_dispatch: ?*const fn (?*DBusConnection, c_int) callconv(.c) dbus_bool_t = null,
    connection_dispatch: ?*const fn (?*DBusConnection) callconv(.c) DBusDispatchStatus = null,
    type_is_fixed: ?*const fn (c_int) callconv(.c) dbus_bool_t = null,
    message_is_signal: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_has_path: ?*const fn (?*DBusMessage, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_method_call: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_signal: ?*const fn ([*c]const u8, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_set_no_reply: ?*const fn (?*DBusMessage, dbus_bool_t) callconv(.c) void = null,
    message_append_args: ?*const fn (?*DBusMessage, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_append_args_valist: ?*const fn (?*DBusMessage, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init_append: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) void = null,
    message_iter_open_container: ?*const fn ([*c]DBusMessageIter, c_int, [*c]const u8, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_append_basic: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque) callconv(.c) dbus_bool_t = null,
    message_iter_close_container: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_get_args: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, ...) callconv(.c) dbus_bool_t = null,
    message_get_args_valist: ?*const fn (?*DBusMessage, [*c]DBusError, c_int, [*c]struct___va_list_tag_2) callconv(.c) dbus_bool_t = null,
    message_iter_init: ?*const fn (?*DBusMessage, [*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_next: ?*const fn ([*c]DBusMessageIter) callconv(.c) dbus_bool_t = null,
    message_iter_get_basic: ?*const fn ([*c]DBusMessageIter, ?*anyopaque) callconv(.c) void = null,
    message_iter_get_arg_type: ?*const fn ([*c]DBusMessageIter) callconv(.c) c_int = null,
    message_iter_recurse: ?*const fn ([*c]DBusMessageIter, [*c]DBusMessageIter) callconv(.c) void = null,
    message_unref: ?*const fn (?*DBusMessage) callconv(.c) void = null,
    threads_init_default: ?*const fn () callconv(.c) dbus_bool_t = null,
    error_init: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    error_is_set: ?*const fn ([*c]const DBusError) callconv(.c) dbus_bool_t = null,
    error_has_name: ?*const fn ([*c]const DBusError, [*c]const u8) callconv(.c) dbus_bool_t = null,
    error_free: ?*const fn ([*c]DBusError) callconv(.c) void = null,
    get_local_machine_id: ?*const fn () callconv(.c) [*c]u8 = null,
    try_get_local_machine_id: ?*const fn ([*c]DBusError) callconv(.c) [*c]u8 = null,
    free: ?*const fn (?*anyopaque) callconv(.c) void = null,
    free_string_array: ?*const fn ([*c][*c]u8) callconv(.c) void = null,
    shutdown: ?*const fn () callconv(.c) void = null,
    bus_request_name: ?*const fn (?*DBusConnection, [*c]const u8, c_uint, [*c]DBusError) callconv(.c) c_int = null,
    message_is_method_call: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) dbus_bool_t = null,
    message_new_error: ?*const fn (?*DBusMessage, [*c]const u8, [*c]const u8) callconv(.c) ?*DBusMessage = null,
    message_new_method_return: ?*const fn (?*DBusMessage) callconv(.c) ?*DBusMessage = null,
    message_iter_append_fixed_array: ?*const fn ([*c]DBusMessageIter, c_int, ?*const anyopaque, c_int) callconv(.c) dbus_bool_t = null,
    message_iter_get_fixed_array: ?*const fn ([*c]DBusMessageIter, ?*anyopaque, [*c]c_int) callconv(.c) void = null,
    connection_unregister_object_path: ?*const fn (?*DBusConnection, [*c]const u8) callconv(.c) dbus_bool_t = null,
    connection_get_object_path_data: ?*const fn (?*DBusConnection, [*c]const u8, [*c]?*anyopaque) callconv(.c) dbus_bool_t = null,
};
pub const SDL_DBusContext = struct_SDL_DBusContext;
pub extern fn SDL_DBus_GetContext() [*c]SDL_DBusContext;
pub extern fn Wayland_CreateEventThread(data: [*c]SDL_VideoData, queue_name: [*c]const u8) ?*Wayland_EventThreadContext;
pub extern fn Wayland_DestroyEventThread(context: ?*Wayland_EventThreadContext) void;
pub const struct_wl_cursor_theme_112 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_112 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const enum_libdecor_error = c_uint;
pub const struct_libdecor_interface = extern struct {
    @"error": ?*const fn (context: ?*struct_libdecor_14, @"error": enum_libdecor_error, message: [*c]const u8) callconv(.c) void = null,
    reserved0: ?*const fn () callconv(.c) void = null,
    reserved1: ?*const fn () callconv(.c) void = null,
    reserved2: ?*const fn () callconv(.c) void = null,
    reserved3: ?*const fn () callconv(.c) void = null,
    reserved4: ?*const fn () callconv(.c) void = null,
    reserved5: ?*const fn () callconv(.c) void = null,
    reserved6: ?*const fn () callconv(.c) void = null,
    reserved7: ?*const fn () callconv(.c) void = null,
    reserved8: ?*const fn () callconv(.c) void = null,
    reserved9: ?*const fn () callconv(.c) void = null,
};
pub const enum_xkb_context_flags = c_uint;
pub extern fn SDL_WAYLAND_LoadSymbols() bool;
pub extern fn SDL_WAYLAND_UnloadSymbols() void;
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub extern var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_user_data = ?*const fn (?*struct_wl_proxy) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_proxy_get_user_data: SDL_DYNWAYLANDFN_wl_proxy_get_user_data;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_display_connect = ?*const fn ([*c]const u8) callconv(.c) ?*struct_wl_display_8;
pub extern var WAYLAND_wl_display_connect: SDL_DYNWAYLANDFN_wl_display_connect;
pub const SDL_DYNWAYLANDFN_wl_display_disconnect = ?*const fn (?*struct_wl_display_8) callconv(.c) void;
pub extern var WAYLAND_wl_display_disconnect: SDL_DYNWAYLANDFN_wl_display_disconnect;
pub const SDL_DYNWAYLANDFN_wl_display_roundtrip = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_roundtrip: SDL_DYNWAYLANDFN_wl_display_roundtrip;
pub const SDL_DYNWAYLANDFN_wl_display_create_queue = ?*const fn (?*struct_wl_display_8) callconv(.c) ?*struct_wl_event_queue;
pub extern var WAYLAND_wl_display_create_queue: SDL_DYNWAYLANDFN_wl_display_create_queue;
pub const SDL_DYNWAYLANDFN_wl_list_init = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_init: SDL_DYNWAYLANDFN_wl_list_init;
pub const SDL_DYNWAYLANDFN_wl_list_insert = ?*const fn ([*c]struct_wl_list, [*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_insert: SDL_DYNWAYLANDFN_wl_list_insert;
pub const SDL_DYNWAYLANDFN_wl_list_remove = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_remove: SDL_DYNWAYLANDFN_wl_list_remove;
pub const SDL_DYNWAYLANDFN_wl_list_empty = ?*const fn ([*c]const struct_wl_list) callconv(.c) c_int;
pub extern var WAYLAND_wl_list_empty: SDL_DYNWAYLANDFN_wl_list_empty;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_tag = ?*const fn (?*struct_wl_proxy, [*c]const [*c]const u8) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_set_tag: SDL_DYNWAYLANDFN_wl_proxy_set_tag;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_tag = ?*const fn (?*struct_wl_proxy) callconv(.c) [*c]const [*c]const u8;
pub extern var WAYLAND_wl_proxy_get_tag: SDL_DYNWAYLANDFN_wl_proxy_get_tag;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const SDL_DYNWAYLANDFN_wl_display_create_queue_with_name = ?*const fn (display: ?*struct_wl_display_8, name: [*c]const u8) callconv(.c) ?*struct_wl_event_queue;
pub extern var WAYLAND_wl_display_create_queue_with_name: SDL_DYNWAYLANDFN_wl_display_create_queue_with_name;
pub const SDL_DYNWAYLANDFN_xkb_context_unref = ?*const fn (?*struct_xkb_context) callconv(.c) void;
pub extern var WAYLAND_xkb_context_unref: SDL_DYNWAYLANDFN_xkb_context_unref;
pub const SDL_DYNWAYLANDFN_xkb_context_new = ?*const fn (flags: enum_xkb_context_flags) callconv(.c) ?*struct_xkb_context;
pub extern var WAYLAND_xkb_context_new: SDL_DYNWAYLANDFN_xkb_context_new;
pub extern var SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR: c_int;
pub const SDL_DYNWAYLANDFN_libdecor_unref = ?*const fn (?*struct_libdecor_14) callconv(.c) void;
pub extern var WAYLAND_libdecor_unref: SDL_DYNWAYLANDFN_libdecor_unref;
pub const SDL_DYNWAYLANDFN_libdecor_new = ?*const fn (?*struct_wl_display_8, [*c]const struct_libdecor_interface) callconv(.c) ?*struct_libdecor_14;
pub extern var WAYLAND_libdecor_new: SDL_DYNWAYLANDFN_libdecor_new;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub extern const wl_registry_interface: struct_wl_interface;
pub extern const wl_compositor_interface: struct_wl_interface;
pub extern const wl_shm_interface: struct_wl_interface;
pub extern const wl_data_device_manager_interface: struct_wl_interface;
pub extern const wl_seat_interface: struct_wl_interface;
pub extern const wl_output_interface: struct_wl_interface;
pub extern const wl_subcompositor_interface: struct_wl_interface;
pub extern const wl_fixes_interface: struct_wl_interface;
pub fn wl_display_get_registry(wl_display: ?*struct_wl_display_8) callconv(.c) ?*struct_wl_registry_9 {
    @setEvalBranchQuota(100000);
    var registry: ?*struct_wl_proxy = undefined;
    _ = &registry;
    registry = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_display)), WL_DISPLAY_GET_REGISTRY, &wl_registry_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_display))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(registry));
}
pub const struct_wl_registry_listener = extern struct {
    global: ?*const fn (data: ?*anyopaque, wl_registry: ?*struct_wl_registry_9, name: u32, interface: [*c]const u8, version: u32) callconv(.c) void = null,
    global_remove: ?*const fn (data: ?*anyopaque, wl_registry: ?*struct_wl_registry_9, name: u32) callconv(.c) void = null,
};
pub fn wl_registry_add_listener(wl_registry: ?*struct_wl_registry_9, listener: [*c]const struct_wl_registry_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_registry)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_registry_destroy(wl_registry: ?*struct_wl_registry_9) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_registry)));
}
pub fn wl_registry_bind(wl_registry: ?*struct_wl_registry_9, name: u32, interface: [*c]const struct_wl_interface, version: u32) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_registry)), WL_REGISTRY_BIND, interface, version, 0, name, interface.*.name, version, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_compositor_destroy(wl_compositor: ?*struct_wl_compositor_10) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_compositor)));
}
pub fn wl_shm_get_version(wl_shm: ?*struct_wl_shm_11) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_shm)));
}
pub fn wl_shm_destroy(wl_shm: ?*struct_wl_shm_11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_shm)));
}
pub fn wl_shm_release(wl_shm: ?*struct_wl_shm_11) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_shm)), WL_SHM_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_shm))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_data_device_manager_destroy(wl_data_device_manager: ?*struct_wl_data_device_manager_20) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_data_device_manager)));
}
pub fn wl_surface_get_user_data(wl_surface_1: ?*struct_wl_surface) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_user_data.?(@ptrCast(@alignCast(wl_surface_1)));
}
pub const WL_OUTPUT_TRANSFORM_NORMAL: c_int = 0;
pub const WL_OUTPUT_TRANSFORM_90: c_int = 1;
pub const WL_OUTPUT_TRANSFORM_180: c_int = 2;
pub const WL_OUTPUT_TRANSFORM_270: c_int = 3;
pub const WL_OUTPUT_TRANSFORM_FLIPPED: c_int = 4;
pub const WL_OUTPUT_TRANSFORM_FLIPPED_90: c_int = 5;
pub const WL_OUTPUT_TRANSFORM_FLIPPED_180: c_int = 6;
pub const WL_OUTPUT_TRANSFORM_FLIPPED_270: c_int = 7;
pub const WL_OUTPUT_MODE_CURRENT: c_int = 1;
pub const struct_wl_output_listener = extern struct {
    geometry: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65, x: i32, y: i32, physical_width: i32, physical_height: i32, subpixel: i32, make: [*c]const u8, model: [*c]const u8, transform: i32) callconv(.c) void = null,
    mode: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65, flags: u32, width: i32, height: i32, refresh: i32) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65) callconv(.c) void = null,
    scale: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65, factor: i32) callconv(.c) void = null,
    name: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65, name: [*c]const u8) callconv(.c) void = null,
    description: ?*const fn (data: ?*anyopaque, wl_output: ?*struct_wl_output_65, description: [*c]const u8) callconv(.c) void = null,
};
pub fn wl_output_add_listener(wl_output: ?*struct_wl_output_65, listener: [*c]const struct_wl_output_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_output)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_output_get_version(wl_output: ?*struct_wl_output_65) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_output)));
}
pub fn wl_output_destroy(wl_output: ?*struct_wl_output_65) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_output)));
}
pub fn wl_output_release(wl_output: ?*struct_wl_output_65) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_output)), WL_OUTPUT_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_output))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_subcompositor_destroy(wl_subcompositor: ?*struct_wl_subcompositor_15) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_subcompositor)), WL_SUBCOMPOSITOR_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_subcompositor))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_fixes_get_version(wl_fixes: ?*struct_wl_fixes_38) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_fixes)));
}
pub fn wl_fixes_destroy(wl_fixes: ?*struct_wl_fixes_38) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_fixes)), WL_FIXES_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_fixes))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_fixes_destroy_registry(wl_fixes: ?*struct_wl_fixes_38, registry: ?*struct_wl_registry_9) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_fixes)), WL_FIXES_DESTROY_REGISTRY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_fixes))), 0, registry);
}
pub fn wl_fixes_ack_global_remove(wl_fixes: ?*struct_wl_fixes_38, registry: ?*struct_wl_registry_9, name: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_fixes)), WL_FIXES_ACK_GLOBAL_REMOVE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_fixes))), 0, registry, name);
}
pub extern fn Wayland_ShowWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_HideWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_RaiseWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowFullscreen(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) SDL_FullscreenResult;
pub extern fn Wayland_MaximizeWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_MinimizeWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowMouseRect(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_SetWindowMouseGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool;
pub extern fn Wayland_SetWindowKeyboardGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, grabbed: bool) bool;
pub extern fn Wayland_RestoreWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowBordered(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) void;
pub extern fn Wayland_SetWindowResizable(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, resizable: bool) void;
pub extern fn Wayland_CreateWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) bool;
pub extern fn Wayland_SetWindowPosition(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_SetWindowSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowAspectRatio(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowMinimumSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SetWindowMaximumSize(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_GetWindowSizeInPixels(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn Wayland_GetDisplayForWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_DisplayID;
pub extern fn Wayland_SetWindowParent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent_window: [*c]SDL_Window) bool;
pub extern fn Wayland_SetWindowModal(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) bool;
pub extern fn Wayland_SetWindowOpacity(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) bool;
pub extern fn Wayland_SetWindowTitle(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_ShowWindowSystemMenu(window: [*c]SDL_Window, x: c_int, y: c_int) void;
pub extern fn Wayland_DestroyWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_SuspendScreenSaver(_this: [*c]SDL_VideoDevice) bool;
pub extern fn Wayland_SetWindowIcon(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) bool;
pub extern fn Wayland_SetWindowFocusable(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) bool;
pub extern fn Wayland_GetWindowContentScale(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) f32;
pub extern fn Wayland_GetWindowICCProfile(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) ?*anyopaque;
pub extern fn Wayland_AcceptDragAndDrop(window: [*c]SDL_Window, accept: bool) void;
pub extern fn Wayland_SetWindowHitTest(window: [*c]SDL_Window, enabled: bool) bool;
pub extern fn Wayland_FlashWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, operation: SDL_FlashOperation) bool;
pub extern fn Wayland_SyncWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_ReconfigureWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, flags: SDL_WindowFlags) bool;
pub extern fn Wayland_RemoveOutputFromWindow(window: [*c]SDL_WindowData, display_data: [*c]SDL_DisplayData) void;
pub extern fn Wayland_UpdateWindowPosition(window: [*c]SDL_Window) void;
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
pub const struct_zwp_primary_selection_source_v1_113 = opaque {
};
pub const SDL_WaylandPrimarySelectionSource = extern struct {
    source: ?*struct_zwp_primary_selection_source_v1_113 = null,
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
pub const struct_zwp_primary_selection_offer_v1_114 = opaque {
};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_114 = null,
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
pub extern fn Wayland_PumpEvents(_this: [*c]SDL_VideoDevice) void;
pub extern fn Wayland_SendWakeupEvent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void;
pub extern fn Wayland_WaitEventTimeout(_this: [*c]SDL_VideoDevice, timeoutNS: Sint64) c_int;
pub extern fn Wayland_DisplayInitInputTimestampManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitCursorShapeManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitPointerGestureManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitTabletManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitDataDeviceManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitPrimarySelectionDeviceManager(display: [*c]SDL_VideoData) void;
pub extern fn Wayland_DisplayInitTextInputManager(d: [*c]SDL_VideoData, id: u32) void;
pub extern fn Wayland_DisplayCreateSeat(display: [*c]SDL_VideoData, wl_seat: ?*struct_wl_seat, id: Uint32) void;
pub extern fn Wayland_SeatDestroy(seat: [*c]SDL_WaylandSeat, shutting_down: bool) void;
pub extern fn Wayland_InitKeyboard(_this: [*c]SDL_VideoDevice) bool;
pub extern fn Wayland_QuitKeyboard(_this: [*c]SDL_VideoDevice) void;
pub extern fn Wayland_StartTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, props: SDL_PropertiesID) bool;
pub extern fn Wayland_StopTextInput(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_UpdateTextInputArea(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_HasScreenKeyboardSupport(_this: [*c]SDL_VideoDevice) bool;
pub extern fn Wayland_ShowMessageBox(messageboxdata: [*c]const SDL_MessageBoxData, buttonID: [*c]c_int) bool;
pub extern fn Wayland_InitMouse(data: [*c]SDL_VideoData) void;
pub extern fn Wayland_FiniMouse(data: [*c]SDL_VideoData) void;
pub extern fn SDL_EGL_GetProcAddressInternal(_this: [*c]SDL_VideoDevice, proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_EGL_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn Wayland_GLES_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8) bool;
pub extern fn Wayland_GLES_CreateContext(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_GLContext;
pub extern fn Wayland_GLES_SetSwapInterval(_this: [*c]SDL_VideoDevice, interval: c_int) bool;
pub extern fn Wayland_GLES_GetSwapInterval(_this: [*c]SDL_VideoDevice, interval: [*c]c_int) bool;
pub extern fn Wayland_GLES_SwapWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool;
pub extern fn Wayland_GLES_MakeCurrent(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, context: SDL_GLContext) bool;
pub extern fn Wayland_GLES_DestroyContext(_this: [*c]SDL_VideoDevice, context: SDL_GLContext) bool;
pub extern fn Wayland_GLES_SetDefaultProfileConfig(_this: [*c]SDL_VideoDevice) void;
pub extern fn Wayland_GLES_GetEGLSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_EGLSurface;
pub extern fn Wayland_Vulkan_LoadLibrary(_this: [*c]SDL_VideoDevice, path: [*c]const u8) bool;
pub extern fn Wayland_Vulkan_UnloadLibrary(_this: [*c]SDL_VideoDevice) void;
pub extern fn Wayland_Vulkan_GetInstanceExtensions(_this: [*c]SDL_VideoDevice, count: [*c]Uint32) [*c]const [*c]const u8;
pub extern fn Wayland_Vulkan_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, instance: VkInstance, allocator: ?*const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool;
pub extern fn Wayland_Vulkan_DestroySurface(_this: [*c]SDL_VideoDevice, instance: VkInstance, surface: VkSurfaceKHR, allocator: ?*const struct_VkAllocationCallbacks) void;
pub extern fn Wayland_Vulkan_GetPresentationSupport(_this: [*c]SDL_VideoDevice, instance: VkInstance, physicalDevice: VkPhysicalDevice, queueFamilyIndex: Uint32) bool;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn getuid() __uid_t;
pub extern fn geteuid() __uid_t;
pub extern fn getgid() __gid_t;
pub extern fn getegid() __gid_t;
pub extern fn getresuid(__ruid: [*c]__uid_t, __euid: [*c]__uid_t, __suid: [*c]__uid_t) c_int;
pub extern fn getresgid(__rgid: [*c]__gid_t, __egid: [*c]__gid_t, __sgid: [*c]__gid_t) c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn sync() void;
pub extern fn __errno_location() [*c]c_int;
pub extern const wp_alpha_modifier_v1_interface: struct_wl_interface;
pub fn wp_alpha_modifier_v1_destroy(wp_alpha_modifier_v1: ?*struct_wp_alpha_modifier_v1_33) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_alpha_modifier_v1)), WP_ALPHA_MODIFIER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_alpha_modifier_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_cursor_shape_manager_v1_interface: struct_wl_interface;
pub fn wp_cursor_shape_manager_v1_destroy(wp_cursor_shape_manager_v1: ?*struct_wp_cursor_shape_manager_v1_19) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1)), WP_CURSOR_SHAPE_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_fractional_scale_manager_v1_interface: struct_wl_interface;
pub fn wp_fractional_scale_manager_v1_destroy(wp_fractional_scale_manager_v1: ?*struct_wp_fractional_scale_manager_v1_29) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_fractional_scale_manager_v1)), WP_FRACTIONAL_SCALE_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_fractional_scale_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const frog_color_management_factory_v1_interface: struct_wl_interface;
pub fn frog_color_management_factory_v1_destroy(frog_color_management_factory_v1: ?*struct_frog_color_management_factory_v1_35) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(frog_color_management_factory_v1)), FROG_COLOR_MANAGEMENT_FACTORY_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(frog_color_management_factory_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_idle_inhibit_manager_v1_interface: struct_wl_interface;
pub fn zwp_idle_inhibit_manager_v1_destroy(zwp_idle_inhibit_manager_v1: ?*struct_zwp_idle_inhibit_manager_v1_24) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_idle_inhibit_manager_v1)), ZWP_IDLE_INHIBIT_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_idle_inhibit_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_input_timestamps_manager_v1_interface: struct_wl_interface;
pub fn zwp_input_timestamps_manager_v1_destroy(zwp_input_timestamps_manager_v1: ?*struct_zwp_input_timestamps_manager_v1_30) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1)), ZWP_INPUT_TIMESTAMPS_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_keyboard_shortcuts_inhibit_manager_v1_interface: struct_wl_interface;
pub fn zwp_keyboard_shortcuts_inhibit_manager_v1_destroy(zwp_keyboard_shortcuts_inhibit_manager_v1: ?*struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibit_manager_v1)), ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibit_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_pointer_constraints_v1_interface: struct_wl_interface;
pub fn zwp_pointer_constraints_v1_destroy(zwp_pointer_constraints_v1: ?*struct_zwp_pointer_constraints_v1_17) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1)), ZWP_POINTER_CONSTRAINTS_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_primary_selection_device_manager_v1_interface: struct_wl_interface;
pub fn zwp_primary_selection_device_manager_v1_destroy(zwp_primary_selection_device_manager_v1: ?*struct_zwp_primary_selection_device_manager_v1_21) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1)), ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_relative_pointer_manager_v1_interface: struct_wl_interface;
pub fn zwp_relative_pointer_manager_v1_destroy(zwp_relative_pointer_manager_v1: ?*struct_zwp_relative_pointer_manager_v1_16) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_relative_pointer_manager_v1)), ZWP_RELATIVE_POINTER_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_relative_pointer_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_tablet_manager_v2_interface: struct_wl_interface;
pub fn zwp_tablet_manager_v2_destroy(zwp_tablet_manager_v2: ?*struct_zwp_tablet_manager_v2_37) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_tablet_manager_v2)), ZWP_TABLET_MANAGER_V2_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_tablet_manager_v2))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_text_input_manager_v3_interface: struct_wl_interface;
pub fn zwp_text_input_manager_v3_destroy(zwp_text_input_manager_v3: ?*struct_zwp_text_input_manager_v3_26) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_manager_v3)), ZWP_TEXT_INPUT_MANAGER_V3_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_manager_v3))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_viewporter_interface: struct_wl_interface;
pub fn wp_viewporter_destroy(wp_viewporter: ?*struct_wp_viewporter_28) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewporter)), WP_VIEWPORTER_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewporter))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_activation_v1_interface: struct_wl_interface;
pub fn xdg_activation_v1_destroy(xdg_activation_v1: ?*struct_xdg_activation_v1_25) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_v1)), XDG_ACTIVATION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zxdg_decoration_manager_v1_interface: struct_wl_interface;
pub fn zxdg_decoration_manager_v1_destroy(zxdg_decoration_manager_v1: ?*struct_zxdg_decoration_manager_v1_22) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_decoration_manager_v1)), ZXDG_DECORATION_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_decoration_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_wm_dialog_v1_interface: struct_wl_interface;
pub fn xdg_wm_dialog_v1_destroy(xdg_wm_dialog_v1: ?*struct_xdg_wm_dialog_v1_32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_dialog_v1)), XDG_WM_DIALOG_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_dialog_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zxdg_exporter_v2_interface: struct_wl_interface;
pub fn zxdg_exporter_v2_destroy(zxdg_exporter_v2: ?*struct_zxdg_exporter_v2_31) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_exporter_v2)), ZXDG_EXPORTER_V2_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_exporter_v2))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zxdg_output_manager_v1_interface: struct_wl_interface;
pub extern const zxdg_output_v1_interface: struct_wl_interface;
pub fn zxdg_output_manager_v1_destroy(zxdg_output_manager_v1: ?*struct_zxdg_output_manager_v1_27) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_output_manager_v1)), ZXDG_OUTPUT_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_output_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn zxdg_output_manager_v1_get_xdg_output(zxdg_output_manager_v1: ?*struct_zxdg_output_manager_v1_27, output: ?*struct_wl_output_65) callconv(.c) ?*struct_zxdg_output_v1_66 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_output_manager_v1)), ZXDG_OUTPUT_MANAGER_V1_GET_XDG_OUTPUT, &zxdg_output_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_output_manager_v1))), 0, @as(?*anyopaque, null), output);
    return @ptrCast(@alignCast(id));
}
pub const struct_zxdg_output_v1_listener = extern struct {
    logical_position: ?*const fn (data: ?*anyopaque, zxdg_output_v1: ?*struct_zxdg_output_v1_66, x: i32, y: i32) callconv(.c) void = null,
    logical_size: ?*const fn (data: ?*anyopaque, zxdg_output_v1: ?*struct_zxdg_output_v1_66, width: i32, height: i32) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, zxdg_output_v1: ?*struct_zxdg_output_v1_66) callconv(.c) void = null,
    name: ?*const fn (data: ?*anyopaque, zxdg_output_v1: ?*struct_zxdg_output_v1_66, name: [*c]const u8) callconv(.c) void = null,
    description: ?*const fn (data: ?*anyopaque, zxdg_output_v1: ?*struct_zxdg_output_v1_66, description: [*c]const u8) callconv(.c) void = null,
};
pub fn zxdg_output_v1_add_listener(zxdg_output_v1: ?*struct_zxdg_output_v1_66, listener: [*c]const struct_zxdg_output_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zxdg_output_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zxdg_output_v1_get_version(zxdg_output_v1: ?*struct_zxdg_output_v1_66) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_output_v1)));
}
pub fn zxdg_output_v1_destroy(zxdg_output_v1: ?*struct_zxdg_output_v1_66) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_output_v1)), ZXDG_OUTPUT_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_output_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_wm_base_interface: struct_wl_interface;
pub const struct_xdg_wm_base_listener = extern struct {
    ping: ?*const fn (data: ?*anyopaque, xdg_wm_base: ?*struct_xdg_wm_base_13, serial: u32) callconv(.c) void = null,
};
pub fn xdg_wm_base_add_listener(xdg_wm_base: ?*struct_xdg_wm_base_13, listener: [*c]const struct_xdg_wm_base_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_wm_base)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_wm_base_destroy(xdg_wm_base: ?*struct_xdg_wm_base_13) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_base)), XDG_WM_BASE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_base))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_wm_base_pong(xdg_wm_base: ?*struct_xdg_wm_base_13, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_base)), XDG_WM_BASE_PONG, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_base))), 0, serial);
}
pub extern const xdg_toplevel_icon_manager_v1_interface: struct_wl_interface;
pub fn xdg_toplevel_icon_manager_v1_destroy(xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_34) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1)), XDG_TOPLEVEL_ICON_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_color_manager_v1_interface: struct_wl_interface;
pub extern const wp_color_management_output_v1_interface: struct_wl_interface;
pub fn wp_color_manager_v1_destroy(wp_color_manager_v1: ?*struct_wp_color_manager_v1_36) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_manager_v1)), WP_COLOR_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_color_manager_v1_get_output(wp_color_manager_v1: ?*struct_wp_color_manager_v1_36, output: ?*struct_wl_output_65) callconv(.c) ?*struct_wp_color_management_output_v1_67 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_manager_v1)), WP_COLOR_MANAGER_V1_GET_OUTPUT, &wp_color_management_output_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_manager_v1))), 0, @as(?*anyopaque, null), output);
    return @ptrCast(@alignCast(id));
}
pub const struct_wp_color_management_output_v1_listener = extern struct {
    image_description_changed: ?*const fn (data: ?*anyopaque, wp_color_management_output_v1: ?*struct_wp_color_management_output_v1_67) callconv(.c) void = null,
};
pub fn wp_color_management_output_v1_add_listener(wp_color_management_output_v1: ?*struct_wp_color_management_output_v1_67, listener: [*c]const struct_wp_color_management_output_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wp_color_management_output_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wp_color_management_output_v1_destroy(wp_color_management_output_v1: ?*struct_wp_color_management_output_v1_67) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_management_output_v1)), WP_COLOR_MANAGEMENT_OUTPUT_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_management_output_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_pointer_warp_v1_interface: struct_wl_interface;
pub fn wp_pointer_warp_v1_destroy(wp_pointer_warp_v1: ?*struct_wp_pointer_warp_v1_18) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_pointer_warp_v1)), WP_POINTER_WARP_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_pointer_warp_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_pointer_gestures_v1_interface: struct_wl_interface;
pub fn zwp_pointer_gestures_v1_get_version(zwp_pointer_gestures_v1: ?*struct_zwp_pointer_gestures_v1_39) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1)));
}
pub fn zwp_pointer_gestures_v1_destroy(zwp_pointer_gestures_v1: ?*struct_zwp_pointer_gestures_v1_39) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1)));
}
pub fn zwp_pointer_gestures_v1_release(zwp_pointer_gestures_v1: ?*struct_zwp_pointer_gestures_v1_39) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1)), ZWP_POINTER_GESTURES_V1_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_single_pixel_buffer_manager_v1_interface: struct_wl_interface;
pub fn wp_single_pixel_buffer_manager_v1_destroy(wp_single_pixel_buffer_manager_v1: ?*struct_wp_single_pixel_buffer_manager_v1_40) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_single_pixel_buffer_manager_v1)), WP_SINGLE_PIXEL_BUFFER_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_single_pixel_buffer_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_session_manager_v1_interface: struct_wl_interface;
pub extern const xdg_session_v1_interface: struct_wl_interface;
pub const XDG_SESSION_MANAGER_V1_REASON_LAUNCH: c_int = 1;
pub const XDG_SESSION_MANAGER_V1_REASON_SESSION_RESTORE: c_int = 3;
pub const enum_xdg_session_manager_v1_reason = c_uint;
pub fn xdg_session_manager_v1_destroy(xdg_session_manager_v1: ?*struct_xdg_session_manager_v1_41) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_manager_v1)), XDG_SESSION_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_session_manager_v1_get_session(xdg_session_manager_v1: ?*struct_xdg_session_manager_v1_41, reason: u32, session_id: [*c]const u8) callconv(.c) ?*struct_xdg_session_v1_43 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_manager_v1)), XDG_SESSION_MANAGER_V1_GET_SESSION, &xdg_session_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_manager_v1))), 0, @as(?*anyopaque, null), reason, session_id);
    return @ptrCast(@alignCast(id));
}
pub const struct_xdg_session_v1_listener = extern struct {
    created: ?*const fn (data: ?*anyopaque, xdg_session_v1: ?*struct_xdg_session_v1_43, session_id: [*c]const u8) callconv(.c) void = null,
    restored: ?*const fn (data: ?*anyopaque, xdg_session_v1: ?*struct_xdg_session_v1_43) callconv(.c) void = null,
    replaced: ?*const fn (data: ?*anyopaque, xdg_session_v1: ?*struct_xdg_session_v1_43) callconv(.c) void = null,
};
pub fn xdg_session_v1_add_listener(xdg_session_v1: ?*struct_xdg_session_v1_43, listener: [*c]const struct_xdg_session_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_session_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_session_v1_destroy(xdg_session_v1: ?*struct_xdg_session_v1_43) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_v1)), XDG_SESSION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_session_v1_remove(xdg_session_v1: ?*struct_xdg_session_v1_43) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_v1)), XDG_SESSION_V1_REMOVE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_toplevel_session_v1_destroy(xdg_toplevel_session_v1: ?*struct_xdg_toplevel_session_v1_97) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_session_v1)), XDG_TOPLEVEL_SESSION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_session_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_toplevel_tag_manager_v1_interface: struct_wl_interface;
pub fn xdg_toplevel_tag_manager_v1_destroy(xdg_toplevel_tag_manager_v1: ?*struct_xdg_toplevel_tag_manager_v1_42) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_tag_manager_v1)), XDG_TOPLEVEL_TAG_MANAGER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_tag_manager_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn Wayland_GetGNOMEPrimaryDisplayCoordinates(x: [*c]c_int, y: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var iter: [3]DBusMessageIter = undefined;
    _ = &iter;
    var msg: ?*DBusMessage = undefined;
    _ = &msg;
    var logical_x: c_int = undefined;
    _ = &logical_x;
    var logical_y: c_int = undefined;
    _ = &logical_y;
    var primary: dbus_bool_t = undefined;
    _ = &primary;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                if (@as(?*anyopaque, @ptrCast(@alignCast(dbus))) == @as(?*anyopaque, null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (reply != null) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                reply = null;
                msg = dbus.*.message_new_method_call.?("org.gnome.Mutter.DisplayConfig", "/org/gnome/Mutter/DisplayConfig", "org.gnome.Mutter.DisplayConfig", "GetCurrentState");
                if (msg != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, -@as(c_int, 1), null);
                dbus.*.message_unref.?(msg);
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
                if (reply != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = dbus.*.message_iter_init.?(reply, &iter[@as(c_int, 0)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 0)]) != @as(c_int, 'u')) {
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
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 0)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 0)]) != @as(c_int, 'a')) {
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
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 0)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 0)]) != @as(c_int, 'a')) {
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
                dbus.*.message_iter_recurse.?(&iter[@as(c_int, 0)], &iter[@as(c_int, 1)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 1)]) != @as(c_int, 'r')) {
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
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                dbus.*.message_iter_recurse.?(&iter[@as(c_int, 1)], &iter[@as(c_int, 2)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @as(c_int, 'i')) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                if (dbus.*.message_iter_next.?(&iter[@as(c_int, 1)]) != 0) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 10;
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
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                dbus.*.message_iter_get_basic.?(&iter[@as(c_int, 2)], @ptrCast(@alignCast(&logical_x)));
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 2)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @as(c_int, 'i')) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 1;
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
                dbus.*.message_iter_get_basic.?(&iter[@as(c_int, 2)], @ptrCast(@alignCast(&logical_y)));
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 2)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @as(c_int, 'd')) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 1;
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
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 2)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @as(c_int, 'u')) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
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
                _ = dbus.*.message_iter_next.?(&iter[@as(c_int, 2)]);
                if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @as(c_int, 'b')) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 1;
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
                dbus.*.message_iter_get_basic.?(&iter[@as(c_int, 2)], @ptrCast(@alignCast(&primary)));
                if (primary != 0) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                x.* = logical_x;
                y.* = logical_y;
                dbus.*.message_unref.?(reply);
                return @"true" != 0;
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            44 => {
                dbus.*.message_unref.?(reply);
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn Wayland_DisplayPositionCompare(a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var da: [*c]const SDL_DisplayData = @as([*c][*c]SDL_DisplayData, @ptrCast(@alignCast(@constCast(a)))).*;
    _ = &da;
    var db: [*c]const SDL_DisplayData = @as([*c][*c]SDL_DisplayData, @ptrCast(@alignCast(@constCast(b)))).*;
    _ = &db;
    const a_at_origin: bool = (da.*.logical.x == @as(c_int, 0)) and (da.*.logical.y == @as(c_int, 0));
    _ = &a_at_origin;
    const b_at_origin: bool = (db.*.logical.x == @as(c_int, 0)) and (db.*.logical.y == @as(c_int, 0));
    _ = &b_at_origin;
    if (a_at_origin and !b_at_origin) {
        return -@as(c_int, 1);
    }
    if (b_at_origin and !a_at_origin) {
        return 1;
    }
    if (da.*.logical.x < db.*.logical.x) {
        return -@as(c_int, 1);
    }
    if (da.*.logical.x > db.*.logical.x) {
        return 1;
    }
    if (da.*.logical.y < db.*.logical.y) {
        return -@as(c_int, 1);
    }
    if (da.*.logical.y > db.*.logical.y) {
        return 1;
    }
    if ((da.*.wl_output_name != null) and (db.*.wl_output_name != null)) {
        return SDL_strcmp_REAL(da.*.wl_output_name, db.*.wl_output_name);
    }
    return 0;
}
pub fn Wayland_GetPrimaryDisplay(vid: [*c]SDL_VideoData) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local_REFRESH_DELTA = struct {
        const REFRESH_DELTA: c_int = 4000;
    };
    _ = &static_local_REFRESH_DELTA;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    if (Wayland_GetGNOMEPrimaryDisplayCoordinates(&x, &y)) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < vid.*.output_count) : (i += 1) {
                if ((vid.*.output_list[@bitCast(@as(isize, @intCast(i)))].*.logical.x == x) and (vid.*.output_list[@bitCast(@as(isize, @intCast(i)))].*.logical.y == y)) {
                    return i;
                }
            }
        }
    }
    var best_width: c_int = 0;
    _ = &best_width;
    var best_height: c_int = 0;
    _ = &best_height;
    var best_scale: f64 = 0.0;
    _ = &best_scale;
    var best_headroom: f32 = 0.0;
    _ = &best_headroom;
    var best_refresh: c_int = 0;
    _ = &best_refresh;
    var best_is_landscape: bool = @"false" != 0;
    _ = &best_is_landscape;
    var best_index: c_int = 0;
    _ = &best_index;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vid.*.output_count) : (i += 1) {
            var d: [*c]const SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &d;
            const is_landscape: bool = (d.*.orientation != @as(SDL_DisplayOrientation, SDL_ORIENTATION_PORTRAIT)) and (d.*.orientation != @as(SDL_DisplayOrientation, SDL_ORIENTATION_PORTRAIT_FLIPPED));
            _ = &is_landscape;
            var have_new_best: bool = @"false" != 0;
            _ = &have_new_best;
            if (!best_is_landscape and is_landscape) {
                have_new_best = @"true" != 0;
            } else if (!best_is_landscape or is_landscape) {
                if ((d.*.pixel.width > best_width) or (d.*.pixel.height > best_height)) {
                    have_new_best = @"true" != 0;
                } else if ((d.*.pixel.width == best_width) and (d.*.pixel.height == best_height)) {
                    if (d.*.HDR.HDR_headroom > best_headroom) {
                        have_new_best = @"true" != 0;
                    } else if (d.*.HDR.HDR_headroom == best_headroom) {
                        if ((d.*.refresh - best_refresh) > static_local_REFRESH_DELTA.REFRESH_DELTA) {
                            have_new_best = @"true" != 0;
                        } else if ((d.*.scale_factor < best_scale) and (SDL_abs_REAL(d.*.refresh - best_refresh) <= static_local_REFRESH_DELTA.REFRESH_DELTA)) {
                            have_new_best = @"true" != 0;
                        }
                    }
                }
            }
            if (have_new_best) {
                best_width = d.*.pixel.width;
                best_height = d.*.pixel.height;
                best_scale = d.*.scale_factor;
                best_headroom = d.*.HDR.HDR_headroom;
                best_refresh = d.*.refresh;
                best_is_landscape = is_landscape;
                best_index = i;
            }
        }
    }
    return best_index;
}
pub fn Wayland_SortOutputsByPriorityHint(vid: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var name_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_DISPLAY_PRIORITY");
    _ = &name_hint;
    if (name_hint != null) {
        var saveptr: [*c]u8 = undefined;
        _ = &saveptr;
        var str: [*c]u8 = SDL_strdup_REAL(name_hint);
        _ = &str;
        var sorted_list: [*c][*c]SDL_DisplayData = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, vid.*.output_count))))));
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
                    while (i < vid.*.output_count) : (i += 1) {
                        var d: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
                        _ = &d;
                        if (((d != null) and (d.*.wl_output_name != null)) and (SDL_strcmp_REAL(token, d.*.wl_output_name) == @as(c_int, 0))) {
                            sorted_list[
                                @bitCast(@as(isize, @intCast(blk: {
                                    const ref = &sorted_index;
                                    const tmp = ref.*;
                                    ref.* += 1;
                                    break :blk tmp;
                                })))
                            ] = d;
                            vid.*.output_list[@bitCast(@as(isize, @intCast(i)))] = null;
                            break;
                        }
                    }
                }
                token = SDL_strtok_r_REAL(null, ",", &saveptr);
            }
            {
                var i: c_int = 0;
                _ = &i;
                while (i < vid.*.output_count) : (i += 1) {
                    if (vid.*.output_list[@bitCast(@as(isize, @intCast(i)))] != null) {
                        sorted_list[
                            @bitCast(@as(isize, @intCast(blk: {
                                const ref = &sorted_index;
                                const tmp = ref.*;
                                ref.* += 1;
                                break :blk tmp;
                            })))
                        ] = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
                    }
                }
            }
            _ = memcpy(@ptrCast(@alignCast(vid.*.output_list)), @ptrCast(@alignCast(sorted_list)), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, vid.*.output_count))));
        }
        SDL_free_REAL(@ptrCast(@alignCast(str)));
        SDL_free_REAL(@ptrCast(@alignCast(sorted_list)));
    }
}
pub fn Wayland_DeriveOutputPixelCoordinates(vid: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vid.*.output_count) : (i += 1) {
            var d: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &d;
            d.*.pixel.x = d.*.logical.x;
            d.*.pixel.y = d.*.logical.y;
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vid.*.output_count) : (i += 1) {
            var d1: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &d1;
            if ((d1.*.logical.width != d1.*.pixel.width) or (d1.*.logical.height != d1.*.pixel.height)) {
                const x_adj: c_int = d1.*.pixel.width - d1.*.logical.width;
                _ = &x_adj;
                const y_adj: c_int = d1.*.pixel.height - d1.*.logical.height;
                _ = &y_adj;
                if ((x_adj > @as(c_int, 0)) and (y_adj > @as(c_int, 0))) {
                    {
                        var j: c_int = 0;
                        _ = &j;
                        while (j < vid.*.output_count) : (j += 1) {
                            var d2: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(j)))];
                            _ = &d2;
                            if (d2.*.logical.x > d1.*.logical.x) {
                                d2.*.pixel.x += x_adj;
                            }
                            if (d2.*.logical.y > d1.*.logical.y) {
                                d2.*.pixel.y += y_adj;
                            }
                        }
                    }
                }
            }
        }
    }
}
pub fn Wayland_SortOutputs(vid: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_qsort_REAL(@ptrCast(@alignCast(vid.*.output_list)), @bitCast(@as(c_long, vid.*.output_count)), @sizeOf([*c]SDL_DisplayData), Wayland_DisplayPositionCompare);
    if (vid.*.scale_to_display_enabled) {
        Wayland_DeriveOutputPixelCoordinates(vid);
    }
    const primary_index: c_int = Wayland_GetPrimaryDisplay(vid);
    _ = &primary_index;
    if (primary_index != 0) {
        var primary: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(primary_index)))];
        _ = &primary;
        _ = memmove(@ptrCast(@alignCast(&vid.*.output_list[@as(c_int, 1)])), @ptrCast(@alignCast(&vid.*.output_list[@as(c_int, 0)])), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, primary_index))));
        vid.*.output_list[@as(c_int, 0)] = primary;
    }
    Wayland_SortOutputsByPriorityHint(vid);
}
pub fn Wayland_RefreshWindowPositions() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var vid: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vid;
    {
        var w: [*c]SDL_Window = vid.*.windows;
        _ = &w;
        while (w != null) : (w = w.*.next) {
            Wayland_UpdateWindowPosition(w);
        }
    }
}
pub var SDL_WAYLAND_surface_tag: [*c]const u8 = "sdl-window";
pub var SDL_WAYLAND_output_tag: [*c]const u8 = "sdl-output";
pub export fn SDL_WAYLAND_register_surface(surface: ?*struct_wl_surface) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_tag.?(@ptrCast(@alignCast(surface)), &SDL_WAYLAND_surface_tag);
}
pub export fn SDL_WAYLAND_register_output(output: ?*struct_wl_output_65) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_tag.?(@ptrCast(@alignCast(output)), &SDL_WAYLAND_output_tag);
}
pub export fn SDL_WAYLAND_own_surface(surface: ?*struct_wl_surface) bool {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_tag.?(@ptrCast(@alignCast(surface))) == (&SDL_WAYLAND_surface_tag);
}
pub export fn SDL_WAYLAND_own_output(output: ?*struct_wl_output_65) bool {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_tag.?(@ptrCast(@alignCast(output))) == (&SDL_WAYLAND_output_tag);
}
pub var external_window_list: struct_wl_list = @import("std").mem.zeroes(struct_wl_list);
pub export fn Wayland_AddWindowDataToExternalList(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_list_insert.?(&external_window_list, &data.*.external_window_list_link);
}
pub export fn Wayland_RemoveWindowDataFromExternalList(data: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_list_remove.?(&data.*.external_window_list_link);
}
pub export fn Wayland_GetWindowDataForOwnedSurface(surface: ?*struct_wl_surface) [*c]SDL_WindowData {
    @setEvalBranchQuota(100000);
    if (SDL_WAYLAND_own_surface(surface)) {
        return @ptrCast(@alignCast(wl_surface_get_user_data(surface)));
    } else if (!(WAYLAND_wl_list_empty.?(&external_window_list) != 0)) {
        var p: [*c]SDL_WindowData = undefined;
        _ = &p;
        {
            p = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&external_window_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).external_window_list_link)));
            while ((&p.*.external_window_list_link) != (&external_window_list)) : (p = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(p.*.external_window_list_link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(p.*), @ptrFromInt(0)).external_window_list_link)))) {
                if (p.*.surface == surface) {
                    return p;
                }
            }
        }
    }
    return null;
}
pub export fn Wayland_DisplayCreateQueue(display: ?*struct_wl_display_8, name: [*c]const u8) ?*struct_wl_event_queue {
    @setEvalBranchQuota(100000);
    if (WAYLAND_wl_display_create_queue_with_name != null) {
        return WAYLAND_wl_display_create_queue_with_name.?(display, name);
    }
    return WAYLAND_wl_display_create_queue.?(display);
}
pub fn Wayland_DeleteDevice(device: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = device.*.internal;
    _ = &data;
    if ((data.*.display != null) and !data.*.display_externally_owned) {
        WAYLAND_wl_display_disconnect.?(data.*.display);
        _ = SDL_ClearProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.wl_display");
    }
    SDL_free_REAL(@ptrCast(@alignCast(data)));
    SDL_free_REAL(@ptrCast(@alignCast(device)));
    SDL_WAYLAND_UnloadSymbols();
}
pub const SDL_WaylandPreferredData = extern struct {
    has_fifo_v1: bool = false,
    wl_fixes: ?*struct_wl_fixes_38 = null,
};
pub fn wayland_preferred_check_handle_global(data: ?*anyopaque, registry: ?*struct_wl_registry_9, id: u32, interface: [*c]const u8, version: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var d: [*c]SDL_WaylandPreferredData = @ptrCast(@alignCast(data));
    _ = &d;
    if (SDL_strcmp_REAL(interface, "wp_fifo_manager_v1") == @as(c_int, 0)) {
        d.*.has_fifo_v1 = @"true" != 0;
    } else if (SDL_strcmp_REAL(interface, wl_fixes_interface.name) == @as(c_int, 0)) {
        d.*.wl_fixes = @ptrCast(@alignCast(wl_registry_bind(registry, id, &wl_fixes_interface, if (@as(u32, @bitCast(@as(c_int, SDL_WL_FIXES_VERSION))) < version) @as(u32, @bitCast(@as(c_int, SDL_WL_FIXES_VERSION))) else version)));
    }
}
pub fn wayland_preferred_check_remove_global(data: ?*anyopaque, registry: ?*struct_wl_registry_9, id: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var d: [*c]SDL_WaylandPreferredData = @ptrCast(@alignCast(data));
    _ = &d;
    if ((d.*.wl_fixes != null) and (wl_fixes_get_version(d.*.wl_fixes) >= @as(u32, WL_FIXES_ACK_GLOBAL_REMOVE_SINCE_VERSION))) {
        wl_fixes_ack_global_remove(d.*.wl_fixes, registry, id);
    }
}
pub const preferred_registry_listener: struct_wl_registry_listener = struct_wl_registry_listener{
    .global = wayland_preferred_check_handle_global,
    .global_remove = wayland_preferred_check_remove_global,
};
pub fn Wayland_IsPreferred(display: ?*struct_wl_display_8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var registry: ?*struct_wl_registry_9 = wl_display_get_registry(display);
    _ = &registry;
    var preferred_data: SDL_WaylandPreferredData = SDL_WaylandPreferredData{
        .has_fifo_v1 = @as(c_int, 0) != 0,
        .wl_fixes = null,
    };
    _ = &preferred_data;
    if (!(registry != null)) {
        _ = SDL_SetError_REAL("Failed to get the Wayland registry");
        return @"false" != 0;
    }
    _ = wl_registry_add_listener(registry, &preferred_registry_listener, @ptrCast(@alignCast(&preferred_data)));
    _ = WAYLAND_wl_display_roundtrip.?(display);
    if (preferred_data.wl_fixes != null) {
        wl_fixes_destroy_registry(preferred_data.wl_fixes, registry);
        wl_fixes_destroy(preferred_data.wl_fixes);
    }
    wl_registry_destroy(registry);
    if (!preferred_data.has_fifo_v1) {
        SDL_LogInfo_REAL(SDL_LOG_CATEGORY_VIDEO, "This compositor lacks support for the fifo-v1 protocol; falling back to XWayland for GPU performance reasons (set SDL_VIDEO_DRIVER=wayland to override)");
    }
    return preferred_data.has_fifo_v1;
}
pub fn Wayland_CreateDevice(require_preferred_protocols: bool) callconv(.c) [*c]SDL_VideoDevice {
    @setEvalBranchQuota(100000);
    var device: [*c]SDL_VideoDevice = undefined;
    _ = &device;
    var data: [*c]SDL_VideoData = undefined;
    _ = &data;
    var display: ?*struct_wl_display_8 = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.wl_display", null)));
    _ = &display;
    var display_is_external: bool = !!(display != null);
    _ = &display_is_external;
    if (!(SDL_getenv_REAL("WAYLAND_DISPLAY") != null)) {
        var session: [*c]const u8 = SDL_getenv_REAL("XDG_SESSION_TYPE");
        _ = &session;
        if ((session != null) and (SDL_strcasecmp_REAL(session, "wayland") != @as(c_int, 0))) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Wayland initialization failed: no Wayland session available");
            return null;
        }
    }
    if (!SDL_WAYLAND_LoadSymbols()) {
        return null;
    }
    if (!(display != null)) {
        display = WAYLAND_wl_display_connect.?(null);
        if (!(display != null)) {
            SDL_WAYLAND_UnloadSymbols();
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "Failed to connect to the Wayland display server: %s", strerror(__errno_location().*));
            return null;
        }
    }
    if (require_preferred_protocols and !Wayland_IsPreferred(display)) {
        if (!display_is_external) {
            WAYLAND_wl_display_disconnect.?(display);
        }
        SDL_WAYLAND_UnloadSymbols();
        return null;
    }
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    if (!(data != null)) {
        if (!display_is_external) {
            WAYLAND_wl_display_disconnect.?(display);
        }
        SDL_WAYLAND_UnloadSymbols();
        return null;
    }
    data.*.initializing = @"true" != 0;
    data.*.display = display;
    data.*.display_externally_owned = display_is_external;
    data.*.scale_to_display_enabled = SDL_GetHintBoolean_REAL("SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY", @"false" != 0);
    WAYLAND_wl_list_init.?(&data.*.seat_list);
    WAYLAND_wl_list_init.?(&external_window_list);
    device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_VideoDevice))));
    if (!(device != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(data)));
        if (!display_is_external) {
            WAYLAND_wl_display_disconnect.?(display);
        }
        SDL_WAYLAND_UnloadSymbols();
        return null;
    }
    if (!display_is_external) {
        _ = SDL_SetPointerProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.wl_display", @ptrCast(@alignCast(display)));
    }
    device.*.internal = data;
    device.*.VideoInit = Wayland_VideoInit;
    device.*.VideoQuit = Wayland_VideoQuit;
    device.*.GetDisplayBounds = Wayland_GetDisplayBounds;
    device.*.SuspendScreenSaver = Wayland_SuspendScreenSaver;
    device.*.PumpEvents = Wayland_PumpEvents;
    device.*.WaitEventTimeout = Wayland_WaitEventTimeout;
    device.*.SendWakeupEvent = Wayland_SendWakeupEvent;
    device.*.GL_SwapWindow = Wayland_GLES_SwapWindow;
    device.*.GL_GetSwapInterval = Wayland_GLES_GetSwapInterval;
    device.*.GL_SetSwapInterval = Wayland_GLES_SetSwapInterval;
    device.*.GL_MakeCurrent = Wayland_GLES_MakeCurrent;
    device.*.GL_CreateContext = Wayland_GLES_CreateContext;
    device.*.GL_LoadLibrary = Wayland_GLES_LoadLibrary;
    device.*.GL_UnloadLibrary = SDL_EGL_UnloadLibrary;
    device.*.GL_GetProcAddress = SDL_EGL_GetProcAddressInternal;
    device.*.GL_DestroyContext = Wayland_GLES_DestroyContext;
    device.*.GL_SetDefaultProfileConfig = Wayland_GLES_SetDefaultProfileConfig;
    device.*.GL_GetEGLSurface = Wayland_GLES_GetEGLSurface;
    device.*.CreateSDLWindow = Wayland_CreateWindow;
    device.*.ShowWindow = Wayland_ShowWindow;
    device.*.HideWindow = Wayland_HideWindow;
    device.*.RaiseWindow = Wayland_RaiseWindow;
    device.*.SetWindowFullscreen = Wayland_SetWindowFullscreen;
    device.*.MaximizeWindow = Wayland_MaximizeWindow;
    device.*.MinimizeWindow = Wayland_MinimizeWindow;
    device.*.SetWindowMouseRect = Wayland_SetWindowMouseRect;
    device.*.SetWindowMouseGrab = Wayland_SetWindowMouseGrab;
    device.*.SetWindowKeyboardGrab = Wayland_SetWindowKeyboardGrab;
    device.*.RestoreWindow = Wayland_RestoreWindow;
    device.*.SetWindowBordered = Wayland_SetWindowBordered;
    device.*.SetWindowResizable = Wayland_SetWindowResizable;
    device.*.SetWindowPosition = Wayland_SetWindowPosition;
    device.*.SetWindowSize = Wayland_SetWindowSize;
    device.*.SetWindowAspectRatio = Wayland_SetWindowAspectRatio;
    device.*.SetWindowMinimumSize = Wayland_SetWindowMinimumSize;
    device.*.SetWindowMaximumSize = Wayland_SetWindowMaximumSize;
    device.*.SetWindowParent = Wayland_SetWindowParent;
    device.*.SetWindowModal = Wayland_SetWindowModal;
    device.*.SetWindowOpacity = Wayland_SetWindowOpacity;
    device.*.SetWindowTitle = Wayland_SetWindowTitle;
    device.*.SetWindowIcon = Wayland_SetWindowIcon;
    device.*.GetWindowSizeInPixels = Wayland_GetWindowSizeInPixels;
    device.*.GetWindowContentScale = Wayland_GetWindowContentScale;
    device.*.GetWindowICCProfile = Wayland_GetWindowICCProfile;
    device.*.GetDisplayForWindow = Wayland_GetDisplayForWindow;
    device.*.DestroyWindow = Wayland_DestroyWindow;
    device.*.SetWindowHitTest = Wayland_SetWindowHitTest;
    device.*.FlashWindow = Wayland_FlashWindow;
    device.*.ApplyWindowProgress = DBUS_ApplyWindowProgress;
    device.*.HasScreenKeyboardSupport = Wayland_HasScreenKeyboardSupport;
    device.*.ShowWindowSystemMenu = Wayland_ShowWindowSystemMenu;
    device.*.SyncWindow = Wayland_SyncWindow;
    device.*.SetWindowFocusable = Wayland_SetWindowFocusable;
    device.*.ReconfigureWindow = Wayland_ReconfigureWindow;
    device.*.AcceptDragAndDrop = Wayland_AcceptDragAndDrop;
    if (SDL_SystemTheme_Init()) {
        device.*.system_theme = SDL_SystemTheme_Get();
    }
    device.*.GetTextMimeTypes = Wayland_GetTextMimeTypes;
    device.*.SetClipboardData = Wayland_SetClipboardData;
    device.*.GetClipboardData = Wayland_GetClipboardData;
    device.*.HasClipboardData = Wayland_HasClipboardData;
    device.*.StartTextInput = Wayland_StartTextInput;
    device.*.StopTextInput = Wayland_StopTextInput;
    device.*.UpdateTextInputArea = Wayland_UpdateTextInputArea;
    device.*.Vulkan_LoadLibrary = Wayland_Vulkan_LoadLibrary;
    device.*.Vulkan_UnloadLibrary = Wayland_Vulkan_UnloadLibrary;
    device.*.Vulkan_GetInstanceExtensions = Wayland_Vulkan_GetInstanceExtensions;
    device.*.Vulkan_CreateSurface = Wayland_Vulkan_CreateSurface;
    device.*.Vulkan_DestroySurface = Wayland_Vulkan_DestroySurface;
    device.*.Vulkan_GetPresentationSupport = Wayland_Vulkan_GetPresentationSupport;
    device.*.free = Wayland_DeleteDevice;
    device.*.device_caps = @bitCast(@as(c_int, (((VIDEO_DEVICE_CAPS_MODE_SWITCHING_EMULATED | VIDEO_DEVICE_CAPS_HAS_POPUP_WINDOW_SUPPORT) | VIDEO_DEVICE_CAPS_SENDS_FULLSCREEN_DIMENSIONS) | VIDEO_DEVICE_CAPS_SENDS_DISPLAY_CHANGES) | VIDEO_DEVICE_CAPS_SENDS_HDR_CHANGES));
    return device;
}
pub fn Wayland_Preferred_CreateDevice() callconv(.c) [*c]SDL_VideoDevice {
    @setEvalBranchQuota(100000);
    return Wayland_CreateDevice(@"true" != 0);
}
pub fn Wayland_Fallback_CreateDevice() callconv(.c) [*c]SDL_VideoDevice {
    @setEvalBranchQuota(100000);
    return Wayland_CreateDevice(@"false" != 0);
}
pub export var Wayland_preferred_bootstrap: VideoBootStrap = VideoBootStrap{
    .name = "wayland",
    .desc = "SDL Wayland video driver",
    .create = Wayland_Preferred_CreateDevice,
    .ShowMessageBox = Wayland_ShowMessageBox,
    .is_preferred = @"true" != 0,
};
pub export var Wayland_bootstrap: VideoBootStrap = VideoBootStrap{
    .name = "wayland",
    .desc = "SDL Wayland video driver",
    .create = Wayland_Fallback_CreateDevice,
    .ShowMessageBox = Wayland_ShowMessageBox,
    .is_preferred = @"false" != 0,
};
pub fn handle_xdg_output_logical_position(data: ?*anyopaque, _: ?*struct_zxdg_output_v1_66, x: i32, y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    {
        const ref = &internal.*.geometry_changed;
        ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((internal.*.logical.x != x) or (internal.*.logical.y != y))) != 0;
    }
    internal.*.logical.x = x;
    internal.*.logical.y = y;
    internal.*.has_logical_position = @"true" != 0;
}
pub fn handle_xdg_output_logical_size(data: ?*anyopaque, _: ?*struct_zxdg_output_v1_66, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    {
        const ref = &internal.*.geometry_changed;
        ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((internal.*.logical.width != width) or (internal.*.logical.height != height))) != 0;
    }
    internal.*.logical.width = width;
    internal.*.logical.height = height;
    internal.*.has_logical_size = @"true" != 0;
}
pub fn handle_xdg_output_done(data: ?*anyopaque, _: ?*struct_zxdg_output_v1_66) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    if (zxdg_output_v1_get_version(internal.*.xdg_output) < @as(u32, 3)) {
        handle_wl_output_done(data, internal.*.output);
    }
}
pub fn handle_xdg_output_name(data: ?*anyopaque, _: ?*struct_zxdg_output_v1_66, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    if ((wl_output_get_version(internal.*.output) < @as(u32, WL_OUTPUT_NAME_SINCE_VERSION)) and (internal.*.display == @as(SDL_DisplayID, 0))) {
        SDL_free_REAL(@ptrCast(@alignCast(internal.*.wl_output_name)));
        internal.*.wl_output_name = SDL_strdup_REAL(name);
    }
}
pub fn handle_xdg_output_description(data: ?*anyopaque, _: ?*struct_zxdg_output_v1_66, description: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    if ((wl_output_get_version(internal.*.output) < @as(u32, WL_OUTPUT_DESCRIPTION_SINCE_VERSION)) and (internal.*.display == @as(SDL_DisplayID, 0))) {
        SDL_free_REAL(@ptrCast(@alignCast(internal.*.placeholder.name)));
        internal.*.placeholder.name = SDL_strdup_REAL(description);
    }
}
pub const xdg_output_listener: struct_zxdg_output_v1_listener = struct_zxdg_output_v1_listener{
    .logical_position = handle_xdg_output_logical_position,
    .logical_size = handle_xdg_output_logical_size,
    .done = handle_xdg_output_done,
    .name = handle_xdg_output_name,
    .description = handle_xdg_output_description,
};
pub fn AddEmulatedModes(dispdata: [*c]SDL_DisplayData, native_width: c_int, native_height: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const struct_EmulatedMode = extern struct {
        w: c_int = 0,
        h: c_int = 0,
    };
    _ = &struct_EmulatedMode;
    const mode_list: [31]struct_EmulatedMode = [31]struct_EmulatedMode{
        struct_EmulatedMode{
            .w = 7680,
            .h = 4320,
        },
        struct_EmulatedMode{
            .w = 6144,
            .h = 3160,
        },
        struct_EmulatedMode{
            .w = 5120,
            .h = 2880,
        },
        struct_EmulatedMode{
            .w = 4096,
            .h = 2304,
        },
        struct_EmulatedMode{
            .w = 3840,
            .h = 2160,
        },
        struct_EmulatedMode{
            .w = 3200,
            .h = 1800,
        },
        struct_EmulatedMode{
            .w = 2880,
            .h = 1620,
        },
        struct_EmulatedMode{
            .w = 2560,
            .h = 1440,
        },
        struct_EmulatedMode{
            .w = 2048,
            .h = 1152,
        },
        struct_EmulatedMode{
            .w = 1920,
            .h = 1080,
        },
        struct_EmulatedMode{
            .w = 1600,
            .h = 900,
        },
        struct_EmulatedMode{
            .w = 1368,
            .h = 768,
        },
        struct_EmulatedMode{
            .w = 1280,
            .h = 720,
        },
        struct_EmulatedMode{
            .w = 864,
            .h = 486,
        },
        struct_EmulatedMode{
            .w = 2560,
            .h = 1600,
        },
        struct_EmulatedMode{
            .w = 1920,
            .h = 1200,
        },
        struct_EmulatedMode{
            .w = 1680,
            .h = 1050,
        },
        struct_EmulatedMode{
            .w = 1440,
            .h = 900,
        },
        struct_EmulatedMode{
            .w = 1280,
            .h = 800,
        },
        struct_EmulatedMode{
            .w = 720,
            .h = 480,
        },
        struct_EmulatedMode{
            .w = 2048,
            .h = 1536,
        },
        struct_EmulatedMode{
            .w = 1920,
            .h = 1440,
        },
        struct_EmulatedMode{
            .w = 1600,
            .h = 1200,
        },
        struct_EmulatedMode{
            .w = 1440,
            .h = 1080,
        },
        struct_EmulatedMode{
            .w = 1400,
            .h = 1050,
        },
        struct_EmulatedMode{
            .w = 1280,
            .h = 1024,
        },
        struct_EmulatedMode{
            .w = 1280,
            .h = 960,
        },
        struct_EmulatedMode{
            .w = 1152,
            .h = 864,
        },
        struct_EmulatedMode{
            .w = 1024,
            .h = 768,
        },
        struct_EmulatedMode{
            .w = 800,
            .h = 600,
        },
        struct_EmulatedMode{
            .w = 640,
            .h = 480,
        },
    };
    _ = &mode_list;
    var i: c_int = undefined;
    _ = &i;
    var mode: SDL_DisplayMode = undefined;
    _ = &mode;
    var dpy: [*c]SDL_VideoDisplay = if (dispdata.*.display != 0) SDL_GetVideoDisplay(dispdata.*.display) else &dispdata.*.placeholder;
    _ = &dpy;
    const rot_90: bool = native_width < native_height;
    _ = &rot_90;
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(mode_list)) / @sizeOf(@TypeOf(mode_list[@as(c_int, 0)])))) : (i += 1) {
            _ = memset(@ptrCast(@alignCast(&mode)), 0, @sizeOf(@TypeOf(mode)));
            mode.format = dpy.*.desktop_mode.format;
            mode.refresh_rate_numerator = dpy.*.desktop_mode.refresh_rate_numerator;
            mode.refresh_rate_denominator = dpy.*.desktop_mode.refresh_rate_denominator;
            if (rot_90) {
                mode.w = mode_list[@bitCast(@as(isize, @intCast(i)))].h;
                mode.h = mode_list[@bitCast(@as(isize, @intCast(i)))].w;
            } else {
                mode.w = mode_list[@bitCast(@as(isize, @intCast(i)))].w;
                mode.h = mode_list[@bitCast(@as(isize, @intCast(i)))].h;
            }
            if ((((mode.w < native_width) and (mode.h < native_height)) or ((mode.w < native_width) and (mode.h == native_height))) or ((mode.w == native_width) and (mode.h < native_height))) {
                _ = SDL_AddFullscreenDisplayMode(dpy, &mode);
            }
        }
    }
}
pub fn handle_wl_output_geometry(data: ?*anyopaque, _: ?*struct_wl_output_65, x: c_int, y: c_int, physical_width: c_int, physical_height: c_int, _: c_int, _: [*c]const u8, model: [*c]const u8, transform: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = undefined;
    _ = &internal;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                internal = @ptrCast(@alignCast(data));
                if (!internal.*.has_logical_position) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                {
                    const ref = &internal.*.geometry_changed;
                    ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((internal.*.logical.x != x) or (internal.*.logical.y != y))) != 0;
                }
                internal.*.logical.x = x;
                internal.*.logical.y = y;
                {
                    sdl_pc = 3;
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
                internal.*.physical.width_mm = physical_width;
                internal.*.physical.height_mm = physical_height;
                if ((internal.*.display == @as(SDL_DisplayID, 0)) and !(internal.*.placeholder.name != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                internal.*.placeholder.name = SDL_strdup_REAL(model);
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
                internal.*.transform = transform;
                if (internal.*.physical.width_mm >= internal.*.physical.height_mm) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                switch (transform) {
                    WL_OUTPUT_TRANSFORM_NORMAL => {
                        sdl_pc = 11;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_90 => {
                        sdl_pc = 12;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_180 => {
                        sdl_pc = 13;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_270 => {
                        sdl_pc = 14;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED => {
                        sdl_pc = 15;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_90 => {
                        sdl_pc = 16;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_180 => {
                        sdl_pc = 17;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_270 => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            8 => {
                switch (transform) {
                    WL_OUTPUT_TRANSFORM_NORMAL => {
                        sdl_pc = 20;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_90 => {
                        sdl_pc = 21;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_180 => {
                        sdl_pc = 22;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_270 => {
                        sdl_pc = 23;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED => {
                        sdl_pc = 24;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_90 => {
                        sdl_pc = 25;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_180 => {
                        sdl_pc = 26;
                        continue;
                    },
                    WL_OUTPUT_TRANSFORM_FLIPPED_270 => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            9 => {
                {}
            },
            10 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE_FLIPPED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT_FLIPPED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE_FLIPPED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT_FLIPPED;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            20 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            21 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            22 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT_FLIPPED;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE_FLIPPED;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            24 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT_FLIPPED;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            25 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE_FLIPPED;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                internal.*.orientation = SDL_ORIENTATION_PORTRAIT;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            27 => {
                internal.*.orientation = SDL_ORIENTATION_LANDSCAPE;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn handle_wl_output_mode(data: ?*anyopaque, _: ?*struct_wl_output_65, flags: u32, width: c_int, height: c_int, refresh: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    if ((flags & @as(u32, WL_OUTPUT_MODE_CURRENT)) != 0) {
        {
            const ref = &internal.*.geometry_changed;
            ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((internal.*.pixel.width != width) or (internal.*.pixel.height != height))) != 0;
        }
        internal.*.pixel.width = width;
        internal.*.pixel.height = height;
        if (!internal.*.has_logical_size) {
            {
                const ref = &internal.*.geometry_changed;
                ref.* = (@as(c_int, @intFromBool(ref.*)) | @intFromBool((internal.*.logical.width != width) or (internal.*.logical.height != height))) != 0;
            }
            internal.*.logical.width = width;
            internal.*.logical.height = height;
        }
        internal.*.refresh = refresh;
    }
}
pub fn handle_wl_output_done(data: ?*anyopaque, _: ?*struct_wl_output_65) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const mode_emulation_enabled: bool = SDL_GetHintBoolean_REAL("SDL_VIDEO_WAYLAND_MODE_EMULATION", @"true" != 0);
    _ = &mode_emulation_enabled;
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    var video: [*c]SDL_VideoData = internal.*.videodata;
    _ = &video;
    var native_mode: SDL_DisplayMode = undefined;
    _ = &native_mode;
    var desktop_mode: SDL_DisplayMode = undefined;
    _ = &desktop_mode;
    const event_await_count: c_int = @as(c_int, 1) + @intFromBool(@as(?*anyopaque, @ptrCast(@alignCast(internal.*.xdg_output))) != @as(?*anyopaque, null));
    _ = &event_await_count;
    internal.*.wl_output_done_count = if ((internal.*.wl_output_done_count + @as(c_int, 1)) < (event_await_count + @as(c_int, 1))) internal.*.wl_output_done_count + @as(c_int, 1) else event_await_count + @as(c_int, 1);
    if (internal.*.wl_output_done_count < event_await_count) {
        return;
    }
    var dpy: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(internal.*.display);
    _ = &dpy;
    if (dpy != null) {
        SDL_ResetFullscreenDisplayModes(dpy);
    }
    _ = memset(@ptrCast(@alignCast(&native_mode)), 0, @sizeOf(@TypeOf(native_mode)));
    native_mode.format = SDL_PIXELFORMAT_XRGB8888;
    if ((internal.*.transform & WL_OUTPUT_TRANSFORM_90) != 0) {
        native_mode.w = internal.*.pixel.height;
        native_mode.h = internal.*.pixel.width;
    } else {
        native_mode.w = internal.*.pixel.width;
        native_mode.h = internal.*.pixel.height;
    }
    native_mode.refresh_rate_numerator = internal.*.refresh;
    native_mode.refresh_rate_denominator = 1000;
    if (internal.*.has_logical_size) {
        if ((native_mode.w != internal.*.logical.width) or (native_mode.h != internal.*.logical.height)) {
            if (video.*.viewporter != null) {
                internal.*.scale_factor = @as(f64, @floatFromInt(native_mode.w)) / @as(f64, @floatFromInt(internal.*.logical.width));
            } else {
                internal.*.scale_factor = @floatFromInt(internal.*.integer_scale_factor);
                internal.*.pixel.width = internal.*.logical.width * internal.*.integer_scale_factor;
                internal.*.pixel.height = internal.*.logical.height * internal.*.integer_scale_factor;
            }
        } else {
            internal.*.scale_factor = @floatFromInt(internal.*.integer_scale_factor);
            {
                const ref = &internal.*.logical.width;
                ref.* = @divTrunc(ref.*, internal.*.integer_scale_factor);
            }
            {
                const ref = &internal.*.logical.height;
                ref.* = @divTrunc(ref.*, internal.*.integer_scale_factor);
            }
        }
    } else {
        internal.*.scale_factor = @floatFromInt(internal.*.integer_scale_factor);
        internal.*.logical.width = @divTrunc(native_mode.w, internal.*.integer_scale_factor);
        internal.*.logical.height = @divTrunc(native_mode.h, internal.*.integer_scale_factor);
    }
    _ = memset(@ptrCast(@alignCast(&desktop_mode)), 0, @sizeOf(@TypeOf(desktop_mode)));
    desktop_mode.format = SDL_PIXELFORMAT_XRGB8888;
    if (!video.*.scale_to_display_enabled) {
        desktop_mode.w = internal.*.logical.width;
        desktop_mode.h = internal.*.logical.height;
        desktop_mode.pixel_density = @floatCast(internal.*.scale_factor);
    } else {
        desktop_mode.w = native_mode.w;
        desktop_mode.h = native_mode.h;
        desktop_mode.pixel_density = 1.0;
    }
    desktop_mode.refresh_rate_numerator = internal.*.refresh;
    desktop_mode.refresh_rate_denominator = 1000;
    if (internal.*.display > @as(SDL_DisplayID, 0)) {
        dpy = SDL_GetVideoDisplay(internal.*.display);
    } else {
        dpy = &internal.*.placeholder;
    }
    if (video.*.scale_to_display_enabled) {
        SDL_SetDisplayContentScale(dpy, @floatCast(internal.*.scale_factor));
    }
    SDL_SetDesktopDisplayMode(dpy, &desktop_mode);
    if ((internal.*.scale_factor == @as(f64, 1.0)) or (video.*.viewporter != null)) {
        _ = SDL_AddFullscreenDisplayMode(dpy, &native_mode);
        if ((native_mode.w != desktop_mode.w) or (native_mode.h != desktop_mode.h)) {
            _ = SDL_AddFullscreenDisplayMode(dpy, &desktop_mode);
        }
    } else {
        desktop_mode.pixel_density = 1.0;
        {
            var i: c_int = @intFromFloat(internal.*.scale_factor);
            _ = &i;
            while (i > @as(c_int, 0)) : (i -= 1) {
                desktop_mode.w = internal.*.logical.width * i;
                desktop_mode.h = internal.*.logical.height * i;
                _ = SDL_AddFullscreenDisplayMode(dpy, &desktop_mode);
            }
        }
    }
    if ((video.*.viewporter != null) and mode_emulation_enabled) {
        AddEmulatedModes(internal, native_mode.w, native_mode.h);
    }
    if (internal.*.display == @as(SDL_DisplayID, 0)) {
        if (internal.*.physical.width_mm >= internal.*.physical.height_mm) {
            internal.*.placeholder.natural_orientation = SDL_ORIENTATION_LANDSCAPE;
        } else {
            internal.*.placeholder.natural_orientation = SDL_ORIENTATION_PORTRAIT;
        }
        internal.*.placeholder.current_orientation = internal.*.orientation;
        internal.*.placeholder.internal = internal;
        internal.*.placeholder.props = SDL_CreateProperties_REAL();
        _ = SDL_SetPointerProperty_REAL(internal.*.placeholder.props, "SDL.display.wayland.wl_output", @ptrCast(@alignCast(internal.*.output)));
        if (!video.*.initializing) {
            if (video.*.wp_color_manager_v1 != null) {
                Wayland_GetColorInfoForOutput(internal, @"false" != 0);
            }
            if (video.*.scale_to_display_enabled) {
                Wayland_DeriveOutputPixelCoordinates(video);
            }
            internal.*.display = SDL_AddVideoDisplay(&internal.*.placeholder, @"true" != 0);
            Wayland_RefreshWindowPositions();
            SDL_free_REAL(@ptrCast(@alignCast(internal.*.placeholder.name)));
            _ = memset(@ptrCast(@alignCast(&internal.*.placeholder)), 0, @sizeOf(@TypeOf(internal.*.placeholder)));
        }
    } else {
        SDL_SendDisplayEvent(dpy, SDL_EVENT_DISPLAY_ORIENTATION, @bitCast(internal.*.orientation), 0);
        if (internal.*.geometry_changed) {
            if (video.*.scale_to_display_enabled) {
                Wayland_DeriveOutputPixelCoordinates(video);
            }
            SDL_SendDisplayEvent(dpy, SDL_EVENT_DISPLAY_MOVED, 0, 0);
            Wayland_RefreshWindowPositions();
        }
    }
    internal.*.geometry_changed = @"false" != 0;
}
pub fn handle_wl_output_scale(data: ?*anyopaque, _: ?*struct_wl_output_65, factor: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    internal.*.integer_scale_factor = factor;
}
pub fn handle_wl_output_name(data: ?*anyopaque, _: ?*struct_wl_output_65, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    SDL_free_REAL(@ptrCast(@alignCast(internal.*.wl_output_name)));
    internal.*.wl_output_name = SDL_strdup_REAL(name);
}
pub fn handle_wl_output_description(data: ?*anyopaque, _: ?*struct_wl_output_65, description: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &internal;
    if (internal.*.display == @as(SDL_DisplayID, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(internal.*.placeholder.name)));
        internal.*.placeholder.name = SDL_strdup_REAL(description);
    }
}
pub const output_listener: struct_wl_output_listener = struct_wl_output_listener{
    .geometry = handle_wl_output_geometry,
    .mode = handle_wl_output_mode,
    .done = handle_wl_output_done,
    .scale = handle_wl_output_scale,
    .name = handle_wl_output_name,
    .description = handle_wl_output_description,
};
pub fn handle_output_image_description_changed(data: ?*anyopaque, _: ?*struct_wp_color_management_output_v1_67) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_DisplayData = @ptrCast(@alignCast(data));
    _ = &display;
    Wayland_GetColorInfoForOutput(display, @"false" != 0);
}
pub const wp_color_management_output_listener: struct_wp_color_management_output_v1_listener = struct_wp_color_management_output_v1_listener{
    .image_description_changed = handle_output_image_description_changed,
};
pub fn Wayland_add_display(d: [*c]SDL_VideoData, id: u32, version: u32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var output: ?*struct_wl_output_65 = undefined;
    _ = &output;
    var data: [*c]SDL_DisplayData = undefined;
    _ = &data;
    output = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_output_interface, version)));
    if (!(output != null)) {
        return SDL_SetError_REAL("Failed to retrieve output.");
    }
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    data.*.videodata = d;
    data.*.output = output;
    data.*.registry_id = id;
    data.*.scale_factor = @floatCast(@as(f32, 1.0));
    data.*.integer_scale_factor = 1;
    _ = wl_output_add_listener(output, &output_listener, @ptrCast(@alignCast(data)));
    SDL_WAYLAND_register_output(output);
    if (d.*.output_count == d.*.output_max) {
        d.*.output_max += 4;
        d.*.output_list = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(d.*.output_list)), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, d.*.output_max))))));
    }
    d.*.output_list[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &d.*.output_count;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = data;
    if (data.*.videodata.*.xdg_output_manager != null) {
        data.*.xdg_output = zxdg_output_manager_v1_get_xdg_output(data.*.videodata.*.xdg_output_manager, output);
        _ = zxdg_output_v1_add_listener(data.*.xdg_output, &xdg_output_listener, @ptrCast(@alignCast(data)));
    }
    if (data.*.videodata.*.wp_color_manager_v1 != null) {
        data.*.wp_color_management_output = wp_color_manager_v1_get_output(data.*.videodata.*.wp_color_manager_v1, output);
        _ = wp_color_management_output_v1_add_listener(data.*.wp_color_management_output, &wp_color_management_output_listener, @ptrCast(@alignCast(data)));
        if (d.*.initializing) {
            Wayland_GetColorInfoForOutput(data, @"true" != 0);
        }
    }
    return @"true" != 0;
}
pub fn Wayland_free_display(display: [*c]SDL_VideoDisplay, send_event: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (display != null) {
        var display_data: [*c]SDL_DisplayData = display.*.internal;
        _ = &display_data;
        {
            var window: [*c]SDL_Window = SDL_GetVideoDevice().*.windows;
            _ = &window;
            while (window != null) : (window = window.*.next) {
                Wayland_RemoveOutputFromWindow(window.*.internal, display_data);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(display_data.*.wl_output_name)));
        if (display_data.*.wp_color_management_output != null) {
            Wayland_FreeColorInfoState(display_data.*.color_info_state);
            wp_color_management_output_v1_destroy(display_data.*.wp_color_management_output);
        }
        if (display_data.*.xdg_output != null) {
            zxdg_output_v1_destroy(display_data.*.xdg_output);
        }
        if (wl_output_get_version(display_data.*.output) >= @as(u32, WL_OUTPUT_RELEASE_SINCE_VERSION)) {
            wl_output_release(display_data.*.output);
        } else {
            wl_output_destroy(display_data.*.output);
        }
        SDL_DelVideoDisplay(display.*.id, send_event);
    }
}
pub fn Wayland_FinalizeDisplays(vid: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Wayland_SortOutputs(vid);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vid.*.output_count) : (i += 1) {
            var d: [*c]SDL_DisplayData = vid.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &d;
            d.*.display = SDL_AddVideoDisplay(&d.*.placeholder, @"false" != 0);
            SDL_free_REAL(@ptrCast(@alignCast(d.*.placeholder.name)));
            _ = memset(@ptrCast(@alignCast(&d.*.placeholder)), 0, @sizeOf(@TypeOf(d.*.placeholder)));
        }
    }
}
pub fn Wayland_init_xdg_output(d: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < d.*.output_count) : (i += 1) {
            var disp: [*c]SDL_DisplayData = d.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &disp;
            disp.*.xdg_output = zxdg_output_manager_v1_get_xdg_output(disp.*.videodata.*.xdg_output_manager, disp.*.output);
            _ = zxdg_output_v1_add_listener(disp.*.xdg_output, &xdg_output_listener, @ptrCast(@alignCast(disp)));
        }
    }
}
pub fn Wayland_InitColorManager(d: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < d.*.output_count) : (i += 1) {
            var disp: [*c]SDL_DisplayData = d.*.output_list[@bitCast(@as(isize, @intCast(i)))];
            _ = &disp;
            disp.*.wp_color_management_output = wp_color_manager_v1_get_output(disp.*.videodata.*.wp_color_manager_v1, disp.*.output);
            _ = wp_color_management_output_v1_add_listener(disp.*.wp_color_management_output, &wp_color_management_output_listener, @ptrCast(@alignCast(disp)));
            Wayland_GetColorInfoForOutput(disp, @"true" != 0);
        }
    }
}
pub fn handle_xdg_session_created(_: ?*anyopaque, _: ?*struct_xdg_session_v1_43, id: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.session_id", id);
}
pub fn handle_xdg_session_restored(_: ?*anyopaque, _: ?*struct_xdg_session_v1_43) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn handle_xdg_session_replaced(data: ?*anyopaque, _: ?*struct_xdg_session_v1_43) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddev: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &viddev;
    var viddata: [*c]SDL_VideoData = @ptrCast(@alignCast(data));
    _ = &viddata;
    _ = SDL_SetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.session_id", null);
    {
        var w: [*c]SDL_Window = viddev.*.windows;
        _ = &w;
        while (w != null) : (w = w.*.next) {
            var d: [*c]SDL_WindowData = w.*.internal;
            _ = &d;
            if (d.*.xdg_toplevel_session != null) {
                xdg_toplevel_session_v1_destroy(d.*.xdg_toplevel_session);
                d.*.xdg_toplevel_session = null;
                SDL_free_REAL(@ptrCast(@alignCast(d.*.session_id)));
                d.*.session_id = null;
            }
        }
    }
    if (viddata.*.xdg_session != null) {
        xdg_session_v1_destroy(viddata.*.xdg_session);
        viddata.*.xdg_session = null;
    }
}
pub const xdg_session_listener: struct_xdg_session_v1_listener = struct_xdg_session_v1_listener{
    .created = handle_xdg_session_created,
    .restored = handle_xdg_session_restored,
    .replaced = handle_xdg_session_replaced,
};
pub export fn Wayland_CreateSession(viddata: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    if (!(viddata.*.xdg_session_manager != null)) {
        _ = SDL_SetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.session_id", null);
        return;
    }
    if (!(viddata.*.xdg_session != null)) {
        var session_id: [*c]const u8 = SDL_GetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.session_id", null);
        _ = &session_id;
        if (session_id != null) {
            if (@as(c_int, session_id.*) == @as(c_int, '\x00')) {
                session_id = null;
            }
            const reason: enum_xdg_session_manager_v1_reason = @bitCast(if (session_id != null) XDG_SESSION_MANAGER_V1_REASON_SESSION_RESTORE else XDG_SESSION_MANAGER_V1_REASON_LAUNCH);
            _ = &reason;
            viddata.*.xdg_session = xdg_session_manager_v1_get_session(viddata.*.xdg_session_manager, reason, session_id);
            _ = xdg_session_v1_add_listener(viddata.*.xdg_session, &xdg_session_listener, @ptrCast(@alignCast(viddata)));
        }
    }
}
pub fn Wayland_SessionDestroy(viddata: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (viddata.*.xdg_session != null) {
        var session_id: [*c]const u8 = SDL_GetStringProperty_REAL(SDL_GetGlobalProperties_REAL(), "SDL.video.wayland.session_id", null);
        _ = &session_id;
        if (!(session_id != null) or (@as(c_int, session_id.*) == @as(c_int, '\x00'))) {
            xdg_session_v1_remove(viddata.*.xdg_session);
            _ = WAYLAND_wl_display_roundtrip.?(viddata.*.display);
        } else {
            xdg_session_v1_destroy(viddata.*.xdg_session);
        }
        viddata.*.xdg_session = null;
    }
}
pub fn handle_xdg_wm_base_ping(_: ?*anyopaque, xdg: ?*struct_xdg_wm_base_13, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    xdg_wm_base_pong(xdg, serial);
}
pub const _xdg_wm_base_listener: struct_xdg_wm_base_listener = struct_xdg_wm_base_listener{
    .ping = handle_xdg_wm_base_ping,
};
pub fn libdecor_error(_: ?*struct_libdecor_14, arg_error: enum_libdecor_error, message: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"error" = arg_error;
    _ = &@"error";
    SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "libdecor error (%d): %s", @"error", message);
}
pub var libdecor_interface: struct_libdecor_interface = struct_libdecor_interface{
    .@"error" = libdecor_error,
    .reserved0 = null,
    .reserved1 = null,
    .reserved2 = null,
    .reserved3 = null,
    .reserved4 = null,
    .reserved5 = null,
    .reserved6 = null,
    .reserved7 = null,
    .reserved8 = null,
    .reserved9 = null,
};
pub fn handle_registry_global(data: ?*anyopaque, registry: ?*struct_wl_registry_9, id: u32, interface: [*c]const u8, arg_version: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var version = arg_version;
    _ = &version;
    var d: [*c]SDL_VideoData = @ptrCast(@alignCast(data));
    _ = &d;
    if (SDL_strcmp_REAL(interface, wl_compositor_interface.name) == @as(c_int, 0)) {
        d.*.compositor = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_compositor_interface, if (@as(u32, @bitCast(@as(c_int, SDL_WL_COMPOSITOR_VERSION))) < version) @as(u32, @bitCast(@as(c_int, SDL_WL_COMPOSITOR_VERSION))) else version)));
    } else if (SDL_strcmp_REAL(interface, wl_subcompositor_interface.name) == @as(c_int, 0)) {
        d.*.subcompositor = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_subcompositor_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, wl_output_interface.name) == @as(c_int, 0)) {
        _ = Wayland_add_display(d, id, if (version < @as(u32, @bitCast(@as(c_int, SDL_WL_OUTPUT_VERSION)))) version else @as(u32, @bitCast(@as(c_int, SDL_WL_OUTPUT_VERSION))));
    } else if (SDL_strcmp_REAL(interface, wl_seat_interface.name) == @as(c_int, 0)) {
        var seat: ?*struct_wl_seat = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_seat_interface, if (@as(u32, @bitCast(@as(c_int, SDL_WL_SEAT_VERSION))) < version) @as(u32, @bitCast(@as(c_int, SDL_WL_SEAT_VERSION))) else version)));
        _ = &seat;
        Wayland_DisplayCreateSeat(d, seat, id);
    } else if (SDL_strcmp_REAL(interface, xdg_wm_base_interface.name) == @as(c_int, 0)) {
        d.*.shell.xdg = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_wm_base_interface, if (version < @as(u32, @bitCast(@as(c_int, @as(c_int, 7))))) version else @as(u32, @bitCast(@as(c_int, @as(c_int, 7)))))));
        _ = xdg_wm_base_add_listener(d.*.shell.xdg, &_xdg_wm_base_listener, null);
    } else if (SDL_strcmp_REAL(interface, wl_shm_interface.name) == @as(c_int, 0)) {
        d.*.shm = @ptrCast(@alignCast(wl_registry_bind(registry, id, &wl_shm_interface, if (@as(u32, @bitCast(@as(c_int, SDL_WL_SHM_VERSION))) < version) @as(u32, @bitCast(@as(c_int, SDL_WL_SHM_VERSION))) else version)));
    } else if (SDL_strcmp_REAL(interface, zwp_relative_pointer_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.relative_pointer_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_relative_pointer_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_pointer_constraints_v1_interface.name) == @as(c_int, 0)) {
        d.*.pointer_constraints = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_pointer_constraints_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_keyboard_shortcuts_inhibit_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.key_inhibitor_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_keyboard_shortcuts_inhibit_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_idle_inhibit_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.idle_inhibit_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_idle_inhibit_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, xdg_activation_v1_interface.name) == @as(c_int, 0)) {
        d.*.activation_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_activation_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_text_input_manager_v3_interface.name) == @as(c_int, 0)) {
        d.*.text_input_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_text_input_manager_v3_interface, 1)));
        Wayland_DisplayInitTextInputManager(d, id);
    } else if (SDL_strcmp_REAL(interface, wl_data_device_manager_interface.name) == @as(c_int, 0)) {
        d.*.data_device_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_data_device_manager_interface, if (@as(u32, @bitCast(@as(c_int, @as(c_int, 3)))) < version) @as(u32, @bitCast(@as(c_int, @as(c_int, 3)))) else version)));
        Wayland_DisplayInitDataDeviceManager(d);
    } else if (SDL_strcmp_REAL(interface, zwp_primary_selection_device_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.primary_selection_device_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_primary_selection_device_manager_v1_interface, 1)));
        Wayland_DisplayInitPrimarySelectionDeviceManager(d);
    } else if (SDL_strcmp_REAL(interface, zxdg_decoration_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.decoration_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zxdg_decoration_manager_v1_interface, if (@as(u32, @bitCast(@as(c_int, @as(c_int, 2)))) < version) @as(u32, @bitCast(@as(c_int, @as(c_int, 2)))) else version)));
    } else if (SDL_strcmp_REAL(interface, zwp_tablet_manager_v2_interface.name) == @as(c_int, 0)) {
        d.*.tablet_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_tablet_manager_v2_interface, 1)));
        Wayland_DisplayInitTabletManager(d);
    } else if (SDL_strcmp_REAL(interface, zxdg_output_manager_v1_interface.name) == @as(c_int, 0)) {
        version = if (version < @as(u32, @bitCast(@as(c_int, @as(c_int, 3))))) version else @as(u32, @bitCast(@as(c_int, @as(c_int, 3))));
        d.*.xdg_output_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zxdg_output_manager_v1_interface, version)));
        Wayland_init_xdg_output(d);
    } else if (SDL_strcmp_REAL(interface, wp_viewporter_interface.name) == @as(c_int, 0)) {
        d.*.viewporter = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_viewporter_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, wp_fractional_scale_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.fractional_scale_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_fractional_scale_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_input_timestamps_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.input_timestamps_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_input_timestamps_manager_v1_interface, 1)));
        Wayland_DisplayInitInputTimestampManager(d);
    } else if (SDL_strcmp_REAL(interface, wp_cursor_shape_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.cursor_shape_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_cursor_shape_manager_v1_interface, if (version < @as(u32, @bitCast(@as(c_int, @as(c_int, 2))))) version else @as(u32, @bitCast(@as(c_int, @as(c_int, 2)))))));
        Wayland_DisplayInitCursorShapeManager(d);
    } else if (SDL_strcmp_REAL(interface, zxdg_exporter_v2_interface.name) == @as(c_int, 0)) {
        d.*.zxdg_exporter_v2 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zxdg_exporter_v2_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, xdg_wm_dialog_v1_interface.name) == @as(c_int, 0)) {
        d.*.xdg_wm_dialog_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_wm_dialog_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, wp_alpha_modifier_v1_interface.name) == @as(c_int, 0)) {
        d.*.wp_alpha_modifier_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_alpha_modifier_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, xdg_toplevel_icon_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.xdg_toplevel_icon_manager_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_toplevel_icon_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, frog_color_management_factory_v1_interface.name) == @as(c_int, 0)) {
        d.*.frog_color_management_factory_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &frog_color_management_factory_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, wp_color_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.wp_color_manager_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_color_manager_v1_interface, if (version < @as(u32, @bitCast(@as(c_int, @as(c_int, 2))))) version else @as(u32, @bitCast(@as(c_int, @as(c_int, 2)))))));
        Wayland_InitColorManager(d);
    } else if (SDL_strcmp_REAL(interface, wp_pointer_warp_v1_interface.name) == @as(c_int, 0)) {
        d.*.wp_pointer_warp_v1 = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_pointer_warp_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, zwp_pointer_gestures_v1_interface.name) == @as(c_int, 0)) {
        d.*.zwp_pointer_gestures = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &zwp_pointer_gestures_v1_interface, if (version < @as(u32, @bitCast(@as(c_int, @as(c_int, 3))))) version else @as(u32, @bitCast(@as(c_int, @as(c_int, 3)))))));
        Wayland_DisplayInitPointerGestureManager(d);
    } else if (SDL_strcmp_REAL(interface, wp_single_pixel_buffer_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.single_pixel_buffer_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wp_single_pixel_buffer_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, xdg_session_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.xdg_session_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_session_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, xdg_toplevel_tag_manager_v1_interface.name) == @as(c_int, 0)) {
        d.*.xdg_toplevel_tag_manager = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &xdg_toplevel_tag_manager_v1_interface, 1)));
    } else if (SDL_strcmp_REAL(interface, wl_fixes_interface.name) == @as(c_int, 0)) {
        d.*.wl_fixes = @ptrCast(@alignCast(wl_registry_bind(d.*.registry, id, &wl_fixes_interface, if (@as(u32, @bitCast(@as(c_int, SDL_WL_FIXES_VERSION))) < version) @as(u32, @bitCast(@as(c_int, SDL_WL_FIXES_VERSION))) else version)));
    }
}
pub fn handle_registry_remove_global(data: ?*anyopaque, registry: ?*struct_wl_registry_9, id: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var d: [*c]SDL_VideoData = undefined;
    _ = &d;
    var i: c_int = undefined;
    _ = &i;
    var disp: [*c]SDL_DisplayData = undefined;
    _ = &disp;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var temp: [*c]SDL_WaylandSeat = undefined;
    _ = &temp;
    seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
    seat = temp;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                d = @ptrCast(@alignCast(data));
                i = 0;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                if ((d.*.wl_fixes != null) and (wl_fixes_get_version(d.*.wl_fixes) >= @as(u32, WL_FIXES_ACK_GLOBAL_REMOVE_SINCE_VERSION))) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            2 => {
                if (i < d.*.output_count) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                disp = d.*.output_list[@bitCast(@as(isize, @intCast(i)))];
                if (disp.*.registry_id == id) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            4 => {
                i += 1;
                {
                    sdl_pc = 2;
                    continue;
                }
            },
            5 => {
                temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            6 => {
                Wayland_free_display(SDL_GetVideoDisplay(disp.*.display), @"true" != 0);
                if (i < d.*.output_count) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                _ = memmove(@ptrCast(@alignCast(&d.*.output_list[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&d.*.output_list[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, (d.*.output_count - i) - @as(c_int, 1)))));
                {
                    sdl_pc = 11;
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
                d.*.output_count -= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                if ((&seat.*.link) != (&d.*.seat_list)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (seat.*.registry_id == id) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                Wayland_SeatDestroy(seat, @"false" != 0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            19 => {
                wl_fixes_ack_global_remove(d.*.wl_fixes, registry, id);
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub const registry_listener: struct_wl_registry_listener = struct_wl_registry_listener{
    .global = handle_registry_global,
    .global_remove = handle_registry_remove_global,
};
pub fn should_use_libdecor(data: [*c]SDL_VideoData, ignore_xdg: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR != 0)) {
        return @"false" != 0;
    }
    if (SDL_GetHintBoolean_REAL("SDL_VIDEO_WAYLAND_PREFER_LIBDECOR", @"false" != 0)) {
        return @"true" != 0;
    }
    if (ignore_xdg) {
        return @"true" != 0;
    }
    if (data.*.decoration_manager != null) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn LibdecorNew(data: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.shell.libdecor = WAYLAND_libdecor_new.?(data.*.display, &libdecor_interface);
}
pub fn LibdecorNewInThread(data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    LibdecorNew(@ptrCast(@alignCast(data)));
    return 0;
}
pub export fn CanUseGtk() bool {
    @setEvalBranchQuota(100000);
    var ruid: uid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &ruid;
    var euid: uid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &euid;
    var suid: uid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &suid;
    var rgid: gid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &rgid;
    var egid: gid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &egid;
    var sgid: gid_t = @bitCast(@as(c_int, -@as(c_int, 1)));
    _ = &sgid;
    if (!SDL_GetHintBoolean_REAL("SDL_ENABLE_GTK", @"true" != 0)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_SYSTEM, "Not using GTK due to hint");
        return @"false" != 0;
    }
    if (getresuid(&ruid, &euid, &suid) != @as(c_int, 0)) {
        ruid = blk: {
            const tmp = getuid();
            suid = tmp;
            break :blk tmp;
        };
        euid = geteuid();
    }
    if (getresgid(&rgid, &egid, &sgid) != @as(c_int, 0)) {
        rgid = blk: {
            const tmp = getgid();
            sgid = tmp;
            break :blk tmp;
        };
        egid = getegid();
    }
    if ((ruid != euid) or (rgid != egid)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_SYSTEM, "Not using GTK due to setuid/setgid");
        return @"false" != 0;
    }
    if ((ruid != suid) or (rgid != sgid)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_SYSTEM, "Not using GTK due to saved uid/gid");
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn Wayland_LoadLibdecor(data: [*c]SDL_VideoData, ignore_xdg: bool) bool {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(data.*.shell.libdecor))) != @as(?*anyopaque, null)) {
        return @"true" != 0;
    }
    if (should_use_libdecor(data, ignore_xdg)) {
        if (CanUseGtk()) {
            LibdecorNew(data);
        } else {
            var thread: ?*SDL_Thread = SDL_CreateThreadRuntime_REAL(LibdecorNewInThread, "SDL_LibdecorNew", @as(?*anyopaque, @ptrCast(@alignCast(data))), null, null);
            _ = &thread;
            SDL_WaitThread_REAL(thread, null);
        }
        return @as(?*anyopaque, @ptrCast(@alignCast(data.*.shell.libdecor))) != @as(?*anyopaque, null);
    }
    return @"false" != 0;
}
pub export fn Wayland_VideoInit(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    data.*.event_thread_context = Wayland_CreateEventThread(data, "SDL Event Thread Queue");
    if (!(data.*.event_thread_context != null)) {
        SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "wayland: Failed to create event thread context");
    }
    data.*.xkb_context = WAYLAND_xkb_context_new.?(0);
    if (!(data.*.xkb_context != null)) {
        return SDL_SetError_REAL("Failed to create XKB context");
    }
    data.*.registry = wl_display_get_registry(data.*.display);
    if (!(data.*.registry != null)) {
        return SDL_SetError_REAL("Failed to get the Wayland registry");
    }
    _ = wl_registry_add_listener(data.*.registry, &registry_listener, @ptrCast(@alignCast(data)));
    _ = WAYLAND_wl_display_roundtrip.?(data.*.display);
    if (data.*.scale_to_display_enabled) {
        if (!(data.*.viewporter != null)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "wayland: Display scaling requires the missing 'wp_viewporter' protocol: disabling");
            data.*.scale_to_display_enabled = @"false" != 0;
        }
        if (!(data.*.xdg_output_manager != null)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "wayland: Display scaling requires the missing 'zxdg_output_manager_v1' protocol: disabling");
            data.*.scale_to_display_enabled = @"false" != 0;
        }
    }
    _ = Wayland_LoadLibdecor(data, @"false" != 0);
    _ = WAYLAND_wl_display_roundtrip.?(data.*.display);
    Wayland_FinalizeDisplays(data);
    Wayland_InitMouse(data);
    _ = Wayland_InitKeyboard(_this);
    if (data.*.primary_selection_device_manager != null) {
        _this.*.SetPrimarySelectionText = Wayland_SetPrimarySelectionText;
        _this.*.GetPrimarySelectionText = Wayland_GetPrimarySelectionText;
        _this.*.HasPrimarySelectionText = Wayland_HasPrimarySelectionText;
    }
    data.*.initializing = @"false" != 0;
    return @"true" != 0;
}
pub fn Wayland_GetDisplayBounds(_this: [*c]SDL_VideoDevice, display: [*c]SDL_VideoDisplay, rect: [*c]SDL_Rect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var internal: [*c]SDL_DisplayData = display.*.internal;
    _ = &internal;
    if (!viddata.*.scale_to_display_enabled) {
        rect.*.x = internal.*.logical.x;
        rect.*.y = internal.*.logical.y;
    } else {
        rect.*.x = internal.*.pixel.x;
        rect.*.y = internal.*.pixel.y;
    }
    if (((((display.*.fullscreen_window != null) and display.*.fullscreen_window.*.fullscreen_exclusive) and display.*.fullscreen_window.*.internal.*.active) and (display.*.fullscreen_window.*.current_fullscreen_mode.w != @as(c_int, 0))) and (display.*.fullscreen_window.*.current_fullscreen_mode.h != @as(c_int, 0))) {
        rect.*.w = display.*.fullscreen_window.*.current_fullscreen_mode.w;
        rect.*.h = display.*.fullscreen_window.*.current_fullscreen_mode.h;
    } else {
        if (!viddata.*.scale_to_display_enabled) {
            rect.*.w = display.*.current_mode.*.w;
            rect.*.h = display.*.current_mode.*.h;
        } else if ((internal.*.transform & WL_OUTPUT_TRANSFORM_90) != 0) {
            rect.*.w = internal.*.pixel.height;
            rect.*.h = internal.*.pixel.width;
        } else {
            rect.*.w = internal.*.pixel.width;
            rect.*.h = internal.*.pixel.height;
        }
    }
    return @"true" != 0;
}
pub fn Wayland_VideoCleanup(_this: [*c]SDL_VideoDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var tmp: [*c]SDL_WaylandSeat = undefined;
    _ = &tmp;
    Wayland_SessionDestroy(data);
    {
        var i: c_int = _this.*.num_displays - @as(c_int, 1);
        _ = &i;
        while (i >= @as(c_int, 0)) : (i -= 1) {
            var display: [*c]SDL_VideoDisplay = _this.*.displays[@bitCast(@as(isize, @intCast(i)))];
            _ = &display;
            Wayland_free_display(display, @"false" != 0);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(data.*.output_list)));
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&data.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        tmp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tmp.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&data.*.seat_list)) : ({
            seat = tmp;
            tmp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tmp.*), @ptrFromInt(0)).link)));
        }) {
            Wayland_SeatDestroy(seat, @"true" != 0);
        }
    }
    Wayland_FiniMouse(data);
    Wayland_QuitKeyboard(_this);
    Wayland_DestroyEventThread(data.*.event_thread_context);
    data.*.event_thread_context = null;
    if (data.*.pointer_constraints != null) {
        zwp_pointer_constraints_v1_destroy(data.*.pointer_constraints);
        data.*.pointer_constraints = null;
    }
    if (data.*.relative_pointer_manager != null) {
        zwp_relative_pointer_manager_v1_destroy(data.*.relative_pointer_manager);
        data.*.relative_pointer_manager = null;
    }
    if (data.*.activation_manager != null) {
        xdg_activation_v1_destroy(data.*.activation_manager);
        data.*.activation_manager = null;
    }
    if (data.*.idle_inhibit_manager != null) {
        zwp_idle_inhibit_manager_v1_destroy(data.*.idle_inhibit_manager);
        data.*.idle_inhibit_manager = null;
    }
    if (data.*.key_inhibitor_manager != null) {
        zwp_keyboard_shortcuts_inhibit_manager_v1_destroy(data.*.key_inhibitor_manager);
        data.*.key_inhibitor_manager = null;
    }
    if (data.*.text_input_manager != null) {
        zwp_text_input_manager_v3_destroy(data.*.text_input_manager);
        data.*.text_input_manager = null;
    }
    if (data.*.xkb_context != null) {
        WAYLAND_xkb_context_unref.?(data.*.xkb_context);
        data.*.xkb_context = null;
    }
    if (data.*.tablet_manager != null) {
        zwp_tablet_manager_v2_destroy(data.*.tablet_manager);
        data.*.tablet_manager = null;
    }
    if (data.*.data_device_manager != null) {
        wl_data_device_manager_destroy(data.*.data_device_manager);
        data.*.data_device_manager = null;
    }
    if (data.*.shm != null) {
        if (wl_shm_get_version(data.*.shm) >= @as(u32, WL_SHM_RELEASE_SINCE_VERSION)) {
            wl_shm_release(data.*.shm);
        } else {
            wl_shm_destroy(data.*.shm);
        }
        data.*.shm = null;
    }
    if (data.*.shell.xdg != null) {
        xdg_wm_base_destroy(data.*.shell.xdg);
        data.*.shell.xdg = null;
    }
    if (data.*.decoration_manager != null) {
        zxdg_decoration_manager_v1_destroy(data.*.decoration_manager);
        data.*.decoration_manager = null;
    }
    if (data.*.xdg_output_manager != null) {
        zxdg_output_manager_v1_destroy(data.*.xdg_output_manager);
        data.*.xdg_output_manager = null;
    }
    if (data.*.viewporter != null) {
        wp_viewporter_destroy(data.*.viewporter);
        data.*.viewporter = null;
    }
    if (data.*.primary_selection_device_manager != null) {
        zwp_primary_selection_device_manager_v1_destroy(data.*.primary_selection_device_manager);
        data.*.primary_selection_device_manager = null;
    }
    if (data.*.fractional_scale_manager != null) {
        wp_fractional_scale_manager_v1_destroy(data.*.fractional_scale_manager);
        data.*.fractional_scale_manager = null;
    }
    if (data.*.input_timestamps_manager != null) {
        zwp_input_timestamps_manager_v1_destroy(data.*.input_timestamps_manager);
        data.*.input_timestamps_manager = null;
    }
    if (data.*.cursor_shape_manager != null) {
        wp_cursor_shape_manager_v1_destroy(data.*.cursor_shape_manager);
        data.*.cursor_shape_manager = null;
    }
    if (data.*.zxdg_exporter_v2 != null) {
        zxdg_exporter_v2_destroy(data.*.zxdg_exporter_v2);
        data.*.zxdg_exporter_v2 = null;
    }
    if (data.*.xdg_wm_dialog_v1 != null) {
        xdg_wm_dialog_v1_destroy(data.*.xdg_wm_dialog_v1);
        data.*.xdg_wm_dialog_v1 = null;
    }
    if (data.*.wp_alpha_modifier_v1 != null) {
        wp_alpha_modifier_v1_destroy(data.*.wp_alpha_modifier_v1);
        data.*.wp_alpha_modifier_v1 = null;
    }
    if (data.*.xdg_toplevel_icon_manager_v1 != null) {
        xdg_toplevel_icon_manager_v1_destroy(data.*.xdg_toplevel_icon_manager_v1);
        data.*.xdg_toplevel_icon_manager_v1 = null;
    }
    if (data.*.frog_color_management_factory_v1 != null) {
        frog_color_management_factory_v1_destroy(data.*.frog_color_management_factory_v1);
        data.*.frog_color_management_factory_v1 = null;
    }
    if (data.*.wp_color_manager_v1 != null) {
        wp_color_manager_v1_destroy(data.*.wp_color_manager_v1);
        data.*.wp_color_manager_v1 = null;
    }
    if (data.*.wp_pointer_warp_v1 != null) {
        wp_pointer_warp_v1_destroy(data.*.wp_pointer_warp_v1);
        data.*.wp_pointer_warp_v1 = null;
    }
    if (data.*.zwp_pointer_gestures != null) {
        if (zwp_pointer_gestures_v1_get_version(data.*.zwp_pointer_gestures) >= @as(u32, ZWP_POINTER_GESTURES_V1_RELEASE_SINCE_VERSION)) {
            zwp_pointer_gestures_v1_release(data.*.zwp_pointer_gestures);
        } else {
            zwp_pointer_gestures_v1_destroy(data.*.zwp_pointer_gestures);
        }
        data.*.zwp_pointer_gestures = null;
    }
    if (data.*.single_pixel_buffer_manager != null) {
        wp_single_pixel_buffer_manager_v1_destroy(data.*.single_pixel_buffer_manager);
        data.*.single_pixel_buffer_manager = null;
    }
    if (data.*.xdg_session_manager != null) {
        xdg_session_manager_v1_destroy(data.*.xdg_session_manager);
        data.*.xdg_session_manager = null;
    }
    if (data.*.xdg_toplevel_tag_manager != null) {
        xdg_toplevel_tag_manager_v1_destroy(data.*.xdg_toplevel_tag_manager);
        data.*.xdg_toplevel_tag_manager = null;
    }
    if (data.*.subcompositor != null) {
        wl_subcompositor_destroy(data.*.subcompositor);
        data.*.subcompositor = null;
    }
    if (data.*.compositor != null) {
        wl_compositor_destroy(data.*.compositor);
        data.*.compositor = null;
    }
    if (data.*.registry != null) {
        if (data.*.wl_fixes != null) {
            wl_fixes_destroy_registry(data.*.wl_fixes, data.*.registry);
            wl_fixes_destroy(data.*.wl_fixes);
            data.*.wl_fixes = null;
        }
        wl_registry_destroy(data.*.registry);
        data.*.registry = null;
    }
}
pub fn Wayland_VideoReconnect(_: [*c]SDL_VideoDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub export fn Wayland_HandleDisplayDisconnected(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var video_data: [*c]SDL_VideoData = _this.*.internal;
    _ = &video_data;
    if (video_data.*.display_disconnected) {
        return @"false" != 0;
    }
    if (Wayland_VideoReconnect(_this)) {
        return @"true" != 0;
    }
    video_data.*.display_disconnected = @"true" != 0;
    SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Wayland display connection closed by server (fatal)");
    SDL_SendQuit();
    return @"false" != 0;
}
pub export fn Wayland_VideoQuit(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    Wayland_VideoCleanup(_this);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (data.*.shell.libdecor != null) {
        WAYLAND_libdecor_unref.?(data.*.shell.libdecor);
        data.*.shell.libdecor = null;
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const WAYLAND_VERSION_MAJOR = @as(c_int, 1);
pub const WAYLAND_VERSION_MINOR = @as(c_int, 26);
pub const WAYLAND_VERSION_MICRO = @as(c_int, 0);
pub inline fn SDL_WAYLAND_CHECK_VERSION(x: anytype, y: anytype, z: anytype) @TypeOf(((WAYLAND_VERSION_MAJOR > x) or ((WAYLAND_VERSION_MAJOR == x) and (WAYLAND_VERSION_MINOR > y))) or (((WAYLAND_VERSION_MAJOR == x) and (WAYLAND_VERSION_MINOR == y)) and (WAYLAND_VERSION_MICRO >= z))) {
    @setEvalBranchQuota(100000);
    _ = &x;
    _ = &y;
    _ = &z;
    return ((WAYLAND_VERSION_MAJOR > x) or ((WAYLAND_VERSION_MAJOR == x) and (WAYLAND_VERSION_MINOR > y))) or (((WAYLAND_VERSION_MAJOR == x) and (WAYLAND_VERSION_MINOR == y)) and (WAYLAND_VERSION_MICRO >= z));
}
pub const WL_DISPLAY_GET_REGISTRY = @as(c_int, 1);
pub const WL_REGISTRY_BIND = @as(c_int, 0);
pub const WL_SHM_RELEASE = @as(c_int, 1);
pub const WL_SHM_RELEASE_SINCE_VERSION = @as(c_int, 2);
pub const WL_OUTPUT_RELEASE = @as(c_int, 0);
pub const WL_OUTPUT_NAME_SINCE_VERSION = @as(c_int, 4);
pub const WL_OUTPUT_DESCRIPTION_SINCE_VERSION = @as(c_int, 4);
pub const WL_OUTPUT_RELEASE_SINCE_VERSION = @as(c_int, 3);
pub const WL_SUBCOMPOSITOR_DESTROY = @as(c_int, 0);
pub const WL_FIXES_DESTROY = @as(c_int, 0);
pub const WL_FIXES_DESTROY_REGISTRY = @as(c_int, 1);
pub const WL_FIXES_ACK_GLOBAL_REMOVE = @as(c_int, 2);
pub const WL_FIXES_ACK_GLOBAL_REMOVE_SINCE_VERSION = @as(c_int, 2);
pub const WP_ALPHA_MODIFIER_V1_DESTROY = @as(c_int, 0);
pub const WP_CURSOR_SHAPE_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const WP_FRACTIONAL_SCALE_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const FROG_COLOR_MANAGEMENT_FACTORY_V1_DESTROY = @as(c_int, 0);
pub const ZWP_IDLE_INHIBIT_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_INPUT_TIMESTAMPS_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_POINTER_CONSTRAINTS_V1_DESTROY = @as(c_int, 0);
pub const ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_DESTROY = @as(c_int, 2);
pub const ZWP_RELATIVE_POINTER_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_TABLET_MANAGER_V2_DESTROY = @as(c_int, 1);
pub const ZWP_TEXT_INPUT_MANAGER_V3_DESTROY = @as(c_int, 0);
pub const WP_VIEWPORTER_DESTROY = @as(c_int, 0);
pub const XDG_ACTIVATION_V1_DESTROY = @as(c_int, 0);
pub const ZXDG_DECORATION_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const XDG_WM_DIALOG_V1_DESTROY = @as(c_int, 0);
pub const ZXDG_EXPORTER_V2_DESTROY = @as(c_int, 0);
pub const ZXDG_OUTPUT_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const ZXDG_OUTPUT_MANAGER_V1_GET_XDG_OUTPUT = @as(c_int, 1);
pub const ZXDG_OUTPUT_V1_DESTROY = @as(c_int, 0);
pub const XDG_WM_BASE_DESTROY = @as(c_int, 0);
pub const XDG_WM_BASE_PONG = @as(c_int, 3);
pub const XDG_TOPLEVEL_ICON_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const WP_COLOR_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const WP_COLOR_MANAGER_V1_GET_OUTPUT = @as(c_int, 1);
pub const WP_COLOR_MANAGEMENT_OUTPUT_V1_DESTROY = @as(c_int, 0);
pub const WP_POINTER_WARP_V1_DESTROY = @as(c_int, 0);
pub const ZWP_POINTER_GESTURES_V1_RELEASE = @as(c_int, 2);
pub const ZWP_POINTER_GESTURES_V1_RELEASE_SINCE_VERSION = @as(c_int, 2);
pub const WP_SINGLE_PIXEL_BUFFER_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const XDG_SESSION_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const XDG_SESSION_MANAGER_V1_GET_SESSION = @as(c_int, 1);
pub const XDG_SESSION_V1_DESTROY = @as(c_int, 0);
pub const XDG_SESSION_V1_REMOVE = @as(c_int, 1);
pub const XDG_TOPLEVEL_SESSION_V1_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_TAG_MANAGER_V1_DESTROY = @as(c_int, 0);
pub const SDL_WL_COMPOSITOR_VERSION = @as(c_int, 6);
pub const SDL_WL_SEAT_VERSION = @as(c_int, 11);
pub const SDL_WL_OUTPUT_VERSION = @as(c_int, 4);
pub const SDL_WL_SHM_VERSION = @as(c_int, 2);
pub const SDL_WL_FIXES_VERSION = @as(c_int, 2);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_touch = struct_wl_touch;
pub const xdg_toplevel = struct_xdg_toplevel;
