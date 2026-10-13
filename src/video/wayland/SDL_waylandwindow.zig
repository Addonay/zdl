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
pub const __off_t = c_long;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
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
pub extern fn SDL_unsetenv_unsafe_REAL(name: [*c]const u8) c_int;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strcasecmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_ceil_REAL(x: f64) f64;
pub extern fn SDL_floor_REAL(x: f64) f64;
pub extern fn SDL_lround_REAL(x: f64) c_long;
pub extern fn SDL_lroundf_REAL(x: f32) c_long;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub const struct_SDL_AtomicInt = extern struct {
    value: c_int = 0,
};
pub const SDL_AtomicInt = struct_SDL_AtomicInt;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: ?*anyopaque) bool;
pub extern fn SDL_SetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: [*c]const u8) bool;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: bool) bool;
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
pub extern fn SDL_DestroySurface_REAL(surface: [*c]SDL_Surface) void;
pub extern fn SDL_GetSurfaceImages_REAL(surface: [*c]SDL_Surface, count: [*c]c_int) [*c][*c]SDL_Surface;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_PremultiplyAlpha_REAL(width: c_int, height: c_int, src_format: SDL_PixelFormat, src: ?*const anyopaque, src_pitch: c_int, dst_format: SDL_PixelFormat, dst: ?*anyopaque, dst_pitch: c_int, linear: bool) bool;
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
pub const SDL_HITTEST_NORMAL: c_int = 0;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_wl_display = opaque {
};
pub const struct_wl_registry_8 = opaque {
};
pub const struct_wl_compositor_9 = opaque {
};
pub const struct_wl_shm_10 = opaque {
};
pub const struct_xdg_wm_base_12 = opaque {
};
pub const struct_libdecor_13 = opaque {
};
const struct_unnamed_11 = extern struct {
    xdg: ?*struct_xdg_wm_base_12 = null,
    libdecor: ?*struct_libdecor_13 = null,
};
pub const struct_wl_subcompositor_14 = opaque {
};
pub const struct_zwp_relative_pointer_manager_v1_15 = opaque {};
pub const struct_zwp_pointer_constraints_v1_16 = opaque {};
pub const struct_wp_pointer_warp_v1_17 = opaque {};
pub const struct_wp_cursor_shape_manager_v1_18 = opaque {};
pub const struct_wl_data_device_manager_19 = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_20 = opaque {};
pub const struct_zxdg_decoration_manager_v1_21 = opaque {
};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_22 = opaque {};
pub const struct_zwp_idle_inhibit_manager_v1_23 = opaque {
};
pub const struct_xdg_activation_v1_24 = opaque {
};
pub const struct_zwp_text_input_manager_v3_25 = opaque {};
pub const struct_zxdg_output_manager_v1_26 = opaque {};
pub const struct_wp_viewporter_27 = opaque {
};
pub const struct_wp_fractional_scale_manager_v1_28 = opaque {
};
pub const struct_zwp_input_timestamps_manager_v1_29 = opaque {};
pub const struct_zxdg_exporter_v2_30 = opaque {
};
pub const struct_xdg_wm_dialog_v1_31 = opaque {
};
pub const struct_wp_alpha_modifier_v1_32 = opaque {
};
pub const struct_xdg_toplevel_icon_manager_v1_33 = opaque {
};
pub const struct_frog_color_management_factory_v1_34 = opaque {
};
pub const struct_wp_color_manager_v1_35 = opaque {
};
pub const struct_zwp_tablet_manager_v2_36 = opaque {};
pub const struct_wl_fixes_37 = opaque {
};
pub const struct_zwp_pointer_gestures_v1_38 = opaque {};
pub const struct_wp_single_pixel_buffer_manager_v1_39 = opaque {};
pub const struct_xdg_session_manager_v1_40 = opaque {
};
pub const struct_xdg_toplevel_tag_manager_v1_41 = opaque {
};
pub const struct_xdg_session_v1_42 = opaque {
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
pub const struct_zwp_primary_selection_device_v1_43 = opaque {};
pub const struct_SDL_WaylandPrimarySelectionDevice = extern struct {
    primary_selection_device: ?*struct_zwp_primary_selection_device_v1_43 = null,
    seat: [*c]struct_SDL_WaylandSeat = null,
    selection_source: [*c]SDL_WaylandPrimarySelectionSource = null,
    selection_offer: [*c]SDL_WaylandPrimarySelectionOffer = null,
};
pub const SDL_WaylandPrimarySelectionDevice = struct_SDL_WaylandPrimarySelectionDevice;
pub const struct_wl_keyboard = opaque {
};
pub const struct_zwp_input_timestamps_v1_45 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibitor_v1_46 = opaque {};
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
const struct_unnamed_47 = extern struct {
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
const struct_unnamed_44 = extern struct {
    wl_keyboard: ?*struct_wl_keyboard = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_45 = null,
    key_inhibitor: ?*struct_zwp_keyboard_shortcuts_inhibitor_v1_46 = null,
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
    xkb: struct_unnamed_47 = @import("std").mem.zeroes(struct_unnamed_47),
};
pub const struct_wl_pointer = opaque {
};
pub const struct_zwp_relative_pointer_v1_49 = opaque {};
pub const struct_zwp_locked_pointer_v1_50 = opaque {};
pub const struct_zwp_confined_pointer_v1_51 = opaque {};
pub const struct_zwp_pointer_gesture_pinch_v1_52 = opaque {};
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseID = Uint32;
pub const wl_fixed_t = i32;
const struct_unnamed_54 = extern struct {
    sx: wl_fixed_t = 0,
    sy: wl_fixed_t = 0,
};
const struct_unnamed_55 = extern struct {
    dx: wl_fixed_t = 0,
    dy: wl_fixed_t = 0,
    dx_unaccel: wl_fixed_t = 0,
    dy_unaccel: wl_fixed_t = 0,
};
pub const enum_SDL_WaylandAxisEvent = c_uint;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
const struct_unnamed_56 = extern struct {
    x_axis_type: enum_SDL_WaylandAxisEvent = @import("std").mem.zeroes(enum_SDL_WaylandAxisEvent),
    x: f32 = 0,
    y_axis_type: enum_SDL_WaylandAxisEvent = @import("std").mem.zeroes(enum_SDL_WaylandAxisEvent),
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
};
const struct_unnamed_53 = extern struct {
    have_absolute: bool = false,
    have_relative: bool = false,
    have_warp: bool = false,
    have_axis: bool = false,
    buttons_pressed: Uint32 = 0,
    buttons_released: Uint32 = 0,
    absolute: struct_unnamed_54 = @import("std").mem.zeroes(struct_unnamed_54),
    relative: struct_unnamed_55 = @import("std").mem.zeroes(struct_unnamed_55),
    axis: struct_unnamed_56 = @import("std").mem.zeroes(struct_unnamed_56),
    enter_surface: ?*struct_wl_surface = null,
    leave_surface: ?*struct_wl_surface = null,
    timestamp_ns: Uint64 = 0,
};
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_wp_cursor_shape_device_v1_57 = opaque {};
pub const struct_wp_viewport_58 = opaque {
};
pub const struct_wl_callback = opaque {
};
pub const struct_SDL_WaylandCursorState = extern struct {
    current_cursor: ?*SDL_CursorData = null,
    cursor_shape: ?*struct_wp_cursor_shape_device_v1_57 = null,
    surface: ?*struct_wl_surface = null,
    viewport: ?*struct_wp_viewport_58 = null,
    scale: f64 = 0,
    system_cursor_handle: ?*anyopaque = null,
    frame_callback: ?*struct_wl_callback = null,
    last_frame_callback_time_ms: Uint64 = 0,
    current_frame_time_ms: Uint32 = 0,
    current_frame: c_int = 0,
    hit_test_result: SDL_HitTestResult = @import("std").mem.zeroes(SDL_HitTestResult),
};
pub const SDL_WaylandCursorState = struct_SDL_WaylandCursorState;
const struct_unnamed_48 = extern struct {
    wl_pointer: ?*struct_wl_pointer = null,
    relative_pointer: ?*struct_zwp_relative_pointer_v1_49 = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_45 = null,
    locked_pointer: ?*struct_zwp_locked_pointer_v1_50 = null,
    confined_pointer: ?*struct_zwp_confined_pointer_v1_51 = null,
    gesture_pinch: ?*struct_zwp_pointer_gesture_pinch_v1_52 = null,
    focus: [*c]SDL_WindowData = null,
    focus_surface: ?*struct_wl_surface = null,
    gesture_focus: [*c]SDL_WindowData = null,
    highres_timestamp_ns: Uint64 = 0,
    enter_serial: Uint32 = 0,
    buttons_pressed: SDL_MouseButtonFlags = 0,
    last_motion: SDL_Point = @import("std").mem.zeroes(SDL_Point),
    is_confined: bool = false,
    sdl_id: SDL_MouseID = 0,
    pending_frame: struct_unnamed_53 = @import("std").mem.zeroes(struct_unnamed_53),
    cursor_state: SDL_WaylandCursorState = @import("std").mem.zeroes(SDL_WaylandCursorState),
};
pub const struct_wl_touch = opaque {
};
const struct_unnamed_59 = extern struct {
    wl_touch: ?*struct_wl_touch = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_45 = null,
    highres_timestamp_ns: Uint64 = 0,
    points: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const struct_zwp_text_input_v3_61 = opaque {};
const struct_unnamed_60 = extern struct {
    zwp_text_input: ?*struct_zwp_text_input_v3_61 = null,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    enabled: bool = false,
    has_preedit: bool = false,
};
pub const struct_zwp_tablet_seat_v2_63 = opaque {};
const struct_unnamed_62 = extern struct {
    wl_tablet_seat: ?*struct_zwp_tablet_seat_v2_63 = null,
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
    keyboard: struct_unnamed_44 = @import("std").mem.zeroes(struct_unnamed_44),
    pointer: struct_unnamed_48 = @import("std").mem.zeroes(struct_unnamed_48),
    touch: struct_unnamed_59 = @import("std").mem.zeroes(struct_unnamed_59),
    text_input: struct_unnamed_60 = @import("std").mem.zeroes(struct_unnamed_60),
    tablet: struct_unnamed_62 = @import("std").mem.zeroes(struct_unnamed_62),
};
pub const struct_Wayland_EventThreadContext = opaque {
};
pub const Wayland_EventThreadContext = struct_Wayland_EventThreadContext;
pub const struct_wl_output_64 = opaque {
};
pub const struct_zxdg_output_v1_65 = opaque {};
pub const struct_wp_color_management_output_v1_66 = opaque {
};
pub const struct_Wayland_ColorInfoState_67 = opaque {
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
pub const struct_SDL_PrivateGLESData_74 = opaque {};
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
    gles_data: ?*struct_SDL_PrivateGLESData_74 = null,
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
    output: ?*struct_wl_output_64 = null,
    xdg_output: ?*struct_zxdg_output_v1_65 = null,
    wp_color_management_output: ?*struct_wp_color_management_output_v1_66 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_67 = null,
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
    display: ?*struct_wl_display = null,
    registry: ?*struct_wl_registry_8 = null,
    compositor: ?*struct_wl_compositor_9 = null,
    shm: ?*struct_wl_shm_10 = null,
    cursor_themes: [*c]SDL_WaylandCursorTheme = null,
    num_cursor_themes: c_int = 0,
    shell: struct_unnamed_11 = @import("std").mem.zeroes(struct_unnamed_11),
    subcompositor: ?*struct_wl_subcompositor_14 = null,
    relative_pointer_manager: ?*struct_zwp_relative_pointer_manager_v1_15 = null,
    pointer_constraints: ?*struct_zwp_pointer_constraints_v1_16 = null,
    wp_pointer_warp_v1: ?*struct_wp_pointer_warp_v1_17 = null,
    cursor_shape_manager: ?*struct_wp_cursor_shape_manager_v1_18 = null,
    data_device_manager: ?*struct_wl_data_device_manager_19 = null,
    primary_selection_device_manager: ?*struct_zwp_primary_selection_device_manager_v1_20 = null,
    decoration_manager: ?*struct_zxdg_decoration_manager_v1_21 = null,
    key_inhibitor_manager: ?*struct_zwp_keyboard_shortcuts_inhibit_manager_v1_22 = null,
    idle_inhibit_manager: ?*struct_zwp_idle_inhibit_manager_v1_23 = null,
    activation_manager: ?*struct_xdg_activation_v1_24 = null,
    text_input_manager: ?*struct_zwp_text_input_manager_v3_25 = null,
    xdg_output_manager: ?*struct_zxdg_output_manager_v1_26 = null,
    viewporter: ?*struct_wp_viewporter_27 = null,
    fractional_scale_manager: ?*struct_wp_fractional_scale_manager_v1_28 = null,
    input_timestamps_manager: ?*struct_zwp_input_timestamps_manager_v1_29 = null,
    zxdg_exporter_v2: ?*struct_zxdg_exporter_v2_30 = null,
    xdg_wm_dialog_v1: ?*struct_xdg_wm_dialog_v1_31 = null,
    wp_alpha_modifier_v1: ?*struct_wp_alpha_modifier_v1_32 = null,
    xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_33 = null,
    frog_color_management_factory_v1: ?*struct_frog_color_management_factory_v1_34 = null,
    wp_color_manager_v1: ?*struct_wp_color_manager_v1_35 = null,
    tablet_manager: ?*struct_zwp_tablet_manager_v2_36 = null,
    wl_fixes: ?*struct_wl_fixes_37 = null,
    zwp_pointer_gestures: ?*struct_zwp_pointer_gestures_v1_38 = null,
    single_pixel_buffer_manager: ?*struct_wp_single_pixel_buffer_manager_v1_39 = null,
    xdg_session_manager: ?*struct_xdg_session_manager_v1_40 = null,
    xdg_toplevel_tag_manager: ?*struct_xdg_toplevel_tag_manager_v1_41 = null,
    xdg_session: ?*struct_xdg_session_v1_42 = null,
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
const struct_unnamed_76 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {
};
pub const struct_xdg_toplevel = opaque {
};
const struct_unnamed_79 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_81 = opaque {
};
pub const struct_xdg_positioner_82 = opaque {
};
const struct_unnamed_80 = extern struct {
    xdg_popup: ?*struct_xdg_popup_81 = null,
    xdg_positioner: ?*struct_xdg_positioner_82 = null,
};
const union_unnamed_78 = extern union {
    toplevel: struct_unnamed_79,
    popup: struct_unnamed_80,
};
const struct_unnamed_77 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_78 = @import("std").mem.zeroes(union_unnamed_78),
    serial: Uint32 = 0,
};
const union_unnamed_75 = extern union {
    libdecor: struct_unnamed_76,
    xdg: struct_unnamed_77,
};
pub const WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL: c_int = 1;
pub const WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP: c_int = 2;
pub const WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR: c_int = 3;
pub const WAYLAND_SHELL_SURFACE_TYPE_CUSTOM: c_int = 4;
const enum_unnamed_83 = c_uint;
pub const WAYLAND_SHELL_SURFACE_STATUS_HIDDEN: c_int = 0;
pub const WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE: c_int = 1;
pub const WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME: c_int = 2;
pub const WAYLAND_SHELL_SURFACE_STATUS_SHOW_PENDING: c_int = 3;
pub const WAYLAND_SHELL_SURFACE_STATUS_SHOWN: c_int = 4;
const enum_unnamed_84 = c_uint;
pub const WAYLAND_WM_CAPS_WINDOW_MENU: c_int = 1;
pub const WAYLAND_WM_CAPS_MAXIMIZE: c_int = 2;
pub const WAYLAND_WM_CAPS_FULLSCREEN: c_int = 4;
pub const WAYLAND_WM_CAPS_MINIMIZE: c_int = 8;
pub const WAYLAND_WM_CAPS_ALL: c_int = 15;
const enum_unnamed_85 = c_uint;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_LEFT: c_int = 1;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT: c_int = 2;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_TOP: c_int = 4;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM: c_int = 8;
const enum_unnamed_86 = c_uint;
pub const WAYLAND_RESIZE_EDGE_LR: c_int = 1;
pub const WAYLAND_RESIZE_EDGE_TB: c_int = 2;
pub const WAYLAND_RESIZE_EDGE_CORNER: c_int = 3;
const enum_unnamed_87 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const struct_zxdg_toplevel_decoration_v1_88 = opaque {
};
pub const struct_zwp_idle_inhibitor_v1_89 = opaque {
};
pub const struct_xdg_activation_token_v1_90 = opaque {
};
pub const struct_wp_fractional_scale_v1_91 = opaque {
};
pub const struct_zxdg_exported_v2_92 = opaque {
};
pub const struct_xdg_dialog_v1_93 = opaque {
};
pub const struct_wp_alpha_modifier_surface_v1_94 = opaque {
};
pub const struct_xdg_toplevel_icon_v1_95 = opaque {
};
pub const struct_frog_color_managed_surface_96 = opaque {
};
pub const struct_wp_color_management_surface_feedback_v1_97 = opaque {
};
pub const struct_xdg_toplevel_session_v1_98 = opaque {
};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_99 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_100 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_101 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_102 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_103 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_104 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_105 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_58 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_106 = extern struct {
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
    shell_surface: union_unnamed_75 = @import("std").mem.zeroes(union_unnamed_75),
    shell_surface_type: enum_unnamed_83 = @import("std").mem.zeroes(enum_unnamed_83),
    shell_surface_status: enum_unnamed_84 = @import("std").mem.zeroes(enum_unnamed_84),
    wm_caps: enum_unnamed_85 = @import("std").mem.zeroes(enum_unnamed_85),
    toplevel_constraints: enum_unnamed_86 = @import("std").mem.zeroes(enum_unnamed_86),
    resize_edge: enum_unnamed_87 = @import("std").mem.zeroes(enum_unnamed_87),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_88 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_89 = null,
    activation_token: ?*struct_xdg_activation_token_v1_90 = null,
    viewport: ?*struct_wp_viewport_58 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_91 = null,
    exported: ?*struct_zxdg_exported_v2_92 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_93 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_94 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_95 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_96 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_97 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_98 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_67 = null,
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
    pointer_scale: struct_unnamed_99 = @import("std").mem.zeroes(struct_unnamed_99),
    requested: struct_unnamed_100 = @import("std").mem.zeroes(struct_unnamed_100),
    current: struct_unnamed_101 = @import("std").mem.zeroes(struct_unnamed_101),
    last_configure: struct_unnamed_102 = @import("std").mem.zeroes(struct_unnamed_102),
    system_limits: struct_unnamed_103 = @import("std").mem.zeroes(struct_unnamed_103),
    toplevel_bounds: struct_unnamed_104 = @import("std").mem.zeroes(struct_unnamed_104),
    mask: struct_unnamed_105 = @import("std").mem.zeroes(struct_unnamed_105),
    text_input_props: struct_unnamed_106 = @import("std").mem.zeroes(struct_unnamed_106),
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
pub extern fn SDL_GetWindowFromID_REAL(id: SDL_WindowID) [*c]SDL_Window;
pub extern fn SDL_GetWindowProperties_REAL(window: [*c]SDL_Window) SDL_PropertiesID;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_MAXIMIZED: c_int = 522;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED: c_int = 528;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED: c_int = 531;
pub const SDL_EVENT_WINDOW_OCCLUDED: c_int = 534;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const SDL_OBJECT_TYPE_WINDOW: c_int = 1;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_FindObject(object: ?*anyopaque, @"type": SDL_ObjectType) bool;
pub extern var SDL_object_validation: bool;
pub inline fn SDL_ObjectValid(object: ?*anyopaque, arg_type: SDL_ObjectType) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    if (!(object != null)) {
        return @"false" != 0;
    }
    if (!SDL_object_validation) {
        return @"true" != 0;
    }
    return SDL_FindObject(object, @"type");
}
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub extern fn mmap(__addr: ?*anyopaque, __len: usize, __prot: c_int, __flags: c_int, __fd: c_int, __offset: __off_t) ?*anyopaque;
pub extern fn munmap(__addr: ?*anyopaque, __len: usize) c_int;
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
pub const SDL_FULLSCREEN_OP_LEAVE: c_int = 0;
pub const SDL_FULLSCREEN_OP_ENTER: c_int = 1;
pub const SDL_FULLSCREEN_OP_UPDATE: c_int = 2;
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FULLSCREEN_FAILED: c_int = 0;
pub const SDL_FULLSCREEN_SUCCEEDED: c_int = 1;
pub const SDL_FULLSCREEN_PENDING: c_int = 2;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_GetVideoDisplay(display: SDL_DisplayID) [*c]SDL_VideoDisplay;
pub extern fn SDL_GetVideoDisplayForFullscreenWindow(window: [*c]SDL_Window) [*c]SDL_VideoDisplay;
pub extern fn SDL_SetWindowHDRProperties(window: [*c]SDL_Window, HDR: [*c]const SDL_HDROutputProperties, send_event: bool) void;
pub extern fn SDL_ShouldFocusPopup(window: [*c]SDL_Window) bool;
pub extern fn SDL_ShouldRelinquishPopupFocus(window: [*c]SDL_Window, new_focus: [*c][*c]SDL_Window) bool;
pub extern fn SDL_UpdateFullscreenMode(window: [*c]SDL_Window, fullscreen: SDL_FullscreenOp, commit: bool) bool;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_GetAppID() [*c]const u8;
pub extern fn SDL_GetNotificationActivationToken() [*c]const u8;
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
pub extern fn SDL_EGL_CreateSurface(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, nw: NativeWindowType) EGLSurface;
pub extern fn SDL_EGL_DestroySurface(_this: [*c]SDL_VideoDevice, egl_surface: EGLSurface) void;
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
pub fn wl_fixed_from_int(i: c_int) callconv(.c) wl_fixed_t {
    @setEvalBranchQuota(100000);
    return i * @as(c_int, 256);
}
pub extern fn SDL_DBus_ScreensaverInhibit(inhibit: bool) bool;
pub const struct_wl_cursor_theme_113 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_113 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const struct_libdecor_state = opaque {
};
pub const struct_libdecor_configuration = opaque {
};
pub const struct_libdecor_frame_interface = extern struct {
    configure: ?*const fn (frame: ?*struct_libdecor_frame, configuration: ?*struct_libdecor_configuration, user_data: ?*anyopaque) callconv(.c) void = null,
    close: ?*const fn (frame: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void = null,
    commit: ?*const fn (frame: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void = null,
    dismiss_popup: ?*const fn (frame: ?*struct_libdecor_frame, seat_name: [*c]const u8, user_data: ?*anyopaque) callconv(.c) void = null,
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
pub const LIBDECOR_ACTION_RESIZE: c_int = 2;
pub const enum_libdecor_capabilities = c_uint;
pub const LIBDECOR_WINDOW_STATE_ACTIVE: c_int = 1;
pub const LIBDECOR_WINDOW_STATE_MAXIMIZED: c_int = 2;
pub const LIBDECOR_WINDOW_STATE_FULLSCREEN: c_int = 4;
pub const LIBDECOR_WINDOW_STATE_TILED_LEFT: c_int = 8;
pub const LIBDECOR_WINDOW_STATE_TILED_RIGHT: c_int = 16;
pub const LIBDECOR_WINDOW_STATE_TILED_TOP: c_int = 32;
pub const LIBDECOR_WINDOW_STATE_TILED_BOTTOM: c_int = 64;
pub const LIBDECOR_WINDOW_STATE_SUSPENDED: c_int = 128;
pub const enum_libdecor_window_state = c_uint;
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub extern var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_user_data = ?*const fn (?*struct_wl_proxy, ?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_set_user_data: SDL_DYNWAYLANDFN_wl_proxy_set_user_data;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_user_data = ?*const fn (?*struct_wl_proxy) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_proxy_get_user_data: SDL_DYNWAYLANDFN_wl_proxy_get_user_data;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_queue = ?*const fn (?*struct_wl_proxy, ?*struct_wl_event_queue) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_set_queue: SDL_DYNWAYLANDFN_wl_proxy_set_queue;
pub const SDL_DYNWAYLANDFN_wl_proxy_create_wrapper = ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_proxy_create_wrapper: SDL_DYNWAYLANDFN_wl_proxy_create_wrapper;
pub const SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_wrapper_destroy: SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_dispatch: SDL_DYNWAYLANDFN_wl_display_dispatch;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_pending = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_dispatch_pending: SDL_DYNWAYLANDFN_wl_display_dispatch_pending;
pub const SDL_DYNWAYLANDFN_wl_display_roundtrip = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_roundtrip: SDL_DYNWAYLANDFN_wl_display_roundtrip;
pub const SDL_DYNWAYLANDFN_wl_display_create_queue = ?*const fn (?*struct_wl_display) callconv(.c) ?*struct_wl_event_queue;
pub extern var WAYLAND_wl_display_create_queue: SDL_DYNWAYLANDFN_wl_display_create_queue;
pub const SDL_DYNWAYLANDFN_wl_event_queue_destroy = ?*const fn (?*struct_wl_event_queue) callconv(.c) void;
pub extern var WAYLAND_wl_event_queue_destroy: SDL_DYNWAYLANDFN_wl_event_queue_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const SDL_DYNWAYLANDFN_wl_egl_window_create = ?*const fn (?*struct_wl_surface, c_int, c_int) callconv(.c) ?*struct_wl_egl_window;
pub extern var WAYLAND_wl_egl_window_create: SDL_DYNWAYLANDFN_wl_egl_window_create;
pub const SDL_DYNWAYLANDFN_wl_egl_window_destroy = ?*const fn (?*struct_wl_egl_window) callconv(.c) void;
pub extern var WAYLAND_wl_egl_window_destroy: SDL_DYNWAYLANDFN_wl_egl_window_destroy;
pub const SDL_DYNWAYLANDFN_wl_egl_window_resize = ?*const fn (?*struct_wl_egl_window, c_int, c_int, c_int, c_int) callconv(.c) void;
pub extern var WAYLAND_wl_egl_window_resize: SDL_DYNWAYLANDFN_wl_egl_window_resize;
pub const SDL_DYNWAYLANDFN_libdecor_decorate = ?*const fn (?*struct_libdecor_13, ?*struct_wl_surface, [*c]const struct_libdecor_frame_interface, ?*anyopaque) callconv(.c) ?*struct_libdecor_frame;
pub extern var WAYLAND_libdecor_decorate: SDL_DYNWAYLANDFN_libdecor_decorate;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unref = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_unref: SDL_DYNWAYLANDFN_libdecor_frame_unref;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_title = ?*const fn (?*struct_libdecor_frame, [*c]const u8) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_title: SDL_DYNWAYLANDFN_libdecor_frame_set_title;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_app_id = ?*const fn (?*struct_libdecor_frame, [*c]const u8) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_app_id: SDL_DYNWAYLANDFN_libdecor_frame_set_app_id;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_max_content_size = ?*const fn (frame: ?*struct_libdecor_frame, content_width: c_int, content_height: c_int) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_max_content_size: SDL_DYNWAYLANDFN_libdecor_frame_set_max_content_size;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_min_content_size = ?*const fn (frame: ?*struct_libdecor_frame, content_width: c_int, content_height: c_int) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_min_content_size: SDL_DYNWAYLANDFN_libdecor_frame_set_min_content_size;
pub const SDL_DYNWAYLANDFN_libdecor_frame_commit = ?*const fn (?*struct_libdecor_frame, ?*struct_libdecor_state, ?*struct_libdecor_configuration) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_commit: SDL_DYNWAYLANDFN_libdecor_frame_commit;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_minimized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_minimized: SDL_DYNWAYLANDFN_libdecor_frame_set_minimized;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_maximized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_maximized: SDL_DYNWAYLANDFN_libdecor_frame_set_maximized;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_maximized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_unset_maximized: SDL_DYNWAYLANDFN_libdecor_frame_unset_maximized;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_fullscreen = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_output_64) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_fullscreen: SDL_DYNWAYLANDFN_libdecor_frame_set_fullscreen;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_fullscreen = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_unset_fullscreen: SDL_DYNWAYLANDFN_libdecor_frame_unset_fullscreen;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_capabilities = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_capabilities: SDL_DYNWAYLANDFN_libdecor_frame_set_capabilities;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_capabilities = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_unset_capabilities: SDL_DYNWAYLANDFN_libdecor_frame_unset_capabilities;
pub const SDL_DYNWAYLANDFN_libdecor_frame_has_capability = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) bool;
pub extern var WAYLAND_libdecor_frame_has_capability: SDL_DYNWAYLANDFN_libdecor_frame_has_capability;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_visibility = ?*const fn (?*struct_libdecor_frame, bool) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_set_visibility: SDL_DYNWAYLANDFN_libdecor_frame_set_visibility;
pub const SDL_DYNWAYLANDFN_libdecor_frame_show_window_menu = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32, c_int, c_int) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_show_window_menu: SDL_DYNWAYLANDFN_libdecor_frame_show_window_menu;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_surface = ?*const fn (?*struct_libdecor_frame) callconv(.c) ?*struct_xdg_surface;
pub extern var WAYLAND_libdecor_frame_get_xdg_surface: SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_surface;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_toplevel = ?*const fn (?*struct_libdecor_frame) callconv(.c) ?*struct_xdg_toplevel;
pub extern var WAYLAND_libdecor_frame_get_xdg_toplevel: SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_toplevel;
pub const SDL_DYNWAYLANDFN_libdecor_frame_translate_coordinate = ?*const fn (?*struct_libdecor_frame, c_int, c_int, [*c]c_int, [*c]c_int) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_translate_coordinate: SDL_DYNWAYLANDFN_libdecor_frame_translate_coordinate;
pub const SDL_DYNWAYLANDFN_libdecor_frame_map = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_map: SDL_DYNWAYLANDFN_libdecor_frame_map;
pub const SDL_DYNWAYLANDFN_libdecor_state_new = ?*const fn (c_int, c_int) callconv(.c) ?*struct_libdecor_state;
pub extern var WAYLAND_libdecor_state_new: SDL_DYNWAYLANDFN_libdecor_state_new;
pub const SDL_DYNWAYLANDFN_libdecor_state_free = ?*const fn (?*struct_libdecor_state) callconv(.c) void;
pub extern var WAYLAND_libdecor_state_free: SDL_DYNWAYLANDFN_libdecor_state_free;
pub const SDL_DYNWAYLANDFN_libdecor_configuration_get_content_size = ?*const fn (?*struct_libdecor_configuration, ?*struct_libdecor_frame, [*c]c_int, [*c]c_int) callconv(.c) bool;
pub extern var WAYLAND_libdecor_configuration_get_content_size: SDL_DYNWAYLANDFN_libdecor_configuration_get_content_size;
pub const SDL_DYNWAYLANDFN_libdecor_configuration_get_window_state = ?*const fn (?*struct_libdecor_configuration, [*c]enum_libdecor_window_state) callconv(.c) bool;
pub extern var WAYLAND_libdecor_configuration_get_window_state: SDL_DYNWAYLANDFN_libdecor_configuration_get_window_state;
pub const SDL_DYNWAYLANDFN_libdecor_dispatch = ?*const fn (?*struct_libdecor_13, c_int) callconv(.c) c_int;
pub extern var WAYLAND_libdecor_dispatch: SDL_DYNWAYLANDFN_libdecor_dispatch;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_min_content_size = ?*const fn (?*const struct_libdecor_frame, [*c]c_int, [*c]c_int) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_get_min_content_size: SDL_DYNWAYLANDFN_libdecor_frame_get_min_content_size;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub const struct_wl_region = opaque {
};
pub extern const wl_callback_interface: struct_wl_interface;
pub extern const wl_surface_interface: struct_wl_interface;
pub extern const wl_region_interface: struct_wl_interface;
pub extern const wl_subsurface_interface: struct_wl_interface;
pub fn wl_display_sync(wl_display_1: ?*struct_wl_display) callconv(.c) ?*struct_wl_callback {
    @setEvalBranchQuota(100000);
    var callback: ?*struct_wl_proxy = undefined;
    _ = &callback;
    callback = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_display_1)), WL_DISPLAY_SYNC, &wl_callback_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_display_1))), 0, @as(?*anyopaque, null));
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
pub fn wl_compositor_get_version(wl_compositor: ?*struct_wl_compositor_9) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_compositor)));
}
pub fn wl_compositor_create_surface(wl_compositor: ?*struct_wl_compositor_9) callconv(.c) ?*struct_wl_surface {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_compositor)), WL_COMPOSITOR_CREATE_SURFACE, &wl_surface_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_compositor))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_compositor_create_region(wl_compositor: ?*struct_wl_compositor_9) callconv(.c) ?*struct_wl_region {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_compositor)), WL_COMPOSITOR_CREATE_REGION, &wl_region_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_compositor))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_buffer_destroy(wl_buffer_1: ?*struct_wl_buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_buffer_1)), WL_BUFFER_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_buffer_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_wl_surface_listener = extern struct {
    enter: ?*const fn (data: ?*anyopaque, wl_surface: ?*struct_wl_surface, output: ?*struct_wl_output_64) callconv(.c) void = null,
    leave: ?*const fn (data: ?*anyopaque, wl_surface: ?*struct_wl_surface, output: ?*struct_wl_output_64) callconv(.c) void = null,
    preferred_buffer_scale: ?*const fn (data: ?*anyopaque, wl_surface: ?*struct_wl_surface, factor: i32) callconv(.c) void = null,
    preferred_buffer_transform: ?*const fn (data: ?*anyopaque, wl_surface: ?*struct_wl_surface, transform: u32) callconv(.c) void = null,
};
pub fn wl_surface_add_listener(wl_surface_1: ?*struct_wl_surface, listener: [*c]const struct_wl_surface_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_surface_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_surface_set_user_data(wl_surface_1: ?*struct_wl_surface, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_surface_1)), user_data);
}
pub fn wl_surface_get_version(wl_surface_1: ?*struct_wl_surface) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1)));
}
pub fn wl_surface_destroy(wl_surface_1: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_surface_attach(wl_surface_1: ?*struct_wl_surface, buffer: ?*struct_wl_buffer, x: i32, y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_ATTACH, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, buffer, x, y);
}
pub fn wl_surface_damage(wl_surface_1: ?*struct_wl_surface, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_DAMAGE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, x, y, width, height);
}
pub fn wl_surface_frame(wl_surface_1: ?*struct_wl_surface) callconv(.c) ?*struct_wl_callback {
    @setEvalBranchQuota(100000);
    var callback: ?*struct_wl_proxy = undefined;
    _ = &callback;
    callback = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_FRAME, &wl_callback_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(callback));
}
pub fn wl_surface_set_opaque_region(wl_surface_1: ?*struct_wl_surface, region: ?*struct_wl_region) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_SET_OPAQUE_REGION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, region);
}
pub fn wl_surface_set_input_region(wl_surface_1: ?*struct_wl_surface, region: ?*struct_wl_region) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_SET_INPUT_REGION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, region);
}
pub fn wl_surface_commit(wl_surface_1: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_COMMIT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0);
}
pub fn wl_surface_set_buffer_scale(wl_surface_1: ?*struct_wl_surface, scale: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_SET_BUFFER_SCALE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, scale);
}
pub fn wl_surface_damage_buffer(wl_surface_1: ?*struct_wl_surface, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_DAMAGE_BUFFER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, x, y, width, height);
}
pub fn wl_output_get_user_data(wl_output: ?*struct_wl_output_64) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_user_data.?(@ptrCast(@alignCast(wl_output)));
}
pub fn wl_region_destroy(wl_region_1: ?*struct_wl_region) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_region_1)), WL_REGION_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_region_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_region_add(wl_region_1: ?*struct_wl_region, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_region_1)), WL_REGION_ADD, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_region_1))), 0, x, y, width, height);
}
pub fn wl_subcompositor_get_subsurface(wl_subcompositor: ?*struct_wl_subcompositor_14, surface: ?*struct_wl_surface, parent: ?*struct_wl_surface) callconv(.c) ?*struct_wl_subsurface {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_subcompositor)), WL_SUBCOMPOSITOR_GET_SUBSURFACE, &wl_subsurface_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_subcompositor))), 0, @as(?*anyopaque, null), surface, parent);
    return @ptrCast(@alignCast(id));
}
pub fn wl_subsurface_destroy(wl_subsurface_1: ?*struct_wl_subsurface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_subsurface_1)), WL_SUBSURFACE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_subsurface_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_subsurface_set_position(wl_subsurface_1: ?*struct_wl_subsurface, x: i32, y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_subsurface_1)), WL_SUBSURFACE_SET_POSITION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_subsurface_1))), 0, x, y);
}
pub fn wl_subsurface_place_below(wl_subsurface_1: ?*struct_wl_subsurface, sibling: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_subsurface_1)), WL_SUBSURFACE_PLACE_BELOW, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_subsurface_1))), 0, sibling);
}
pub extern fn SDL_WAYLAND_register_surface(surface: ?*struct_wl_surface) void;
pub extern fn SDL_WAYLAND_own_surface(surface: ?*struct_wl_surface) bool;
pub extern fn SDL_WAYLAND_own_output(output: ?*struct_wl_output_64) bool;
pub extern fn Wayland_AddWindowDataToExternalList(data: [*c]SDL_WindowData) void;
pub extern fn Wayland_RemoveWindowDataFromExternalList(data: [*c]SDL_WindowData) void;
pub extern fn Wayland_CreateSession(data: [*c]SDL_VideoData) void;
pub extern fn Wayland_LoadLibdecor(data: [*c]SDL_VideoData, ignore_xdg: bool) bool;
pub extern fn Wayland_HandleDisplayDisconnected(_this: [*c]SDL_VideoDevice) bool;
pub const struct_Wayland_SHMPool = opaque {
};
pub const Wayland_SHMPool = struct_Wayland_SHMPool;
pub extern fn Wayland_AllocSHMPool(size: c_int) ?*Wayland_SHMPool;
pub extern fn Wayland_AllocBufferFromPool(shmPool: ?*Wayland_SHMPool, width: c_int, height: c_int, data: [*c]?*anyopaque) ?*struct_wl_buffer;
pub extern fn Wayland_ReleaseSHMPool(shmPool: ?*Wayland_SHMPool) void;
pub extern fn Wayland_CreateSinglePixelBuffer(r: Uint32, g: Uint32, b: Uint32, a: Uint32) ?*struct_wl_buffer;
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
pub const struct_zwp_primary_selection_source_v1_114 = opaque {};
pub const SDL_WaylandPrimarySelectionSource = extern struct {
    source: ?*struct_zwp_primary_selection_source_v1_114 = null,
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
pub const struct_zwp_primary_selection_offer_v1_115 = opaque {};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_115 = null,
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
pub extern fn Wayland_DisplayUpdatePointerGrabs(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void;
pub extern fn Wayland_DisplayUpdateKeyboardGrabs(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void;
pub extern fn Wayland_DisplayRemoveWindowReferencesFromSeats(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void;
pub extern fn Wayland_DisplayUpdatePointerFocusedScale(updated_window: [*c]SDL_WindowData) void;
pub extern fn Wayland_FreeColorInfoState(state: ?*struct_Wayland_ColorInfoState_67) void;
pub extern fn Wayland_GetColorInfoForWindow(window_data: [*c]SDL_WindowData, defer_event_processing: bool) void;
pub extern const wp_alpha_modifier_surface_v1_interface: struct_wl_interface;
pub fn wp_alpha_modifier_v1_get_surface(wp_alpha_modifier_v1: ?*struct_wp_alpha_modifier_v1_32, surface: ?*struct_wl_surface) callconv(.c) ?*struct_wp_alpha_modifier_surface_v1_94 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_alpha_modifier_v1)), WP_ALPHA_MODIFIER_V1_GET_SURFACE, &wp_alpha_modifier_surface_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_alpha_modifier_v1))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub fn wp_alpha_modifier_surface_v1_destroy(wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_94) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_alpha_modifier_surface_v1)), WP_ALPHA_MODIFIER_SURFACE_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_alpha_modifier_surface_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_alpha_modifier_surface_v1_set_multiplier(wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_94, factor: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_alpha_modifier_surface_v1)), WP_ALPHA_MODIFIER_SURFACE_V1_SET_MULTIPLIER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_alpha_modifier_surface_v1))), 0, factor);
}
pub extern const xdg_positioner_interface: struct_wl_interface;
pub extern const xdg_surface_interface: struct_wl_interface;
pub extern const xdg_toplevel_interface: struct_wl_interface;
pub extern const xdg_popup_interface: struct_wl_interface;
pub fn xdg_wm_base_create_positioner(xdg_wm_base: ?*struct_xdg_wm_base_12) callconv(.c) ?*struct_xdg_positioner_82 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_base)), XDG_WM_BASE_CREATE_POSITIONER, &xdg_positioner_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_base))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn xdg_wm_base_get_xdg_surface(xdg_wm_base: ?*struct_xdg_wm_base_12, surface: ?*struct_wl_surface) callconv(.c) ?*struct_xdg_surface {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_base)), XDG_WM_BASE_GET_XDG_SURFACE, &xdg_surface_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_base))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub const XDG_POSITIONER_ANCHOR_TOP_LEFT: c_int = 5;
pub const XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT: c_int = 8;
pub const XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE: c_int = 0;
pub const XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X: c_int = 1;
pub const XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y: c_int = 2;
pub fn xdg_positioner_destroy(xdg_positioner: ?*struct_xdg_positioner_82) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_positioner_set_size(xdg_positioner: ?*struct_xdg_positioner_82, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_SIZE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, width, height);
}
pub fn xdg_positioner_set_anchor_rect(xdg_positioner: ?*struct_xdg_positioner_82, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_ANCHOR_RECT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, x, y, width, height);
}
pub fn xdg_positioner_set_anchor(xdg_positioner: ?*struct_xdg_positioner_82, anchor: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_ANCHOR, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, anchor);
}
pub fn xdg_positioner_set_gravity(xdg_positioner: ?*struct_xdg_positioner_82, gravity: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_GRAVITY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, gravity);
}
pub fn xdg_positioner_set_constraint_adjustment(xdg_positioner: ?*struct_xdg_positioner_82, constraint_adjustment: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, constraint_adjustment);
}
pub fn xdg_positioner_set_offset(xdg_positioner: ?*struct_xdg_positioner_82, x: i32, y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_positioner)), XDG_POSITIONER_SET_OFFSET, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_positioner))), 0, x, y);
}
pub const struct_xdg_surface_listener = extern struct {
    configure: ?*const fn (data: ?*anyopaque, xdg_surface: ?*struct_xdg_surface, serial: u32) callconv(.c) void = null,
};
pub fn xdg_surface_add_listener(xdg_surface_1: ?*struct_xdg_surface, listener: [*c]const struct_xdg_surface_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_surface_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_surface_set_user_data(xdg_surface_1: ?*struct_xdg_surface, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(xdg_surface_1)), user_data);
}
pub fn xdg_surface_destroy(xdg_surface_1: ?*struct_xdg_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_surface_1)), XDG_SURFACE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_surface_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_surface_get_toplevel(xdg_surface_1: ?*struct_xdg_surface) callconv(.c) ?*struct_xdg_toplevel {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_surface_1)), XDG_SURFACE_GET_TOPLEVEL, &xdg_toplevel_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_surface_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn xdg_surface_get_popup(xdg_surface_1: ?*struct_xdg_surface, parent: ?*struct_xdg_surface, positioner: ?*struct_xdg_positioner_82) callconv(.c) ?*struct_xdg_popup_81 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_surface_1)), XDG_SURFACE_GET_POPUP, &xdg_popup_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_surface_1))), 0, @as(?*anyopaque, null), parent, positioner);
    return @ptrCast(@alignCast(id));
}
pub fn xdg_surface_set_window_geometry(xdg_surface_1: ?*struct_xdg_surface, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_surface_1)), XDG_SURFACE_SET_WINDOW_GEOMETRY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_surface_1))), 0, x, y, width, height);
}
pub fn xdg_surface_ack_configure(xdg_surface_1: ?*struct_xdg_surface, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_surface_1)), XDG_SURFACE_ACK_CONFIGURE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_surface_1))), 0, serial);
}
pub const XDG_TOPLEVEL_STATE_MAXIMIZED: c_int = 1;
pub const XDG_TOPLEVEL_STATE_FULLSCREEN: c_int = 2;
pub const XDG_TOPLEVEL_STATE_RESIZING: c_int = 3;
pub const XDG_TOPLEVEL_STATE_ACTIVATED: c_int = 4;
pub const XDG_TOPLEVEL_STATE_TILED_LEFT: c_int = 5;
pub const XDG_TOPLEVEL_STATE_TILED_RIGHT: c_int = 6;
pub const XDG_TOPLEVEL_STATE_TILED_TOP: c_int = 7;
pub const XDG_TOPLEVEL_STATE_TILED_BOTTOM: c_int = 8;
pub const XDG_TOPLEVEL_STATE_SUSPENDED: c_int = 9;
pub const XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT: c_int = 10;
pub const XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT: c_int = 11;
pub const XDG_TOPLEVEL_STATE_CONSTRAINED_TOP: c_int = 12;
pub const XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM: c_int = 13;
pub const enum_xdg_toplevel_state = c_uint;
pub const XDG_TOPLEVEL_WM_CAPABILITIES_WINDOW_MENU: c_int = 1;
pub const XDG_TOPLEVEL_WM_CAPABILITIES_MAXIMIZE: c_int = 2;
pub const XDG_TOPLEVEL_WM_CAPABILITIES_FULLSCREEN: c_int = 3;
pub const XDG_TOPLEVEL_WM_CAPABILITIES_MINIMIZE: c_int = 4;
pub const enum_xdg_toplevel_wm_capabilities = c_uint;
pub const struct_xdg_toplevel_listener = extern struct {
    configure: ?*const fn (data: ?*anyopaque, xdg_toplevel: ?*struct_xdg_toplevel, width: i32, height: i32, states: [*c]struct_wl_array) callconv(.c) void = null,
    close: ?*const fn (data: ?*anyopaque, xdg_toplevel: ?*struct_xdg_toplevel) callconv(.c) void = null,
    configure_bounds: ?*const fn (data: ?*anyopaque, xdg_toplevel: ?*struct_xdg_toplevel, width: i32, height: i32) callconv(.c) void = null,
    wm_capabilities: ?*const fn (data: ?*anyopaque, xdg_toplevel: ?*struct_xdg_toplevel, capabilities: [*c]struct_wl_array) callconv(.c) void = null,
};
pub fn xdg_toplevel_add_listener(xdg_toplevel_1: ?*struct_xdg_toplevel, listener: [*c]const struct_xdg_toplevel_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_toplevel_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_toplevel_destroy(xdg_toplevel_1: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_toplevel_set_parent(xdg_toplevel_1: ?*struct_xdg_toplevel, parent: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_PARENT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, parent);
}
pub fn xdg_toplevel_set_title(xdg_toplevel_1: ?*struct_xdg_toplevel, title: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_TITLE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, title);
}
pub fn xdg_toplevel_set_app_id(xdg_toplevel_1: ?*struct_xdg_toplevel, app_id: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_APP_ID, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, app_id);
}
pub fn xdg_toplevel_show_window_menu(xdg_toplevel_1: ?*struct_xdg_toplevel, seat: ?*struct_wl_seat, serial: u32, x: i32, y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SHOW_WINDOW_MENU, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, seat, serial, x, y);
}
pub fn xdg_toplevel_set_max_size(xdg_toplevel_1: ?*struct_xdg_toplevel, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_MAX_SIZE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, width, height);
}
pub fn xdg_toplevel_set_min_size(xdg_toplevel_1: ?*struct_xdg_toplevel, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_MIN_SIZE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, width, height);
}
pub fn xdg_toplevel_set_maximized(xdg_toplevel_1: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_MAXIMIZED, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0);
}
pub fn xdg_toplevel_unset_maximized(xdg_toplevel_1: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_UNSET_MAXIMIZED, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0);
}
pub fn xdg_toplevel_set_fullscreen(xdg_toplevel_1: ?*struct_xdg_toplevel, output: ?*struct_wl_output_64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_FULLSCREEN, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, output);
}
pub fn xdg_toplevel_unset_fullscreen(xdg_toplevel_1: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_UNSET_FULLSCREEN, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0);
}
pub fn xdg_toplevel_set_minimized(xdg_toplevel_1: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_SET_MINIMIZED, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0);
}
pub const struct_xdg_popup_listener = extern struct {
    configure: ?*const fn (data: ?*anyopaque, xdg_popup: ?*struct_xdg_popup_81, x: i32, y: i32, width: i32, height: i32) callconv(.c) void = null,
    popup_done: ?*const fn (data: ?*anyopaque, xdg_popup: ?*struct_xdg_popup_81) callconv(.c) void = null,
    repositioned: ?*const fn (data: ?*anyopaque, xdg_popup: ?*struct_xdg_popup_81, token: u32) callconv(.c) void = null,
};
pub fn xdg_popup_add_listener(xdg_popup: ?*struct_xdg_popup_81, listener: [*c]const struct_xdg_popup_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_popup)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_popup_get_version(xdg_popup: ?*struct_xdg_popup_81) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_popup)));
}
pub fn xdg_popup_destroy(xdg_popup: ?*struct_xdg_popup_81) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_popup)), XDG_POPUP_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_popup))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_popup_reposition(xdg_popup: ?*struct_xdg_popup_81, positioner: ?*struct_xdg_positioner_82, token: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_popup)), XDG_POPUP_REPOSITION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_popup))), 0, positioner, token);
}
pub extern const zxdg_toplevel_decoration_v1_interface: struct_wl_interface;
pub fn zxdg_decoration_manager_v1_get_toplevel_decoration(zxdg_decoration_manager_v1: ?*struct_zxdg_decoration_manager_v1_21, toplevel: ?*struct_xdg_toplevel) callconv(.c) ?*struct_zxdg_toplevel_decoration_v1_88 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_decoration_manager_v1)), ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION, &zxdg_toplevel_decoration_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_decoration_manager_v1))), 0, @as(?*anyopaque, null), toplevel);
    return @ptrCast(@alignCast(id));
}
pub const ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE: c_int = 1;
pub const ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE: c_int = 2;
pub const enum_zxdg_toplevel_decoration_v1_mode = c_uint;
pub const struct_zxdg_toplevel_decoration_v1_listener = extern struct {
    configure: ?*const fn (data: ?*anyopaque, zxdg_toplevel_decoration_v1: ?*struct_zxdg_toplevel_decoration_v1_88, mode: u32) callconv(.c) void = null,
};
pub fn zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1: ?*struct_zxdg_toplevel_decoration_v1_88, listener: [*c]const struct_zxdg_toplevel_decoration_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zxdg_toplevel_decoration_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zxdg_toplevel_decoration_v1_destroy(zxdg_toplevel_decoration_v1: ?*struct_zxdg_toplevel_decoration_v1_88) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_toplevel_decoration_v1)), ZXDG_TOPLEVEL_DECORATION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_toplevel_decoration_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn zxdg_toplevel_decoration_v1_set_mode(zxdg_toplevel_decoration_v1: ?*struct_zxdg_toplevel_decoration_v1_88, mode: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_toplevel_decoration_v1)), ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_toplevel_decoration_v1))), 0, mode);
}
pub extern const zwp_idle_inhibitor_v1_interface: struct_wl_interface;
pub fn zwp_idle_inhibit_manager_v1_create_inhibitor(zwp_idle_inhibit_manager_v1: ?*struct_zwp_idle_inhibit_manager_v1_23, surface: ?*struct_wl_surface) callconv(.c) ?*struct_zwp_idle_inhibitor_v1_89 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_idle_inhibit_manager_v1)), ZWP_IDLE_INHIBIT_MANAGER_V1_CREATE_INHIBITOR, &zwp_idle_inhibitor_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_idle_inhibit_manager_v1))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_idle_inhibitor_v1_destroy(zwp_idle_inhibitor_v1: ?*struct_zwp_idle_inhibitor_v1_89) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_idle_inhibitor_v1)), ZWP_IDLE_INHIBITOR_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_idle_inhibitor_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_activation_token_v1_interface: struct_wl_interface;
pub fn xdg_activation_v1_get_activation_token(xdg_activation_v1: ?*struct_xdg_activation_v1_24) callconv(.c) ?*struct_xdg_activation_token_v1_90 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_v1)), XDG_ACTIVATION_V1_GET_ACTIVATION_TOKEN, &xdg_activation_token_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_v1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn xdg_activation_v1_activate(xdg_activation_v1: ?*struct_xdg_activation_v1_24, token: [*c]const u8, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_v1)), XDG_ACTIVATION_V1_ACTIVATE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_v1))), 0, token, surface);
}
pub const struct_xdg_activation_token_v1_listener = extern struct {
    done: ?*const fn (data: ?*anyopaque, xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90, token: [*c]const u8) callconv(.c) void = null,
};
pub fn xdg_activation_token_v1_add_listener(xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90, listener: [*c]const struct_xdg_activation_token_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(xdg_activation_token_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn xdg_activation_token_v1_set_serial(xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90, serial: u32, seat: ?*struct_wl_seat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_token_v1)), XDG_ACTIVATION_TOKEN_V1_SET_SERIAL, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_token_v1))), 0, serial, seat);
}
pub fn xdg_activation_token_v1_set_surface(xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_token_v1)), XDG_ACTIVATION_TOKEN_V1_SET_SURFACE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_token_v1))), 0, surface);
}
pub fn xdg_activation_token_v1_commit(xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_token_v1)), XDG_ACTIVATION_TOKEN_V1_COMMIT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_token_v1))), 0);
}
pub fn xdg_activation_token_v1_destroy(xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_activation_token_v1)), XDG_ACTIVATION_TOKEN_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_activation_token_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_viewport_interface: struct_wl_interface;
pub fn wp_viewporter_get_viewport(wp_viewporter: ?*struct_wp_viewporter_27, surface: ?*struct_wl_surface) callconv(.c) ?*struct_wp_viewport_58 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewporter)), WP_VIEWPORTER_GET_VIEWPORT, &wp_viewport_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewporter))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub fn wp_viewport_destroy(wp_viewport: ?*struct_wp_viewport_58) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_viewport_set_source(wp_viewport: ?*struct_wp_viewport_58, x: wl_fixed_t, y: wl_fixed_t, width: wl_fixed_t, height: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_SET_SOURCE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), 0, x, y, width, height);
}
pub fn wp_viewport_set_destination(wp_viewport: ?*struct_wp_viewport_58, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_SET_DESTINATION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), 0, width, height);
}
pub extern const wp_fractional_scale_v1_interface: struct_wl_interface;
pub fn wp_fractional_scale_manager_v1_get_fractional_scale(wp_fractional_scale_manager_v1: ?*struct_wp_fractional_scale_manager_v1_28, surface: ?*struct_wl_surface) callconv(.c) ?*struct_wp_fractional_scale_v1_91 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_fractional_scale_manager_v1)), WP_FRACTIONAL_SCALE_MANAGER_V1_GET_FRACTIONAL_SCALE, &wp_fractional_scale_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_fractional_scale_manager_v1))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub const struct_wp_fractional_scale_v1_listener = extern struct {
    preferred_scale: ?*const fn (data: ?*anyopaque, wp_fractional_scale_v1: ?*struct_wp_fractional_scale_v1_91, scale: u32) callconv(.c) void = null,
};
pub fn wp_fractional_scale_v1_add_listener(wp_fractional_scale_v1: ?*struct_wp_fractional_scale_v1_91, listener: [*c]const struct_wp_fractional_scale_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wp_fractional_scale_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wp_fractional_scale_v1_destroy(wp_fractional_scale_v1: ?*struct_wp_fractional_scale_v1_91) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_fractional_scale_v1)), WP_FRACTIONAL_SCALE_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_fractional_scale_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zxdg_exported_v2_interface: struct_wl_interface;
pub fn zxdg_exporter_v2_export_toplevel(zxdg_exporter_v2: ?*struct_zxdg_exporter_v2_30, surface: ?*struct_wl_surface) callconv(.c) ?*struct_zxdg_exported_v2_92 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_exporter_v2)), ZXDG_EXPORTER_V2_EXPORT_TOPLEVEL, &zxdg_exported_v2_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_exporter_v2))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub const struct_zxdg_exported_v2_listener = extern struct {
    handle: ?*const fn (data: ?*anyopaque, zxdg_exported_v2: ?*struct_zxdg_exported_v2_92, handle: [*c]const u8) callconv(.c) void = null,
};
pub fn zxdg_exported_v2_add_listener(zxdg_exported_v2: ?*struct_zxdg_exported_v2_92, listener: [*c]const struct_zxdg_exported_v2_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zxdg_exported_v2)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zxdg_exported_v2_destroy(zxdg_exported_v2: ?*struct_zxdg_exported_v2_92) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zxdg_exported_v2)), ZXDG_EXPORTED_V2_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zxdg_exported_v2))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_dialog_v1_interface: struct_wl_interface;
pub fn xdg_wm_dialog_v1_get_xdg_dialog(xdg_wm_dialog_v1: ?*struct_xdg_wm_dialog_v1_31, toplevel: ?*struct_xdg_toplevel) callconv(.c) ?*struct_xdg_dialog_v1_93 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_wm_dialog_v1)), XDG_WM_DIALOG_V1_GET_XDG_DIALOG, &xdg_dialog_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_wm_dialog_v1))), 0, @as(?*anyopaque, null), toplevel);
    return @ptrCast(@alignCast(id));
}
pub fn xdg_dialog_v1_destroy(xdg_dialog_v1: ?*struct_xdg_dialog_v1_93) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_dialog_v1)), XDG_DIALOG_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_dialog_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_dialog_v1_set_modal(xdg_dialog_v1: ?*struct_xdg_dialog_v1_93) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_dialog_v1)), XDG_DIALOG_V1_SET_MODAL, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_dialog_v1))), 0);
}
pub fn xdg_dialog_v1_unset_modal(xdg_dialog_v1: ?*struct_xdg_dialog_v1_93) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_dialog_v1)), XDG_DIALOG_V1_UNSET_MODAL, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_dialog_v1))), 0);
}
pub extern const frog_color_managed_surface_interface: struct_wl_interface;
pub fn frog_color_management_factory_v1_get_color_managed_surface(frog_color_management_factory_v1: ?*struct_frog_color_management_factory_v1_34, surface: ?*struct_wl_surface) callconv(.c) ?*struct_frog_color_managed_surface_96 {
    @setEvalBranchQuota(100000);
    var callback: ?*struct_wl_proxy = undefined;
    _ = &callback;
    callback = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(frog_color_management_factory_v1)), FROG_COLOR_MANAGEMENT_FACTORY_V1_GET_COLOR_MANAGED_SURFACE, &frog_color_managed_surface_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(frog_color_management_factory_v1))), 0, surface, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(callback));
}
pub const FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_UNDEFINED: c_int = 0;
pub const FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_SRGB: c_int = 1;
pub const FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_GAMMA_22: c_int = 2;
pub const FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_ST2084_PQ: c_int = 3;
pub const FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_SCRGB_LINEAR: c_int = 4;
pub const struct_frog_color_managed_surface_listener = extern struct {
    preferred_metadata: ?*const fn (data: ?*anyopaque, frog_color_managed_surface: ?*struct_frog_color_managed_surface_96, transfer_function: u32, output_display_primary_red_x: u32, output_display_primary_red_y: u32, output_display_primary_green_x: u32, output_display_primary_green_y: u32, output_display_primary_blue_x: u32, output_display_primary_blue_y: u32, output_white_point_x: u32, output_white_point_y: u32, max_luminance: u32, min_luminance: u32, max_full_frame_luminance: u32) callconv(.c) void = null,
};
pub fn frog_color_managed_surface_add_listener(frog_color_managed_surface: ?*struct_frog_color_managed_surface_96, listener: [*c]const struct_frog_color_managed_surface_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(frog_color_managed_surface)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn frog_color_managed_surface_destroy(frog_color_managed_surface: ?*struct_frog_color_managed_surface_96) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(frog_color_managed_surface)), FROG_COLOR_MANAGED_SURFACE_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(frog_color_managed_surface))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_toplevel_icon_v1_interface: struct_wl_interface;
pub fn xdg_toplevel_icon_manager_v1_create_icon(xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_33) callconv(.c) ?*struct_xdg_toplevel_icon_v1_95 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1)), XDG_TOPLEVEL_ICON_MANAGER_V1_CREATE_ICON, &xdg_toplevel_icon_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn xdg_toplevel_icon_manager_v1_set_icon(xdg_toplevel_icon_manager_v1: ?*struct_xdg_toplevel_icon_manager_v1_33, toplevel: ?*struct_xdg_toplevel, icon: ?*struct_xdg_toplevel_icon_v1_95) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1)), XDG_TOPLEVEL_ICON_MANAGER_V1_SET_ICON, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_icon_manager_v1))), 0, toplevel, icon);
}
pub fn xdg_toplevel_icon_v1_destroy(xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_95) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_icon_v1)), XDG_TOPLEVEL_ICON_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_icon_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_toplevel_icon_v1_add_buffer(xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_95, buffer: ?*struct_wl_buffer, scale: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_icon_v1)), XDG_TOPLEVEL_ICON_V1_ADD_BUFFER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_icon_v1))), 0, buffer, scale);
}
pub extern const wp_color_management_surface_feedback_v1_interface: struct_wl_interface;
pub fn wp_color_manager_v1_get_surface_feedback(wp_color_manager_v1: ?*struct_wp_color_manager_v1_35, surface: ?*struct_wl_surface) callconv(.c) ?*struct_wp_color_management_surface_feedback_v1_97 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_manager_v1)), WP_COLOR_MANAGER_V1_GET_SURFACE_FEEDBACK, &wp_color_management_surface_feedback_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_manager_v1))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub const struct_wp_color_management_surface_feedback_v1_listener = extern struct {
    preferred_changed: ?*const fn (data: ?*anyopaque, wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_97, identity: u32) callconv(.c) void = null,
    preferred_changed2: ?*const fn (data: ?*anyopaque, wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_97, identity_hi: u32, identity_lo: u32) callconv(.c) void = null,
};
pub fn wp_color_management_surface_feedback_v1_add_listener(wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_97, listener: [*c]const struct_wp_color_management_surface_feedback_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wp_color_management_surface_feedback_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wp_color_management_surface_feedback_v1_destroy(wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_97) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_color_management_surface_feedback_v1)), WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_color_management_surface_feedback_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const xdg_toplevel_session_v1_interface: struct_wl_interface;
pub fn xdg_session_v1_restore_toplevel(xdg_session_v1: ?*struct_xdg_session_v1_42, toplevel: ?*struct_xdg_toplevel, name: [*c]const u8) callconv(.c) ?*struct_xdg_toplevel_session_v1_98 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_v1)), XDG_SESSION_V1_RESTORE_TOPLEVEL, &xdg_toplevel_session_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_v1))), 0, @as(?*anyopaque, null), toplevel, name);
    return @ptrCast(@alignCast(id));
}
pub fn xdg_session_v1_remove_toplevel(xdg_session_v1: ?*struct_xdg_session_v1_42, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_session_v1)), XDG_SESSION_V1_REMOVE_TOPLEVEL, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_session_v1))), 0, name);
}
pub fn xdg_toplevel_session_v1_destroy(xdg_toplevel_session_v1: ?*struct_xdg_toplevel_session_v1_98) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_session_v1)), XDG_TOPLEVEL_SESSION_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_session_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn xdg_toplevel_tag_manager_v1_set_toplevel_tag(xdg_toplevel_tag_manager_v1: ?*struct_xdg_toplevel_tag_manager_v1_41, toplevel: ?*struct_xdg_toplevel, tag: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_tag_manager_v1)), XDG_TOPLEVEL_TAG_MANAGER_V1_SET_TOPLEVEL_TAG, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_tag_manager_v1))), 0, toplevel, tag);
}
pub fn ShouldMaskFullscreen() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local_mask_required = struct {
        var mask_required: c_int = -@as(c_int, 1);
    };
    _ = &static_local_mask_required;
    if (static_local_mask_required.mask_required >= @as(c_int, 0)) {
        return static_local_mask_required.mask_required != @as(c_int, 0);
    }
    var desktop: [*c]const u8 = SDL_getenv_REAL("XDG_CURRENT_DESKTOP");
    _ = &desktop;
    if ((desktop != null) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_strstr_REAL(desktop, "KDE")))) != @as(?*anyopaque, null))) {
        static_local_mask_required.mask_required = 1;
    } else {
        static_local_mask_required.mask_required = 0;
    }
    return static_local_mask_required.mask_required != @as(c_int, 0);
}
pub fn GetWindowScale(window: [*c]SDL_Window) callconv(.c) f64 {
    @setEvalBranchQuota(100000);
    return if (((window.*.flags & @as(c_ulong, 8192)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(window.*.internal.*.scale_to_display))))) != 0)) window.*.internal.*.scale_factor else @as(f64, 1.0);
}
pub fn PointToPixel(window: [*c]SDL_Window, point: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return if (point != 0) if (@as(c_int, @truncate(SDL_lround_REAL((@as(f64, @floatFromInt(point)) * GetWindowScale(window)) + @as(f64, 0.000001)))) > @as(c_int, 1)) @as(c_int, @truncate(SDL_lround_REAL((@as(f64, @floatFromInt(point)) * GetWindowScale(window)) + @as(f64, 0.000001)))) else @as(c_int, 1) else @as(c_int, 0);
}
pub fn PixelToPoint(window: [*c]SDL_Window, pixel: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return if (pixel != 0) if (@as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(pixel)) / GetWindowScale(window)))) > @as(c_int, 1)) @as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(pixel)) / GetWindowScale(window)))) else @as(c_int, 1) else @as(c_int, 0);
}
pub const WAYLAND_MODE_SCALE_UNDEFINED: c_int = 0;
pub const WAYLAND_MODE_SCALE_ASPECT: c_int = 1;
pub const WAYLAND_MODE_SCALE_STRETCH: c_int = 2;
pub const WAYLAND_MODE_SCALE_NONE: c_int = 3;
pub const enum_WaylandModeScale = c_uint;
pub fn GetModeScaleMethod() callconv(.c) enum_WaylandModeScale {
    @setEvalBranchQuota(100000);
    const static_local_scale_mode = struct {
        var scale_mode: enum_WaylandModeScale = WAYLAND_MODE_SCALE_UNDEFINED;
    };
    _ = &static_local_scale_mode;
    if (static_local_scale_mode.scale_mode == @as(enum_WaylandModeScale, WAYLAND_MODE_SCALE_UNDEFINED)) {
        var scale_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_VIDEO_WAYLAND_MODE_SCALING");
        _ = &scale_hint;
        if (scale_hint != null) {
            if (!(SDL_strcasecmp_REAL(scale_hint, "stretch") != 0)) {
                static_local_scale_mode.scale_mode = WAYLAND_MODE_SCALE_STRETCH;
            } else if (!(SDL_strcasecmp_REAL(scale_hint, "none") != 0)) {
                static_local_scale_mode.scale_mode = WAYLAND_MODE_SCALE_NONE;
            } else {
                static_local_scale_mode.scale_mode = WAYLAND_MODE_SCALE_ASPECT;
            }
        } else {
            static_local_scale_mode.scale_mode = WAYLAND_MODE_SCALE_ASPECT;
        }
    }
    return static_local_scale_mode.scale_mode;
}
pub const struct_BorderInsets = extern struct {
    left: c_int = 0,
    top: c_int = 0,
    right: c_int = 0,
    bottom: c_int = 0,
};
pub const BorderInsets = struct_BorderInsets;
pub fn GetBorderInsets(window: [*c]SDL_Window, insets: [*c]BorderInsets) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = memset(@ptrCast(@alignCast(insets)), 0, @sizeOf(@TypeOf(insets.*)));
    if (!window.*.internal.*.enable_insets) {
        return;
    }
    if (window.*.internal.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        const props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
        _ = &props;
        insets.*.left = @truncate(if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_left", 0) < @as(Sint64, @as(c_int, 0))) @as(Sint64, @as(c_int, 0)) else if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_left", 0) > @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) else SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_left", 0));
        insets.*.top = @truncate(if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_top", 0) < @as(Sint64, @as(c_int, 0))) @as(Sint64, @as(c_int, 0)) else if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_top", 0) > @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) else SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_top", 0));
        insets.*.right = @truncate(if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_right", 0) < @as(Sint64, @as(c_int, 0))) @as(Sint64, @as(c_int, 0)) else if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_right", 0) > @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) else SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_right", 0));
        insets.*.bottom = @truncate(if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_bottom", 0) < @as(Sint64, @as(c_int, 0))) @as(Sint64, @as(c_int, 0)) else if (SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_bottom", 0) > @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767)))))) @as(Sint64, @as(c_int, @as(Sint16, @truncate(@as(c_int, 32767))))) else SDL_GetNumberProperty_REAL(props, "SDL.window.wayland.border_inset_bottom", 0));
    }
}
pub fn SetMinMaxDimensions(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var min_width: c_int = undefined;
    _ = &min_width;
    var min_height: c_int = undefined;
    _ = &min_height;
    var max_width: c_int = undefined;
    _ = &max_width;
    var max_height: c_int = undefined;
    _ = &max_height;
    if ((window.*.flags & (@as(c_ulong, 1) | @as(c_ulong, 128))) != 0) {
        min_width = 0;
        min_height = 0;
        max_width = 0;
        max_height = 0;
    } else if ((window.*.flags & @as(c_ulong, 32)) != 0) {
        var adj_w: c_int = if (window.*.min_w > wind.*.system_limits.min_width) window.*.min_w else wind.*.system_limits.min_width;
        _ = &adj_w;
        var adj_h: c_int = if (window.*.min_h > wind.*.system_limits.min_height) window.*.min_h else wind.*.system_limits.min_height;
        _ = &adj_h;
        if (wind.*.scale_to_display) {
            adj_w = PixelToPoint(window, adj_w);
            adj_h = PixelToPoint(window, adj_h);
        }
        min_width = adj_w;
        min_height = adj_h;
        adj_w = if (window.*.max_w != 0) if (window.*.max_w > wind.*.system_limits.min_width) window.*.max_w else wind.*.system_limits.min_width else @as(c_int, 0);
        adj_h = if (window.*.max_h != 0) if (window.*.max_h > wind.*.system_limits.min_height) window.*.max_h else wind.*.system_limits.min_height else @as(c_int, 0);
        if (wind.*.scale_to_display) {
            adj_w = PixelToPoint(window, adj_w);
            adj_h = PixelToPoint(window, adj_h);
        }
        max_width = adj_w;
        max_height = adj_h;
    } else {
        min_width = wind.*.current.logical_width;
        min_height = wind.*.current.logical_height;
        max_width = wind.*.current.logical_width;
        max_height = wind.*.current.logical_height;
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (!(wind.*.shell_surface.libdecor.frame != null)) {
            return;
        }
        if ((((min_width != 0) and (min_height != 0)) and (min_width == max_width)) and (min_height == max_height)) {
            WAYLAND_libdecor_frame_unset_capabilities.?(wind.*.shell_surface.libdecor.frame, LIBDECOR_ACTION_RESIZE);
        } else {
            WAYLAND_libdecor_frame_set_capabilities.?(wind.*.shell_surface.libdecor.frame, LIBDECOR_ACTION_RESIZE);
        }
        if (WAYLAND_libdecor_frame_has_capability.?(wind.*.shell_surface.libdecor.frame, LIBDECOR_ACTION_RESIZE)) {
            WAYLAND_libdecor_frame_set_min_content_size.?(wind.*.shell_surface.libdecor.frame, min_width, min_height);
            WAYLAND_libdecor_frame_set_max_content_size.?(wind.*.shell_surface.libdecor.frame, max_width, max_height);
        }
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (!(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null)) {
            return;
        }
        var insets: BorderInsets = undefined;
        _ = &insets;
        GetBorderInsets(window, &insets);
        min_width = if ((min_width - (insets.left + insets.right)) > (if (min_width != 0) @as(c_int, 1) else @as(c_int, 0))) min_width - (insets.left + insets.right) else if (min_width != 0) @as(c_int, 1) else @as(c_int, 0);
        min_height = if ((min_height - (insets.top + insets.bottom)) > (if (min_height != 0) @as(c_int, 1) else @as(c_int, 0))) min_height - (insets.top + insets.bottom) else if (min_height != 0) @as(c_int, 1) else @as(c_int, 0);
        if (max_width != 0) {
            max_width = if ((max_width - (insets.left + insets.right)) > @as(c_int, 1)) max_width - (insets.left + insets.right) else @as(c_int, 1);
        }
        if (max_height != 0) {
            max_height = if ((max_height - (insets.top + insets.bottom)) > @as(c_int, 1)) max_height - (insets.top + insets.bottom) else @as(c_int, 1);
        }
        xdg_toplevel_set_min_size(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, min_width, min_height);
        xdg_toplevel_set_max_size(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, max_width, max_height);
    }
}
pub fn EnsurePopupPositionIsValid(window: [*c]SDL_Window, x: [*c]c_int, y: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var adj_count: c_int = 0;
    _ = &adj_count;
    if ((x.* + window.*.w) <= @as(c_int, 0)) {
        x.* = -window.*.w;
        adj_count += 1;
    }
    if ((y.* + window.*.h) <= @as(c_int, 0)) {
        y.* = -window.*.h;
        adj_count += 1;
    }
    if (x.* >= window.*.parent.*.w) {
        x.* = window.*.parent.*.w;
        adj_count += 1;
    }
    if (y.* >= window.*.parent.*.h) {
        y.* = window.*.parent.*.h;
        adj_count += 1;
    }
    if (adj_count > @as(c_int, 1)) {
        x.* += if (x.* < @as(c_int, 0)) @as(c_int, 1) else -@as(c_int, 1);
    }
}
pub fn GetWindowGeometry(wind: [*c]SDL_WindowData, geometry: [*c]SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    geometry.* = wind.*.explicit_geometry;
    if (SDL_RectEmpty(geometry)) {
        geometry.*.x = 0;
        geometry.*.y = 0;
        geometry.*.w = wind.*.current.logical_width;
        geometry.*.h = wind.*.current.logical_height;
    }
}
pub fn AdjustPopupOffset(popup: [*c]SDL_Window, x: [*c]c_int, y: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (popup.*.parent.*.internal.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        var adj_x: c_int = undefined;
        _ = &adj_x;
        var adj_y: c_int = undefined;
        _ = &adj_y;
        WAYLAND_libdecor_frame_translate_coordinate.?(popup.*.parent.*.internal.*.shell_surface.libdecor.frame, x.*, y.*, &adj_x, &adj_y);
        x.* = adj_x;
        y.* = adj_y;
    } else {
        x.* -= popup.*.parent.*.internal.*.explicit_geometry.x;
        y.* -= popup.*.parent.*.internal.*.explicit_geometry.y;
    }
}
pub fn RepositionPopup(window: [*c]SDL_Window, use_current_position: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) and (wind.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner != null)) and (xdg_popup_get_version(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_popup) >= @as(u32, XDG_POPUP_REPOSITION_SINCE_VERSION))) {
        var x: c_int = if (use_current_position) window.*.x else window.*.pending.x;
        _ = &x;
        var y: c_int = if (use_current_position) window.*.y else window.*.pending.y;
        _ = &y;
        EnsurePopupPositionIsValid(window, &x, &y);
        if (wind.*.scale_to_display) {
            x = PixelToPoint(window.*.parent, x);
            y = PixelToPoint(window.*.parent, y);
        }
        AdjustPopupOffset(window, &x, &y);
        var parent_geometry: SDL_Rect = undefined;
        _ = &parent_geometry;
        GetWindowGeometry(window.*.parent.*.internal, &parent_geometry);
        xdg_positioner_set_anchor_rect(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, 0, 0, parent_geometry.w, parent_geometry.h);
        xdg_positioner_set_size(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, wind.*.current.logical_width, wind.*.current.logical_height);
        xdg_positioner_set_offset(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, x, y);
        xdg_popup_reposition(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_popup, wind.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, 0);
    }
}
pub fn SetSurfaceOpaqueRegion(surface: ?*struct_wl_surface, width: c_int, height: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &viddata;
    if ((width != 0) and (height != 0)) {
        var region: ?*struct_wl_region = wl_compositor_create_region(viddata.*.compositor);
        _ = &region;
        wl_region_add(region, 0, 0, width, height);
        wl_surface_set_opaque_region(surface, region);
        wl_region_destroy(region);
    } else {
        wl_surface_set_opaque_region(surface, null);
    }
}
pub fn ConfigureWindowGeometry(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var scale_factor: f64 = undefined;
    _ = &scale_factor;
    var prev_pointer_scale_x: f64 = undefined;
    _ = &prev_pointer_scale_x;
    var prev_pointer_scale_y: f64 = undefined;
    _ = &prev_pointer_scale_y;
    var old_pixel_width: c_int = undefined;
    _ = &old_pixel_width;
    var old_pixel_height: c_int = undefined;
    _ = &old_pixel_height;
    var window_width: c_int = undefined;
    _ = &window_width;
    var window_height: c_int = undefined;
    _ = &window_height;
    var viewport_width: c_int = undefined;
    _ = &viewport_width;
    var viewport_height: c_int = undefined;
    _ = &viewport_height;
    var window_size_changed: bool = undefined;
    _ = &window_size_changed;
    var buffer_size_changed: bool = undefined;
    _ = &buffer_size_changed;
    var is_opaque: bool = undefined;
    _ = &is_opaque;
    var output_ratio: f32 = undefined;
    _ = &output_ratio;
    var mode_ratio: f32 = undefined;
    _ = &mode_ratio;
    var int_scale: i32 = undefined;
    _ = &int_scale;
    var min_width: c_int = undefined;
    _ = &min_width;
    var min_height: c_int = undefined;
    _ = &min_height;
    var max_width: c_int = undefined;
    _ = &max_width;
    var max_height: c_int = undefined;
    _ = &max_height;
    var aspect: f32 = undefined;
    _ = &aspect;
    var window_ratio: f32 = undefined;
    _ = &window_ratio;
    var window_ratio_1: f32 = undefined;
    _ = &window_ratio_1;
    var old_buffer: ?*struct_wl_buffer = undefined;
    _ = &old_buffer;
    var insets: BorderInsets = undefined;
    _ = &insets;
    var use_insets: bool = undefined;
    _ = &use_insets;
    var geometry: SDL_Rect = undefined;
    _ = &geometry;
    var child: [*c]SDL_Window = undefined;
    _ = &child;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                data = window.*.internal;
                scale_factor = GetWindowScale(window);
                prev_pointer_scale_x = data.*.pointer_scale.x;
                prev_pointer_scale_y = data.*.pointer_scale.y;
                old_pixel_width = data.*.current.pixel_width;
                old_pixel_height = data.*.current.pixel_height;
                window_width = 0;
                window_height = 0;
                is_opaque = !((window.*.flags & @as(c_ulong, 1073741824)) != 0) and (window.*.opacity == @as(f32, 1.0));
                if (data.*.is_fullscreen and window.*.fullscreen_exclusive) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                window_width = window.*.current_fullscreen_mode.w;
                window_height = window.*.current_fullscreen_mode.h;
                viewport_width = data.*.requested.logical_width;
                viewport_height = data.*.requested.logical_height;
                switch (GetModeScaleMethod()) {
                    @as(enum_WaylandModeScale, WAYLAND_MODE_SCALE_NONE) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(enum_WaylandModeScale, WAYLAND_MODE_SCALE_ASPECT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            2 => {
                if (!data.*.scale_to_display) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            3 => {
                if ((data.*.egl_window != null) and buffer_size_changed) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            4 => {
                window_size_changed = (((window_width != window.*.w) or (window_height != window.*.h)) or (data.*.current.viewport_width != viewport_width)) or (data.*.current.viewport_height != viewport_height);
                data.*.current.pixel_width = window_width;
                data.*.current.pixel_height = window_height;
                buffer_size_changed = (data.*.current.pixel_width != old_pixel_width) or (data.*.current.pixel_height != old_pixel_height);
                if (window_size_changed or buffer_size_changed) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            5 => {
                if ((window_width <= viewport_width) and (window_height <= viewport_height)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                viewport_width = window_width;
                viewport_height = window_height;
                {
                    sdl_pc = 4;
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
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                output_ratio = @as(f32, @floatFromInt(viewport_width)) / @as(f32, @floatFromInt(viewport_height));
                mode_ratio = @as(f32, @floatFromInt(window_width)) / @as(f32, @floatFromInt(window_height));
                if (output_ratio > mode_ratio) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                viewport_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(window_width)) * (@as(f32, @floatFromInt(viewport_height)) / @as(f32, @floatFromInt(window_height)))));
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (output_ratio < mode_ratio) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                viewport_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(window_height)) * (@as(f32, @floatFromInt(viewport_width)) / @as(f32, @floatFromInt(window_width)))));
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            17 => {
                if (data.*.viewport != null) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            20 => {
                wp_viewport_set_destination(data.*.viewport, viewport_width, viewport_height);
                data.*.current.logical_width = data.*.requested.logical_width;
                data.*.current.logical_height = data.*.requested.logical_height;
                data.*.current.viewport_width = viewport_width;
                data.*.current.viewport_height = viewport_height;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                int_scale = if (@divTrunc(window.*.current_fullscreen_mode.w, viewport_width) > @as(c_int, 1)) @divTrunc(window.*.current_fullscreen_mode.w, viewport_width) else @as(c_int, 1);
                wl_surface_set_buffer_scale(data.*.surface, int_scale);
                data.*.current.logical_width = window.*.current_fullscreen_mode.w;
                data.*.current.logical_height = window.*.current_fullscreen_mode.h;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                data.*.pointer_scale.x = @as(f64, @floatFromInt(window_width)) / @as(f64, @floatFromInt(viewport_width));
                data.*.pointer_scale.y = @as(f64, @floatFromInt(window_height)) / @as(f64, @floatFromInt(viewport_height));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                viewport_width = data.*.requested.logical_width;
                viewport_height = data.*.requested.logical_height;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                viewport_width = data.*.requested.pixel_width;
                viewport_height = data.*.requested.pixel_height;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (((((!data.*.enable_insets and (data.*.shell_surface_status != @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_HIDDEN))) and (data.*.viewport != null)) and (data.*.waylandData.*.subcompositor != null)) and !data.*.floating) and !data.*.is_fullscreen) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if ((window.*.flags & @as(c_ulong, 32)) != 0) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                window_width = viewport_width;
                window_height = viewport_height;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (!data.*.scale_to_display) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            29 => {
                min_width = window.*.min_w;
                min_height = window.*.min_h;
                max_width = window.*.max_w;
                max_height = window.*.max_h;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                min_width = window.*.floating.w;
                min_height = window.*.floating.h;
                max_width = window.*.floating.w;
                max_height = window.*.floating.h;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (min_width != 0) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                viewport_width = if (viewport_width > min_width) viewport_width else min_width;
                {
                    sdl_pc = 34;
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
                if (min_height != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                viewport_height = if (viewport_height > min_height) viewport_height else min_height;
                {
                    sdl_pc = 37;
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
                if (max_width != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                viewport_width = if (viewport_width < max_width) viewport_width else max_width;
                {
                    sdl_pc = 40;
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
                if (max_height != 0) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                viewport_height = if (viewport_height < max_height) viewport_height else max_height;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                aspect = @as(f32, @floatFromInt(viewport_width)) / @as(f32, @floatFromInt(viewport_height));
                if ((window.*.min_aspect != @as(f32, 0.0)) and (aspect < window.*.min_aspect)) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                viewport_height = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_width)) / window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_width)) / window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if ((window.*.max_aspect != @as(f32, 0.0)) and (aspect > window.*.max_aspect)) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                window_width = viewport_width;
                window_height = viewport_height;
                if (!data.*.scale_to_display) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                viewport_width = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_height)) * window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_height)) * window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                if ((viewport_width > data.*.requested.logical_width) or (viewport_height > data.*.requested.logical_height)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            51 => {
                if ((viewport_width > data.*.requested.pixel_width) or (viewport_height > data.*.requested.pixel_height)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            52 => {
                viewport_width = if (viewport_width > @as(c_int, 1)) viewport_width else @as(c_int, 1);
                viewport_height = if (viewport_height > @as(c_int, 1)) viewport_height else @as(c_int, 1);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            53 => {
                aspect = @as(f32, @floatFromInt(viewport_width)) / @as(f32, @floatFromInt(viewport_height));
                window_ratio = @as(f32, @floatFromInt(data.*.requested.logical_width)) / @as(f32, @floatFromInt(data.*.requested.logical_height));
                if (aspect >= window_ratio) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
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
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            56 => {
                viewport_width = data.*.requested.logical_width;
                viewport_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_width)) / aspect));
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                if (aspect < window_ratio) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                viewport_height = data.*.requested.logical_height;
                viewport_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_height)) * aspect));
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                aspect = @as(f32, @floatFromInt(viewport_width)) / @as(f32, @floatFromInt(viewport_height));
                window_ratio_1 = @as(f32, @floatFromInt(data.*.requested.pixel_width)) / @as(f32, @floatFromInt(data.*.requested.pixel_height));
                if (aspect >= window_ratio_1) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            65 => {
                viewport_width = data.*.requested.pixel_width;
                viewport_height = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_width)) / aspect));
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                if (aspect < window_ratio_1) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            68 => {
                viewport_height = data.*.requested.pixel_height;
                viewport_width = @truncate(SDL_lroundf_REAL(@as(f32, @floatFromInt(viewport_height)) * aspect));
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
                    sdl_pc = 67;
                    continue;
                }
            },
            71 => {
                data.*.current.pixel_width = PointToPixel(window, window_width);
                data.*.current.pixel_height = PointToPixel(window, window_height);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                data.*.current.pixel_width = window_width;
                data.*.current.pixel_height = window_height;
                viewport_width = PixelToPoint(window, viewport_width);
                viewport_height = PixelToPoint(window, viewport_height);
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                data.*.requested.logical_width = if (data.*.requested.logical_width > data.*.system_limits.min_width) data.*.requested.logical_width else data.*.system_limits.min_width;
                data.*.requested.logical_height = if (data.*.requested.logical_height > data.*.system_limits.min_height) data.*.requested.logical_height else data.*.system_limits.min_height;
                window_size_changed = (((data.*.requested.logical_width != data.*.current.logical_width) or (data.*.requested.logical_height != data.*.current.logical_height)) or (viewport_width != data.*.current.viewport_width)) or (viewport_height != data.*.current.viewport_height);
                buffer_size_changed = (data.*.current.pixel_width != old_pixel_width) or (data.*.current.pixel_height != old_pixel_height);
                if (window_size_changed or buffer_size_changed) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                if (data.*.viewport != null) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            77 => {
                wp_viewport_set_destination(data.*.viewport, viewport_width, viewport_height);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                if ((window.*.flags & @as(c_ulong, 8192)) != 0) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            79 => {
                data.*.current.logical_width = data.*.requested.logical_width;
                data.*.current.logical_height = data.*.requested.logical_height;
                data.*.current.viewport_width = viewport_width;
                data.*.current.viewport_height = viewport_height;
                data.*.pointer_scale.x = @as(f64, @floatFromInt(window_width)) / @as(f64, @floatFromInt(viewport_width));
                data.*.pointer_scale.y = @as(f64, @floatFromInt(window_height)) / @as(f64, @floatFromInt(viewport_height));
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            80 => {
                wl_surface_set_buffer_scale(data.*.surface, @intFromFloat(scale_factor));
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
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            83 => {
                WAYLAND_wl_egl_window_resize.?(data.*.egl_window, data.*.current.pixel_width, data.*.current.pixel_height, 0, 0);
                {
                    sdl_pc = 85;
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
                if ((((!data.*.enable_insets and (data.*.viewport != null)) and (data.*.waylandData.*.subcompositor != null)) and (!data.*.is_fullscreen or ShouldMaskFullscreen())) and ((viewport_width != data.*.current.logical_width) or (viewport_height != data.*.current.logical_height))) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            86 => {
                old_buffer = null;
                if (!(data.*.mask.surface != null)) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            87 => {
                if (data.*.mask.mapped) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            88 => {
                if (((data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) and (data.*.shell_surface.xdg.surface != null)) and (data.*.enable_insets or !(data.*.viewport != null))) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            89 => {
                data.*.mask.surface = wl_compositor_create_surface(data.*.waylandData.*.compositor);
                SDL_WAYLAND_register_surface(data.*.mask.surface);
                wl_surface_set_user_data(data.*.mask.surface, @ptrCast(@alignCast(data)));
                {
                    sdl_pc = 91;
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
                if (!(data.*.mask.subsurface != null)) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                data.*.mask.subsurface = wl_subcompositor_get_subsurface(data.*.waylandData.*.subcompositor, data.*.mask.surface, data.*.surface);
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                if (!(data.*.mask.viewport != null)) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                data.*.mask.viewport = wp_viewporter_get_viewport(data.*.waylandData.*.viewporter, data.*.mask.surface);
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                if (!(data.*.mask.buffer != null) or (@as(c_int, @intFromBool(data.*.mask.@"opaque")) != @as(c_int, @intFromBool(is_opaque)))) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                old_buffer = data.*.mask.buffer;
                data.*.mask.@"opaque" = is_opaque;
                data.*.mask.buffer = Wayland_CreateSinglePixelBuffer(0, 0, 0, if (is_opaque) @as(c_uint, 4294967295) else @as(Uint32, 0));
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                wl_surface_attach(data.*.mask.surface, data.*.mask.buffer, 0, 0);
                wl_subsurface_place_below(data.*.mask.subsurface, data.*.surface);
                wp_viewport_set_destination(data.*.mask.viewport, data.*.current.logical_width, data.*.current.logical_height);
                if (wl_surface_get_version(data.*.mask.surface) >= @as(u32, WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION)) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                wl_surface_damage_buffer(data.*.mask.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                wl_surface_damage(data.*.mask.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                if (is_opaque) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                SetSurfaceOpaqueRegion(data.*.mask.surface, data.*.current.logical_width, data.*.current.logical_height);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            105 => {
                SetSurfaceOpaqueRegion(data.*.mask.surface, 0, 0);
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                if (data.*.shell_surface_type != @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                data.*.mask.offset_x = @divTrunc(-(data.*.current.logical_width - viewport_width), @as(c_int, 2));
                data.*.mask.offset_y = @divTrunc(-(data.*.current.logical_height - viewport_height), @as(c_int, 2));
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                data.*.mask.offset_x = 0;
                data.*.mask.offset_y = 0;
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                wl_subsurface_set_position(data.*.mask.subsurface, data.*.mask.offset_x, data.*.mask.offset_y);
                wl_surface_commit(data.*.mask.surface);
                if (old_buffer != null) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                wl_buffer_destroy(old_buffer);
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                data.*.mask.mapped = @"true" != 0;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            113 => {
                wl_subsurface_set_position(data.*.mask.subsurface, 0, 0);
                wl_surface_attach(data.*.mask.surface, null, 0, 0);
                wl_surface_commit(data.*.mask.surface);
                data.*.mask.offset_x = 0;
                data.*.mask.offset_y = 0;
                data.*.mask.mapped = @"false" != 0;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            116 => {
                GetBorderInsets(window, &insets);
                use_insets = ((((insets.left != 0) or (insets.top != 0)) or (insets.right != 0)) or (insets.bottom != 0)) and !((window.*.flags & (@as(c_ulong, 128) | @as(c_ulong, 1))) != 0);
                geometry = SDL_Rect{
                    .x = 0,
                    .y = 0,
                    .w = data.*.current.logical_width,
                    .h = data.*.current.logical_height,
                };
                if (use_insets) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            117 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            118 => {
                if (window_size_changed) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            119 => {
                geometry.x = insets.left;
                geometry.y = insets.top;
                geometry.w = if ((geometry.w - (insets.left + insets.right)) > @as(c_int, 1)) geometry.w - (insets.left + insets.right) else @as(c_int, 1);
                geometry.h = if ((geometry.h - (insets.top + insets.bottom)) > @as(c_int, 1)) geometry.h - (insets.top + insets.bottom) else @as(c_int, 1);
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                if (((use_insets or !SDL_RectEmpty(&data.*.explicit_geometry)) or (!(data.*.viewport != null) and window_size_changed)) and !SDL_RectsEqual(&geometry, &data.*.explicit_geometry)) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            122 => {
                xdg_surface_set_window_geometry(data.*.shell_surface.xdg.surface, geometry.x, geometry.y, geometry.w, geometry.h);
                data.*.explicit_geometry = geometry;
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            125 => {
                if (is_opaque) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                if ((prev_pointer_scale_x != data.*.pointer_scale.x) or (prev_pointer_scale_y != data.*.pointer_scale.y)) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            128 => {
                SetSurfaceOpaqueRegion(data.*.surface, viewport_width, viewport_height);
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                SetSurfaceOpaqueRegion(data.*.surface, 0, 0);
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            130 => {
                child = window.*.first_child;
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                if (child != null) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 134;
                    continue;
                }
            },
            132 => {
                RepositionPopup(child, @"true" != 0);
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                child = child.*.next_sibling;
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            134 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            135 => {
                Wayland_DisplayUpdatePointerFocusedScale(data);
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            137 => {
                SetMinMaxDimensions(window);
                if (!data.*.scale_to_display) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, window_width, window_height);
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESIZED, data.*.current.pixel_width, data.*.current.pixel_height);
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED, data.*.current.pixel_width, data.*.current.pixel_height);
                if (data.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) {
                    sdl_pc = 141;
                    continue;
                } else {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                if ((buffer_size_changed or window_size_changed) or ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!data.*.suspended)))) != 0) and ((window.*.flags & @as(c_ulong, 4)) != 0))) {
                    sdl_pc = 144;
                    continue;
                } else {
                    sdl_pc = 145;
                    continue;
                }
            },
            142 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            143 => {
                {}
            },
            144 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            145 => {
                {
                    sdl_pc = 146;
                    continue;
                }
            },
            146 => {
                if (data.*.suspended) {
                    sdl_pc = 147;
                    continue;
                } else {
                    sdl_pc = 148;
                    continue;
                }
            },
            147 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_OCCLUDED, 0, 0);
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            148 => {
                {
                    sdl_pc = 149;
                    continue;
                }
            },
            149 => {
                {
                    sdl_pc = 143;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn CommitLibdecorFrame(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) and (wind.*.shell_surface.libdecor.frame != null)) {
        var state: ?*struct_libdecor_state = WAYLAND_libdecor_state_new.?(wind.*.current.logical_width, wind.*.current.logical_height);
        _ = &state;
        WAYLAND_libdecor_frame_commit.?(wind.*.shell_surface.libdecor.frame, state, null);
        WAYLAND_libdecor_state_free.?(state);
    }
}
pub fn pending_state_deadline_handler(data: ?*anyopaque, callback: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var windowID: SDL_WindowID = @truncate(@as(usize, @intCast(@intFromPtr(data))));
    _ = &windowID;
    var window: [*c]SDL_Window = SDL_GetWindowFromID_REAL(windowID);
    _ = &window;
    if ((window != null) and (window.*.internal != null)) {
        window.*.internal.*.pending_state_deadline_count -= 1;
    }
    wl_callback_destroy(callback);
}
pub var pending_state_deadline_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = pending_state_deadline_handler,
};
pub fn AddPendingStateSync(window_data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var video_data: [*c]SDL_VideoData = window_data.*.waylandData;
    _ = &video_data;
    var cb_data: ?*anyopaque = @ptrFromInt(@as(usize, window_data.*.sdlwindow.*.id));
    _ = &cb_data;
    window_data.*.pending_state_deadline_count += 1;
    var cb: ?*struct_wl_callback = wl_display_sync(video_data.*.display);
    _ = &cb;
    _ = wl_callback_add_listener(cb, &pending_state_deadline_listener, cb_data);
}
pub fn FlushPendingEvents(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const last_position_pending: bool = window.*.last_position_pending;
    _ = &last_position_pending;
    const last_size_pending: bool = window.*.last_size_pending;
    _ = &last_size_pending;
    while (window.*.internal.*.pending_state_deadline_count != 0) {
        _ = WAYLAND_wl_display_roundtrip.?(window.*.internal.*.waylandData.*.display);
    }
    window.*.last_position_pending = last_position_pending;
    window.*.last_size_pending = last_size_pending;
}
pub export fn Wayland_UpdateWindowPosition(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var display: [*c]SDL_DisplayData = undefined;
    _ = &display;
    if ((wind.*.outputs != null) and (wind.*.num_outputs != 0)) {
        display = wind.*.outputs[@bitCast(@as(isize, @intCast(wind.*.num_outputs - @as(c_int, 1))))];
    } else {
        return;
    }
    wind.*.last_displayID = display.*.display;
    if (wind.*.shell_surface_type != @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) {
        if (!wind.*.waylandData.*.scale_to_display_enabled) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, display.*.logical.x, display.*.logical.y);
        } else {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MOVED, display.*.pixel.x, display.*.pixel.y);
        }
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_DISPLAY_CHANGED, @bitCast(@as(c_uint, @truncate(wind.*.last_displayID))), 0);
    }
}
pub fn SetFullscreen(window: [*c]SDL_Window, output: ?*struct_wl_output_64, fullscreen: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (!(wind.*.shell_surface.libdecor.frame != null)) {
            return;
        }
        wind.*.fullscreen_exclusive = (if (output != null) @as(c_int, @intFromBool(window.*.fullscreen_exclusive)) else @"false") != 0;
        if (fullscreen) {
            WAYLAND_libdecor_frame_set_fullscreen.?(wind.*.shell_surface.libdecor.frame, output);
        } else {
            WAYLAND_libdecor_frame_unset_fullscreen.?(wind.*.shell_surface.libdecor.frame);
        }
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel))) == @as(?*anyopaque, null)) {
            return;
        }
        wind.*.fullscreen_exclusive = (if (output != null) @as(c_int, @intFromBool(window.*.fullscreen_exclusive)) else @"false") != 0;
        if (fullscreen) {
            xdg_toplevel_set_fullscreen(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, output);
        } else {
            xdg_toplevel_unset_fullscreen(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
        }
    }
    AddPendingStateSync(wind);
}
pub fn UpdateWindowFullscreen(window: [*c]SDL_Window, fullscreen: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    wind.*.is_fullscreen = fullscreen;
    if (fullscreen) {
        if (!((window.*.flags & @as(c_ulong, 1)) != 0)) {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&window.*.current_fullscreen_mode).*)) == @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)))) @compileError("static assertion failed \"sizeof (*(&window->current_fullscreen_mode)) == sizeof (*( &window->requested_fullscreen_mode))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&window.*.current_fullscreen_mode)), @ptrCast(@alignCast(&window.*.requested_fullscreen_mode)), @sizeOf(@TypeOf((&window.*.requested_fullscreen_mode).*)));
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_ENTER_FULLSCREEN, 0, 0);
            _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_ENTER, @"false" != 0);
            if (window.*.fullscreen_exclusive and (!wind.*.fullscreen_exclusive or !wind.*.fullscreen_was_positioned)) {
                var disp: [*c]SDL_VideoDisplay = SDL_GetVideoDisplay(window.*.current_fullscreen_mode.displayID);
                _ = &disp;
                if (disp != null) {
                    wind.*.fullscreen_was_positioned = @"true" != 0;
                    SetFullscreen(window, disp.*.internal.*.output, @"true" != 0);
                }
            }
        }
    } else {
        if ((((window.*.flags & @as(c_ulong, 1)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!window.*.is_hiding)))) != 0)) and !((window.*.flags & @as(c_ulong, 8)) != 0)) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_LEAVE_FULLSCREEN, 0, 0);
            _ = SDL_UpdateFullscreenMode(window, SDL_FULLSCREEN_OP_LEAVE, @"false" != 0);
            wind.*.fullscreen_was_positioned = @"false" != 0;
            Wayland_UpdateWindowPosition(window);
        }
    }
}
pub fn surface_frame_done(data: ?*anyopaque, cb: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    if (wl_compositor_get_version(wind.*.waylandData.*.compositor) >= @as(u32, WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION)) {
        wl_surface_damage_buffer(wind.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
    } else {
        wl_surface_damage(wind.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
    }
    wind.*.pending_state_commit = @"false" != 0;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (wind.*.pending_config_ack) {
            wind.*.pending_config_ack = @"false" != 0;
            ConfigureWindowGeometry(wind.*.sdlwindow);
            xdg_surface_ack_configure(wind.*.shell_surface.xdg.surface, wind.*.shell_surface.xdg.serial);
        }
    } else {
        wind.*.resizing = @"false" != 0;
    }
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME)) {
        wind.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_SHOWN;
        {
            var w: [*c]SDL_Window = wind.*.sdlwindow.*.first_child;
            _ = &w;
            while (w != null) : (w = w.*.next_sibling) {
                if (w.*.internal.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOW_PENDING)) {
                    Wayland_ShowWindow(SDL_GetVideoDevice(), w);
                } else if (w.*.internal.*.reparenting_required) {
                    _ = Wayland_SetWindowParent(SDL_GetVideoDevice(), w, w.*.parent);
                    if ((w.*.flags & @as(c_ulong, 4096)) != 0) {
                        _ = Wayland_SetWindowModal(SDL_GetVideoDevice(), w, @"true" != 0);
                    }
                }
            }
        }
        if (wind.*.suspended) {
            _ = SDL_SendWindowEvent(wind.*.sdlwindow, SDL_EVENT_WINDOW_OCCLUDED, 0, 0);
        }
    }
    wl_callback_destroy(cb);
    wind.*.surface_frame_callback = wl_surface_frame(wind.*.surface);
    _ = wl_callback_add_listener(wind.*.surface_frame_callback, &surface_frame_listener, data);
}
pub const surface_frame_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = surface_frame_done,
};
pub fn gles_swap_frame_done(data: ?*anyopaque, cb: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    _ = SDL_SetAtomicInt_REAL(&wind.*.swap_interval_ready, 1);
    wind.*.gles_swap_frame_callback = wl_surface_frame(wind.*.gles_swap_frame_surface_wrapper);
    wl_callback_destroy(cb);
    _ = wl_callback_add_listener(wind.*.gles_swap_frame_callback, &gles_swap_frame_listener, data);
}
pub const gles_swap_frame_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = gles_swap_frame_done,
};
pub fn handle_xdg_surface_configure(data: ?*anyopaque, xdg: ?*struct_xdg_surface, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    var window: [*c]SDL_Window = wind.*.sdlwindow;
    _ = &window;
    wind.*.shell_surface.xdg.serial = serial;
    if (!wind.*.resizing) {
        wind.*.pending_config_ack = @"false" != 0;
        ConfigureWindowGeometry(window);
        xdg_surface_ack_configure(xdg, serial);
    } else if (!wind.*.pending_config_ack) {
        wind.*.pending_config_ack = @"true" != 0;
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
    }
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
        wind.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME;
    }
}
pub const _xdg_surface_listener: struct_xdg_surface_listener = struct_xdg_surface_listener{
    .configure = handle_xdg_surface_configure,
};
pub fn ApplyGeometryLimits(window: [*c]SDL_Window, req_w: c_int, req_h: c_int, out_w: [*c]c_int, out_h: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var w: c_int = req_w;
    _ = &w;
    var h: c_int = req_h;
    _ = &h;
    const aspect: f32 = @as(f32, @floatFromInt(req_w)) / @as(f32, @floatFromInt(req_h));
    _ = &aspect;
    if (!wind.*.resizing or ((wind.*.resize_edge & @as(enum_unnamed_87, WAYLAND_RESIZE_EDGE_CORNER)) == @as(enum_unnamed_87, WAYLAND_RESIZE_EDGE_CORNER))) {
        if ((window.*.min_aspect != @as(f32, 0.0)) and (aspect < window.*.min_aspect)) {
            h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            if (h < window.*.min_h) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_h != 0) and (h > window.*.max_h)) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
        } else if ((window.*.max_aspect != @as(f32, 0.0)) and (aspect > window.*.max_aspect)) {
            w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            if (w < window.*.min_w) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_w != 0) and (w > window.*.max_w)) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
        }
    } else if ((wind.*.resize_edge & @as(enum_unnamed_87, WAYLAND_RESIZE_EDGE_LR)) != 0) {
        if ((window.*.min_aspect != @as(f32, 0.0)) and (aspect < window.*.min_aspect)) {
            h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            if (h < window.*.min_h) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_h != 0) and (h > window.*.max_h)) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
        } else if ((window.*.max_aspect != @as(f32, 0.0)) and (aspect > window.*.max_aspect)) {
            h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_w)) / window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            if (h < window.*.min_h) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_h)) * window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_h != 0) and (h > window.*.max_h)) {
                w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_h)) * window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
        }
    } else if ((wind.*.resize_edge & @as(enum_unnamed_87, WAYLAND_RESIZE_EDGE_TB)) != 0) {
        if ((window.*.min_aspect != @as(f32, 0.0)) and (aspect < window.*.min_aspect)) {
            w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            if (w < window.*.min_w) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_w != 0) and (w > window.*.max_w)) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.min_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.min_aspect) else @as(c_long, @as(c_int, 1)));
            }
        } else if ((window.*.max_aspect != @as(f32, 0.0)) and (aspect > window.*.max_aspect)) {
            w = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(req_h)) * window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            if (w < window.*.min_w) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.min_w)) / window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
            if ((window.*.max_w != 0) and (w > window.*.max_w)) {
                h = @truncate(if (SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.max_aspect) > @as(c_long, @as(c_int, 1))) SDL_lroundf_REAL(@as(f32, @floatFromInt(window.*.max_w)) / window.*.max_aspect) else @as(c_long, @as(c_int, 1)));
            }
        }
    }
    if (window.*.max_w != 0) {
        w = if (w < window.*.max_w) w else window.*.max_w;
    }
    out_w.* = if (w > window.*.min_w) w else window.*.min_w;
    if (window.*.max_h != 0) {
        h = if (h < window.*.max_h) h else window.*.max_h;
    }
    out_h.* = if (h > window.*.min_h) h else window.*.min_h;
}
pub fn DetermineResizeAxis(wind: [*c]SDL_WindowData, width: c_int, height: c_int, resizing: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (resizing) {
        const now: Uint64 = SDL_GetTicksNS_REAL();
        _ = &now;
        if (now >= (wind.*.last_resize_event_time_ns +% (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 500)))) *% @as(Uint64, SDL_NS_PER_MS)))) {
            wind.*.resize_edge = 0;
        }
        wind.*.last_resize_event_time_ns = now;
        if (!(wind.*.resize_edge != 0)) {
            if ((width != wind.*.last_configure.width) or !(height != 0)) {
                wind.*.resize_edge |= WAYLAND_RESIZE_EDGE_LR;
            }
            if ((height != wind.*.last_configure.height) or !(width != 0)) {
                wind.*.resize_edge |= WAYLAND_RESIZE_EDGE_TB;
            }
        }
    } else {
        wind.*.resize_edge = 0;
    }
    wind.*.resizing = resizing;
}
pub fn handle_xdg_toplevel_configure(data: ?*anyopaque, _: ?*struct_xdg_toplevel, arg_width: i32, arg_height: i32, states: [*c]struct_wl_array) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var width = arg_width;
    _ = &width;
    var height = arg_height;
    _ = &height;
    var wind: [*c]SDL_WindowData = undefined;
    _ = &wind;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var state: [*c]enum_xdg_toplevel_state = undefined;
    _ = &state;
    var fullscreen: bool = undefined;
    _ = &fullscreen;
    var maximized: bool = undefined;
    _ = &maximized;
    var floating: bool = undefined;
    _ = &floating;
    var tiled: bool = undefined;
    _ = &tiled;
    var active: bool = undefined;
    _ = &active;
    var resizing: bool = undefined;
    _ = &resizing;
    var suspended: bool = undefined;
    _ = &suspended;
    var insets_apply: bool = undefined;
    _ = &insets_apply;
    var new_configure_size: bool = undefined;
    _ = &new_configure_size;
    var insets: BorderInsets = undefined;
    _ = &insets;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                wind = @ptrCast(@alignCast(data));
                window = wind.*.sdlwindow;
                fullscreen = @"false" != 0;
                maximized = @"false" != 0;
                floating = @"true" != 0;
                tiled = @"false" != 0;
                active = @"false" != 0;
                resizing = @"false" != 0;
                suspended = @"false" != 0;
                wind.*.toplevel_constraints = 0;
                state = @ptrCast(@alignCast(states.*.data));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((states.*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(state))) < (@as([*c]const u8, @ptrCast(@alignCast(states.*.data))) + states.*.size))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                switch (state.*) {
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_FULLSCREEN) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_MAXIMIZED) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_RESIZING) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_ACTIVATED) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_TILED_LEFT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_TILED_RIGHT) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_TILED_TOP) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_TILED_BOTTOM) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_SUSPENDED) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_CONSTRAINED_TOP) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(enum_xdg_toplevel_state, XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            3 => {
                state += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                insets_apply = (wind.*.enable_insets and !fullscreen) and !maximized;
                new_configure_size = ((width != wind.*.last_configure.width) or (height != wind.*.last_configure.height)) or (@as(c_int, @intFromBool(insets_apply)) != @as(c_int, @intFromBool(wind.*.last_configure.insets_apply)));
                insets = BorderInsets{
                    .left = 0,
                    .top = 0,
                    .right = 0,
                    .bottom = 0,
                };
                if (insets_apply) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                fullscreen = @"true" != 0;
                floating = @"false" != 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            7 => {
                maximized = @"true" != 0;
                floating = @"false" != 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                resizing = @"true" != 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                active = @"true" != 0;
                {
                    sdl_pc = 5;
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
                {
                    sdl_pc = 12;
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
                tiled = @"true" != 0;
                floating = @"false" != 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            14 => {
                suspended = @"true" != 0;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            15 => {
                wind.*.toplevel_constraints |= WAYLAND_TOPLEVEL_CONSTRAINED_LEFT;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            16 => {
                wind.*.toplevel_constraints |= WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            17 => {
                wind.*.toplevel_constraints |= WAYLAND_TOPLEVEL_CONSTRAINED_TOP;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            18 => {
                wind.*.toplevel_constraints |= WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            20 => {
                GetBorderInsets(window, &insets);
                {
                    sdl_pc = 22;
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
                DetermineResizeAxis(wind, width, height, resizing);
                UpdateWindowFullscreen(window, fullscreen);
                if (active or !((window.*.flags & @as(c_ulong, 64)) != 0)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if ((window.*.flags & @as(c_ulong, 64)) != 0) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (!fullscreen) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            26 => {
                _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
                {
                    sdl_pc = 28;
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
                _ = SDL_SendWindowEvent(window, @bitCast(if (maximized and !fullscreen) SDL_EVENT_WINDOW_MAXIMIZED else SDL_EVENT_WINDOW_RESTORED), 0, 0);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            29 => {
                if (((window.*.flags & @as(c_ulong, 32)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(maximized))))) != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                if ((width == @as(c_int, 0)) or (height == @as(c_int, 0))) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            31 => {
                wind.*.last_configure.width = width;
                wind.*.last_configure.height = height;
                wind.*.last_configure.insets_apply = insets_apply;
                wind.*.floating = floating;
                wind.*.suspended = suspended;
                wind.*.active = active;
                window.*.tiled = tiled;
                {}
            },
            32 => {
                if (!(width != 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                if (!wind.*.scale_to_display) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            34 => {
                if (floating) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            35 => {
                if (floating) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            36 => {
                if (new_configure_size) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            37 => {
                if (!(height != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            38 => {
                width = window.*.floating.w;
                if ((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) and (wind.*.toplevel_bounds.width != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            39 => {
                width = window.*.windowed.w;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                if (!wind.*.scale_to_display) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                width = if (wind.*.toplevel_bounds.width < width) wind.*.toplevel_bounds.width else width;
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                wind.*.requested.logical_width = width;
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                wind.*.requested.pixel_width = width;
                width = blk: {
                    const tmp = PixelToPoint(window, width);
                    wind.*.requested.logical_width = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                width = if ((width - (insets.left + insets.right)) > @as(c_int, 1)) width - (insets.left + insets.right) else @as(c_int, 1);
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            47 => {
                wind.*.requested.logical_width = width + (insets.left + insets.right);
                if (wind.*.scale_to_display) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            50 => {
                wind.*.requested.pixel_width = PointToPixel(window, wind.*.requested.logical_width);
                {
                    sdl_pc = 52;
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
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            53 => {
                if (floating) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            54 => {
                if (new_configure_size) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            56 => {
                height = window.*.floating.h;
                if ((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) and (wind.*.toplevel_bounds.height != 0)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            57 => {
                height = window.*.windowed.h;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (!wind.*.scale_to_display) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            59 => {
                height = if (wind.*.toplevel_bounds.height < height) wind.*.toplevel_bounds.height else height;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                wind.*.requested.logical_height = height;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                wind.*.requested.pixel_height = height;
                height = blk: {
                    const tmp = PixelToPoint(window, height);
                    wind.*.requested.logical_height = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                height = if ((height - (insets.top + insets.bottom)) > @as(c_int, 1)) height - (insets.top + insets.bottom) else @as(c_int, 1);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            65 => {
                wind.*.requested.logical_height = height + (insets.top + insets.bottom);
                if (wind.*.scale_to_display) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
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
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            68 => {
                wind.*.requested.pixel_height = PointToPixel(window, wind.*.requested.logical_height);
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
                    sdl_pc = 67;
                    continue;
                }
            },
            71 => {
                width = blk: {
                    const tmp = window.*.floating.w;
                    wind.*.requested.logical_width = tmp;
                    break :blk tmp;
                };
                height = blk: {
                    const tmp = window.*.floating.h;
                    wind.*.requested.logical_height = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                wind.*.requested.pixel_width = window.*.floating.w;
                wind.*.requested.pixel_height = window.*.floating.h;
                width = blk: {
                    const tmp = PixelToPoint(window, window.*.floating.w);
                    wind.*.requested.logical_width = tmp;
                    break :blk tmp;
                };
                height = blk: {
                    const tmp = PixelToPoint(window, window.*.floating.h);
                    wind.*.requested.logical_height = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                width = if ((width - (insets.left + insets.right)) > @as(c_int, 1)) width - (insets.left + insets.right) else @as(c_int, 1);
                height = if ((height - (insets.top + insets.bottom)) > @as(c_int, 1)) height - (insets.top + insets.bottom) else @as(c_int, 1);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            74 => {
                if (!wind.*.scale_to_display) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            77 => {
                ApplyGeometryLimits(window, wind.*.requested.logical_width, wind.*.requested.logical_height, &wind.*.requested.logical_width, &wind.*.requested.logical_height);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                ApplyGeometryLimits(window, wind.*.requested.pixel_width, wind.*.requested.pixel_height, &wind.*.requested.pixel_width, &wind.*.requested.pixel_height);
                wind.*.requested.logical_width = PixelToPoint(window, wind.*.requested.pixel_width);
                wind.*.requested.logical_height = PixelToPoint(window, wind.*.requested.pixel_height);
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            80 => {
                width = wind.*.requested.logical_width;
                height = wind.*.requested.logical_height;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                wind.*.requested.logical_width = width;
                wind.*.requested.logical_height = height;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                if (wind.*.scale_to_display) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            83 => {
                wind.*.requested.pixel_width = PointToPixel(window, width);
                wind.*.requested.pixel_height = PointToPixel(window, height);
                {
                    sdl_pc = 85;
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn handle_xdg_toplevel_close(data: ?*anyopaque, _: ?*struct_xdg_toplevel) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    _ = SDL_SendWindowEvent(window.*.sdlwindow, SDL_EVENT_WINDOW_CLOSE_REQUESTED, 0, 0);
}
pub fn handle_xdg_toplevel_configure_bounds(data: ?*anyopaque, _: ?*struct_xdg_toplevel, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    window.*.toplevel_bounds.width = width;
    window.*.toplevel_bounds.height = height;
}
pub fn handle_xdg_toplevel_wm_capabilities(data: ?*anyopaque, _: ?*struct_xdg_toplevel, capabilities: [*c]struct_wl_array) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = undefined;
    _ = &wind;
    var wm_cap: [*c]enum_xdg_toplevel_wm_capabilities = undefined;
    _ = &wm_cap;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                wind = @ptrCast(@alignCast(data));
                wind.*.wm_caps = 0;
                wm_cap = @ptrCast(@alignCast(capabilities.*.data));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((capabilities.*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(wm_cap))) < (@as([*c]const u8, @ptrCast(@alignCast(capabilities.*.data))) + capabilities.*.size))) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                switch (wm_cap.*) {
                    @as(enum_xdg_toplevel_wm_capabilities, XDG_TOPLEVEL_WM_CAPABILITIES_WINDOW_MENU) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(enum_xdg_toplevel_wm_capabilities, XDG_TOPLEVEL_WM_CAPABILITIES_MAXIMIZE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(enum_xdg_toplevel_wm_capabilities, XDG_TOPLEVEL_WM_CAPABILITIES_FULLSCREEN) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(enum_xdg_toplevel_wm_capabilities, XDG_TOPLEVEL_WM_CAPABILITIES_MINIMIZE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            3 => {
                wm_cap += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                {}
            },
            5 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            6 => {
                wind.*.wm_caps |= WAYLAND_WM_CAPS_WINDOW_MENU;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            7 => {
                wind.*.wm_caps |= WAYLAND_WM_CAPS_MAXIMIZE;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                wind.*.wm_caps |= WAYLAND_WM_CAPS_FULLSCREEN;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            9 => {
                wind.*.wm_caps |= WAYLAND_WM_CAPS_MINIMIZE;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const toplevel_listener_xdg: struct_xdg_toplevel_listener = struct_xdg_toplevel_listener{
    .configure = handle_xdg_toplevel_configure,
    .close = handle_xdg_toplevel_close,
    .configure_bounds = handle_xdg_toplevel_configure_bounds,
    .wm_capabilities = handle_xdg_toplevel_wm_capabilities,
};
pub fn handle_xdg_popup_configure(data: ?*anyopaque, _: ?*struct_xdg_popup_81, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var width = arg_width;
    _ = &width;
    var height = arg_height;
    _ = &height;
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    var offset_x: c_int = 0;
    _ = &offset_x;
    var offset_y: c_int = 0;
    _ = &offset_y;
    AdjustPopupOffset(wind.*.sdlwindow, &offset_x, &offset_y);
    x -= offset_x;
    y -= offset_y;
    if ((width == @as(c_int, 0)) or (height == @as(c_int, 0))) {
        width = wind.*.sdlwindow.*.floating.w;
        height = wind.*.sdlwindow.*.floating.h;
    }
    if ((width != wind.*.last_configure.width) or (height != wind.*.last_configure.height)) {
        wind.*.requested.logical_width = width;
        wind.*.requested.logical_height = height;
        if (wind.*.scale_to_display) {
            wind.*.requested.pixel_width = PointToPixel(wind.*.sdlwindow, width);
            wind.*.requested.pixel_height = PointToPixel(wind.*.sdlwindow, height);
        }
    }
    if (wind.*.scale_to_display) {
        x = PointToPixel(wind.*.sdlwindow.*.parent, x);
        y = PointToPixel(wind.*.sdlwindow.*.parent, y);
    }
    _ = SDL_SendWindowEvent(wind.*.sdlwindow, SDL_EVENT_WINDOW_MOVED, x, y);
    wind.*.last_configure.width = width;
    wind.*.last_configure.height = height;
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
        wind.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME;
    }
}
pub fn handle_xdg_popup_done(data: ?*anyopaque, _: ?*struct_xdg_popup_81) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    _ = SDL_SendWindowEvent(window.*.sdlwindow, SDL_EVENT_WINDOW_CLOSE_REQUESTED, 0, 0);
}
pub fn handle_xdg_popup_repositioned(_: ?*anyopaque, _: ?*struct_xdg_popup_81, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const _xdg_popup_listener: struct_xdg_popup_listener = struct_xdg_popup_listener{
    .configure = handle_xdg_popup_configure,
    .popup_done = handle_xdg_popup_done,
    .repositioned = handle_xdg_popup_repositioned,
};
pub fn handle_xdg_toplevel_decoration_configure(data: ?*anyopaque, _: ?*struct_zxdg_toplevel_decoration_v1_88, mode: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = @ptrCast(@alignCast(data));
    _ = &window;
    var internal: [*c]SDL_WindowData = window.*.internal;
    _ = &internal;
    var device: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &device;
    if (mode == @as(u32, ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE)) {
        if ((window.*.flags & @as(c_ulong, 16)) != 0) {
            return;
        }
        if (!Wayland_LoadLibdecor(internal.*.waylandData, @"true" != 0)) {
            return;
        }
        _ = WAYLAND_wl_display_roundtrip.?(internal.*.waylandData.*.display);
        Wayland_HideWindow(device, window);
        internal.*.shell_surface_type = WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR;
        Wayland_ShowWindow(device, window);
    }
}
pub const xdg_toplevel_decoration_listener: struct_zxdg_toplevel_decoration_v1_listener = struct_zxdg_toplevel_decoration_v1_listener{
    .configure = handle_xdg_toplevel_decoration_configure,
};
pub fn OverrideLibdecorLimits(window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(WAYLAND_libdecor_frame_get_min_content_size != null)) {
        WAYLAND_libdecor_frame_set_min_content_size.?(window.*.internal.*.shell_surface.libdecor.frame, window.*.min_w, window.*.min_h);
    }
}
pub fn LibdecorGetMinContentSize(frame: ?*struct_libdecor_frame, min_w: [*c]c_int, min_h: [*c]c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(&WAYLAND_libdecor_frame_get_min_content_size)))) != @as(?*anyopaque, null)) {
        WAYLAND_libdecor_frame_get_min_content_size.?(frame, min_w, min_h);
    }
}
pub fn decoration_frame_configure(frame: ?*struct_libdecor_frame, configuration: ?*struct_libdecor_configuration, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(user_data));
    _ = &wind;
    var window: [*c]SDL_Window = wind.*.sdlwindow;
    _ = &window;
    var window_state: enum_libdecor_window_state = undefined;
    _ = &window_state;
    var width: c_int = undefined;
    _ = &width;
    var height: c_int = undefined;
    _ = &height;
    var active: bool = @"false" != 0;
    _ = &active;
    var fullscreen: bool = @"false" != 0;
    _ = &fullscreen;
    var maximized: bool = @"false" != 0;
    _ = &maximized;
    var tiled: bool = @"false" != 0;
    _ = &tiled;
    var suspended: bool = @"false" != 0;
    _ = &suspended;
    var resizing: bool = @"false" != 0;
    _ = &resizing;
    wind.*.toplevel_constraints = 0;
    const static_local_tiled_states = struct {
        const tiled_states: enum_libdecor_window_state = @bitCast(((LIBDECOR_WINDOW_STATE_TILED_LEFT | LIBDECOR_WINDOW_STATE_TILED_RIGHT) | LIBDECOR_WINDOW_STATE_TILED_TOP) | LIBDECOR_WINDOW_STATE_TILED_BOTTOM);
    };
    _ = &static_local_tiled_states;
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
        LibdecorGetMinContentSize(frame, &wind.*.system_limits.min_width, &wind.*.system_limits.min_height);
    }
    if (WAYLAND_libdecor_configuration_get_window_state.?(configuration, &window_state)) {
        fullscreen = (window_state & @as(enum_libdecor_window_state, LIBDECOR_WINDOW_STATE_FULLSCREEN)) != @as(enum_libdecor_window_state, 0);
        maximized = (window_state & @as(enum_libdecor_window_state, LIBDECOR_WINDOW_STATE_MAXIMIZED)) != @as(enum_libdecor_window_state, 0);
        active = (window_state & @as(enum_libdecor_window_state, LIBDECOR_WINDOW_STATE_ACTIVE)) != @as(enum_libdecor_window_state, 0);
        tiled = (window_state & static_local_tiled_states.tiled_states) != @as(enum_libdecor_window_state, 0);
        suspended = (window_state & @as(enum_libdecor_window_state, LIBDECOR_WINDOW_STATE_SUSPENDED)) != @as(enum_libdecor_window_state, 0);
    }
    const floating: bool = !((fullscreen or maximized) or tiled);
    _ = &floating;
    UpdateWindowFullscreen(window, fullscreen);
    if (active or !((window.*.flags & @as(c_ulong, 64)) != 0)) {
        if ((window.*.flags & @as(c_ulong, 64)) != 0) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_RESTORED, 0, 0);
        }
        _ = SDL_SendWindowEvent(window, @bitCast(if (maximized and !fullscreen) SDL_EVENT_WINDOW_MAXIMIZED else SDL_EVENT_WINDOW_RESTORED), 0, 0);
    }
    if (fullscreen) {
        if (!WAYLAND_libdecor_configuration_get_content_size.?(configuration, frame, &width, &height)) {
            width = wind.*.requested.logical_width;
            height = wind.*.requested.logical_height;
        } else {
            wind.*.requested.logical_width = width;
            wind.*.requested.logical_height = height;
            if (wind.*.scale_to_display) {
                wind.*.requested.pixel_width = PointToPixel(window, width);
                wind.*.requested.pixel_height = PointToPixel(window, height);
            }
        }
    } else {
        if (!((window.*.flags & @as(c_ulong, 32)) != 0) and !maximized) {
            if (!wind.*.scale_to_display) {
                width = blk: {
                    const tmp = window.*.floating.w;
                    wind.*.requested.logical_width = tmp;
                    break :blk tmp;
                };
                height = blk: {
                    const tmp = window.*.floating.h;
                    wind.*.requested.logical_height = tmp;
                    break :blk tmp;
                };
            } else {
                wind.*.requested.pixel_width = window.*.floating.w;
                wind.*.requested.pixel_height = window.*.floating.h;
                width = blk: {
                    const tmp = PixelToPoint(window, window.*.floating.w);
                    wind.*.requested.logical_width = tmp;
                    break :blk tmp;
                };
                height = blk: {
                    const tmp = PixelToPoint(window, window.*.floating.h);
                    wind.*.requested.logical_height = tmp;
                    break :blk tmp;
                };
            }
            OverrideLibdecorLimits(window);
        } else {
            if ((floating and (!wind.*.floating and !((window.*.flags & @as(c_ulong, 16)) != 0))) or !WAYLAND_libdecor_configuration_get_content_size.?(configuration, frame, &width, &height)) {
                width = 0;
                height = 0;
            }
            const new_configure_size: bool = (width != wind.*.last_configure.width) or (height != wind.*.last_configure.height);
            _ = &new_configure_size;
            DetermineResizeAxis(wind, width, height, resizing);
            if (!(width != 0)) {
                if (floating) {
                    width = window.*.floating.w;
                    if ((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) and (wind.*.toplevel_bounds.width != 0)) {
                        width = if (wind.*.toplevel_bounds.width < width) wind.*.toplevel_bounds.width else width;
                    }
                } else {
                    width = window.*.windowed.w;
                }
                if (!wind.*.scale_to_display) {
                    wind.*.requested.logical_width = width;
                } else {
                    wind.*.requested.pixel_width = width;
                    width = blk: {
                        const tmp = PixelToPoint(window, width);
                        wind.*.requested.logical_width = tmp;
                        break :blk tmp;
                    };
                }
            } else {
                if (new_configure_size and !((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME)) and (@as(c_int, @intFromBool(wind.*.suspended)) != @as(c_int, @intFromBool(suspended))))) {
                    wind.*.requested.logical_width = width;
                    if (wind.*.scale_to_display) {
                        wind.*.requested.pixel_width = PointToPixel(window, width);
                    }
                }
            }
            if (!(height != 0)) {
                if (floating) {
                    height = window.*.floating.h;
                    if ((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) and (wind.*.toplevel_bounds.height != 0)) {
                        height = if (wind.*.toplevel_bounds.height < height) wind.*.toplevel_bounds.height else height;
                    }
                } else {
                    height = window.*.windowed.h;
                }
                if (!wind.*.scale_to_display) {
                    wind.*.requested.logical_height = height;
                } else {
                    wind.*.requested.pixel_height = height;
                    height = blk: {
                        const tmp = PixelToPoint(window, height);
                        wind.*.requested.logical_height = tmp;
                        break :blk tmp;
                    };
                }
            } else {
                if (new_configure_size and !((wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME)) and (@as(c_int, @intFromBool(wind.*.suspended)) != @as(c_int, @intFromBool(suspended))))) {
                    wind.*.requested.logical_height = height;
                    if (wind.*.scale_to_display) {
                        wind.*.requested.pixel_height = PointToPixel(window, height);
                    }
                }
            }
        }
        if (floating) {
            if (!wind.*.scale_to_display) {
                ApplyGeometryLimits(window, wind.*.requested.logical_width, wind.*.requested.logical_height, &wind.*.requested.logical_width, &wind.*.requested.logical_height);
            } else {
                ApplyGeometryLimits(window, wind.*.requested.pixel_width, wind.*.requested.pixel_height, &wind.*.requested.pixel_width, &wind.*.requested.pixel_height);
                wind.*.requested.logical_width = PixelToPoint(window, wind.*.requested.pixel_width);
                wind.*.requested.logical_height = PixelToPoint(window, wind.*.requested.pixel_height);
            }
        }
    }
    const started_resize: bool = !wind.*.resizing and resizing;
    _ = &started_resize;
    wind.*.last_configure.width = width;
    wind.*.last_configure.height = height;
    wind.*.floating = floating;
    wind.*.suspended = suspended;
    wind.*.active = active;
    window.*.tiled = tiled;
    wind.*.resizing = resizing;
    if (!wind.*.resizing or started_resize) {
        ConfigureWindowGeometry(window);
        var state: ?*struct_libdecor_state = WAYLAND_libdecor_state_new.?(wind.*.current.logical_width, wind.*.current.logical_height);
        _ = &state;
        WAYLAND_libdecor_frame_commit.?(frame, state, configuration);
        WAYLAND_libdecor_state_free.?(state);
        if (started_resize) {
            _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
        }
    }
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
        wind.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_FRAME;
    }
}
pub fn decoration_frame_close(_: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = SDL_SendWindowEvent(@as([*c]SDL_WindowData, @ptrCast(@alignCast(user_data))).*.sdlwindow, SDL_EVENT_WINDOW_CLOSE_REQUESTED, 0, 0);
}
pub fn decoration_frame_commit(_: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(user_data));
    _ = &wind;
    if (!wind.*.suspended and (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN))) {
        _ = SDL_SendWindowEvent(wind.*.sdlwindow, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
    }
}
pub fn decoration_dismiss_popup(_: ?*struct_libdecor_frame, _: [*c]const u8, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub var libdecor_frame_interface: struct_libdecor_frame_interface = struct_libdecor_frame_interface{
    .configure = decoration_frame_configure,
    .close = decoration_frame_close,
    .commit = decoration_frame_commit,
    .dismiss_popup = decoration_dismiss_popup,
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
pub fn Wayland_HandlePreferredScaleChanged(window_data: [*c]SDL_WindowData, arg_factor: f64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var factor = arg_factor;
    _ = &factor;
    const old_factor: f64 = window_data.*.scale_factor;
    _ = &old_factor;
    if (!(window_data.*.viewport != null)) {
        factor = SDL_ceil_REAL(factor);
    }
    if (factor != old_factor) {
        window_data.*.scale_factor = factor;
        if (window_data.*.scale_to_display) {
            if (window_data.*.floating) {
                var insets: BorderInsets = undefined;
                _ = &insets;
                GetBorderInsets(window_data.*.sdlwindow, &insets);
                window_data.*.last_configure.width = if ((window_data.*.requested.logical_width - (insets.left + insets.right)) > @as(c_int, 1)) window_data.*.requested.logical_width - (insets.left + insets.right) else @as(c_int, 1);
                window_data.*.last_configure.height = if ((window_data.*.requested.logical_height - (insets.top + insets.bottom)) > @as(c_int, 1)) window_data.*.requested.logical_height - (insets.top + insets.bottom) else @as(c_int, 1);
                window_data.*.requested.logical_width = PixelToPoint(window_data.*.sdlwindow, window_data.*.requested.pixel_width);
                window_data.*.requested.logical_height = PixelToPoint(window_data.*.sdlwindow, window_data.*.requested.pixel_height);
            } else {
                window_data.*.requested.pixel_width = PointToPixel(window_data.*.sdlwindow, window_data.*.requested.logical_width);
                window_data.*.requested.pixel_height = PointToPixel(window_data.*.sdlwindow, window_data.*.requested.logical_height);
            }
        }
        if (((window_data.*.sdlwindow.*.flags & @as(c_ulong, 8192)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(window_data.*.scale_to_display))))) != 0)) {
            ConfigureWindowGeometry(window_data.*.sdlwindow);
            CommitLibdecorFrame(window_data.*.sdlwindow);
        }
    }
}
pub fn Wayland_MaybeUpdateScaleFactor(window: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var factor: f64 = undefined;
    _ = &factor;
    var i: c_int = undefined;
    _ = &i;
    if ((window.*.fractional_scale != null) or (wl_surface_get_version(window.*.surface) >= @as(u32, WL_SURFACE_PREFERRED_BUFFER_SCALE_SINCE_VERSION))) {
        return;
    }
    if (window.*.num_outputs != @as(c_int, 0)) {
        factor = 0.0;
        {
            i = 0;
            while (i < window.*.num_outputs) : (i += 1) {
                var internal: [*c]SDL_DisplayData = window.*.outputs[@bitCast(@as(isize, @intCast(i)))];
                _ = &internal;
                factor = if (factor > internal.*.scale_factor) factor else internal.*.scale_factor;
            }
        }
    } else {
        factor = window.*.scale_factor;
    }
    Wayland_HandlePreferredScaleChanged(window, factor);
}
pub export fn Wayland_RemoveOutputFromWindow(window: [*c]SDL_WindowData, display_data: [*c]SDL_DisplayData) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < window.*.num_outputs) : (i += 1) {
            if (window.*.outputs[@bitCast(@as(isize, @intCast(i)))] == display_data) {
                if (i == (window.*.num_outputs - @as(c_int, 1))) {
                    window.*.outputs[@bitCast(@as(isize, @intCast(i)))] = null;
                } else {
                    _ = memmove(@ptrCast(@alignCast(&window.*.outputs[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&window.*.outputs[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, (window.*.num_outputs - i) - @as(c_int, 1)))));
                }
                window.*.num_outputs -= 1;
                i -= 1;
            }
        }
    }
    if (window.*.num_outputs == @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(window.*.outputs)));
        window.*.outputs = null;
    } else if (!window.*.is_fullscreen or (window.*.num_outputs == @as(c_int, 1))) {
        Wayland_UpdateWindowPosition(window.*.sdlwindow);
        Wayland_MaybeUpdateScaleFactor(window);
    }
}
pub fn handle_surface_enter(data: ?*anyopaque, surface: ?*struct_wl_surface, output: ?*struct_wl_output_64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    var internal: [*c]SDL_DisplayData = @ptrCast(@alignCast(wl_output_get_user_data(output)));
    _ = &internal;
    var new_outputs: [*c][*c]SDL_DisplayData = undefined;
    _ = &new_outputs;
    if (!SDL_WAYLAND_own_output(output) or !SDL_WAYLAND_own_surface(surface)) {
        return;
    }
    new_outputs = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(window.*.outputs)), @sizeOf([*c]SDL_DisplayData) *% @as(c_ulong, @bitCast(@as(c_long, window.*.num_outputs + @as(c_int, 1)))))));
    if (!(new_outputs != null)) {
        return;
    }
    window.*.outputs = new_outputs;
    window.*.outputs[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &window.*.num_outputs;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = internal;
    if (!window.*.is_fullscreen or (window.*.num_outputs == @as(c_int, 1))) {
        Wayland_UpdateWindowPosition(window.*.sdlwindow);
        Wayland_MaybeUpdateScaleFactor(window);
    }
}
pub fn handle_surface_leave(data: ?*anyopaque, surface: ?*struct_wl_surface, output: ?*struct_wl_output_64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    if (!SDL_WAYLAND_own_output(output) or !SDL_WAYLAND_own_surface(surface)) {
        return;
    }
    Wayland_RemoveOutputFromWindow(window, @ptrCast(@alignCast(wl_output_get_user_data(output))));
}
pub fn handle_surface_preferred_buffer_scale(data: ?*anyopaque, _: ?*struct_wl_surface, factor: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    if (!(wind.*.fractional_scale != null)) {
        Wayland_HandlePreferredScaleChanged(@ptrCast(@alignCast(data)), @floatFromInt(factor));
    }
}
pub fn handle_surface_preferred_buffer_transform(_: ?*anyopaque, _: ?*struct_wl_surface, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const surface_listener: struct_wl_surface_listener = struct_wl_surface_listener{
    .enter = handle_surface_enter,
    .leave = handle_surface_leave,
    .preferred_buffer_scale = handle_surface_preferred_buffer_scale,
    .preferred_buffer_transform = handle_surface_preferred_buffer_transform,
};
pub fn handle_fractional_scale_preferred(data: ?*anyopaque, _: ?*struct_wp_fractional_scale_v1_91, scale: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const factor: f64 = @as(f64, @floatFromInt(scale)) / @as(f64, 120.0);
    _ = &factor;
    Wayland_HandlePreferredScaleChanged(@ptrCast(@alignCast(data)), factor);
}
pub const fractional_scale_listener: struct_wp_fractional_scale_v1_listener = struct_wp_fractional_scale_v1_listener{
    .preferred_scale = handle_fractional_scale_preferred,
};
pub fn frog_preferred_metadata_handler(data: ?*anyopaque, _: ?*struct_frog_color_managed_surface_96, transfer_function: u32, _: u32, _: u32, _: u32, _: u32, _: u32, _: u32, _: u32, _: u32, max_luminance: u32, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = undefined;
    _ = &wind;
    var HDR: SDL_HDROutputProperties = undefined;
    _ = &HDR;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                wind = @ptrCast(@alignCast(data));
                _ = memset(@ptrCast(@alignCast(&HDR)), 0, @sizeOf(@TypeOf(HDR)));
                switch (transfer_function) {
                    @as(u32, FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_ST2084_PQ) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_SCRGB_LINEAR) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_UNDEFINED) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_SRGB) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, FROG_COLOR_MANAGED_SURFACE_TRANSFER_FUNCTION_GAMMA_22) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            1 => {
                HDR.SDR_white_level = 1.0;
                SDL_SetWindowHDRProperties(wind.*.sdlwindow, &HDR, @"true" != 0);
                {}
            },
            2 => {
                HDR.HDR_headroom = @as(f32, @floatFromInt(max_luminance)) / @as(f32, 203.0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                HDR.HDR_headroom = @as(f32, @floatFromInt(max_luminance)) / @as(f32, 80.0);
                {
                    sdl_pc = 1;
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
                    sdl_pc = 6;
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
                HDR.HDR_headroom = 1.0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub const frog_surface_listener: struct_frog_color_managed_surface_listener = struct_frog_color_managed_surface_listener{
    .preferred_metadata = frog_preferred_metadata_handler,
};
pub fn handle_surface_feedback_preferred_changed2(data: ?*anyopaque, _: ?*struct_wp_color_management_surface_feedback_v1_97, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    Wayland_GetColorInfoForWindow(wind, @"false" != 0);
}
pub fn handle_surface_feedback_preferred_changed(data: ?*anyopaque, wp_color_management_surface_feedback_v1: ?*struct_wp_color_management_surface_feedback_v1_97, identity: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    handle_surface_feedback_preferred_changed2(data, wp_color_management_surface_feedback_v1, 0, identity);
}
pub const color_management_surface_feedback_listener: struct_wp_color_management_surface_feedback_v1_listener = struct_wp_color_management_surface_feedback_v1_listener{
    .preferred_changed = handle_surface_feedback_preferred_changed,
    .preferred_changed2 = handle_surface_feedback_preferred_changed2,
};
pub fn Wayland_SetKeyboardFocus(window: [*c]SDL_Window, set_focus: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var toplevel: [*c]SDL_Window = window;
    _ = &toplevel;
    while ((toplevel.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        toplevel = toplevel.*.parent;
    }
    toplevel.*.keyboard_focus = window;
    if ((set_focus and !window.*.is_hiding) and !window.*.is_destroying) {
        _ = SDL_SetKeyboardFocus(window);
    }
}
pub export fn Wayland_SetWindowHitTest(_: [*c]SDL_Window, _: bool) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn GetToplevelForWindow(wind: [*c]SDL_WindowData) callconv(.c) ?*struct_xdg_toplevel {
    @setEvalBranchQuota(100000);
    if (wind != null) {
        if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) and (wind.*.shell_surface.libdecor.frame != null)) {
            return WAYLAND_libdecor_frame_get_xdg_toplevel.?(wind.*.shell_surface.libdecor.frame);
        } else if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) and (wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null)) {
            return wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel;
        }
    }
    return null;
}
pub export fn Wayland_SetWindowParent(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, parent_window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var child_data: [*c]SDL_WindowData = window.*.internal;
    _ = &child_data;
    var parent_data: [*c]SDL_WindowData = @ptrCast(@alignCast(if (parent_window != null) @as(?*anyopaque, @ptrCast(@alignCast(parent_window.*.internal))) else @as(?*anyopaque, null)));
    _ = &parent_data;
    child_data.*.reparenting_required = @"false" != 0;
    if ((parent_data != null) and (parent_data.*.shell_surface_status != @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN))) {
        child_data.*.reparenting_required = @"true" != 0;
        return @"true" != 0;
    }
    var child_toplevel: ?*struct_xdg_toplevel = GetToplevelForWindow(child_data);
    _ = &child_toplevel;
    var parent_toplevel: ?*struct_xdg_toplevel = GetToplevelForWindow(parent_data);
    _ = &parent_toplevel;
    if (child_toplevel != null) {
        xdg_toplevel_set_parent(child_toplevel, parent_toplevel);
    }
    return @"true" != 0;
}
pub export fn Wayland_SetWindowModal(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, modal: bool) bool {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var parent_data: [*c]SDL_WindowData = window.*.parent.*.internal;
    _ = &parent_data;
    if (parent_data.*.shell_surface_status != @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) {
        data.*.reparenting_required = @"true" != 0;
        return @"true" != 0;
    } else {
        data.*.reparenting_required = @"false" != 0;
    }
    var toplevel: ?*struct_xdg_toplevel = GetToplevelForWindow(data);
    _ = &toplevel;
    if (toplevel != null) {
        if (viddata.*.xdg_wm_dialog_v1 != null) {
            if (modal) {
                if (!(data.*.xdg_dialog_v1 != null)) {
                    data.*.xdg_dialog_v1 = xdg_wm_dialog_v1_get_xdg_dialog(viddata.*.xdg_wm_dialog_v1, toplevel);
                }
                xdg_dialog_v1_set_modal(data.*.xdg_dialog_v1);
            } else if (data.*.xdg_dialog_v1 != null) {
                xdg_dialog_v1_unset_modal(data.*.xdg_dialog_v1);
            }
        }
    }
    return @"true" != 0;
}
pub fn Wayland_RegisterToplevelForSession(data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var toplevel: ?*struct_xdg_toplevel = GetToplevelForWindow(data);
    _ = &toplevel;
    if (!(toplevel != null)) {
        return;
    }
    var id: [*c]const u8 = SDL_GetStringProperty_REAL(data.*.sdlwindow.*.props, "SDL.window.wayland.window_id", null);
    _ = &id;
    if ((id != null) and (@as(c_int, id.*) != @as(c_int, '\x00'))) {
        var viddev: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
        _ = &viddev;
        var viddata: [*c]SDL_VideoData = viddev.*.internal;
        _ = &viddata;
        if (viddata.*.xdg_toplevel_tag_manager != null) {
            xdg_toplevel_tag_manager_v1_set_toplevel_tag(viddata.*.xdg_toplevel_tag_manager, toplevel, id);
        }
        if (viddata.*.xdg_session_manager != null) {
            Wayland_CreateSession(viddata);
            if (viddata.*.xdg_session != null) {
                if (true) {
                    {
                        var w: [*c]SDL_Window = viddev.*.windows;
                        _ = &w;
                        while (w != null) : (w = w.*.next) {
                            var d: [*c]SDL_WindowData = w.*.internal;
                            _ = &d;
                            if ((d.*.session_id != null) and (SDL_strcmp_REAL(d.*.session_id, id) == @as(c_int, 0))) {
                                SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Duplicate window ID string %s found; window will not be added to session", id);
                                return;
                            }
                        }
                    }
                }
                data.*.xdg_toplevel_session = xdg_session_v1_restore_toplevel(viddata.*.xdg_session, toplevel, id);
                data.*.session_id = SDL_strdup_REAL(id);
            }
        }
    }
}
pub fn Wayland_DestroyToplevelSession(data: [*c]SDL_WindowData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = data.*.waylandData;
    _ = &viddata;
    if (data.*.xdg_toplevel_session != null) {
        var id: [*c]const u8 = SDL_GetStringProperty_REAL(data.*.sdlwindow.*.props, "SDL.window.wayland.window_id", null);
        _ = &id;
        if (!(id != null) or (@as(c_int, id.*) == @as(c_int, '\x00'))) {
            xdg_session_v1_remove_toplevel(viddata.*.xdg_session, data.*.session_id);
        }
        xdg_toplevel_session_v1_destroy(data.*.xdg_toplevel_session);
        data.*.xdg_toplevel_session = null;
        SDL_free_REAL(@ptrCast(@alignCast(data.*.session_id)));
        data.*.session_id = null;
    }
}
pub fn show_hide_sync_handler(data: ?*anyopaque, callback: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var windowID: SDL_WindowID = @truncate(@as(usize, @intCast(@intFromPtr(data))));
    _ = &windowID;
    var window: [*c]SDL_Window = SDL_GetWindowFromID_REAL(windowID);
    _ = &window;
    if ((window != null) and (window.*.internal != null)) {
        var wind: [*c]SDL_WindowData = window.*.internal;
        _ = &wind;
        wind.*.show_hide_sync_required = @"false" != 0;
    }
    wl_callback_destroy(callback);
}
pub var show_hide_sync_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = show_hide_sync_handler,
};
pub fn exported_handle_handler(data: ?*anyopaque, _: ?*struct_zxdg_exported_v2_92, handle: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &wind;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(wind.*.sdlwindow);
    _ = &props;
    _ = SDL_SetStringProperty_REAL(props, "SDL.window.wayland.xdg_toplevel_export_handle", handle);
}
pub var exported_v2_listener: struct_zxdg_exported_v2_listener = struct_zxdg_exported_v2_listener{
    .handle = exported_handle_handler,
};
pub export fn Wayland_ShowWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var c: [*c]SDL_VideoData = _this.*.internal;
    _ = &c;
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    if (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_CUSTOM)) {
        return;
    }
    if (window.*.parent != null) {
        if (window.*.parent.*.internal.*.shell_surface_status != @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) {
            data.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_SHOW_PENDING;
            return;
        }
    }
    while (true) {
        _ = WAYLAND_wl_display_roundtrip.?(c.*.display);
        if (!data.*.show_hide_sync_required) break;
    }
    data.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE;
    wl_surface_attach(data.*.surface, null, 0, 0);
    wl_surface_commit(data.*.surface);
    if (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        data.*.shell_surface.libdecor.frame = WAYLAND_libdecor_decorate.?(c.*.shell.libdecor, data.*.surface, &libdecor_frame_interface, @ptrCast(@alignCast(data)));
        if (!(data.*.shell_surface.libdecor.frame != null)) {
            SDL_LogError_REAL(SDL_LOG_CATEGORY_VIDEO, "Failed to create libdecor frame!");
        } else {
            WAYLAND_libdecor_frame_set_app_id.?(data.*.shell_surface.libdecor.frame, data.*.app_id);
            WAYLAND_libdecor_frame_map.?(data.*.shell_surface.libdecor.frame);
            if ((window.*.flags & @as(c_ulong, 16)) != 0) {
                WAYLAND_libdecor_frame_set_visibility.?(data.*.shell_surface.libdecor.frame, @"false" != 0);
            }
            if (c.*.zxdg_exporter_v2 != null) {
                data.*.exported = zxdg_exporter_v2_export_toplevel(c.*.zxdg_exporter_v2, data.*.surface);
                _ = zxdg_exported_v2_add_listener(data.*.exported, &exported_v2_listener, @ptrCast(@alignCast(data)));
            }
            if ((c.*.xdg_toplevel_icon_manager_v1 != null) and (data.*.xdg_toplevel_icon_v1 != null)) {
                xdg_toplevel_icon_manager_v1_set_icon(_this.*.internal.*.xdg_toplevel_icon_manager_v1, WAYLAND_libdecor_frame_get_xdg_toplevel.?(data.*.shell_surface.libdecor.frame), data.*.xdg_toplevel_icon_v1);
            }
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_surface", @ptrCast(@alignCast(WAYLAND_libdecor_frame_get_xdg_surface.?(data.*.shell_surface.libdecor.frame))));
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_toplevel", @ptrCast(@alignCast(WAYLAND_libdecor_frame_get_xdg_toplevel.?(data.*.shell_surface.libdecor.frame))));
        }
    } else if ((data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) or (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP))) {
        data.*.shell_surface.xdg.surface = xdg_wm_base_get_xdg_surface(c.*.shell.xdg, data.*.surface);
        xdg_surface_set_user_data(data.*.shell_surface.xdg.surface, @ptrCast(@alignCast(data)));
        _ = xdg_surface_add_listener(data.*.shell_surface.xdg.surface, &_xdg_surface_listener, @ptrCast(@alignCast(data)));
        _ = SDL_SetPointerProperty_REAL(SDL_GetWindowProperties_REAL(window), "SDL.window.wayland.xdg_surface", @ptrCast(@alignCast(data.*.shell_surface.xdg.surface)));
        if (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) {
            var parent: [*c]SDL_Window = window.*.parent;
            _ = &parent;
            var parent_data: [*c]SDL_WindowData = parent.*.internal;
            _ = &parent_data;
            var parent_xdg_surface: ?*struct_xdg_surface = null;
            _ = &parent_xdg_surface;
            var position_x: c_int = 0;
            _ = &position_x;
            var position_y: c_int = 0;
            _ = &position_y;
            if (parent_data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
                parent_xdg_surface = WAYLAND_libdecor_frame_get_xdg_surface.?(parent_data.*.shell_surface.libdecor.frame);
            } else if ((parent_data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) or (parent_data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP))) {
                parent_xdg_surface = parent_data.*.shell_surface.xdg.surface;
            }
            data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner = xdg_wm_base_create_positioner(c.*.shell.xdg);
            xdg_positioner_set_anchor(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, XDG_POSITIONER_ANCHOR_TOP_LEFT);
            var parent_geometry: SDL_Rect = undefined;
            _ = &parent_geometry;
            GetWindowGeometry(parent.*.internal, &parent_geometry);
            xdg_positioner_set_anchor_rect(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, 0, 0, parent_geometry.w, parent_geometry.h);
            const constraint: Uint32 = @bitCast(@as(c_int, if (window.*.constrain_popup) XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X | XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y else XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE));
            _ = &constraint;
            xdg_positioner_set_constraint_adjustment(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, constraint);
            xdg_positioner_set_gravity(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT);
            xdg_positioner_set_size(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, data.*.current.logical_width, data.*.current.logical_height);
            position_x = if (window.*.last_position_pending) window.*.pending.x else window.*.x;
            position_y = if (window.*.last_position_pending) window.*.pending.y else window.*.y;
            EnsurePopupPositionIsValid(window, &position_x, &position_y);
            if (data.*.scale_to_display) {
                position_x = PixelToPoint(window.*.parent, position_x);
                position_y = PixelToPoint(window.*.parent, position_y);
            }
            AdjustPopupOffset(window, &position_x, &position_y);
            xdg_positioner_set_offset(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner, position_x, position_y);
            data.*.shell_surface.xdg.unnamed_0.popup.xdg_popup = xdg_surface_get_popup(data.*.shell_surface.xdg.surface, parent_xdg_surface, data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner);
            _ = xdg_popup_add_listener(data.*.shell_surface.xdg.unnamed_0.popup.xdg_popup, &_xdg_popup_listener, @ptrCast(@alignCast(data)));
            if ((window.*.flags & @as(c_ulong, 262144)) != 0) {
                var region: ?*struct_wl_region = undefined;
                _ = &region;
                region = wl_compositor_create_region(c.*.compositor);
                wl_region_add(region, 0, 0, 0, 0);
                wl_surface_set_input_region(data.*.surface, region);
                wl_region_destroy(region);
            } else if (((window.*.flags & @as(c_ulong, 524288)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((window.*.flags & @as(c_ulong, 2147483648)) != 0))))) != 0)) {
                Wayland_SetKeyboardFocus(window, @"true" != 0);
            }
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_popup", @ptrCast(@alignCast(data.*.shell_surface.xdg.unnamed_0.popup.xdg_popup)));
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_positioner", @ptrCast(@alignCast(data.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner)));
        } else {
            data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel = xdg_surface_get_toplevel(data.*.shell_surface.xdg.surface);
            xdg_toplevel_set_app_id(data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, data.*.app_id);
            _ = xdg_toplevel_add_listener(data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, &toplevel_listener_xdg, @ptrCast(@alignCast(data)));
            if (c.*.decoration_manager != null) {
                data.*.server_decoration = zxdg_decoration_manager_v1_get_toplevel_decoration(c.*.decoration_manager, data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
                _ = zxdg_toplevel_decoration_v1_add_listener(data.*.server_decoration, &xdg_toplevel_decoration_listener, @ptrCast(@alignCast(window)));
                const mode: enum_zxdg_toplevel_decoration_v1_mode = @bitCast(if (!((window.*.flags & @as(c_ulong, 16)) != 0)) ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE else ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE);
                _ = &mode;
                zxdg_toplevel_decoration_v1_set_mode(data.*.server_decoration, mode);
            }
            if (c.*.zxdg_exporter_v2 != null) {
                data.*.exported = zxdg_exporter_v2_export_toplevel(c.*.zxdg_exporter_v2, data.*.surface);
                _ = zxdg_exported_v2_add_listener(data.*.exported, &exported_v2_listener, @ptrCast(@alignCast(data)));
            }
            if ((c.*.xdg_toplevel_icon_manager_v1 != null) and (data.*.xdg_toplevel_icon_v1 != null)) {
                xdg_toplevel_icon_manager_v1_set_icon(_this.*.internal.*.xdg_toplevel_icon_manager_v1, data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, data.*.xdg_toplevel_icon_v1);
            }
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_toplevel", @ptrCast(@alignCast(data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel)));
        }
    }
    Wayland_RegisterToplevelForSession(data);
    _ = Wayland_SetWindowParent(_this, window, window.*.parent);
    if ((window.*.flags & @as(c_ulong, 4096)) != 0) {
        _ = Wayland_SetWindowModal(_this, window, @"true" != 0);
    }
    Wayland_SetWindowTitle(_this, window);
    if (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (data.*.shell_surface.libdecor.frame != null) {
            while (data.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
                if (WAYLAND_libdecor_dispatch.?(c.*.shell.libdecor, -@as(c_int, 1)) < @as(c_int, 0)) {
                    if (!Wayland_HandleDisplayDisconnected(_this)) {
                        return;
                    }
                }
                if (WAYLAND_wl_display_dispatch_pending.?(c.*.display) < @as(c_int, 0)) {
                    if (!Wayland_HandleDisplayDisconnected(_this)) {
                        return;
                    }
                }
            }
        }
    } else if ((data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) or (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL))) {
        wl_surface_commit(data.*.surface);
        if (data.*.shell_surface.xdg.surface != null) {
            while (data.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_WAITING_FOR_CONFIGURE)) {
                if (WAYLAND_wl_display_dispatch.?(c.*.display) < @as(c_int, 0)) {
                    if (!Wayland_HandleDisplayDisconnected(_this)) {
                        return;
                    }
                }
            }
        }
    } else {
        wl_surface_commit(data.*.surface);
    }
    data.*.system_limits.min_width = if (data.*.system_limits.min_width > @as(c_int, 1)) data.*.system_limits.min_width else @as(c_int, 1);
    data.*.system_limits.min_height = if (data.*.system_limits.min_height > @as(c_int, 1)) data.*.system_limits.min_height else @as(c_int, 1);
    if (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if ((window.*.windowed.w < data.*.system_limits.min_width) or (window.*.windowed.h < data.*.system_limits.min_height)) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_VIDEO, "Window dimensions (%i, %i) are smaller than the system enforced minimum (%i, %i); window borders will be larger than the content surface.", window.*.windowed.w, window.*.windowed.h, data.*.system_limits.min_width, data.*.system_limits.min_height);
            data.*.current.logical_width = if (window.*.windowed.w > data.*.system_limits.min_width) window.*.windowed.w else data.*.system_limits.min_width;
            data.*.current.logical_height = if (window.*.windowed.h > data.*.system_limits.min_height) window.*.windowed.h else data.*.system_limits.min_height;
            CommitLibdecorFrame(window);
        }
    }
    Wayland_SetWindowResizable(_this, window, !!((window.*.flags & @as(c_ulong, 32)) != 0));
    if ((c.*.activation_manager != null) and SDL_GetHintBoolean_REAL("SDL_WINDOW_ACTIVATE_WHEN_SHOWN", @"true" != 0)) {
        var activation_token: [*c]const u8 = SDL_getenv_REAL("XDG_ACTIVATION_TOKEN");
        _ = &activation_token;
        if (activation_token != null) {
            xdg_activation_v1_activate(c.*.activation_manager, activation_token, data.*.surface);
            _ = SDL_unsetenv_unsafe_REAL("XDG_ACTIVATION_TOKEN");
        } else {
            Wayland_RaiseWindow(_this, window);
        }
    } else {
        _ = SDL_unsetenv_unsafe_REAL("XDG_ACTIVATION_TOKEN");
    }
    if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
        data.*.surface_frame_callback = wl_surface_frame(data.*.surface);
        _ = wl_callback_add_listener(data.*.surface_frame_callback, &surface_frame_listener, @ptrCast(@alignCast(data)));
    }
    data.*.show_hide_sync_required = @"true" != 0;
    var cb: ?*struct_wl_callback = wl_display_sync(_this.*.internal.*.display);
    _ = &cb;
    _ = wl_callback_add_listener(cb, &show_hide_sync_listener, @ptrFromInt(@as(usize, window.*.id)));
    data.*.showing_window = @"true" != 0;
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_SHOWN, 0, 0);
    data.*.showing_window = @"false" != 0;
    _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_EXPOSED, 0, 0);
}
pub fn Wayland_ReleasePopup(_: [*c]SDL_VideoDevice, popup: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var popupdata: [*c]SDL_WindowData = undefined;
    _ = &popupdata;
    if (!SDL_ObjectValid(@ptrCast(@alignCast(popup)), SDL_OBJECT_TYPE_WINDOW)) {
        return;
    }
    popupdata = popup.*.internal;
    if (!(popupdata != null)) {
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(popupdata.*.shell_surface.xdg.unnamed_0.popup.xdg_popup))) == @as(?*anyopaque, null)) {
        return;
    }
    if (((popup.*.flags & @as(c_ulong, 524288)) != 0) and (@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((popup.*.flags & @as(c_ulong, 2147483648)) != 0))))) != 0)) {
        var new_focus: [*c]SDL_Window = undefined;
        _ = &new_focus;
        const set_focus: bool = SDL_ShouldRelinquishPopupFocus(popup, &new_focus);
        _ = &set_focus;
        Wayland_SetKeyboardFocus(new_focus, set_focus);
    }
    xdg_popup_destroy(popupdata.*.shell_surface.xdg.unnamed_0.popup.xdg_popup);
    xdg_positioner_destroy(popupdata.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner);
    popupdata.*.shell_surface.xdg.unnamed_0.popup.xdg_popup = null;
    popupdata.*.shell_surface.xdg.unnamed_0.popup.xdg_positioner = null;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(popup);
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_popup", null);
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_positioner", null);
}
pub export fn Wayland_HideWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_CUSTOM)) {
        return;
    }
    if (wind.*.show_hide_sync_required) {
        _ = WAYLAND_wl_display_roundtrip.?(data.*.display);
    }
    wind.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_HIDDEN;
    if (wind.*.surface_frame_callback != null) {
        wl_callback_destroy(wind.*.surface_frame_callback);
        wind.*.surface_frame_callback = null;
    }
    if (wind.*.server_decoration != null) {
        zxdg_toplevel_decoration_v1_destroy(wind.*.server_decoration);
        wind.*.server_decoration = null;
    }
    if (wind.*.exported != null) {
        zxdg_exported_v2_destroy(wind.*.exported);
        wind.*.exported = null;
        _ = SDL_SetStringProperty_REAL(props, "SDL.window.wayland.xdg_toplevel_export_handle", null);
    }
    if (wind.*.xdg_dialog_v1 != null) {
        xdg_dialog_v1_destroy(wind.*.xdg_dialog_v1);
        wind.*.xdg_dialog_v1 = null;
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (wind.*.shell_surface.libdecor.frame != null) {
            WAYLAND_libdecor_frame_unref.?(wind.*.shell_surface.libdecor.frame);
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_surface", null);
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_toplevel", null);
        }
    } else {
        if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) {
            Wayland_ReleasePopup(_this, window);
        } else if (wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null) {
            xdg_toplevel_destroy(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_toplevel", null);
        }
        if (wind.*.shell_surface.xdg.surface != null) {
            xdg_surface_destroy(wind.*.shell_surface.xdg.surface);
            _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.xdg_surface", null);
        }
    }
    if (wind.*.mask.surface != null) {
        wl_surface_attach(wind.*.mask.surface, null, 0, 0);
        wl_surface_commit(wind.*.mask.surface);
    }
    wl_surface_attach(wind.*.surface, null, 0, 0);
    wl_surface_commit(wind.*.surface);
    Wayland_DestroyToplevelSession(wind);
    _ = memset(@ptrCast(@alignCast(&wind.*.shell_surface)), 0, @sizeOf(@TypeOf(wind.*.shell_surface)));
    _ = memset(@ptrCast(@alignCast(&wind.*.explicit_geometry)), 0, @sizeOf(@TypeOf(wind.*.explicit_geometry)));
    wind.*.show_hide_sync_required = @"true" != 0;
    var cb: ?*struct_wl_callback = wl_display_sync(_this.*.internal.*.display);
    _ = &cb;
    _ = wl_callback_add_listener(cb, &show_hide_sync_listener, @ptrFromInt(@as(usize, window.*.id)));
}
pub fn handle_xdg_activation_done(data: ?*anyopaque, xdg_activation_token_v1: ?*struct_xdg_activation_token_v1_90, token: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(data));
    _ = &window;
    if (xdg_activation_token_v1 == window.*.activation_token) {
        xdg_activation_v1_activate(window.*.waylandData.*.activation_manager, token, window.*.surface);
        xdg_activation_token_v1_destroy(window.*.activation_token);
        window.*.activation_token = null;
    }
}
pub const xdg_activation_listener: struct_xdg_activation_token_v1_listener = struct_xdg_activation_token_v1_listener{
    .done = handle_xdg_activation_done,
};
pub fn Wayland_activate_window(data: [*c]SDL_VideoData, target_wind: [*c]SDL_WindowData, set_serial: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = data.*.last_implicit_grab_seat;
    _ = &seat;
    var focus: [*c]SDL_WindowData = null;
    _ = &focus;
    if (seat != null) {
        focus = seat.*.keyboard.focus;
        if (!(focus != null)) {
            focus = seat.*.pointer.focus;
        }
    }
    var requesting_surface: ?*struct_wl_surface = @ptrCast(@alignCast(if (focus != null) @as(?*anyopaque, @ptrCast(@alignCast(focus.*.surface))) else @as(?*anyopaque, null)));
    _ = &requesting_surface;
    if (data.*.activation_manager != null) {
        if (target_wind.*.activation_token != null) {
            xdg_activation_token_v1_destroy(target_wind.*.activation_token);
        }
        target_wind.*.activation_token = xdg_activation_v1_get_activation_token(data.*.activation_manager);
        _ = xdg_activation_token_v1_add_listener(target_wind.*.activation_token, &xdg_activation_listener, @ptrCast(@alignCast(target_wind)));
        if (requesting_surface != null) {
            xdg_activation_token_v1_set_surface(target_wind.*.activation_token, requesting_surface);
        }
        if ((set_serial and (seat != null)) and (seat.*.wl_seat != null)) {
            xdg_activation_token_v1_set_serial(target_wind.*.activation_token, seat.*.last_implicit_grab_serial, seat.*.wl_seat);
        }
        xdg_activation_token_v1_commit(target_wind.*.activation_token);
    }
}
pub export fn Wayland_RaiseWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = _this.*.internal;
    _ = &viddata;
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (viddata.*.activation_manager != null) {
        var activation_token: [*c]const u8 = SDL_GetNotificationActivationToken();
        _ = &activation_token;
        if (activation_token != null) {
            xdg_activation_v1_activate(viddata.*.activation_manager, activation_token, wind.*.surface);
            return;
        }
    }
    Wayland_activate_window(_this.*.internal, window.*.internal, @"true" != 0);
}
pub export fn Wayland_FlashWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: SDL_FlashOperation) bool {
    @setEvalBranchQuota(100000);
    Wayland_activate_window(_this.*.internal, window.*.internal, @"false" != 0);
    return @"true" != 0;
}
pub export fn Wayland_SetWindowFullscreen(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, display: [*c]SDL_VideoDisplay, fullscreen: SDL_FullscreenOp) SDL_FullscreenResult {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var output: ?*struct_wl_output_64 = display.*.internal.*.output;
    _ = &output;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_CUSTOM)) {
        return SDL_FULLSCREEN_FAILED;
    }
    if (wind.*.showing_window and (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_LEAVE))) {
        return SDL_FULLSCREEN_SUCCEEDED;
    }
    if (wind.*.show_hide_sync_required) {
        _ = WAYLAND_wl_display_roundtrip.?(_this.*.internal.*.display);
    }
    if (wind.*.drop_fullscreen_requests) {
        return SDL_FULLSCREEN_SUCCEEDED;
    }
    wind.*.drop_fullscreen_requests = @"true" != 0;
    FlushPendingEvents(window);
    wind.*.drop_fullscreen_requests = @"false" != 0;
    if (!wind.*.is_fullscreen) {
        if (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_UPDATE)) {
            return SDL_FULLSCREEN_PENDING;
        } else if (fullscreen == @as(SDL_FullscreenOp, SDL_FULLSCREEN_OP_LEAVE)) {
            return SDL_FULLSCREEN_SUCCEEDED;
        }
    }
    if (@intFromBool(!!(fullscreen != 0)) != @as(c_int, @intFromBool(wind.*.is_fullscreen))) {
        wind.*.fullscreen_was_positioned = !!(fullscreen != 0);
        if (!window.*.fullscreen_exclusive) {
            if ((window.*.undefined_x or window.*.undefined_y) or ((wind.*.num_outputs != 0) and !window.*.last_position_pending)) {
                output = null;
            }
        }
        if ((fullscreen != 0) and (@as(SDL_FullscreenOp, @bitCast(@as(c_int, @intFromBool(wind.*.pending_state_commit)))) != 0)) {
            wl_surface_commit(wind.*.surface);
        }
        SetFullscreen(window, output, !!(fullscreen != 0));
    } else if (wind.*.is_fullscreen) {
        if (wind.*.last_displayID != display.*.id) {
            wind.*.fullscreen_was_positioned = @"true" != 0;
            SetFullscreen(window, output, @"true" != 0);
        } else {
            ConfigureWindowGeometry(window);
            CommitLibdecorFrame(window);
            return SDL_FULLSCREEN_SUCCEEDED;
        }
    }
    return SDL_FULLSCREEN_PENDING;
}
pub export fn Wayland_RestoreWindow(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind.*.showing_window) {
        return;
    }
    if (!((window.*.flags & (@as(c_ulong, 1) | @as(c_ulong, 128))) != 0) and !(wind.*.pending_state_deadline_count != 0)) {
        return;
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (!(wind.*.shell_surface.libdecor.frame != null)) {
            return;
        }
        WAYLAND_libdecor_frame_unset_maximized.?(wind.*.shell_surface.libdecor.frame);
        AddPendingStateSync(wind);
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel))) == @as(?*anyopaque, null)) {
            return;
        }
        xdg_toplevel_unset_maximized(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
        AddPendingStateSync(wind);
    }
}
pub export fn Wayland_SetWindowBordered(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, bordered: bool) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var viddata: [*c]const SDL_VideoData = @ptrCast(@alignCast(_this.*.internal));
    _ = &viddata;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (wind.*.shell_surface.libdecor.frame != null) {
            WAYLAND_libdecor_frame_set_visibility.?(wind.*.shell_surface.libdecor.frame, bordered);
        }
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if ((viddata.*.decoration_manager != null) and (wind.*.server_decoration != null)) {
            const mode: enum_zxdg_toplevel_decoration_v1_mode = @bitCast(if (bordered) ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE else ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE);
            _ = &mode;
            zxdg_toplevel_decoration_v1_set_mode(wind.*.server_decoration, mode);
        }
    }
}
pub export fn Wayland_SetWindowResizable(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: bool) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    SetMinMaxDimensions(window);
    CommitLibdecorFrame(window);
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) {
        wind.*.pending_state_commit = @"true" != 0;
    }
}
pub export fn Wayland_MaximizeWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind.*.show_hide_sync_required) {
        _ = WAYLAND_wl_display_roundtrip.?(_this.*.internal.*.display);
    }
    if (((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!((window.*.flags & @as(c_ulong, 1)) != 0))))) != 0) and ((window.*.flags & @as(c_ulong, 128)) != 0)) and !(wind.*.pending_state_deadline_count != 0)) {
        return;
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (!(wind.*.shell_surface.libdecor.frame != null)) {
            return;
        }
        if (wind.*.pending_state_commit) {
            wl_surface_commit(wind.*.surface);
        }
        WAYLAND_libdecor_frame_set_maximized.?(wind.*.shell_surface.libdecor.frame);
        AddPendingStateSync(wind);
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel))) == @as(?*anyopaque, null)) {
            return;
        }
        if (wind.*.pending_state_commit) {
            wl_surface_commit(wind.*.surface);
        }
        xdg_toplevel_set_maximized(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
        AddPendingStateSync(wind);
    }
}
pub export fn Wayland_MinimizeWindow(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (!((wind.*.wm_caps & @as(enum_unnamed_85, WAYLAND_WM_CAPS_MINIMIZE)) != 0)) {
        return;
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (!(wind.*.shell_surface.libdecor.frame != null)) {
            return;
        }
        WAYLAND_libdecor_frame_set_minimized.?(wind.*.shell_surface.libdecor.frame);
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (@as(?*anyopaque, @ptrCast(@alignCast(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel))) == @as(?*anyopaque, null)) {
            return;
        }
        xdg_toplevel_set_minimized(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel);
        _ = SDL_SendWindowEvent(window, SDL_EVENT_WINDOW_MINIMIZED, 0, 0);
    }
}
pub export fn Wayland_SetWindowMouseRect(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (!(data.*.pointer_constraints != null)) {
        return SDL_SetError_REAL("Failed to grab mouse: compositor lacks support for the required zwp_pointer_constraints_v1 protocol");
    }
    Wayland_DisplayUpdatePointerGrabs(data, window.*.internal);
    return @"true" != 0;
}
pub export fn Wayland_SetWindowMouseGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: bool) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (!(data.*.pointer_constraints != null)) {
        return SDL_SetError_REAL("Failed to grab mouse: compositor lacks support for the required zwp_pointer_constraints_v1 protocol");
    }
    Wayland_DisplayUpdatePointerGrabs(data, window.*.internal);
    return @"true" != 0;
}
pub export fn Wayland_SetWindowKeyboardGrab(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, _: bool) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (!(data.*.key_inhibitor_manager != null)) {
        return SDL_SetError_REAL("Failed to grab keyboard: compositor lacks support for the required zwp_keyboard_shortcuts_inhibit_manager_v1 protocol");
    }
    Wayland_DisplayUpdateKeyboardGrabs(data, window.*.internal);
    return @"true" != 0;
}
pub export fn Wayland_ReconfigureWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, flags: SDL_WindowFlags) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    if ((data.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) and (data.*.shell_surface_type != @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_CUSTOM))) {
        return @"false" != 0;
    }
    if ((flags & @as(c_ulong, 2)) != 0) {
        if (!(data.*.egl_window != null)) {
            data.*.egl_window = WAYLAND_wl_egl_window_create.?(data.*.surface, data.*.current.pixel_width, data.*.current.pixel_height);
        }
        data.*.egl_surface = SDL_EGL_CreateSurface(_this, window, @intCast(@intFromPtr(data.*.egl_window)));
        if (data.*.egl_surface == @as(EGLSurface, null)) {
            return @"false" != 0;
        }
        if (!(data.*.gles_swap_frame_event_queue != null)) {
            data.*.gles_swap_frame_event_queue = WAYLAND_wl_display_create_queue.?(data.*.waylandData.*.display);
            data.*.gles_swap_frame_surface_wrapper = @ptrCast(@alignCast(WAYLAND_wl_proxy_create_wrapper.?(@ptrCast(@alignCast(data.*.surface)))));
            WAYLAND_wl_proxy_set_queue.?(@ptrCast(@alignCast(data.*.gles_swap_frame_surface_wrapper)), data.*.gles_swap_frame_event_queue);
            data.*.gles_swap_frame_callback = wl_surface_frame(data.*.gles_swap_frame_surface_wrapper);
            _ = wl_callback_add_listener(data.*.gles_swap_frame_callback, &gles_swap_frame_listener, @ptrCast(@alignCast(data)));
        }
    } else {
        if (data.*.egl_surface != null) {
            SDL_EGL_DestroySurface(_this, data.*.egl_surface);
            data.*.egl_surface = null;
        }
        if (data.*.egl_window != null) {
            WAYLAND_wl_egl_window_destroy.?(data.*.egl_window);
            data.*.egl_window = null;
        }
        if (data.*.gles_swap_frame_callback != null) {
            wl_callback_destroy(data.*.gles_swap_frame_callback);
            data.*.gles_swap_frame_callback = null;
        }
        if (data.*.gles_swap_frame_surface_wrapper != null) {
            WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(data.*.gles_swap_frame_surface_wrapper)));
            data.*.gles_swap_frame_surface_wrapper = null;
        }
        if (data.*.gles_swap_frame_event_queue != null) {
            WAYLAND_wl_event_queue_destroy.?(data.*.gles_swap_frame_event_queue);
            data.*.gles_swap_frame_event_queue = null;
        }
    }
    return @"true" != 0;
}
pub export fn Wayland_CreateWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, create_props: SDL_PropertiesID) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = undefined;
    _ = &data;
    var c: [*c]SDL_VideoData = _this.*.internal;
    _ = &c;
    var external_surface: ?*struct_wl_surface = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "SDL.window.create.wayland.wl_surface", @ptrCast(@alignCast(@as(?*struct_wl_surface, @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(create_props, "sdl2-compat.external_window", null)))))))));
    _ = &external_surface;
    const custom_surface_role: bool = (@as(?*anyopaque, @ptrCast(@alignCast(external_surface))) != @as(?*anyopaque, null)) or SDL_GetBooleanProperty_REAL(create_props, "SDL.window.create.wayland.surface_role_custom", @"false" != 0);
    _ = &custom_surface_role;
    const create_egl_window: bool = !!((window.*.flags & @as(c_ulong, 2)) != 0) or SDL_GetBooleanProperty_REAL(create_props, "SDL.window.create.wayland.create_egl_window", @"false" != 0);
    _ = &create_egl_window;
    data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)))));
    if (!(data != null)) {
        return @"false" != 0;
    }
    window.*.internal = data;
    data.*.enable_insets = SDL_GetBooleanProperty_REAL(create_props, "SDL.window.create.wayland.enable_insets", @"false" != 0);
    if (@as(c_uint, @bitCast(@as(c_int, window.*.x))) == (SDL_WINDOWPOS_UNDEFINED_MASK | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))) {
        window.*.x = 0;
    }
    if (@as(c_uint, @bitCast(@as(c_int, window.*.y))) == (SDL_WINDOWPOS_UNDEFINED_MASK | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 0)))))) {
        window.*.y = 0;
    }
    data.*.waylandData = c;
    data.*.sdlwindow = window;
    data.*.wm_caps = WAYLAND_WM_CAPS_ALL;
    data.*.scale_factor = 1.0;
    if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
        data.*.scale_to_display = window.*.parent.*.internal.*.scale_to_display;
        data.*.scale_factor = window.*.parent.*.internal.*.scale_factor;
        EnsurePopupPositionIsValid(window, &window.*.x, &window.*.y);
    } else {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < _this.*.num_displays) : (i += 1) {
                data.*.scale_factor = if (data.*.scale_factor > _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.scale_factor) data.*.scale_factor else _this.*.displays[@bitCast(@as(isize, @intCast(i)))].*.internal.*.scale_factor;
            }
        }
    }
    data.*.outputs = null;
    data.*.num_outputs = 0;
    data.*.scale_to_display = c.*.scale_to_display_enabled;
    data.*.app_id = SDL_strdup_REAL(SDL_GetAppID());
    if (!data.*.scale_to_display) {
        data.*.requested.logical_width = window.*.floating.w;
        data.*.requested.logical_height = window.*.floating.h;
    } else {
        data.*.requested.logical_width = PixelToPoint(window, window.*.floating.w);
        data.*.requested.logical_height = PixelToPoint(window, window.*.floating.h);
        data.*.requested.pixel_width = window.*.floating.w;
        data.*.requested.pixel_height = window.*.floating.h;
    }
    if (!(external_surface != null)) {
        data.*.surface = wl_compositor_create_surface(c.*.compositor);
        _ = wl_surface_add_listener(data.*.surface, &surface_listener, @ptrCast(@alignCast(data)));
        wl_surface_set_user_data(data.*.surface, @ptrCast(@alignCast(data)));
        SDL_WAYLAND_register_surface(data.*.surface);
    } else {
        window.*.flags |= 2048;
        data.*.surface = external_surface;
        Wayland_AddWindowDataToExternalList(data);
    }
    if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!custom_surface_role)))) != 0) or ((window.*.flags & @as(c_ulong, 8192)) != 0)) {
        if (c.*.viewporter != null) {
            data.*.viewport = wp_viewporter_get_viewport(c.*.viewporter, data.*.surface);
            wp_viewport_set_source(data.*.viewport, wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)));
        }
        if (c.*.fractional_scale_manager != null) {
            data.*.fractional_scale = wp_fractional_scale_manager_v1_get_fractional_scale(c.*.fractional_scale_manager, data.*.surface);
            _ = wp_fractional_scale_v1_add_listener(data.*.fractional_scale, &fractional_scale_listener, @ptrCast(@alignCast(data)));
        }
    }
    if (!custom_surface_role) {
        if (c.*.wp_color_manager_v1 != null) {
            data.*.wp_color_management_surface_feedback = wp_color_manager_v1_get_surface_feedback(c.*.wp_color_manager_v1, data.*.surface);
            _ = wp_color_management_surface_feedback_v1_add_listener(data.*.wp_color_management_surface_feedback, &color_management_surface_feedback_listener, @ptrCast(@alignCast(data)));
            Wayland_GetColorInfoForWindow(data, @"true" != 0);
        } else if (c.*.frog_color_management_factory_v1 != null) {
            data.*.frog_color_managed_surface = frog_color_management_factory_v1_get_color_managed_surface(c.*.frog_color_management_factory_v1, data.*.surface);
            _ = frog_color_managed_surface_add_listener(data.*.frog_color_managed_surface, &frog_surface_listener, @ptrCast(@alignCast(data)));
        }
        if (c.*.wp_alpha_modifier_v1 != null) {
            data.*.wp_alpha_modifier_surface_v1 = wp_alpha_modifier_v1_get_surface(c.*.wp_alpha_modifier_v1, data.*.surface);
            wp_alpha_modifier_surface_v1_set_multiplier(data.*.wp_alpha_modifier_surface_v1, @as(c_uint, 4294967295));
        }
    }
    ConfigureWindowGeometry(window);
    if ((window.*.flags & @as(c_ulong, 2)) != 0) {
        data.*.gles_swap_frame_event_queue = WAYLAND_wl_display_create_queue.?(data.*.waylandData.*.display);
        data.*.gles_swap_frame_surface_wrapper = @ptrCast(@alignCast(WAYLAND_wl_proxy_create_wrapper.?(@ptrCast(@alignCast(data.*.surface)))));
        WAYLAND_wl_proxy_set_queue.?(@ptrCast(@alignCast(data.*.gles_swap_frame_surface_wrapper)), data.*.gles_swap_frame_event_queue);
        data.*.gles_swap_frame_callback = wl_surface_frame(data.*.gles_swap_frame_surface_wrapper);
        _ = wl_callback_add_listener(data.*.gles_swap_frame_callback, &gles_swap_frame_listener, @ptrCast(@alignCast(data)));
    }
    if ((window.*.flags & @as(c_ulong, 1073741824)) != 0) {
        if (_this.*.gl_config.alpha_size == @as(c_int, 0)) {
            _this.*.gl_config.alpha_size = 8;
        }
    }
    if (create_egl_window) {
        data.*.egl_window = WAYLAND_wl_egl_window_create.?(data.*.surface, data.*.current.pixel_width, data.*.current.pixel_height);
    }
    if ((window.*.flags & @as(c_ulong, 2)) != 0) {
        data.*.egl_surface = SDL_EGL_CreateSurface(_this, window, @intCast(@intFromPtr(data.*.egl_window)));
        if (data.*.egl_surface == @as(EGLSurface, null)) {
            return @"false" != 0;
        }
    }
    _ = Wayland_SuspendScreenSaver(_this);
    if (!custom_surface_role) {
        if ((c.*.shell.libdecor != null) and !((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
            data.*.shell_surface_type = WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR;
        } else if (c.*.shell.xdg != null) {
            if ((window.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0)) {
                data.*.shell_surface_type = WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP;
            } else {
                data.*.shell_surface_type = WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL;
            }
        }
    } else {
        data.*.shell_surface_type = WAYLAND_SHELL_SURFACE_TYPE_CUSTOM;
        data.*.shell_surface_status = WAYLAND_SHELL_SURFACE_STATUS_SHOWN;
        if ((window.*.flags & @as(c_ulong, 2048)) != 0) {
            window.*.flags &= ~@as(c_ulong, 8);
        }
    }
    if (SDL_GetHintBoolean_REAL("SDL_VIDEO_DOUBLE_BUFFER", @"false" != 0)) {
        data.*.double_buffer = @"true" != 0;
    }
    var props: SDL_PropertiesID = SDL_GetWindowProperties_REAL(window);
    _ = &props;
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.display", @ptrCast(@alignCast(data.*.waylandData.*.display)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.surface", @ptrCast(@alignCast(data.*.surface)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.viewport", @ptrCast(@alignCast(data.*.viewport)));
    _ = SDL_SetPointerProperty_REAL(props, "SDL.window.wayland.egl_window", @ptrCast(@alignCast(data.*.egl_window)));
    if ((data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) or (data.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR))) {
        var window_id: [*c]const u8 = SDL_GetStringProperty_REAL(create_props, "SDL.window.create.wayland.window_id", null);
        _ = &window_id;
        if ((window_id != null) and (@as(c_int, window_id.*) != @as(c_int, '\x00'))) {
            _ = SDL_SetStringProperty_REAL(props, "SDL.window.wayland.window_id", window_id);
        }
    }
    data.*.hit_test_result = SDL_HITTEST_NORMAL;
    return @"true" != 0;
}
pub export fn Wayland_SetWindowMinimumSize(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    window.*.internal.*.limits_changed = @"true" != 0;
}
pub export fn Wayland_SetWindowMaximumSize(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    window.*.internal.*.limits_changed = @"true" != 0;
}
pub export fn Wayland_SetWindowAspectRatio(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    window.*.internal.*.limits_changed = @"true" != 0;
}
pub export fn Wayland_SetWindowPosition(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_POPUP)) {
        if ((wind.*.shell_surface.xdg.unnamed_0.popup.xdg_popup != null) and (xdg_popup_get_version(wind.*.shell_surface.xdg.unnamed_0.popup.xdg_popup) < @as(u32, XDG_POPUP_REPOSITION_SINCE_VERSION))) {
            return SDL_SetError_REAL("That operation is not supported");
        }
        RepositionPopup(window, @"false" != 0);
        return @"true" != 0;
    } else if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) or (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL))) {
        FlushPendingEvents(window);
        if (wind.*.is_fullscreen) {
            var display: [*c]SDL_VideoDisplay = SDL_GetVideoDisplayForFullscreenWindow(window);
            _ = &display;
            if ((display != null) and (wind.*.last_displayID != display.*.id)) {
                var output: ?*struct_wl_output_64 = display.*.internal.*.output;
                _ = &output;
                SetFullscreen(window, output, @"true" != 0);
                return @"true" != 0;
            }
        }
    }
    return SDL_SetError_REAL("wayland cannot position non-popup windows");
}
pub export fn Wayland_SetWindowSize(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    FlushPendingEvents(window);
    const maximized: bool = (window.*.flags & @as(c_ulong, 128)) != @as(SDL_WindowFlags, 0);
    _ = &maximized;
    const resizable_state: bool = !((window.*.flags & (@as(c_ulong, 128) | @as(c_ulong, 1))) != 0);
    _ = &resizable_state;
    if ((resizable_state or (window.*.tiled and !wind.*.limits_changed)) or (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_CUSTOM))) {
        if (!maximized) {
            if (!wind.*.scale_to_display) {
                wind.*.requested.logical_width = window.*.pending.w;
                wind.*.requested.logical_height = window.*.pending.h;
            } else {
                wind.*.requested.logical_width = PixelToPoint(window, window.*.pending.w);
                wind.*.requested.logical_height = PixelToPoint(window, window.*.pending.h);
                wind.*.requested.pixel_width = window.*.pending.w;
                wind.*.requested.pixel_height = window.*.pending.h;
            }
        }
        if (window.*.tiled and !((window.*.flags & @as(c_ulong, 32)) != 0)) {
            window.*.floating.w = window.*.pending.w;
            window.*.floating.h = window.*.pending.h;
        }
    } else {
        window.*.last_size_pending = @"false" != 0;
    }
    wind.*.limits_changed = @"false" != 0;
    if (wind.*.shell_surface_status == @as(enum_unnamed_84, WAYLAND_SHELL_SURFACE_STATUS_SHOWN)) {
        wind.*.pending_state_commit = @"true" != 0;
    }
    ConfigureWindowGeometry(window);
    CommitLibdecorFrame(window);
}
pub export fn Wayland_GetWindowSizeInPixels(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, w: [*c]c_int, h: [*c]c_int) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_WindowData = window.*.internal;
    _ = &data;
    w.* = data.*.current.pixel_width;
    h.* = data.*.current.pixel_height;
}
pub export fn Wayland_GetWindowContentScale(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) f32 {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if ((((window.*.flags & @as(c_ulong, 8192)) != 0) or (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(wind.*.scale_to_display))))) != 0)) or wind.*.fullscreen_exclusive) {
        return @floatCast(wind.*.scale_factor);
    }
    return 1.0;
}
pub export fn Wayland_GetDisplayForWindow(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) SDL_DisplayID {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind != null) {
        return wind.*.last_displayID;
    }
    return 0;
}
pub export fn Wayland_SetWindowOpacity(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, opacity: f32) bool {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if (wind.*.wp_alpha_modifier_surface_v1 != null) {
        const is_opaque: bool = !((window.*.flags & @as(c_ulong, 1073741824)) != 0) and (opacity == @as(f32, 1.0));
        _ = &is_opaque;
        if (wind.*.mask.mapped and (@as(c_int, @intFromBool(wind.*.mask.@"opaque")) != @as(c_int, @intFromBool(is_opaque)))) {
            var old_buffer: ?*struct_wl_buffer = wind.*.mask.buffer;
            _ = &old_buffer;
            wind.*.mask.@"opaque" = is_opaque;
            wind.*.mask.buffer = Wayland_CreateSinglePixelBuffer(0, 0, 0, if (is_opaque) @as(c_uint, 4294967295) else @as(Uint32, 0));
            wl_surface_attach(wind.*.mask.surface, wind.*.mask.buffer, 0, 0);
            if (wl_surface_get_version(wind.*.mask.surface) >= @as(u32, WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION)) {
                wl_surface_damage_buffer(wind.*.mask.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
            } else {
                wl_surface_damage(wind.*.mask.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
            }
            if (is_opaque) {
                SetSurfaceOpaqueRegion(wind.*.mask.surface, wind.*.current.logical_width, wind.*.current.logical_height);
            } else {
                SetSurfaceOpaqueRegion(wind.*.mask.surface, 0, 0);
            }
            wl_surface_commit(wind.*.mask.surface);
            if (old_buffer != null) {
                wl_buffer_destroy(old_buffer);
            }
        }
        if (is_opaque) {
            SetSurfaceOpaqueRegion(wind.*.surface, wind.*.current.viewport_width, wind.*.current.viewport_height);
        } else {
            SetSurfaceOpaqueRegion(wind.*.surface, 0, 0);
        }
        wp_alpha_modifier_surface_v1_set_multiplier(wind.*.wp_alpha_modifier_surface_v1, @intFromFloat(@as(f64, @floatFromInt(@as(c_uint, 4294967295))) * @as(f64, @floatCast(opacity))));
        return @"true" != 0;
    }
    return SDL_SetError_REAL("wayland: set window opacity failed; compositor lacks support for the required wp_alpha_modifier_v1 protocol");
}
pub export fn Wayland_SetWindowTitle(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var title: [*c]const u8 = if (window.*.title != null) window.*.title else @as([*c]u8, @as([*c]u8, @constCast("")));
    _ = &title;
    if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) and (wind.*.shell_surface.libdecor.frame != null)) {
        WAYLAND_libdecor_frame_set_title.?(wind.*.shell_surface.libdecor.frame, title);
    } else if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) and (wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null)) {
        xdg_toplevel_set_title(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, title);
    }
}
pub fn icon_sort_callback(a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var s1: [*c]const SDL_Surface = @as([*c][*c]const SDL_Surface, @ptrCast(@alignCast(@constCast(a)))).*;
    _ = &s1;
    var s2: [*c]const SDL_Surface = @as([*c][*c]const SDL_Surface, @ptrCast(@alignCast(@constCast(b)))).*;
    _ = &s2;
    return if ((s1.*.w * s1.*.h) <= (s2.*.w * s2.*.h)) -@as(c_int, 1) else @as(c_int, 1);
}
pub export fn Wayland_SetWindowIcon(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window, icon: [*c]SDL_Surface) bool {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = undefined;
    _ = &wind;
    var shm_pool: ?*Wayland_SHMPool = undefined;
    _ = &shm_pool;
    var toplevel: ?*struct_xdg_toplevel = undefined;
    _ = &toplevel;
    var image_count: c_int = undefined;
    _ = &image_count;
    var images: [*c][*c]SDL_Surface = undefined;
    _ = &images;
    var i: c_int = undefined;
    _ = &i;
    var pool_size: usize = undefined;
    _ = &pool_size;
    var i_1: c_int = undefined;
    _ = &i_1;
    var size: c_int = undefined;
    _ = &size;
    var base_size: f64 = undefined;
    _ = &base_size;
    var i_2: c_int = undefined;
    _ = &i_2;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var level_size: c_int = undefined;
    _ = &level_size;
    var scale: c_int = undefined;
    _ = &scale;
    var buffer_mem: ?*anyopaque = undefined;
    _ = &buffer_mem;
    var buffer: ?*struct_wl_buffer = undefined;
    _ = &buffer;
    var i_3: c_int = undefined;
    _ = &i_3;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                wind = window.*.internal;
                shm_pool = null;
                toplevel = null;
                if (!(_this.*.internal.*.xdg_toplevel_icon_manager_v1 != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(images)));
                if (wind.*.xdg_toplevel_icon_v1 != null) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            2 => {
                return SDL_SetError_REAL("wayland: cannot set icon; required xdg_toplevel_icon_v1 protocol not supported");
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                image_count = 0;
                images = SDL_GetSurfaceImages_REAL(icon, &image_count);
                if (!(images != null) or !(image_count != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return @"false" != 0;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (wind.*.xdg_toplevel_icon_v1 != null) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                xdg_toplevel_icon_v1_destroy(wind.*.xdg_toplevel_icon_v1);
                wind.*.xdg_toplevel_icon_v1 = null;
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
                i = 0;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (i < wind.*.icon_buffer_count) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                wl_buffer_destroy(wind.*.icon_buffers[@bitCast(@as(isize, @intCast(i)))]);
                {
                    sdl_pc = 13;
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
                wind.*.icon_buffer_count = 0;
                wind.*.xdg_toplevel_icon_v1 = xdg_toplevel_icon_manager_v1_create_icon(_this.*.internal.*.xdg_toplevel_icon_manager_v1);
                wind.*.icon_buffers = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(wind.*.icon_buffers)), @as(c_ulong, @bitCast(@as(c_long, image_count))) *% @sizeOf(?*struct_wl_buffer))));
                if (!(wind.*.icon_buffers != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                pool_size = 0;
                i_1 = 0;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                if (i_1 < image_count) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                size = if (images[@bitCast(@as(isize, @intCast(i_1)))].*.w > images[@bitCast(@as(isize, @intCast(i_1)))].*.h) images[@bitCast(@as(isize, @intCast(i_1)))].*.w else images[@bitCast(@as(isize, @intCast(i_1)))].*.h;
                pool_size +%= @bitCast(@as(c_long, (size * size) * @as(c_int, 4)));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                i_1 += 1;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                SDL_qsort_REAL(@ptrCast(@alignCast(images)), @bitCast(@as(c_long, image_count)), @sizeOf([*c]SDL_Surface), icon_sort_callback);
                shm_pool = Wayland_AllocSHMPool(@bitCast(@as(c_uint, @truncate(pool_size))));
                if (!(shm_pool != null)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                _ = SDL_SetError_REAL("wayland: failed to allocate an SHM pool for the icon");
                {
                    sdl_pc = 1;
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
                base_size = @floatFromInt(if (icon.*.w > icon.*.h) icon.*.w else icon.*.h);
                i_2 = 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (i_2 < image_count) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            26 => {
                surface = images[@bitCast(@as(isize, @intCast(i_2)))];
                level_size = if (surface.*.w > surface.*.h) surface.*.w else surface.*.h;
                scale = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(level_size)) / base_size));
                if (!(scale != 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                i_2 += 1;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            28 => {
                if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) and (wind.*.shell_surface.libdecor.frame != null)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 27;
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
                if (surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
                if (!(surface != null)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
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
                buffer = Wayland_AllocBufferFromPool(shm_pool, level_size, level_size, &buffer_mem);
                if (!(buffer != null)) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            35 => {
                _ = SDL_SetError_REAL("wayland: failed to convert the icon image to ARGB8888 format");
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                if (surface != images[@bitCast(@as(isize, @intCast(i_2)))]) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
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
                wind.*.icon_buffers[
                    @bitCast(@as(isize, @intCast(blk: {
                        const ref = &wind.*.icon_buffer_count;
                        const tmp = ref.*;
                        ref.* += 1;
                        break :blk tmp;
                    })))
                ] = buffer;
                if (surface.*.w < level_size) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            41 => {
                SDL_DestroySurface_REAL(surface);
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                _ = SDL_SetError_REAL("wayland: failed to allocate a wl_buffer for the icon");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            44 => {
                _ = memset(buffer_mem, 0, @bitCast(@as(c_long, (level_size * level_size) * @as(c_int, 4))));
                buffer_mem = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(buffer_mem))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(level_size - surface.*.w, @as(c_int, 2)) * @as(c_int, 4)))))));
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                if (surface.*.h < level_size) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                _ = SDL_PremultiplyAlpha_REAL(surface.*.w, surface.*.h, surface.*.format, surface.*.pixels, surface.*.pitch, SDL_PIXELFORMAT_ARGB8888, buffer_mem, level_size * @as(c_int, 4), @"true" != 0);
                xdg_toplevel_icon_v1_add_buffer(wind.*.xdg_toplevel_icon_v1, buffer, scale);
                if (surface != images[@bitCast(@as(isize, @intCast(i_2)))]) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            47 => {
                _ = memset(buffer_mem, 0, @bitCast(@as(c_long, (level_size * level_size) * @as(c_int, 4))));
                buffer_mem = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(buffer_mem))) + @as(usize, @bitCast(@as(isize, @intCast(@divTrunc(level_size - surface.*.h, @as(c_int, 2)) * (level_size * @as(c_int, 4))))))));
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            50 => {
                SDL_DestroySurface_REAL(surface);
                {
                    sdl_pc = 52;
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
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            53 => {
                toplevel = WAYLAND_libdecor_frame_get_xdg_toplevel.?(wind.*.shell_surface.libdecor.frame);
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                if ((wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) and (wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null)) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                if (toplevel != null) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            56 => {
                toplevel = wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            59 => {
                xdg_toplevel_icon_manager_v1_set_icon(_this.*.internal.*.xdg_toplevel_icon_manager_v1, toplevel, wind.*.xdg_toplevel_icon_v1);
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                Wayland_ReleaseSHMPool(shm_pool);
                SDL_free_REAL(@ptrCast(@alignCast(images)));
                return @"true" != 0;
            },
            62 => {
                xdg_toplevel_icon_v1_destroy(wind.*.xdg_toplevel_icon_v1);
                wind.*.xdg_toplevel_icon_v1 = null;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                Wayland_ReleaseSHMPool(shm_pool);
                i_3 = 0;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            65 => {
                if (i_3 < wind.*.icon_buffer_count) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 68;
                    continue;
                }
            },
            66 => {
                wl_buffer_destroy(wind.*.icon_buffers[@bitCast(@as(isize, @intCast(i_3)))]);
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                i_3 += 1;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            68 => {
                SDL_free_REAL(@ptrCast(@alignCast(wind.*.icon_buffers)));
                wind.*.icon_buffers = null;
                wind.*.icon_buffer_count = 0;
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn Wayland_GetWindowICCProfile(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, size: [*c]usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var ret: ?*anyopaque = null;
    _ = &ret;
    if (wind.*.icc_size > @as(Uint32, 0)) {
        var icc_map: ?*anyopaque = mmap(null, wind.*.icc_size, PROT_READ, MAP_PRIVATE, wind.*.icc_fd, 0);
        _ = &icc_map;
        if (icc_map != @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
            ret = SDL_malloc_REAL(wind.*.icc_size);
            if (ret != null) {
                size.* = wind.*.icc_size;
                _ = memcpy(ret, icc_map, size.*);
            }
            _ = munmap(icc_map, wind.*.icc_size);
        }
    }
    return ret;
}
pub export fn Wayland_SyncWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    while (true) {
        _ = WAYLAND_wl_display_roundtrip.?(_this.*.internal.*.display);
        if (!(wind.*.pending_state_deadline_count != 0)) break;
    }
    return @"true" != 0;
}
pub export fn Wayland_AcceptDragAndDrop(window: [*c]SDL_Window, accept: bool) void {
    @setEvalBranchQuota(100000);
    window.*.internal.*.accepts_drag_and_drop = accept;
}
pub export fn Wayland_SetWindowFocusable(_: [*c]SDL_VideoDevice, window: [*c]SDL_Window, focusable: bool) bool {
    @setEvalBranchQuota(100000);
    if ((window.*.flags & @as(c_ulong, 524288)) != 0) {
        if (!((window.*.flags & @as(c_ulong, 8)) != 0)) {
            if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(!focusable)))) != 0) and ((window.*.flags & @as(c_ulong, 512)) != 0)) {
                var new_focus: [*c]SDL_Window = undefined;
                _ = &new_focus;
                const set_focus: bool = SDL_ShouldRelinquishPopupFocus(window, &new_focus);
                _ = &set_focus;
                Wayland_SetKeyboardFocus(new_focus, set_focus);
            } else if (focusable) {
                if (SDL_ShouldFocusPopup(window)) {
                    Wayland_SetKeyboardFocus(window, @"true" != 0);
                }
            }
        }
        return @"true" != 0;
    }
    return SDL_SetError_REAL("wayland: focus can only be toggled on popup menu windows");
}
pub export fn Wayland_ShowWindowSystemMenu(window: [*c]SDL_Window, arg_x: c_int, arg_y: c_int) void {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var seat: [*c]SDL_WaylandSeat = wind.*.waylandData.*.last_implicit_grab_seat;
    _ = &seat;
    if (!(seat != null)) {
        return;
    }
    if (wind.*.scale_to_display) {
        x = PixelToPoint(window, x);
        y = PixelToPoint(window, y);
    }
    if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
        if (wind.*.shell_surface.libdecor.frame != null) {
            WAYLAND_libdecor_frame_show_window_menu.?(wind.*.shell_surface.libdecor.frame, seat.*.wl_seat, seat.*.last_implicit_grab_serial, x, y);
        }
    } else if (wind.*.shell_surface_type == @as(enum_unnamed_83, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
        if (wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null) {
            xdg_toplevel_show_window_menu(wind.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, seat.*.wl_seat, seat.*.last_implicit_grab_serial, x, y);
        }
    }
}
pub export fn Wayland_SuspendScreenSaver(_this: [*c]SDL_VideoDevice) bool {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    if (SDL_DBus_ScreensaverInhibit(_this.*.suspend_screensaver)) {
        return @"true" != 0;
    }
    if (data.*.idle_inhibit_manager != null) {
        var window: [*c]SDL_Window = _this.*.windows;
        _ = &window;
        while (window != null) {
            var win_data: [*c]SDL_WindowData = window.*.internal;
            _ = &win_data;
            if (_this.*.suspend_screensaver and !(win_data.*.idle_inhibitor != null)) {
                win_data.*.idle_inhibitor = zwp_idle_inhibit_manager_v1_create_inhibitor(data.*.idle_inhibit_manager, win_data.*.surface);
            } else if (!_this.*.suspend_screensaver and (win_data.*.idle_inhibitor != null)) {
                zwp_idle_inhibitor_v1_destroy(win_data.*.idle_inhibitor);
                win_data.*.idle_inhibitor = null;
            }
            window = window.*.next;
        }
    }
    return @"true" != 0;
}
pub export fn Wayland_DestroyWindow(_this: [*c]SDL_VideoDevice, window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_VideoData = _this.*.internal;
    _ = &data;
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    if ((data != null) and (wind != null)) {
        if (wind.*.show_hide_sync_required) {
            window.*.hit_test = null;
            _ = WAYLAND_wl_display_roundtrip.?(data.*.display);
        }
        Wayland_DisplayRemoveWindowReferencesFromSeats(data, wind);
        if (wind.*.mask.viewport != null) {
            wp_viewport_destroy(wind.*.mask.viewport);
        }
        if (wind.*.mask.buffer != null) {
            wl_buffer_destroy(wind.*.mask.buffer);
        }
        if (wind.*.mask.subsurface != null) {
            wl_subsurface_destroy(wind.*.mask.subsurface);
        }
        if (wind.*.mask.surface != null) {
            wl_surface_destroy(wind.*.mask.surface);
        }
        if (wind.*.egl_surface != null) {
            SDL_EGL_DestroySurface(_this, wind.*.egl_surface);
        }
        if (wind.*.egl_window != null) {
            WAYLAND_wl_egl_window_destroy.?(wind.*.egl_window);
        }
        if (wind.*.idle_inhibitor != null) {
            zwp_idle_inhibitor_v1_destroy(wind.*.idle_inhibitor);
        }
        if (wind.*.activation_token != null) {
            xdg_activation_token_v1_destroy(wind.*.activation_token);
        }
        if (wind.*.viewport != null) {
            wp_viewport_destroy(wind.*.viewport);
        }
        if (wind.*.fractional_scale != null) {
            wp_fractional_scale_v1_destroy(wind.*.fractional_scale);
        }
        if (wind.*.wp_alpha_modifier_surface_v1 != null) {
            wp_alpha_modifier_surface_v1_destroy(wind.*.wp_alpha_modifier_surface_v1);
        }
        if (wind.*.frog_color_managed_surface != null) {
            frog_color_managed_surface_destroy(wind.*.frog_color_managed_surface);
        }
        if (wind.*.wp_color_management_surface_feedback != null) {
            Wayland_FreeColorInfoState(wind.*.color_info_state);
            wp_color_management_surface_feedback_v1_destroy(wind.*.wp_color_management_surface_feedback);
        }
        SDL_free_REAL(@ptrCast(@alignCast(wind.*.outputs)));
        SDL_free_REAL(@ptrCast(@alignCast(wind.*.app_id)));
        if (wind.*.gles_swap_frame_callback != null) {
            wl_callback_destroy(wind.*.gles_swap_frame_callback);
            WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(wind.*.gles_swap_frame_surface_wrapper)));
            WAYLAND_wl_event_queue_destroy.?(wind.*.gles_swap_frame_event_queue);
        }
        if (!((window.*.flags & @as(c_ulong, 2048)) != 0)) {
            wl_surface_destroy(wind.*.surface);
        } else {
            Wayland_RemoveWindowDataFromExternalList(wind);
        }
        if (wind.*.xdg_toplevel_icon_v1 != null) {
            xdg_toplevel_icon_v1_destroy(wind.*.xdg_toplevel_icon_v1);
        }
        {
            var i: c_int = 0;
            _ = &i;
            while (i < wind.*.icon_buffer_count) : (i += 1) {
                wl_buffer_destroy(wind.*.icon_buffers[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(wind.*.icon_buffers)));
        wind.*.icon_buffer_count = 0;
        SDL_free_REAL(@ptrCast(@alignCast(wind)));
    }
    window.*.internal = null;
}

