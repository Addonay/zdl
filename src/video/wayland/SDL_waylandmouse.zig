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
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn round(__x: f64) f64;
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
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_lround_REAL(x: f64) c_long;
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
pub const struct_SDL_FPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const struct_SDL_FRect = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
};
pub const SDL_FRect = struct_SDL_FRect;
pub inline fn SDL_PointInRectFloat(p: [*c]const SDL_FPoint, r: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    return (if ((((((p != null) and (r != null)) and (p.*.x >= r.*.x)) and (p.*.x <= (r.*.x + r.*.w))) and (p.*.y >= r.*.y)) and (p.*.y <= (r.*.y + r.*.h))) @"true" else @"false") != 0;
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
pub const struct_zwp_pointer_constraints_v1_17 = opaque {
};
pub const struct_wp_pointer_warp_v1_18 = opaque {
};
pub const struct_wp_cursor_shape_manager_v1_19 = opaque {
};
pub const struct_wl_data_device_manager_20 = opaque {
};
pub const struct_zwp_primary_selection_device_manager_v1_21 = opaque {};
pub const struct_zxdg_decoration_manager_v1_22 = opaque {};
pub const struct_zwp_keyboard_shortcuts_inhibit_manager_v1_23 = opaque {};
pub const struct_zwp_idle_inhibit_manager_v1_24 = opaque {};
pub const struct_xdg_activation_v1_25 = opaque {};
pub const struct_zwp_text_input_manager_v3_26 = opaque {};
pub const struct_zxdg_output_manager_v1_27 = opaque {};
pub const struct_wp_viewporter_28 = opaque {
};
pub const struct_wp_fractional_scale_manager_v1_29 = opaque {};
pub const struct_zwp_input_timestamps_manager_v1_30 = opaque {};
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
pub const struct_zwp_locked_pointer_v1_51 = opaque {
};
pub const struct_zwp_confined_pointer_v1_52 = opaque {
};
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
const union_unnamed_58 = extern union {
    custom: Wayland_CustomCursor,
    system: Wayland_SystemCursor,
};
pub const struct_SDL_CursorData = extern struct {
    frame_durations_ms: [*c]Uint32 = null,
    total_duration_ms: Uint32 = 0,
    num_frames: c_int = 0,
    is_system_cursor: bool = false,
    cursor_data: union_unnamed_58 = @import("std").mem.zeroes(union_unnamed_58),
};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_wp_cursor_shape_device_v1_59 = opaque {
};
pub const struct_wp_viewport_60 = opaque {
};
pub const struct_wl_callback = opaque {
};
pub const struct_SDL_WaylandCursorState = extern struct {
    current_cursor: [*c]SDL_CursorData = null,
    cursor_shape: ?*struct_wp_cursor_shape_device_v1_59 = null,
    surface: ?*struct_wl_surface = null,
    viewport: ?*struct_wp_viewport_60 = null,
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
const struct_unnamed_61 = extern struct {
    wl_touch: ?*struct_wl_touch = null,
    timestamps: ?*struct_zwp_input_timestamps_v1_46 = null,
    highres_timestamp_ns: Uint64 = 0,
    points: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const struct_zwp_text_input_v3_63 = opaque {};
const struct_unnamed_62 = extern struct {
    zwp_text_input: ?*struct_zwp_text_input_v3_63 = null,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    enabled: bool = false,
    has_preedit: bool = false,
};
pub const struct_zwp_tablet_seat_v2_65 = opaque {
};
const struct_unnamed_64 = extern struct {
    wl_tablet_seat: ?*struct_zwp_tablet_seat_v2_65 = null,
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
    touch: struct_unnamed_61 = @import("std").mem.zeroes(struct_unnamed_61),
    text_input: struct_unnamed_62 = @import("std").mem.zeroes(struct_unnamed_62),
    tablet: struct_unnamed_64 = @import("std").mem.zeroes(struct_unnamed_64),
};
pub const struct_Wayland_EventThreadContext = opaque {
};
pub const Wayland_EventThreadContext = struct_Wayland_EventThreadContext;
pub const struct_wl_output_66 = opaque {
};
pub const struct_zxdg_output_v1_67 = opaque {};
pub const struct_wp_color_management_output_v1_68 = opaque {};
pub const struct_Wayland_ColorInfoState_69 = opaque {};
const struct_unnamed_70 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_71 = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
};
const struct_unnamed_72 = extern struct {
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
const struct_unnamed_73 = extern struct {
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
const struct_unnamed_74 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_GLDriverData_75 = opaque {};
pub const struct_SDL_EGL_VideoData_76 = opaque {};
pub const struct_SDL_PrivateGLESData_77 = opaque {};
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
    gl_config: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_74 = @import("std").mem.zeroes(struct_unnamed_74),
    internal: [*c]SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_75 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_76 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_77 = null,
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
    output: ?*struct_wl_output_66 = null,
    xdg_output: ?*struct_zxdg_output_v1_67 = null,
    wp_color_management_output: ?*struct_wp_color_management_output_v1_68 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_69 = null,
    wl_output_name: [*c]u8 = null,
    scale_factor: f64 = 0,
    integer_scale_factor: c_int = 0,
    registry_id: Uint32 = 0,
    logical: struct_unnamed_70 = @import("std").mem.zeroes(struct_unnamed_70),
    pixel: struct_unnamed_71 = @import("std").mem.zeroes(struct_unnamed_71),
    physical: struct_unnamed_72 = @import("std").mem.zeroes(struct_unnamed_72),
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
const struct_unnamed_79 = extern struct {
    frame: ?*struct_libdecor_frame = null,
};
pub const struct_xdg_surface = opaque {};
pub const struct_xdg_toplevel = opaque {};
const struct_unnamed_82 = extern struct {
    xdg_toplevel: ?*struct_xdg_toplevel = null,
};
pub const struct_xdg_popup_84 = opaque {};
pub const struct_xdg_positioner_85 = opaque {};
const struct_unnamed_83 = extern struct {
    xdg_popup: ?*struct_xdg_popup_84 = null,
    xdg_positioner: ?*struct_xdg_positioner_85 = null,
};
const union_unnamed_81 = extern union {
    toplevel: struct_unnamed_82,
    popup: struct_unnamed_83,
};
const struct_unnamed_80 = extern struct {
    surface: ?*struct_xdg_surface = null,
    unnamed_0: union_unnamed_81 = @import("std").mem.zeroes(union_unnamed_81),
    serial: Uint32 = 0,
};
const union_unnamed_78 = extern union {
    libdecor: struct_unnamed_79,
    xdg: struct_unnamed_80,
};
const enum_unnamed_86 = c_uint;
const enum_unnamed_87 = c_uint;
const enum_unnamed_88 = c_uint;
const enum_unnamed_89 = c_uint;
const enum_unnamed_90 = c_uint;
pub const struct_wl_egl_window = opaque {
};
pub const EGLSurface = ?*anyopaque;
pub const struct_zxdg_toplevel_decoration_v1_91 = opaque {};
pub const struct_zwp_idle_inhibitor_v1_92 = opaque {};
pub const struct_xdg_activation_token_v1_93 = opaque {};
pub const struct_wp_fractional_scale_v1_94 = opaque {};
pub const struct_zxdg_exported_v2_95 = opaque {};
pub const struct_xdg_dialog_v1_96 = opaque {};
pub const struct_wp_alpha_modifier_surface_v1_97 = opaque {};
pub const struct_xdg_toplevel_icon_v1_98 = opaque {};
pub const struct_frog_color_managed_surface_99 = opaque {};
pub const struct_wp_color_management_surface_feedback_v1_100 = opaque {};
pub const struct_xdg_toplevel_session_v1_101 = opaque {};
pub const struct_wl_buffer = opaque {
};
const struct_unnamed_102 = extern struct {
    x: f64 = 0,
    y: f64 = 0,
};
const struct_unnamed_103 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
};
const struct_unnamed_104 = extern struct {
    logical_width: c_int = 0,
    logical_height: c_int = 0,
    pixel_width: c_int = 0,
    pixel_height: c_int = 0,
    viewport_width: c_int = 0,
    viewport_height: c_int = 0,
};
const struct_unnamed_105 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    insets_apply: bool = false,
};
const struct_unnamed_106 = extern struct {
    min_width: c_int = 0,
    min_height: c_int = 0,
};
const struct_unnamed_107 = extern struct {
    width: c_int = 0,
    height: c_int = 0,
};
pub const struct_wl_subsurface = opaque {
};
const struct_unnamed_108 = extern struct {
    surface: ?*struct_wl_surface = null,
    subsurface: ?*struct_wl_subsurface = null,
    buffer: ?*struct_wl_buffer = null,
    viewport: ?*struct_wp_viewport_60 = null,
    offset_x: c_int = 0,
    offset_y: c_int = 0,
    mapped: bool = false,
    @"opaque": bool = false,
};
const struct_unnamed_109 = extern struct {
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
    shell_surface: union_unnamed_78 = @import("std").mem.zeroes(union_unnamed_78),
    shell_surface_type: enum_unnamed_86 = @import("std").mem.zeroes(enum_unnamed_86),
    shell_surface_status: enum_unnamed_87 = @import("std").mem.zeroes(enum_unnamed_87),
    wm_caps: enum_unnamed_88 = @import("std").mem.zeroes(enum_unnamed_88),
    toplevel_constraints: enum_unnamed_89 = @import("std").mem.zeroes(enum_unnamed_89),
    resize_edge: enum_unnamed_90 = @import("std").mem.zeroes(enum_unnamed_90),
    egl_window: ?*struct_wl_egl_window = null,
    egl_surface: EGLSurface = null,
    server_decoration: ?*struct_zxdg_toplevel_decoration_v1_91 = null,
    idle_inhibitor: ?*struct_zwp_idle_inhibitor_v1_92 = null,
    activation_token: ?*struct_xdg_activation_token_v1_93 = null,
    viewport: ?*struct_wp_viewport_60 = null,
    fractional_scale: ?*struct_wp_fractional_scale_v1_94 = null,
    exported: ?*struct_zxdg_exported_v2_95 = null,
    xdg_dialog_v1: ?*struct_xdg_dialog_v1_96 = null,
    wp_alpha_modifier_surface_v1: ?*struct_wp_alpha_modifier_surface_v1_97 = null,
    xdg_toplevel_icon_v1: ?*struct_xdg_toplevel_icon_v1_98 = null,
    frog_color_managed_surface: ?*struct_frog_color_managed_surface_99 = null,
    wp_color_management_surface_feedback: ?*struct_wp_color_management_surface_feedback_v1_100 = null,
    xdg_toplevel_session: ?*struct_xdg_toplevel_session_v1_101 = null,
    color_info_state: ?*struct_Wayland_ColorInfoState_69 = null,
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
    pointer_scale: struct_unnamed_102 = @import("std").mem.zeroes(struct_unnamed_102),
    requested: struct_unnamed_103 = @import("std").mem.zeroes(struct_unnamed_103),
    current: struct_unnamed_104 = @import("std").mem.zeroes(struct_unnamed_104),
    last_configure: struct_unnamed_105 = @import("std").mem.zeroes(struct_unnamed_105),
    system_limits: struct_unnamed_106 = @import("std").mem.zeroes(struct_unnamed_106),
    toplevel_bounds: struct_unnamed_107 = @import("std").mem.zeroes(struct_unnamed_107),
    mask: struct_unnamed_108 = @import("std").mem.zeroes(struct_unnamed_108),
    text_input_props: struct_unnamed_109 = @import("std").mem.zeroes(struct_unnamed_109),
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
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: [*c]SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const SDL_SYSTEM_CURSOR_DEFAULT: c_int = 0;
pub const SDL_SYSTEM_CURSOR_TEXT: c_int = 1;
pub const SDL_SYSTEM_CURSOR_WAIT: c_int = 2;
pub const SDL_SYSTEM_CURSOR_CROSSHAIR: c_int = 3;
pub const SDL_SYSTEM_CURSOR_PROGRESS: c_int = 4;
pub const SDL_SYSTEM_CURSOR_NWSE_RESIZE: c_int = 5;
pub const SDL_SYSTEM_CURSOR_NESW_RESIZE: c_int = 6;
pub const SDL_SYSTEM_CURSOR_EW_RESIZE: c_int = 7;
pub const SDL_SYSTEM_CURSOR_NS_RESIZE: c_int = 8;
pub const SDL_SYSTEM_CURSOR_MOVE: c_int = 9;
pub const SDL_SYSTEM_CURSOR_NOT_ALLOWED: c_int = 10;
pub const SDL_SYSTEM_CURSOR_POINTER: c_int = 11;
pub const SDL_SYSTEM_CURSOR_NW_RESIZE: c_int = 12;
pub const SDL_SYSTEM_CURSOR_N_RESIZE: c_int = 13;
pub const SDL_SYSTEM_CURSOR_NE_RESIZE: c_int = 14;
pub const SDL_SYSTEM_CURSOR_E_RESIZE: c_int = 15;
pub const SDL_SYSTEM_CURSOR_SE_RESIZE: c_int = 16;
pub const SDL_SYSTEM_CURSOR_S_RESIZE: c_int = 17;
pub const SDL_SYSTEM_CURSOR_SW_RESIZE: c_int = 18;
pub const SDL_SYSTEM_CURSOR_W_RESIZE: c_int = 19;
pub const SDL_SYSTEM_CURSOR_CONTEXT_MENU: c_int = 20;
pub const SDL_SYSTEM_CURSOR_HELP: c_int = 21;
pub const SDL_SYSTEM_CURSOR_CELL: c_int = 22;
pub const SDL_SYSTEM_CURSOR_VERTICAL_TEXT: c_int = 23;
pub const SDL_SYSTEM_CURSOR_ALIAS: c_int = 24;
pub const SDL_SYSTEM_CURSOR_COPY: c_int = 25;
pub const SDL_SYSTEM_CURSOR_NO_DROP: c_int = 26;
pub const SDL_SYSTEM_CURSOR_GRAB: c_int = 27;
pub const SDL_SYSTEM_CURSOR_GRABBING: c_int = 28;
pub const SDL_SYSTEM_CURSOR_COL_RESIZE: c_int = 29;
pub const SDL_SYSTEM_CURSOR_ROW_RESIZE: c_int = 30;
pub const SDL_SYSTEM_CURSOR_ALL_SCROLL: c_int = 31;
pub const SDL_SYSTEM_CURSOR_ZOOM_IN: c_int = 32;
pub const SDL_SYSTEM_CURSOR_ZOOM_OUT: c_int = 33;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const struct_SDL_CursorFrameInfo = extern struct {
    surface: [*c]SDL_Surface = null,
    duration: Uint32 = 0,
};
pub const SDL_CursorFrameInfo = struct_SDL_CursorFrameInfo;
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub const SDL_PenID = Uint32;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub extern fn SDL_GetTicks_REAL() Uint64;
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
pub extern fn SDL_RelativeToGlobalForWindow(window: [*c]SDL_Window, rel_x: c_int, rel_y: c_int, abs_x: [*c]c_int, abs_y: [*c]c_int) void;
pub extern fn SDL_GetCSSCursorName(id: SDL_SystemCursor, fallback_name: [*c][*c]const u8) [*c]const u8;
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
pub extern fn SDL_RedrawCursor() void;
pub extern fn SDL_SetDefaultCursor(cursor: [*c]SDL_Cursor) void;
pub extern fn SDL_GetDefaultSystemCursor() SDL_SystemCursor;
pub extern fn SDL_SendMouseWarp(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32) void;
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
pub fn wl_fixed_from_double(d: f64) callconv(.c) wl_fixed_t {
    @setEvalBranchQuota(100000);
    return @intFromFloat(round(d * @as(f64, 256.0)));
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
pub const DBUS_HANDLER_RESULT_HANDLED: c_int = 0;
pub const DBUS_HANDLER_RESULT_NOT_YET_HANDLED: c_int = 1;
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
pub extern fn Wayland_CreateEventThreadProxyWrapper(context: ?*Wayland_EventThreadContext, obj: ?*anyopaque) ?*anyopaque;
pub extern fn Wayland_LockEventThread(context: ?*Wayland_EventThreadContext) void;
pub extern fn Wayland_UnlockEventThread(context: ?*Wayland_EventThreadContext) void;
pub const struct_wl_cursor_theme_116 = opaque {
};
pub const SDL_WaylandCursorTheme = extern struct {
    theme: ?*struct_wl_cursor_theme_116 = null,
    size: c_int = 0,
};
pub const struct_wl_proxy = opaque {
};
pub const struct_wl_cursor_image = extern struct {
    width: u32 = 0,
    height: u32 = 0,
    hotspot_x: u32 = 0,
    hotspot_y: u32 = 0,
    delay: u32 = 0,
};
pub const struct_wl_cursor = extern struct {
    image_count: c_uint = 0,
    images: [*c][*c]struct_wl_cursor_image = null,
    name: [*c]u8 = null,
};
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub extern var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub extern var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version;
pub const SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern var WAYLAND_wl_proxy_wrapper_destroy: SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy;
pub const SDL_DYNWAYLANDFN_wl_list_init = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_init: SDL_DYNWAYLANDFN_wl_list_init;
pub const SDL_DYNWAYLANDFN_wl_list_insert = ?*const fn ([*c]struct_wl_list, [*c]struct_wl_list) callconv(.c) void;
pub extern var WAYLAND_wl_list_insert: SDL_DYNWAYLANDFN_wl_list_insert;
pub const SDL_DYNWAYLANDFN_wl_list_empty = ?*const fn ([*c]const struct_wl_list) callconv(.c) c_int;
pub extern var WAYLAND_wl_list_empty: SDL_DYNWAYLANDFN_wl_list_empty;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub extern var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_load = ?*const fn ([*c]const u8, c_int, ?*struct_wl_shm_11) callconv(.c) ?*struct_wl_cursor_theme_116;
pub extern var WAYLAND_wl_cursor_theme_load: SDL_DYNWAYLANDFN_wl_cursor_theme_load;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_destroy = ?*const fn (?*struct_wl_cursor_theme_116) callconv(.c) void;
pub extern var WAYLAND_wl_cursor_theme_destroy: SDL_DYNWAYLANDFN_wl_cursor_theme_destroy;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_get_cursor = ?*const fn (?*struct_wl_cursor_theme_116, [*c]const u8) callconv(.c) [*c]struct_wl_cursor;
pub extern var WAYLAND_wl_cursor_theme_get_cursor: SDL_DYNWAYLANDFN_wl_cursor_theme_get_cursor;
pub const SDL_DYNWAYLANDFN_wl_cursor_image_get_buffer = ?*const fn ([*c]struct_wl_cursor_image) callconv(.c) ?*struct_wl_buffer;
pub extern var WAYLAND_wl_cursor_image_get_buffer: SDL_DYNWAYLANDFN_wl_cursor_image_get_buffer;
pub const struct_wl_data_offer = opaque {
};
pub const struct_wl_data_source = opaque {
};
pub const struct_wl_region = opaque {
};
pub extern const wl_callback_interface: struct_wl_interface;
pub extern const wl_surface_interface: struct_wl_interface;
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
pub fn wl_compositor_create_surface(wl_compositor: ?*struct_wl_compositor_10) callconv(.c) ?*struct_wl_surface {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_compositor)), WL_COMPOSITOR_CREATE_SURFACE, &wl_surface_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_compositor))), 0, @as(?*anyopaque, null));
    return @ptrCast(@alignCast(id));
}
pub fn wl_buffer_destroy(wl_buffer_1: ?*struct_wl_buffer) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_buffer_1)), WL_BUFFER_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_buffer_1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
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
pub fn wl_surface_commit(wl_surface_1: ?*struct_wl_surface) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_COMMIT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0);
}
pub fn wl_surface_damage_buffer(wl_surface_1: ?*struct_wl_surface, x: i32, y: i32, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_surface_1)), WL_SURFACE_DAMAGE_BUFFER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_surface_1))), 0, x, y, width, height);
}
pub fn wl_pointer_get_version(wl_pointer_1: ?*struct_wl_pointer) callconv(.c) u32 {
    @setEvalBranchQuota(100000);
    return WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_pointer_1)));
}
pub fn wl_pointer_set_cursor(wl_pointer_1: ?*struct_wl_pointer, serial: u32, surface: ?*struct_wl_surface, hotspot_x: i32, hotspot_y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wl_pointer_1)), WL_POINTER_SET_CURSOR, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wl_pointer_1))), 0, serial, surface, hotspot_x, hotspot_y);
}
pub const SDL_PenCapabilityFlags = Uint32;
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
pub const struct_Wayland_SHMPool = opaque {
};
pub const Wayland_SHMPool = struct_Wayland_SHMPool;
pub extern fn Wayland_AllocSHMPool(size: c_int) ?*Wayland_SHMPool;
pub extern fn Wayland_AllocBufferFromPool(shmPool: ?*Wayland_SHMPool, width: c_int, height: c_int, data: [*c]?*anyopaque) ?*struct_wl_buffer;
pub extern fn Wayland_ReleaseSHMPool(shmPool: ?*Wayland_SHMPool) void;
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
pub const struct_zwp_primary_selection_source_v1_117 = opaque {};
pub const SDL_WaylandPrimarySelectionSource = extern struct {
    source: ?*struct_zwp_primary_selection_source_v1_117 = null,
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
pub const struct_zwp_primary_selection_offer_v1_118 = opaque {};
pub const SDL_WaylandPrimarySelectionOffer = extern struct {
    offer: ?*struct_zwp_primary_selection_offer_v1_118 = null,
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
pub const struct_zwp_tablet_tool_v2_119 = opaque {
};
const enum_unnamed_121 = c_uint;
const enum_unnamed_122 = c_uint;
const struct_unnamed_120 = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    axes: [7]f32 = @import("std").mem.zeroes([7]f32),
    axes_set: Uint32 = 0,
    buttons: [3]enum_unnamed_121 = @import("std").mem.zeroes([3]enum_unnamed_121),
    tool_state: enum_unnamed_122 = @import("std").mem.zeroes(enum_unnamed_122),
    in_proximity: bool = false,
    have_motion: bool = false,
    have_proximity: bool = false,
};
pub const struct_SDL_WaylandPenTool = extern struct {
    instance_id: SDL_PenID = 0,
    info: SDL_PenInfo = @import("std").mem.zeroes(SDL_PenInfo),
    focus: [*c]SDL_WindowData = null,
    wltool: ?*struct_zwp_tablet_tool_v2_119 = null,
    proximity_serial: Uint32 = 0,
    frame: struct_unnamed_120 = @import("std").mem.zeroes(struct_unnamed_120),
    cursor_state: SDL_WaylandCursorState = @import("std").mem.zeroes(SDL_WaylandCursorState),
    link: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub const SDL_WaylandPenTool = struct_SDL_WaylandPenTool;
pub const SDL_WaylandSeat = struct_SDL_WaylandSeat;
pub extern fn Wayland_SeatUpdatePointerGrab(seat: [*c]SDL_WaylandSeat) void;
pub extern fn Wayland_DisplayUpdatePointerGrabs(display: [*c]SDL_VideoData, window: [*c]SDL_WindowData) void;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_DEFAULT: c_int = 1;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CONTEXT_MENU: c_int = 2;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_HELP: c_int = 3;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_POINTER: c_int = 4;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_PROGRESS: c_int = 5;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_WAIT: c_int = 6;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CELL: c_int = 7;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CROSSHAIR: c_int = 8;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_TEXT: c_int = 9;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_VERTICAL_TEXT: c_int = 10;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALIAS: c_int = 11;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COPY: c_int = 12;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_MOVE: c_int = 13;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NO_DROP: c_int = 14;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NOT_ALLOWED: c_int = 15;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRAB: c_int = 16;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRABBING: c_int = 17;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_E_RESIZE: c_int = 18;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_N_RESIZE: c_int = 19;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NE_RESIZE: c_int = 20;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NW_RESIZE: c_int = 21;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_S_RESIZE: c_int = 22;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SE_RESIZE: c_int = 23;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SW_RESIZE: c_int = 24;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_W_RESIZE: c_int = 25;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_EW_RESIZE: c_int = 26;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NS_RESIZE: c_int = 27;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NESW_RESIZE: c_int = 28;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NWSE_RESIZE: c_int = 29;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COL_RESIZE: c_int = 30;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ROW_RESIZE: c_int = 31;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALL_SCROLL: c_int = 32;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_IN: c_int = 33;
pub const WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_OUT: c_int = 34;
pub const enum_wp_cursor_shape_device_v1_shape = c_uint;
pub fn wp_cursor_shape_device_v1_destroy(wp_cursor_shape_device_v1: ?*struct_wp_cursor_shape_device_v1_59) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_cursor_shape_device_v1)), WP_CURSOR_SHAPE_DEVICE_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_cursor_shape_device_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_cursor_shape_device_v1_set_shape(wp_cursor_shape_device_v1: ?*struct_wp_cursor_shape_device_v1_59, serial: u32, shape: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_cursor_shape_device_v1)), WP_CURSOR_SHAPE_DEVICE_V1_SET_SHAPE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_cursor_shape_device_v1))), 0, serial, shape);
}
pub extern const zwp_locked_pointer_v1_interface: struct_wl_interface;
pub const ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_ONESHOT: c_int = 1;
pub fn zwp_pointer_constraints_v1_lock_pointer(zwp_pointer_constraints_v1: ?*struct_zwp_pointer_constraints_v1_17, surface: ?*struct_wl_surface, pointer: ?*struct_wl_pointer, region: ?*struct_wl_region, lifetime: u32) callconv(.c) ?*struct_zwp_locked_pointer_v1_51 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1)), ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER, &zwp_locked_pointer_v1_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_pointer_constraints_v1))), 0, @as(?*anyopaque, null), surface, pointer, region, lifetime);
    return @ptrCast(@alignCast(id));
}
pub fn zwp_locked_pointer_v1_destroy(zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_locked_pointer_v1)), ZWP_LOCKED_POINTER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_locked_pointer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn zwp_locked_pointer_v1_set_cursor_position_hint(zwp_locked_pointer_v1: ?*struct_zwp_locked_pointer_v1_51, surface_x: wl_fixed_t, surface_y: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_locked_pointer_v1)), ZWP_LOCKED_POINTER_V1_SET_CURSOR_POSITION_HINT, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_locked_pointer_v1))), 0, surface_x, surface_y);
}
pub fn zwp_confined_pointer_v1_destroy(zwp_confined_pointer_v1: ?*struct_zwp_confined_pointer_v1_52) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_confined_pointer_v1)), ZWP_CONFINED_POINTER_V1_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_confined_pointer_v1))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub extern const wp_viewport_interface: struct_wl_interface;
pub fn wp_viewporter_get_viewport(wp_viewporter: ?*struct_wp_viewporter_28, surface: ?*struct_wl_surface) callconv(.c) ?*struct_wp_viewport_60 {
    @setEvalBranchQuota(100000);
    var id: ?*struct_wl_proxy = undefined;
    _ = &id;
    id = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewporter)), WP_VIEWPORTER_GET_VIEWPORT, &wp_viewport_interface, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewporter))), 0, @as(?*anyopaque, null), surface);
    return @ptrCast(@alignCast(id));
}
pub fn wp_viewport_destroy(wp_viewport: ?*struct_wp_viewport_60) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_DESTROY, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), @bitCast(@as(c_int, @as(c_int, 1) << @intCast(@as(c_int, 0)))));
}
pub fn wp_viewport_set_source(wp_viewport: ?*struct_wp_viewport_60, x: wl_fixed_t, y: wl_fixed_t, width: wl_fixed_t, height: wl_fixed_t) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_SET_SOURCE, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), 0, x, y, width, height);
}
pub fn wp_viewport_set_destination(wp_viewport: ?*struct_wp_viewport_60, width: i32, height: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_viewport)), WP_VIEWPORT_SET_DESTINATION, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_viewport))), 0, width, height);
}
pub fn wp_pointer_warp_v1_warp_pointer(wp_pointer_warp_v1: ?*struct_wp_pointer_warp_v1_18, surface: ?*struct_wl_surface, pointer: ?*struct_wl_pointer, x: wl_fixed_t, y: wl_fixed_t, serial: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(wp_pointer_warp_v1)), WP_POINTER_WARP_V1_WARP_POINTER, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(wp_pointer_warp_v1))), 0, surface, pointer, x, y, serial);
}
pub fn zwp_tablet_tool_v2_set_cursor(zwp_tablet_tool_v2: ?*struct_zwp_tablet_tool_v2_119, serial: u32, surface: ?*struct_wl_surface, hotspot_x: i32, hotspot_y: i32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = WAYLAND_wl_proxy_marshal_flags.?(@ptrCast(@alignCast(zwp_tablet_tool_v2)), ZWP_TABLET_TOOL_V2_SET_CURSOR, null, WAYLAND_wl_proxy_get_version.?(@ptrCast(@alignCast(zwp_tablet_tool_v2))), 0, serial, surface, hotspot_x, hotspot_y);
}
pub var sys_cursors: [10][*c]SDL_Cursor = @import("std").mem.zeroes([10][*c]SDL_Cursor);
pub const CustomCursorImage = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    buffer: ?*struct_wl_buffer = null,
};
pub const Wayland_CustomCursor = extern struct {
    width: c_int = 0,
    height: c_int = 0,
    hot_x: c_int = 0,
    hot_y: c_int = 0,
    images_per_frame: c_int = 0,
    _images: [0]CustomCursorImage = @import("std").mem.zeroes([0]CustomCursorImage),
    pub fn images(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._images)).array.child) {
        return @ptrCast(@alignCast(&_self.*._images));
    }
};
pub const Wayland_CachedSystemCursor = extern struct {
    size: c_int = 0,
    node: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
    _buffers: [0]?*struct_wl_buffer = @import("std").mem.zeroes([0]?*struct_wl_buffer),
    pub fn buffers(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._buffers)).array.child) {
        return @ptrCast(@alignCast(&_self.*._buffers));
    }
};
pub const Wayland_SystemCursor = extern struct {
    id: SDL_SystemCursor = @import("std").mem.zeroes(SDL_SystemCursor),
    cursor_buffer_cache: struct_wl_list = @import("std").mem.zeroes(struct_wl_list),
};
pub var dbus_cursor_size: c_int = 0;
pub var dbus_cursor_theme: [*c]u8 = null;
pub fn Wayland_FreeCursorThemes(vdata: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vdata.*.num_cursor_themes) : (i += 1) {
            WAYLAND_wl_cursor_theme_destroy.?(vdata.*.cursor_themes[@bitCast(@as(isize, @intCast(i)))].theme);
        }
    }
    vdata.*.num_cursor_themes = 0;
    SDL_free_REAL(@ptrCast(@alignCast(vdata.*.cursor_themes)));
    vdata.*.cursor_themes = null;
}
pub fn Wayland_ReadDBusProperty(dbus: [*c]SDL_DBusContext, arg_key: [*c]const u8) callconv(.c) ?*DBusMessage {
    @setEvalBranchQuota(100000);
    var key = arg_key;
    _ = &key;
    const static_local_iface = struct {
        var iface: [*c]const u8 = "org.gnome.desktop.interface";
    };
    _ = &static_local_iface;
    var reply: ?*DBusMessage = null;
    _ = &reply;
    var msg: ?*DBusMessage = dbus.*.message_new_method_call.?("org.freedesktop.portal.Desktop", "/org/freedesktop/portal/desktop", "org.freedesktop.portal.Settings", "Read");
    _ = &msg;
    if (msg != null) {
        if (dbus.*.message_append_args.?(msg, @as(c_int, 's'), &static_local_iface.iface, @as(c_int, 's'), &key, @as(c_int, '\x00')) != 0) {
            reply = dbus.*.connection_send_with_reply_and_block.?(dbus.*.session_conn, msg, -@as(c_int, 1), null);
        }
        dbus.*.message_unref.?(msg);
    }
    return reply;
}
pub fn Wayland_ParseDBusReply(dbus: [*c]SDL_DBusContext, reply: ?*DBusMessage, arg_type: c_int, value: ?*anyopaque) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var iter: [3]DBusMessageIter = undefined;
    _ = &iter;
    _ = dbus.*.message_iter_init.?(reply, &iter[@as(c_int, 0)]);
    if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 0)]) != @as(c_int, 'v')) {
        return @"false" != 0;
    }
    dbus.*.message_iter_recurse.?(&iter[@as(c_int, 0)], &iter[@as(c_int, 1)]);
    if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 1)]) != @as(c_int, 'v')) {
        return @"false" != 0;
    }
    dbus.*.message_iter_recurse.?(&iter[@as(c_int, 1)], &iter[@as(c_int, 2)]);
    if (dbus.*.message_iter_get_arg_type.?(&iter[@as(c_int, 2)]) != @"type") {
        return @"false" != 0;
    }
    dbus.*.message_iter_get_basic.?(&iter[@as(c_int, 2)], value);
    return @"true" != 0;
}
pub fn Wayland_DBusCursorMessageFilter(_: ?*DBusConnection, msg: ?*DBusMessage, data: ?*anyopaque) callconv(.c) DBusHandlerResult {
    @setEvalBranchQuota(100000);
    var dbus: [*c]SDL_DBusContext = undefined;
    _ = &dbus;
    var vdata: [*c]SDL_VideoData = undefined;
    _ = &vdata;
    var signal_iter: DBusMessageIter = undefined;
    _ = &signal_iter;
    var variant_iter: DBusMessageIter = undefined;
    _ = &variant_iter;
    var namespace: [*c]const u8 = undefined;
    _ = &namespace;
    var key: [*c]const u8 = undefined;
    _ = &key;
    var new_cursor_size: c_int = undefined;
    _ = &new_cursor_size;
    var new_cursor_theme: [*c]const u8 = undefined;
    _ = &new_cursor_theme;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                dbus = SDL_DBus_GetContext();
                vdata = @ptrCast(@alignCast(data));
                if (dbus.*.message_is_signal.?(msg, "org.freedesktop.portal.Settings", "SettingChanged") != 0) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
            },
            2 => {
                _ = dbus.*.message_iter_init.?(msg, &signal_iter);
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
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
                {
                    sdl_pc = 1;
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&namespace)));
                if (SDL_strcmp_REAL("org.gnome.desktop.interface", namespace) != @as(c_int, 0)) {
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
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 's')) {
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
                dbus.*.message_iter_get_basic.?(&signal_iter, @ptrCast(@alignCast(&key)));
                if (SDL_strcmp_REAL("cursor-size", key) == @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            18 => {
                if (SDL_strcmp_REAL("cursor-theme", key) == @as(c_int, 0)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            19 => {
                return DBUS_HANDLER_RESULT_HANDLED;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 'v')) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
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
                dbus.*.message_iter_recurse.?(&signal_iter, &variant_iter);
                if (dbus.*.message_iter_get_arg_type.?(&variant_iter) != @as(c_int, 'i')) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
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
                dbus.*.message_iter_get_basic.?(&variant_iter, @ptrCast(@alignCast(&new_cursor_size)));
                if (dbus_cursor_size != new_cursor_size) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                dbus_cursor_size = new_cursor_size;
                SDL_RedrawCursor();
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
                    sdl_pc = 19;
                    continue;
                }
            },
            32 => {
                new_cursor_theme = null;
                if (!(dbus.*.message_iter_next.?(&signal_iter) != 0)) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 19;
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
                if (dbus.*.message_iter_get_arg_type.?(&signal_iter) != @as(c_int, 'v')) {
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
                dbus.*.message_iter_recurse.?(&signal_iter, &variant_iter);
                if (dbus.*.message_iter_get_arg_type.?(&variant_iter) != @as(c_int, 's')) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 1;
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
                dbus.*.message_iter_get_basic.?(&variant_iter, @ptrCast(@alignCast(&new_cursor_theme)));
                if ((!(dbus_cursor_theme != null) or !(new_cursor_theme != null)) or (SDL_strcmp_REAL(dbus_cursor_theme, new_cursor_theme) != @as(c_int, 0))) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                SDL_free_REAL(@ptrCast(@alignCast(dbus_cursor_theme)));
                if (new_cursor_theme != null) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
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
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            47 => {
                dbus_cursor_theme = SDL_strdup_REAL(new_cursor_theme);
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                dbus_cursor_theme = null;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                Wayland_FreeCursorThemes(vdata);
                SDL_RedrawCursor();
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Wayland_DBusInitCursorProperties(vdata: [*c]SDL_VideoData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var reply: ?*DBusMessage = undefined;
    _ = &reply;
    var dbus: [*c]SDL_DBusContext = SDL_DBus_GetContext();
    _ = &dbus;
    var add_filter: bool = @"false" != 0;
    _ = &add_filter;
    if (!(dbus != null)) {
        return;
    }
    if ((blk: {
        const tmp = Wayland_ReadDBusProperty(dbus, "cursor-size");
        reply = tmp;
        break :blk tmp;
    }) != null) {
        if (Wayland_ParseDBusReply(dbus, reply, @as(c_int, 'i'), @ptrCast(@alignCast(&dbus_cursor_size)))) {
            add_filter = @"true" != 0;
        }
        dbus.*.message_unref.?(reply);
    }
    if ((blk: {
        const tmp = Wayland_ReadDBusProperty(dbus, "cursor-theme");
        reply = tmp;
        break :blk tmp;
    }) != null) {
        var temp: [*c]const u8 = null;
        _ = &temp;
        if (Wayland_ParseDBusReply(dbus, reply, @as(c_int, 's'), @ptrCast(@alignCast(&temp)))) {
            add_filter = @"true" != 0;
            if (temp != null) {
                dbus_cursor_theme = SDL_strdup_REAL(temp);
            }
        }
        dbus.*.message_unref.?(reply);
    }
    if (add_filter) {
        dbus.*.bus_add_match.?(dbus.*.session_conn, "type='signal', interface='org.freedesktop.portal.Settings',member='SettingChanged', arg0='org.gnome.desktop.interface'", null);
        _ = dbus.*.connection_add_filter.?(dbus.*.session_conn, &Wayland_DBusCursorMessageFilter, @ptrCast(@alignCast(vdata)), null);
        dbus.*.connection_flush.?(dbus.*.session_conn);
    }
}
pub fn Wayland_DBusFinishCursorProperties() callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(dbus_cursor_theme)));
    dbus_cursor_theme = null;
}
pub fn Wayland_CursorStateGetFrame(state: [*c]SDL_WaylandCursorState, frame_index: c_int) callconv(.c) ?*struct_wl_buffer {
    @setEvalBranchQuota(100000);
    var data: [*c]SDL_CursorData = state.*.current_cursor;
    _ = &data;
    if (data != null) {
        if (!data.*.is_system_cursor) {
            const offset: c_int = data.*.cursor_data.custom.images_per_frame * frame_index;
            _ = &offset;
            var closest: [*c]CustomCursorImage = null;
            _ = &closest;
            const target_area: c_int = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(data.*.cursor_data.custom.width * data.*.cursor_data.custom.height)) * state.*.scale));
            _ = &target_area;
            var closest_area: c_int = 0;
            _ = &closest_area;
            {
                var i: c_int = 0;
                _ = &i;
                while (((i < data.*.cursor_data.custom.images_per_frame) and (closest_area < target_area)) and (data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(offset + i)))].buffer != null)) : (i += 1) {
                    closest = &data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(offset + i)))];
                    closest_area = closest.*.width * closest.*.height;
                }
            }
            return @ptrCast(@alignCast(if (closest != null) @as(?*anyopaque, @ptrCast(@alignCast(closest.*.buffer))) else @as(?*anyopaque, null)));
        } else {
            return @as([*c]Wayland_CachedSystemCursor, @ptrCast(@alignCast(state.*.system_cursor_handle))).*.buffers()[@bitCast(@as(isize, @intCast(frame_index)))];
        }
    }
    return null;
}
pub const cursor_frame_listener: struct_wl_callback_listener = struct_wl_callback_listener{
    .done = cursor_frame_done,
};
pub fn cursor_frame_done(data: ?*anyopaque, cb: ?*struct_wl_callback, _: u32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_WaylandCursorState = @ptrCast(@alignCast(data));
    _ = &state;
    if (!(state.*.current_cursor != null)) {
        return;
    }
    var frames: [*c]Uint32 = state.*.current_cursor.*.frame_durations_ms;
    _ = &frames;
    var c: [*c]SDL_CursorData = state.*.current_cursor;
    _ = &c;
    const now: Uint64 = SDL_GetTicks_REAL();
    _ = &now;
    const elapsed: Uint32 = @truncate((now -% state.*.last_frame_callback_time_ms) % @as(Uint64, c.*.total_duration_ms));
    _ = &elapsed;
    var advance: Uint32 = 0;
    _ = &advance;
    var next: c_int = state.*.current_frame;
    _ = &next;
    state.*.current_frame_time_ms +%= elapsed;
    {
        var t: Uint32 = frames[@bitCast(@as(isize, @intCast(next)))];
        _ = &t;
        while (t <= state.*.current_frame_time_ms) : (t +%= frames[@bitCast(@as(isize, @intCast(next)))]) {
            next = __helpers.signedRemainder(next + @as(c_int, 1), c.*.num_frames);
            advance = t;
            if (!(frames[@bitCast(@as(isize, @intCast(next)))] != 0)) {
                break;
            }
        }
    }
    wl_callback_destroy(cb);
    state.*.frame_callback = null;
    if (frames[@bitCast(@as(isize, @intCast(next)))] != 0) {
        state.*.frame_callback = wl_surface_frame(state.*.surface);
        _ = wl_callback_add_listener(state.*.frame_callback, &cursor_frame_listener, data);
    }
    state.*.current_frame_time_ms -%= advance;
    state.*.last_frame_callback_time_ms = now;
    state.*.current_frame = next;
    var buffer: ?*struct_wl_buffer = Wayland_CursorStateGetFrame(state, next);
    _ = &buffer;
    wl_surface_attach(state.*.surface, buffer, 0, 0);
    if (wl_surface_get_version(state.*.surface) >= @as(u32, WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION)) {
        wl_surface_damage_buffer(state.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
    } else {
        wl_surface_damage(state.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
    }
    wl_surface_commit(state.*.surface);
}
pub export fn Wayland_CursorStateSetFrameCallback(state: [*c]SDL_WaylandCursorState, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &viddata;
    Wayland_LockEventThread(viddata.*.event_thread_context);
    state.*.frame_callback = wl_surface_frame(state.*.surface);
    _ = wl_callback_add_listener(state.*.frame_callback, &cursor_frame_listener, userdata);
    Wayland_UnlockEventThread(viddata.*.event_thread_context);
}
pub export fn Wayland_CursorStateDestroyFrameCallback(state: [*c]SDL_WaylandCursorState) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &viddata;
    Wayland_LockEventThread(viddata.*.event_thread_context);
    if (state.*.frame_callback != null) {
        wl_callback_destroy(state.*.frame_callback);
        state.*.frame_callback = null;
    }
    Wayland_UnlockEventThread(viddata.*.event_thread_context);
}
pub fn Wayland_CursorStateResetAnimationState(state: [*c]SDL_WaylandCursorState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    state.*.last_frame_callback_time_ms = SDL_GetTicks_REAL();
    state.*.current_frame_time_ms = 0;
    state.*.current_frame = 0;
}
pub fn Wayland_CursorStateResetAnimation(state: [*c]SDL_WaylandCursorState, lock: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (lock) {
        var viddata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
        _ = &viddata;
        Wayland_LockEventThread(viddata.*.event_thread_context);
        Wayland_CursorStateResetAnimationState(state);
        Wayland_UnlockEventThread(viddata.*.event_thread_context);
    } else {
        Wayland_CursorStateResetAnimationState(state);
    }
}
pub export fn Wayland_CursorStateRelease(state: [*c]SDL_WaylandCursorState) void {
    @setEvalBranchQuota(100000);
    Wayland_CursorStateDestroyFrameCallback(state);
    if (state.*.cursor_shape != null) {
        wp_cursor_shape_device_v1_destroy(state.*.cursor_shape);
    }
    if (state.*.viewport != null) {
        wp_viewport_destroy(state.*.viewport);
    }
    if (state.*.surface != null) {
        wl_surface_attach(state.*.surface, null, 0, 0);
        wl_surface_commit(state.*.surface);
        wl_surface_destroy(state.*.surface);
    }
    _ = memset(@ptrCast(@alignCast(state)), 0, @sizeOf(@TypeOf(state.*)));
}
pub fn Wayland_CacheSystemCursor(cdata: [*c]SDL_CursorData, cursor: [*c]struct_wl_cursor, size: c_int) callconv(.c) [*c]Wayland_CachedSystemCursor {
    @setEvalBranchQuota(100000);
    var cache: [*c]Wayland_CachedSystemCursor = null;
    _ = &cache;
    if (!(WAYLAND_wl_list_empty.?(&cdata.*.cursor_data.system.cursor_buffer_cache) != 0)) {
        var c: [*c]Wayland_CachedSystemCursor = null;
        _ = &c;
        {
            c = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&cdata.*.cursor_data.system.cursor_buffer_cache).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(c.*), @ptrFromInt(0)).node)));
            while ((&c.*.node) != (&cdata.*.cursor_data.system.cursor_buffer_cache)) : (c = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(c.*.node.next))) - @intFromPtr(&@as(*allowzero @TypeOf(c.*), @ptrFromInt(0)).node)))) {
                if (c.*.size == size) {
                    cache = c;
                    break;
                }
            }
        }
    }
    if (!(cache != null)) {
        cache = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(Wayland_CachedSystemCursor) +% (@sizeOf(?*struct_wl_buffer) *% @as(c_ulong, @bitCast(@as(c_long, cdata.*.num_frames)))))));
        cache.*.size = size;
        {
            var i: c_int = 0;
            _ = &i;
            while (i < cdata.*.num_frames) : (i += 1) {
                cache.*.buffers()[@bitCast(@as(isize, @intCast(i)))] = WAYLAND_wl_cursor_image_get_buffer.?(cursor.*.images[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
        WAYLAND_wl_list_insert.?(&cdata.*.cursor_data.system.cursor_buffer_cache, &cache.*.node);
    }
    return cache;
}
pub fn Wayland_GetSystemCursor(cdata: [*c]SDL_CursorData, state: [*c]SDL_WaylandCursorState, dst_size: [*c]c_int, hot_x: [*c]c_int, hot_y: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vdata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &vdata;
    var theme: ?*struct_wl_cursor_theme_116 = null;
    _ = &theme;
    var css_name: [*c]const u8 = "default";
    _ = &css_name;
    var fallback_name: [*c]const u8 = null;
    _ = &fallback_name;
    var scale_factor: f64 = state.*.scale;
    _ = &scale_factor;
    var theme_size: c_int = dbus_cursor_size;
    _ = &theme_size;
    if (theme_size <= @as(c_int, 0)) {
        var xcursor_size: [*c]const u8 = SDL_getenv_REAL("XCURSOR_SIZE");
        _ = &xcursor_size;
        if (xcursor_size != null) {
            theme_size = SDL_atoi_REAL(xcursor_size);
        }
    }
    if (theme_size <= @as(c_int, 0)) {
        theme_size = 24;
    }
    const scaled_size: c_int = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(theme_size)) * scale_factor));
    _ = &scaled_size;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < vdata.*.num_cursor_themes) : (i += 1) {
            if (vdata.*.cursor_themes[@bitCast(@as(isize, @intCast(i)))].size == scaled_size) {
                theme = vdata.*.cursor_themes[@bitCast(@as(isize, @intCast(i)))].theme;
                break;
            }
        }
    }
    if (!(theme != null)) {
        var xcursor_theme: [*c]const u8 = dbus_cursor_theme;
        _ = &xcursor_theme;
        var new_cursor_themes: [*c]SDL_WaylandCursorTheme = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(vdata.*.cursor_themes)), @sizeOf(SDL_WaylandCursorTheme) *% @as(c_ulong, @bitCast(@as(c_long, vdata.*.num_cursor_themes + @as(c_int, 1)))))));
        _ = &new_cursor_themes;
        if (!(new_cursor_themes != null)) {
            return @"false" != 0;
        }
        vdata.*.cursor_themes = new_cursor_themes;
        if (!(xcursor_theme != null)) {
            xcursor_theme = SDL_getenv_REAL("XCURSOR_THEME");
        }
        theme = WAYLAND_wl_cursor_theme_load.?(xcursor_theme, scaled_size, vdata.*.shm);
        vdata.*.cursor_themes[@bitCast(@as(isize, @intCast(vdata.*.num_cursor_themes)))].size = scaled_size;
        vdata.*.cursor_themes[
            @bitCast(@as(isize, @intCast(blk: {
                const ref = &vdata.*.num_cursor_themes;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            })))
        ].theme = theme;
    }
    css_name = SDL_GetCSSCursorName(cdata.*.cursor_data.system.id, &fallback_name);
    var cursor: [*c]struct_wl_cursor = WAYLAND_wl_cursor_theme_get_cursor.?(theme, css_name);
    _ = &cursor;
    if (!(cursor != null) and (fallback_name != null)) {
        cursor = WAYLAND_wl_cursor_theme_get_cursor.?(theme, fallback_name);
    }
    if (!(cursor != null)) {
        cursor = WAYLAND_wl_cursor_theme_get_cursor.?(theme, "default");
    }
    if (!(cursor != null)) {
        cursor = WAYLAND_wl_cursor_theme_get_cursor.?(theme, "left_ptr");
    }
    if (!(cursor != null)) {
        return @"false" != 0;
    }
    cdata.*.num_frames = @bitCast(@as(c_uint, @truncate(cursor.*.image_count)));
    var c: [*c]Wayland_CachedSystemCursor = Wayland_CacheSystemCursor(cdata, cursor, theme_size);
    _ = &c;
    state.*.system_cursor_handle = @ptrCast(@alignCast(c));
    if ((cursor.*.image_count > @as(c_uint, 1)) and !(cdata.*.frame_durations_ms != null)) {
        cdata.*.total_duration_ms = 0;
        cdata.*.frame_durations_ms = @ptrCast(@alignCast(SDL_calloc_REAL(cursor.*.image_count, @sizeOf(Uint32))));
        {
            var i: c_int = 0;
            _ = &i;
            while (@as(c_uint, @bitCast(@as(c_int, i))) < cursor.*.image_count) : (i += 1) {
                cdata.*.frame_durations_ms[@bitCast(@as(isize, @intCast(i)))] = cursor.*.images[@bitCast(@as(isize, @intCast(i)))].*.delay;
                cdata.*.total_duration_ms +%= cursor.*.images[@bitCast(@as(isize, @intCast(i)))].*.delay;
            }
        }
    }
    dst_size.* = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor.*.images[@as(c_int, 0)].*.width)) / state.*.scale));
    hot_x.* = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor.*.images[@as(c_int, 0)].*.hotspot_x)) / state.*.scale));
    hot_y.* = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor.*.images[@as(c_int, 0)].*.hotspot_y)) / state.*.scale));
    return @"true" != 0;
}
pub fn surface_sort_callback(a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var s1: [*c]const SDL_Surface = @as([*c][*c]const SDL_Surface, @ptrCast(@alignCast(@constCast(a)))).*;
    _ = &s1;
    var s2: [*c]const SDL_Surface = @as([*c][*c]const SDL_Surface, @ptrCast(@alignCast(@constCast(b)))).*;
    _ = &s2;
    return if ((s1.*.w * s1.*.h) <= (s2.*.w * s2.*.h)) -@as(c_int, 1) else @as(c_int, 1);
}
pub fn Wayland_CreateAnimatedCursor(frames: [*c]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    var data: [*c]SDL_CursorData = undefined;
    _ = &data;
    var shm_pool: ?*Wayland_SHMPool = undefined;
    _ = &shm_pool;
    var pool_size: c_int = undefined;
    _ = &pool_size;
    var max_images: c_int = undefined;
    _ = &max_images;
    var is_stack: bool = undefined;
    _ = &is_stack;
    const struct_SurfaceArray = extern struct {
        surfaces: [*c][*c]SDL_Surface = null,
        count: c_int = 0,
    };
    _ = &struct_SurfaceArray;
    var surfaces: [*c]struct_SurfaceArray = undefined;
    _ = &surfaces;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    var i_1: c_int = undefined;
    _ = &i_1;
    var offset: c_int = undefined;
    _ = &offset;
    var j_2: c_int = undefined;
    _ = &j_2;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var buf_data: ?*anyopaque = undefined;
    _ = &buf_data;
    var i_3: c_int = undefined;
    _ = &i_3;
    var i_4: c_int = undefined;
    _ = &i_4;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
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
                Wayland_ReleaseSHMPool(shm_pool);
                if (data != null) {
                    sdl_pc = 54;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            2 => {
                return null;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                data = null;
                shm_pool = null;
                pool_size = 0;
                max_images = 0;
                is_stack = @"false" != 0;
                surfaces = blk: {
                    (&is_stack).* = (@sizeOf(struct_SurfaceArray) *% @as(c_ulong, @bitCast(@as(c_long, frame_count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&is_stack).*) @as([*c]struct_SurfaceArray, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(struct_SurfaceArray) *% @as(c_ulong, @bitCast(@as(c_long, frame_count))))))) else @as([*c]struct_SurfaceArray, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(struct_SurfaceArray) *% @as(c_ulong, @bitCast(@as(c_long, frame_count)))))));
                };
                if (!(surfaces != null)) {
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
                _ = memset(@ptrCast(@alignCast(surfaces)), 0, @sizeOf(struct_SurfaceArray) *% @as(c_ulong, @bitCast(@as(c_long, frame_count))));
                i = 0;
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (i < frame_count) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            9 => {
                surfaces[@bitCast(@as(isize, @intCast(i)))].surfaces = SDL_GetSurfaceImages_REAL(frames[@bitCast(@as(isize, @intCast(i)))].surface, &surfaces[@bitCast(@as(isize, @intCast(i)))].count);
                if (!(surfaces[@bitCast(@as(isize, @intCast(i)))].surfaces != null)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
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
                data = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(data.*)) +% ((@sizeOf(CustomCursorImage) *% @as(c_ulong, @bitCast(@as(c_long, max_images)))) *% @as(c_ulong, @bitCast(@as(c_long, frame_count)))))));
                if (!(data != null)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            12 => {
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
                SDL_qsort_REAL(@ptrCast(@alignCast(surfaces[@bitCast(@as(isize, @intCast(i)))].surfaces)), @bitCast(@as(c_long, surfaces[@bitCast(@as(isize, @intCast(i)))].count)), @sizeOf([*c]SDL_Surface), surface_sort_callback);
                max_images = if (max_images > surfaces[@bitCast(@as(isize, @intCast(i)))].count) max_images else surfaces[@bitCast(@as(isize, @intCast(i)))].count;
                j = 0;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                if (j < surfaces[@bitCast(@as(isize, @intCast(i)))].count) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                pool_size += (surfaces[@bitCast(@as(isize, @intCast(i)))].surfaces[@bitCast(@as(isize, @intCast(j)))].*.w * surfaces[@bitCast(@as(isize, @intCast(i)))].surfaces[@bitCast(@as(isize, @intCast(j)))].*.h) * @as(c_int, 4);
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                j += 1;
                {
                    sdl_pc = 15;
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
                    sdl_pc = 1;
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
                data.*.frame_durations_ms = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, frame_count)), @sizeOf(Uint32))));
                if (!(data.*.frame_durations_ms != null)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
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
                shm_pool = Wayland_AllocSHMPool(pool_size);
                if (!(shm_pool != null)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 1;
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
                cursor.*.internal = data;
                data.*.cursor_data.custom.width = frames[@as(c_int, 0)].surface.*.w;
                data.*.cursor_data.custom.height = frames[@as(c_int, 0)].surface.*.h;
                data.*.cursor_data.custom.hot_x = hot_x;
                data.*.cursor_data.custom.hot_y = hot_y;
                data.*.cursor_data.custom.images_per_frame = max_images;
                data.*.num_frames = frame_count;
                i_1 = 0;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                if (i_1 < frame_count) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            29 => {
                data.*.frame_durations_ms[@bitCast(@as(isize, @intCast(i_1)))] = frames[@bitCast(@as(isize, @intCast(i_1)))].duration;
                if (data.*.total_duration_ms < @as(c_uint, 4294967295)) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            30 => {
                i_1 += 1;
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            31 => {
                if (is_stack) {
                    sdl_pc = 51;
                    continue;
                } else {
                    sdl_pc = 52;
                    continue;
                }
            },
            32 => {
                if (data.*.frame_durations_ms[@bitCast(@as(isize, @intCast(i_1)))] > @as(Uint32, 0)) {
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
                offset = i_1 * max_images;
                j_2 = 0;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            35 => {
                data.*.total_duration_ms +%= data.*.frame_durations_ms[@bitCast(@as(isize, @intCast(i_1)))];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                data.*.total_duration_ms = @as(c_uint, 4294967295);
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
                if (j_2 < surfaces[@bitCast(@as(isize, @intCast(i_1)))].count) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            39 => {
                surface = surfaces[@bitCast(@as(isize, @intCast(i_1)))].surfaces[@bitCast(@as(isize, @intCast(j_2)))];
                if (surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            40 => {
                j_2 += 1;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            41 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces[@bitCast(@as(isize, @intCast(i_1)))].surfaces)));
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            42 => {
                surface = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
                if (!(surface != null)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
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
                data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(offset + j_2)))].width = surface.*.w;
                data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(offset + j_2)))].height = surface.*.h;
                data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(offset + j_2)))].buffer = Wayland_AllocBufferFromPool(shm_pool, surface.*.w, surface.*.h, &buf_data);
                _ = SDL_PremultiplyAlpha_REAL(surface.*.w, surface.*.h, surface.*.format, surface.*.pixels, surface.*.pitch, SDL_PIXELFORMAT_ARGB8888, buf_data, surface.*.w * @as(c_int, 4), @"true" != 0);
                if (surface != surfaces[@bitCast(@as(isize, @intCast(i_1)))].surfaces[@bitCast(@as(isize, @intCast(j_2)))]) {
                    sdl_pc = 48;
                    continue;
                } else {
                    sdl_pc = 49;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            48 => {
                SDL_DestroySurface_REAL(surface);
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                {
                    sdl_pc = 50;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            51 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces)));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            52 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces)));
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            53 => {
                Wayland_ReleaseSHMPool(shm_pool);
                return cursor;
            },
            54 => {
                SDL_free_REAL(@ptrCast(@alignCast(data.*.frame_durations_ms)));
                i_3 = 0;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            56 => {
                SDL_free_REAL(@ptrCast(@alignCast(data)));
                if (surfaces != null) {
                    sdl_pc = 64;
                    continue;
                } else {
                    sdl_pc = 65;
                    continue;
                }
            },
            57 => {
                if (i_3 < (data.*.cursor_data.custom.images_per_frame * frame_count)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                if (data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(i_3)))].buffer != null) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            59 => {
                i_3 += 1;
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            61 => {
                wl_buffer_destroy(data.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(i_3)))].buffer);
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 59;
                    continue;
                }
            },
            64 => {
                i_4 = 0;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            66 => {
                SDL_free_REAL(@ptrCast(@alignCast(cursor)));
                return null;
            },
            67 => {
                if (i_4 < frame_count) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 70;
                    continue;
                }
            },
            68 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces[@bitCast(@as(isize, @intCast(i_4)))].surfaces)));
                {
                    sdl_pc = 69;
                    continue;
                }
            },
            69 => {
                i_4 += 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            70 => {
                if (is_stack) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces)));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                SDL_free_REAL(@ptrCast(@alignCast(surfaces)));
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn Wayland_CreateCursor(surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var frame: SDL_CursorFrameInfo = SDL_CursorFrameInfo{
        .surface = surface,
        .duration = 0,
    };
    _ = &frame;
    return Wayland_CreateAnimatedCursor(&frame, 1, hot_x, hot_y);
}
pub fn Wayland_CreateSystemCursor(id: SDL_SystemCursor) callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_Cursor = undefined;
    cursor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cursor.*)))));
    _ = &cursor;
    if (cursor != null) {
        var cdata: [*c]SDL_CursorData = undefined;
        cdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cdata.*)))));
        _ = &cdata;
        if (!(cdata != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(cursor)));
            return null;
        }
        cursor.*.internal = cdata;
        WAYLAND_wl_list_init.?(&cdata.*.cursor_data.system.cursor_buffer_cache);
        cdata.*.cursor_data.system.id = id;
        cdata.*.is_system_cursor = @"true" != 0;
    }
    return cursor;
}
pub fn Wayland_CreateDefaultCursor() callconv(.c) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var id: SDL_SystemCursor = SDL_GetDefaultSystemCursor();
    _ = &id;
    return Wayland_CreateSystemCursor(id);
}
pub fn Wayland_FreeCursorData(d: [*c]SDL_CursorData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var video_device: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &video_device;
    var video_data: [*c]SDL_VideoData = video_device.*.internal;
    _ = &video_data;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&video_data.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&video_data.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.pointer.cursor_state.current_cursor == d) {
                Wayland_CursorStateDestroyFrameCallback(&seat.*.pointer.cursor_state);
                if (!d.*.is_system_cursor and (seat.*.pointer.cursor_state.surface != null)) {
                    wl_surface_attach(seat.*.pointer.cursor_state.surface, null, 0, 0);
                }
                seat.*.pointer.cursor_state.current_cursor = null;
            }
            var tool: [*c]SDL_WaylandPenTool = undefined;
            _ = &tool;
            {
                tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
                while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : (tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)))) {
                    if (tool.*.cursor_state.current_cursor == d) {
                        Wayland_CursorStateDestroyFrameCallback(&tool.*.cursor_state);
                        if (!d.*.is_system_cursor and (tool.*.cursor_state.surface != null)) {
                            wl_surface_attach(seat.*.pointer.cursor_state.surface, null, 0, 0);
                        }
                        tool.*.cursor_state.current_cursor = null;
                    }
                }
            }
        }
    }
    if (d.*.is_system_cursor) {
        var c: [*c]Wayland_CachedSystemCursor = undefined;
        _ = &c;
        var temp: [*c]Wayland_CachedSystemCursor = undefined;
        _ = &temp;
        {
            c = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.cursor_data.system.cursor_buffer_cache).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(c.*), @ptrFromInt(0)).node)));
            temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(c.*.node.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).node)));
            while ((&c.*.node) != (&d.*.cursor_data.system.cursor_buffer_cache)) : ({
                c = temp;
                temp = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(c.*.node.next))) - @intFromPtr(&@as(*allowzero @TypeOf(temp.*), @ptrFromInt(0)).node)));
            }) {
                SDL_free_REAL(@ptrCast(@alignCast(c)));
            }
        }
    } else {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < (d.*.num_frames * d.*.cursor_data.custom.images_per_frame)) : (i += 1) {
                if (d.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(i)))].buffer != null) {
                    wl_buffer_destroy(d.*.cursor_data.custom.images()[@bitCast(@as(isize, @intCast(i)))].buffer);
                }
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(d.*.frame_durations_ms)));
}
pub fn Wayland_FreeCursor(cursor: [*c]SDL_Cursor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(cursor != null)) {
        return;
    }
    if (!(cursor.*.internal != null)) {
        return;
    }
    Wayland_FreeCursorData(cursor.*.internal);
    SDL_free_REAL(@ptrCast(@alignCast(cursor.*.internal)));
    SDL_free_REAL(@ptrCast(@alignCast(cursor)));
}
pub fn Wayland_GetSystemCursorShape(id: SDL_SystemCursor) callconv(.c) enum_wp_cursor_shape_device_v1_shape {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [28:0]u8 = "Wayland_GetSystemCursorShape".*;
    };
    _ = &static_local___func__;
    var shape: Uint32 = undefined;
    _ = &shape;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
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
                switch (id) {
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_DEFAULT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_TEXT) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_WAIT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CROSSHAIR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_PROGRESS) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NWSE_RESIZE) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NESW_RESIZE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_EW_RESIZE) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NS_RESIZE) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_MOVE) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NOT_ALLOWED) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_POINTER) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NW_RESIZE) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_N_RESIZE) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NE_RESIZE) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_E_RESIZE) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_SE_RESIZE) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_S_RESIZE) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_SW_RESIZE) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_W_RESIZE) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CONTEXT_MENU) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_HELP) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_CELL) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_VERTICAL_TEXT) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ALIAS) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_COPY) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_NO_DROP) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_GRAB) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_GRABBING) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_COL_RESIZE) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ROW_RESIZE) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ALL_SCROLL) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ZOOM_IN) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(SDL_SystemCursor, SDL_SYSTEM_CURSOR_ZOOM_OUT) => {
                        sdl_pc = 35;
                        continue;
                    },
                    else => {
                        sdl_pc = 36;
                        continue;
                    },
                }
            },
            1 => {
                return shape;
            },
            2 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_DEFAULT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_TEXT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_WAIT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CROSSHAIR;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_PROGRESS;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NWSE_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NESW_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_EW_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NS_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_MOVE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NOT_ALLOWED;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_POINTER;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NW_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_N_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NE_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_E_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SE_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            19 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_S_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            20 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_SW_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_W_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            22 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CONTEXT_MENU;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            23 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_HELP;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_CELL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            25 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_VERTICAL_TEXT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            26 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALIAS;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            27 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COPY;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            28 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_NO_DROP;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRAB;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            30 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_GRABBING;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            31 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_COL_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            32 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ROW_RESIZE;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            33 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ALL_SCROLL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            34 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_IN;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            35 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_ZOOM_OUT;
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
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                shape = WP_CURSOR_SHAPE_DEVICE_V1_SHAPE_DEFAULT;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            40 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            41 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_waylandmouse.c", 911);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 38;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            46 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
const union_unnamed_123 = extern union {
    wl_pointer: ?*struct_wl_pointer,
    wl_tool: ?*struct_zwp_tablet_tool_v2_119,
};
pub const struct_Wayland_PointerObject = extern struct {
    unnamed_0: union_unnamed_123 = @import("std").mem.zeroes(union_unnamed_123),
    is_pointer: bool = false,
};
pub const Wayland_PointerObject = struct_Wayland_PointerObject;
pub fn Wayland_CursorStateSetCursor(state: [*c]SDL_WaylandCursorState, obj: [*c]const Wayland_PointerObject, focus: [*c]SDL_WindowData, serial: Uint32, cursor: [*c]SDL_Cursor) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
    _ = &viddata;
    var cursor_data: [*c]SDL_CursorData = @ptrCast(@alignCast(if (cursor != null) @as(?*anyopaque, @ptrCast(@alignCast(cursor.*.internal))) else @as(?*anyopaque, null)));
    _ = &cursor_data;
    var dst_width: c_int = 0;
    _ = &dst_width;
    var dst_height: c_int = 0;
    _ = &dst_height;
    var hot_x: c_int = undefined;
    _ = &hot_x;
    var hot_y: c_int = undefined;
    _ = &hot_y;
    if (cursor_data != state.*.current_cursor) {
        Wayland_CursorStateDestroyFrameCallback(state);
    }
    if (cursor != null) {
        if ((cursor_data == state.*.current_cursor) and (state.*.current_frame >= @as(c_int, 0))) {
            if (cursor_data.*.num_frames > @as(c_int, 1)) {
                Wayland_CursorStateResetAnimation(state, @"true" != 0);
            }
            return;
        }
        if (cursor_data.*.is_system_cursor) {
            if (state.*.cursor_shape != null) {
                if (state.*.surface != null) {
                    wl_surface_attach(state.*.surface, null, 0, 0);
                    wl_surface_commit(state.*.surface);
                    if (obj.*.is_pointer) {
                        wl_pointer_set_cursor(obj.*.unnamed_0.wl_pointer, serial, null, 0, 0);
                    } else {
                        zwp_tablet_tool_v2_set_cursor(obj.*.unnamed_0.wl_tool, serial, null, 0, 0);
                    }
                    if (state.*.viewport != null) {
                        wp_viewport_destroy(state.*.viewport);
                        state.*.viewport = null;
                    }
                    wl_surface_destroy(state.*.surface);
                    state.*.surface = null;
                }
                const shape: enum_wp_cursor_shape_device_v1_shape = Wayland_GetSystemCursorShape(cursor_data.*.cursor_data.system.id);
                _ = &shape;
                wp_cursor_shape_device_v1_set_shape(state.*.cursor_shape, serial, shape);
                state.*.current_cursor = cursor_data;
                state.*.current_frame = 0;
                return;
            }
            state.*.scale = if ((viddata.*.viewporter != null) and (focus != null)) focus.*.scale_factor else @as(f64, 1.0);
            if (!Wayland_GetSystemCursor(cursor_data, state, &dst_width, &hot_x, &hot_y)) {
                return;
            }
            dst_height = dst_width;
        } else {
            if (!(focus != null) or ((focus.*.pointer_scale.x == @as(f64, 1.0)) and (focus.*.pointer_scale.y == @as(f64, 1.0)))) {
                state.*.scale = if ((viddata.*.viewporter != null) and (focus != null)) focus.*.scale_factor else @as(f64, 1.0);
                dst_width = cursor_data.*.cursor_data.custom.width;
                dst_height = cursor_data.*.cursor_data.custom.height;
                hot_x = cursor_data.*.cursor_data.custom.hot_x;
                hot_y = cursor_data.*.cursor_data.custom.hot_y;
            } else {
                state.*.scale = @as(f64, 1.0) / (if (focus.*.pointer_scale.x < focus.*.pointer_scale.y) focus.*.pointer_scale.x else focus.*.pointer_scale.y);
                dst_width = if (@as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.width)) / focus.*.pointer_scale.x))) > @as(c_int, 1)) @as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.width)) / focus.*.pointer_scale.x))) else @as(c_int, 1);
                dst_height = if (@as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.height)) / focus.*.pointer_scale.y))) > @as(c_int, 1)) @as(c_int, @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.height)) / focus.*.pointer_scale.y))) else @as(c_int, 1);
                hot_x = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.hot_x)) / focus.*.pointer_scale.x));
                hot_y = @truncate(SDL_lround_REAL(@as(f64, @floatFromInt(cursor_data.*.cursor_data.custom.hot_y)) / focus.*.pointer_scale.y));
            }
        }
        state.*.current_cursor = cursor_data;
        if (!(state.*.surface != null)) {
            if (viddata.*.event_thread_context != null) {
                var compositor_wrapper: ?*struct_wl_compositor_10 = @ptrCast(@alignCast(Wayland_CreateEventThreadProxyWrapper(viddata.*.event_thread_context, @ptrCast(@alignCast(viddata.*.compositor)))));
                _ = &compositor_wrapper;
                state.*.surface = wl_compositor_create_surface(compositor_wrapper);
                WAYLAND_wl_proxy_wrapper_destroy.?(@ptrCast(@alignCast(compositor_wrapper)));
            } else {
                state.*.surface = wl_compositor_create_surface(viddata.*.compositor);
            }
        }
        var buffer: ?*struct_wl_buffer = Wayland_CursorStateGetFrame(state, 0);
        _ = &buffer;
        wl_surface_attach(state.*.surface, buffer, 0, 0);
        state.*.current_frame = 0;
        if (state.*.scale != @as(f64, 1.0)) {
            if (!(state.*.viewport != null)) {
                state.*.viewport = wp_viewporter_get_viewport(viddata.*.viewporter, state.*.surface);
            }
            wp_viewport_set_source(state.*.viewport, wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)), wl_fixed_from_int(-@as(c_int, 1)));
            wp_viewport_set_destination(state.*.viewport, dst_width, dst_height);
        } else if (state.*.viewport != null) {
            wp_viewport_destroy(state.*.viewport);
            state.*.viewport = null;
        }
        if (obj.*.is_pointer) {
            wl_pointer_set_cursor(obj.*.unnamed_0.wl_pointer, serial, state.*.surface, hot_x, hot_y);
        } else {
            zwp_tablet_tool_v2_set_cursor(obj.*.unnamed_0.wl_tool, serial, state.*.surface, hot_x, hot_y);
        }
        if (wl_surface_get_version(state.*.surface) >= @as(u32, WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION)) {
            wl_surface_damage_buffer(state.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
        } else {
            wl_surface_damage(state.*.surface, 0, 0, @as(c_int, 2147483647), @as(c_int, 2147483647));
        }
        if (cursor_data.*.num_frames > @as(c_int, 1)) {
            Wayland_CursorStateResetAnimation(state, @"false" != 0);
            Wayland_CursorStateSetFrameCallback(state, @ptrCast(@alignCast(state)));
        }
        wl_surface_commit(state.*.surface);
    } else {
        Wayland_CursorStateDestroyFrameCallback(state);
        state.*.current_cursor = null;
        if (state.*.surface != null) {
            wl_surface_attach(state.*.surface, null, 0, 0);
            wl_surface_commit(state.*.surface);
        }
        if (obj.*.is_pointer) {
            wl_pointer_set_cursor(obj.*.unnamed_0.wl_pointer, serial, null, 0, 0);
        } else {
            zwp_tablet_tool_v2_set_cursor(obj.*.unnamed_0.wl_tool, serial, null, 0, 0);
        }
    }
}
pub fn Wayland_CursorStateResetCursor(state: [*c]SDL_WaylandCursorState) callconv(.c) void {
    @setEvalBranchQuota(100000);
    Wayland_CursorStateDestroyFrameCallback(state);
    state.*.current_frame = -@as(c_int, 1);
}
pub export fn Wayland_DisplayUpdatePointerFocusedScale(updated_window: [*c]SDL_WindowData) void {
    @setEvalBranchQuota(100000);
    var viddata: [*c]SDL_VideoData = updated_window.*.waylandData;
    _ = &viddata;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    const new_scale: f64 = if (updated_window.*.pointer_scale.x < updated_window.*.pointer_scale.y) updated_window.*.pointer_scale.x else updated_window.*.pointer_scale.y;
    _ = &new_scale;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&viddata.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&viddata.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.pointer.focus == updated_window) {
                var state: [*c]SDL_WaylandCursorState = &seat.*.pointer.cursor_state;
                _ = &state;
                if (((state.*.current_cursor != null) and !state.*.current_cursor.*.is_system_cursor) and (state.*.scale != new_scale)) {
                    Wayland_CursorStateResetCursor(state);
                    Wayland_SeatUpdatePointerCursor(seat);
                }
            }
            var tool: [*c]SDL_WaylandPenTool = undefined;
            _ = &tool;
            {
                tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
                while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : (tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)))) {
                    if (tool.*.focus == updated_window) {
                        var state: [*c]SDL_WaylandCursorState = &tool.*.cursor_state;
                        _ = &state;
                        if (((state.*.current_cursor != null) and !state.*.current_cursor.*.is_system_cursor) and (state.*.scale != new_scale)) {
                            Wayland_CursorStateResetCursor(&tool.*.cursor_state);
                            Wayland_TabletToolUpdateCursor(tool);
                        }
                    }
                }
            }
        }
    }
}
pub fn Wayland_ShowCursor(cursor: [*c]SDL_Cursor) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vd: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vd;
    var d: [*c]SDL_VideoData = vd.*.internal;
    _ = &d;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    var obj: Wayland_PointerObject = undefined;
    _ = &obj;
    {
        seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
        while ((&seat.*.link) != (&d.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
            if (seat.*.pointer.wl_pointer != null) {
                obj.unnamed_0.wl_pointer = seat.*.pointer.wl_pointer;
                obj.is_pointer = @"true" != 0;
                if ((mouse.*.focus != null) and (mouse.*.focus.*.internal == seat.*.pointer.focus)) {
                    Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, seat.*.pointer.focus, seat.*.pointer.enter_serial, cursor);
                } else if (!(seat.*.pointer.focus != null)) {
                    Wayland_CursorStateResetCursor(&seat.*.pointer.cursor_state);
                }
            }
            var tool: [*c]SDL_WaylandPenTool = undefined;
            _ = &tool;
            {
                tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&seat.*.tablet.tool_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)));
                while ((&tool.*.link) != (&seat.*.tablet.tool_list)) : (tool = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(tool.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(tool.*), @ptrFromInt(0)).link)))) {
                    obj.unnamed_0.wl_tool = tool.*.wltool;
                    obj.is_pointer = @"false" != 0;
                    if ((tool.*.focus != null) and (!(mouse.*.focus != null) or (mouse.*.focus.*.internal == tool.*.focus))) {
                        Wayland_CursorStateSetCursor(&tool.*.cursor_state, &obj, tool.*.focus, tool.*.proximity_serial, mouse.*.cur_cursor);
                    } else if (!(tool.*.focus != null)) {
                        Wayland_CursorStateResetCursor(&tool.*.cursor_state);
                    }
                }
            }
        }
    }
    return @"true" != 0;
}
pub export fn Wayland_SeatWarpMouse(seat: [*c]SDL_WaylandSeat, window: [*c]SDL_WindowData, x: f32, y: f32) void {
    @setEvalBranchQuota(100000);
    var vd: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vd;
    var d: [*c]SDL_VideoData = vd.*.internal;
    _ = &d;
    if (seat.*.pointer.wl_pointer != null) {
        if (d.*.wp_pointer_warp_v1 != null) {
            const f_x: wl_fixed_t = wl_fixed_from_double(if ((@as(f64, @floatCast(x)) / window.*.pointer_scale.x) < @as(f64, @floatFromInt(@as(c_int, 0)))) @as(f64, @floatFromInt(@as(c_int, 0))) else if ((@as(f64, @floatCast(x)) / window.*.pointer_scale.x) > @as(f64, @floatFromInt(window.*.current.logical_width))) @as(f64, @floatFromInt(window.*.current.logical_width)) else @as(f64, @floatCast(x)) / window.*.pointer_scale.x);
            _ = &f_x;
            const f_y: wl_fixed_t = wl_fixed_from_double(if ((@as(f64, @floatCast(y)) / window.*.pointer_scale.y) < @as(f64, @floatFromInt(@as(c_int, 0)))) @as(f64, @floatFromInt(@as(c_int, 0))) else if ((@as(f64, @floatCast(y)) / window.*.pointer_scale.y) > @as(f64, @floatFromInt(window.*.current.logical_height))) @as(f64, @floatFromInt(window.*.current.logical_height)) else @as(f64, @floatCast(y)) / window.*.pointer_scale.y);
            _ = &f_y;
            wp_pointer_warp_v1_warp_pointer(d.*.wp_pointer_warp_v1, window.*.surface, seat.*.pointer.wl_pointer, f_x, f_y, seat.*.pointer.enter_serial);
        } else {
            var update_grabs: bool = @"false" != 0;
            _ = &update_grabs;
            if (seat.*.pointer.confined_pointer != null) {
                zwp_confined_pointer_v1_destroy(seat.*.pointer.confined_pointer);
                seat.*.pointer.confined_pointer = null;
                update_grabs = @"true" != 0;
            }
            if (seat.*.pointer.locked_pointer != null) {
                zwp_locked_pointer_v1_destroy(seat.*.pointer.locked_pointer);
                seat.*.pointer.locked_pointer = null;
                update_grabs = @"true" != 0;
            }
            var warp_lock: ?*struct_zwp_locked_pointer_v1_51 = zwp_pointer_constraints_v1_lock_pointer(d.*.pointer_constraints, window.*.surface, seat.*.pointer.wl_pointer, null, ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_ONESHOT);
            _ = &warp_lock;
            const f_x: wl_fixed_t = wl_fixed_from_double(@as(f64, @floatCast(x)) / window.*.pointer_scale.x);
            _ = &f_x;
            const f_y: wl_fixed_t = wl_fixed_from_double(@as(f64, @floatCast(y)) / window.*.pointer_scale.y);
            _ = &f_y;
            zwp_locked_pointer_v1_set_cursor_position_hint(warp_lock, f_x, f_y);
            wl_surface_commit(window.*.surface);
            zwp_locked_pointer_v1_destroy(warp_lock);
            if (update_grabs) {
                Wayland_SeatUpdatePointerGrab(seat);
            }
        }
        if (wl_pointer_get_version(seat.*.pointer.wl_pointer) < @as(u32, WL_POINTER_WARP_SINCE_VERSION)) {
            SDL_SendMouseWarp(0, window.*.sdlwindow, seat.*.pointer.sdl_id, x, y);
        }
    }
}
pub fn Wayland_WarpMouseRelative(window: [*c]SDL_Window, x: f32, y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vd: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vd;
    var d: [*c]SDL_VideoData = vd.*.internal;
    _ = &d;
    var wind: [*c]SDL_WindowData = window.*.internal;
    _ = &wind;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    if ((d.*.wp_pointer_warp_v1 != null) or (d.*.pointer_constraints != null)) {
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&d.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                if (wind == seat.*.pointer.focus) {
                    Wayland_SeatWarpMouse(seat, wind, x, y);
                }
            }
        }
    } else {
        return SDL_SetError_REAL("wayland: mouse warp failed; compositor lacks support for the required wp_pointer_warp_v1 or zwp_pointer_confinement_v1 protocol");
    }
    return @"true" != 0;
}
pub fn Wayland_WarpMouseGlobal(x: f32, y: f32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vd: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vd;
    var d: [*c]SDL_VideoData = vd.*.internal;
    _ = &d;
    var seat: [*c]SDL_WaylandSeat = undefined;
    _ = &seat;
    if ((d.*.wp_pointer_warp_v1 != null) or (d.*.pointer_constraints != null)) {
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&d.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&d.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                var wind: [*c]SDL_WindowData = if (seat.*.pointer.focus != null) seat.*.pointer.focus else seat.*.keyboard.focus;
                _ = &wind;
                if (wind != null) {
                    var window: [*c]SDL_Window = wind.*.sdlwindow;
                    _ = &window;
                    var abs_x: c_int = undefined;
                    _ = &abs_x;
                    var abs_y: c_int = undefined;
                    _ = &abs_y;
                    SDL_RelativeToGlobalForWindow(window, window.*.x, window.*.y, &abs_x, &abs_y);
                    const p: SDL_FPoint = SDL_FPoint{
                        .x = x,
                        .y = y,
                    };
                    _ = &p;
                    const r: SDL_FRect = SDL_FRect{
                        .x = @floatFromInt(abs_x),
                        .y = @floatFromInt(abs_y),
                        .w = @floatFromInt(window.*.w),
                        .h = @floatFromInt(window.*.h),
                    };
                    _ = &r;
                    if (SDL_PointInRectFloat(&p, &r)) {
                        Wayland_SeatWarpMouse(seat, wind, p.x - @as(f32, @floatFromInt(abs_x)), p.y - @as(f32, @floatFromInt(abs_y)));
                    }
                }
            }
        }
    } else {
        return SDL_SetError_REAL("wayland: mouse warp failed; compositor lacks support for the required wp_pointer_warp_v1 or zwp_pointer_confinement_v1 protocol");
    }
    return @"true" != 0;
}
pub fn Wayland_SetRelativeMouseMode(_: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vd: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &vd;
    var data: [*c]SDL_VideoData = vd.*.internal;
    _ = &data;
    if (!(data.*.relative_pointer_manager != null)) {
        return SDL_SetError_REAL("Failed to enable relative mode: compositor lacks support for the required zwp_relative_pointer_manager_v1 protocol");
    }
    if (!(data.*.pointer_constraints != null)) {
        return SDL_SetError_REAL("Failed to enable relative mode: compositor lacks support for the required zwp_pointer_constraints_v1 protocol");
    }
    Wayland_DisplayUpdatePointerGrabs(data, null);
    return @"true" != 0;
}
pub fn Wayland_GetGlobalMouseState(x: [*c]f32, y: [*c]f32) callconv(.c) SDL_MouseButtonFlags {
    @setEvalBranchQuota(100000);
    var mouse: [*c]const SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var result: SDL_MouseButtonFlags = 0;
    _ = &result;
    if (mouse.*.focus != null) {
        var video_data: [*c]SDL_VideoData = SDL_GetVideoDevice().*.internal;
        _ = &video_data;
        var seat: [*c]SDL_WaylandSeat = undefined;
        _ = &seat;
        var off_x: c_int = undefined;
        _ = &off_x;
        var off_y: c_int = undefined;
        _ = &off_y;
        SDL_RelativeToGlobalForWindow(mouse.*.focus, mouse.*.focus.*.x, mouse.*.focus.*.y, &off_x, &off_y);
        x.* = mouse.*.x + @as(f32, @floatFromInt(off_x));
        y.* = mouse.*.y + @as(f32, @floatFromInt(off_y));
        {
            seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast((&video_data.*.seat_list).*.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)));
            while ((&seat.*.link) != (&video_data.*.seat_list)) : (seat = @ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(seat.*.link.next))) - @intFromPtr(&@as(*allowzero @TypeOf(seat.*), @ptrFromInt(0)).link)))) {
                result |= seat.*.pointer.buttons_pressed;
            }
        }
    } else {
        x.* = 0.0;
        y.* = 0.0;
    }
    return result;
}
pub export fn Wayland_InitMouse(_: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = undefined;
    _ = &mouse;
    var r: SDL_HitTestResult = undefined;
    _ = &r;
    var vd: [*c]SDL_VideoDevice = undefined;
    _ = &vd;
    var d: [*c]SDL_VideoData = undefined;
    _ = &d;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                mouse = SDL_GetMouse();
                mouse.*.CreateCursor = Wayland_CreateCursor;
                mouse.*.CreateAnimatedCursor = Wayland_CreateAnimatedCursor;
                mouse.*.CreateSystemCursor = Wayland_CreateSystemCursor;
                mouse.*.ShowCursor = Wayland_ShowCursor;
                mouse.*.FreeCursor = Wayland_FreeCursor;
                mouse.*.WarpMouse = Wayland_WarpMouseRelative;
                mouse.*.WarpMouseGlobal = Wayland_WarpMouseGlobal;
                mouse.*.SetRelativeMouseMode = Wayland_SetRelativeMouseMode;
                mouse.*.GetGlobalMouseState = Wayland_GetGlobalMouseState;
                mouse.*.have_explicit_warp_event = @"true" != 0;
                r = SDL_HITTEST_NORMAL;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (r <= @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_LEFT)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                switch (r) {
                    @as(SDL_HitTestResult, SDL_HITTEST_NORMAL) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_DRAGGABLE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPLEFT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOP) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_TOPRIGHT) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_RIGHT) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMRIGHT) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOM) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_BOTTOMLEFT) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(SDL_HitTestResult, SDL_HITTEST_RESIZE_LEFT) => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 4;
                        continue;
                    },
                }
            },
            3 => {
                vd = SDL_GetVideoDevice();
                d = vd.*.internal;
                if (!(d.*.cursor_shape_manager != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            4 => {
                r +%= 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_DEFAULT);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_DEFAULT);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_NW_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_N_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            9 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_NE_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            10 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_E_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            11 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_SE_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_S_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            13 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_SW_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                sys_cursors[r] = Wayland_CreateSystemCursor(SDL_SYSTEM_CURSOR_W_RESIZE);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            15 => {
                Wayland_DBusInitCursorProperties(d);
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
                SDL_SetDefaultCursor(Wayland_CreateDefaultCursor());
                {}
            },
            else => unreachable,
        }
    }
}
pub export fn Wayland_FiniMouse(data: [*c]SDL_VideoData) void {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(sys_cursors)) / @sizeOf(@TypeOf(sys_cursors[@as(c_int, 0)])))) : (i += 1) {
            Wayland_FreeCursor(sys_cursors[@bitCast(@as(isize, @intCast(i)))]);
            sys_cursors[@bitCast(@as(isize, @intCast(i)))] = null;
        }
    }
    Wayland_FreeCursorThemes(data);
    Wayland_DBusFinishCursorProperties();
}
pub export fn Wayland_SeatResetCursor(seat: [*c]SDL_WaylandSeat) void {
    @setEvalBranchQuota(100000);
    Wayland_CursorStateResetCursor(&seat.*.pointer.cursor_state);
}
pub export fn Wayland_SeatSetDefaultCursor(seat: [*c]SDL_WaylandSeat) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var pointer_focus: [*c]SDL_WindowData = seat.*.pointer.focus;
    _ = &pointer_focus;
    const obj: Wayland_PointerObject = Wayland_PointerObject{
        .unnamed_0 = union_unnamed_123{
            .wl_pointer = seat.*.pointer.wl_pointer,
        },
        .is_pointer = @"true" != 0,
    };
    _ = &obj;
    Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, pointer_focus, seat.*.pointer.enter_serial, mouse.*.def_cursor);
}
pub export fn Wayland_SeatUpdatePointerCursor(seat: [*c]SDL_WaylandSeat) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var pointer_focus: [*c]SDL_WindowData = seat.*.pointer.focus;
    _ = &pointer_focus;
    const obj: Wayland_PointerObject = Wayland_PointerObject{
        .unnamed_0 = union_unnamed_123{
            .wl_pointer = seat.*.pointer.wl_pointer,
        },
        .is_pointer = @"true" != 0,
    };
    _ = &obj;
    if (pointer_focus != null) {
        if (mouse.*.cursor_visible) {
            if (!(seat.*.pointer.relative_pointer != null) or !mouse.*.relative_mode_hide_cursor) {
                const rc: SDL_HitTestResult = pointer_focus.*.hit_test_result;
                _ = &rc;
                if (((seat.*.pointer.relative_pointer != null) or (rc == @as(SDL_HitTestResult, SDL_HITTEST_NORMAL))) or (rc == @as(SDL_HitTestResult, SDL_HITTEST_DRAGGABLE))) {
                    Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, pointer_focus, seat.*.pointer.enter_serial, mouse.*.cur_cursor);
                } else {
                    Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, pointer_focus, seat.*.pointer.enter_serial, sys_cursors[rc]);
                }
            } else {
                Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, pointer_focus, seat.*.pointer.enter_serial, null);
            }
        } else {
            Wayland_CursorStateSetCursor(&seat.*.pointer.cursor_state, &obj, pointer_focus, seat.*.pointer.enter_serial, null);
        }
    } else {
        Wayland_CursorStateResetCursor(&seat.*.pointer.cursor_state);
    }
}
pub export fn Wayland_TabletToolUpdateCursor(tool: [*c]SDL_WaylandPenTool) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var tool_focus: [*c]SDL_WindowData = tool.*.focus;
    _ = &tool_focus;
    const obj: Wayland_PointerObject = Wayland_PointerObject{
        .unnamed_0 = union_unnamed_123{
            .wl_tool = tool.*.wltool,
        },
        .is_pointer = @"false" != 0,
    };
    _ = &obj;
    if (tool_focus != null) {
        if (mouse.*.cursor_visible) {
            const relative: bool = (@as(SDL_WindowFlags, @bitCast(@as(c_long, @as(c_int, @intFromBool(mouse.*.pen_mouse_events))))) != 0) and ((tool_focus.*.sdlwindow.*.flags & @as(c_ulong, 32768)) != 0);
            _ = &relative;
            if (!relative or !mouse.*.relative_mode_hide_cursor) {
                Wayland_CursorStateSetCursor(&tool.*.cursor_state, &obj, tool_focus, tool.*.proximity_serial, mouse.*.cur_cursor);
            } else {
                Wayland_CursorStateSetCursor(&tool.*.cursor_state, &obj, tool_focus, tool.*.proximity_serial, null);
            }
        } else {
            Wayland_CursorStateSetCursor(&tool.*.cursor_state, &obj, tool_focus, tool.*.proximity_serial, null);
        }
    } else {
        Wayland_CursorStateResetCursor(&tool.*.cursor_state);
    }
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const WL_COMPOSITOR_CREATE_SURFACE = @as(c_int, 0);
pub const WL_BUFFER_DESTROY = @as(c_int, 0);
pub const WL_SURFACE_DESTROY = @as(c_int, 0);
pub const WL_SURFACE_ATTACH = @as(c_int, 1);
pub const WL_SURFACE_DAMAGE = @as(c_int, 2);
pub const WL_SURFACE_FRAME = @as(c_int, 3);
pub const WL_SURFACE_COMMIT = @as(c_int, 6);
pub const WL_SURFACE_DAMAGE_BUFFER = @as(c_int, 9);
pub const WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION = @as(c_int, 4);
pub const WL_POINTER_SET_CURSOR = @as(c_int, 0);
pub const WL_POINTER_WARP_SINCE_VERSION = @as(c_int, 11);
pub const WP_CURSOR_SHAPE_DEVICE_V1_DESTROY = @as(c_int, 0);
pub const WP_CURSOR_SHAPE_DEVICE_V1_SET_SHAPE = @as(c_int, 1);
pub const ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER = @as(c_int, 1);
pub const ZWP_LOCKED_POINTER_V1_DESTROY = @as(c_int, 0);
pub const ZWP_LOCKED_POINTER_V1_SET_CURSOR_POSITION_HINT = @as(c_int, 1);
pub const ZWP_CONFINED_POINTER_V1_DESTROY = @as(c_int, 0);
pub const WP_VIEWPORTER_GET_VIEWPORT = @as(c_int, 1);
pub const WP_VIEWPORT_DESTROY = @as(c_int, 0);
pub const WP_VIEWPORT_SET_SOURCE = @as(c_int, 1);
pub const WP_VIEWPORT_SET_DESTINATION = @as(c_int, 2);
pub const WP_POINTER_WARP_V1_WARP_POINTER = @as(c_int, 1);
pub const ZWP_TABLET_TOOL_V2_SET_CURSOR = @as(c_int, 0);
pub const xkb_context = struct_xkb_context;
pub const wl_seat = struct_wl_seat;
pub const wl_keyboard = struct_wl_keyboard;
pub const wl_pointer = struct_wl_pointer;
pub const wl_callback = struct_wl_callback;
pub const wl_touch = struct_wl_touch;
pub const xdg_toplevel = struct_xdg_toplevel;
