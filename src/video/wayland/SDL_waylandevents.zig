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
pub const __off_t = c_long;
pub const __pid_t = c_int;
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strtok_r_REAL(str: [*c]u8, delim: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_utf8strnlen_REAL(str: [*c]const u8, bytes: usize) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_ceil_REAL(x: f64) f64;
pub extern fn SDL_floor_REAL(x: f64) f64;
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
pub inline fn SDL_PointInRect(p: [*c]const SDL_Point, r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((((((p != null) and (r != null)) and (p.*.x >= r.*.x)) and (p.*.x < (r.*.x + r.*.w))) and (p.*.y >= r.*.y)) and (p.*.y < (r.*.y + r.*.h))) @"true" else @"false") != 0;
}
pub inline fn SDL_RectEmpty(r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @"true" else @"false") != 0;
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
pub const SDL_HITTEST_NORMAL: c_int = 0;
pub const SDL_HITTEST_DRAGGABLE: c_int = 1;
pub const SDL_HITTEST_RESIZE_TOPLEFT: c_int = 2;
pub const SDL_HITTEST_RESIZE_TOP: c_int = 3;
pub const SDL_HITTEST_RESIZE_TOPRIGHT: c_int = 4;
pub const SDL_HITTEST_RESIZE_RIGHT: c_int = 5;
pub const SDL_HITTEST_RESIZE_BOTTOMRIGHT: c_int = 6;
pub const SDL_HITTEST_RESIZE_BOTTOM: c_int = 7;
pub const SDL_HITTEST_RESIZE_BOTTOMLEFT: c_int = 8;
pub const SDL_HITTEST_RESIZE_LEFT: c_int = 9;
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
pub const struct_wp_pointer_warp_v1_18 = opaque {};
pub const struct_wp_cursor_shape_manager_v1_19 = opaque {
};
pub const struct_wl_data_device_manager_20 = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_21 = opaque {
};
pub const struct_zxdg_decoration_manager_v1_22 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23 = opaque {
};
pub const struct_zwp_idle_inhibit_manager_v1_24 = opaque {};
pub const struct_xdg_activation_v1_25 = opaque {};
pub const struct_zwp_text_input_manager_v3_26 = opaque {
};
pub const struct_zxdg_output_manager_v1_27 = opaque {};
pub const struct_wp_viewporter_28 = opaque {
};
pub const struct_wp_fractional_scale_manager_v1_29 = opaque {};
pub const struct_zwp_input_timestamps_manager_v1_30 = opaque {
};
pub const struct_zxdg_exporter_v2_31 = opaque {};
pub const struct_xdg_wm_dialog_v1_32 = opaque {};
pub const struct_wp_alpha_modifier_v1_33 = opaque {};
pub const struct_xdg_toplevel_icon_manager_v1_34 = opaque {};
pub const struct_frog_color_management_factory_v1_35 = opaque {};
pub const struct_wp_color_manager_v1_36 = opaque {};
pub const struct_zwp_tablet_manager_v2_37 = opaque {
};
pub const struct_wl_fixes_38 = opaque {
};
pub const struct_zwp_pointer_gestures_v1_39 = opaque {
};
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
pub const SDL_WAYLAND_AXIS_EVENT_CONTINUOUS: c_int = 0;
pub const SDL_WAYLAND_AXIS_EVENT_DISCRETE: c_int = 1;
pub const SDL_WAYLAND_AXIS_EVENT_VALUE120: c_int = 2;
pub const enum_SDL_WaylandAxisEvent = c_uint;
pub const SDL_MOUSEWHEEL_NORMAL: c_int = 0;
pub const SDL_MOUSEWHEEL_FLIPPED: c_int = 1;
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
pub const struct_xdg_surface = opaque {
};
pub const struct_xdg_toplevel = opaque {
};
const struct_unnamed_81 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_83 = opaque {
};
pub const struct_xdg_positioner_84 = opaque {
};
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
pub const WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL: c_int = 1;
pub const WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR: c_int = 3;
const enum_unnamed_85 = c_uint;
const enum_unnamed_86 = c_uint;
const enum_unnamed_87 = c_uint;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_LEFT: c_int = 1;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT: c_int = 2;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_TOP: c_int = 4;
pub const WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM: c_int = 8;
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
pub extern fn SDL_GetWindowID_REAL(window: [*c]SDL_Window) SDL_WindowID;
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_RETURN: c_int = 40;
pub const SDL_SCANCODE_ESCAPE: c_int = 41;
pub const SDL_SCANCODE_BACKSPACE: c_int = 42;
pub const SDL_SCANCODE_DELETE: c_int = 76;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
pub extern fn SDL_GetModState_REAL() SDL_Keymod;
pub extern fn SDL_SetModState_REAL(modstate: SDL_Keymod) void;
pub extern fn SDL_GetKeyFromScancode_REAL(scancode: SDL_Scancode, modstate: SDL_Keymod, key_event: bool) SDL_Keycode;
pub extern fn SDL_TextInputActive_REAL(window: [*c]SDL_Window) bool;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: ?*SDL_CursorData = null,
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
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub extern fn SDL_GetMouseFocus_REAL() [*c]SDL_Window;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const enum_SDL_TouchDeviceType = c_int;
pub const SDL_TouchDeviceType = enum_SDL_TouchDeviceType;
pub const SDL_PenID = Uint32;
pub const SDL_PEN_AXIS_PRESSURE: c_int = 0;
pub const SDL_PEN_AXIS_XTILT: c_int = 1;
pub const SDL_PEN_AXIS_YTILT: c_int = 2;
pub const SDL_PEN_AXIS_DISTANCE: c_int = 3;
pub const SDL_PEN_AXIS_ROTATION: c_int = 4;
pub const SDL_PEN_AXIS_SLIDER: c_int = 5;
pub const SDL_PEN_AXIS_COUNT: c_int = 7;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_FINGER_CANCELED: c_int = 1795;
pub const SDL_EVENT_PINCH_BEGIN: c_int = 1808;
pub const SDL_EVENT_PINCH_UPDATE: c_int = 1809;
pub const SDL_EVENT_PINCH_END: c_int = 1810;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogTrace_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_URIToLocal(src: [*c]const u8, dst: [*c]u8) c_int;
pub extern fn SDL_GetNextObjectID() Uint32;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub extern fn SDL_SendDropFile(window: [*c]SDL_Window, source: [*c]const u8, file: [*c]const u8) bool;
pub extern fn SDL_SendDropPosition(window: [*c]SDL_Window, x: f32, y: f32) bool;
pub extern fn SDL_SendDropText(window: [*c]SDL_Window, text: [*c]const u8) bool;
pub extern fn SDL_SendDropComplete(window: [*c]SDL_Window) bool;
pub extern fn SDL_CreateKeymap(auto_release: bool) ?*SDL_Keymap;
pub extern fn SDL_SetKeymapEntry(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod, keycode: SDL_Keycode) void;
pub extern fn SDL_GetKeymapScancode(keymap: ?*SDL_Keymap, keycode: SDL_Keycode, modstate: [*c]SDL_Keymod) SDL_Scancode;
pub extern fn SDL_GetKeymapNextReservedScancode(keymap: ?*SDL_Keymap) SDL_Scancode;
pub extern fn SDL_DestroyKeymap(keymap: ?*SDL_Keymap) void;
pub extern fn SDL_AddKeyboard(keyboardID: SDL_KeyboardID, name: [*c]const u8) void;
pub extern fn SDL_RemoveKeyboard(keyboardID: SDL_KeyboardID) void;
pub extern fn SDL_SetKeymap(keymap: ?*SDL_Keymap, send_event: bool) void;
pub extern fn SDL_GetCurrentKeymap(ignore_options: bool) ?*SDL_Keymap;
pub extern fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool;
pub extern fn SDL_SendKeyboardKeyIgnoreModifiers(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool;
pub extern fn SDL_SendKeyboardText(text: [*c]const u8) void;
pub extern fn SDL_SendEditingText(text: [*c]const u8, start: c_int, length: c_int) void;
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
pub extern fn SDL_AddMouse(mouseID: SDL_MouseID, name: [*c]const u8) void;
pub extern fn SDL_RemoveMouse(mouseID: SDL_MouseID) void;
pub extern fn SDL_GetMouse() [*c]SDL_Mouse;
pub extern fn SDL_SetMouseFocus(window: [*c]SDL_Window) void;
pub extern fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void;
pub extern fn SDL_SendMouseWarp(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32) void;
pub extern fn SDL_SendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool) void;
pub extern fn SDL_SendMouseWheel(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32, direction: SDL_MouseWheelDirection) void;
pub extern fn SDL_AddTouch(id: SDL_TouchID, @"type": SDL_TouchDeviceType, name: [*c]const u8) c_int;
pub extern fn SDL_SendTouch(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, @"type": SDL_EventType, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendTouchMotion(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_DelTouch(id: SDL_TouchID) void;
pub extern fn SDL_SendPinch(@"type": SDL_EventType, timestamp: Uint64, window: [*c]SDL_Window, scale: f32, span_x: f32, span_y: f32, focus_x: f32, focus_y: f32) c_int;
pub const SDL_PenCapabilityFlags = Uint32;
pub const SDL_PEN_TYPE_UNKNOWN: c_int = 0;
pub const SDL_PEN_TYPE_ERASER: c_int = 1;
pub const SDL_PEN_TYPE_PEN: c_int = 2;
pub const SDL_PEN_TYPE_PENCIL: c_int = 3;
pub const SDL_PEN_TYPE_BRUSH: c_int = 4;
pub const SDL_PEN_TYPE_AIRBRUSH: c_int = 5;
pub const enum_SDL_PenSubtype = c_uint;
pub const SDL_PenSubtype = enum_SDL_PenSubtype;
pub const struct_SDL_PenInfo = extern struct {
    capabilities: SDL_PenCapabilityFlags = 0,
    max_tilt: f32 = 0,
    wacom_id: Uint32 = 0,
    num_buttons: c_int = 0,
    subtype: SDL_PenSubtype = @import("std").mem.zeroes(SDL_PenSubtype),
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenInfo = struct_SDL_PenInfo;
pub extern fn SDL_AddPenDevice(timestamp: Uint64, name: [*c]const u8, window: [*c]SDL_Window, info: [*c]const SDL_PenInfo, handle: ?*anyopaque, in_proximity: bool) SDL_PenID;
pub extern fn SDL_RemovePenDevice(timestamp: Uint64, window: [*c]SDL_Window, instance_id: SDL_PenID) void;
pub extern fn SDL_RemoveAllPenDevices(callback: ?*const fn (instance_id: SDL_PenID, handle: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) void, userdata: ?*anyopaque) void;
pub extern fn SDL_SendPenTouch(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, eraser: bool, down: bool) void;
pub extern fn SDL_SendPenMotion(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, x: f32, y: f32) void;
pub extern fn SDL_SendPenAxis(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, axis: SDL_PenAxis, value: f32) void;
pub extern fn SDL_SendPenButton(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, button: Uint8, down: bool) void;
pub extern fn SDL_SendPenProximity(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, in: bool, immediate: bool) void;
pub const SDL_SCANCODE_TABLE_LINUX: c_int = 1;
pub const SDL_ScancodeTable = c_uint;
pub extern fn SDL_GetScancodeFromTable(table: SDL_ScancodeTable, keycode: c_int) SDL_Scancode;
pub extern fn SDL_GetKeyCodeFromKeySym(keysym: Uint32, keycode: Uint32, modifiers: SDL_Keymod) SDL_Keycode;
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
pub fn wl_fixed_to_double(f: wl_fixed_t) callconv(.c) f64 {
    @setEvalBranchQuota(100000);
    return @as(f64, @floatFromInt(f)) / @as(f64, 256.0);
}
pub fn wl_fixed_to_int(f: wl_fixed_t) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @divTrunc(f, @as(c_int, 256));
}
pub fn wl_fixed_from_int(i: c_int) callconv(.c) wl_fixed_t {
    @setEvalBranchQuota(100000);
    return i * @as(c_int, 256);
}
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
pub extern fn SDL_DBus_DocumentsPortalRetrieveFiles(key: [*c]const u8, files_count: [*c]c_int) [*c][*c]u8;
pub extern fn SDL_IME_SetFocus(focused: bool) void;
pub extern fn SDL_IME_ProcessKeyEvent(keysym: Uint32, keycode: Uint32, down: bool) bool;
pub extern fn SDL_IME_PumpEvents() void;
pub const struct_wl_cursor_theme_115 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_115 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const LIBDECOR_RESIZE_EDGE_TOP: c_int = 1;
pub const LIBDECOR_RESIZE_EDGE_BOTTOM: c_int = 2;
pub const LIBDECOR_RESIZE_EDGE_LEFT: c_int = 3;
pub const LIBDECOR_RESIZE_EDGE_TOP_LEFT: c_int = 4;
pub const LIBDECOR_RESIZE_EDGE_BOTTOM_LEFT: c_int = 5;
pub const LIBDECOR_RESIZE_EDGE_RIGHT: c_int = 6;
pub const LIBDECOR_RESIZE_EDGE_TOP_RIGHT: c_int = 7;
pub const LIBDECOR_RESIZE_EDGE_BOTTOM_RIGHT: c_int = 8;
pub const enum_libdecor_resize_edge = c_uint;
pub const xkb_keycode_t = u32;
pub const xkb_keysym_t = u32;
pub const xkb_level_index_t = u32;
pub const enum_xkb_keymap_compile_flags = c_uint;
pub const XKB_KEYMAP_FORMAT_TEXT_V1: c_int = 1;
pub const enum_xkb_keymap_format = c_uint;
pub const xkb_keymap_key_iter_t = ?*const fn (keymap: ?*struct_xkb_keymap, key: xkb_keycode_t, data: ?*anyopaque) callconv(.c) void;
pub extern fn xkb_keymap_key_get_mods_for_level(keymap: ?*struct_xkb_keymap, key: xkb_keycode_t, layout: xkb_layout_index_t, level: xkb_level_index_t, masks_out: [*c]xkb_mod_mask_t, masks_size: usize) usize;
pub const enum_xkb_state_component = c_uint;
pub const XKB_COMPOSE_COMPILE_NO_FLAGS: c_int = 0;
pub const enum_xkb_compose_compile_flags = c_uint;
pub const XKB_COMPOSE_STATE_NO_FLAGS: c_int = 0;
pub const enum_xkb_compose_state_flags = c_uint;
pub const XKB_COMPOSE_NOTHING: c_int = 0;
pub const XKB_COMPOSE_COMPOSING: c_int = 1;
pub const XKB_COMPOSE_COMPOSED: c_int = 2;
pub const XKB_COMPOSE_CANCELLED: c_int = 3;
pub const enum_xkb_compose_status = c_uint;
pub const XKB_COMPOSE_FEED_ACCEPTED: c_int = 1;
pub const enum_xkb_compose_feed_result = c_uint;
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
pub const SDL_DYNWAYLANDFN_wl_proxy_get_id = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_id: SDL_DYNWAYLANDFN_wl_proxy_get_id;
pub const SDL_DYNWAYLANDFN_wl_display_get_fd = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_get_fd: SDL_DYNWAYLANDFN_wl_display_get_fd;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_pending = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_dispatch_pending: SDL_DYNWAYLANDFN_wl_display_dispatch_pending;
pub const SDL_DYNWAYLANDFN_wl_display_prepare_read = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_prepare_read: SDL_DYNWAYLANDFN_wl_display_prepare_read;
pub const SDL_DYNWAYLANDFN_wl_display_read_events = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_read_events: SDL_DYNWAYLANDFN_wl_display_read_events;
pub const SDL_DYNWAYLANDFN_wl_display_cancel_read = ?*const fn (?*struct_wl_display_8) callconv(.c) void;
pub extern var WAYLAND_wl_display_cancel_read: SDL_DYNWAYLANDFN_wl_display_cancel_read;
pub const SDL_DYNWAYLANDFN_wl_display_flush = ?*const fn (?*struct_wl_display_8) callconv(.c) c_int;
pub extern var WAYLAND_wl_display_flush: SDL_DYNWAYLANDFN_wl_display_flush;
pub const SDL_DYNWAYLANDFN_wl_list_init = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_init: SDL_DYNWAYLANDFN_wl_list_init;
pub const SDL_DYNWAYLANDFN_wl_list_insert = ?*const fn ([*c]struct_wl_list, [*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_insert: SDL_DYNWAYLANDFN_wl_list_insert;
pub const SDL_DYNWAYLANDFN_wl_list_remove = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_remove: SDL_DYNWAYLANDFN_wl_list_remove;
pub const SDL_DYNWAYLANDFN_wl_array_init = ?*const fn ([*c]struct_wl_array) callconv(.c) void;
pub extern var WAYLAND_wl_array_init: SDL_DYNWAYLANDFN_wl_array_init;
pub const SDL_DYNWAYLANDFN_wl_array_release = ?*const fn ([*c]struct_wl_array) callconv(.c) void;
pub extern var WAYLAND_wl_array_release: SDL_DYNWAYLANDFN_wl_array_release;
pub const SDL_DYNWAYLANDFN_wl_array_add = ?*const fn ([*c]struct_wl_array, usize) callconv(.c) ?*anyopaque;
pub extern var WAYLAND_wl_array_add: SDL_DYNWAYLANDFN_wl_array_add;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const SDL_DYNWAYLANDFN_xkb_state_key_get_syms = ?*const fn (?*struct_xkb_state, xkb_keycode_t, [*c][*c]const xkb_keysym_t) callconv(.c) c_int;
pub extern var WAYLAND_xkb_state_key_get_syms: SDL_DYNWAYLANDFN_xkb_state_key_get_syms;
pub const SDL_DYNWAYLANDFN_xkb_keysym_to_utf8 = ?*const fn (xkb_keysym_t, [*c]u8, usize) callconv(.c) c_int;
pub extern var WAYLAND_xkb_keysym_to_utf8: SDL_DYNWAYLANDFN_xkb_keysym_to_utf8;
pub const SDL_DYNWAYLANDFN_xkb_keymap_new_from_string = ?*const fn (?*struct_xkb_context, [*c]const u8, enum_xkb_keymap_format, enum_xkb_keymap_compile_flags) callconv(.c) ?*struct_xkb_keymap;
pub extern var WAYLAND_xkb_keymap_new_from_string: SDL_DYNWAYLANDFN_xkb_keymap_new_from_string;
pub const SDL_DYNWAYLANDFN_xkb_state_new = ?*const fn (?*struct_xkb_keymap) callconv(.c) ?*struct_xkb_state;
pub extern var WAYLAND_xkb_state_new: SDL_DYNWAYLANDFN_xkb_state_new;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_repeats = ?*const fn (keymap: ?*struct_xkb_keymap, key: xkb_keycode_t) callconv(.c) c_int;
pub extern var WAYLAND_xkb_keymap_key_repeats: SDL_DYNWAYLANDFN_xkb_keymap_key_repeats;
pub const SDL_DYNWAYLANDFN_xkb_keymap_unref = ?*const fn (?*struct_xkb_keymap) callconv(.c) void;
pub extern var WAYLAND_xkb_keymap_unref: SDL_DYNWAYLANDFN_xkb_keymap_unref;
pub const SDL_DYNWAYLANDFN_xkb_state_unref = ?*const fn (?*struct_xkb_state) callconv(.c) void;
pub extern var WAYLAND_xkb_state_unref: SDL_DYNWAYLANDFN_xkb_state_unref;
pub const SDL_DYNWAYLANDFN_xkb_state_update_mask = ?*const fn (state: ?*struct_xkb_state, depressed_mods: xkb_mod_mask_t, latched_mods: xkb_mod_mask_t, locked_mods: xkb_mod_mask_t, depressed_layout: xkb_layout_index_t, latched_layout: xkb_layout_index_t, locked_layout: xkb_layout_index_t) callconv(.c) enum_xkb_state_component;
pub extern var WAYLAND_xkb_state_update_mask: SDL_DYNWAYLANDFN_xkb_state_update_mask;
pub const SDL_DYNWAYLANDFN_xkb_compose_table_new_from_locale = ?*const fn (?*struct_xkb_context, locale: [*c]const u8, enum_xkb_compose_compile_flags) callconv(.c) ?*struct_xkb_compose_table;
pub extern var WAYLAND_xkb_compose_table_new_from_locale: SDL_DYNWAYLANDFN_xkb_compose_table_new_from_locale;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_reset = ?*const fn (?*struct_xkb_compose_state) callconv(.c) void;
pub extern var WAYLAND_xkb_compose_state_reset: SDL_DYNWAYLANDFN_xkb_compose_state_reset;
pub const SDL_DYNWAYLANDFN_xkb_compose_table_unref = ?*const fn (?*struct_xkb_compose_table) callconv(.c) void;
pub extern var WAYLAND_xkb_compose_table_unref: SDL_DYNWAYLANDFN_xkb_compose_table_unref;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_new = ?*const fn (?*struct_xkb_compose_table, enum_xkb_compose_state_flags) callconv(.c) ?*struct_xkb_compose_state;
pub extern var WAYLAND_xkb_compose_state_new: SDL_DYNWAYLANDFN_xkb_compose_state_new;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_unref = ?*const fn (?*struct_xkb_compose_state) callconv(.c) void;
pub extern var WAYLAND_xkb_compose_state_unref: SDL_DYNWAYLANDFN_xkb_compose_state_unref;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_feed = ?*const fn (?*struct_xkb_compose_state, xkb_keysym_t) callconv(.c) enum_xkb_compose_feed_result;
pub extern var WAYLAND_xkb_compose_state_feed: SDL_DYNWAYLANDFN_xkb_compose_state_feed;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_get_status = ?*const fn (?*struct_xkb_compose_state) callconv(.c) enum_xkb_compose_status;
pub extern var WAYLAND_xkb_compose_state_get_status: SDL_DYNWAYLANDFN_xkb_compose_state_get_status;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_get_one_sym = ?*const fn (?*struct_xkb_compose_state) callconv(.c) xkb_keysym_t;
pub extern var WAYLAND_xkb_compose_state_get_one_sym: SDL_DYNWAYLANDFN_xkb_compose_state_get_one_sym;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_for_each = ?*const fn (?*struct_xkb_keymap, xkb_keymap_key_iter_t, ?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_xkb_keymap_key_for_each: SDL_DYNWAYLANDFN_xkb_keymap_key_for_each;
pub const SDL_DYNWAYLANDFN_xkb_keymap_num_layouts = ?*const fn (?*struct_xkb_keymap) callconv(.c) xkb_layout_index_t;
pub extern var WAYLAND_xkb_keymap_num_layouts: SDL_DYNWAYLANDFN_xkb_keymap_num_layouts;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_get_syms_by_level = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t, xkb_level_index_t, [*c][*c]const xkb_keysym_t) callconv(.c) c_int;
pub extern var WAYLAND_xkb_keymap_key_get_syms_by_level: SDL_DYNWAYLANDFN_xkb_keymap_key_get_syms_by_level;
pub const SDL_DYNWAYLANDFN_xkb_keymap_num_levels_for_key = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t) callconv(.c) xkb_level_index_t;
pub extern var WAYLAND_xkb_keymap_num_levels_for_key: SDL_DYNWAYLANDFN_xkb_keymap_num_levels_for_key;
pub const SDL_DYNWAYLANDFN_xkb_keymap_layout_get_name = ?*const fn (?*struct_xkb_keymap, xkb_layout_index_t) callconv(.c) [*c]const u8;
pub extern var WAYLAND_xkb_keymap_layout_get_name: SDL_DYNWAYLANDFN_xkb_keymap_layout_get_name;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_get_mods_for_level = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t, xkb_level_index_t, [*c]xkb_mod_mask_t, usize) callconv(.c) usize;
pub extern var WAYLAND_xkb_keymap_key_get_mods_for_level: SDL_DYNWAYLANDFN_xkb_keymap_key_get_mods_for_level;
pub const SDL_DYNWAYLANDFN_xkb_keymap_mod_get_mask = ?*const fn (?*struct_xkb_keymap, [*c]const u8) callconv(.c) xkb_mod_mask_t;
pub extern var WAYLAND_xkb_keymap_mod_get_mask: SDL_DYNWAYLANDFN_xkb_keymap_mod_get_mask;
pub const SDL_DYNWAYLANDFN_libdecor_frame_resize = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32, enum_libdecor_resize_edge) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_resize: SDL_DYNWAYLANDFN_libdecor_frame_resize;
pub const SDL_DYNWAYLANDFN_libdecor_frame_move = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32) callconv(.c) void;
pub extern var WAYLAND_libdecor_frame_move: SDL_DYNWAYLANDFN_libdecor_frame_move;
pub const SDL_DYNWAYLANDFN_libdecor_dispatch = ?*const fn (?*struct_libdecor_14, c_int) callconv(.c) c_int;
pub extern var WAYLAND_libdecor_dispatch: SDL_DYNWAYLANDFN_libdecor_dispatch;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub const struct_wl_region = opaque {
};
pub extern const wl_callback_interface: struct_wl_interface;
pub extern const wl_data_device_interface: struct_wl_interface;
pub extern const wl_pointer_interface: struct_wl_interface;
pub extern const wl_keyboard_interface: struct_wl_interface;
pub extern const wl_touch_interface: struct_wl_interface;
pub extern const wl_region_interface: struct_wl_interface;
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
pub fn wl_compositor_create_region(wl_compositor: ?*struct_wl_compositor_10) callconv(.c) ?*struct_wl_region {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_compositor)), WL_COMPOSITOR_CREATE_REGION, &wl_region_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_compositor))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub const struct_wl_data_offer_listener = extern struct {
    offer: ?*const fn (data: ?*anyopaque, wl_data_offer: ?*struct_wl_data_offer, mime_type: [*c]const u8) callconv(.c) void = null,
    source_actions: ?*const fn (data: ?*anyopaque, wl_data_offer: ?*struct_wl_data_offer, source_actions: u32) callconv(.c) void = null,
    action: ?*const fn (data: ?*anyopaque, wl_data_offer: ?*struct_wl_data_offer, dnd_action: u32) callconv(.c) void = null,
};
pub fn wl_data_offer_add_listener(wl_data_offer_1: ?*struct_wl_data_offer, listener: [*c]const struct_wl_data_offer_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_data_offer_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_data_offer_set_user_data(wl_data_offer_1: ?*struct_wl_data_offer, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_data_offer_1)), user_data);
}
pub fn wl_data_offer_get_user_data(wl_data_offer_1: ?*struct_wl_data_offer) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_user_data.?(@ptrCast(@alignCast(wl_data_offer_1)));
}
pub fn wl_data_offer_get_version(wl_data_offer_1: ?*struct_wl_data_offer) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1)));
}
pub fn wl_data_offer_accept(wl_data_offer_1: ?*struct_wl_data_offer, serial: u32, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_offer_1)), WL_DATA_OFFER_ACCEPT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1))), 0, serial, mime_type);
}
pub fn wl_data_offer_finish(wl_data_offer_1: ?*struct_wl_data_offer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_offer_1)), WL_DATA_OFFER_FINISH, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1))), 0);
}
pub fn wl_data_offer_set_actions(wl_data_offer_1: ?*struct_wl_data_offer, dnd_actions: u32, preferred_action: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_offer_1)), WL_DATA_OFFER_SET_ACTIONS, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_offer_1))), 0, dnd_actions, preferred_action);
}
pub const struct_wl_data_device_listener = extern struct {
    data_offer: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device, id: ?*struct_wl_data_offer) callconv(.c) void = null,
    enter: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device, serial: u32, surface: ?*struct_wl_surface, x: wl_fixed_t, y: wl_fixed_t, id: ?*struct_wl_data_offer) callconv(.c) void = null,
    leave: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device) callconv(.c) void = null,
    motion: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device, time: u32, x: wl_fixed_t, y: wl_fixed_t) callconv(.c) void = null,
    drop: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device) callconv(.c) void = null,
    selection: ?*const fn (data: ?*anyopaque, wl_data_device: ?*struct_wl_data_device, id: ?*struct_wl_data_offer) callconv(.c) void = null,
};
pub fn wl_data_device_add_listener(wl_data_device_1: ?*struct_wl_data_device, listener: [*c]const struct_wl_data_device_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_data_device_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_data_device_set_user_data(wl_data_device_1: ?*struct_wl_data_device, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_data_device_1)), user_data);
}
pub fn wl_data_device_get_version(wl_data_device_1: ?*struct_wl_data_device) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_device_1)));
}
pub fn wl_data_device_destroy(wl_data_device_1: ?*struct_wl_data_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_data_device_1)));
}
pub fn wl_data_device_release(wl_data_device_1: ?*struct_wl_data_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_device_1)), WL_DATA_DEVICE_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_device_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE: c_int = 0;
pub const WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY: c_int = 1;
pub fn wl_data_device_manager_get_data_device(wl_data_device_manager: ?*struct_wl_data_device_manager_20, seat: ?*struct_wl_seat) callconv(.c) ?*struct_wl_data_device {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_data_device_manager)), WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE, &wl_data_device_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_data_device_manager))), 0, @as(?*anyopaque, null), seat);
    return @ptrCast(@alignCast(id));
}
pub const WL_SEAT_CAPABILITY_POINTER: c_int = 1;
pub const WL_SEAT_CAPABILITY_KEYBOARD: c_int = 2;
pub const WL_SEAT_CAPABILITY_TOUCH: c_int = 4;
pub const struct_wl_seat_listener = extern struct {
    capabilities: ?*const fn (data: ?*anyopaque, wl_seat: ?*struct_wl_seat, capabilities: u32) callconv(.c) void = null,
    name: ?*const fn (data: ?*anyopaque, wl_seat: ?*struct_wl_seat, name: [*c]const u8) callconv(.c) void = null,
};
pub fn wl_seat_add_listener(wl_seat_1: ?*struct_wl_seat, listener: [*c]const struct_wl_seat_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_seat_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_seat_set_user_data(wl_seat_1: ?*struct_wl_seat, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_seat_1)), user_data);
}
pub fn wl_seat_get_version(wl_seat_1: ?*struct_wl_seat) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_seat_1)));
}
pub fn wl_seat_destroy(wl_seat_1: ?*struct_wl_seat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_seat_1)));
}
pub fn wl_seat_get_pointer(wl_seat_1: ?*struct_wl_seat) callconv(.c) ?*struct_wl_pointer {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_seat_1)), WL_SEAT_GET_POINTER, &wl_pointer_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_seat_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_seat_get_keyboard(wl_seat_1: ?*struct_wl_seat) callconv(.c) ?*struct_wl_keyboard {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_seat_1)), WL_SEAT_GET_KEYBOARD, &wl_keyboard_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_seat_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_seat_get_touch(wl_seat_1: ?*struct_wl_seat) callconv(.c) ?*struct_wl_touch {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_seat_1)), WL_SEAT_GET_TOUCH, &wl_touch_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_seat_1))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_seat_release(wl_seat_1: ?*struct_wl_seat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_seat_1)), WL_SEAT_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_seat_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const WL_POINTER_AXIS_VERTICAL_SCROLL: c_int = 0;
pub const WL_POINTER_AXIS_HORIZONTAL_SCROLL: c_int = 1;
pub const enum_wl_pointer_axis = c_uint;
pub const WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL: c_int = 0;
pub const WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED: c_int = 1;
pub const struct_wl_pointer_listener = extern struct {
    enter: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, serial: u32, surface: ?*struct_wl_surface, surface_x: wl_fixed_t, surface_y: wl_fixed_t) callconv(.c) void = null,
    leave: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, serial: u32, surface: ?*struct_wl_surface) callconv(.c) void = null,
    motion: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, time: u32, surface_x: wl_fixed_t, surface_y: wl_fixed_t) callconv(.c) void = null,
    button: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, serial: u32, time: u32, button: u32, state: u32) callconv(.c) void = null,
    axis: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, time: u32, axis: u32, value: wl_fixed_t) callconv(.c) void = null,
    frame: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer) callconv(.c) void = null,
    axis_source: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, axis_source: u32) callconv(.c) void = null,
    axis_stop: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, time: u32, axis: u32) callconv(.c) void = null,
    axis_discrete: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, axis: u32, discrete: i32) callconv(.c) void = null,
    axis_value120: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, axis: u32, value120: i32) callconv(.c) void = null,
    axis_relative_direction: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, axis: u32, direction: u32) callconv(.c) void = null,
    warp: ?*const fn (data: ?*anyopaque, wl_pointer: ?*struct_wl_pointer, surface_x: wl_fixed_t, surface_y: wl_fixed_t) callconv(.c) void = null,
};
pub fn wl_pointer_add_listener(wl_pointer_1: ?*struct_wl_pointer, listener: [*c]const struct_wl_pointer_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_pointer_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_pointer_set_user_data(wl_pointer_1: ?*struct_wl_pointer, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_pointer_1)), user_data);
}
pub fn wl_pointer_get_version(wl_pointer_1: ?*struct_wl_pointer) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_pointer_1)));
}
pub fn wl_pointer_destroy(wl_pointer_1: ?*struct_wl_pointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_pointer_1)));
}
pub fn wl_pointer_release(wl_pointer_1: ?*struct_wl_pointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_pointer_1)), WL_POINTER_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_pointer_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1: c_int = 1;
pub const WL_KEYBOARD_KEY_STATE_PRESSED: c_int = 1;
pub const WL_KEYBOARD_KEY_STATE_REPEATED: c_int = 2;
pub const enum_wl_keyboard_key_state = c_uint;
pub const struct_wl_keyboard_listener = extern struct {
    keymap: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, format: u32, fd: i32, size: u32) callconv(.c) void = null,
    enter: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, serial: u32, surface: ?*struct_wl_surface, keys: [*c]struct_wl_array) callconv(.c) void = null,
    leave: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, serial: u32, surface: ?*struct_wl_surface) callconv(.c) void = null,
    key: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, serial: u32, time: u32, key: u32, state: u32) callconv(.c) void = null,
    modifiers: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, serial: u32, mods_depressed: u32, mods_latched: u32, mods_locked: u32, group: u32) callconv(.c) void = null,
    repeat_info: ?*const fn (data: ?*anyopaque, wl_keyboard: ?*struct_wl_keyboard, rate: i32, delay: i32) callconv(.c) void = null,
};
pub fn wl_keyboard_add_listener(wl_keyboard_1: ?*struct_wl_keyboard, listener: [*c]const struct_wl_keyboard_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_keyboard_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_keyboard_set_user_data(wl_keyboard_1: ?*struct_wl_keyboard, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_keyboard_1)), user_data);
}
pub fn wl_keyboard_get_version(wl_keyboard_1: ?*struct_wl_keyboard) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_keyboard_1)));
}
pub fn wl_keyboard_destroy(wl_keyboard_1: ?*struct_wl_keyboard) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_keyboard_1)));
}
pub fn wl_keyboard_release(wl_keyboard_1: ?*struct_wl_keyboard) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_keyboard_1)), WL_KEYBOARD_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_keyboard_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_wl_touch_listener = extern struct {
    down: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch, serial: u32, time: u32, surface: ?*struct_wl_surface, id: i32, x: wl_fixed_t, y: wl_fixed_t) callconv(.c) void = null,
    up: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch, serial: u32, time: u32, id: i32) callconv(.c) void = null,
    motion: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch, time: u32, id: i32, x: wl_fixed_t, y: wl_fixed_t) callconv(.c) void = null,
    frame: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch) callconv(.c) void = null,
    cancel: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch) callconv(.c) void = null,
    shape: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch, id: i32, major: wl_fixed_t, minor: wl_fixed_t) callconv(.c) void = null,
    orientation: ?*const fn (data: ?*anyopaque, wl_touch: ?*struct_wl_touch, id: i32, orientation: wl_fixed_t) callconv(.c) void = null,
};
pub fn wl_touch_add_listener(wl_touch_1: ?*struct_wl_touch, listener: [*c]const struct_wl_touch_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(wl_touch_1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn wl_touch_set_user_data(wl_touch_1: ?*struct_wl_touch, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(wl_touch_1)), user_data);
}
pub fn wl_touch_get_version(wl_touch_1: ?*struct_wl_touch) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_touch_1)));
}
pub fn wl_touch_destroy(wl_touch_1: ?*struct_wl_touch) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_destroy.?(@ptrCast(@alignCast(wl_touch_1)));
}
pub fn wl_touch_release(wl_touch_1: ?*struct_wl_touch) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_touch_1)), WL_TOUCH_RELEASE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_touch_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_region_destroy(wl_region_1: ?*struct_wl_region) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_region_1)), WL_REGION_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_region_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wl_region_add(wl_region_1: ?*struct_wl_region, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_region_1)), WL_REGION_ADD, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_region_1))), 0, x, y, width, height);
}
pub extern fn Wayland_GetWindowDataForOwnedSurface(surface: ?*struct_wl_surface) [*c]SDL_WindowData;
pub extern fn Wayland_HandleDisplayDisconnected(_this: [*c]SDL_VideoDevice) bool;
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
pub const struct_zwp_primary_selection_source_v1_116 = opaque {
};
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
pub const struct_zwp_primary_selection_offer_v1_117 = opaque {
};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_117 = null,
    mimes: struct_wl_array = @import("std").mem.zeroes(struct_wl_array),
    primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = null,
};
pub extern fn Wayland_DataSourceDestroy(source: [*c]SDL_WaylandDataSource) void;
pub extern fn Wayland_PrimarySelectionSourceDestroy(source: [*c]SDL_WaylandPrimarySelectionSource) void;
pub extern fn Wayland_DataOfferReceive(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8, length: [*c]usize, extended_timeout: bool) ?*anyopaque;
pub extern fn Wayland_DataOfferHasMIME(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8) bool;
pub extern fn Wayland_DataDeviceSetSelectionOffer(data_device: [*c]SDL_WaylandDataDevice, offer: [*c]SDL_WaylandDataOffer) void;
pub extern fn Wayland_DataOfferAddMIME(offer: [*c]SDL_WaylandDataOffer, mime_type: [*c]const u8) bool;
pub extern fn Wayland_PrimarySelectionOfferAddMIME(offer: [*c]SDL_WaylandPrimarySelectionOffer, mime_type: [*c]const u8) bool;
pub extern fn Wayland_DataOfferDestroy(offer: [*c]SDL_WaylandDataOffer) void;
pub extern fn Wayland_PrimarySelectionOfferDestroy(offer: [*c]SDL_WaylandPrimarySelectionOffer) void;
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
pub const struct_zwp_tablet_tool_v2_118 = opaque {
};
pub const WAYLAND_TABLET_TOOL_BUTTON_DOWN: c_int = 1;
pub const WAYLAND_TABLET_TOOL_BUTTON_UP: c_int = 2;
const enum_unnamed_120 = c_uint;
pub const WAYLAND_TABLET_TOOL_STATE_DOWN: c_int = 1;
pub const WAYLAND_TABLET_TOOL_STATE_UP: c_int = 2;
const enum_unnamed_121 = c_uint;
const struct_unnamed_119 = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    axes: [7]f32 = @import("std").mem.zeroes([7]f32),
    axes_set: Uint32 = 0,
    buttons: [3]enum_unnamed_120 = @import("std").mem.zeroes([3]enum_unnamed_120),
    tool_state: enum_unnamed_121 = @import("std").mem.zeroes(enum_unnamed_121),
    in_proximity: bool = false,
    have_motion: bool = false,
    have_proximity: bool = false,
};
pub const struct_SDL_WaylandPenTool = extern struct {
    instance_id: SDL_PenID = 0,
    info: SDL_PenInfo = @import("std").mem.zeroes(SDL_PenInfo),
    focus: [*c]SDL_WindowData = null,
    wltool: ?*struct_zwp_tablet_tool_v2_118 = null,
    proximity_serial: Uint32 = 0,
    frame: struct_unnamed_119 = @import("std").mem.zeroes(struct_unnamed_119),
    cursor_state: SDL_WaylandCursorState = @import("std").mem.zeroes(SDL_WaylandCursorState),
    link: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const SDL_WaylandPenTool = struct_SDL_WaylandPenTool;
pub const SDL_WaylandSeat = struct_SDL_WaylandSeat;
pub extern fn Wayland_SeatUpdatePointerCursor(seat: [*c]SDL_WaylandSeat) void;
pub extern fn Wayland_SeatSetDefaultCursor(seat: [*c]SDL_WaylandSeat) void;
pub extern fn Wayland_SeatResetCursor(seat: [*c]SDL_WaylandSeat) void;
pub extern fn Wayland_TabletToolUpdateCursor(tool: [*c]SDL_WaylandPenTool) void;
pub extern fn Wayland_SeatWarpMouse(seat: [*c]SDL_WaylandSeat, window: [*c]SDL_WindowData, x: f32, y: f32) void;
pub extern fn Wayland_CursorStateRelease(state: [*c]SDL_WaylandCursorState) void;
pub extern fn Wayland_GetTextMimeTypes(_this: [*c]SDL_VideoDevice, num_mime_types: [*c]usize) [*c]const [*c]const u8;
pub extern fn Wayland_SeatUpdateTextInput(seat: [*c]SDL_WaylandSeat) void;
pub extern const zwp_locked_pointer_v1_interface: struct_wl_interface;
pub extern const zwp_confined_pointer_v1_interface: struct_wl_interface;
pub const ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT: c_int = 2;
pub fn zwp_pointer_constraints_v1_lock_pointer(zwp_pointer_constraints_v1: ?*struct_zwp_pointer_constraints_v1_17, surface: ?*struct_wl_surface, pointer: ?*struct_wl_pointer, region: ?*struct_wl_region, lifetime: u32) callconv(.c) ?*struct_zwp_locked_pointer_v1_51 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1)), ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER, &zwp_locked_pointer_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1))), 0, @as(?*anyopaque, null), surface, pointer, region, lifetime);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_pointer_constraints_v1_confine_pointer(zwp_pointer_constraints_v1: ?*struct_zwp_pointer_constraints_v1_17, surface: ?*struct_wl_surface, pointer: ?*struct_wl_pointer, region: ?*struct_wl_region, lifetime: u32) callconv(.c) ?*struct_zwp_confined_pointer_v1_52 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1)), ZWP_POINTER_CONSTRAINTS_V1_CONFINE_POINTER, &zwp_confined_pointer_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1))), 0, @as(?*anyopaque, null), surface, pointer, region, lifetime);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_locked_pointer_v1_listener = extern struct {
    locked: ?*const fn (data: ?*anyopaque, zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void = null,
    unlocked: ?*const fn (data: ?*anyopaque, zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void = null,
};
pub fn zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51, listener: [*c]const struct_zwp_locked_pointer_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_locked_pointer_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_locked_pointer_v1_destroy(zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_locked_pointer_v1)), ZWP_LOCKED_POINTER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_locked_pointer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_zwp_confined_pointer_v1_listener = extern struct {
    confined: ?*const fn (data: ?*anyopaque, zwp_confined_pointer_v1: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void = null,
    unconfined: ?*const fn (data: ?*anyopaque, zwp_confined_pointer_v1: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void = null,
};
pub fn zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1: ?*struct_zwp_confined_pointer_v1_52, listener: [*c]const struct_zwp_confined_pointer_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_confined_pointer_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_confined_pointer_v1_destroy(zwp_confined_pointer_v1: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_confined_pointer_v1)), ZWP_CONFINED_POINTER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_confined_pointer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_relative_pointer_v1_interface: struct_wl_interface;
pub fn zwp_relative_pointer_manager_v1_get_relative_pointer(zwp_relative_pointer_manager_v1: ?*struct_zwp_relative_pointer_manager_v1_16, pointer: ?*struct_wl_pointer) callconv(.c) ?*struct_zwp_relative_pointer_v1_50 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_relative_pointer_manager_v1)), ZWP_RELATIVE_POINTER_MANAGER_V1_GET_RELATIVE_POINTER, &zwp_relative_pointer_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_relative_pointer_manager_v1))), 0, @as(?*anyopaque, null), pointer);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_relative_pointer_v1_listener = extern struct {
    relative_motion: ?*const fn (data: ?*anyopaque, zwp_relative_pointer_v1: ?*struct_zwp_relative_pointer_v1_50, utime_hi: u32, utime_lo: u32, dx: wl_fixed_t, dy: wl_fixed_t, dx_unaccel: wl_fixed_t, dy_unaccel: wl_fixed_t) callconv(.c) void = null,
};
pub fn zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1: ?*struct_zwp_relative_pointer_v1_50, listener: [*c]const struct_zwp_relative_pointer_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_relative_pointer_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_relative_pointer_v1_destroy(zwp_relative_pointer_v1: ?*struct_zwp_relative_pointer_v1_50) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_relative_pointer_v1)), ZWP_RELATIVE_POINTER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_relative_pointer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const XDG_TOPLEVEL_RESIZE_EDGE_TOP: c_int = 1;
pub const XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM: c_int = 2;
pub const XDG_TOPLEVEL_RESIZE_EDGE_LEFT: c_int = 4;
pub const XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT: c_int = 5;
pub const XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT: c_int = 6;
pub const XDG_TOPLEVEL_RESIZE_EDGE_RIGHT: c_int = 8;
pub const XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT: c_int = 9;
pub const XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT: c_int = 10;
pub fn xdg_toplevel_move(xdg_toplevel_1: ?*struct_xdg_toplevel, seat: ?*struct_wl_seat, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_MOVE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, seat, serial);
}
pub fn xdg_toplevel_resize(xdg_toplevel_1: ?*struct_xdg_toplevel, seat: ?*struct_wl_seat, serial: u32, edges: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(xdg_toplevel_1)), XDG_TOPLEVEL_RESIZE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(xdg_toplevel_1))), 0, seat, serial, edges);
}
pub extern const zwp_keyboard_shortcuts_inhibitor_v1_interface: struct_wl_interface;
pub fn zwp_keyboard_shortcuts_inhibit_manager_v1_inhibit_shortcuts(zwp_keyboard_shortcuts_inhibit_manager_v1: ?*struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23, surface: ?*struct_wl_surface, seat: ?*struct_wl_seat) callconv(.c) ?*struct_zwp_keyboard_shortcuts_inhibitor_v1_47 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibit_manager_v1)), ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INHIBIT_SHORTCUTS, &zwp_keyboard_shortcuts_inhibitor_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibit_manager_v1))), 0, @as(?*anyopaque, null), surface, seat);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_keyboard_shortcuts_inhibitor_v1_destroy(zwp_keyboard_shortcuts_inhibitor_v1: ?*struct_zwp_keyboard_shortcuts_inhibitor_v1_47) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibitor_v1)), ZWP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_keyboard_shortcuts_inhibitor_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_text_input_v3_interface: struct_wl_interface;
pub const struct_zwp_text_input_v3_listener = extern struct {
    enter: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, surface: ?*struct_wl_surface) callconv(.c) void = null,
    leave: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, surface: ?*struct_wl_surface) callconv(.c) void = null,
    preedit_string: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, text: [*c]const u8, cursor_begin: i32, cursor_end: i32) callconv(.c) void = null,
    commit_string: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, text: [*c]const u8) callconv(.c) void = null,
    delete_surrounding_text: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, before_length: u32, after_length: u32) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, serial: u32) callconv(.c) void = null,
};
pub fn zwp_text_input_v3_add_listener(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, listener: [*c]const struct_zwp_text_input_v3_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_text_input_v3)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_text_input_v3_set_user_data(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(zwp_text_input_v3)), user_data);
}
pub fn zwp_text_input_v3_destroy(zwp_text_input_v3: ?*struct_zwp_text_input_v3_62) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_v3)), ZWP_TEXT_INPUT_V3_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_v3))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn zwp_text_input_manager_v3_get_text_input(zwp_text_input_manager_v3: ?*struct_zwp_text_input_manager_v3_26, seat: ?*struct_wl_seat) callconv(.c) ?*struct_zwp_text_input_v3_62 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_text_input_manager_v3)), ZWP_TEXT_INPUT_MANAGER_V3_GET_TEXT_INPUT, &zwp_text_input_v3_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_text_input_manager_v3))), 0, @as(?*anyopaque, null), seat);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_tablet_pad_v2 = opaque {
};
pub const struct_zwp_tablet_v2 = opaque {
};
pub extern const zwp_tablet_seat_v2_interface: struct_wl_interface;
pub fn zwp_tablet_manager_v2_get_tablet_seat(zwp_tablet_manager_v2: ?*struct_zwp_tablet_manager_v2_37, seat: ?*struct_wl_seat) callconv(.c) ?*struct_zwp_tablet_seat_v2_64 {
    @setEvalBranchQuota(100000);
    var tablet_seat: ?*struct_wl_proxy = undefined;
    _ = &tablet_seat;
    tablet_seat = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_tablet_manager_v2)), ZWP_TABLET_MANAGER_V2_GET_TABLET_SEAT, &zwp_tablet_seat_v2_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_tablet_manager_v2))), 0, @as(?*anyopaque, null), seat);
    return @ptrCast(@alignCast(tablet_seat));
}
pub const struct_zwp_tablet_seat_v2_listener = extern struct {
    tablet_added: ?*const fn (data: ?*anyopaque, zwp_tablet_seat_v2: ?*struct_zwp_tablet_seat_v2_64, id: ?*struct_zwp_tablet_v2) callconv(.c) void = null,
    tool_added: ?*const fn (data: ?*anyopaque, zwp_tablet_seat_v2: ?*struct_zwp_tablet_seat_v2_64, id: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void = null,
    pad_added: ?*const fn (data: ?*anyopaque, zwp_tablet_seat_v2: ?*struct_zwp_tablet_seat_v2_64, id: ?*struct_zwp_tablet_pad_v2) callconv(.c) void = null,
};
pub fn zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2: ?*struct_zwp_tablet_seat_v2_64, listener: [*c]const struct_zwp_tablet_seat_v2_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_tablet_seat_v2)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_tablet_seat_v2_destroy(zwp_tablet_seat_v2: ?*struct_zwp_tablet_seat_v2_64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_tablet_seat_v2)), ZWP_TABLET_SEAT_V2_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_tablet_seat_v2))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const ZWP_TABLET_TOOL_V2_TYPE_PEN: c_int = 320;
pub const ZWP_TABLET_TOOL_V2_TYPE_ERASER: c_int = 321;
pub const ZWP_TABLET_TOOL_V2_TYPE_BRUSH: c_int = 322;
pub const ZWP_TABLET_TOOL_V2_TYPE_PENCIL: c_int = 323;
pub const ZWP_TABLET_TOOL_V2_TYPE_AIRBRUSH: c_int = 324;
pub const ZWP_TABLET_TOOL_V2_CAPABILITY_TILT: c_int = 1;
pub const ZWP_TABLET_TOOL_V2_CAPABILITY_PRESSURE: c_int = 2;
pub const ZWP_TABLET_TOOL_V2_CAPABILITY_DISTANCE: c_int = 3;
pub const ZWP_TABLET_TOOL_V2_CAPABILITY_ROTATION: c_int = 4;
pub const ZWP_TABLET_TOOL_V2_CAPABILITY_SLIDER: c_int = 5;
pub const struct_zwp_tablet_tool_v2_listener = extern struct {
    type: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, tool_type: u32) callconv(.c) void = null,
    hardware_serial: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, hardware_serial_hi: u32, hardware_serial_lo: u32) callconv(.c) void = null,
    hardware_id_wacom: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, hardware_id_hi: u32, hardware_id_lo: u32) callconv(.c) void = null,
    capability: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, capability: u32) callconv(.c) void = null,
    done: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void = null,
    removed: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void = null,
    proximity_in: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, serial: u32, tablet: ?*struct_zwp_tablet_v2, surface: ?*struct_wl_surface) callconv(.c) void = null,
    proximity_out: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void = null,
    down: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, serial: u32) callconv(.c) void = null,
    up: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void = null,
    motion: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, x: wl_fixed_t, y: wl_fixed_t) callconv(.c) void = null,
    pressure: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, pressure: u32) callconv(.c) void = null,
    distance: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, distance: u32) callconv(.c) void = null,
    tilt: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, tilt_x: wl_fixed_t, tilt_y: wl_fixed_t) callconv(.c) void = null,
    rotation: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, degrees: wl_fixed_t) callconv(.c) void = null,
    slider: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, position: i32) callconv(.c) void = null,
    wheel: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, degrees: wl_fixed_t, clicks: i32) callconv(.c) void = null,
    button: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, serial: u32, button: u32, state: u32) callconv(.c) void = null,
    frame: ?*const fn (data: ?*anyopaque, zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, time: u32) callconv(.c) void = null,
};
pub fn zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118, listener: [*c]const struct_zwp_tablet_tool_v2_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_tablet_tool_v2)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_tablet_tool_v2_destroy(zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_tablet_tool_v2)), ZWP_TABLET_TOOL_V2_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_tablet_tool_v2))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const ZWP_TABLET_PAD_V2_BUTTON_STATE_PRESSED: c_int = 1;
pub extern const zwp_primary_selection_device_v1_interface: struct_wl_interface;
pub fn zwp_primary_selection_device_manager_v1_get_device(zwp_primary_selection_device_manager_v1: ?*struct_zwp_primary_selection_device_manager_v1_21, seat: ?*struct_wl_seat) callconv(.c) ?*struct_zwp_primary_selection_device_v1_44 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1)), ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_GET_DEVICE, &zwp_primary_selection_device_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_device_manager_v1))), 0, @as(?*anyopaque, null), seat);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_primary_selection_device_v1_listener = extern struct {
    data_offer: ?*const fn (data: ?*anyopaque, zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44, offer: ?*struct_zwp_primary_selection_offer_v1_117) callconv(.c) void = null,
    selection: ?*const fn (data: ?*anyopaque, zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44, id: ?*struct_zwp_primary_selection_offer_v1_117) callconv(.c) void = null,
};
pub fn zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44, listener: [*c]const struct_zwp_primary_selection_device_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_primary_selection_device_v1_set_user_data(zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1)), user_data);
}
pub fn zwp_primary_selection_device_v1_destroy(zwp_primary_selection_device_v1: ?*struct_zwp_primary_selection_device_v1_44) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1)), ZWP_PRIMARY_SELECTION_DEVICE_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_primary_selection_device_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub const struct_zwp_primary_selection_offer_v1_listener = extern struct {
    offer: ?*const fn (data: ?*anyopaque, zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_117, mime_type: [*c]const u8) callconv(.c) void = null,
};
pub fn zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_117, listener: [*c]const struct_zwp_primary_selection_offer_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_primary_selection_offer_v1_set_user_data(zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_117, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1)), user_data);
}
pub fn zwp_primary_selection_offer_v1_get_user_data(zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_117) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_user_data.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1)));
}
pub extern const zwp_input_timestamps_v1_interface: struct_wl_interface;
pub fn zwp_input_timestamps_manager_v1_get_keyboard_timestamps(zwp_input_timestamps_manager_v1: ?*struct_zwp_input_timestamps_manager_v1_30, keyboard: ?*struct_wl_keyboard) callconv(.c) ?*struct_zwp_input_timestamps_v1_46 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1)), ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_KEYBOARD_TIMESTAMPS, &zwp_input_timestamps_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1))), 0, @as(?*anyopaque, null), keyboard);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_input_timestamps_manager_v1_get_pointer_timestamps(zwp_input_timestamps_manager_v1: ?*struct_zwp_input_timestamps_manager_v1_30, pointer: ?*struct_wl_pointer) callconv(.c) ?*struct_zwp_input_timestamps_v1_46 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1)), ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_POINTER_TIMESTAMPS, &zwp_input_timestamps_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1))), 0, @as(?*anyopaque, null), pointer);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_input_timestamps_manager_v1_get_touch_timestamps(zwp_input_timestamps_manager_v1: ?*struct_zwp_input_timestamps_manager_v1_30, touch: ?*struct_wl_touch) callconv(.c) ?*struct_zwp_input_timestamps_v1_46 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1)), ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_TOUCH_TIMESTAMPS, &zwp_input_timestamps_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_input_timestamps_manager_v1))), 0, @as(?*anyopaque, null), touch);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_input_timestamps_v1_listener = extern struct {
    timestamp: ?*const fn (data: ?*anyopaque, zwp_input_timestamps_v1: ?*struct_zwp_input_timestamps_v1_46, tv_sec_hi: u32, tv_sec_lo: u32, tv_nsec: u32) callconv(.c) void = null,
};
pub fn zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1: ?*struct_zwp_input_timestamps_v1_46, listener: [*c]const struct_zwp_input_timestamps_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_input_timestamps_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_input_timestamps_v1_destroy(zwp_input_timestamps_v1: ?*struct_zwp_input_timestamps_v1_46) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_input_timestamps_v1)), ZWP_INPUT_TIMESTAMPS_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_input_timestamps_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const zwp_pointer_gesture_pinch_v1_interface: struct_wl_interface;
pub fn zwp_pointer_gestures_v1_get_pinch_gesture(zwp_pointer_gestures_v1: ?*struct_zwp_pointer_gestures_v1_39, pointer: ?*struct_wl_pointer) callconv(.c) ?*struct_zwp_pointer_gesture_pinch_v1_53 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1)), ZWP_POINTER_GESTURES_V1_GET_PINCH_GESTURE, &zwp_pointer_gesture_pinch_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_gestures_v1))), 0, @as(?*anyopaque, null), pointer);
    return @ptrCast(@alignCast(id));
}
pub const struct_zwp_pointer_gesture_pinch_v1_listener = extern struct {
    begin: ?*const fn (data: ?*anyopaque, zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53, serial: u32, time: u32, surface: ?*struct_wl_surface, fingers: u32) callconv(.c) void = null,
    update: ?*const fn (data: ?*anyopaque, zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53, time: u32, dx: wl_fixed_t, dy: wl_fixed_t, scale: wl_fixed_t, rotation: wl_fixed_t) callconv(.c) void = null,
    end: ?*const fn (data: ?*anyopaque, zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53, serial: u32, time: u32, cancelled: i32) callconv(.c) void = null,
};
pub fn zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53, listener: [*c]const struct_zwp_pointer_gesture_pinch_v1_listener, data: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_add_listener.?(@ptrCast(@alignCast(zwp_pointer_gesture_pinch_v1)), @ptrCast(@alignCast(@constCast(listener))), data);
}
pub fn zwp_pointer_gesture_pinch_v1_set_user_data(zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53, user_data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    WAYLAND_wl_proxy_set_user_data.?(@ptrCast(@alignCast(zwp_pointer_gesture_pinch_v1)), user_data);
}
pub fn zwp_pointer_gesture_pinch_v1_destroy(zwp_pointer_gesture_pinch_v1: ?*struct_zwp_pointer_gesture_pinch_v1_53) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_gesture_pinch_v1)), ZWP_POINTER_GESTURE_PINCH_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_gesture_pinch_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_cursor_shape_device_v1_interface: struct_wl_interface;
pub fn wp_cursor_shape_manager_v1_get_pointer(wp_cursor_shape_manager_v1: ?*struct_wp_cursor_shape_manager_v1_19, pointer: ?*struct_wl_pointer) callconv(.c) ?*struct_wp_cursor_shape_device_v1_58 {
    @setEvalBranchQuota(100000);
    var cursor_shape_device: ?*struct_wl_proxy = undefined;
    _ = &cursor_shape_device;
    cursor_shape_device = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1)), WP_CURSOR_SHAPE_MANAGER_V1_GET_POINTER, &wp_cursor_shape_device_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1))), 0, @as(?*anyopaque, null), pointer);
    return @ptrCast(@alignCast(cursor_shape_device));
}
pub fn wp_cursor_shape_manager_v1_get_tablet_tool_v2(wp_cursor_shape_manager_v1: ?*struct_wp_cursor_shape_manager_v1_19, tablet_tool: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) ?*struct_wp_cursor_shape_device_v1_58 {
    @setEvalBranchQuota(100000);
    var cursor_shape_device: ?*struct_wl_proxy = undefined;
    _ = &cursor_shape_device;
    cursor_shape_device = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1)), WP_CURSOR_SHAPE_MANAGER_V1_GET_TABLET_TOOL_V2, &wp_cursor_shape_device_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_cursor_shape_manager_v1))), 0, @as(?*anyopaque, null), tablet_tool);
    return @ptrCast(@alignCast(cursor_shape_device));
}
pub extern fn SDL_GetScancodeFromKeySym(keysym: Uint32, keycode: Uint32) SDL_Scancode;
pub extern fn SDL_KeySymToUcs4(keysym: Uint32) c_uint;
pub extern fn __errno_location() [*c]c_int;
pub extern fn mmap(__addr: ?*anyopaque, __len: usize, __prot: c_int, __flags: c_int, __fd: c_int, __offset: __off_t) ?*anyopaque;
pub extern fn munmap(__addr: ?*anyopaque, __len: usize) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn getpid() __pid_t;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const Wayland_ReservedKey = extern struct {
    key: Uint32 = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
};
pub const SDL_WaylandTouchPoint = extern struct {
    id: SDL_TouchID = 0,
    fx: wl_fixed_t = 0,
    fy: wl_fixed_t = 0,
    surface: ?*struct_wl_surface = null,
    link: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub fn Wayland_SeatAddTouch(seat: [*c]SDL_WaylandSeat, id: SDL_TouchID, fx: wl_fixed_t, fy: wl_fixed_t, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tp: [*c]SDL_WaylandTouchPoint = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_WaylandTouchPoint))));
    _ = &tp;
    _ = memset(@ptrCast(@alignCast(tp)), 0, @sizeOf(@TypeOf(tp.*)));
    tp.*.id = id;
    tp.*.fx = fx;
    tp.*.fy = fy;
    tp.*.surface = surface;
    WAYLAND_wl_list_insert.?(&seat.*.touch.points, &tp.*.link);
}
pub fn Wayland_SeatCancelTouch(seat: [*c]SDL_WaylandSeat, tp: [*c]SDL_WaylandTouchPoint) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (tp.*.surface != null) {
        var window_data: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(tp.*.surface);
        _ = &window_data;
        if (window_data != null) {
            const x: f32 = @floatCast(wl_fixed_to_double(tp.*.fx) / @as(f64, @floatFromInt(window_data.*.current.logical_width)));
            _ = &x;
            const y: f32 = @floatCast(wl_fixed_to_double(tp.*.fy) / @as(f64, @floatFromInt(window_data.*.current.logical_height)));
            _ = &y;
            SDL_SendTouch(0, @intCast(@intFromPtr(seat.*.touch.wl_touch)), tp.*.id +% @as(SDL_TouchID, 1), window_data.*.sdlwindow, SDL_EVENT_FINGER_CANCELED, x, y, 0.0);
            window_data.*.active_touch_count -= 1;
            if ((((SDL_GetMouseFocus_REAL() == window_data.*.sdlwindow) and !(window_data.*.keyboard_focus_count != 0)) and !(window_data.*.pointer_focus_count != 0)) and !(window_data.*.active_touch_count != 0)) {
                SDL_SetMouseFocus(null);
            }
        }
    }
    WAYLAND_wl_list_remove.?(&tp.*.link);
    SDL_free_REAL(@ptrCast(@alignCast(tp)));
}
pub fn Wayland_SeatUpdateTouch(seat: [*c]SDL_WaylandSeat, id: SDL_TouchID, fx: wl_fixed_t, fy: wl_fixed_t, surface: [*c]?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tp: [*c]SDL_WaylandTouchPoint = undefined;
    _ = &tp;
    {
        tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.touch.points).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)));
        while ((&tp.*.link) != (&seat.*.touch.points)) : (tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)))) {
            if (tp.*.id == id) {
                tp.*.fx = fx;
                tp.*.fy = fy;
                if (surface != null) {
                    surface.* = tp.*.surface;
                }
                break;
            }
        }
    }
}
pub fn Wayland_SeatRemoveTouch(seat: [*c]SDL_WaylandSeat, id: SDL_TouchID, fx: [*c]wl_fixed_t, fy: [*c]wl_fixed_t, surface: [*c]?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var tp: [*c]SDL_WaylandTouchPoint = undefined;
    _ = &tp;
    {
        tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.touch.points).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)));
        while ((&tp.*.link) != (&seat.*.touch.points)) : (tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)))) {
            if (tp.*.id == id) {
                if (fx != null) {
                    fx.* = tp.*.fx;
                }
                if (fy != null) {
                    fy.* = tp.*.fy;
                }
                if (surface != null) {
                    surface.* = tp.*.surface;
                }
                WAYLAND_wl_list_remove.?(&tp.*.link);
                SDL_free_REAL(@ptrCast(@alignCast(tp)));
                break;
            }
        }
    }
}
pub fn Wayland_GetScaledMouseRect(window: [*c]SDL_Window, scaled_rect: [*c]SDL_Rect) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window_data: [*c]SDL_WindowData = window.*.internal;
    _ = &window_data;
    scaled_rect.*.x = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.mouse_rect.x)) / window_data.*.pointer_scale.x));
    scaled_rect.*.y = @intFromFloat(SDL_floor_REAL(@as(f64, @floatFromInt(window.*.mouse_rect.y)) / window_data.*.pointer_scale.y));
    scaled_rect.*.w = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.mouse_rect.w)) / window_data.*.pointer_scale.x));
    scaled_rect.*.h = @intFromFloat(SDL_ceil_REAL(@as(f64, @floatFromInt(window.*.mouse_rect.h)) / window_data.*.pointer_scale.y));
}
pub fn Wayland_AdjustEventTimestampBase(arg_nsTimestamp: Uint64) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    var nsTimestamp = arg_nsTimestamp;
    _ = &nsTimestamp;
    const static_local_timestamp_offset = struct {
        var timestamp_offset: Uint64 = 0;
    };
    _ = &static_local_timestamp_offset;
    const now: Uint64 = SDL_GetTicksNS_REAL();
    _ = &now;
    if (!(static_local_timestamp_offset.timestamp_offset != 0)) {
        static_local_timestamp_offset.timestamp_offset = now -% nsTimestamp;
    }
    nsTimestamp +%= static_local_timestamp_offset.timestamp_offset;
    if (nsTimestamp > now) {
        static_local_timestamp_offset.timestamp_offset -%= nsTimestamp -% now;
        nsTimestamp = now;
    }
    return nsTimestamp;
}
pub fn Wayland_EventTimestampMSToNS(arg_wl_timestamp_ms: Uint32) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    var wl_timestamp_ms = arg_wl_timestamp_ms;
    _ = &wl_timestamp_ms;
    const static_local_timestamp_offset = struct {
        var timestamp_offset: Uint64 = 0;
    };
    _ = &static_local_timestamp_offset;
    const static_local_last = struct {
        var last: Uint32 = 0;
    };
    _ = &static_local_last;
    var timestamp: Uint64 = (@as(Uint64, wl_timestamp_ms) *% @as(Uint64, SDL_NS_PER_MS)) +% static_local_timestamp_offset.timestamp_offset;
    _ = &timestamp;
    if (wl_timestamp_ms >= static_local_last.last) {
        if (((static_local_timestamp_offset.timestamp_offset != 0) and (@as(Uint64, @bitCast(@as(c_long, @intFromBool(static_local_last.last < (@as(c_uint, 4294967295) / @as(c_uint, 16)))))) != 0)) and (wl_timestamp_ms > ((@as(c_uint, 4294967295) / @as(c_uint, 16)) *% @as(c_uint, 15)))) {
            timestamp -%= @as(c_ulong, 4294967296) *% @as(Uint64, SDL_NS_PER_MS);
        } else {
            static_local_last.last = wl_timestamp_ms;
        }
    } else {
        if ((wl_timestamp_ms < (@as(c_uint, 4294967295) / @as(c_uint, 16))) and (static_local_last.last > ((@as(c_uint, 4294967295) / @as(c_uint, 16)) *% @as(c_uint, 15)))) {
            static_local_timestamp_offset.timestamp_offset +%= @as(c_ulong, 4294967296) *% @as(Uint64, SDL_NS_PER_MS);
            timestamp +%= @as(c_ulong, 4294967296) *% @as(Uint64, SDL_NS_PER_MS);
            static_local_last.last = wl_timestamp_ms;
        }
    }
    return timestamp;
}
pub fn Wayland_GetKeyboardTimestamp(seat: [*c]SDL_WaylandSeat, wl_timestamp_ms: Uint32) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    const adjustedTimestampNS: Uint64 = Wayland_EventTimestampMSToNS(wl_timestamp_ms);
    _ = &adjustedTimestampNS;
    return Wayland_AdjustEventTimestampBase(if (seat.*.keyboard.timestamps != null) seat.*.keyboard.highres_timestamp_ns else adjustedTimestampNS);
}
pub fn Wayland_GetPointerTimestamp(seat: [*c]SDL_WaylandSeat, wl_timestamp_ms: Uint32) callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    const adjustedTimestampNS: Uint64 = Wayland_EventTimestampMSToNS(wl_timestamp_ms);
    _ = &adjustedTimestampNS;
    return Wayland_AdjustEventTimestampBase(if (seat.*.pointer.timestamps != null) seat.*.pointer.highres_timestamp_ns else adjustedTimestampNS);
}
pub export fn Wayland_GetTouchTimestamp(seat: [*c]SDL_WaylandSeat, wl_timestamp_ms: Uint32) Uint64 {
    @setEvalBranchQuota(100000);
    const adjustedTimestampNS: Uint64 = Wayland_EventTimestampMSToNS(wl_timestamp_ms);
    _ = &adjustedTimestampNS;
    return Wayland_AdjustEventTimestampBase(if (seat.*.touch.timestamps != null) seat.*.touch.highres_timestamp_ns else adjustedTimestampNS);
}
pub fn input_timestamp_listener(data: ?*anyopaque, _: ?*struct_zwp_input_timestamps_v1_46, tv_sec_hi: u32, tv_sec_lo: u32, tv_nsec: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    @as([*c]Uint64, @ptrCast(@alignCast(data))).* = @truncate((@as(c_ulonglong, (@as(Uint64, tv_sec_hi) << @intCast(@as(Uint64, 32))) | @as(Uint64, tv_sec_lo)) *% @as(c_ulonglong, SDL_NS_PER_SECOND)) +% @as(c_ulonglong, tv_nsec));
}
pub const timestamp_listener: struct_zwp_input_timestamps_v1_listener = struct_zwp_input_timestamps_v1_listener{
    .timestamp = input_timestamp_listener,
};
pub fn Wayland_SeatRegisterInputTimestampListeners(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.display.*.input_timestamps_manager != null) {
        if ((seat.*.keyboard.wl_keyboard != null) and !(seat.*.keyboard.timestamps != null)) {
            seat.*.keyboard.timestamps = zwp_input_timestamps_manager_v1_get_keyboard_timestamps(seat.*.display.*.input_timestamps_manager, seat.*.keyboard.wl_keyboard);
            _ = zwp_input_timestamps_v1_add_listener(seat.*.keyboard.timestamps, &timestamp_listener, @ptrCast(@alignCast(&seat.*.keyboard.highres_timestamp_ns)));
        }
        if ((seat.*.pointer.wl_pointer != null) and !(seat.*.pointer.timestamps != null)) {
            seat.*.pointer.timestamps = zwp_input_timestamps_manager_v1_get_pointer_timestamps(seat.*.display.*.input_timestamps_manager, seat.*.pointer.wl_pointer);
            _ = zwp_input_timestamps_v1_add_listener(seat.*.pointer.timestamps, &timestamp_listener, @ptrCast(@alignCast(&seat.*.pointer.highres_timestamp_ns)));
        }
        if ((seat.*.touch.wl_touch != null) and !(seat.*.touch.timestamps != null)) {
            seat.*.touch.timestamps = zwp_input_timestamps_manager_v1_get_touch_timestamps(seat.*.display.*.input_timestamps_manager, seat.*.touch.wl_touch);
            _ = zwp_input_timestamps_v1_add_listener(seat.*.touch.timestamps, &timestamp_listener, @ptrCast(@alignCast(&seat.*.touch.highres_timestamp_ns)));
        }
    }
}
pub export fn Wayland_DisplayInitInputTimestampManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    if (display.*.input_timestamps_manager != null) {
        var seat: [*c]SDL_WaylandSeat = undefined;
        _ = &seat;
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                Wayland_SeatRegisterInputTimestampListeners(seat);
            }
        }
    }
}
pub fn handle_pinch_begin(data: ?*anyopaque, _: ?*struct_zwp_pointer_gesture_pinch_v1_53, _: u32, time: u32, surface: ?*struct_wl_surface, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(surface != null)) {
        return;
    }
    var wind: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(surface);
    _ = &wind;
    if (wind != null) {
        var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
        _ = &seat;
        seat.*.pointer.gesture_focus = wind;
        const timestamp: Uint64 = Wayland_GetPointerTimestamp(seat, time);
        _ = &timestamp;
        _ = SDL_SendPinch(SDL_EVENT_PINCH_BEGIN, timestamp, wind.*.sdlwindow, 0.0, -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
    }
}
pub fn handle_pinch_update(data: ?*anyopaque, _: ?*struct_zwp_pointer_gesture_pinch_v1_53, time: u32, _: wl_fixed_t, _: wl_fixed_t, scale: wl_fixed_t, _: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if (seat.*.pointer.gesture_focus != null) {
        const timestamp: Uint64 = Wayland_GetPointerTimestamp(seat, time);
        _ = &timestamp;
        const s: f32 = @floatCast(wl_fixed_to_double(scale));
        _ = &s;
        _ = SDL_SendPinch(SDL_EVENT_PINCH_UPDATE, timestamp, seat.*.pointer.gesture_focus.*.sdlwindow, s, -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
    }
}
pub fn handle_pinch_end(data: ?*anyopaque, _: ?*struct_zwp_pointer_gesture_pinch_v1_53, _: u32, time: u32, _: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if (seat.*.pointer.gesture_focus != null) {
        const timestamp: Uint64 = Wayland_GetPointerTimestamp(seat, time);
        _ = &timestamp;
        _ = SDL_SendPinch(SDL_EVENT_PINCH_END, timestamp, seat.*.pointer.gesture_focus.*.sdlwindow, 0.0, -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
        seat.*.pointer.gesture_focus = null;
    }
}
pub const gesture_pinch_listener: struct_zwp_pointer_gesture_pinch_v1_listener = struct_zwp_pointer_gesture_pinch_v1_listener{
    .begin = handle_pinch_begin,
    .update = handle_pinch_update,
    .end = handle_pinch_end,
};
pub fn Wayland_SeatCreatePointerGestures(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.display.*.zwp_pointer_gestures != null) {
        if ((seat.*.pointer.wl_pointer != null) and !(seat.*.pointer.gesture_pinch != null)) {
            seat.*.pointer.gesture_pinch = zwp_pointer_gestures_v1_get_pinch_gesture(seat.*.display.*.zwp_pointer_gestures, seat.*.pointer.wl_pointer);
            zwp_pointer_gesture_pinch_v1_set_user_data(seat.*.pointer.gesture_pinch, @ptrCast(@alignCast(seat)));
            _ = zwp_pointer_gesture_pinch_v1_add_listener(seat.*.pointer.gesture_pinch, &gesture_pinch_listener, @ptrCast(@alignCast(seat)));
        }
    }
}
pub export fn Wayland_DisplayInitPointerGestureManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatCreatePointerGestures(seat);
        }
    }
}
pub fn Wayland_SeatCreateCursorShape(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.display.*.cursor_shape_manager != null) {
        if ((seat.*.pointer.wl_pointer != null) and !(seat.*.pointer.cursor_state.cursor_shape != null)) {
            seat.*.pointer.cursor_state.cursor_shape = wp_cursor_shape_manager_v1_get_pointer(seat.*.display.*.cursor_shape_manager, seat.*.pointer.wl_pointer);
        }
        var tool: [*c]SDL_WaylandPenTool = undefined;
        _ = &tool;
        {
            tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
            while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : (tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)))) {
                if (!(tool.*.cursor_state.cursor_shape != null)) {
                    tool.*.cursor_state.cursor_shape = wp_cursor_shape_manager_v1_get_tablet_tool_v2(seat.*.display.*.cursor_shape_manager, tool.*.wltool);
                }
            }
        }
    }
}
pub export fn Wayland_DisplayInitCursorShapeManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatCreateCursorShape(seat);
        }
    }
}
pub fn Wayland_SeatSetKeymap(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const send_event: bool = !seat.*.display.*.initializing;
    _ = &send_event;
    if (((seat.*.keyboard.sdl_keymap != null) and (seat.*.keyboard.xkb.current_layout < seat.*.keyboard.xkb.num_layouts)) and (seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout] != SDL_GetCurrentKeymap(@"true" != 0))) {
        SDL_SetKeymap(seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout], send_event);
        SDL_SetModState_REAL(@bitCast(@as(c_short, @truncate(@as(c_int, seat.*.keyboard.pressed_modifiers) | @as(c_int, seat.*.keyboard.locked_modifiers)))));
    }
}
pub fn keyboard_repeat_handle(repeat_info: [*c]SDL_WaylandKeyboardRepeat, arg_elapsed: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var elapsed = arg_elapsed;
    _ = &elapsed;
    while (elapsed >= repeat_info.*.next_repeat_ns) {
        if (repeat_info.*.scancode != @as(Uint32, SDL_SCANCODE_UNKNOWN)) {
            const timestamp: Uint64 = repeat_info.*.base_time_ns +% repeat_info.*.next_repeat_ns;
            _ = &timestamp;
            _ = SDL_SendKeyboardKeyIgnoreModifiers(Wayland_AdjustEventTimestampBase(timestamp), repeat_info.*.keyboard_id, @bitCast(@as(c_uint, @truncate(repeat_info.*.key))), repeat_info.*.scancode, @"true" != 0);
        }
        if ((@as(c_int, repeat_info.*.text[@as(c_int, 0)]) != 0) and !((@as(c_uint, @bitCast(@as(c_int, @as(c_int, SDL_GetModState_REAL())))) & ((SDL_KMOD_LCTRL | SDL_KMOD_RCTRL) | (SDL_KMOD_LALT | SDL_KMOD_RALT))) != 0)) {
            SDL_SendKeyboardText(@ptrCast(@alignCast(&repeat_info.*.text)));
        }
        {
            const ref = &repeat_info.*.next_repeat_ns;
            ref.* = @truncate(@as(c_ulonglong, ref.*) +% (@as(c_ulonglong, SDL_NS_PER_SECOND) / @as(c_ulonglong, @as(Uint64, @bitCast(@as(c_long, repeat_info.*.repeat_rate))))));
        }
    }
}
pub fn keyboard_repeat_set(repeat_info: [*c]SDL_WaylandKeyboardRepeat, keyboard_id: Uint32, key: u32, wl_press_time_ms: Uint32, base_time_ns: Uint64, scancode: u32, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(repeat_info.*.repeat_rate != 0)) {
        return;
    }
    repeat_info.*.keyboard_id = keyboard_id;
    repeat_info.*.key = key;
    repeat_info.*.wl_press_time_ms = wl_press_time_ms;
    repeat_info.*.base_time_ns = base_time_ns;
    repeat_info.*.sdl_press_time_ns = SDL_GetTicksNS_REAL();
    repeat_info.*.next_repeat_ns = @as(Uint64, @bitCast(@as(c_long, repeat_info.*.repeat_delay_ms))) *% @as(Uint64, SDL_NS_PER_MS);
    repeat_info.*.scancode = scancode;
    if (text != null) {
        _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&repeat_info.*.text)), text, @sizeOf(@TypeOf(repeat_info.*.text)) / @sizeOf(@TypeOf(repeat_info.*.text[@as(c_int, 0)])));
    } else {
        repeat_info.*.text[@as(c_int, 0)] = '\x00';
    }
}
pub fn sync_done_handler(_: ?*anyopaque, callback: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    wl_callback_destroy(callback);
}
pub var sync_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = sync_done_handler,
};
pub export fn Wayland_SendWakeupEvent(_this: [*c]SDL_VideoDevice, _: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var d: [*c]SDL_VideoData = _this.*.internal;
    _ = &d;
    var cb: ?*struct_wl_callback = wl_display_sync(d.*.display);
    _ = &cb;
    _ = wl_callback_add_listener(cb, &sync_listener, null);
    _ = WAYLAND_wl_display_flush.?(d.*.display);
}
pub export fn Wayland_WaitEventTimeout(_this: [*c]SDL_VideoDevice, arg_timeoutNS: Sint64) c_int {
    @setEvalBranchQuota(100000);
    var timeoutNS = arg_timeoutNS;
    _ = &timeoutNS;
    var d: [*c]SDL_VideoData = _this.*.internal;
    _ = &d;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var start: Uint64 = SDL_GetTicksNS_REAL();
    _ = &start;
    const display_fd: c_int = WAYLAND_wl_display_get_fd.?(d.*.display);
    _ = &display_fd;
    var ret: c_int = undefined;
    _ = &ret;
    var poll_alarm_set: bool = @"false" != 0;
    _ = &poll_alarm_set;
    var keyboard_focus: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
    _ = &keyboard_focus;
    if ((!(d.*.text_input_manager != null) and (keyboard_focus != null)) and SDL_TextInputActive_REAL(keyboard_focus)) {
        if ((timeoutNS < @as(Sint64, 0)) or ((@as(Uint64, @bitCast(@as(c_long, @as(c_int, 200)))) *% @as(Uint64, SDL_NS_PER_MS)) <= @as(Uint64, @bitCast(@as(c_long, timeoutNS))))) {
            timeoutNS = @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 200)))) *% @as(Uint64, SDL_NS_PER_MS))));
            poll_alarm_set = @"true" != 0;
        }
    }
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&d.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.keyboard.repeat.key != 0) {
                const elapsed: Uint64 = start -% seat.*.keyboard.repeat.sdl_press_time_ns;
                _ = &elapsed;
                const next_repeat_wait_time: Uint64 = (seat.*.keyboard.repeat.next_repeat_ns -% elapsed) +% @as(Uint64, 1);
                _ = &next_repeat_wait_time;
                if ((timeoutNS < @as(Sint64, 0)) or (next_repeat_wait_time <= @as(Uint64, @bitCast(@as(c_long, timeoutNS))))) {
                    timeoutNS = @bitCast(@as(c_ulong, @truncate(next_repeat_wait_time)));
                    poll_alarm_set = @"true" != 0;
                }
            }
        }
    }
    if (WAYLAND_wl_display_prepare_read.?(d.*.display) == @as(c_int, 0)) {
        if (timeoutNS > @as(Sint64, 0)) {
            const now: Uint64 = SDL_GetTicksNS_REAL();
            _ = &now;
            const elapsed: Uint64 = now -% start;
            _ = &elapsed;
            start = now;
            timeoutNS = @bitCast(@as(c_ulong, @truncate(if (elapsed <= @as(Uint64, @bitCast(@as(c_long, timeoutNS)))) @as(Uint64, @bitCast(@as(c_long, timeoutNS))) -% elapsed else @as(Uint64, 0))));
        }
        ret = WAYLAND_wl_display_flush.?(d.*.display);
        if ((ret == -@as(c_int, 1)) and (__errno_location().* == EAGAIN)) {
            ret = SDL_IOReady(display_fd, SDL_IOR_WRITE | SDL_IOR_NO_RETRY, timeoutNS);
            if (ret <= @as(c_int, 0)) {
                timeoutNS = 0;
            }
        }
        if (ret < @as(c_int, 0)) {
            WAYLAND_wl_display_cancel_read.?(d.*.display);
            return if ((__errno_location().* == EINTR) or (__errno_location().* == EPIPE)) @as(c_int, 1) else ret;
        }
        if (timeoutNS > @as(Sint64, 0)) {
            const now: Uint64 = SDL_GetTicksNS_REAL();
            _ = &now;
            const elapsed: Uint64 = now -% start;
            _ = &elapsed;
            start = now;
            timeoutNS = @bitCast(@as(c_ulong, @truncate(if (elapsed <= @as(Uint64, @bitCast(@as(c_long, timeoutNS)))) @as(Uint64, @bitCast(@as(c_long, timeoutNS))) -% elapsed else @as(Uint64, 0))));
        }
        ret = SDL_IOReady(display_fd, SDL_IOR_READ | SDL_IOR_NO_RETRY, timeoutNS);
        if (ret <= @as(c_int, 0)) {
            WAYLAND_wl_display_cancel_read.?(d.*.display);
            if (ret == @as(c_int, 0)) {
                return if (poll_alarm_set) @as(c_int, 1) else @as(c_int, 0);
            } else {
                return if ((__errno_location().* == EINTR) or (__errno_location().* == EPIPE)) @as(c_int, 1) else ret;
            }
        }
        ret = WAYLAND_wl_display_read_events.?(d.*.display);
        if (ret == -@as(c_int, 1)) {
            return ret;
        }
    }
    return 1;
}
pub export fn Wayland_PumpEvents(_this: [*c]SDL_VideoDevice) void {
    @setEvalBranchQuota(100000);
    var d: [*c]SDL_VideoData = undefined;
    _ = &d;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var display_fd: c_int = undefined;
    _ = &display_fd;
    var ret: c_int = undefined;
    _ = &ret;
    var keyboard_focus: [*c]SDL_Window = undefined;
    _ = &keyboard_focus;
    var elapsed: Uint64 = undefined;
    _ = &elapsed;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                d = _this.*.internal;
                display_fd = WAYLAND_wl_display_get_fd.?(d.*.display);
                ret = 0;
                keyboard_focus = SDL_GetKeyboardFocus_REAL();
                if ((!(d.*.text_input_manager != null) and (keyboard_focus != null)) and SDL_TextInputActive_REAL(keyboard_focus)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                if (ret < @as(c_int, 0)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            2 => {
                SDL_IME_PumpEvents();
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
                if (d.*.shell.libdecor != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = WAYLAND_libdecor_dispatch.?(d.*.shell.libdecor, 0);
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
                ret = WAYLAND_wl_display_prepare_read.?(d.*.display);
                if (ret == -@as(c_int, 1)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                ret = WAYLAND_wl_display_dispatch_pending.?(d.*.display);
                if (ret < @as(c_int, 0)) {
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
                if (ret == @as(c_int, 0)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
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
                ret = WAYLAND_wl_display_prepare_read.?(d.*.display);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                ret = WAYLAND_wl_display_flush.?(d.*.display);
                if ((ret == -@as(c_int, 1)) and (__errno_location().* == EAGAIN)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                ret = WAYLAND_wl_display_dispatch_pending.?(d.*.display);
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (ret >= @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            17 => {
                ret = SDL_IOReady(display_fd, SDL_IOR_WRITE, @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, 4)))) *% @as(Uint64, SDL_NS_PER_MS)))));
                if (ret > @as(c_int, 0)) {
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
                if ((ret < @as(c_int, 0)) and (__errno_location().* == EPIPE)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            20 => {
                ret = WAYLAND_wl_display_flush.?(d.*.display);
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                WAYLAND_wl_display_cancel_read.?(d.*.display);
                {
                    sdl_pc = 1;
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
                ret = SDL_IOReady(display_fd, SDL_IOR_READ, 0);
                if (ret > @as(c_int, 0)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                ret = WAYLAND_wl_display_read_events.?(d.*.display);
                if (ret == @as(c_int, 0)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                WAYLAND_wl_display_cancel_read.?(d.*.display);
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            29 => {
                ret = WAYLAND_wl_display_dispatch_pending.?(d.*.display);
                {
                    sdl_pc = 31;
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
                    sdl_pc = 28;
                    continue;
                }
            },
            32 => {
                seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 35;
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            35 => {
                if ((&seat.*.link) != (&d.*.seat_list)) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            36 => {
                if (seat.*.keyboard.repeat.key != 0) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            37 => {
                seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            39 => {
                Wayland_SeatSetKeymap(seat);
                elapsed = SDL_GetTicksNS_REAL() -% seat.*.keyboard.repeat.sdl_press_time_ns;
                keyboard_repeat_handle(&seat.*.keyboard.repeat, elapsed);
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            42 => {
                _ = Wayland_HandleDisplayDisconnected(_this);
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub fn pointer_dispatch_absolute_motion(seat: [*c]SDL_WaylandSeat, warp: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window_data: [*c]SDL_WindowData = undefined;
    _ = &window_data;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var sx: f64 = undefined;
    _ = &sx;
    var sy: f64 = undefined;
    _ = &sy;
    var rc: SDL_HitTestResult = undefined;
    _ = &rc;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window_data = seat.*.pointer.focus;
                window = @ptrCast(@alignCast(if (window_data != null) @as(?*anyopaque, @ptrCast(@alignCast(window_data.*.sdlwindow))) else @as(?*anyopaque, null)));
                if (window_data != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                sx = wl_fixed_to_double(seat.*.pointer.pending_frame.absolute.sx);
                sy = wl_fixed_to_double(seat.*.pointer.pending_frame.absolute.sy);
                if (seat.*.pointer.focus_surface == window_data.*.mask.surface) {
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
                sx += @floatFromInt(window_data.*.mask.offset_x);
                sy += @floatFromInt(window_data.*.mask.offset_y);
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
                sx *= window_data.*.pointer_scale.x;
                sy *= window_data.*.pointer_scale.y;
                if (!warp) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_SendMouseMotion(seat.*.pointer.pending_frame.timestamp_ns, window_data.*.sdlwindow, seat.*.pointer.sdl_id, @"false" != 0, @floatCast(sx), @floatCast(sy));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                SDL_SendMouseWarp(seat.*.pointer.pending_frame.timestamp_ns, window_data.*.sdlwindow, seat.*.pointer.sdl_id, @floatCast(sx), @floatCast(sy));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                seat.*.pointer.last_motion.x = @intFromFloat(SDL_floor_REAL(sx));
                seat.*.pointer.last_motion.y = @intFromFloat(SDL_floor_REAL(sy));
                if (!SDL_RectEmpty(&window.*.mouse_rect) and !seat.*.pointer.is_confined) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                Wayland_SeatUpdatePointerGrab(seat);
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
                if (!((window.*.flags & @as(c_ulong, 16384)) != 0) and (window.*.hit_test != null)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                rc = window.*.hit_test.?(window, &seat.*.pointer.last_motion, window.*.hit_test_data);
                switch (rc) {
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOP) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPRIGHT) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_RIGHT) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMRIGHT) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOM) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMLEFT) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_LEFT) => {
                        sdl_pc = 69;
                        continue;
                    },
                    else => {
                        sdl_pc = 73;
                        continue;
                    },
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
                    sdl_pc = 3;
                    continue;
                }
            },
            16 => {
                if (rc != window_data.*.hit_test_result) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            17 => {
                if (((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_TOP)) != 0) and ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_LEFT)) != 0)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_TOP)) != 0) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            21 => {
                rc = SDL_HITTEST_RESIZE_LEFT;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_LEFT)) != 0) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                rc = SDL_HITTEST_RESIZE_TOP;
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
                    sdl_pc = 23;
                    continue;
                }
            },
            27 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_TOP)) != 0) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            31 => {
                if (((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_TOP)) != 0) and ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT)) != 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_TOP)) != 0) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            35 => {
                rc = SDL_HITTEST_RESIZE_RIGHT;
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT)) != 0) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                rc = SDL_HITTEST_RESIZE_TOP;
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT)) != 0) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            45 => {
                if (((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM)) != 0) and ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT)) != 0)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM)) != 0) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            49 => {
                rc = SDL_HITTEST_RESIZE_RIGHT;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_RIGHT)) != 0) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            52 => {
                rc = SDL_HITTEST_RESIZE_BOTTOM;
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            55 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM)) != 0) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                rc = SDL_HITTEST_NORMAL;
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
                    sdl_pc = 16;
                    continue;
                }
            },
            59 => {
                if (((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM)) != 0) and ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_LEFT)) != 0)) {
                    sdl_pc = 60;
                    continue;
                } else {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_BOTTOM)) != 0) {
                    sdl_pc = 63;
                    continue;
                } else {
                    sdl_pc = 64;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            63 => {
                rc = SDL_HITTEST_RESIZE_LEFT;
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            64 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_LEFT)) != 0) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 62;
                    continue;
                }
            },
            66 => {
                rc = SDL_HITTEST_RESIZE_BOTTOM;
                {
                    sdl_pc = 68;
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
                    sdl_pc = 65;
                    continue;
                }
            },
            69 => {
                if ((window_data.*.toplevel_constraints & @as(enum_unnamed_88, WAYLAND_TOPLEVEL_CONSTRAINED_LEFT)) != 0) {
                    sdl_pc = 70;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            70 => {
                rc = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 72;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            74 => {
                window_data.*.hit_test_result = rc;
                Wayland_SeatUpdatePointerCursor(seat);
                {
                    sdl_pc = 76;
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
                    sdl_pc = 15;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn pointer_handle_motion(data: ?*anyopaque, _: ?*struct_wl_pointer, time: u32, sx: wl_fixed_t, sy: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    const timestamp: Uint64 = Wayland_GetPointerTimestamp(seat, time);
    _ = &timestamp;
    seat.*.pointer.pending_frame.absolute.sx = sx;
    seat.*.pointer.pending_frame.absolute.sy = sy;
    if (wl_pointer_get_version(seat.*.pointer.wl_pointer) >= @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
        seat.*.pointer.pending_frame.have_absolute = @"true" != 0;
        if (!seat.*.pointer.pending_frame.have_relative or (seat.*.pointer.timestamps != null)) {
            seat.*.pointer.pending_frame.timestamp_ns = timestamp;
        }
    } else {
        seat.*.pointer.pending_frame.timestamp_ns = timestamp;
        pointer_dispatch_absolute_motion(seat, @"false" != 0);
    }
}
pub fn pointer_dispatch_enter(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(seat.*.pointer.pending_frame.enter_surface);
    _ = &window;
    if (!(window != null)) {
        Wayland_SeatResetCursor(seat);
        return;
    }
    if (window.*.surface != seat.*.pointer.pending_frame.enter_surface) {
        Wayland_SeatSetDefaultCursor(seat);
        return;
    }
    seat.*.pointer.focus = window;
    seat.*.pointer.focus_surface = seat.*.pointer.pending_frame.enter_surface;
    window.*.pointer_focus_count += 1;
    SDL_SetMouseFocus(window.*.sdlwindow);
    pointer_dispatch_absolute_motion(seat, @"false" != 0);
    Wayland_SeatUpdatePointerGrab(seat);
    Wayland_SeatUpdatePointerCursor(seat);
}
pub fn pointer_handle_enter(data: ?*anyopaque, _: ?*struct_wl_pointer, serial: u32, surface: ?*struct_wl_surface, sx_w: wl_fixed_t, sy_w: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(surface != null)) {
        return;
    }
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.pending_frame.enter_surface = surface;
    seat.*.pointer.enter_serial = serial;
    seat.*.pointer.pending_frame.absolute.sx = sx_w;
    seat.*.pointer.pending_frame.absolute.sy = sy_w;
    if (wl_pointer_get_version(seat.*.pointer.wl_pointer) < @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
        seat.*.pointer.pending_frame.timestamp_ns = 0;
        pointer_dispatch_enter(seat);
    }
}
pub fn pointer_dispatch_leave(seat: [*c]SDL_WaylandSeat, update_pointer: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(seat.*.pointer.pending_frame.leave_surface);
    _ = &window;
    if (window != null) {
        if (seat.*.pointer.focus != null) {
            if (seat.*.pointer.focus.*.surface == seat.*.pointer.pending_frame.leave_surface) {
                window.*.sdlwindow.*.flags &= ~@as(c_ulong, 16384);
                seat.*.pointer.focus = null;
                seat.*.pointer.focus_surface = null;
                {
                    var i: Uint8 = 1;
                    _ = &i;
                    while (seat.*.pointer.buttons_pressed != 0) : (i +%= 1) {
                        if ((seat.*.pointer.buttons_pressed & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, i) - @as(c_int, 1))))))) != 0) {
                            SDL_SendMouseButton(0, window.*.sdlwindow, seat.*.pointer.sdl_id, i, @"false" != 0);
                            seat.*.pointer.buttons_pressed &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, i) - @as(c_int, 1))))));
                        }
                    }
                }
                var mouse_focus: [*c]SDL_Window = SDL_GetMouseFocus_REAL();
                _ = &mouse_focus;
                const had_focus: bool = (mouse_focus != null) and (window.*.sdlwindow == mouse_focus);
                _ = &had_focus;
                if ((!((blk: {
                    const ref = &window.*.pointer_focus_count;
                    ref.* -= 1;
                    break :blk ref.*;
                }) != 0) and had_focus) and !(window.*.active_touch_count != 0)) {
                    SDL_SetMouseFocus(null);
                }
                if (update_pointer) {
                    Wayland_SeatUpdatePointerGrab(seat);
                    Wayland_SeatUpdatePointerCursor(seat);
                }
            }
        } else if (update_pointer) {
            Wayland_SeatResetCursor(seat);
        }
    }
}
pub fn pointer_handle_leave(data: ?*anyopaque, _: ?*struct_wl_pointer, _: u32, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(surface != null)) {
        return;
    }
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.pending_frame.leave_surface = surface;
    if (wl_pointer_get_version(seat.*.pointer.wl_pointer) < @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
        pointer_dispatch_leave(seat, @"true" != 0);
    }
}
pub fn Wayland_ProcessHitTest(seat: [*c]SDL_WaylandSeat, serial: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var window_data: [*c]SDL_WindowData = undefined;
    _ = &window_data;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    const static_local_directions = struct {
        const directions: [8]u32 = [8]u32{
            XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT,
            XDG_TOPLEVEL_RESIZE_EDGE_TOP,
            XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT,
            XDG_TOPLEVEL_RESIZE_EDGE_RIGHT,
            XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT,
            XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM,
            XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT,
            XDG_TOPLEVEL_RESIZE_EDGE_LEFT,
        };
    };
    _ = &static_local_directions;
    const static_local_directions_libdecor = struct {
        const directions_libdecor: [8]u32 = [8]u32{
            LIBDECOR_RESIZE_EDGE_TOP_LEFT,
            LIBDECOR_RESIZE_EDGE_TOP,
            LIBDECOR_RESIZE_EDGE_TOP_RIGHT,
            LIBDECOR_RESIZE_EDGE_RIGHT,
            LIBDECOR_RESIZE_EDGE_BOTTOM_RIGHT,
            LIBDECOR_RESIZE_EDGE_BOTTOM,
            LIBDECOR_RESIZE_EDGE_BOTTOM_LEFT,
            LIBDECOR_RESIZE_EDGE_LEFT,
        };
    };
    _ = &static_local_directions_libdecor;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (seat.*.pointer.locked_pointer != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                window_data = seat.*.pointer.focus;
                window = window_data.*.sdlwindow;
                if (window.*.hit_test != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                switch (window_data.*.hit_test_result) {
                    @as(SDL_HitTestResult, SDL_HITTEST_DRAGGABLE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOP) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPRIGHT) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_RIGHT) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMRIGHT) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOM) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMLEFT) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_LEFT) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 41;
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
                return @"false" != 0;
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                if (window_data.*.shell_surface_type == @as(enum_unnamed_85, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (window_data.*.shell_surface.libdecor.frame != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                if (window_data.*.shell_surface_type == @as(enum_unnamed_85, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            11 => {
                return @"true" != 0;
            },
            12 => {
                WAYLAND_libdecor_frame_move.?(window_data.*.shell_surface.libdecor.frame, seat.*.wl_seat, serial);
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                if (window_data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                    sdl_pc = 11;
                    continue;
                }
            },
            18 => {
                xdg_toplevel_move(window_data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, seat.*.wl_seat, serial);
                {
                    sdl_pc = 20;
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
                {
                    sdl_pc = 17;
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
                {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
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
                if (window_data.*.shell_surface_type == @as(enum_unnamed_85, WAYLAND_SHELL_SURFACE_TYPE_LIBDECOR)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                if (window_data.*.shell_surface.libdecor.frame != null) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                if (window_data.*.shell_surface_type == @as(enum_unnamed_85, WAYLAND_SHELL_SURFACE_TYPE_XDG_TOPLEVEL)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            31 => {
                return @"true" != 0;
            },
            32 => {
                WAYLAND_libdecor_frame_resize.?(window_data.*.shell_surface.libdecor.frame, seat.*.wl_seat, serial, static_local_directions_libdecor.directions_libdecor[window_data.*.hit_test_result -% @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT)]);
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
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                if (window_data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel != null) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
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
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                xdg_toplevel_resize(window_data.*.shell_surface.xdg.unnamed_0.toplevel.xdg_toplevel, seat.*.wl_seat, serial, static_local_directions.directions[window_data.*.hit_test_result -% @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT)]);
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
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            41 => {
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn pointer_dispatch_button(seat: [*c]SDL_WaylandSeat, sdl_button: Uint8, down: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = seat.*.pointer.focus;
    _ = &window;
    if (window != null) {
        var ignore_click: bool = @"false" != 0;
        _ = &ignore_click;
        if (down) {
            seat.*.pointer.buttons_pressed |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_button) - @as(c_int, 1)))));
            if ((@as(c_int, sdl_button) == SDL_BUTTON_LEFT) and Wayland_ProcessHitTest(seat, seat.*.last_implicit_grab_serial)) {
                return;
            }
        } else {
            seat.*.pointer.buttons_pressed &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_button) - @as(c_int, 1))))));
        }
        if (window.*.last_focus_event_time_ns != 0) {
            if (down and ((SDL_GetTicksNS_REAL() -% window.*.last_focus_event_time_ns) < (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 10)))) *% @as(Uint64, SDL_NS_PER_MS)))) {
                ignore_click = !SDL_GetHintBoolean_REAL("SDL_MOUSE_FOCUS_CLICKTHROUGH", @"false" != 0);
            }
            window.*.last_focus_event_time_ns = 0;
        }
        if (!(seat.*.pointer.relative_pointer != null)) {
            if (seat.*.pointer.buttons_pressed != @as(SDL_MouseButtonFlags, 0)) {
                window.*.sdlwindow.*.flags |= 16384;
            } else {
                window.*.sdlwindow.*.flags &= ~@as(c_ulong, 16384);
                if (seat.*.pointer.focus_surface != window.*.surface) {
                    seat.*.pointer.pending_frame.leave_surface = window.*.surface;
                }
            }
        }
        if (!ignore_click) {
            SDL_SendMouseButton(seat.*.pointer.pending_frame.timestamp_ns, window.*.sdlwindow, seat.*.pointer.sdl_id, sdl_button, down);
        }
    }
}
pub fn pointer_handle_button(data: ?*anyopaque, _: ?*struct_wl_pointer, serial: u32, time: u32, button: u32, state_w: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var sdl_button: Uint8 = undefined;
    _ = &sdl_button;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                seat = @ptrCast(@alignCast(data));
                switch (button) {
                    @as(u32, BTN_LEFT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, BTN_MIDDLE) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, BTN_RIGHT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                if (state_w != 0) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            2 => {
                sdl_button = SDL_BUTTON_LEFT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                sdl_button = SDL_BUTTON_MIDDLE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                sdl_button = SDL_BUTTON_RIGHT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                sdl_button = @truncate(@as(u32, SDL_BUTTON_X1) +% (button -% @as(u32, BTN_SIDE)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                Wayland_UpdateImplicitGrabSerial(seat, serial);
                {
                    sdl_pc = 8;
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
                seat.*.pointer.pending_frame.timestamp_ns = Wayland_GetPointerTimestamp(seat, time);
                if (wl_seat_get_version(seat.*.wl_seat) >= @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (state_w != 0) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                pointer_dispatch_button(seat, sdl_button, state_w != @as(u32, 0));
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                {}
            },
            12 => {
                seat.*.pointer.pending_frame.buttons_pressed |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_button) - @as(c_int, 1)))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            13 => {
                seat.*.pointer.pending_frame.buttons_released |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, sdl_button) - @as(c_int, 1)))));
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn pointer_handle_axis_common_v1(seat: [*c]SDL_WaylandSeat, nsTimestamp: Uint64, axis: u32, value: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = undefined;
    _ = &window;
    var a: enum_wl_pointer_axis = undefined;
    _ = &a;
    var x: f32 = undefined;
    _ = &x;
    var y: f32 = undefined;
    _ = &y;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                window = seat.*.pointer.focus;
                a = axis;
                if (seat.*.pointer.focus != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                switch (a) {
                    @as(enum_wl_pointer_axis, WL_POINTER_AXIS_VERTICAL_SCROLL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(enum_wl_pointer_axis, WL_POINTER_AXIS_HORIZONTAL_SCROLL) => {
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
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
                {}
            },
            4 => {
                x /= @floatFromInt(WAYLAND_WHEEL_AXIS_UNIT);
                y /= @floatFromInt(WAYLAND_WHEEL_AXIS_UNIT);
                SDL_SendMouseWheel(nsTimestamp, window.*.sdlwindow, seat.*.pointer.sdl_id, x, y, SDL_MOUSEWHEEL_NORMAL);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                x = @floatFromInt(@as(c_int, 0));
                y = @as(f32, @floatFromInt(@as(c_int, 0))) - @as(f32, @floatCast(wl_fixed_to_double(value)));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                x = @floatCast(wl_fixed_to_double(value));
                y = @floatFromInt(@as(c_int, 0));
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                return;
            },
            else => unreachable,
        }
    }
}
pub fn pointer_handle_axis_common(seat: [*c]SDL_WaylandSeat, arg_type: enum_SDL_WaylandAxisEvent, axis: u32, value: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var a: enum_wl_pointer_axis = undefined;
    _ = &a;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                a = axis;
                if (seat.*.pointer.focus != null) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                seat.*.pointer.pending_frame.have_axis = @"true" != 0;
                switch (a) {
                    @as(enum_wl_pointer_axis, WL_POINTER_AXIS_VERTICAL_SCROLL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(enum_wl_pointer_axis, WL_POINTER_AXIS_HORIZONTAL_SCROLL) => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
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
                {}
            },
            4 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            5 => {
                switch (@"type") {
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                if (seat.*.pointer.pending_frame.axis.y_axis_type != @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                seat.*.pointer.pending_frame.axis.y_axis_type = SDL_WAYLAND_AXIS_EVENT_VALUE120;
                seat.*.pointer.pending_frame.axis.y = 0.0;
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
                seat.*.pointer.pending_frame.axis.y += @as(f32, @floatFromInt(@as(c_int, 0))) - @as(f32, @floatCast(wl_fixed_to_double(value)));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            11 => {
                if (seat.*.pointer.pending_frame.axis.y_axis_type != @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                seat.*.pointer.pending_frame.axis.y_axis_type = SDL_WAYLAND_AXIS_EVENT_DISCRETE;
                seat.*.pointer.pending_frame.axis.y = @as(f32, @floatFromInt(@as(c_int, 0))) - @as(f32, @floatCast(wl_fixed_to_double(value)));
                {
                    sdl_pc = 14;
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            15 => {
                if (seat.*.pointer.pending_frame.axis.y_axis_type == @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                seat.*.pointer.pending_frame.axis.y = @as(f32, @floatFromInt(@as(c_int, 0))) - @as(f32, @floatCast(wl_fixed_to_double(value)));
                {
                    sdl_pc = 18;
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
                    sdl_pc = 6;
                    continue;
                }
            },
            19 => {
                switch (@"type") {
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 20;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            21 => {
                if (seat.*.pointer.pending_frame.axis.x_axis_type != @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                seat.*.pointer.pending_frame.axis.x_axis_type = SDL_WAYLAND_AXIS_EVENT_VALUE120;
                seat.*.pointer.pending_frame.axis.x = 0.0;
                {
                    sdl_pc = 24;
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
                seat.*.pointer.pending_frame.axis.x += @floatCast(wl_fixed_to_double(value));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            25 => {
                if (seat.*.pointer.pending_frame.axis.x_axis_type != @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                seat.*.pointer.pending_frame.axis.x_axis_type = SDL_WAYLAND_AXIS_EVENT_DISCRETE;
                seat.*.pointer.pending_frame.axis.x = @floatCast(wl_fixed_to_double(value));
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            29 => {
                if (seat.*.pointer.pending_frame.axis.x_axis_type == @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                seat.*.pointer.pending_frame.axis.x = @floatCast(wl_fixed_to_double(value));
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
                    sdl_pc = 20;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn pointer_handle_axis(data: ?*anyopaque, _: ?*struct_wl_pointer, time: u32, axis: u32, value: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    const nsTimestamp: Uint64 = Wayland_GetPointerTimestamp(seat, time);
    _ = &nsTimestamp;
    if (wl_seat_get_version(seat.*.wl_seat) >= @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
        seat.*.pointer.pending_frame.timestamp_ns = nsTimestamp;
        pointer_handle_axis_common(seat, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS, axis, value);
    } else {
        pointer_handle_axis_common_v1(seat, nsTimestamp, axis, value);
    }
}
pub fn pointer_handle_axis_relative_direction(data: ?*anyopaque, _: ?*struct_wl_pointer, _: u32, axis_relative_direction: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                seat = @ptrCast(@alignCast(data));
                switch (axis_relative_direction) {
                    @as(u32, WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED) => {
                        sdl_pc = 3;
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
                seat.*.pointer.pending_frame.axis.direction = SDL_MOUSEWHEEL_NORMAL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                seat.*.pointer.pending_frame.axis.direction = SDL_MOUSEWHEEL_FLIPPED;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn pointer_dispatch_relative_motion(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_WindowData = seat.*.pointer.focus;
    _ = &window;
    if (window != null) {
        var mouse: [*c]SDL_Mouse = SDL_GetMouse();
        _ = &mouse;
        var dx: f64 = undefined;
        _ = &dx;
        var dy: f64 = undefined;
        _ = &dy;
        if ((mouse.*.InputTransform != null) or !mouse.*.enable_relative_system_scale) {
            dx = wl_fixed_to_double(seat.*.pointer.pending_frame.relative.dx_unaccel);
            dy = wl_fixed_to_double(seat.*.pointer.pending_frame.relative.dy_unaccel);
        } else {
            dx = wl_fixed_to_double(seat.*.pointer.pending_frame.relative.dx) * window.*.pointer_scale.x;
            dy = wl_fixed_to_double(seat.*.pointer.pending_frame.relative.dy) * window.*.pointer_scale.y;
        }
        SDL_SendMouseMotion(seat.*.pointer.pending_frame.timestamp_ns, window.*.sdlwindow, seat.*.pointer.sdl_id, @"true" != 0, @floatCast(dx), @floatCast(dy));
    }
}
pub fn pointer_dispatch_axis(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var x: f32 = undefined;
    _ = &x;
    var y: f32 = undefined;
    _ = &y;
    var direction: SDL_MouseWheelDirection = undefined;
    _ = &direction;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                direction = seat.*.pointer.pending_frame.axis.direction;
                switch (seat.*.pointer.pending_frame.axis.x_axis_type) {
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                switch (seat.*.pointer.pending_frame.axis.y_axis_type) {
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_CONTINUOUS) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_DISCRETE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(enum_SDL_WaylandAxisEvent, SDL_WAYLAND_AXIS_EVENT_VALUE120) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            2 => {
                x = seat.*.pointer.pending_frame.axis.x / @as(f32, @floatFromInt(WAYLAND_WHEEL_AXIS_UNIT));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                x = seat.*.pointer.pending_frame.axis.x;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                x = seat.*.pointer.pending_frame.axis.x / @as(f32, 120.0);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                x = 0.0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                SDL_SendMouseWheel(seat.*.pointer.pending_frame.timestamp_ns, seat.*.pointer.focus.*.sdlwindow, seat.*.pointer.sdl_id, x, y, direction);
                {}
            },
            7 => {
                y = seat.*.pointer.pending_frame.axis.y / @as(f32, @floatFromInt(WAYLAND_WHEEL_AXIS_UNIT));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                y = seat.*.pointer.pending_frame.axis.y;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                y = seat.*.pointer.pending_frame.axis.y / @as(f32, 120.0);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                y = 0.0;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn pointer_handle_frame(data: ?*anyopaque, _: ?*struct_wl_pointer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if (seat.*.pointer.pending_frame.enter_surface != null) {
        if (seat.*.pointer.pending_frame.leave_surface != null) {
            var window_data: [*c]SDL_WindowData = seat.*.pointer.focus;
            _ = &window_data;
            var new_focus: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(seat.*.pointer.pending_frame.enter_surface);
            _ = &new_focus;
            if (((window_data != null) and ((window_data.*.sdlwindow.*.flags & @as(c_ulong, 16384)) != 0)) and (window_data == new_focus)) {
                seat.*.pointer.focus_surface = seat.*.pointer.pending_frame.enter_surface;
                seat.*.pointer.pending_frame.enter_surface = null;
                seat.*.pointer.pending_frame.leave_surface = null;
            } else {
                pointer_dispatch_leave(seat, @"false" != 0);
                seat.*.pointer.pending_frame.leave_surface = null;
            }
        }
        if (seat.*.pointer.pending_frame.enter_surface != null) {
            pointer_dispatch_enter(seat);
        }
    }
    if (seat.*.pointer.pending_frame.have_absolute) {
        pointer_dispatch_absolute_motion(seat, seat.*.pointer.pending_frame.have_warp);
    }
    if (seat.*.pointer.pending_frame.have_relative) {
        pointer_dispatch_relative_motion(seat);
    }
    {
        var i: Uint8 = 1;
        _ = &i;
        while ((seat.*.pointer.pending_frame.buttons_pressed != 0) or (seat.*.pointer.pending_frame.buttons_released != 0)) : (i +%= 1) {
            const mask: Uint32 = @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, i) - @as(c_int, 1)))));
            _ = &mask;
            if ((seat.*.pointer.pending_frame.buttons_pressed & mask) != 0) {
                pointer_dispatch_button(seat, i, @"true" != 0);
                seat.*.pointer.pending_frame.buttons_pressed &= ~mask;
            }
            if ((seat.*.pointer.pending_frame.buttons_released & mask) != 0) {
                pointer_dispatch_button(seat, i, @"false" != 0);
                seat.*.pointer.pending_frame.buttons_released &= ~mask;
            }
        }
    }
    if (seat.*.pointer.pending_frame.have_axis) {
        pointer_dispatch_axis(seat);
    }
    if (seat.*.pointer.pending_frame.leave_surface != null) {
        pointer_dispatch_leave(seat, @"true" != 0);
    }
    _ = memset(@ptrCast(@alignCast(&seat.*.pointer.pending_frame)), 0, @sizeOf(@TypeOf(seat.*.pointer.pending_frame)));
}
pub fn pointer_handle_axis_source(_: ?*anyopaque, _: ?*struct_wl_pointer, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn pointer_handle_axis_stop(_: ?*anyopaque, _: ?*struct_wl_pointer, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn pointer_handle_axis_discrete(data: ?*anyopaque, _: ?*struct_wl_pointer, axis: u32, discrete: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    pointer_handle_axis_common(seat, SDL_WAYLAND_AXIS_EVENT_DISCRETE, axis, wl_fixed_from_int(discrete));
}
pub fn pointer_handle_axis_value120(data: ?*anyopaque, _: ?*struct_wl_pointer, axis: u32, value120: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    pointer_handle_axis_common(seat, SDL_WAYLAND_AXIS_EVENT_VALUE120, axis, wl_fixed_from_int(value120));
}
pub fn pointer_handle_warp(data: ?*anyopaque, _: ?*struct_wl_pointer, surface_x: wl_fixed_t, surface_y: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.pending_frame.have_absolute = @"true" != 0;
    seat.*.pointer.pending_frame.have_warp = @"true" != 0;
    seat.*.pointer.pending_frame.absolute.sx = surface_x;
    seat.*.pointer.pending_frame.absolute.sy = surface_y;
}
pub const pointer_listener: struct_wl_pointer_listener = struct_wl_pointer_listener{
    .enter = pointer_handle_enter,
    .leave = pointer_handle_leave,
    .motion = pointer_handle_motion,
    .button = pointer_handle_button,
    .axis = pointer_handle_axis,
    .frame = pointer_handle_frame,
    .axis_source = pointer_handle_axis_source,
    .axis_stop = pointer_handle_axis_stop,
    .axis_discrete = pointer_handle_axis_discrete,
    .axis_value120 = pointer_handle_axis_value120,
    .axis_relative_direction = pointer_handle_axis_relative_direction,
    .warp = pointer_handle_warp,
};
pub fn relative_pointer_handle_relative_motion(data: ?*anyopaque, _: ?*struct_zwp_relative_pointer_v1_50, time_hi: u32, time_lo: u32, dx: wl_fixed_t, dy: wl_fixed_t, dx_unaccel: wl_fixed_t, dy_unaccel: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.pending_frame.relative.dx = dx;
    seat.*.pointer.pending_frame.relative.dy = dy;
    seat.*.pointer.pending_frame.relative.dx_unaccel = dx_unaccel;
    seat.*.pointer.pending_frame.relative.dy_unaccel = dy_unaccel;
    seat.*.pointer.pending_frame.timestamp_ns = Wayland_AdjustEventTimestampBase(((@as(Uint64, time_hi) << @intCast(@as(Uint64, 32))) | @as(Uint64, time_lo)) *% @as(Uint64, SDL_NS_PER_US));
    if (wl_pointer_get_version(seat.*.pointer.wl_pointer) >= @as(u32, WL_POINTER_FRAME_SINCE_VERSION)) {
        seat.*.pointer.pending_frame.have_relative = @"true" != 0;
    } else {
        pointer_dispatch_relative_motion(seat);
    }
}
pub const relative_pointer_listener: struct_zwp_relative_pointer_v1_listener = struct_zwp_relative_pointer_v1_listener{
    .relative_motion = relative_pointer_handle_relative_motion,
};
pub fn locked_pointer_locked(data: ?*anyopaque, _: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.is_confined = @"true" != 0;
}
pub fn locked_pointer_unlocked(data: ?*anyopaque, _: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.is_confined = @"false" != 0;
}
pub const locked_pointer_listener: struct_zwp_locked_pointer_v1_listener = struct_zwp_locked_pointer_v1_listener{
    .locked = locked_pointer_locked,
    .unlocked = locked_pointer_unlocked,
};
pub fn confined_pointer_confined(data: ?*anyopaque, _: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.is_confined = @"true" != 0;
}
pub fn confined_pointer_unconfined(data: ?*anyopaque, _: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.pointer.is_confined = @"false" != 0;
}
pub const confined_pointer_listener: struct_zwp_confined_pointer_v1_listener = struct_zwp_confined_pointer_v1_listener{
    .confined = confined_pointer_confined,
    .unconfined = confined_pointer_unconfined,
};
pub fn touch_handler_down(data: ?*anyopaque, touch: ?*struct_wl_touch, serial: u32, timestamp: u32, surface: ?*struct_wl_surface, id: c_int, fx: wl_fixed_t, fy: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var window_data: [*c]SDL_WindowData = undefined;
    _ = &window_data;
    if (!(surface != null)) {
        return;
    }
    Wayland_SeatAddTouch(seat, @bitCast(@as(c_long, id)), fx, fy, surface);
    Wayland_UpdateImplicitGrabSerial(seat, serial);
    window_data = Wayland_GetWindowDataForOwnedSurface(surface);
    if ((window_data != null) and (window_data.*.surface == surface)) {
        var x: f32 = undefined;
        _ = &x;
        var y: f32 = undefined;
        _ = &y;
        if (window_data.*.current.logical_width <= @as(c_int, 1)) {
            x = 0.5;
        } else {
            x = @as(f32, @floatCast(wl_fixed_to_double(fx))) / @as(f32, @floatFromInt(window_data.*.current.logical_width - @as(c_int, 1)));
        }
        if (window_data.*.current.logical_height <= @as(c_int, 1)) {
            y = 0.5;
        } else {
            y = @as(f32, @floatCast(wl_fixed_to_double(fy))) / @as(f32, @floatFromInt(window_data.*.current.logical_height - @as(c_int, 1)));
        }
        window_data.*.active_touch_count += 1;
        SDL_SetMouseFocus(window_data.*.sdlwindow);
        SDL_SendTouch(Wayland_GetTouchTimestamp(seat, timestamp), @intCast(@intFromPtr(touch)), @bitCast(@as(c_long, id + @as(c_int, 1))), window_data.*.sdlwindow, SDL_EVENT_FINGER_DOWN, x, y, 1.0);
    }
}
pub fn touch_handler_up(data: ?*anyopaque, touch: ?*struct_wl_touch, _: u32, timestamp: u32, id: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var fx: wl_fixed_t = 0;
    _ = &fx;
    var fy: wl_fixed_t = 0;
    _ = &fy;
    var surface: ?*struct_wl_surface = null;
    _ = &surface;
    Wayland_SeatRemoveTouch(seat, @bitCast(@as(c_long, id)), &fx, &fy, &surface);
    if (surface != null) {
        var window_data: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(surface);
        _ = &window_data;
        if ((window_data != null) and (window_data.*.surface == surface)) {
            const x: f32 = @as(f32, @floatCast(wl_fixed_to_double(fx))) / @as(f32, @floatFromInt(window_data.*.current.logical_width));
            _ = &x;
            const y: f32 = @as(f32, @floatCast(wl_fixed_to_double(fy))) / @as(f32, @floatFromInt(window_data.*.current.logical_height));
            _ = &y;
            SDL_SendTouch(Wayland_GetTouchTimestamp(seat, timestamp), @intCast(@intFromPtr(touch)), @bitCast(@as(c_long, id + @as(c_int, 1))), window_data.*.sdlwindow, SDL_EVENT_FINGER_UP, x, y, 0.0);
            window_data.*.active_touch_count -= 1;
            if ((((SDL_GetMouseFocus_REAL() == window_data.*.sdlwindow) and !(window_data.*.keyboard_focus_count != 0)) and !(window_data.*.pointer_focus_count != 0)) and !(window_data.*.active_touch_count != 0)) {
                SDL_SetMouseFocus(null);
            }
        }
    }
}
pub fn touch_handler_motion(data: ?*anyopaque, touch: ?*struct_wl_touch, timestamp: u32, id: c_int, fx: wl_fixed_t, fy: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var surface: ?*struct_wl_surface = null;
    _ = &surface;
    Wayland_SeatUpdateTouch(seat, @bitCast(@as(c_long, id)), fx, fy, &surface);
    if (surface != null) {
        var window_data: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(surface);
        _ = &window_data;
        if ((window_data != null) and (window_data.*.surface == surface)) {
            const x: f32 = @as(f32, @floatCast(wl_fixed_to_double(fx))) / @as(f32, @floatFromInt(window_data.*.current.logical_width));
            _ = &x;
            const y: f32 = @as(f32, @floatCast(wl_fixed_to_double(fy))) / @as(f32, @floatFromInt(window_data.*.current.logical_height));
            _ = &y;
            SDL_SendTouchMotion(Wayland_GetTouchTimestamp(seat, timestamp), @intCast(@intFromPtr(touch)), @bitCast(@as(c_long, id + @as(c_int, 1))), window_data.*.sdlwindow, x, y, 1.0);
        }
    }
}
pub fn touch_handler_frame(_: ?*anyopaque, _: ?*struct_wl_touch) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn touch_handler_cancel(data: ?*anyopaque, _: ?*struct_wl_touch) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var tp: [*c]SDL_WaylandTouchPoint = undefined;
    _ = &tp;
    var temp: [*c]SDL_WaylandTouchPoint = undefined;
    _ = &temp;
    {
        tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.touch.points).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)));
        temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
        while ((&tp.*.link) != (&seat.*.touch.points)) : ({
            tp = temp;
            temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
        }) {
            Wayland_SeatCancelTouch(seat, tp);
        }
    }
}
pub fn touch_handler_shape(_: ?*anyopaque, _: ?*struct_wl_touch, _: i32, _: wl_fixed_t, _: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn touch_handler_orientation(_: ?*anyopaque, _: ?*struct_wl_touch, _: i32, _: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const touch_listener: struct_wl_touch_listener = struct_wl_touch_listener{
    .down = touch_handler_down,
    .up = touch_handler_up,
    .motion = touch_handler_motion,
    .frame = touch_handler_frame,
    .cancel = touch_handler_cancel,
    .shape = touch_handler_shape,
    .orientation = touch_handler_orientation,
};
pub fn Wayland_KeymapIterator(_: ?*struct_xkb_keymap, key: xkb_keycode_t, data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var syms: [*c]const xkb_keysym_t = undefined;
    _ = &syms;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var xkb_valid_mod_mask: xkb_mod_mask_t = undefined;
    _ = &xkb_valid_mod_mask;
    var layout: xkb_layout_index_t = undefined;
    _ = &layout;
    var num_levels: xkb_level_index_t = undefined;
    _ = &num_levels;
    var level: xkb_level_index_t = undefined;
    _ = &level;
    var xkb_mod_masks: [16]xkb_mod_mask_t = undefined;
    _ = &xkb_mod_masks;
    var num_masks: usize = undefined;
    _ = &num_masks;
    var mask: usize = undefined;
    _ = &mask;
    var sdl_mod: SDL_Keymod = undefined;
    _ = &sdl_mod;
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var res: [*c]Wayland_ReservedKey = undefined;
    _ = &res;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                seat = @ptrCast(@alignCast(data));
                scancode = SDL_SCANCODE_UNKNOWN;
                xkb_valid_mod_mask = (((seat.*.keyboard.xkb.shift_mask | seat.*.keyboard.xkb.alt_mask) | seat.*.keyboard.xkb.level3_mask) | seat.*.keyboard.xkb.level5_mask) | seat.*.keyboard.xkb.caps_mask;
                if (!seat.*.keyboard.is_virtual) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                scancode = SDL_GetScancodeFromTable(SDL_SCANCODE_TABLE_LINUX, @bitCast(@as(c_uint, @truncate(key -% @as(xkb_keycode_t, 8)))));
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
                layout = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (layout < seat.*.keyboard.xkb.num_layouts) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                num_levels = WAYLAND_xkb_keymap_num_levels_for_key.?(seat.*.keyboard.xkb.keymap, key, layout);
                level = 0;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                layout +%= 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {}
            },
            8 => {
                if (level < num_levels) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                if (WAYLAND_xkb_keymap_key_get_syms_by_level.?(seat.*.keyboard.xkb.keymap, key, layout, level, &syms) > @as(c_int, 0)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                level +%= 1;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            12 => {
                if ((scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and seat.*.keyboard.is_virtual) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                scancode = SDL_GetScancodeFromKeySym(syms[@as(c_int, 0)], key);
                if (scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
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
                num_masks = WAYLAND_xkb_keymap_key_get_mods_for_level.?(seat.*.keyboard.xkb.keymap, key, layout, level, @ptrCast(@alignCast(&xkb_mod_masks)), @sizeOf(@TypeOf(xkb_mod_masks)) / @sizeOf(@TypeOf(xkb_mod_masks[@as(c_int, 0)])));
                mask = 0;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 10;
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
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                if (mask < num_masks) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                if ((xkb_mod_masks[mask] | xkb_valid_mod_mask) != xkb_valid_mod_mask) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            23 => {
                mask +%= 1;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                sdl_mod = @truncate(((((if ((xkb_mod_masks[mask] & seat.*.keyboard.xkb.shift_mask) != 0) SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT else @as(c_uint, 0)) | (if ((xkb_mod_masks[mask] & seat.*.keyboard.xkb.alt_mask) != 0) SDL_KMOD_LALT | SDL_KMOD_RALT else @as(c_uint, 0))) | (if ((xkb_mod_masks[mask] & seat.*.keyboard.xkb.level3_mask) != 0) SDL_KMOD_MODE else @as(c_uint, 0))) | (if ((xkb_mod_masks[mask] & seat.*.keyboard.xkb.level5_mask) != 0) SDL_KMOD_LEVEL5 else @as(c_uint, 0))) | (if ((xkb_mod_masks[mask] & seat.*.keyboard.xkb.caps_mask) != 0) SDL_KMOD_CAPS else @as(c_uint, 0)));
                keycode = SDL_GetKeyCodeFromKeySym(syms[@as(c_int, 0)], key, sdl_mod);
                if ((keycode != SDLK_UNKNOWN) and (scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN))) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            28 => {
                scancode = SDL_GetKeymapNextReservedScancode(seat.*.keyboard.sdl_keymap[@as(c_int, 0)]);
                if (level != 0) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if (!(keycode != 0)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            31 => {
                SDL_SetKeymapEntry(seat.*.keyboard.sdl_keymap[layout], scancode, 0, SDLK_UNKNOWN);
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
                res = @ptrCast(@alignCast(WAYLAND_wl_array_add.?(&seat.*.keyboard.reserved_scancodes, @sizeOf(Wayland_ReservedKey))));
                if (res != null) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                res.*.scancode = scancode;
                res.*.key = key -% @as(xkb_keycode_t, 8);
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            37 => {
                switch (scancode) {
                    @as(SDL_Scancode, SDL_SCANCODE_RETURN) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_ESCAPE) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_BACKSPACE) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(SDL_Scancode, SDL_SCANCODE_DELETE) => {
                        sdl_pc = 44;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            38 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                SDL_SetKeymapEntry(seat.*.keyboard.sdl_keymap[layout], scancode, sdl_mod, keycode);
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            41 => {
                keycode = SDLK_RETURN;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            42 => {
                keycode = SDLK_ESCAPE;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            43 => {
                keycode = SDLK_BACKSPACE;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            44 => {
                keycode = SDLK_DELETE;
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            45 => {
                keycode = scancode | (@as(c_uint, 1) << @intCast(@as(c_uint, 30)));
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn keyboard_handle_keymap(data: ?*anyopaque, _: ?*struct_wl_keyboard, format: u32, fd: c_int, size: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var map_str: [*c]u8 = undefined;
    _ = &map_str;
    if (!(data != null)) {
        _ = close(fd);
        return;
    }
    if (format != @as(u32, WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1)) {
        _ = close(fd);
        return;
    }
    map_str = @ptrCast(@alignCast(mmap(null, size, PROT_READ, MAP_PRIVATE, fd, 0)));
    if (@as(?*anyopaque, @ptrCast(@alignCast(map_str))) == @as(?*anyopaque, @ptrFromInt(@as(usize, @intCast(__helpers.cast(usize, @as(isize, -@as(c_int, 1)))))))) {
        _ = close(fd);
        return;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(seat.*.keyboard.xkb.keymap))) != @as(?*anyopaque, null)) {
        WAYLAND_xkb_keymap_unref.?(seat.*.keyboard.xkb.keymap);
        seat.*.keyboard.xkb.keymap = null;
    }
    seat.*.keyboard.xkb.keymap = WAYLAND_xkb_keymap_new_from_string.?(seat.*.display.*.xkb_context, map_str, XKB_KEYMAP_FORMAT_TEXT_V1, 0);
    _ = munmap(@ptrCast(@alignCast(map_str)), size);
    _ = close(fd);
    if (!(seat.*.keyboard.xkb.keymap != null)) {
        _ = SDL_SetError_REAL("failed to compile keymap");
        return;
    }
    {
        var i: xkb_layout_index_t = 0;
        _ = &i;
        while (i < seat.*.keyboard.xkb.num_layouts) : (i +%= 1) {
            SDL_DestroyKeymap(seat.*.keyboard.sdl_keymap[i]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(seat.*.keyboard.sdl_keymap)));
    seat.*.keyboard.sdl_keymap = null;
    WAYLAND_wl_array_release.?(&seat.*.keyboard.reserved_scancodes);
    WAYLAND_wl_array_init.?(&seat.*.keyboard.reserved_scancodes);
    seat.*.keyboard.xkb.num_layouts = 0;
    seat.*.keyboard.xkb.shift_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "Shift");
    seat.*.keyboard.xkb.ctrl_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "Control");
    seat.*.keyboard.xkb.alt_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "Alt");
    seat.*.keyboard.xkb.gui_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "Super");
    seat.*.keyboard.xkb.level3_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "LevelThree");
    seat.*.keyboard.xkb.level5_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "LevelFive");
    seat.*.keyboard.xkb.num_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "NumLock");
    seat.*.keyboard.xkb.caps_mask = WAYLAND_xkb_keymap_mod_get_mask.?(seat.*.keyboard.xkb.keymap, "Lock");
    if (@as(?*anyopaque, @ptrCast(@alignCast(seat.*.keyboard.xkb.state))) != @as(?*anyopaque, null)) {
        WAYLAND_xkb_state_unref.?(seat.*.keyboard.xkb.state);
        seat.*.keyboard.xkb.state = null;
    }
    seat.*.keyboard.xkb.state = WAYLAND_xkb_state_new.?(seat.*.keyboard.xkb.keymap);
    if (!(seat.*.keyboard.xkb.state != null)) {
        _ = SDL_SetError_REAL("failed to create XKB state");
        WAYLAND_xkb_keymap_unref.?(seat.*.keyboard.xkb.keymap);
        seat.*.keyboard.xkb.keymap = null;
        return;
    }
    seat.*.keyboard.is_virtual = @as(?*anyopaque, @ptrCast(@alignCast(@constCast(WAYLAND_xkb_keymap_layout_get_name.?(seat.*.keyboard.xkb.keymap, 0))))) == @as(?*anyopaque, null);
    seat.*.keyboard.xkb.num_layouts = WAYLAND_xkb_keymap_num_layouts.?(seat.*.keyboard.xkb.keymap);
    if (seat.*.keyboard.xkb.num_layouts != 0) {
        seat.*.keyboard.sdl_keymap = @ptrCast(@alignCast(SDL_calloc_REAL(seat.*.keyboard.xkb.num_layouts, @sizeOf(?*SDL_Keymap))));
        if (!(seat.*.keyboard.sdl_keymap != null)) {
            return;
        }
        WAYLAND_wl_array_init.?(&seat.*.keyboard.reserved_scancodes);
        {
            var i: xkb_layout_index_t = 0;
            _ = &i;
            while (i < seat.*.keyboard.xkb.num_layouts) : (i +%= 1) {
                seat.*.keyboard.sdl_keymap[i] = SDL_CreateKeymap(@"false" != 0);
                if (!(seat.*.keyboard.sdl_keymap[i] != null)) {
                    {
                        var j: xkb_layout_index_t = 0;
                        _ = &j;
                        while (j < i) : (j +%= 1) {
                            SDL_DestroyKeymap(seat.*.keyboard.sdl_keymap[j]);
                        }
                    }
                    SDL_free_REAL(@ptrCast(@alignCast(seat.*.keyboard.sdl_keymap)));
                    seat.*.keyboard.sdl_keymap = null;
                    return;
                }
            }
        }
        WAYLAND_xkb_keymap_key_for_each.?(seat.*.keyboard.xkb.keymap, Wayland_KeymapIterator, @ptrCast(@alignCast(seat)));
        _ = WAYLAND_xkb_state_update_mask.?(seat.*.keyboard.xkb.state, seat.*.keyboard.xkb.wl_pressed_modifiers, seat.*.keyboard.xkb.wl_latched_modifiers, seat.*.keyboard.xkb.wl_locked_modifiers, 0, 0, if (seat.*.keyboard.xkb.current_layout < seat.*.keyboard.xkb.num_layouts) seat.*.keyboard.xkb.current_layout else @as(xkb_layout_index_t, 0));
        Wayland_SeatSetKeymap(seat);
    }
    var locale: [*c]const u8 = SDL_getenv_REAL("LC_ALL");
    _ = &locale;
    if (!(locale != null)) {
        locale = SDL_getenv_REAL("LC_CTYPE");
        if (!(locale != null)) {
            locale = SDL_getenv_REAL("LANG");
            if (!(locale != null)) {
                locale = "C";
            }
        }
    }
    if (!(seat.*.keyboard.current_locale != null) or (SDL_strcmp_REAL(seat.*.keyboard.current_locale, locale) != @as(c_int, 0))) {
        SDL_free_REAL(@ptrCast(@alignCast(seat.*.keyboard.current_locale)));
        seat.*.keyboard.current_locale = SDL_strdup_REAL(locale);
        if (@as(?*anyopaque, @ptrCast(@alignCast(seat.*.keyboard.xkb.compose_table))) != @as(?*anyopaque, null)) {
            WAYLAND_xkb_compose_table_unref.?(seat.*.keyboard.xkb.compose_table);
            seat.*.keyboard.xkb.compose_table = null;
        }
        seat.*.keyboard.xkb.compose_table = WAYLAND_xkb_compose_table_new_from_locale.?(seat.*.display.*.xkb_context, locale, XKB_COMPOSE_COMPILE_NO_FLAGS);
        if (seat.*.keyboard.xkb.compose_table != null) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(seat.*.keyboard.xkb.compose_state))) != @as(?*anyopaque, null)) {
                WAYLAND_xkb_compose_state_unref.?(seat.*.keyboard.xkb.compose_state);
                seat.*.keyboard.xkb.compose_state = null;
            }
            seat.*.keyboard.xkb.compose_state = WAYLAND_xkb_compose_state_new.?(seat.*.keyboard.xkb.compose_table, XKB_COMPOSE_STATE_NO_FLAGS);
            if (!(seat.*.keyboard.xkb.compose_state != null)) {
                _ = SDL_SetError_REAL("could not create XKB compose state");
                WAYLAND_xkb_compose_table_unref.?(seat.*.keyboard.xkb.compose_table);
                seat.*.keyboard.xkb.compose_table = null;
            }
        }
    } else if (seat.*.keyboard.xkb.compose_state != null) {
        WAYLAND_xkb_compose_state_reset.?(seat.*.keyboard.xkb.compose_state);
    }
}
pub fn Wayland_GetScancodeForKey(seat: [*c]SDL_WaylandSeat, key: Uint32, syms: [*c][*c]const xkb_keysym_t) callconv(.c) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var scancode: SDL_Scancode = SDL_SCANCODE_UNKNOWN;
    _ = &scancode;
    if (!seat.*.keyboard.is_virtual) {
        scancode = SDL_GetScancodeFromTable(SDL_SCANCODE_TABLE_LINUX, @bitCast(@as(c_uint, @truncate(key))));
        if (scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
            var i: [*c]Wayland_ReservedKey = undefined;
            _ = &i;
            {
                i = @ptrCast(@alignCast((&seat.*.keyboard.reserved_scancodes).*.data));
                while (((&seat.*.keyboard.reserved_scancodes).*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(i))) < (@as([*c]const u8, @ptrCast(@alignCast((&seat.*.keyboard.reserved_scancodes).*.data))) + (&seat.*.keyboard.reserved_scancodes).*.size))) : (i += 1) {
                    if (i.*.key == key) {
                        return i.*.scancode;
                    }
                }
            }
        }
    } else {
        var keysym: [*c]const xkb_keysym_t = undefined;
        _ = &keysym;
        if (WAYLAND_xkb_state_key_get_syms.?(seat.*.keyboard.xkb.state, key +% @as(Uint32, 8), &keysym) > @as(c_int, 0)) {
            scancode = SDL_GetScancodeFromKeySym(keysym[@as(c_int, 0)], key +% @as(Uint32, 8));
            if (syms != null) {
                syms.* = keysym;
            }
        }
    }
    return scancode;
}
pub fn Wayland_ReconcileModifiers(seat: [*c]SDL_WaylandSeat, key_pressed: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!key_pressed) {
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.shift_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
        }
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.ctrl_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
        }
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.alt_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LALT | SDL_KMOD_RALT));
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
        }
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.gui_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LGUI | SDL_KMOD_RGUI));
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
        }
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.level3_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & SDL_KMOD_MODE) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_MODE);
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_MODE);
            }
        }
        if ((seat.*.keyboard.xkb.wl_pressed_modifiers & seat.*.keyboard.xkb.level5_mask) != 0) {
            if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & SDL_KMOD_LEVEL5) != 0)) {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_LEVEL5);
                }
            }
        } else {
            {
                const ref = &seat.*.keyboard.pressed_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_LEVEL5);
            }
        }
    }
    const xkb_locked_modifiers: xkb_mod_mask_t = seat.*.keyboard.xkb.wl_latched_modifiers | seat.*.keyboard.xkb.wl_locked_modifiers;
    _ = &xkb_locked_modifiers;
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.shift_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.locked_modifiers)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0)) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.ctrl_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.locked_modifiers)))) & (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)) != 0)) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
            }
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LCTRL | SDL_KMOD_RCTRL));
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.alt_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.locked_modifiers)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0)) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LALT | SDL_KMOD_RALT));
            }
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LALT | SDL_KMOD_RALT));
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.gui_mask) != 0) {
        if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.pressed_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)));
            }
        } else if (!((@as(c_uint, @bitCast(@as(c_int, @as(c_int, seat.*.keyboard.locked_modifiers)))) & (SDL_KMOD_LGUI | SDL_KMOD_RGUI)) != 0)) {
            {
                const ref = &seat.*.keyboard.locked_modifiers;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LGUI | SDL_KMOD_RGUI));
            }
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~(SDL_KMOD_LGUI | SDL_KMOD_RGUI));
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.level3_mask) != 0) {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_MODE);
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_MODE);
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.level5_mask) != 0) {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_LEVEL5);
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_LEVEL5);
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.caps_mask) != 0) {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_CAPS);
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_CAPS);
        }
    }
    if ((xkb_locked_modifiers & seat.*.keyboard.xkb.num_mask) != 0) {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | SDL_KMOD_NUM);
        }
    } else {
        {
            const ref = &seat.*.keyboard.locked_modifiers;
            ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) & ~SDL_KMOD_NUM);
        }
    }
    SDL_SetModState_REAL(@bitCast(@as(c_short, @truncate(@as(c_int, seat.*.keyboard.pressed_modifiers) | @as(c_int, seat.*.keyboard.locked_modifiers)))));
}
pub fn Wayland_HandleModifierKeys(seat: [*c]SDL_WaylandSeat, scancode: SDL_Scancode, pressed: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var mod: SDL_Keymod = undefined;
    _ = &mod;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                keycode = SDL_GetKeyFromScancode_REAL(scancode, @bitCast(@as(c_short, @truncate(@as(c_int, seat.*.keyboard.pressed_modifiers) | @as(c_int, seat.*.keyboard.locked_modifiers)))), @"false" != 0);
                switch (keycode) {
                    SDLK_LSHIFT => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDLK_RSHIFT => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDLK_LCTRL => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDLK_RCTRL => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDLK_LALT => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDLK_RALT => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDLK_LGUI => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDLK_RGUI => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDLK_MODE => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDLK_LEVEL5_SHIFT => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            1 => {
                if (pressed) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            2 => {
                mod = SDL_KMOD_LSHIFT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                mod = SDL_KMOD_RSHIFT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                mod = SDL_KMOD_LCTRL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                mod = SDL_KMOD_RCTRL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                mod = SDL_KMOD_LALT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                mod = SDL_KMOD_RALT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                mod = SDL_KMOD_LGUI;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                mod = SDL_KMOD_RGUI;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                mod = SDL_KMOD_MODE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                mod = SDL_KMOD_LEVEL5;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                return;
            },
            13 => {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, mod))));
                }
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    const ref = &seat.*.keyboard.pressed_modifiers;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & ~@as(c_int, mod))));
                }
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                Wayland_ReconcileModifiers(seat, @"true" != 0);
                {}
            },
            else => unreachable,
        }
    }
}
pub fn keyboard_handle_enter(data: ?*anyopaque, _: ?*struct_wl_keyboard, serial: u32, surface: ?*struct_wl_surface, keys: [*c]struct_wl_array) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var key: [*c]u32 = undefined;
    _ = &key;
    var window: [*c]SDL_WindowData = undefined;
    _ = &window;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                seat = @ptrCast(@alignCast(data));
                if (!(surface != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                Wayland_UpdateImplicitGrabSerial(seat, serial);
                window = Wayland_GetWindowDataForOwnedSurface(surface);
                if (!(window != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                window.*.keyboard_focus_count += 1;
                seat.*.keyboard.focus = window;
                _ = SDL_SetKeyboardFocus(if (window.*.sdlwindow.*.keyboard_focus != null) window.*.sdlwindow.*.keyboard_focus else window.*.sdlwindow);
                Wayland_SeatUpdateKeyboardGrab(seat);
                Wayland_DisplayUpdatePointerGrabs(seat.*.display, window);
                Wayland_SeatUpdateTextInput(seat);
                if (!(seat.*.text_input.zwp_text_input != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_IME_SetFocus(@"true" != 0);
                {
                    sdl_pc = 9;
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
                timestamp = SDL_GetTicksNS_REAL();
                window.*.last_focus_event_time_ns = timestamp;
                Wayland_SeatSetKeymap(seat);
                key = @ptrCast(@alignCast(keys.*.data));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if ((keys.*.size != @as(usize, 0)) and (@as([*c]const u8, @ptrCast(@alignCast(key))) < (@as([*c]const u8, @ptrCast(@alignCast(keys.*.data))) + keys.*.size))) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                scancode = Wayland_GetScancodeForKey(seat, key.*, null);
                if (scancode != @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                key += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {}
            },
            14 => {
                keycode = SDL_GetKeyFromScancode_REAL(scancode, SDL_KMOD_NONE, @"false" != 0);
                switch (keycode) {
                    SDLK_LSHIFT => {
                        sdl_pc = 18;
                        continue;
                    },
                    SDLK_RSHIFT => {
                        sdl_pc = 19;
                        continue;
                    },
                    SDLK_LCTRL => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDLK_RCTRL => {
                        sdl_pc = 21;
                        continue;
                    },
                    SDLK_LALT => {
                        sdl_pc = 22;
                        continue;
                    },
                    SDLK_RALT => {
                        sdl_pc = 23;
                        continue;
                    },
                    SDLK_LGUI => {
                        sdl_pc = 24;
                        continue;
                    },
                    SDLK_RGUI => {
                        sdl_pc = 25;
                        continue;
                    },
                    SDLK_MODE => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDLK_LEVEL5_SHIFT => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 28;
                        continue;
                    },
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 16;
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
                    sdl_pc = 20;
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
                {
                    sdl_pc = 24;
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
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                Wayland_HandleModifierKeys(seat, scancode, @"true" != 0);
                _ = SDL_SendKeyboardKeyIgnoreModifiers(timestamp, seat.*.keyboard.sdl_id, @bitCast(@as(c_uint, @truncate(key.*))), scancode, @"true" != 0);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn keyboard_handle_leave(data: ?*anyopaque, _: ?*struct_wl_keyboard, _: u32, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if (!(surface != null)) {
        return;
    }
    var window: [*c]SDL_WindowData = Wayland_GetWindowDataForOwnedSurface(surface);
    _ = &window;
    if (!(window != null)) {
        return;
    }
    seat.*.keyboard.repeat.key = 0;
    var keyboard_focus: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
    _ = &keyboard_focus;
    while ((keyboard_focus != null) and ((keyboard_focus.*.flags & (@as(c_ulong, 262144) | @as(c_ulong, 524288))) != @as(SDL_WindowFlags, 0))) {
        keyboard_focus = keyboard_focus.*.parent;
    }
    const had_focus: bool = (keyboard_focus != null) and (window.*.sdlwindow == keyboard_focus);
    _ = &had_focus;
    seat.*.keyboard.focus = null;
    window.*.keyboard_focus_count -= 1;
    if (!(window.*.keyboard_focus_count != 0) and had_focus) {
        _ = SDL_SetKeyboardFocus(null);
    }
    Wayland_SeatUpdateKeyboardGrab(seat);
    Wayland_DisplayUpdatePointerGrabs(seat.*.display, window);
    seat.*.keyboard.pressed_modifiers = SDL_KMOD_NONE;
    Wayland_SeatUpdateTextInput(seat);
    if (!(seat.*.text_input.zwp_text_input != null) and !(window.*.keyboard_focus_count != 0)) {
        SDL_IME_SetFocus(@"false" != 0);
    }
    if (((SDL_GetMouseFocus_REAL() == window.*.sdlwindow) and !(window.*.pointer_focus_count != 0)) and !(window.*.active_touch_count != 0)) {
        SDL_SetMouseFocus(null);
    }
    Wayland_DataDeviceSetSelectionOffer(seat.*.data_device, null);
}
pub fn keyboard_input_get_text(text: [*c]u8, seat: [*c]const SDL_WaylandSeat, key: u32, down: bool, handled_by_ime: [*c]bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var syms: [*c]const xkb_keysym_t = undefined;
    _ = &syms;
    var sym: xkb_keysym_t = undefined;
    _ = &sym;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(seat.*.keyboard.focus != null) or !(seat.*.keyboard.xkb.state != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (WAYLAND_xkb_state_key_get_syms.?(seat.*.keyboard.xkb.state, key +% @as(u32, 8), &syms) != @as(c_int, 1)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                return @"false" != 0;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                sym = syms[@as(c_int, 0)];
                if (SDL_IME_ProcessKeyEvent(sym, key +% @as(u32, 8), down)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                if (handled_by_ime != null) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
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
                if (!down) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            10 => {
                handled_by_ime.* = @"true" != 0;
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
                return @"true" != 0;
            },
            13 => {
                return @"false" != 0;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if ((seat.*.keyboard.xkb.compose_state != null) and (WAYLAND_xkb_compose_state_feed.?(seat.*.keyboard.xkb.compose_state, sym) == @as(enum_xkb_compose_feed_result, XKB_COMPOSE_FEED_ACCEPTED))) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            16 => {
                switch (WAYLAND_xkb_compose_state_get_status.?(seat.*.keyboard.xkb.compose_state)) {
                    @as(enum_xkb_compose_status, XKB_COMPOSE_COMPOSING) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(enum_xkb_compose_status, XKB_COMPOSE_CANCELLED) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(enum_xkb_compose_status, XKB_COMPOSE_NOTHING) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(enum_xkb_compose_status, XKB_COMPOSE_COMPOSED) => {
                        sdl_pc = 27;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                return WAYLAND_xkb_keysym_to_utf8.?(sym, text, 8) > @as(c_int, 0);
            },
            19 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            20 => {
                if (handled_by_ime != null) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                handled_by_ime.* = @"true" != 0;
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
                return @"true" != 0;
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                sym = XKB_KEY_NoSymbol;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            27 => {
                sym = WAYLAND_xkb_compose_state_get_one_sym.?(seat.*.keyboard.xkb.compose_state);
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn keyboard_handle_key(data: ?*anyopaque, _: ?*struct_wl_keyboard, serial: u32, time: u32, key: u32, state_w: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var state: enum_wl_keyboard_key_state = state_w;
    _ = &state;
    var text: [8]u8 = undefined;
    _ = &text;
    var has_text: bool = @"false" != 0;
    _ = &has_text;
    var handled_by_ime: bool = @"false" != 0;
    _ = &handled_by_ime;
    const timestamp_ns: Uint64 = Wayland_GetKeyboardTimestamp(seat, time);
    _ = &timestamp_ns;
    Wayland_UpdateImplicitGrabSerial(seat, serial);
    if (state == @as(enum_wl_keyboard_key_state, WL_KEYBOARD_KEY_STATE_REPEATED)) {
        if ((seat.*.keyboard.xkb.keymap != null) and !(WAYLAND_xkb_keymap_key_repeats.?(seat.*.keyboard.xkb.keymap, key +% @as(u32, 8)) != 0)) {
            return;
        }
        state = WL_KEYBOARD_KEY_STATE_PRESSED;
    }
    Wayland_SeatSetKeymap(seat);
    if (state == @as(enum_wl_keyboard_key_state, WL_KEYBOARD_KEY_STATE_PRESSED)) {
        var keyboard_focus: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
        _ = &keyboard_focus;
        if ((keyboard_focus != null) and SDL_TextInputActive_REAL(keyboard_focus)) {
            has_text = keyboard_input_get_text(@ptrCast(@alignCast(&text)), seat, key, @"true" != 0, &handled_by_ime);
        }
    } else {
        if (key == seat.*.keyboard.repeat.key) {
            const elapsed: Uint64 = @as(Uint64, time -% seat.*.keyboard.repeat.wl_press_time_ms) *% @as(Uint64, SDL_NS_PER_MS);
            _ = &elapsed;
            keyboard_repeat_handle(&seat.*.keyboard.repeat, elapsed);
            seat.*.keyboard.repeat.key = 0;
        }
        _ = keyboard_input_get_text(@ptrCast(@alignCast(&text)), seat, key, @"false" != 0, &handled_by_ime);
    }
    var syms: [*c]const xkb_keysym_t = null;
    _ = &syms;
    var scancode: SDL_Scancode = Wayland_GetScancodeForKey(seat, key, &syms);
    _ = &scancode;
    Wayland_HandleModifierKeys(seat, scancode, state == @as(enum_wl_keyboard_key_state, WL_KEYBOARD_KEY_STATE_PRESSED));
    if (((scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and (syms != null)) and (seat.*.keyboard.sdl_keymap != null)) {
        const keycode: SDL_Keycode = SDL_KeySymToUcs4(syms[@as(c_int, 0)]);
        _ = &keycode;
        if (keycode != SDLK_UNKNOWN) {
            var modstate: SDL_Keymod = SDL_KMOD_NONE;
            _ = &modstate;
            scancode = SDL_GetKeymapScancode(seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout], keycode, &modstate);
            if ((scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and (keycode < (@as(c_uint, 1) << @intCast(@as(c_uint, 30))))) {
                scancode = SDL_GetKeymapNextReservedScancode(seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout]);
                SDL_SetKeymapEntry(seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout], scancode, modstate, keycode);
            }
        }
    }
    _ = SDL_SendKeyboardKeyIgnoreModifiers(timestamp_ns, seat.*.keyboard.sdl_id, @bitCast(@as(c_uint, @truncate(key))), scancode, state == @as(enum_wl_keyboard_key_state, WL_KEYBOARD_KEY_STATE_PRESSED));
    if (state == @as(enum_wl_keyboard_key_state, WL_KEYBOARD_KEY_STATE_PRESSED)) {
        if (handled_by_ime) {
            has_text = @"false" != 0;
        }
        if (has_text and !((@as(c_uint, @bitCast(@as(c_int, @as(c_int, SDL_GetModState_REAL())))) & ((SDL_KMOD_LCTRL | SDL_KMOD_RCTRL) | (SDL_KMOD_LALT | SDL_KMOD_RALT))) != 0)) {
            SDL_SendKeyboardText(@ptrCast(@alignCast(&text)));
        }
        if ((seat.*.keyboard.xkb.keymap != null) and (WAYLAND_xkb_keymap_key_repeats.?(seat.*.keyboard.xkb.keymap, key +% @as(u32, 8)) != 0)) {
            keyboard_repeat_set(&seat.*.keyboard.repeat, seat.*.keyboard.sdl_id, key, time, timestamp_ns, scancode, @ptrCast(@alignCast(if (has_text) @as(?*anyopaque, @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&text)))))) else @as(?*anyopaque, null))));
        }
    }
}
pub fn keyboard_handle_modifiers(data: ?*anyopaque, _: ?*struct_wl_keyboard, _: u32, mods_depressed: u32, mods_latched: u32, mods_locked: u32, group: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    const previous_layout: u32 = seat.*.keyboard.xkb.current_layout;
    _ = &previous_layout;
    seat.*.keyboard.xkb.wl_pressed_modifiers = mods_depressed;
    seat.*.keyboard.xkb.wl_latched_modifiers = mods_latched;
    seat.*.keyboard.xkb.wl_locked_modifiers = mods_locked;
    seat.*.keyboard.xkb.current_layout = group;
    Wayland_ReconcileModifiers(seat, @"false" != 0);
    if (!(seat.*.keyboard.xkb.state != null)) {
        return;
    }
    _ = WAYLAND_xkb_state_update_mask.?(seat.*.keyboard.xkb.state, mods_depressed, mods_latched, mods_locked, 0, 0, group);
    if (seat.*.keyboard.repeat.key != 0) {
        var text: [8]u8 = undefined;
        _ = &text;
        if (keyboard_input_get_text(@ptrCast(@alignCast(&text)), seat, seat.*.keyboard.repeat.key, @"true" != 0, null)) {
            _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&seat.*.keyboard.repeat.text)), @ptrCast(@alignCast(&text)), @sizeOf(@TypeOf(seat.*.keyboard.repeat.text)) / @sizeOf(@TypeOf(seat.*.keyboard.repeat.text[@as(c_int, 0)])));
        }
    }
    if (group != previous_layout) {
        Wayland_SeatSetKeymap(seat);
        if (seat.*.keyboard.xkb.compose_state != null) {
            WAYLAND_xkb_compose_state_reset.?(seat.*.keyboard.xkb.compose_state);
        }
    }
}
pub fn keyboard_handle_repeat_info(data: ?*anyopaque, _: ?*struct_wl_keyboard, rate: i32, delay: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.keyboard.repeat.repeat_rate = rate;
    seat.*.keyboard.repeat.repeat_delay_ms = delay;
    if (!(rate != 0)) {
        seat.*.keyboard.repeat.key = 0;
    }
}
pub const keyboard_listener: struct_wl_keyboard_listener = struct_wl_keyboard_listener{
    .keymap = keyboard_handle_keymap,
    .enter = keyboard_handle_enter,
    .leave = keyboard_handle_leave,
    .key = keyboard_handle_key,
    .modifiers = keyboard_handle_modifiers,
    .repeat_info = keyboard_handle_repeat_info,
};
pub fn Wayland_SeatDestroyPointer(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Wayland_CursorStateRelease(&seat.*.pointer.cursor_state);
    if (seat.*.pointer.gesture_focus != null) {
        _ = SDL_SendPinch(SDL_EVENT_PINCH_END, 0, seat.*.pointer.gesture_focus.*.sdlwindow, 0.0, -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0), -@as(f32, 1.0));
    }
    if (seat.*.pointer.focus != null) {
        seat.*.pointer.pending_frame.leave_surface = seat.*.pointer.focus.*.surface;
        pointer_dispatch_leave(seat, @"false" != 0);
        seat.*.pointer.pending_frame.leave_surface = null;
    }
    SDL_RemoveMouse(seat.*.pointer.sdl_id);
    if (seat.*.pointer.confined_pointer != null) {
        zwp_confined_pointer_v1_destroy(seat.*.pointer.confined_pointer);
    }
    if (seat.*.pointer.locked_pointer != null) {
        zwp_locked_pointer_v1_destroy(seat.*.pointer.locked_pointer);
    }
    if (seat.*.pointer.relative_pointer != null) {
        zwp_relative_pointer_v1_destroy(seat.*.pointer.relative_pointer);
    }
    if (seat.*.pointer.timestamps != null) {
        zwp_input_timestamps_v1_destroy(seat.*.pointer.timestamps);
    }
    if (seat.*.pointer.gesture_pinch != null) {
        zwp_pointer_gesture_pinch_v1_destroy(seat.*.pointer.gesture_pinch);
    }
    if (seat.*.pointer.wl_pointer != null) {
        if (wl_pointer_get_version(seat.*.pointer.wl_pointer) >= @as(u32, WL_POINTER_RELEASE_SINCE_VERSION)) {
            wl_pointer_release(seat.*.pointer.wl_pointer);
        } else {
            wl_pointer_destroy(seat.*.pointer.wl_pointer);
        }
    }
    _ = memset(@ptrCast(@alignCast(&seat.*.pointer)), 0, @sizeOf(@TypeOf(seat.*.pointer)));
}
pub fn Wayland_SeatDestroyKeyboard(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.keyboard.focus != null) {
        keyboard_handle_leave(@ptrCast(@alignCast(seat)), seat.*.keyboard.wl_keyboard, 0, seat.*.keyboard.focus.*.surface);
    }
    SDL_RemoveKeyboard(seat.*.keyboard.sdl_id);
    if (seat.*.keyboard.sdl_keymap != null) {
        if ((seat.*.keyboard.xkb.current_layout < seat.*.keyboard.xkb.num_layouts) and (seat.*.keyboard.sdl_keymap[seat.*.keyboard.xkb.current_layout] == SDL_GetCurrentKeymap(@"true" != 0))) {
            SDL_SetModState_REAL(SDL_KMOD_NONE);
        }
        {
            var i: xkb_layout_index_t = 0;
            _ = &i;
            while (i < seat.*.keyboard.xkb.num_layouts) : (i +%= 1) {
                SDL_DestroyKeymap(seat.*.keyboard.sdl_keymap[i]);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(seat.*.keyboard.sdl_keymap)));
        seat.*.keyboard.sdl_keymap = null;
    }
    WAYLAND_wl_array_release.?(&seat.*.keyboard.reserved_scancodes);
    if (seat.*.keyboard.key_inhibitor != null) {
        zwp_keyboard_shortcuts_inhibitor_v1_destroy(seat.*.keyboard.key_inhibitor);
    }
    if (seat.*.keyboard.timestamps != null) {
        zwp_input_timestamps_v1_destroy(seat.*.keyboard.timestamps);
    }
    if (seat.*.keyboard.wl_keyboard != null) {
        if (wl_keyboard_get_version(seat.*.keyboard.wl_keyboard) >= @as(u32, WL_KEYBOARD_RELEASE_SINCE_VERSION)) {
            wl_keyboard_release(seat.*.keyboard.wl_keyboard);
        } else {
            wl_keyboard_destroy(seat.*.keyboard.wl_keyboard);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(seat.*.keyboard.current_locale)));
    if (seat.*.keyboard.xkb.compose_state != null) {
        WAYLAND_xkb_compose_state_unref.?(seat.*.keyboard.xkb.compose_state);
    }
    if (seat.*.keyboard.xkb.compose_table != null) {
        WAYLAND_xkb_compose_table_unref.?(seat.*.keyboard.xkb.compose_table);
    }
    if (seat.*.keyboard.xkb.state != null) {
        WAYLAND_xkb_state_unref.?(seat.*.keyboard.xkb.state);
    }
    if (seat.*.keyboard.xkb.keymap != null) {
        WAYLAND_xkb_keymap_unref.?(seat.*.keyboard.xkb.keymap);
    }
    _ = memset(@ptrCast(@alignCast(&seat.*.keyboard)), 0, @sizeOf(@TypeOf(seat.*.keyboard)));
}
pub fn Wayland_SeatDestroyTouch(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.touch.wl_touch != null) {
        touch_handler_cancel(@ptrCast(@alignCast(seat)), seat.*.touch.wl_touch);
    }
    SDL_DelTouch(@intCast(@intFromPtr(seat.*.touch.wl_touch)));
    if (seat.*.touch.timestamps != null) {
        zwp_input_timestamps_v1_destroy(seat.*.touch.timestamps);
    }
    if (seat.*.touch.wl_touch != null) {
        if (wl_touch_get_version(seat.*.touch.wl_touch) >= @as(u32, WL_TOUCH_RELEASE_SINCE_VERSION)) {
            wl_touch_release(seat.*.touch.wl_touch);
        } else {
            wl_touch_destroy(seat.*.touch.wl_touch);
        }
    }
    _ = memset(@ptrCast(@alignCast(&seat.*.touch)), 0, @sizeOf(@TypeOf(seat.*.touch)));
    WAYLAND_wl_list_init.?(&seat.*.touch.points);
}
pub fn seat_handle_capabilities(data: ?*anyopaque, wl_seat_1: ?*struct_wl_seat, capabilities: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var name_fmt: [256]u8 = undefined;
    _ = &name_fmt;
    if (((capabilities & @as(u32, WL_SEAT_CAPABILITY_POINTER)) != 0) and (@as(u32, @bitCast(@as(c_int, @intFromBool(!(seat.*.pointer.wl_pointer != null))))) != 0)) {
        seat.*.pointer.wl_pointer = wl_seat_get_pointer(wl_seat_1);
        _ = memset(@ptrCast(@alignCast(&seat.*.pointer.pending_frame.axis)), 0, @sizeOf(@TypeOf(seat.*.pointer.pending_frame.axis)));
        Wayland_SeatCreateCursorShape(seat);
        wl_pointer_set_user_data(seat.*.pointer.wl_pointer, @ptrCast(@alignCast(seat)));
        _ = wl_pointer_add_listener(seat.*.pointer.wl_pointer, &pointer_listener, @ptrCast(@alignCast(seat)));
        Wayland_SeatCreatePointerGestures(seat);
        seat.*.pointer.sdl_id = SDL_GetNextObjectID();
        if (seat.*.name != null) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s (%s)", @as([*c]u8, @as([*c]u8, @constCast("Virtual core pointer"))), seat.*.name);
        } else {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s %u", @as([*c]u8, @as([*c]u8, @constCast("Virtual core pointer"))), seat.*.pointer.sdl_id);
        }
        SDL_AddMouse(seat.*.pointer.sdl_id, @ptrCast(@alignCast(&name_fmt)));
    } else if (!((capabilities & @as(u32, WL_SEAT_CAPABILITY_POINTER)) != 0) and (seat.*.pointer.wl_pointer != null)) {
        Wayland_SeatDestroyPointer(seat);
    }
    if (((capabilities & @as(u32, WL_SEAT_CAPABILITY_TOUCH)) != 0) and (@as(u32, @bitCast(@as(c_int, @intFromBool(!(seat.*.touch.wl_touch != null))))) != 0)) {
        seat.*.touch.wl_touch = wl_seat_get_touch(wl_seat_1);
        wl_touch_set_user_data(seat.*.touch.wl_touch, @ptrCast(@alignCast(seat)));
        _ = wl_touch_add_listener(seat.*.touch.wl_touch, &touch_listener, @ptrCast(@alignCast(seat)));
        if (seat.*.name != null) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s (%s)", @as([*c]u8, @as([*c]u8, @constCast("Virtual core touch"))), seat.*.name);
        } else {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s %lu", @as([*c]u8, @as([*c]u8, @constCast("Virtual core touch"))), @as(SDL_TouchID, @intCast(@intFromPtr(seat.*.touch.wl_touch))));
        }
        _ = SDL_AddTouch(@intCast(@intFromPtr(seat.*.touch.wl_touch)), SDL_TOUCH_DEVICE_DIRECT, @ptrCast(@alignCast(&name_fmt)));
    } else if (!((capabilities & @as(u32, WL_SEAT_CAPABILITY_TOUCH)) != 0) and (seat.*.touch.wl_touch != null)) {
        Wayland_SeatDestroyTouch(seat);
    }
    if (((capabilities & @as(u32, WL_SEAT_CAPABILITY_KEYBOARD)) != 0) and (@as(u32, @bitCast(@as(c_int, @intFromBool(!(seat.*.keyboard.wl_keyboard != null))))) != 0)) {
        seat.*.keyboard.wl_keyboard = wl_seat_get_keyboard(wl_seat_1);
        WAYLAND_wl_array_init.?(&seat.*.keyboard.reserved_scancodes);
        wl_keyboard_set_user_data(seat.*.keyboard.wl_keyboard, @ptrCast(@alignCast(seat)));
        _ = wl_keyboard_add_listener(seat.*.keyboard.wl_keyboard, &keyboard_listener, @ptrCast(@alignCast(seat)));
        seat.*.keyboard.sdl_id = SDL_GetNextObjectID();
        if (seat.*.name != null) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s (%s)", @as([*c]u8, @as([*c]u8, @constCast("Virtual core keyboard"))), seat.*.name);
        } else {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&name_fmt)), @sizeOf(@TypeOf(name_fmt)), "%s %u", @as([*c]u8, @as([*c]u8, @constCast("Virtual core keyboard"))), seat.*.keyboard.sdl_id);
        }
        SDL_AddKeyboard(seat.*.keyboard.sdl_id, @ptrCast(@alignCast(&name_fmt)));
    } else if (!((capabilities & @as(u32, WL_SEAT_CAPABILITY_KEYBOARD)) != 0) and (seat.*.keyboard.wl_keyboard != null)) {
        Wayland_SeatDestroyKeyboard(seat);
    }
    Wayland_SeatRegisterInputTimestampListeners(seat);
}
pub fn seat_handle_name(data: ?*anyopaque, _: ?*struct_wl_seat, name: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if ((name != null) and (@as(c_int, name.*) != @as(c_int, '\x00'))) {
        seat.*.name = SDL_strdup_REAL(name);
    }
}
pub const seat_listener: struct_wl_seat_listener = struct_wl_seat_listener{
    .capabilities = seat_handle_capabilities,
    .name = seat_handle_name,
};
pub fn data_offer_handle_offer(data: ?*anyopaque, wl_data_offer_1: ?*struct_wl_data_offer, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var offer: [*c]SDL_WaylandDataOffer = @ptrCast(@alignCast(data));
    _ = &offer;
    _ = Wayland_DataOfferAddMIME(offer, mime_type);
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_offer_listener . data_offer_handle_offer on data_offer 0x%08x for MIME '%s'", if (wl_data_offer_1 != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(wl_data_offer_1))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))), mime_type);
}
pub fn data_offer_handle_source_actions(_: ?*anyopaque, wl_data_offer_1: ?*struct_wl_data_offer, source_actions: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_offer_listener . data_offer_handle_source_actions on data_offer 0x%08x for Source Actions '%d'", if (wl_data_offer_1 != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(wl_data_offer_1))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))), source_actions);
}
pub fn data_offer_handle_actions(_: ?*anyopaque, wl_data_offer_1: ?*struct_wl_data_offer, dnd_action: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_offer_listener . data_offer_handle_actions on data_offer 0x%08x for DND Actions '%d'", if (wl_data_offer_1 != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(wl_data_offer_1))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))), dnd_action);
}
pub const data_offer_listener: struct_wl_data_offer_listener = struct_wl_data_offer_listener{
    .offer = data_offer_handle_offer,
    .source_actions = data_offer_handle_source_actions,
    .action = data_offer_handle_actions,
};
pub fn primary_selection_offer_handle_offer(data: ?*anyopaque, zwp_primary_selection_offer_v1: ?*struct_zwp_primary_selection_offer_v1_117, mime_type: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var offer: [*c]SDL_WaylandPrimarySelectionOffer = @ptrCast(@alignCast(data));
    _ = &offer;
    _ = Wayland_PrimarySelectionOfferAddMIME(offer, mime_type);
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In zwp_primary_selection_offer_v1_listener . primary_selection_offer_handle_offer on primary_selection_offer 0x%08x for MIME '%s'", if (zwp_primary_selection_offer_v1 != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(zwp_primary_selection_offer_v1))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))), mime_type);
}
pub const primary_selection_offer_listener: struct_zwp_primary_selection_offer_v1_listener = struct_zwp_primary_selection_offer_v1_listener{
    .offer = primary_selection_offer_handle_offer,
};
pub fn data_device_handle_data_offer(data: ?*anyopaque, _: ?*struct_wl_data_device, id: ?*struct_wl_data_offer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_offer: [*c]SDL_WaylandDataOffer = undefined;
    data_offer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data_offer.*)))));
    _ = &data_offer;
    if (data_offer != null) {
        var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
        _ = &data_device;
        data_offer.*.offer = id;
        data_offer.*.data_device = data_device;
        data_offer.*.read_fd = -@as(c_int, 1);
        WAYLAND_wl_array_init.?(&data_offer.*.mimes);
        wl_data_offer_set_user_data(id, @ptrCast(@alignCast(data_offer)));
        _ = wl_data_offer_add_listener(id, &data_offer_listener, @ptrCast(@alignCast(data_offer)));
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_data_offer on data_offer 0x%08x", if (id != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))));
    }
}
pub fn data_device_handle_enter(data: ?*anyopaque, _: ?*struct_wl_data_device, serial: u32, surface: ?*struct_wl_surface, x: wl_fixed_t, y: wl_fixed_t, id: ?*struct_wl_data_offer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
    _ = &data_device;
    var window: [*c]SDL_WindowData = @ptrCast(@alignCast(if (surface != null) @as(?*anyopaque, @ptrCast(@alignCast(Wayland_GetWindowDataForOwnedSurface(surface)))) else @as(?*anyopaque, null)));
    _ = &window;
    data_device.*.has_mime_file = @"false" != 0;
    data_device.*.has_mime_text = @"false" != 0;
    data_device.*.drag_serial = serial;
    if (id != null) {
        data_device.*.drag_offer = @ptrCast(@alignCast(wl_data_offer_get_user_data(id)));
    }
    if (((data_device.*.drag_offer != null) and (window != null)) and window.*.accepts_drag_and_drop) {
        if (Wayland_DataOfferHasMIME(data_device.*.drag_offer, "application/vnd.portal.filetransfer")) {
            data_device.*.has_mime_file = @"true" != 0;
            data_device.*.mime_type = "application/vnd.portal.filetransfer";
            wl_data_offer_accept(id, serial, "application/vnd.portal.filetransfer");
        }
        if (Wayland_DataOfferHasMIME(data_device.*.drag_offer, "text/uri-list")) {
            data_device.*.has_mime_file = @"true" != 0;
            data_device.*.mime_type = "text/uri-list";
            wl_data_offer_accept(id, serial, "text/uri-list");
        }
        var mime_count: usize = 0;
        _ = &mime_count;
        var text_mime_types: [*c]const [*c]const u8 = Wayland_GetTextMimeTypes(SDL_GetVideoDevice(), &mime_count);
        _ = &text_mime_types;
        {
            var i: usize = 0;
            _ = &i;
            while (i < mime_count) : (i +%= 1) {
                if (Wayland_DataOfferHasMIME(data_device.*.drag_offer, text_mime_types[i])) {
                    data_device.*.has_mime_text = @"true" != 0;
                    data_device.*.mime_type = text_mime_types[i];
                    wl_data_offer_accept(id, serial, text_mime_types[i]);
                    break;
                }
            }
        }
        if (data_device.*.has_mime_file or data_device.*.has_mime_text) {
            if (wl_data_offer_get_version(data_device.*.drag_offer.*.offer) >= @as(u32, WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION)) {
                wl_data_offer_set_actions(data_device.*.drag_offer.*.offer, WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY, WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY);
            }
            data_device.*.dnd_window = window.*.sdlwindow;
            data_device.*.dnd_surface = surface;
            var dx: f64 = wl_fixed_to_double(x);
            _ = &dx;
            var dy: f64 = wl_fixed_to_double(y);
            _ = &dy;
            if (surface == window.*.mask.surface) {
                dx += @floatFromInt(window.*.mask.offset_x);
                dy += @floatFromInt(window.*.mask.offset_y);
            }
            dx *= window.*.pointer_scale.x;
            dy *= window.*.pointer_scale.y;
            _ = SDL_SendDropPosition(data_device.*.dnd_window, @floatCast(dx), @floatCast(dy));
            SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_enter on data_offer 0x%08x at %d x %d into window %d for serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))), wl_fixed_to_int(x), wl_fixed_to_int(y), SDL_GetWindowID_REAL(data_device.*.dnd_window), serial);
        } else {
            wl_data_offer_accept(id, serial, null);
            if (wl_data_offer_get_version(data_device.*.drag_offer.*.offer) >= @as(u32, WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION)) {
                wl_data_offer_set_actions(data_device.*.drag_offer.*.offer, WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE, WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE);
            }
            SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_enter on data_offer 0x%08x at %d x %d for serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))), wl_fixed_to_int(x), wl_fixed_to_int(y), serial);
        }
    } else {
        data_device.*.dnd_window = null;
        data_device.*.dnd_surface = null;
        if (id != null) {
            wl_data_offer_accept(id, serial, null);
            if (wl_data_offer_get_version(data_device.*.drag_offer.*.offer) >= @as(u32, WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION)) {
                wl_data_offer_set_actions(data_device.*.drag_offer.*.offer, WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE, WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE);
            }
        }
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_enter on data_offer 0x%08x at %d x %d for serial %d", if (id != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))), wl_fixed_to_int(x), wl_fixed_to_int(y), serial);
    }
}
pub fn data_device_handle_leave(data: ?*anyopaque, _: ?*struct_wl_data_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
    _ = &data_device;
    if (data_device.*.drag_offer != null) {
        if (data_device.*.dnd_window != null) {
            _ = SDL_SendDropComplete(data_device.*.dnd_window);
            SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_leave on data_offer 0x%08x from window %d for serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(data_device.*.drag_offer.*.offer))), SDL_GetWindowID_REAL(data_device.*.dnd_window), data_device.*.drag_serial);
        } else {
            SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_leave on data_offer 0x%08x for serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(data_device.*.drag_offer.*.offer))), data_device.*.drag_serial);
        }
        Wayland_DataOfferDestroy(data_device.*.drag_offer);
        data_device.*.drag_offer = null;
    } else {
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_leave on data_offer 0x%08x for serial %d", -@as(c_int, 1), -@as(c_int, 1));
    }
    data_device.*.has_mime_file = @"false" != 0;
    data_device.*.has_mime_text = @"false" != 0;
}
pub fn data_device_handle_motion(data: ?*anyopaque, _: ?*struct_wl_data_device, _: u32, x: wl_fixed_t, y: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
    _ = &data_device;
    if (((data_device.*.drag_offer != null) and (data_device.*.dnd_window != null)) and (data_device.*.has_mime_file or data_device.*.has_mime_text)) {
        var window_data: [*c]SDL_WindowData = data_device.*.dnd_window.*.internal;
        _ = &window_data;
        var dx: f64 = wl_fixed_to_double(x);
        _ = &dx;
        var dy: f64 = wl_fixed_to_double(y);
        _ = &dy;
        if (data_device.*.dnd_surface == window_data.*.mask.surface) {
            dx += @floatFromInt(window_data.*.mask.offset_x);
            dy += @floatFromInt(window_data.*.mask.offset_y);
        }
        dx *= window_data.*.pointer_scale.x;
        dy *= window_data.*.pointer_scale.y;
        _ = SDL_SendDropPosition(data_device.*.dnd_window, @floatCast(dx), @floatCast(dy));
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_motion on data_offer 0x%08x at %d x %d in window %d serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(data_device.*.drag_offer.*.offer))), wl_fixed_to_int(x), wl_fixed_to_int(y), SDL_GetWindowID_REAL(data_device.*.dnd_window), data_device.*.drag_serial);
    } else {
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_motion on data_offer 0x%08x at %d x %d serial %d", -@as(c_int, 1), wl_fixed_to_int(x), wl_fixed_to_int(y), -@as(c_int, 1));
    }
}
pub fn data_device_handle_drop(data: ?*anyopaque, _: ?*struct_wl_data_device) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
    _ = &data_device;
    if (((data_device.*.drag_offer != null) and (data_device.*.dnd_window != null)) and (data_device.*.has_mime_file or data_device.*.has_mime_text)) {
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_drop on data_offer 0x%08x in window %d serial %d", WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(data_device.*.drag_offer.*.offer))), SDL_GetWindowID_REAL(data_device.*.dnd_window), data_device.*.drag_serial);
        var length: usize = undefined;
        _ = &length;
        var drop_handled: bool = @"false" != 0;
        _ = &drop_handled;
        if (Wayland_DataOfferHasMIME(data_device.*.drag_offer, "application/vnd.portal.filetransfer")) {
            var buffer: ?*anyopaque = Wayland_DataOfferReceive(data_device.*.drag_offer, "application/vnd.portal.filetransfer", &length, @"false" != 0);
            _ = &buffer;
            if (buffer != null) {
                var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
                _ = &dbus;
                if (dbus != null) {
                    var path_count: c_int = 0;
                    _ = &path_count;
                    var paths: [*c][*c]u8 = SDL_DBus_DocumentsPortalRetrieveFiles(@ptrCast(@alignCast(buffer)), &path_count);
                    _ = &paths;
                    if ((paths != null) and (path_count > @as(c_int, 0))) {
                        var i: c_int = undefined;
                        _ = &i;
                        {
                            i = 0;
                            while (i < path_count) : (i += 1) {
                                _ = SDL_SendDropFile(data_device.*.dnd_window, null, paths[@bitCast(@as(isize, @intCast(i)))]);
                            }
                        }
                        dbus.*.free_string_array.?(paths);
                        _ = SDL_SendDropComplete(data_device.*.dnd_window);
                        drop_handled = @"true" != 0;
                    }
                }
                SDL_free_REAL(buffer);
            }
        }
        if (!drop_handled) {
            var buffer: ?*anyopaque = Wayland_DataOfferReceive(data_device.*.drag_offer, data_device.*.mime_type, &length, @"false" != 0);
            _ = &buffer;
            if (data_device.*.has_mime_file) {
                if (buffer != null) {
                    var saveptr: [*c]u8 = null;
                    _ = &saveptr;
                    var token: [*c]u8 = SDL_strtok_r_REAL(@ptrCast(@alignCast(buffer)), "\r\n", &saveptr);
                    _ = &token;
                    while (token != null) {
                        if (SDL_URIToLocal(token, token) >= @as(c_int, 0)) {
                            _ = SDL_SendDropFile(data_device.*.dnd_window, null, token);
                        }
                        token = SDL_strtok_r_REAL(null, "\r\n", &saveptr);
                    }
                    SDL_free_REAL(buffer);
                    _ = SDL_SendDropComplete(data_device.*.dnd_window);
                } else {
                    _ = SDL_SendDropComplete(data_device.*.dnd_window);
                }
                drop_handled = @"true" != 0;
            } else if (data_device.*.has_mime_text) {
                if (buffer != null) {
                    var saveptr: [*c]u8 = null;
                    _ = &saveptr;
                    var token: [*c]u8 = SDL_strtok_r_REAL(@ptrCast(@alignCast(buffer)), "\r\n", &saveptr);
                    _ = &token;
                    while (token != null) {
                        _ = SDL_SendDropText(data_device.*.dnd_window, token);
                        token = SDL_strtok_r_REAL(null, "\r\n", &saveptr);
                    }
                    SDL_free_REAL(buffer);
                    _ = SDL_SendDropComplete(data_device.*.dnd_window);
                } else {
                    _ = SDL_SendDropComplete(data_device.*.dnd_window);
                }
                drop_handled = @"true" != 0;
            }
        }
        if (drop_handled and (wl_data_offer_get_version(data_device.*.drag_offer.*.offer) >= @as(u32, WL_DATA_OFFER_FINISH_SINCE_VERSION))) {
            wl_data_offer_finish(data_device.*.drag_offer.*.offer);
        }
    } else {
        SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In wl_data_device_listener . data_device_handle_drop on data_offer 0x%08x serial %d", -@as(c_int, 1), -@as(c_int, 1));
    }
    Wayland_DataOfferDestroy(data_device.*.drag_offer);
    data_device.*.drag_offer = null;
}
pub fn data_device_handle_selection(data: ?*anyopaque, _: ?*struct_wl_data_device, id: ?*struct_wl_data_offer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var data_device: [*c]SDL_WaylandDataDevice = @ptrCast(@alignCast(data));
    _ = &data_device;
    var offer: [*c]SDL_WaylandDataOffer = null;
    _ = &offer;
    if (id != null) {
        offer = @ptrCast(@alignCast(wl_data_offer_get_user_data(id)));
    }
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In data_device_listener . data_device_handle_selection on data_offer 0x%08x", if (id != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))));
    Wayland_DataDeviceSetSelectionOffer(data_device, offer);
}
pub const data_device_listener: struct_wl_data_device_listener = struct_wl_data_device_listener{
    .data_offer = data_device_handle_data_offer,
    .enter = data_device_handle_enter,
    .leave = data_device_handle_leave,
    .motion = data_device_handle_motion,
    .drop = data_device_handle_drop,
    .selection = data_device_handle_selection,
};
pub fn primary_selection_device_handle_offer(data: ?*anyopaque, _: ?*struct_zwp_primary_selection_device_v1_44, id: ?*struct_zwp_primary_selection_offer_v1_117) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var primary_selection_offer: [*c]SDL_WaylandPrimarySelectionOffer = undefined;
    primary_selection_offer = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(primary_selection_offer.*)))));
    _ = &primary_selection_offer;
    if (primary_selection_offer != null) {
        var primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = @ptrCast(@alignCast(data));
        _ = &primary_selection_device;
        primary_selection_device.*.seat.*.display.*.current_primary_selection_seat = primary_selection_device.*.seat;
        primary_selection_offer.*.offer = id;
        primary_selection_offer.*.primary_selection_device = primary_selection_device;
        WAYLAND_wl_array_init.?(&primary_selection_offer.*.mimes);
        zwp_primary_selection_offer_v1_set_user_data(id, @ptrCast(@alignCast(primary_selection_offer)));
        _ = zwp_primary_selection_offer_v1_add_listener(id, &primary_selection_offer_listener, @ptrCast(@alignCast(primary_selection_offer)));
    }
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In zwp_primary_selection_device_v1_listener . primary_selection_device_handle_offer on primary_selection_offer 0x%08x", if (id != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))));
}
pub fn primary_selection_device_handle_selection(data: ?*anyopaque, _: ?*struct_zwp_primary_selection_device_v1_44, id: ?*struct_zwp_primary_selection_offer_v1_117) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = @ptrCast(@alignCast(data));
    _ = &primary_selection_device;
    var offer: [*c]SDL_WaylandPrimarySelectionOffer = null;
    _ = &offer;
    if (id != null) {
        offer = @ptrCast(@alignCast(zwp_primary_selection_offer_v1_get_user_data(id)));
    }
    if (primary_selection_device.*.selection_offer != offer) {
        Wayland_PrimarySelectionOfferDestroy(primary_selection_device.*.selection_offer);
        primary_selection_device.*.selection_offer = offer;
    }
    SDL_LogTrace_REAL(SDL_LOG_CATEGORY_INPUT, ". In zwp_primary_selection_device_v1_listener . primary_selection_device_handle_selection on primary_selection_offer 0x%08x", if (id != null) WAYLAND_wl_proxy_get_id.?(@ptrCast(@alignCast(id))) else @as(u32, @bitCast(@as(c_int, -@as(c_int, 1)))));
}
pub const primary_selection_device_listener: struct_zwp_primary_selection_device_v1_listener = struct_zwp_primary_selection_device_v1_listener{
    .data_offer = primary_selection_device_handle_offer,
    .selection = primary_selection_device_handle_selection,
};
pub fn text_input_enter(_: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, _: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn text_input_leave(_: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, _: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn text_input_preedit_string(data: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, text: [*c]const u8, arg_cursor_begin: i32, arg_cursor_end: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var cursor_begin = arg_cursor_begin;
    _ = &cursor_begin;
    var cursor_end = arg_cursor_end;
    _ = &cursor_end;
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    seat.*.text_input.has_preedit = @"true" != 0;
    if (text != null) {
        var cursor_begin_utf8: c_int = if (cursor_begin >= @as(c_int, 0)) @as(c_int, @bitCast(@as(c_uint, @truncate(SDL_utf8strnlen_REAL(text, @bitCast(@as(c_long, cursor_begin))))))) else -@as(c_int, 1);
        _ = &cursor_begin_utf8;
        var cursor_end_utf8: c_int = if (cursor_end >= @as(c_int, 0)) @as(c_int, @bitCast(@as(c_uint, @truncate(SDL_utf8strnlen_REAL(text, @bitCast(@as(c_long, cursor_end))))))) else -@as(c_int, 1);
        _ = &cursor_end_utf8;
        var cursor_size_utf8: c_int = undefined;
        _ = &cursor_size_utf8;
        if (cursor_end_utf8 >= @as(c_int, 0)) {
            if (cursor_begin_utf8 >= @as(c_int, 0)) {
                cursor_size_utf8 = cursor_end_utf8 - cursor_begin_utf8;
            } else {
                cursor_size_utf8 = cursor_end_utf8;
            }
        } else {
            cursor_size_utf8 = -@as(c_int, 1);
        }
        SDL_SendEditingText(text, cursor_begin_utf8, cursor_size_utf8);
    } else {
        SDL_SendEditingText("", 0, 0);
    }
}
pub fn text_input_commit_string(_: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, text: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_SendKeyboardText(text);
}
pub fn text_input_delete_surrounding_text(_: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn text_input_done(data: ?*anyopaque, _: ?*struct_zwp_text_input_v3_62, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    if (!seat.*.text_input.has_preedit) {
        SDL_SendEditingText("", 0, 0);
    }
    seat.*.text_input.has_preedit = @"false" != 0;
}
pub const text_input_listener: struct_zwp_text_input_v3_listener = struct_zwp_text_input_v3_listener{
    .enter = text_input_enter,
    .leave = text_input_leave,
    .preedit_string = text_input_preedit_string,
    .commit_string = text_input_commit_string,
    .delete_surrounding_text = text_input_delete_surrounding_text,
    .done = text_input_done,
};
pub fn Wayland_DataDeviceSetID(data_device: [*c]SDL_WaylandDataDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(data_device.*.id_str != null)) {
        var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
        _ = &dbus;
        if (dbus != null) {
            var id: [*c]const u8 = dbus.*.bus_get_unique_name.?(dbus.*.session_conn);
            _ = &id;
            if (id != null) {
                data_device.*.id_str = SDL_strdup_REAL(id);
            }
        }
    }
    if (!(data_device.*.id_str != null)) {
        var id: [24]u8 = undefined;
        _ = &id;
        var pid: Uint64 = @bitCast(@as(c_long, getpid()));
        _ = &pid;
        _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&id)), @sizeOf(@TypeOf(id)), "%lu", pid);
        data_device.*.id_str = SDL_strdup_REAL(@ptrCast(@alignCast(&id)));
    }
}
pub fn Wayland_SeatCreateDataDevice(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(seat.*.display.*.data_device_manager != null)) {
        return;
    }
    var data_device: [*c]SDL_WaylandDataDevice = undefined;
    data_device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data_device.*)))));
    _ = &data_device;
    if (!(data_device != null)) {
        return;
    }
    data_device.*.data_device = wl_data_device_manager_get_data_device(seat.*.display.*.data_device_manager, seat.*.wl_seat);
    data_device.*.seat = seat;
    if (!(data_device.*.data_device != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(data_device)));
    } else {
        Wayland_DataDeviceSetID(data_device);
        wl_data_device_set_user_data(data_device.*.data_device, @ptrCast(@alignCast(data_device)));
        _ = wl_data_device_add_listener(data_device.*.data_device, &data_device_listener, @ptrCast(@alignCast(data_device)));
        seat.*.data_device = data_device;
    }
}
pub export fn Wayland_DisplayInitDataDeviceManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatCreateDataDevice(seat);
        }
    }
}
pub fn Wayland_SeatCreatePrimarySelectionDevice(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(seat.*.display.*.primary_selection_device_manager != null)) {
        return;
    }
    var primary_selection_device: [*c]SDL_WaylandPrimarySelectionDevice = undefined;
    primary_selection_device = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(primary_selection_device.*)))));
    _ = &primary_selection_device;
    if (!(primary_selection_device != null)) {
        return;
    }
    primary_selection_device.*.primary_selection_device = zwp_primary_selection_device_manager_v1_get_device(seat.*.display.*.primary_selection_device_manager, seat.*.wl_seat);
    primary_selection_device.*.seat = seat;
    if (!(primary_selection_device.*.primary_selection_device != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(primary_selection_device)));
    } else {
        zwp_primary_selection_device_v1_set_user_data(primary_selection_device.*.primary_selection_device, @ptrCast(@alignCast(primary_selection_device)));
        _ = zwp_primary_selection_device_v1_add_listener(primary_selection_device.*.primary_selection_device, &primary_selection_device_listener, @ptrCast(@alignCast(primary_selection_device)));
        seat.*.primary_selection_device = primary_selection_device;
    }
}
pub export fn Wayland_DisplayInitPrimarySelectionDeviceManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatCreatePrimarySelectionDevice(seat);
        }
    }
}
pub fn Wayland_SeatCreateTextInput(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.display.*.text_input_manager != null) {
        seat.*.text_input.zwp_text_input = zwp_text_input_manager_v3_get_text_input(seat.*.display.*.text_input_manager, seat.*.wl_seat);
        if (seat.*.text_input.zwp_text_input != null) {
            zwp_text_input_v3_set_user_data(seat.*.text_input.zwp_text_input, @ptrCast(@alignCast(seat)));
            _ = zwp_text_input_v3_add_listener(seat.*.text_input.zwp_text_input, &text_input_listener, @ptrCast(@alignCast(seat)));
        }
    }
}
pub export fn Wayland_DisplayInitTextInputManager(d: [*c]SDL_VideoData, _: u32) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&d.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatCreateTextInput(seat);
        }
    }
}
pub fn tablet_tool_handle_type(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, arg_type: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdltool: [*c]SDL_WaylandPenTool = undefined;
    _ = &sdltool;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                sdltool = @ptrCast(@alignCast(data));
                switch (@"type") {
                    @as(u32, ZWP_TABLET_TOOL_V2_TYPE_ERASER) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_TYPE_PEN) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_TYPE_PENCIL) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_TYPE_AIRBRUSH) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_TYPE_BRUSH) => {
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
                {}
            },
            2 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_ERASER;
                return;
            },
            3 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_PEN;
                return;
            },
            4 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_PENCIL;
                return;
            },
            5 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_AIRBRUSH;
                return;
            },
            6 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_BRUSH;
                return;
            },
            7 => {
                sdltool.*.info.subtype = SDL_PEN_TYPE_UNKNOWN;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn tablet_tool_handle_hardware_serial(_: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, _: u32, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn tablet_tool_handle_hardware_id_wacom(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, _: u32, id_lo: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.info.wacom_id = id_lo;
}
pub fn tablet_tool_handle_capability(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, capability: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = undefined;
    _ = &sdltool;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                sdltool = @ptrCast(@alignCast(data));
                switch (capability) {
                    @as(u32, ZWP_TABLET_TOOL_V2_CAPABILITY_TILT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_CAPABILITY_PRESSURE) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_CAPABILITY_DISTANCE) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_CAPABILITY_ROTATION) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(u32, ZWP_TABLET_TOOL_V2_CAPABILITY_SLIDER) => {
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
                {}
            },
            2 => {
                sdltool.*.info.capabilities |= (@as(c_uint, 1) << @intCast(@as(c_uint, 1))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 2)));
                return;
            },
            3 => {
                sdltool.*.info.capabilities |= @as(c_uint, 1) << @intCast(@as(c_uint, 0));
                return;
            },
            4 => {
                sdltool.*.info.capabilities |= @as(c_uint, 1) << @intCast(@as(c_uint, 3));
                return;
            },
            5 => {
                sdltool.*.info.capabilities |= @as(c_uint, 1) << @intCast(@as(c_uint, 4));
                return;
            },
            6 => {
                sdltool.*.info.capabilities |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
                return;
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn tablet_tool_handle_done(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    if (sdltool.*.info.subtype != @as(SDL_PenSubtype, SDL_PEN_TYPE_UNKNOWN)) {
        var window: [*c]SDL_Window = @ptrCast(@alignCast(if (sdltool.*.focus != null) @as(?*anyopaque, @ptrCast(@alignCast(sdltool.*.focus.*.sdlwindow))) else @as(?*anyopaque, null)));
        _ = &window;
        sdltool.*.instance_id = SDL_AddPenDevice(0, null, window, &sdltool.*.info, @ptrCast(@alignCast(sdltool)), @"false" != 0);
    }
}
pub fn tablet_tool_handle_removed(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    if (sdltool.*.instance_id != 0) {
        var window: [*c]SDL_Window = @ptrCast(@alignCast(if (sdltool.*.focus != null) @as(?*anyopaque, @ptrCast(@alignCast(sdltool.*.focus.*.sdlwindow))) else @as(?*anyopaque, null)));
        _ = &window;
        SDL_RemovePenDevice(0, window, sdltool.*.instance_id);
    }
    Wayland_CursorStateRelease(&sdltool.*.cursor_state);
    zwp_tablet_tool_v2_destroy(sdltool.*.wltool);
    WAYLAND_wl_list_remove.?(&sdltool.*.link);
    SDL_free_REAL(@ptrCast(@alignCast(sdltool)));
}
pub fn tablet_tool_handle_proximity_in(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, serial: u32, _: ?*struct_zwp_tablet_v2, surface: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    var windowdata: [*c]SDL_WindowData = @ptrCast(@alignCast(if (surface != null) @as(?*anyopaque, @ptrCast(@alignCast(Wayland_GetWindowDataForOwnedSurface(surface)))) else @as(?*anyopaque, null)));
    _ = &windowdata;
    sdltool.*.focus = @ptrCast(@alignCast(if ((windowdata != null) and (windowdata.*.surface == surface)) @as(?*anyopaque, @ptrCast(@alignCast(windowdata))) else @as(?*anyopaque, null)));
    sdltool.*.proximity_serial = serial;
    sdltool.*.frame.have_proximity = @"true" != 0;
    sdltool.*.frame.in_proximity = @"true" != 0;
}
pub fn tablet_tool_handle_proximity_out(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.have_proximity = @"true" != 0;
    sdltool.*.frame.in_proximity = @"false" != 0;
}
pub fn tablet_tool_handle_down(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.tool_state = WAYLAND_TABLET_TOOL_STATE_DOWN;
}
pub fn tablet_tool_handle_up(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.tool_state = WAYLAND_TABLET_TOOL_STATE_UP;
}
pub fn tablet_tool_handle_motion(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, sx_w: wl_fixed_t, sy_w: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    var windowdata: [*c]SDL_WindowData = sdltool.*.focus;
    _ = &windowdata;
    if (windowdata != null) {
        sdltool.*.frame.x = @floatCast(wl_fixed_to_double(sx_w) * windowdata.*.pointer_scale.x);
        sdltool.*.frame.y = @floatCast(wl_fixed_to_double(sy_w) * windowdata.*.pointer_scale.y);
        sdltool.*.frame.have_motion = @"true" != 0;
    }
}
pub fn tablet_tool_handle_pressure(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, pressure: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.axes[SDL_PEN_AXIS_PRESSURE] = @as(f32, @floatFromInt(pressure)) / @as(f32, 65535.0);
    sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_PRESSURE));
    if (pressure != 0) {
        sdltool.*.frame.axes[SDL_PEN_AXIS_DISTANCE] = 0.0;
        sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_DISTANCE));
    }
}
pub fn tablet_tool_handle_distance(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, distance: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.axes[SDL_PEN_AXIS_DISTANCE] = @as(f32, @floatFromInt(distance)) / @as(f32, 65535.0);
    sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_DISTANCE));
    if (distance != 0) {
        sdltool.*.frame.axes[SDL_PEN_AXIS_PRESSURE] = 0.0;
        sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_PRESSURE));
    }
}
pub fn tablet_tool_handle_tilt(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, xtilt: wl_fixed_t, ytilt: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.axes[SDL_PEN_AXIS_XTILT] = @floatCast(wl_fixed_to_double(xtilt));
    sdltool.*.frame.axes[SDL_PEN_AXIS_YTILT] = @floatCast(wl_fixed_to_double(ytilt));
    sdltool.*.frame.axes_set |= (@as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_XTILT))) | (@as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_YTILT)));
}
pub fn tablet_tool_handle_button(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, _: u32, button: u32, state: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [25:0]u8 = "tablet_tool_handle_button".*;
    };
    _ = &static_local___func__;
    var sdltool: [*c]SDL_WaylandPenTool = undefined;
    _ = &sdltool;
    var sdlbutton: c_int = undefined;
    _ = &sdlbutton;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "(sdlbutton >= 1) && (sdlbutton <= (sizeof(sdltool->frame.buttons)/sizeof(sdltool->frame.buttons[0])))",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                sdltool = @ptrCast(@alignCast(data));
                switch (button) {
                    @as(u32, BTN_STYLUS) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(u32, BTN_STYLUS2) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(u32, BTN_STYLUS3) => {
                        sdl_pc = 4;
                        continue;
                    },
                    else => {
                        sdl_pc = 5;
                        continue;
                    },
                }
            },
            1 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            2 => {
                sdlbutton = 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                sdlbutton = 2;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                sdlbutton = 3;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                return;
            },
            6 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            7 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                sdltool.*.frame.buttons[@bitCast(@as(isize, @intCast(sdlbutton - @as(c_int, 1))))] = @bitCast(if (state == @as(u32, ZWP_TABLET_PAD_V2_BUTTON_STATE_PRESSED)) WAYLAND_TABLET_TOOL_BUTTON_DOWN else WAYLAND_TABLET_TOOL_BUTTON_UP);
                {}
            },
            9 => {
                if (!((sdlbutton >= @as(c_int, 1)) and (@as(c_ulong, @bitCast(@as(c_long, sdlbutton))) <= (@sizeOf(@TypeOf(sdltool.*.frame.buttons)) / @sizeOf(@TypeOf(sdltool.*.frame.buttons[@as(c_int, 0)])))))) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_waylandevents.c", 3382);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 17;
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
                    sdl_pc = 14;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn tablet_tool_handle_rotation(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, degrees: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    const rotation: f32 = @floatCast(wl_fixed_to_double(degrees));
    _ = &rotation;
    sdltool.*.frame.axes[SDL_PEN_AXIS_ROTATION] = if (rotation > @as(f32, 180.0)) rotation - @as(f32, 360.0) else rotation;
    sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_ROTATION));
}
pub fn tablet_tool_handle_slider(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, position: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    sdltool.*.frame.axes[SDL_PEN_AXIS_SLIDER] = @as(f32, @floatFromInt(position)) / @as(f32, 65535.0);
    sdltool.*.frame.axes_set |= @as(c_uint, 1) << @intCast(@as(c_uint, SDL_PEN_AXIS_SLIDER));
}
pub fn tablet_tool_handle_wheel(_: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, _: i32, _: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn tablet_tool_handle_frame(data: ?*anyopaque, _: ?*struct_zwp_tablet_tool_v2_118, time: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(data));
    _ = &sdltool;
    const instance_id: SDL_PenID = sdltool.*.instance_id;
    _ = &instance_id;
    if (!(instance_id != 0)) {
        return;
    }
    const timestamp: Uint64 = Wayland_AdjustEventTimestampBase(Wayland_EventTimestampMSToNS(time));
    _ = &timestamp;
    var window: [*c]SDL_Window = @ptrCast(@alignCast(if (sdltool.*.focus != null) @as(?*anyopaque, @ptrCast(@alignCast(sdltool.*.focus.*.sdlwindow))) else @as(?*anyopaque, null)));
    _ = &window;
    const is_eraser: bool = sdltool.*.info.subtype == @as(SDL_PenSubtype, SDL_PEN_TYPE_ERASER);
    _ = &is_eraser;
    if (sdltool.*.frame.have_proximity and sdltool.*.frame.in_proximity) {
        SDL_SendPenProximity(timestamp, instance_id, window, @"true" != 0, @"true" != 0);
        Wayland_TabletToolUpdateCursor(sdltool);
    }
    if (sdltool.*.frame.have_motion and (@as(c_int, @bitCast(sdltool.*.frame.tool_state)) != 0)) {
        if (sdltool.*.frame.tool_state == @as(enum_unnamed_121, WAYLAND_TABLET_TOOL_STATE_DOWN)) {
            SDL_SendPenMotion(timestamp, instance_id, window, sdltool.*.frame.x, sdltool.*.frame.y);
            SDL_SendPenTouch(timestamp, instance_id, window, is_eraser, @"true" != 0);
        } else {
            SDL_SendPenTouch(timestamp, instance_id, window, is_eraser, @"false" != 0);
            SDL_SendPenMotion(timestamp, instance_id, window, sdltool.*.frame.x, sdltool.*.frame.y);
        }
    } else {
        if (sdltool.*.frame.tool_state != 0) {
            SDL_SendPenTouch(timestamp, instance_id, window, is_eraser, sdltool.*.frame.tool_state == @as(enum_unnamed_121, WAYLAND_TABLET_TOOL_STATE_DOWN));
        }
        if (sdltool.*.frame.have_motion) {
            SDL_SendPenMotion(timestamp, instance_id, window, sdltool.*.frame.x, sdltool.*.frame.y);
        }
    }
    {
        var i: SDL_PenAxis = 0;
        _ = &i;
        while (i < @as(SDL_PenAxis, SDL_PEN_AXIS_COUNT)) : (i +%= 1) {
            if ((sdltool.*.frame.axes_set & (@as(c_uint, 1) << @intCast(i))) != 0) {
                SDL_SendPenAxis(timestamp, instance_id, window, i, sdltool.*.frame.axes[i]);
            }
        }
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(sdltool.*.frame.buttons)) / @sizeOf(@TypeOf(sdltool.*.frame.buttons[@as(c_int, 0)])))) : (i += 1) {
            const state: c_int = @bitCast(sdltool.*.frame.buttons[@bitCast(@as(isize, @intCast(i)))]);
            _ = &state;
            if (state != 0) {
                SDL_SendPenButton(timestamp, instance_id, window, @bitCast(@as(i8, @truncate(i + @as(c_int, 1)))), state == WAYLAND_TABLET_TOOL_BUTTON_DOWN);
            }
        }
    }
    if (sdltool.*.frame.have_proximity and !sdltool.*.frame.in_proximity) {
        SDL_SendPenProximity(timestamp, instance_id, window, @"false" != 0, @"false" != 0);
        sdltool.*.focus = null;
        Wayland_TabletToolUpdateCursor(sdltool);
    }
    _ = memset(@ptrCast(@alignCast(&sdltool.*.frame)), 0, @sizeOf(@TypeOf(sdltool.*.frame)));
}
pub const tablet_tool_listener: struct_zwp_tablet_tool_v2_listener = struct_zwp_tablet_tool_v2_listener{
    .type = tablet_tool_handle_type,
    .hardware_serial = tablet_tool_handle_hardware_serial,
    .hardware_id_wacom = tablet_tool_handle_hardware_id_wacom,
    .capability = tablet_tool_handle_capability,
    .done = tablet_tool_handle_done,
    .removed = tablet_tool_handle_removed,
    .proximity_in = tablet_tool_handle_proximity_in,
    .proximity_out = tablet_tool_handle_proximity_out,
    .down = tablet_tool_handle_down,
    .up = tablet_tool_handle_up,
    .motion = tablet_tool_handle_motion,
    .pressure = tablet_tool_handle_pressure,
    .distance = tablet_tool_handle_distance,
    .tilt = tablet_tool_handle_tilt,
    .rotation = tablet_tool_handle_rotation,
    .slider = tablet_tool_handle_slider,
    .wheel = tablet_tool_handle_wheel,
    .button = tablet_tool_handle_button,
    .frame = tablet_tool_handle_frame,
};
pub fn tablet_seat_handle_tablet_added(_: ?*anyopaque, _: ?*struct_zwp_tablet_seat_v2_64, _: ?*struct_zwp_tablet_v2) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn tablet_seat_handle_tool_added(data: ?*anyopaque, _: ?*struct_zwp_tablet_seat_v2_64, tool: ?*struct_zwp_tablet_tool_v2_118) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(data));
    _ = &seat;
    var sdltool: [*c]SDL_WaylandPenTool = undefined;
    sdltool = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(sdltool.*)))));
    _ = &sdltool;
    if (sdltool != null) {
        sdltool.*.wltool = tool;
        sdltool.*.info.max_tilt = -@as(f32, 1.0);
        sdltool.*.info.num_buttons = -@as(c_int, 1);
        if (seat.*.display.*.cursor_shape_manager != null) {
            sdltool.*.cursor_state.cursor_shape = wp_cursor_shape_manager_v1_get_tablet_tool_v2(seat.*.display.*.cursor_shape_manager, tool);
        }
        WAYLAND_wl_list_insert.?(&seat.*.tablet.tool_list, &sdltool.*.link);
        _ = zwp_tablet_tool_v2_add_listener(tool, &tablet_tool_listener, @ptrCast(@alignCast(sdltool)));
    }
}
pub fn tablet_seat_handle_pad_added(_: ?*anyopaque, _: ?*struct_zwp_tablet_seat_v2_64, _: ?*struct_zwp_tablet_pad_v2) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub const tablet_seat_listener: struct_zwp_tablet_seat_v2_listener = struct_zwp_tablet_seat_v2_listener{
    .tablet_added = tablet_seat_handle_tablet_added,
    .tool_added = tablet_seat_handle_tool_added,
    .pad_added = tablet_seat_handle_pad_added,
};
pub fn Wayland_SeatInitTabletSupport(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    seat.*.tablet.wl_tablet_seat = zwp_tablet_manager_v2_get_tablet_seat(seat.*.display.*.tablet_manager, seat.*.wl_seat);
    _ = zwp_tablet_seat_v2_add_listener(seat.*.tablet.wl_tablet_seat, &tablet_seat_listener, @ptrCast(@alignCast(seat)));
}
pub export fn Wayland_DisplayInitTabletManager(display: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            Wayland_SeatInitTabletSupport(seat);
        }
    }
}
pub fn Wayland_remove_all_pens_callback(_: SDL_PenID, handle: ?*anyopaque, _: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdltool: [*c]SDL_WaylandPenTool = @ptrCast(@alignCast(handle));
    _ = &sdltool;
    Wayland_CursorStateRelease(&sdltool.*.cursor_state);
    zwp_tablet_tool_v2_destroy(sdltool.*.wltool);
    SDL_free_REAL(@ptrCast(@alignCast(sdltool)));
}
pub fn Wayland_SeatDestroyTablet(seat: [*c]SDL_WaylandSeat, shutting_down: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!shutting_down) {
        var tool: [*c]SDL_WaylandPenTool = undefined;
        _ = &tool;
        var temp: [*c]SDL_WaylandPenTool = undefined;
        _ = &temp;
        {
            tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
            temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
            while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : ({
                tool = temp;
                temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
            }) {
                tablet_tool_handle_removed(@ptrCast(@alignCast(tool)), tool.*.wltool);
            }
        }
    } else {
        SDL_RemoveAllPenDevices(Wayland_remove_all_pens_callback, null);
    }
    if (seat.*.tablet.wl_tablet_seat != null) {
        zwp_tablet_seat_v2_destroy(seat.*.tablet.wl_tablet_seat);
        seat.*.tablet.wl_tablet_seat = null;
    }
    _ = memset(@ptrCast(@alignCast(&seat.*.tablet)), 0, @sizeOf(@TypeOf(seat.*.tablet)));
    WAYLAND_wl_list_init.?(&seat.*.tablet.tool_list);
}
pub export fn Wayland_DisplayCreateSeat(display: [*c]SDL_VideoData, wl_seat_1: ?*struct_wl_seat, id: Uint32) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_WaylandSeat))));
    _ = &seat;
    if (!(seat != null)) {
        return;
    }
    WAYLAND_wl_list_insert.?(display.*.seat_list.prev, &seat.*.link);
    WAYLAND_wl_array_init.?(&seat.*.keyboard.reserved_scancodes);
    WAYLAND_wl_list_init.?(&seat.*.touch.points);
    WAYLAND_wl_list_init.?(&seat.*.tablet.tool_list);
    seat.*.wl_seat = wl_seat_1;
    seat.*.display = display;
    seat.*.registry_id = id;
    Wayland_SeatCreateDataDevice(seat);
    Wayland_SeatCreatePrimarySelectionDevice(seat);
    Wayland_SeatCreateTextInput(seat);
    wl_seat_set_user_data(seat.*.wl_seat, @ptrCast(@alignCast(seat)));
    _ = wl_seat_add_listener(seat.*.wl_seat, &seat_listener, @ptrCast(@alignCast(seat)));
    if (display.*.tablet_manager != null) {
        Wayland_SeatInitTabletSupport(seat);
    }
}
pub export fn Wayland_DisplayRemoveWindowReferencesFromSeats(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.keyboard.focus == window) {
                keyboard_handle_leave(@ptrCast(@alignCast(seat)), seat.*.keyboard.wl_keyboard, 0, window.*.surface);
            }
            if (seat.*.pointer.focus == window) {
                seat.*.pointer.pending_frame.leave_surface = seat.*.pointer.focus.*.surface;
                pointer_dispatch_leave(seat, @"true" != 0);
                seat.*.pointer.pending_frame.leave_surface = null;
            }
            var tp: [*c]SDL_WaylandTouchPoint = undefined;
            _ = &tp;
            var temp: [*c]SDL_WaylandTouchPoint = undefined;
            _ = &temp;
            {
                tp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.touch.points).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tp.*), @ptrFromInt(0)).link)));
                temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
                while ((&tp.*.link) != (&seat.*.touch.points)) : ({
                    tp = temp;
                    temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tp.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).link)));
                }) {
                    if (tp.*.surface == window.*.surface) {
                        Wayland_SeatCancelTouch(seat, tp);
                    }
                }
            }
            var tool: [*c]SDL_WaylandPenTool = undefined;
            _ = &tool;
            {
                tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
                while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : (tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)))) {
                    if (tool.*.focus == window) {
                        tool.*.focus = null;
                        Wayland_TabletToolUpdateCursor(tool);
                        if (tool.*.instance_id != 0) {
                            SDL_RemovePenDevice(0, window.*.sdlwindow, tool.*.instance_id);
                            tool.*.instance_id = 0;
                        }
                    }
                }
            }
        }
    }
}
pub export fn Wayland_SeatDestroy(seat: [*c]SDL_WaylandSeat, shutting_down: bool) void {
    @setEvalBranchQuota(100000);
    if (!(seat != null)) {
        return;
    }
    SDL_free_REAL(@ptrCast(@alignCast(seat.*.name)));
    if (seat.*.data_device != null) {
        if (seat.*.data_device.*.selection_offer != null) {
            Wayland_DataOfferDestroy(seat.*.data_device.*.selection_offer);
        }
        if (seat.*.data_device.*.selection_source != null) {
            Wayland_DataSourceDestroy(seat.*.data_device.*.selection_source);
        }
        if (seat.*.data_device.*.drag_offer != null) {
            Wayland_DataOfferDestroy(seat.*.data_device.*.drag_offer);
        }
        if (seat.*.data_device.*.data_device != null) {
            if (wl_data_device_get_version(seat.*.data_device.*.data_device) >= @as(u32, WL_DATA_DEVICE_RELEASE_SINCE_VERSION)) {
                wl_data_device_release(seat.*.data_device.*.data_device);
            } else {
                wl_data_device_destroy(seat.*.data_device.*.data_device);
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(seat.*.data_device.*.id_str)));
        SDL_free_REAL(@ptrCast(@alignCast(seat.*.data_device)));
    }
    if (seat.*.primary_selection_device != null) {
        if (seat.*.primary_selection_device.*.selection_offer != null) {
            Wayland_PrimarySelectionOfferDestroy(seat.*.primary_selection_device.*.selection_offer);
        }
        if (seat.*.primary_selection_device.*.selection_source != null) {
            Wayland_PrimarySelectionSourceDestroy(seat.*.primary_selection_device.*.selection_source);
        }
        if (seat.*.primary_selection_device.*.primary_selection_device != null) {
            zwp_primary_selection_device_v1_destroy(seat.*.primary_selection_device.*.primary_selection_device);
        }
        SDL_free_REAL(@ptrCast(@alignCast(seat.*.primary_selection_device)));
    }
    if (seat.*.text_input.zwp_text_input != null) {
        zwp_text_input_v3_destroy(seat.*.text_input.zwp_text_input);
    }
    Wayland_SeatDestroyKeyboard(seat);
    Wayland_SeatDestroyPointer(seat);
    Wayland_SeatDestroyTouch(seat);
    Wayland_SeatDestroyTablet(seat, shutting_down);
    if (wl_seat_get_version(seat.*.wl_seat) >= @as(u32, WL_SEAT_RELEASE_SINCE_VERSION)) {
        wl_seat_release(seat.*.wl_seat);
    } else {
        wl_seat_destroy(seat.*.wl_seat);
    }
    WAYLAND_wl_list_remove.?(&seat.*.link);
    SDL_free_REAL(@ptrCast(@alignCast(seat)));
}
pub fn Wayland_SeatUpdateRelativePointer(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (seat.*.display.*.relative_pointer_manager != null) {
        var relative_focus: bool = @"false" != 0;
        _ = &relative_focus;
        if (seat.*.pointer.focus != null) {
            if ((seat.*.pointer.focus.*.sdlwindow.*.flags & @as(c_ulong, 32768)) != 0) {
                if (seat.*.keyboard.wl_keyboard != null) {
                    relative_focus = seat.*.keyboard.focus == seat.*.pointer.focus;
                } else {
                    relative_focus = seat.*.pointer.focus.*.keyboard_focus_count != @as(c_int, 0);
                }
            } else {
                relative_focus = SDL_GetMouse().*.warp_emulation_active;
            }
        }
        if (relative_focus) {
            if (!(seat.*.pointer.relative_pointer != null)) {
                seat.*.pointer.relative_pointer = zwp_relative_pointer_manager_v1_get_relative_pointer(seat.*.display.*.relative_pointer_manager, seat.*.pointer.wl_pointer);
                _ = zwp_relative_pointer_v1_add_listener(seat.*.pointer.relative_pointer, &relative_pointer_listener, @ptrCast(@alignCast(seat)));
            }
        } else if (seat.*.pointer.relative_pointer != null) {
            zwp_relative_pointer_v1_destroy(seat.*.pointer.relative_pointer);
            seat.*.pointer.relative_pointer = null;
        }
    }
}
pub fn Wayland_SeatUpdateKeyboardGrab(seat: [*c]SDL_WaylandSeat) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoData = seat.*.display;
    _ = &display;
    if (display.*.key_inhibitor_manager != null) {
        if (seat.*.keyboard.key_inhibitor != null) {
            zwp_keyboard_shortcuts_inhibitor_v1_destroy(seat.*.keyboard.key_inhibitor);
            seat.*.keyboard.key_inhibitor = null;
        }
        if (seat.*.keyboard.wl_keyboard != null) {
            var w: [*c]SDL_WindowData = seat.*.keyboard.focus;
            _ = &w;
            if (w != null) {
                var window: [*c]SDL_Window = w.*.sdlwindow;
                _ = &window;
                if ((window.*.flags & @as(c_ulong, 1048576)) != 0) {
                    seat.*.keyboard.key_inhibitor = zwp_keyboard_shortcuts_inhibit_manager_v1_inhibit_shortcuts(display.*.key_inhibitor_manager, w.*.surface, seat.*.wl_seat);
                }
            }
        }
    }
}
pub export fn Wayland_SeatUpdatePointerGrab(seat: [*c]SDL_WaylandSeat) void {
    @setEvalBranchQuota(100000);
    var display: [*c]SDL_VideoData = seat.*.display;
    _ = &display;
    Wayland_SeatUpdateRelativePointer(seat);
    if (display.*.pointer_constraints != null) {
        if ((seat.*.pointer.locked_pointer != null) and !(seat.*.pointer.relative_pointer != null)) {
            zwp_locked_pointer_v1_destroy(seat.*.pointer.locked_pointer);
            seat.*.pointer.locked_pointer = null;
            Wayland_SeatUpdatePointerCursor(seat);
        }
        if (seat.*.pointer.wl_pointer != null) {
            if (seat.*.pointer.relative_pointer != null) {
                if (!(seat.*.pointer.locked_pointer != null)) {
                    if (seat.*.pointer.confined_pointer != null) {
                        zwp_confined_pointer_v1_destroy(seat.*.pointer.confined_pointer);
                        seat.*.pointer.confined_pointer = null;
                    }
                    seat.*.pointer.locked_pointer = zwp_pointer_constraints_v1_lock_pointer(display.*.pointer_constraints, seat.*.pointer.focus.*.surface, seat.*.pointer.wl_pointer, null, ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT);
                    _ = zwp_locked_pointer_v1_add_listener(seat.*.pointer.locked_pointer, &locked_pointer_listener, @ptrCast(@alignCast(seat)));
                    Wayland_SeatUpdatePointerCursor(seat);
                }
                return;
            }
            if (seat.*.pointer.confined_pointer != null) {
                zwp_confined_pointer_v1_destroy(seat.*.pointer.confined_pointer);
                seat.*.pointer.confined_pointer = null;
            }
            var w: [*c]SDL_WindowData = seat.*.pointer.focus;
            _ = &w;
            if (!(w != null)) {
                return;
            }
            var window: [*c]SDL_Window = w.*.sdlwindow;
            _ = &window;
            if (!((window.*.flags & @as(c_ulong, 512)) != 0) or (!((window.*.flags & @as(c_ulong, 256)) != 0) and SDL_RectEmpty(&window.*.mouse_rect))) {
                return;
            }
            var confine_rect: ?*struct_wl_region = null;
            _ = &confine_rect;
            if (!SDL_RectEmpty(&window.*.mouse_rect)) {
                var scaled_mouse_rect: SDL_Rect = undefined;
                _ = &scaled_mouse_rect;
                Wayland_GetScaledMouseRect(window, &scaled_mouse_rect);
                confine_rect = wl_compositor_create_region(display.*.compositor);
                wl_region_add(confine_rect, scaled_mouse_rect.x, scaled_mouse_rect.y, scaled_mouse_rect.w, scaled_mouse_rect.h);
                if (!SDL_PointInRect(&seat.*.pointer.last_motion, &scaled_mouse_rect)) {
                    var closest_x: c_int = seat.*.pointer.last_motion.x;
                    _ = &closest_x;
                    var closest_y: c_int = seat.*.pointer.last_motion.y;
                    _ = &closest_y;
                    if (closest_x < scaled_mouse_rect.x) {
                        closest_x = scaled_mouse_rect.x;
                    } else if (closest_x >= (scaled_mouse_rect.x + scaled_mouse_rect.w)) {
                        closest_x = (scaled_mouse_rect.x + scaled_mouse_rect.w) - @as(c_int, 1);
                    }
                    if (closest_y < scaled_mouse_rect.y) {
                        closest_y = scaled_mouse_rect.y;
                    } else if (closest_y >= (scaled_mouse_rect.y + scaled_mouse_rect.h)) {
                        closest_y = (scaled_mouse_rect.y + scaled_mouse_rect.h) - @as(c_int, 1);
                    }
                    Wayland_SeatWarpMouse(seat, w, @floatFromInt(closest_x), @floatFromInt(closest_y));
                }
            }
            if ((confine_rect != null) or ((window.*.flags & @as(c_ulong, 256)) != 0)) {
                if ((window.*.mouse_rect.w != @as(c_int, 1)) and (window.*.mouse_rect.h != @as(c_int, 1))) {
                    seat.*.pointer.confined_pointer = zwp_pointer_constraints_v1_confine_pointer(display.*.pointer_constraints, w.*.surface, seat.*.pointer.wl_pointer, confine_rect, ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT);
                    _ = zwp_confined_pointer_v1_add_listener(seat.*.pointer.confined_pointer, &confined_pointer_listener, @ptrCast(@alignCast(seat)));
                } else {
                    seat.*.pointer.locked_pointer = zwp_pointer_constraints_v1_lock_pointer(display.*.pointer_constraints, w.*.surface, seat.*.pointer.wl_pointer, null, ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT);
                    _ = zwp_locked_pointer_v1_add_listener(seat.*.pointer.locked_pointer, &locked_pointer_listener, @ptrCast(@alignCast(seat)));
                }
                if (confine_rect != null) {
                    wl_region_destroy(confine_rect);
                }
            }
        }
    }
}
pub export fn Wayland_DisplayUpdatePointerGrabs(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (!(window != null) or (seat.*.pointer.focus == window)) {
                Wayland_SeatUpdatePointerGrab(seat);
            }
        }
    }
}
pub export fn Wayland_DisplayUpdateKeyboardGrabs(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&display.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&display.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (!(window != null) or (seat.*.keyboard.focus == window)) {
                Wayland_SeatUpdateKeyboardGrab(seat);
            }
        }
    }
}
pub export fn Wayland_UpdateImplicitGrabSerial(seat: [*c]SDL_WaylandSeat, serial: Uint32) void {
    @setEvalBranchQuota(100000);
    if (serial > seat.*.last_implicit_grab_serial) {
        seat.*.last_implicit_grab_serial = serial;
        seat.*.display.*.last_implicit_grab_seat = seat;
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDLK_UNKNOWN = @as(c_uint, 0x00000000);
pub const SDLK_RETURN = @as(c_uint, 0x0000000d);
pub const SDLK_ESCAPE = @as(c_uint, 0x0000001b);
pub const SDLK_BACKSPACE = @as(c_uint, 0x00000008);
pub const SDLK_DELETE = @as(c_uint, 0x0000007f);
pub const SDLK_LCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e0, .hex);
pub const SDLK_LSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e1, .hex);
pub const SDLK_LALT = __helpers.promoteIntLiteral(c_uint, 0x400000e2, .hex);
pub const SDLK_LGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e3, .hex);
pub const SDLK_RCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e4, .hex);
pub const SDLK_RSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e5, .hex);
pub const SDLK_RALT = __helpers.promoteIntLiteral(c_uint, 0x400000e6, .hex);
pub const SDLK_RGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e7, .hex);
pub const SDLK_MODE = __helpers.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDLK_LEVEL5_SHIFT = __helpers.promoteIntLiteral(c_uint, 0x20000002, .hex);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LEVEL5 = @as(c_uint, 0x0004);
pub const SDL_KMOD_LCTRL = @as(c_uint, 0x0040);
pub const SDL_KMOD_RCTRL = @as(c_uint, 0x0080);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_LGUI = @as(c_uint, 0x0400);
pub const SDL_KMOD_RGUI = @as(c_uint, 0x0800);
pub const SDL_KMOD_NUM = @as(c_uint, 0x1000);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const SDL_BUTTON_LEFT = @as(c_int, 1);
pub const SDL_BUTTON_MIDDLE = @as(c_int, 2);
pub const SDL_BUTTON_RIGHT = @as(c_int, 3);
pub const SDL_BUTTON_X1 = @as(c_int, 4);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const SDL_IOR_READ = @as(c_int, 0x1);
pub const SDL_IOR_WRITE = @as(c_int, 0x2);
pub const SDL_IOR_NO_RETRY = @as(c_int, 0x4);
pub const XKB_KEY_NoSymbol = @as(c_int, 0x000000);
pub const WL_DISPLAY_SYNC = @as(c_int, 0);
pub const WL_COMPOSITOR_CREATE_REGION = @as(c_int, 1);
pub const WL_DATA_OFFER_ACCEPT = @as(c_int, 0);
pub const WL_DATA_OFFER_FINISH = @as(c_int, 3);
pub const WL_DATA_OFFER_SET_ACTIONS = @as(c_int, 4);
pub const WL_DATA_OFFER_FINISH_SINCE_VERSION = @as(c_int, 3);
pub const WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION = @as(c_int, 3);
pub const WL_DATA_DEVICE_RELEASE = @as(c_int, 2);
pub const WL_DATA_DEVICE_RELEASE_SINCE_VERSION = @as(c_int, 2);
pub const WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE = @as(c_int, 1);
pub const WL_SEAT_GET_POINTER = @as(c_int, 0);
pub const WL_SEAT_GET_KEYBOARD = @as(c_int, 1);
pub const WL_SEAT_GET_TOUCH = @as(c_int, 2);
pub const WL_SEAT_RELEASE = @as(c_int, 3);
pub const WL_SEAT_RELEASE_SINCE_VERSION = @as(c_int, 5);
pub const WL_POINTER_RELEASE = @as(c_int, 1);
pub const WL_POINTER_FRAME_SINCE_VERSION = @as(c_int, 5);
pub const WL_POINTER_RELEASE_SINCE_VERSION = @as(c_int, 3);
pub const WL_KEYBOARD_RELEASE = @as(c_int, 0);
pub const WL_KEYBOARD_RELEASE_SINCE_VERSION = @as(c_int, 3);
pub const WL_TOUCH_RELEASE = @as(c_int, 0);
pub const WL_TOUCH_RELEASE_SINCE_VERSION = @as(c_int, 3);
pub const WL_REGION_DESTROY = @as(c_int, 0);
pub const WL_REGION_ADD = @as(c_int, 1);
pub const ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER = @as(c_int, 1);
pub const ZWP_POINTER_CONSTRAINTS_V1_CONFINE_POINTER = @as(c_int, 2);
pub const ZWP_LOCKED_POINTER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_CONFINED_POINTER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_RELATIVE_POINTER_MANAGER_V1_GET_RELATIVE_POINTER = @as(c_int, 1);
pub const ZWP_RELATIVE_POINTER_V1_DESTROY = @as(c_int, 0);
pub const XDG_TOPLEVEL_MOVE = @as(c_int, 5);
pub const XDG_TOPLEVEL_RESIZE = @as(c_int, 6);
pub const ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INHIBIT_SHORTCUTS = @as(c_int, 1);
pub const ZWP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_DESTROY = @as(c_int, 0);
pub const ZWP_TEXT_INPUT_V3_DESTROY = @as(c_int, 0);
pub const ZWP_TEXT_INPUT_MANAGER_V3_GET_TEXT_INPUT = @as(c_int, 1);
pub const ZWP_TABLET_MANAGER_V2_GET_TABLET_SEAT = @as(c_int, 0);
pub const ZWP_TABLET_SEAT_V2_DESTROY = @as(c_int, 0);
pub const ZWP_TABLET_TOOL_V2_DESTROY = @as(c_int, 1);
pub const ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_GET_DEVICE = @as(c_int, 1);
pub const ZWP_PRIMARY_SELECTION_DEVICE_V1_DESTROY = @as(c_int, 1);
pub const ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_KEYBOARD_TIMESTAMPS = @as(c_int, 1);
pub const ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_POINTER_TIMESTAMPS = @as(c_int, 2);
pub const ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_TOUCH_TIMESTAMPS = @as(c_int, 3);
pub const ZWP_INPUT_TIMESTAMPS_V1_DESTROY = @as(c_int, 0);
pub const ZWP_POINTER_GESTURES_V1_GET_PINCH_GESTURE = @as(c_int, 1);
pub const ZWP_POINTER_GESTURE_PINCH_V1_DESTROY = @as(c_int, 0);
pub const WP_CURSOR_SHAPE_MANAGER_V1_GET_POINTER = @as(c_int, 1);
pub const WP_CURSOR_SHAPE_MANAGER_V1_GET_TABLET_TOOL_V2 = @as(c_int, 2);
pub const BTN_LEFT = @as(c_int, 0x110);
pub const BTN_RIGHT = @as(c_int, 0x111);
pub const BTN_MIDDLE = @as(c_int, 0x112);
pub const BTN_SIDE = @as(c_int, 0x113);
pub const BTN_STYLUS3 = @as(c_int, 0x149);
pub const BTN_STYLUS = @as(c_int, 0x14b);
pub const BTN_STYLUS2 = @as(c_int, 0x14c);
pub const EINTR = @as(c_int, 4);
pub const EAGAIN = @as(c_int, 11);
pub const EPIPE = @as(c_int, 32);
pub const PROT_READ = @as(c_int, 0x1);
pub const MAP_PRIVATE = @as(c_int, 0x02);
pub const WAYLAND_WHEEL_AXIS_UNIT = @as(c_int, 10);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_data_device = struct_wl_data_device;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_callback = struct_wl_callback;
pub const wl_touch = struct_wl_touch;
pub const xdg_toplevel = struct_xdg_toplevel;
pub const wl_data_offer = struct_wl_data_offer;