pub const SDL_LIBDECOR_VERSION_MAJOR = @as(c_int, 0);
pub const SDL_LIBDECOR_VERSION_MINOR = @as(c_int, 2);
pub const SDL_LIBDECOR_VERSION_PATCH = @as(c_int, 5);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_WINDOWPOS_UNDEFINED_MASK = __helpers.promoteIntLiteral(c_uint, 0x1FFF0000, .hex);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const PROT_READ = @as(c_int, 0x1);
pub const MAP_PRIVATE = @as(c_int, 0x02);
pub inline fn SDL_LIBDECOR_CHECK_VERSION(x: anytype, y: anytype, z: anytype) @TypeOf(((SDL_LIBDECOR_VERSION_MAJOR > x) or ((SDL_LIBDECOR_VERSION_MAJOR == x) and (SDL_LIBDECOR_VERSION_MINOR > y))) or (((SDL_LIBDECOR_VERSION_MAJOR == x) and (SDL_LIBDECOR_VERSION_MINOR == y)) and (SDL_LIBDECOR_VERSION_PATCH >= z))) {
    @setEvalBranchQuota(100000);
    _ = &x;
    _ = &y;
    _ = &z;
    return ((SDL_LIBDECOR_VERSION_MAJOR > x) or ((SDL_LIBDECOR_VERSION_MAJOR == x) and (SDL_LIBDECOR_VERSION_MINOR > y))) or (((SDL_LIBDECOR_VERSION_MAJOR == x) and (SDL_LIBDECOR_VERSION_MINOR == y)) and (SDL_LIBDECOR_VERSION_PATCH >= z));
}
pub const WL_DISPLAY_SYNC = @as(c_int, 0);
pub const WL_COMPOSITOR_CREATE_SURFACE = @as(c_int, 0);
pub const WL_COMPOSITOR_CREATE_REGION = @as(c_int, 1);
pub const WL_BUFFER_DESTROY = @as(c_int, 0);
pub const WL_SURFACE_DESTROY = @as(c_int, 0);
pub const WL_SURFACE_ATTACH = @as(c_int, 1);
pub const WL_SURFACE_DAMAGE = @as(c_int, 2);
pub const WL_SURFACE_FRAME = @as(c_int, 3);
pub const WL_SURFACE_SET_OPAQUE_REGION = @as(c_int, 4);
pub const WL_SURFACE_SET_INPUT_REGION = @as(c_int, 5);
pub const WL_SURFACE_COMMIT = @as(c_int, 6);
pub const WL_SURFACE_SET_BUFFER_SCALE = @as(c_int, 8);
pub const WL_SURFACE_DAMAGE_BUFFER = @as(c_int, 9);
pub const WL_SURFACE_PREFERRED_BUFFER_SCALE_SINCE_VERSION = @as(c_int, 6);
pub const WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION = @as(c_int, 4);
pub const WL_REGION_DESTROY = @as(c_int, 0);
pub const WL_REGION_ADD = @as(c_int, 1);
pub const WL_SUBCOMPOSITOR_GET_SUBSURFACE = @as(c_int, 1);
pub const WL_SUBSURFACE_DESTROY = @as(c_int, 0);
pub const WL_SUBSURFACE_SET_POSITION = @as(c_int, 1);
pub const WL_SUBSURFACE_PLACE_BELOW = @as(c_int, 3);
pub const WP_ALPHA_MODIFIER_V1_GET_SURFACE = @as(c_int, 1);
pub const WP_ALPHA_MODIFIER_SURFACE_V1_DESTROY = @as(c_int, 0);
pub const WP_ALPHA_MODIFIER_SURFACE_V1_SET_MULTIPLIER = @as(c_int, 1);
pub const XDG_WM_BASE_CREATE_POSITIONER = @as(c_int, 1);
pub const XDG_WM_BASE_GET_XDG_SURFACE = @as(c_int, 2);
pub const XDG_POSITIONER_DESTROY = @as(c_int, 0);
pub const XDG_POSITIONER_SET_SIZE = @as(c_int, 1);
pub const XDG_POSITIONER_SET_ANCHOR_RECT = @as(c_int, 2);
pub const XDG_POSITIONER_SET_ANCHOR = @as(c_int, 3);
pub const XDG_POSITIONER_SET_GRAVITY = @as(c_int, 4);
pub const XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT = @as(c_int, 5);
pub const XDG_POSITIONER_SET_OFFSET = @as(c_int, 6);
pub const XDG_SURFACE_DESTROY = @as(c_int, 0);
pub const XDG_SURFACE_GET_TOPLEVEL = @as(c_int, 1);
pub const XDG_SURFACE_GET_POPUP = @as(c_int, 2);
pub const XDG_SURFACE_SET_WINDOW_GEOMETRY = @as(c_int, 3);
pub const XDG_SURFACE_ACK_CONFIGURE = @as(c_int, 4);
pub const XDG_TOPLEVEL_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_SET_PARENT = @as(c_int, 1);
pub const XDG_TOPLEVEL_SET_TITLE = @as(c_int, 2);
pub const XDG_TOPLEVEL_SET_APP_ID = @as(c_int, 3);
pub const XDG_TOPLEVEL_SHOW_WINDOW_MENU = @as(c_int, 4);
pub const XDG_TOPLEVEL_SET_MAX_SIZE = @as(c_int, 7);
pub const XDG_TOPLEVEL_SET_MIN_SIZE = @as(c_int, 8);
pub const XDG_TOPLEVEL_SET_MAXIMIZED = @as(c_int, 9);
pub const XDG_TOPLEVEL_UNSET_MAXIMIZED = @as(c_int, 10);
pub const XDG_TOPLEVEL_SET_FULLSCREEN = @as(c_int, 11);
pub const XDG_TOPLEVEL_UNSET_FULLSCREEN = @as(c_int, 12);
pub const XDG_TOPLEVEL_SET_MINIMIZED = @as(c_int, 13);
pub const XDG_POPUP_DESTROY = @as(c_int, 0);
pub const XDG_POPUP_REPOSITION = @as(c_int, 2);
pub const XDG_POPUP_REPOSITION_SINCE_VERSION = @as(c_int, 3);
pub const ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION = @as(c_int, 1);
pub const ZXDG_TOPLEVEL_DECORATION_V1_DESTROY = @as(c_int, 0);
pub const ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE = @as(c_int, 1);
pub const ZWP_IDLE_INHIBIT_MANAGER_V1_CREATE_INHIBITOR = @as(c_int, 1);
pub const ZWP_IDLE_INHIBITOR_V1_DESTROY = @as(c_int, 0);
pub const XDG_ACTIVATION_V1_GET_ACTIVATION_TOKEN = @as(c_int, 1);
pub const XDG_ACTIVATION_V1_ACTIVATE = @as(c_int, 2);
pub const XDG_ACTIVATION_TOKEN_V1_SET_SERIAL = @as(c_int, 0);
pub const XDG_ACTIVATION_TOKEN_V1_SET_SURFACE = @as(c_int, 2);
pub const XDG_ACTIVATION_TOKEN_V1_COMMIT = @as(c_int, 3);
pub const XDG_ACTIVATION_TOKEN_V1_DESTROY = @as(c_int, 4);
pub const WP_VIEWPORTER_GET_VIEWPORT = @as(c_int, 1);
pub const WP_VIEWPORT_DESTROY = @as(c_int, 0);
pub const WP_VIEWPORT_SET_SOURCE = @as(c_int, 1);
pub const WP_VIEWPORT_SET_DESTINATION = @as(c_int, 2);
pub const WP_FRACTIONAL_SCALE_MANAGER_V1_GET_FRACTIONAL_SCALE = @as(c_int, 1);
pub const WP_FRACTIONAL_SCALE_V1_DESTROY = @as(c_int, 0);
pub const ZXDG_EXPORTER_V2_EXPORT_TOPLEVEL = @as(c_int, 1);
pub const ZXDG_EXPORTED_V2_DESTROY = @as(c_int, 0);
pub const XDG_WM_DIALOG_V1_GET_XDG_DIALOG = @as(c_int, 1);
pub const XDG_DIALOG_V1_DESTROY = @as(c_int, 0);
pub const XDG_DIALOG_V1_SET_MODAL = @as(c_int, 1);
pub const XDG_DIALOG_V1_UNSET_MODAL = @as(c_int, 2);
pub const FROG_COLOR_MANAGEMENT_FACTORY_V1_GET_COLOR_MANAGED_SURFACE = @as(c_int, 1);
pub const FROG_COLOR_MANAGED_SURFACE_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_ICON_MANAGER_V1_CREATE_ICON = @as(c_int, 1);
pub const XDG_TOPLEVEL_ICON_MANAGER_V1_SET_ICON = @as(c_int, 2);
pub const XDG_TOPLEVEL_ICON_V1_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_ICON_V1_ADD_BUFFER = @as(c_int, 2);
pub const WP_COLOR_MANAGER_V1_GET_SURFACE_FEEDBACK = @as(c_int, 3);
pub const WP_COLOR_MANAGEMENT_SURFACE_FEEDBACK_V1_DESTROY = @as(c_int, 0);
pub const XDG_SESSION_V1_RESTORE_TOPLEVEL = @as(c_int, 3);
pub const XDG_SESSION_V1_REMOVE_TOPLEVEL = @as(c_int, 4);
pub const XDG_TOPLEVEL_SESSION_V1_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_TAG_MANAGER_V1_SET_TOPLEVEL_TAG = @as(c_int, 1);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_surface = struct_wl_surface;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_callback = struct_wl_callback;
pub const wl_touch = struct_wl_touch;
pub const xdg_surface = struct_xdg_surface;
pub const xdg_toplevel = struct_xdg_toplevel;
