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
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_atof_REAL(str: [*c]const u8) f64;
pub extern fn SDL_ceilf_REAL(x: f32) f32;
pub extern fn SDL_fabs_REAL(x: f64) f64;
pub extern fn SDL_floorf_REAL(x: f32) f32;
pub extern fn SDL_truncf_REAL(x: f32) f32;
pub extern fn SDL_modff_REAL(x: f32, y: [*c]f32) f32;
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
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub const SDL_AudioDeviceID = Uint32;
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
pub extern fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool;
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
pub extern fn SDL_GetSurfaceProperties_REAL(surface: [*c]SDL_Surface) SDL_PropertiesID;
pub extern fn SDL_ConvertSurface_REAL(surface: [*c]SDL_Surface, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_CameraID = Uint32;
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
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
pub extern fn SDL_GetWindowMouseRect_REAL(window: [*c]SDL_Window) [*c]const SDL_Rect;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: ?*SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const SDL_SYSTEM_CURSOR_DEFAULT: c_int = 0;
pub const SDL_SYSTEM_CURSOR_COUNT: c_int = 34;
pub const enum_SDL_SystemCursor = c_uint;
pub const SDL_SystemCursor = enum_SDL_SystemCursor;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const struct_SDL_CursorFrameInfo = extern struct {
    surface: [*c]SDL_Surface = null,
    duration: Uint32 = 0,
};
pub const SDL_CursorFrameInfo = struct_SDL_CursorFrameInfo;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_MouseMotionTransformCallback = ?*const fn (userdata: ?*anyopaque, timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: [*c]f32, y: [*c]f32) callconv(.c) void;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const enum_SDL_TouchDeviceType = c_int;
pub const SDL_TouchDeviceType = enum_SDL_TouchDeviceType;
pub extern fn SDL_GetTouchDevices_REAL(count: [*c]c_int) [*c]SDL_TouchID;
pub extern fn SDL_GetTouchDeviceName_REAL(touchID: SDL_TouchID) [*c]const u8;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER: c_int = 524;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE: c_int = 525;
pub const SDL_EVENT_MOUSE_MOTION: c_int = 1024;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN: c_int = 1025;
pub const SDL_EVENT_MOUSE_BUTTON_UP: c_int = 1026;
pub const SDL_EVENT_MOUSE_WHEEL: c_int = 1027;
pub const SDL_EVENT_MOUSE_ADDED: c_int = 1028;
pub const SDL_EVENT_MOUSE_REMOVED: c_int = 1029;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const enum_SDL_EventType = c_uint;
pub const SDL_EventType = enum_SDL_EventType;
pub const struct_SDL_CommonEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    displayID: SDL_DisplayID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    data1: Sint32 = 0,
    data2: Sint32 = 0,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_KeyboardID = 0,
};
pub const SDL_KeyboardDeviceEvent = struct_SDL_KeyboardDeviceEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_KeyboardID = 0,
    scancode: SDL_Scancode = @import("std").mem.zeroes(SDL_Scancode),
    key: SDL_Keycode = 0,
    mod: SDL_Keymod = 0,
    raw: Uint16 = 0,
    down: bool = false,
    repeat: bool = false,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
    start: Sint32 = 0,
    length: Sint32 = 0,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextEditingCandidatesEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    candidates: [*c]const [*c]const u8 = null,
    num_candidates: Sint32 = 0,
    selected_candidate: Sint32 = 0,
    horizontal: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_TextEditingCandidatesEvent = struct_SDL_TextEditingCandidatesEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    text: [*c]const u8 = null,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_MouseID = 0,
};
pub const SDL_MouseDeviceEvent = struct_SDL_MouseDeviceEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    state: SDL_MouseButtonFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    xrel: f32 = 0,
    yrel: f32 = 0,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    button: Uint8 = 0,
    down: bool = false,
    clicks: Uint8 = 0,
    padding: Uint8 = 0,
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_MouseID = 0,
    x: f32 = 0,
    y: f32 = 0,
    direction: SDL_MouseWheelDirection = @import("std").mem.zeroes(SDL_MouseWheelDirection),
    mouse_x: f32 = 0,
    mouse_y: f32 = 0,
    integer_x: Sint32 = 0,
    integer_y: Sint32 = 0,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    ball: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    xrel: Sint16 = 0,
    yrel: Sint16 = 0,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    hat: Uint8 = 0,
    value: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    percent: c_int = 0,
};
pub const SDL_JoyBatteryEvent = struct_SDL_JoyBatteryEvent;
pub const struct_SDL_GamepadAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    axis: Uint8 = 0,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
    value: Sint16 = 0,
    padding4: Uint16 = 0,
};
pub const SDL_GamepadAxisEvent = struct_SDL_GamepadAxisEvent;
pub const struct_SDL_GamepadButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    button: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadButtonEvent = struct_SDL_GamepadButtonEvent;
pub const struct_SDL_GamepadDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
};
pub const SDL_GamepadDeviceEvent = struct_SDL_GamepadDeviceEvent;
pub const struct_SDL_GamepadTouchpadEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    touchpad: Sint32 = 0,
    finger: Sint32 = 0,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_GamepadTouchpadEvent = struct_SDL_GamepadTouchpadEvent;
pub const struct_SDL_GamepadSensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    sensor: Sint32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_GamepadSensorEvent = struct_SDL_GamepadSensorEvent;
pub const struct_SDL_GamepadCapSenseEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_JoystickID = 0,
    capsense: Uint8 = 0,
    down: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
};
pub const SDL_GamepadCapSenseEvent = struct_SDL_GamepadCapSenseEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_AudioDeviceID = 0,
    recording: bool = false,
    padding1: Uint8 = 0,
    padding2: Uint8 = 0,
    padding3: Uint8 = 0,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_CameraDeviceEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_CameraID = 0,
};
pub const SDL_CameraDeviceEvent = struct_SDL_CameraDeviceEvent;
pub const struct_SDL_NotificationEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_NotificationID = 0,
    action_id: [*c]const u8 = null,
};
pub const SDL_NotificationEvent = struct_SDL_NotificationEvent;
pub const struct_SDL_RenderEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_RenderEvent = struct_SDL_RenderEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    touchID: SDL_TouchID = 0,
    fingerID: SDL_FingerID = 0,
    x: f32 = 0,
    y: f32 = 0,
    dx: f32 = 0,
    dy: f32 = 0,
    pressure: f32 = 0,
    windowID: SDL_WindowID = 0,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_PinchFingerEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    scale: f32 = 0,
    windowID: SDL_WindowID = 0,
    span_x: f32 = 0,
    span_y: f32 = 0,
    focus_x: f32 = 0,
    focus_y: f32 = 0,
};
pub const SDL_PinchFingerEvent = struct_SDL_PinchFingerEvent;
pub const struct_SDL_PenProximityEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenProximityEvent = struct_SDL_PenProximityEvent;
pub const struct_SDL_PenMotionEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenMotionEvent = struct_SDL_PenMotionEvent;
pub const struct_SDL_PenTouchEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    eraser: bool = false,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenTouchEvent = struct_SDL_PenTouchEvent;
pub const struct_SDL_PenButtonEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    button: Uint8 = 0,
    down: bool = false,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenButtonEvent = struct_SDL_PenButtonEvent;
pub const struct_SDL_PenAxisEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    which: SDL_PenID = 0,
    pen_state: SDL_PenInputFlags = 0,
    x: f32 = 0,
    y: f32 = 0,
    axis: SDL_PenAxis = @import("std").mem.zeroes(SDL_PenAxis),
    value: f32 = 0,
    device_type: SDL_PenDeviceType = @import("std").mem.zeroes(SDL_PenDeviceType),
};
pub const SDL_PenAxisEvent = struct_SDL_PenAxisEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    x: f32 = 0,
    y: f32 = 0,
    source: [*c]const u8 = null,
    data: [*c]const u8 = null,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_ClipboardEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    owner: bool = false,
    num_mime_types: Sint32 = 0,
    mime_types: [*c][*c]const u8 = null,
};
pub const SDL_ClipboardEvent = struct_SDL_ClipboardEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    which: SDL_SensorID = 0,
    data: [6]f32 = @import("std").mem.zeroes([6]f32),
    sensor_timestamp: Uint64 = 0,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: SDL_EventType = @import("std").mem.zeroes(SDL_EventType),
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: Uint32 = 0,
    reserved: Uint32 = 0,
    timestamp: Uint64 = 0,
    windowID: SDL_WindowID = 0,
    code: Sint32 = 0,
    data1: ?*anyopaque = null,
    data2: ?*anyopaque = null,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const union_SDL_Event = extern union {
    type: Uint32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    kdevice: SDL_KeyboardDeviceEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    edit_candidates: SDL_TextEditingCandidatesEvent,
    text: SDL_TextInputEvent,
    mdevice: SDL_MouseDeviceEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jdevice: SDL_JoyDeviceEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jbattery: SDL_JoyBatteryEvent,
    gdevice: SDL_GamepadDeviceEvent,
    gaxis: SDL_GamepadAxisEvent,
    gbutton: SDL_GamepadButtonEvent,
    gtouchpad: SDL_GamepadTouchpadEvent,
    gsensor: SDL_GamepadSensorEvent,
    gcapsense: SDL_GamepadCapSenseEvent,
    adevice: SDL_AudioDeviceEvent,
    cdevice: SDL_CameraDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    tfinger: SDL_TouchFingerEvent,
    pinch: SDL_PinchFingerEvent,
    pproximity: SDL_PenProximityEvent,
    ptouch: SDL_PenTouchEvent,
    pmotion: SDL_PenMotionEvent,
    pbutton: SDL_PenButtonEvent,
    paxis: SDL_PenAxisEvent,
    render: SDL_RenderEvent,
    drop: SDL_DropEvent,
    clipboard: SDL_ClipboardEvent,
    notification: SDL_NotificationEvent,
    padding: [128]Uint8,
};
pub const SDL_Event = union_SDL_Event;
comptime {
    if (!(@sizeOf(SDL_Event) == @sizeOf(@TypeOf(@as([*c]SDL_Event, null).*.padding)))) @compileError("static assertion failed \"sizeof(SDL_Event) == sizeof((SDL_static_cast(SDL_Event *, NULL))->padding)\"");
}
pub extern fn SDL_FlushEvent_REAL(@"type": Uint32) void;
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub extern fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) ?*SDL_HashTable;
pub extern fn SDL_DestroyHashTable(table: ?*SDL_HashTable) void;
pub extern fn SDL_InsertIntoHashTable(table: ?*SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool;
pub extern fn SDL_FindInHashTable(table: ?*const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool;
pub extern fn SDL_HashID(unused: ?*anyopaque, key: ?*const anyopaque) Uint32;
pub extern fn SDL_KeyMatchID(unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool;
pub extern fn SDL_DestroyHashValue(unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
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
pub extern fn SDL_CreateSurfaceZeroed(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub extern fn SDL_CreateSurfaceUninitialized(width: c_int, height: c_int, format: SDL_PixelFormat) [*c]SDL_Surface;
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_GetMessageBoxCount() c_int;
pub extern fn SDL_UpdateWindowGrab(window: [*c]SDL_Window) void;
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
pub extern fn SDL_AddTouch(id: SDL_TouchID, @"type": SDL_TouchDeviceType, name: [*c]const u8) c_int;
pub extern fn SDL_SendTouch(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, @"type": SDL_EventType, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendTouchMotion(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_DelTouch(id: SDL_TouchID) void;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub var SDL_mouse: SDL_Mouse = @import("std").mem.zeroes(SDL_Mouse);
pub var SDL_mouse_count: c_int = 0;
pub var SDL_mice: [*c]SDL_MouseID = null;
pub var SDL_mouse_names: ?*SDL_HashTable = null;
pub var SDL_mouse_initialized: bool = false;
pub var track_mouse_down: bool = @"false" != 0;
pub fn SDL_MouseDoubleClickTimeChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        mouse.*.double_click_time = @bitCast(@as(c_int, SDL_atoi_REAL(hint)));
    } else {
        mouse.*.double_click_time = 500;
    }
}
pub fn SDL_MouseDoubleClickRadiusChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        mouse.*.double_click_radius = SDL_atoi_REAL(hint);
    } else {
        mouse.*.double_click_radius = 32;
    }
}
pub fn SDL_MouseNormalSpeedScaleChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        mouse.*.enable_normal_speed_scale = @"true" != 0;
        mouse.*.normal_speed_scale = @floatCast(SDL_atof_REAL(hint));
    } else {
        mouse.*.enable_normal_speed_scale = @"false" != 0;
        mouse.*.normal_speed_scale = 1.0;
    }
}
pub fn SDL_MouseRelativeSpeedScaleChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        mouse.*.enable_relative_speed_scale = @"true" != 0;
        mouse.*.relative_speed_scale = @floatCast(SDL_atof_REAL(hint));
    } else {
        mouse.*.enable_relative_speed_scale = @"false" != 0;
        mouse.*.relative_speed_scale = 1.0;
    }
}
pub fn SDL_MouseRelativeModeCenterChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.relative_mode_center = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub fn SDL_MouseRelativeSystemScaleChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.enable_relative_system_scale = SDL_GetStringBoolean(hint, @"false" != 0);
}
pub fn SDL_MouseWarpEmulationChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.warp_emulation_hint = SDL_GetStringBoolean(hint, @"true" != 0);
    if (!mouse.*.warp_emulation_hint and mouse.*.warp_emulation_active) {
        _ = SDL_SetRelativeMouseMode(@"false" != 0);
        mouse.*.warp_emulation_active = @"false" != 0;
    }
}
pub fn SDL_TouchMouseEventsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.touch_mouse_events = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub fn SDL_MouseTouchEventsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    var default_value: bool = undefined;
    _ = &default_value;
    default_value = @"false" != 0;
    mouse.*.mouse_touch_events = SDL_GetStringBoolean(hint, default_value);
    if (mouse.*.mouse_touch_events) {
        if (!mouse.*.added_mouse_touch_device) {
            _ = SDL_AddTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 1)))), SDL_TOUCH_DEVICE_DIRECT, "mouse_input");
            mouse.*.added_mouse_touch_device = @"true" != 0;
        }
    } else {
        if (mouse.*.added_mouse_touch_device) {
            SDL_DelTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 1)))));
            mouse.*.added_mouse_touch_device = @"false" != 0;
        }
    }
}
pub fn SDL_PenMouseEventsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.pen_mouse_events = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub fn SDL_MouseAutoCaptureChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    var auto_capture: bool = SDL_GetStringBoolean(hint, @"true" != 0);
    _ = &auto_capture;
    if (@as(c_int, @intFromBool(auto_capture)) != @as(c_int, @intFromBool(mouse.*.auto_capture))) {
        mouse.*.auto_capture = auto_capture;
        _ = SDL_UpdateMouseCapture(@"false" != 0);
    }
}
pub fn SDL_MouseRelativeWarpMotionChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.relative_mode_warp_motion = SDL_GetStringBoolean(hint, @"false" != 0);
}
pub fn SDL_MouseRelativeCursorVisibleChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    mouse.*.relative_mode_hide_cursor = !SDL_GetStringBoolean(hint, @"false" != 0);
    SDL_RedrawCursor();
}
pub fn SDL_MouseIntegerModeChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = @ptrCast(@alignCast(userdata));
    _ = &mouse;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        mouse.*.integer_mode_flags = @bitCast(@as(i8, @truncate(SDL_atoi_REAL(hint))));
    } else {
        mouse.*.integer_mode_flags = 0;
    }
}
pub export fn SDL_PreInitMouse() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    SDL_mouse_initialized = @"true" != 0;
    _ = memset(@ptrCast(@alignCast(mouse)), 0, @sizeOf(@TypeOf(mouse.*)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_DOUBLE_CLICK_TIME", SDL_MouseDoubleClickTimeChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_DOUBLE_CLICK_RADIUS", SDL_MouseDoubleClickRadiusChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_NORMAL_SPEED_SCALE", SDL_MouseNormalSpeedScaleChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_RELATIVE_SPEED_SCALE", SDL_MouseRelativeSpeedScaleChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_RELATIVE_SYSTEM_SCALE", SDL_MouseRelativeSystemScaleChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_RELATIVE_MODE_CENTER", SDL_MouseRelativeModeCenterChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE", SDL_MouseWarpEmulationChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_TOUCH_MOUSE_EVENTS", SDL_TouchMouseEventsChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_TOUCH_EVENTS", SDL_MouseTouchEventsChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_PEN_MOUSE_EVENTS", SDL_PenMouseEventsChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_AUTO_CAPTURE", SDL_MouseAutoCaptureChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_RELATIVE_WARP_MOTION", SDL_MouseRelativeWarpMotionChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_RELATIVE_CURSOR_VISIBLE", SDL_MouseRelativeCursorVisibleChanged, @ptrCast(@alignCast(mouse)));
    _ = SDL_AddHintCallback_REAL("SDL_MOUSE_INTEGER_MODE", SDL_MouseIntegerModeChanged, @ptrCast(@alignCast(mouse)));
    mouse.*.was_touch_mouse_events = @"false" != 0;
    mouse.*.cursor_visible = @"true" != 0;
    SDL_mouse_names = SDL_CreateHashTable(0, @"true" != 0, SDL_HashID, SDL_KeyMatchID, SDL_DestroyHashValue, null);
    return @"true" != 0;
}
pub export fn SDL_PostInitMouse() void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!(mouse.*.def_cursor != null)) {
        var surface: [*c]SDL_Surface = SDL_CreateSurfaceZeroed(1, 1, SDL_PIXELFORMAT_ARGB8888);
        _ = &surface;
        if (surface != null) {
            SDL_SetDefaultCursor(SDL_CreateColorCursor_REAL(surface, 0, 0));
            SDL_DestroySurface_REAL(surface);
        }
    }
}
pub export fn SDL_IsMouse(_: Uint16, _: Uint16) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_GetMouseIndex(mouseID: SDL_MouseID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < SDL_mouse_count) : (i += 1) {
            if (mouseID == SDL_mice[@bitCast(@as(isize, @intCast(i)))]) {
                return i;
            }
        }
    }
    return -@as(c_int, 1);
}
pub export fn SDL_AddMouse(mouseID: SDL_MouseID, arg_name: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var name = arg_name;
    _ = &name;
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SDL_AddMouse".*;
    };
    _ = &static_local___func__;
    var mouse_index: c_int = SDL_GetMouseIndex(mouseID);
    _ = &mouse_index;
    if (mouse_index >= @as(c_int, 0)) {
        return;
    }
    while (true) {
        while (!(mouseID != @as(SDL_MouseID, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "mouseID != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_mouse.c", 334);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    var mice: [*c]SDL_MouseID = undefined;
    mice = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(SDL_mice)), @as(c_ulong, @bitCast(@as(c_long, SDL_mouse_count + @as(c_int, 1)))) *% @sizeOf(@TypeOf(mice.*)))));
    _ = &mice;
    if (!(mice != null)) {
        return;
    }
    mice[@bitCast(@as(isize, @intCast(SDL_mouse_count)))] = mouseID;
    SDL_mice = mice;
    SDL_mouse_count += 1;
    if (!(name != null)) {
        name = "Mouse";
    }
    _ = SDL_InsertIntoHashTable(SDL_mouse_names, @ptrFromInt(@as(usize, mouseID)), @ptrCast(@alignCast(SDL_strdup_REAL(name))), @"true" != 0);
    var event: SDL_Event = undefined;
    _ = &event;
    _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
    event.type = SDL_EVENT_MOUSE_ADDED;
    event.mdevice.which = mouseID;
    _ = SDL_PushEvent_REAL(&event);
}
pub export fn SDL_RemoveMouse(mouseID: SDL_MouseID) void {
    @setEvalBranchQuota(100000);
    var mouse_index: c_int = SDL_GetMouseIndex(mouseID);
    _ = &mouse_index;
    if (mouse_index < @as(c_int, 0)) {
        return;
    }
    if (mouse_index != (SDL_mouse_count - @as(c_int, 1))) {
        _ = memmove(@ptrCast(@alignCast(&SDL_mice[@bitCast(@as(isize, @intCast(mouse_index)))])), @ptrCast(@alignCast(&SDL_mice[@bitCast(@as(isize, @intCast(mouse_index + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, (SDL_mouse_count - mouse_index) - @as(c_int, 1)))) *% @sizeOf(@TypeOf(SDL_mice[@bitCast(@as(isize, @intCast(mouse_index)))])));
    }
    SDL_mouse_count -= 1;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < mouse.*.num_sources) : (i += 1) {
            var source: [*c]SDL_MouseInputSource = &mouse.*.sources[@bitCast(@as(isize, @intCast(i)))];
            _ = &source;
            if (source.*.mouseID == mouseID) {
                SDL_free_REAL(@ptrCast(@alignCast(source.*.clickstate)));
                if (i != (mouse.*.num_sources - @as(c_int, 1))) {
                    _ = memmove(@ptrCast(@alignCast(&mouse.*.sources[@bitCast(@as(isize, @intCast(i)))])), @ptrCast(@alignCast(&mouse.*.sources[@bitCast(@as(isize, @intCast(i + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, (mouse.*.num_sources - i) - @as(c_int, 1)))) *% @sizeOf(@TypeOf(mouse.*.sources[@bitCast(@as(isize, @intCast(i)))])));
                }
                mouse.*.num_sources -= 1;
                break;
            }
        }
    }
    if (SDL_mouse_initialized) {
        var event: SDL_Event = undefined;
        _ = &event;
        _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
        event.type = SDL_EVENT_MOUSE_REMOVED;
        event.mdevice.which = mouseID;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_HasMouse_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_mouse_count > @as(c_int, 0);
}
pub export fn SDL_GetMice_REAL(count: [*c]c_int) [*c]SDL_MouseID {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var mice: [*c]SDL_MouseID = undefined;
    _ = &mice;
    mice = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, SDL_mouse_count + @as(c_int, 1)))) *% @sizeOf(@TypeOf(mice.*)))));
    if (mice != null) {
        if (count != null) {
            count.* = SDL_mouse_count;
        }
        {
            i = 0;
            while (i < SDL_mouse_count) : (i += 1) {
                mice[@bitCast(@as(isize, @intCast(i)))] = SDL_mice[@bitCast(@as(isize, @intCast(i)))];
            }
        }
        mice[@bitCast(@as(isize, @intCast(i)))] = 0;
    } else {
        if (count != null) {
            count.* = 0;
        }
    }
    return mice;
}
pub export fn SDL_GetMouseNameForID_REAL(instance_id: SDL_MouseID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var name: [*c]const u8 = undefined;
    _ = &name;
    var devices: [*c]SDL_TouchID = undefined;
    _ = &devices;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                name = null;
                switch (instance_id) {
                    @as(SDL_MouseID, SDL_GLOBAL_MOUSE_ID) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 11;
                        continue;
                    },
                }
            },
            1 => {
                return name;
            },
            2 => {
                name = "Mouse";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                devices = SDL_GetTouchDevices_REAL(null);
                if (devices != null) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                name = SDL_GetTouchDeviceName_REAL(devices[@as(c_int, 0)]);
                SDL_free_REAL(@ptrCast(@alignCast(devices)));
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
                if (!(name != null)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                name = "Touch";
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
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                name = "Pen";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                if (!SDL_FindInHashTable(SDL_mouse_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(&name)))) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            12 => {
                _ = SDL_SetError_REAL("Mouse %u not found", instance_id);
                return null;
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                if (!(name != null)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                _ = SDL_OutOfMemory_REAL();
                return null;
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SetDefaultCursor(cursor: [*c]SDL_Cursor) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (cursor == mouse.*.def_cursor) {
        return;
    }
    if (mouse.*.def_cursor != null) {
        var default_cursor: [*c]SDL_Cursor = mouse.*.def_cursor;
        _ = &default_cursor;
        var prev: [*c]SDL_Cursor = undefined;
        _ = &prev;
        var curr: [*c]SDL_Cursor = undefined;
        _ = &curr;
        if (mouse.*.cur_cursor == mouse.*.def_cursor) {
            mouse.*.cur_cursor = null;
        }
        mouse.*.def_cursor = null;
        {
            prev = null;
            curr = mouse.*.cursors;
            while (curr != null) : ({
                prev = curr;
                curr = curr.*.next;
            }) {
                if (curr == default_cursor) {
                    if (prev != null) {
                        prev.*.next = curr.*.next;
                    } else {
                        mouse.*.cursors = curr.*.next;
                    }
                    break;
                }
            }
        }
        if ((mouse.*.FreeCursor != null) and (default_cursor.*.internal != null)) {
            mouse.*.FreeCursor.?(default_cursor);
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(default_cursor)));
        }
    }
    mouse.*.def_cursor = cursor;
    if (!(mouse.*.cur_cursor != null)) {
        _ = SDL_SetCursor_REAL(cursor);
    }
}
pub export fn SDL_GetDefaultSystemCursor() SDL_SystemCursor {
    @setEvalBranchQuota(100000);
    var id: SDL_SystemCursor = SDL_SYSTEM_CURSOR_DEFAULT;
    _ = &id;
    var value: [*c]const u8 = SDL_GetHint_REAL("SDL_MOUSE_DEFAULT_SYSTEM_CURSOR");
    _ = &value;
    if (value != null) {
        var index_1: c_int = SDL_atoi_REAL(value);
        _ = &index_1;
        if ((@as(c_int, 0) <= index_1) and (index_1 < SDL_SYSTEM_CURSOR_COUNT)) {
            id = @bitCast(index_1);
        }
    }
    return id;
}
pub export fn SDL_GetMouse() [*c]SDL_Mouse {
    @setEvalBranchQuota(100000);
    return &SDL_mouse;
}
pub fn SDL_GetMouseButtonState(mouse: [*c]SDL_Mouse, mouseID: SDL_MouseID, include_touch: bool) callconv(.c) SDL_MouseButtonFlags {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var buttonstate: SDL_MouseButtonFlags = 0;
    _ = &buttonstate;
    {
        i = 0;
        while (i < mouse.*.num_sources) : (i += 1) {
            if ((mouseID == @as(SDL_MouseID, SDL_GLOBAL_MOUSE_ID)) or (mouseID == @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))))) {
                if (include_touch or (mouse.*.sources[@bitCast(@as(isize, @intCast(i)))].mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))))) {
                    buttonstate |= mouse.*.sources[@bitCast(@as(isize, @intCast(i)))].buttonstate;
                }
            } else {
                if (mouseID == mouse.*.sources[@bitCast(@as(isize, @intCast(i)))].mouseID) {
                    buttonstate |= mouse.*.sources[@bitCast(@as(isize, @intCast(i)))].buttonstate;
                    break;
                }
            }
        }
    }
    return buttonstate;
}
pub export fn SDL_GetMouseFocus_REAL() [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    return mouse.*.focus;
}
pub export fn SDL_SetMouseFocus(window: [*c]SDL_Window) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.focus == window) {
        return;
    }
    if (mouse.*.focus != null) {
        _ = SDL_SendWindowEvent(mouse.*.focus, SDL_EVENT_WINDOW_MOUSE_LEAVE, 0, 0);
    }
    mouse.*.focus = window;
    mouse.*.has_position = @"false" != 0;
    if (mouse.*.focus != null) {
        _ = SDL_SendWindowEvent(mouse.*.focus, SDL_EVENT_WINDOW_MOUSE_ENTER, 0, 0);
    }
    SDL_RedrawCursor();
}
pub export fn SDL_MousePositionInWindow(window: [*c]SDL_Window, arg_x: f32, arg_y: f32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    if (!(window != null)) {
        return @"false" != 0;
    }
    if ((window != null) and !((window.*.flags & @as(c_ulong, 16384)) != 0)) {
        if ((((x < @as(f32, 0.0)) or (y < @as(f32, 0.0))) or (x >= @as(f32, @floatFromInt(window.*.w)))) or (y >= @as(f32, @floatFromInt(window.*.h)))) {
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub fn SDL_UpdateMouseFocus(window: [*c]SDL_Window, x: f32, y: f32, _: Uint32, send_mouse_motion: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var inWindow: bool = SDL_MousePositionInWindow(window, x, y);
    _ = &inWindow;
    if (!inWindow) {
        if (window == mouse.*.focus) {
            if (send_mouse_motion) {
                SDL_PrivateSendMouseMotion(0, window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, x, y);
            }
            SDL_SetMouseFocus(null);
        }
        return @"false" != 0;
    }
    if (window != mouse.*.focus) {
        SDL_SetMouseFocus(window);
        if (send_mouse_motion) {
            SDL_PrivateSendMouseMotion(0, window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, x, y);
        }
    }
    return @"true" != 0;
}
pub export fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void {
    @setEvalBranchQuota(100000);
    if ((window != null) and !relative) {
        var mouse: [*c]SDL_Mouse = SDL_GetMouse();
        _ = &mouse;
        if (!SDL_UpdateMouseFocus(window, x, y, SDL_GetMouseButtonState(mouse, mouseID, @"true" != 0), (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))))) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2))))))) {
            return;
        }
    }
    SDL_PrivateSendMouseMotion(timestamp, window, mouseID, relative, x, y);
}
pub export fn SDL_SendMouseWarp(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, x: f32, y: f32) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    mouse.*.last_x = x;
    mouse.*.last_y = y;
    mouse.*.has_position = @"false" != 0;
    if (mouse.*.relative_mode) {
        if (!mouse.*.relative_mode_warp_motion) {
            mouse.*.x = x;
            mouse.*.y = y;
            mouse.*.has_position = @"true" != 0;
            return;
        }
    }
    SDL_SendMouseMotion(timestamp, window, mouseID, @"false" != 0, x, y);
}
pub fn ConstrainMousePosition(mouse: [*c]SDL_Mouse, window: [*c]SDL_Window, x: [*c]f32, y: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if ((window != null) and !((window.*.flags & @as(c_ulong, 16384)) != 0)) {
        var x_min: c_int = 0;
        _ = &x_min;
        var x_max: c_int = window.*.w - @as(c_int, 1);
        _ = &x_max;
        var y_min: c_int = 0;
        _ = &y_min;
        var y_max: c_int = window.*.h - @as(c_int, 1);
        _ = &y_max;
        var confine: [*c]const SDL_Rect = SDL_GetWindowMouseRect_REAL(window);
        _ = &confine;
        if (confine != null) {
            var window_rect: SDL_Rect = undefined;
            _ = &window_rect;
            var mouse_rect: SDL_Rect = undefined;
            _ = &mouse_rect;
            window_rect.x = 0;
            window_rect.y = 0;
            window_rect.w = x_max + @as(c_int, 1);
            window_rect.h = y_max + @as(c_int, 1);
            if (SDL_GetRectIntersection_REAL(confine, &window_rect, &mouse_rect)) {
                x_min = mouse_rect.x;
                y_min = mouse_rect.y;
                x_max = (x_min + mouse_rect.w) - @as(c_int, 1);
                y_max = (y_min + mouse_rect.h) - @as(c_int, 1);
            }
        }
        if (x.* >= @as(f32, @floatFromInt(x_max + @as(c_int, 1)))) {
            x.* = if (@as(f32, @floatFromInt(x_max)) > mouse.*.last_x) @as(f32, @floatFromInt(x_max)) else mouse.*.last_x;
        }
        if (x.* < @as(f32, @floatFromInt(x_min))) {
            x.* = @floatFromInt(x_min);
        }
        if (y.* >= @as(f32, @floatFromInt(y_max + @as(c_int, 1)))) {
            y.* = if (@as(f32, @floatFromInt(y_max)) > mouse.*.last_y) @as(f32, @floatFromInt(y_max)) else mouse.*.last_y;
        }
        if (y.* < @as(f32, @floatFromInt(y_min))) {
            y.* = @floatFromInt(y_min);
        }
    }
}
pub fn SDL_PrivateSendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, arg_mouseID: SDL_MouseID, relative: bool, arg_x: f32, arg_y: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouseID = arg_mouseID;
    _ = &mouseID;
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var xrel: f32 = 0.0;
    _ = &xrel;
    var yrel: f32 = 0.0;
    _ = &yrel;
    var window_is_relative: bool = (mouse.*.focus != null) and ((mouse.*.focus.*.flags & @as(c_ulong, 32768)) != 0);
    _ = &window_is_relative;
    if (mouse.*.mouse_touch_events) {
        if ((((mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))))) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))))) and !relative) and track_mouse_down) {
            if (window != null) {
                var normalized_x: f32 = x / @as(f32, @floatFromInt(window.*.w));
                _ = &normalized_x;
                var normalized_y: f32 = y / @as(f32, @floatFromInt(window.*.h));
                _ = &normalized_y;
                SDL_SendTouchMotion(timestamp, @as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 1)))), SDL_BUTTON_LEFT, window, normalized_x, normalized_y, 1.0);
            }
        }
    }
    if (!mouse.*.touch_mouse_events and (mouseID == @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))))) {
        return;
    }
    if (relative) {
        if (mouse.*.relative_mode) {
            if (mouse.*.InputTransform != null) {
                var data: ?*anyopaque = mouse.*.input_transform_data;
                _ = &data;
                mouse.*.InputTransform.?(data, timestamp, window, mouseID, &x, &y);
            } else {
                if (mouse.*.enable_relative_system_scale) {
                    if (mouse.*.ApplySystemScale != null) {
                        mouse.*.ApplySystemScale.?(mouse.*.system_scale_data, timestamp, window, mouseID, &x, &y);
                    }
                }
                if (mouse.*.enable_relative_speed_scale) {
                    x *= mouse.*.relative_speed_scale;
                    y *= mouse.*.relative_speed_scale;
                }
            }
        } else {
            if (mouse.*.enable_normal_speed_scale) {
                x *= mouse.*.normal_speed_scale;
                y *= mouse.*.normal_speed_scale;
            }
        }
        if ((@as(c_int, mouse.*.integer_mode_flags) & @as(c_int, 1)) != 0) {
            mouse.*.integer_mode_residual_motion_x = SDL_modff_REAL(mouse.*.integer_mode_residual_motion_x + x, &x);
            mouse.*.integer_mode_residual_motion_y = SDL_modff_REAL(mouse.*.integer_mode_residual_motion_y + y, &y);
        }
        xrel = x;
        yrel = y;
        x = mouse.*.last_x + xrel;
        y = mouse.*.last_y + yrel;
        ConstrainMousePosition(mouse, window, &x, &y);
    } else {
        if ((@as(c_int, mouse.*.integer_mode_flags) & @as(c_int, 1)) != 0) {
            x = SDL_truncf_REAL(x);
            y = SDL_truncf_REAL(y);
        }
        ConstrainMousePosition(mouse, window, &x, &y);
        if (mouse.*.has_position) {
            xrel = x - mouse.*.last_x;
            yrel = y - mouse.*.last_y;
        }
    }
    if ((mouse.*.has_position and (xrel == @as(f32, 0.0))) and (yrel == @as(f32, 0.0))) {
        return;
    }
    if ((mouseID == @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))))) and !(SDL_GetMouseButtonState(mouse, mouseID, @"true" != 0) != 0)) {
        xrel = 0.0;
        yrel = 0.0;
    }
    {
        mouse.*.x_accu += xrel;
        mouse.*.y_accu += yrel;
        if (relative and mouse.*.has_position) {
            mouse.*.x += xrel;
            mouse.*.y += yrel;
            ConstrainMousePosition(mouse, window, &mouse.*.x, &mouse.*.y);
        } else {
            mouse.*.x = x;
            mouse.*.y = y;
        }
        mouse.*.has_position = @"true" != 0;
        mouse.*.last_x = if (relative) mouse.*.x else x;
        mouse.*.last_y = if (relative) mouse.*.y else y;
        mouse.*.click_motion_x += @floatCast(xrel);
        mouse.*.click_motion_y += @floatCast(yrel);
    }
    if (((mouse.*.cursor_visible and !mouse.*.relative_mode) and (mouse.*.MoveCursor != null)) and (mouse.*.cur_cursor != null)) {
        _ = mouse.*.MoveCursor.?(mouse.*.cur_cursor);
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_MOUSE_MOTION)) {
        if (((!mouse.*.relative_mode or mouse.*.warp_emulation_active) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))))) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))))) {
            mouseID = SDL_GLOBAL_MOUSE_ID;
        }
        if (!relative and window_is_relative) {
            if (!mouse.*.relative_mode_warp_motion) {
                return;
            }
            xrel = 0.0;
            yrel = 0.0;
        }
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_MOUSE_MOTION;
        event.common.timestamp = timestamp;
        event.motion.windowID = if (mouse.*.focus != null) mouse.*.focus.*.id else @as(SDL_WindowID, 0);
        event.motion.which = mouseID;
        mouse.*.was_touch_mouse_events = mouseID == @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))));
        event.motion.state = SDL_GetMouseButtonState(mouse, mouseID, @"true" != 0);
        event.motion.x = mouse.*.x;
        event.motion.y = mouse.*.y;
        event.motion.xrel = xrel;
        event.motion.yrel = yrel;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub fn GetMouseInputSource(mouse: [*c]SDL_Mouse, mouseID: SDL_MouseID, down: bool, button: Uint8) callconv(.c) [*c]SDL_MouseInputSource {
    @setEvalBranchQuota(100000);
    var source: [*c]SDL_MouseInputSource = undefined;
    _ = &source;
    var match: [*c]SDL_MouseInputSource = null;
    _ = &match;
    var sources: [*c]SDL_MouseInputSource = undefined;
    _ = &sources;
    var i: c_int = undefined;
    _ = &i;
    if (SDL_mouse_initialized) {
        {
            i = 0;
            while (i < mouse.*.num_sources) : (i += 1) {
                source = &mouse.*.sources[@bitCast(@as(isize, @intCast(i)))];
                if (source.*.mouseID == mouseID) {
                    match = source;
                    break;
                }
            }
        }
        if (!down and (!(match != null) or !((match.*.buttonstate & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, button) - @as(c_int, 1))))))) != 0))) {
            {
                i = 0;
                while (i < mouse.*.num_sources) : (i += 1) {
                    source = &mouse.*.sources[@bitCast(@as(isize, @intCast(i)))];
                    if ((source.*.buttonstate & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, button) - @as(c_int, 1))))))) != 0) {
                        match = source;
                        break;
                    }
                }
            }
        }
        if (match != null) {
            return match;
        }
        sources = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(mouse.*.sources)), @as(c_ulong, @bitCast(@as(c_long, mouse.*.num_sources + @as(c_int, 1)))) *% @sizeOf(@TypeOf(mouse.*.sources.*)))));
        if (sources != null) {
            mouse.*.sources = sources;
            mouse.*.num_sources += 1;
            source = &sources[@bitCast(@as(isize, @intCast(mouse.*.num_sources - @as(c_int, 1))))];
            _ = memset(@ptrCast(@alignCast(source)), 0, @sizeOf(@TypeOf(source.*)));
            source.*.mouseID = mouseID;
            return source;
        }
    }
    return null;
}
pub fn GetMouseClickState(source: [*c]SDL_MouseInputSource, button: Uint8) callconv(.c) [*c]SDL_MouseClickState {
    @setEvalBranchQuota(100000);
    if (@as(c_int, button) >= source.*.num_clickstates) {
        var i: c_int = undefined;
        _ = &i;
        var count: c_int = @as(c_int, button) + @as(c_int, 1);
        _ = &count;
        var clickstate: [*c]SDL_MouseClickState = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(source.*.clickstate)), @as(c_ulong, @bitCast(@as(c_long, count))) *% @sizeOf(@TypeOf(source.*.clickstate.*)))));
        _ = &clickstate;
        if (!(clickstate != null)) {
            return null;
        }
        source.*.clickstate = clickstate;
        {
            i = source.*.num_clickstates;
            while (i < count) : (i += 1) {
                _ = memset(@ptrCast(@alignCast(&source.*.clickstate[@bitCast(@as(isize, @intCast(i)))])), 0, @sizeOf(@TypeOf(source.*.clickstate[@bitCast(@as(isize, @intCast(i)))])));
            }
        }
        source.*.num_clickstates = count;
    }
    return &source.*.clickstate[button];
}
pub fn SDL_PrivateSendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, arg_mouseID: SDL_MouseID, button: Uint8, down: bool, arg_clicks: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouseID = arg_mouseID;
    _ = &mouseID;
    var clicks = arg_clicks;
    _ = &clicks;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var @"type": SDL_EventType = undefined;
    _ = &@"type";
    var buttonstate: Uint32 = undefined;
    _ = &buttonstate;
    var source: [*c]SDL_MouseInputSource = undefined;
    _ = &source;
    source = GetMouseInputSource(mouse, mouseID, down, button);
    if (!(source != null)) {
        return;
    }
    buttonstate = source.*.buttonstate;
    if (mouse.*.mouse_touch_events) {
        if (((mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))))) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))))) and (@as(c_int, button) == SDL_BUTTON_LEFT)) {
            if (down) {
                track_mouse_down = @"true" != 0;
            } else {
                track_mouse_down = @"false" != 0;
            }
            if (window != null) {
                @"type" = @bitCast(if (track_mouse_down) SDL_EVENT_FINGER_DOWN else SDL_EVENT_FINGER_UP);
                var normalized_x: f32 = mouse.*.x / @as(f32, @floatFromInt(window.*.w));
                _ = &normalized_x;
                var normalized_y: f32 = mouse.*.y / @as(f32, @floatFromInt(window.*.h));
                _ = &normalized_y;
                SDL_SendTouch(timestamp, @as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 1)))), SDL_BUTTON_LEFT, window, @"type", normalized_x, normalized_y, 1.0);
            }
        }
    }
    if (@as(c_int, @intFromBool(mouse.*.touch_mouse_events)) == @as(c_int, 0)) {
        if (mouseID == @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1))))) {
            return;
        }
    }
    if (down) {
        @"type" = SDL_EVENT_MOUSE_BUTTON_DOWN;
        buttonstate |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, button) - @as(c_int, 1)))));
    } else {
        @"type" = SDL_EVENT_MOUSE_BUTTON_UP;
        buttonstate &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, button) - @as(c_int, 1))))));
    }
    if ((window != null) and down) {
        _ = SDL_UpdateMouseFocus(window, mouse.*.x, mouse.*.y, buttonstate, @"true" != 0);
    }
    if (buttonstate == source.*.buttonstate) {
        return;
    }
    source.*.buttonstate = buttonstate;
    if (clicks < @as(c_int, 0)) {
        var clickstate: [*c]SDL_MouseClickState = GetMouseClickState(source, button);
        _ = &clickstate;
        if (clickstate != null) {
            if (down) {
                var now: Uint64 = SDL_GetTicks_REAL();
                _ = &now;
                if (((now >= (clickstate.*.last_timestamp +% @as(Uint64, mouse.*.double_click_time))) or (SDL_fabs_REAL(mouse.*.click_motion_x - clickstate.*.click_motion_x) > @as(f64, @floatFromInt(mouse.*.double_click_radius)))) or (SDL_fabs_REAL(mouse.*.click_motion_y - clickstate.*.click_motion_y) > @as(f64, @floatFromInt(mouse.*.double_click_radius)))) {
                    clickstate.*.click_count = 0;
                }
                clickstate.*.last_timestamp = now;
                clickstate.*.click_motion_x = mouse.*.click_motion_x;
                clickstate.*.click_motion_y = mouse.*.click_motion_y;
                if (@as(c_int, clickstate.*.click_count) < @as(c_int, 255)) {
                    clickstate.*.click_count +%= 1;
                }
            }
            clicks = clickstate.*.click_count;
        } else {
            clicks = 1;
        }
    }
    if (SDL_EventEnabled_REAL(@"type")) {
        if (((!mouse.*.relative_mode or mouse.*.warp_emulation_active) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 1)))))) and (mouseID != @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))))) {
            mouseID = SDL_GLOBAL_MOUSE_ID;
        } else {
            mouseID = source.*.mouseID;
        }
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = @"type";
        event.common.timestamp = timestamp;
        event.button.windowID = if (mouse.*.focus != null) mouse.*.focus.*.id else @as(SDL_WindowID, 0);
        event.button.which = mouseID;
        event.button.down = down;
        event.button.button = button;
        event.button.clicks = @bitCast(@as(i8, @truncate(if (clicks < @as(c_int, 255)) clicks else @as(c_int, 255))));
        event.button.x = mouse.*.x;
        event.button.y = mouse.*.y;
        _ = SDL_PushEvent_REAL(&event);
    }
    if ((window != null) and !down) {
        _ = SDL_UpdateMouseFocus(window, mouse.*.x, mouse.*.y, buttonstate, @"true" != 0);
    }
    if (mouse.*.auto_capture) {
        _ = SDL_UpdateMouseCapture(@"false" != 0);
    }
}
pub export fn SDL_SendMouseButtonClicks(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool, arg_clicks: c_int) void {
    @setEvalBranchQuota(100000);
    var clicks = arg_clicks;
    _ = &clicks;
    clicks = if (clicks > @as(c_int, 0)) clicks else @as(c_int, 0);
    SDL_PrivateSendMouseButton(timestamp, window, mouseID, button, down, clicks);
}
pub export fn SDL_SendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool) void {
    @setEvalBranchQuota(100000);
    SDL_PrivateSendMouseButton(timestamp, window, mouseID, button, down, -@as(c_int, 1));
}
pub export fn SDL_SendMouseWheel(timestamp: Uint64, window: [*c]SDL_Window, arg_mouseID: SDL_MouseID, x: f32, y: f32, direction: SDL_MouseWheelDirection) void {
    @setEvalBranchQuota(100000);
    var mouseID = arg_mouseID;
    _ = &mouseID;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (window != null) {
        SDL_SetMouseFocus(window);
    }
    if ((x == @as(f32, 0.0)) and (y == @as(f32, 0.0))) {
        return;
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_MOUSE_WHEEL)) {
        var integer_x: f32 = undefined;
        _ = &integer_x;
        var integer_y: f32 = undefined;
        _ = &integer_y;
        if (!mouse.*.relative_mode or mouse.*.warp_emulation_active) {
            mouseID = SDL_GLOBAL_MOUSE_ID;
        }
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_MOUSE_WHEEL;
        event.common.timestamp = timestamp;
        event.wheel.windowID = if (mouse.*.focus != null) mouse.*.focus.*.id else @as(SDL_WindowID, 0);
        event.wheel.which = mouseID;
        event.wheel.direction = direction;
        event.wheel.mouse_x = mouse.*.x;
        event.wheel.mouse_y = mouse.*.y;
        mouse.*.residual_scroll_x = SDL_modff_REAL(mouse.*.residual_scroll_x + x, &integer_x);
        event.wheel.integer_x = @intFromFloat(integer_x);
        mouse.*.residual_scroll_y = SDL_modff_REAL(mouse.*.residual_scroll_y + y, &integer_y);
        event.wheel.integer_y = @intFromFloat(integer_y);
        if ((@as(c_int, mouse.*.integer_mode_flags) & @as(c_int, 2)) != 0) {
            event.wheel.x = integer_x;
            event.wheel.y = integer_y;
        } else {
            event.wheel.x = x;
            event.wheel.y = y;
        }
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_QuitMouse() void {
    @setEvalBranchQuota(100000);
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    var next: [*c]SDL_Cursor = undefined;
    _ = &next;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    SDL_mouse_initialized = @"false" != 0;
    if (mouse.*.added_mouse_touch_device) {
        SDL_DelTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 1)))));
        mouse.*.added_mouse_touch_device = @"false" != 0;
    }
    if (mouse.*.added_pen_touch_device) {
        SDL_DelTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))));
        mouse.*.added_pen_touch_device = @"false" != 0;
    }
    if (mouse.*.CaptureMouse != null) {
        _ = SDL_CaptureMouse_REAL(@"false" != 0);
        _ = SDL_UpdateMouseCapture(@"true" != 0);
    }
    _ = SDL_SetRelativeMouseMode(@"false" != 0);
    _ = SDL_ShowCursor_REAL();
    if (mouse.*.def_cursor != null) {
        SDL_SetDefaultCursor(null);
    }
    cursor = mouse.*.cursors;
    while (cursor != null) {
        next = cursor.*.next;
        SDL_DestroyCursor_REAL(cursor);
        cursor = next;
    }
    mouse.*.cursors = null;
    mouse.*.cur_cursor = null;
    if (mouse.*.sources != null) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < mouse.*.num_sources) : (i += 1) {
                var source: [*c]SDL_MouseInputSource = &mouse.*.sources[@bitCast(@as(isize, @intCast(i)))];
                _ = &source;
                SDL_free_REAL(@ptrCast(@alignCast(source.*.clickstate)));
            }
        }
        SDL_free_REAL(@ptrCast(@alignCast(mouse.*.sources)));
        mouse.*.sources = null;
    }
    mouse.*.num_sources = 0;
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_DOUBLE_CLICK_TIME", SDL_MouseDoubleClickTimeChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_DOUBLE_CLICK_RADIUS", SDL_MouseDoubleClickRadiusChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_NORMAL_SPEED_SCALE", SDL_MouseNormalSpeedScaleChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_RELATIVE_SPEED_SCALE", SDL_MouseRelativeSpeedScaleChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_RELATIVE_SYSTEM_SCALE", SDL_MouseRelativeSystemScaleChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_RELATIVE_MODE_CENTER", SDL_MouseRelativeModeCenterChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_EMULATE_WARP_WITH_RELATIVE", SDL_MouseWarpEmulationChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_TOUCH_MOUSE_EVENTS", SDL_TouchMouseEventsChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_TOUCH_EVENTS", SDL_MouseTouchEventsChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_PEN_MOUSE_EVENTS", SDL_PenMouseEventsChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_AUTO_CAPTURE", SDL_MouseAutoCaptureChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_RELATIVE_WARP_MOTION", SDL_MouseRelativeWarpMotionChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_RELATIVE_CURSOR_VISIBLE", SDL_MouseRelativeCursorVisibleChanged, @ptrCast(@alignCast(mouse)));
    SDL_RemoveHintCallback_REAL("SDL_MOUSE_INTEGER_MODE", SDL_MouseIntegerModeChanged, @ptrCast(@alignCast(mouse)));
    {
        var i: c_int = SDL_mouse_count;
        _ = &i;
        while ((blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            SDL_RemoveMouse(SDL_mice[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(SDL_mice)));
    SDL_mice = null;
    SDL_DestroyHashTable(SDL_mouse_names);
    SDL_mouse_names = null;
    if (mouse.*.internal != null) {
        SDL_free_REAL(mouse.*.internal);
        mouse.*.internal = null;
    }
    _ = memset(@ptrCast(@alignCast(mouse)), 0, @sizeOf(@TypeOf(mouse.*)));
}
pub export fn SDL_SetRelativeMouseTransform_REAL(transform: SDL_MouseMotionTransformCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.relative_mode) {
        return SDL_SetError_REAL("Can't set mouse transform while relative mode is active");
    }
    mouse.*.InputTransform = transform;
    mouse.*.input_transform_data = userdata;
    return @"true" != 0;
}
pub export fn SDL_GetMouseState_REAL(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (x != null) {
        x.* = mouse.*.x;
    }
    if (y != null) {
        y.* = mouse.*.y;
    }
    return SDL_GetMouseButtonState(mouse, SDL_GLOBAL_MOUSE_ID, @"true" != 0);
}
pub export fn SDL_GetRelativeMouseState_REAL(x: [*c]f32, y: [*c]f32) SDL_MouseButtonFlags {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (x != null) {
        x.* = mouse.*.x_accu;
    }
    if (y != null) {
        y.* = mouse.*.y_accu;
    }
    mouse.*.x_accu = 0.0;
    mouse.*.y_accu = 0.0;
    return SDL_GetMouseButtonState(mouse, SDL_GLOBAL_MOUSE_ID, @"true" != 0);
}
pub export fn SDL_GetGlobalMouseState_REAL(arg_x: [*c]f32, arg_y: [*c]f32) SDL_MouseButtonFlags {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.GetGlobalMouseState != null) {
        var tmpx: f32 = undefined;
        _ = &tmpx;
        var tmpy: f32 = undefined;
        _ = &tmpy;
        if (!(x != null)) {
            x = &tmpx;
        }
        if (!(y != null)) {
            y = &tmpy;
        }
        x.* = blk: {
            const tmp = @as(f32, 0.0);
            y.* = tmp;
            break :blk tmp;
        };
        return mouse.*.GetGlobalMouseState.?(x, y);
    } else {
        return SDL_GetMouseState_REAL(x, y);
    }
}
pub export fn SDL_PerformWarpMouseInWindow(arg_window: [*c]SDL_Window, x: f32, y: f32, ignore_relative_mode: bool) void {
    @setEvalBranchQuota(100000);
    var window = arg_window;
    _ = &window;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!(window != null)) {
        window = mouse.*.focus;
    }
    if (!(window != null)) {
        return;
    }
    if ((window.*.flags & @as(c_ulong, 64)) == @as(c_ulong, 64)) {
        return;
    }
    if (!mouse.*.have_explicit_warp_event or mouse.*.relative_mode) {
        mouse.*.last_x = x;
        mouse.*.last_y = y;
        mouse.*.has_position = @"false" != 0;
        if (mouse.*.relative_mode and !ignore_relative_mode) {
            if (!mouse.*.relative_mode_warp_motion) {
                mouse.*.x = x;
                mouse.*.y = y;
                mouse.*.has_position = @"true" != 0;
                return;
            }
        }
    }
    if ((mouse.*.WarpMouse != null) and !mouse.*.relative_mode) {
        _ = mouse.*.WarpMouse.?(window, x, y);
    } else {
        SDL_PrivateSendMouseMotion(0, window, SDL_GLOBAL_MOUSE_ID, @"false" != 0, x, y);
    }
}
pub export fn SDL_DisableMouseWarpEmulation() void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.warp_emulation_active) {
        _ = SDL_SetRelativeMouseMode(@"false" != 0);
    }
    mouse.*.warp_emulation_prohibited = @"true" != 0;
}
pub fn SDL_MaybeEnableWarpEmulation(arg_window: [*c]SDL_Window, arg_x: f32, arg_y: f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var window = arg_window;
    _ = &window;
    var x = arg_x;
    _ = &x;
    var y = arg_y;
    _ = &y;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (((!mouse.*.warp_emulation_prohibited and mouse.*.warp_emulation_hint) and !mouse.*.cursor_visible) and !mouse.*.warp_emulation_active) {
        if (!(window != null)) {
            window = mouse.*.focus;
        }
        if (window != null) {
            const cx: f32 = @as(f32, @floatFromInt(window.*.w)) / @as(f32, 2.0);
            _ = &cx;
            const cy: f32 = @as(f32, @floatFromInt(window.*.h)) / @as(f32, 2.0);
            _ = &cy;
            if ((((x >= SDL_floorf_REAL(cx)) and (x <= SDL_ceilf_REAL(cx))) and (y >= SDL_floorf_REAL(cy))) and (y <= SDL_ceilf_REAL(cy))) {
                const now: Uint64 = SDL_GetTicksNS_REAL();
                _ = &now;
                if ((now -% mouse.*.last_center_warp_time_ns) < (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 30)))) *% @as(Uint64, SDL_NS_PER_MS))) {
                    mouse.*.warp_emulation_active = @"true" != 0;
                    if (!SDL_SetRelativeMouseMode(@"true" != 0)) {
                        mouse.*.warp_emulation_active = @"false" != 0;
                    }
                }
                mouse.*.last_center_warp_time_ns = now;
                return;
            }
        }
        mouse.*.last_center_warp_time_ns = 0;
    }
}
pub export fn SDL_WarpMouseInWindow_REAL(window: [*c]SDL_Window, x: f32, y: f32) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    SDL_MaybeEnableWarpEmulation(window, x, y);
    SDL_PerformWarpMouseInWindow(window, x, y, mouse.*.warp_emulation_active);
}
pub export fn SDL_WarpMouseGlobal_REAL(x: f32, y: f32) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.WarpMouseGlobal != null) {
        return mouse.*.WarpMouseGlobal.?(x, y);
    }
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SetRelativeMouseMode(enabled: bool) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var focusWindow: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
    _ = &focusWindow;
    if (!enabled) {
        mouse.*.warp_emulation_active = @"false" != 0;
    }
    if (@as(c_int, @intFromBool(enabled)) == @as(c_int, @intFromBool(mouse.*.relative_mode))) {
        return @"true" != 0;
    }
    if (!(mouse.*.SetRelativeMouseMode != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (!mouse.*.SetRelativeMouseMode.?(enabled)) {
        return @"false" != 0;
    }
    mouse.*.relative_mode = enabled;
    if (enabled) {
        SDL_RedrawCursor();
    }
    if (enabled and (focusWindow != null)) {
        SDL_SetMouseFocus(focusWindow);
    }
    if (focusWindow != null) {
        SDL_UpdateWindowGrab(focusWindow);
        if (!enabled) {
            SDL_PerformWarpMouseInWindow(focusWindow, mouse.*.x, mouse.*.y, @"true" != 0);
        }
        _ = SDL_UpdateMouseCapture(@"false" != 0);
    }
    if (!enabled) {
        SDL_RedrawCursor();
    }
    SDL_FlushEvent_REAL(SDL_EVENT_MOUSE_MOTION);
    return @"true" != 0;
}
pub export fn SDL_GetRelativeMouseMode() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    return mouse.*.relative_mode;
}
pub export fn SDL_UpdateRelativeMouseMode() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var focus: [*c]SDL_Window = SDL_GetKeyboardFocus_REAL();
    _ = &focus;
    var relative_mode: bool = @"false" != 0;
    _ = &relative_mode;
    if ((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool((focus != null) and ((focus.*.flags & @as(c_ulong, 32768)) != 0))))) != 0) and ((focus.*.flags & @as(c_ulong, 1024)) != 0)) {
        relative_mode = @"true" != 0;
    }
    if (@as(c_int, @intFromBool(relative_mode)) == @as(c_int, @intFromBool(mouse.*.relative_mode))) {
        return @"true" != 0;
    }
    return SDL_SetRelativeMouseMode(relative_mode);
}
pub export fn SDL_UpdateMouseCapture(force_release: bool) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var capture_window: [*c]SDL_Window = null;
    _ = &capture_window;
    if (!(mouse.*.CaptureMouse != null)) {
        return @"true" != 0;
    }
    if (!force_release) {
        if ((SDL_GetMessageBoxCount() == @as(c_int, 0)) and (mouse.*.capture_desired or (mouse.*.auto_capture and (SDL_GetMouseButtonState(mouse, SDL_GLOBAL_MOUSE_ID, @"false" != 0) != @as(SDL_MouseButtonFlags, 0))))) {
            if (!mouse.*.relative_mode) {
                capture_window = mouse.*.focus;
            }
        }
    }
    if (capture_window != mouse.*.capture_window) {
        var previous_capture: [*c]SDL_Window = mouse.*.capture_window;
        _ = &previous_capture;
        if (previous_capture != null) {
            previous_capture.*.flags &= ~@as(c_ulong, 16384);
        }
        if (capture_window != null) {
            capture_window.*.flags |= 16384;
        }
        mouse.*.capture_window = capture_window;
        if (!mouse.*.CaptureMouse.?(capture_window)) {
            if (previous_capture != null) {
                previous_capture.*.flags |= 16384;
            }
            if (capture_window != null) {
                capture_window.*.flags &= ~@as(c_ulong, 16384);
            }
            mouse.*.capture_window = previous_capture;
            return @"false" != 0;
        }
    }
    return @"true" != 0;
}
pub export fn SDL_CaptureMouse_REAL(enabled: bool) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!(mouse.*.CaptureMouse != null)) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (enabled and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_GetKeyboardFocus_REAL()))) == @as(?*anyopaque, null))) {
        return SDL_SetError_REAL("No window has focus");
    }
    mouse.*.capture_desired = enabled;
    return SDL_UpdateMouseCapture(@"false" != 0);
}
pub export fn SDL_CreateCursor_REAL(arg_data: [*c]const Uint8, arg_mask: [*c]const Uint8, arg_w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var mask = arg_mask;
    _ = &mask;
    var w = arg_w;
    _ = &w;
    var surface: [*c]SDL_Surface = undefined;
    _ = &surface;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var pixels: [*c]Uint32 = undefined;
    _ = &pixels;
    var datab: Uint8 = 0;
    _ = &datab;
    var maskb: Uint8 = 0;
    _ = &maskb;
    const black: Uint32 = 4278190080;
    _ = &black;
    const white: Uint32 = 4294967295;
    _ = &white;
    const transparent: Uint32 = 0;
    _ = &transparent;
    const inverted: Uint32 = 4278190080;
    _ = &inverted;
    w = (w + @as(c_int, 7)) & ~@as(c_int, 7);
    surface = SDL_CreateSurfaceUninitialized(w, h, SDL_PIXELFORMAT_ARGB8888);
    if (!(surface != null)) {
        return null;
    }
    {
        y = 0;
        while (y < h) : (y += 1) {
            pixels = @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(surface.*.pixels))) + @as(usize, @bitCast(@as(isize, @intCast(y * surface.*.pitch))))));
            {
                x = 0;
                while (x < w) : (x += 1) {
                    if (__helpers.signedRemainder(x, @as(c_int, 8)) == @as(c_int, 0)) {
                        datab = (blk: {
                            const ref = &data;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                        maskb = (blk: {
                            const ref = &mask;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).*;
                    }
                    if ((@as(c_int, maskb) & @as(c_int, 128)) != 0) {
                        (blk: {
                            const ref = &pixels;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = if ((@as(c_int, datab) & @as(c_int, 128)) != 0) black else white;
                    } else {
                        (blk: {
                            const ref = &pixels;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        }).* = if ((@as(c_int, datab) & @as(c_int, 128)) != 0) inverted else transparent;
                    }
                    {
                        const ref = &datab;
                        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 1)))));
                    }
                    {
                        const ref = &maskb;
                        ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) << @intCast(@as(c_int, 1)))));
                    }
                }
            }
        }
    }
    cursor = SDL_CreateColorCursor_REAL(surface, hot_x, hot_y);
    SDL_DestroySurface_REAL(surface);
    return cursor;
}
pub fn SDL_DestroyCursorAnimation(animation: [*c]SDL_CursorAnimation) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (!(animation != null)) {
        return;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < animation.*.num_frames) : (i += 1) {
            SDL_DestroyCursor_REAL(animation.*.frames[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(animation.*.frames)));
    SDL_free_REAL(@ptrCast(@alignCast(animation.*.durations)));
    SDL_free_REAL(@ptrCast(@alignCast(animation)));
}
pub fn SDL_CreateCursorAnimation(frames: [*c]SDL_CursorFrameInfo, frame_count: c_int, hot_x: c_int, hot_y: c_int) callconv(.c) [*c]SDL_CursorAnimation {
    @setEvalBranchQuota(100000);
    var animation: [*c]SDL_CursorAnimation = undefined;
    animation = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(animation.*)))));
    _ = &animation;
    if (!(animation != null)) {
        return null;
    }
    animation.*.frames = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, frame_count)), @sizeOf(@TypeOf(animation.*.frames.*)))));
    animation.*.durations = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, frame_count)), @sizeOf(@TypeOf(animation.*.durations.*)))));
    if (!(animation.*.frames != null) or !(animation.*.durations != null)) {
        SDL_DestroyCursorAnimation(animation);
        return null;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (i < frame_count) : (i += 1) {
            animation.*.frames[@bitCast(@as(isize, @intCast(i)))] = SDL_CreateColorCursor_REAL(frames[@bitCast(@as(isize, @intCast(i)))].surface, hot_x, hot_y);
            if (!(animation.*.frames[@bitCast(@as(isize, @intCast(i)))] != null)) {
                SDL_DestroyCursorAnimation(animation);
                return null;
            }
            animation.*.durations[@bitCast(@as(isize, @intCast(i)))] = frames[@bitCast(@as(isize, @intCast(i)))].duration;
        }
    }
    animation.*.num_frames = frame_count;
    return animation;
}
pub export fn SDL_UpdateCursorAnimation() void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var cursor: [*c]SDL_Cursor = mouse.*.cur_cursor;
    _ = &cursor;
    if (!(cursor != null) or !(cursor.*.animation != null)) {
        return;
    }
    if (!(mouse.*.focus != null)) {
        return;
    }
    var animation: [*c]SDL_CursorAnimation = cursor.*.animation;
    _ = &animation;
    var duration: Uint32 = animation.*.durations[@bitCast(@as(isize, @intCast(animation.*.current_frame)))];
    _ = &duration;
    if (!(duration != 0)) {
        return;
    }
    var now: Uint64 = SDL_GetTicks_REAL();
    _ = &now;
    if (now < (animation.*.last_update +% @as(Uint64, duration))) {
        return;
    }
    animation.*.current_frame = __helpers.signedRemainder(animation.*.current_frame + @as(c_int, 1), animation.*.num_frames);
    animation.*.last_update = now;
    SDL_RedrawCursor();
}
pub export fn SDL_CreateAnimatedCursor_REAL(frames: [*c]SDL_CursorFrameInfo, arg_frame_count: c_int, arg_hot_x: c_int, arg_hot_y: c_int) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var frame_count = arg_frame_count;
    _ = &frame_count;
    var hot_x = arg_hot_x;
    _ = &hot_x;
    var hot_y = arg_hot_y;
    _ = &hot_y;
    var mouse: [*c]SDL_Mouse = undefined;
    _ = &mouse;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    var props: SDL_PropertiesID = undefined;
    _ = &props;
    var isstack: bool = undefined;
    _ = &isstack;
    var temp_frames: [*c]SDL_CursorFrameInfo = undefined;
    _ = &temp_frames;
    var w: c_int = undefined;
    _ = &w;
    var h: c_int = undefined;
    _ = &h;
    var i: c_int = undefined;
    _ = &i;
    var temp: [*c]SDL_Surface = undefined;
    _ = &temp;
    var animation: [*c]SDL_CursorAnimation = undefined;
    _ = &animation;
    var i_1: c_int = undefined;
    _ = &i_1;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                mouse = SDL_GetMouse();
                cursor = null;
                if (!(frames != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                i_1 = 0;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            2 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("frames"))));
                return null;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if (!(frames[@as(c_int, 0)].surface != null)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("NULL surface in frame 0");
                return null;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (frame_count <= @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("frame_count"))));
                return null;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (frame_count == @as(c_int, 1)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                return SDL_CreateColorCursor_REAL(frames[@as(c_int, 0)].surface, hot_x, hot_y);
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                props = SDL_GetSurfaceProperties_REAL(frames[@as(c_int, 0)].surface);
                hot_x = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.surface.hotspot.x", hot_x));
                hot_y = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.surface.hotspot.y", hot_y));
                if ((((hot_x < @as(c_int, 0)) or (hot_y < @as(c_int, 0))) or (hot_x >= frames[@as(c_int, 0)].surface.*.w)) or (hot_y >= frames[@as(c_int, 0)].surface.*.h)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                _ = SDL_SetError_REAL("Cursor hot spot doesn't lie within cursor");
                return null;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                temp_frames = blk: {
                    (&isstack).* = (@sizeOf(SDL_CursorFrameInfo) *% @as(c_ulong, @bitCast(@as(c_long, frame_count)))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
                    break :blk if ((&isstack).*) @as([*c]SDL_CursorFrameInfo, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_CursorFrameInfo) *% @as(c_ulong, @bitCast(@as(c_long, frame_count))))))) else @as([*c]SDL_CursorFrameInfo, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(SDL_CursorFrameInfo) *% @as(c_ulong, @bitCast(@as(c_long, frame_count)))))));
                };
                if (!(temp_frames != null)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                return null;
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                _ = memset(@ptrCast(@alignCast(temp_frames)), 0, @sizeOf(SDL_CursorFrameInfo) *% @as(c_ulong, @bitCast(@as(c_long, frame_count))));
                w = frames[@as(c_int, 0)].surface.*.w;
                h = frames[@as(c_int, 0)].surface.*.h;
                i = 0;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (i < frame_count) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                if (!(frames[@bitCast(@as(isize, @intCast(i)))].surface != null)) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                i += 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            23 => {
                if (mouse.*.CreateAnimatedCursor != null) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            24 => {
                _ = SDL_SetError_REAL("Null surface in frame %i", i);
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
                if ((frames[@bitCast(@as(isize, @intCast(i)))].surface.*.w != w) or (frames[@bitCast(@as(isize, @intCast(i)))].surface.*.h != h)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                _ = SDL_SetError_REAL("All frames in an animated sequence must have the same dimensions");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                if (frames[@bitCast(@as(isize, @intCast(i)))].surface.*.format == @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                temp_frames[@bitCast(@as(isize, @intCast(i)))].surface = frames[@bitCast(@as(isize, @intCast(i)))].surface;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                temp = SDL_ConvertSurface_REAL(frames[@bitCast(@as(isize, @intCast(i)))].surface, SDL_PIXELFORMAT_ARGB8888);
                if (!(temp != null)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            32 => {
                temp_frames[@bitCast(@as(isize, @intCast(i)))].duration = frames[@bitCast(@as(isize, @intCast(i)))].duration;
                {
                    sdl_pc = 22;
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
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                temp_frames[@bitCast(@as(isize, @intCast(i)))].surface = temp;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            36 => {
                cursor = mouse.*.CreateAnimatedCursor.?(temp_frames, frame_count, hot_x, hot_y);
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                animation = SDL_CreateCursorAnimation(temp_frames, frame_count, hot_x, hot_y);
                if (!(animation != null)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                if (cursor != null) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
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
                cursor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cursor.*)))));
                if (!(cursor != null)) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                SDL_DestroyCursorAnimation(animation);
                {
                    sdl_pc = 1;
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
                cursor.*.animation = animation;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            45 => {
                cursor.*.next = mouse.*.cursors;
                mouse.*.cursors = cursor;
                {
                    sdl_pc = 47;
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
                    sdl_pc = 1;
                    continue;
                }
            },
            48 => {
                if (i_1 < frame_count) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            49 => {
                if ((temp_frames[@bitCast(@as(isize, @intCast(i_1)))].surface != null) and (frames[@bitCast(@as(isize, @intCast(i_1)))].surface != temp_frames[@bitCast(@as(isize, @intCast(i_1)))].surface)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            50 => {
                i_1 += 1;
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            51 => {
                if (isstack) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            52 => {
                SDL_DestroySurface_REAL(temp_frames[@bitCast(@as(isize, @intCast(i_1)))].surface);
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
                    sdl_pc = 50;
                    continue;
                }
            },
            55 => {
                SDL_free_REAL(@ptrCast(@alignCast(temp_frames)));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                SDL_free_REAL(@ptrCast(@alignCast(temp_frames)));
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                return cursor;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_CreateColorCursor_REAL(arg_surface: [*c]SDL_Surface, arg_hot_x: c_int, arg_hot_y: c_int) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var surface = arg_surface;
    _ = &surface;
    var hot_x = arg_hot_x;
    _ = &hot_x;
    var hot_y = arg_hot_y;
    _ = &hot_y;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var temp: [*c]SDL_Surface = null;
    _ = &temp;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    if (!(surface != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("surface"))));
        return null;
    }
    var props: SDL_PropertiesID = SDL_GetSurfaceProperties_REAL(surface);
    _ = &props;
    hot_x = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.surface.hotspot.x", hot_x));
    hot_y = @truncate(SDL_GetNumberProperty_REAL(props, "SDL.surface.hotspot.y", hot_y));
    if ((((hot_x < @as(c_int, 0)) or (hot_y < @as(c_int, 0))) or (hot_x >= surface.*.w)) or (hot_y >= surface.*.h)) {
        _ = SDL_SetError_REAL("Cursor hot spot doesn't lie within cursor");
        return null;
    }
    if (surface.*.format != @as(SDL_PixelFormat, SDL_PIXELFORMAT_ARGB8888)) {
        temp = SDL_ConvertSurface_REAL(surface, SDL_PIXELFORMAT_ARGB8888);
        if (!(temp != null)) {
            return null;
        }
        surface = temp;
    }
    if (mouse.*.CreateCursor != null) {
        cursor = mouse.*.CreateCursor.?(surface, hot_x, hot_y);
    } else {
        cursor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(cursor.*)))));
    }
    if (cursor != null) {
        cursor.*.next = mouse.*.cursors;
        mouse.*.cursors = cursor;
    }
    SDL_DestroySurface_REAL(temp);
    return cursor;
}
pub export fn SDL_CreateSystemCursor_REAL(id: SDL_SystemCursor) [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    if (!(mouse.*.CreateSystemCursor != null)) {
        _ = SDL_SetError_REAL("CreateSystemCursor is not currently supported");
        return null;
    }
    cursor = mouse.*.CreateSystemCursor.?(id);
    if (cursor != null) {
        cursor.*.next = mouse.*.cursors;
        mouse.*.cursors = cursor;
    }
    return cursor;
}
pub export fn SDL_RedrawCursor() void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var cursor: [*c]SDL_Cursor = undefined;
    _ = &cursor;
    if (mouse.*.focus != null) {
        cursor = mouse.*.cur_cursor;
    } else {
        cursor = mouse.*.def_cursor;
    }
    if ((mouse.*.focus != null) and (!mouse.*.cursor_visible or (mouse.*.relative_mode and mouse.*.relative_mode_hide_cursor))) {
        cursor = null;
    }
    if ((cursor != null) and (cursor.*.animation != null)) {
        var animation: [*c]SDL_CursorAnimation = cursor.*.animation;
        _ = &animation;
        cursor = animation.*.frames[@bitCast(@as(isize, @intCast(animation.*.current_frame)))];
    }
    if (mouse.*.ShowCursor != null) {
        _ = mouse.*.ShowCursor.?(cursor);
    }
}
pub export fn SDL_SetCursor_REAL(cursor: [*c]SDL_Cursor) bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (cursor == mouse.*.cur_cursor) {
        return @"true" != 0;
    }
    if (cursor != null) {
        if (cursor != mouse.*.def_cursor) {
            var found: [*c]SDL_Cursor = undefined;
            _ = &found;
            {
                found = mouse.*.cursors;
                while (found != null) : (found = found.*.next) {
                    if (found == cursor) {
                        break;
                    }
                }
            }
            if (!(found != null)) {
                return SDL_SetError_REAL("Cursor not associated with the current mouse");
            }
        }
        if (cursor.*.animation != null) {
            var animation: [*c]SDL_CursorAnimation = cursor.*.animation;
            _ = &animation;
            animation.*.current_frame = 0;
            animation.*.last_update = SDL_GetTicks_REAL();
        }
        mouse.*.cur_cursor = cursor;
    }
    SDL_RedrawCursor();
    return @"true" != 0;
}
pub export fn SDL_GetCursor_REAL() [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!(mouse != null)) {
        return null;
    }
    return mouse.*.cur_cursor;
}
pub export fn SDL_GetDefaultCursor_REAL() [*c]SDL_Cursor {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (!(mouse != null)) {
        return null;
    }
    return mouse.*.def_cursor;
}
pub export fn SDL_DestroyCursor_REAL(cursor: [*c]SDL_Cursor) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    var curr: [*c]SDL_Cursor = undefined;
    _ = &curr;
    var prev: [*c]SDL_Cursor = undefined;
    _ = &prev;
    if (!(cursor != null)) {
        return;
    }
    if (cursor == mouse.*.def_cursor) {
        return;
    }
    if (cursor == mouse.*.cur_cursor) {
        _ = SDL_SetCursor_REAL(mouse.*.def_cursor);
    }
    {
        prev = null;
        curr = mouse.*.cursors;
        while (curr != null) : ({
            prev = curr;
            curr = curr.*.next;
        }) {
            if (curr == cursor) {
                if (prev != null) {
                    prev.*.next = curr.*.next;
                } else {
                    mouse.*.cursors = curr.*.next;
                }
                if (curr.*.animation != null) {
                    SDL_DestroyCursorAnimation(curr.*.animation);
                }
                if ((mouse.*.FreeCursor != null) and (curr.*.internal != null)) {
                    mouse.*.FreeCursor.?(curr);
                } else {
                    SDL_free_REAL(@ptrCast(@alignCast(curr)));
                }
                return;
            }
        }
    }
}
pub export fn SDL_ShowCursor_REAL() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.warp_emulation_active) {
        _ = SDL_SetRelativeMouseMode(@"false" != 0);
        mouse.*.warp_emulation_active = @"false" != 0;
    }
    if (!mouse.*.cursor_visible) {
        mouse.*.cursor_visible = @"true" != 0;
        SDL_RedrawCursor();
    }
    return @"true" != 0;
}
pub export fn SDL_HideCursor_REAL() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (mouse.*.cursor_visible) {
        mouse.*.cursor_visible = @"false" != 0;
        SDL_RedrawCursor();
    }
    return @"true" != 0;
}
pub export fn SDL_CursorVisible_REAL() bool {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    return mouse.*.cursor_visible;
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const SDL_CaptureMouse = SDL_CaptureMouse_REAL;
pub const SDL_CreateColorCursor = SDL_CreateColorCursor_REAL;
pub const SDL_CreateCursor = SDL_CreateCursor_REAL;
pub const SDL_CreateSystemCursor = SDL_CreateSystemCursor_REAL;
pub const SDL_CursorVisible = SDL_CursorVisible_REAL;
pub const SDL_DestroyCursor = SDL_DestroyCursor_REAL;
pub const SDL_GetCursor = SDL_GetCursor_REAL;
pub const SDL_GetDefaultCursor = SDL_GetDefaultCursor_REAL;
pub const SDL_GetGlobalMouseState = SDL_GetGlobalMouseState_REAL;
pub const SDL_GetMice = SDL_GetMice_REAL;
pub const SDL_GetMouseFocus = SDL_GetMouseFocus_REAL;
pub const SDL_GetMouseNameForID = SDL_GetMouseNameForID_REAL;
pub const SDL_GetMouseState = SDL_GetMouseState_REAL;
pub const SDL_GetRelativeMouseState = SDL_GetRelativeMouseState_REAL;
pub const SDL_HasMouse = SDL_HasMouse_REAL;
pub const SDL_HideCursor = SDL_HideCursor_REAL;
pub const SDL_SetCursor = SDL_SetCursor_REAL;
pub const SDL_ShowCursor = SDL_ShowCursor_REAL;
pub const SDL_WarpMouseGlobal = SDL_WarpMouseGlobal_REAL;
pub const SDL_WarpMouseInWindow = SDL_WarpMouseInWindow_REAL;
pub const SDL_SetRelativeMouseTransform = SDL_SetRelativeMouseTransform_REAL;
pub const SDL_CreateAnimatedCursor = SDL_CreateAnimatedCursor_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_BUTTON_LEFT = @as(c_int, 1);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub const SDL_GLOBAL_MOUSE_ID = @as(c_int, 0);
