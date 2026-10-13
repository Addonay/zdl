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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
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
pub extern fn SDL_CompareAndSwapAtomicInt_REAL(a: [*c]SDL_AtomicInt, oldval: c_int, newval: c_int) bool;
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_RWLock = opaque {
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_CreateRWLock_REAL() ?*SDL_RWLock;
pub extern fn SDL_LockRWLockForReading_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_UnlockRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_DestroyRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub const SDL_AudioDeviceID = Uint32;
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
pub extern fn SDL_GetWindowFromID_REAL(id: SDL_WindowID) [*c]SDL_Window;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const struct_SDL_CursorData = opaque {};
pub const SDL_CursorData = struct_SDL_CursorData;
pub const struct_SDL_Cursor = extern struct {
    animation: [*c]SDL_CursorAnimation = null,
    internal: ?*SDL_CursorData = null,
    next: [*c]struct_SDL_Cursor = null,
};
pub const SDL_Cursor = struct_SDL_Cursor;
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
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const SDL_PEN_AXIS_PRESSURE: c_int = 0;
pub const SDL_PEN_AXIS_SLIDER: c_int = 5;
pub const SDL_PEN_AXIS_COUNT: c_int = 7;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const SDL_PEN_DEVICE_TYPE_INVALID: c_int = -1;
pub const SDL_PEN_DEVICE_TYPE_UNKNOWN: c_int = 0;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_PEN_PROXIMITY_IN: c_int = 4864;
pub const SDL_EVENT_PEN_PROXIMITY_OUT: c_int = 4865;
pub const SDL_EVENT_PEN_DOWN: c_int = 4866;
pub const SDL_EVENT_PEN_UP: c_int = 4867;
pub const SDL_EVENT_PEN_BUTTON_DOWN: c_int = 4868;
pub const SDL_EVENT_PEN_BUTTON_UP: c_int = 4869;
pub const SDL_EVENT_PEN_MOTION: c_int = 4870;
pub const SDL_EVENT_PEN_AXIS: c_int = 4871;
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
pub extern fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool;
pub extern fn SDL_EventEnabled_REAL(@"type": Uint32) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_GetNextObjectID() Uint32;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
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
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
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
pub extern fn SDL_SendMouseMotion(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, relative: bool, x: f32, y: f32) void;
pub extern fn SDL_SendMouseButton(timestamp: Uint64, window: [*c]SDL_Window, mouseID: SDL_MouseID, button: Uint8, down: bool) void;
pub extern fn SDL_AddTouch(id: SDL_TouchID, @"type": SDL_TouchDeviceType, name: [*c]const u8) c_int;
pub extern fn SDL_SendTouch(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, @"type": SDL_EventType, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_SendTouchMotion(timestamp: Uint64, id: SDL_TouchID, fingerid: SDL_FingerID, window: [*c]SDL_Window, x: f32, y: f32, pressure: f32) void;
pub extern fn SDL_DelTouch(id: SDL_TouchID) void;
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
pub var pen_touching: SDL_PenID = 0;
pub const struct_SDL_Pen = extern struct {
    instance_id: SDL_PenID = 0,
    name: [*c]u8 = null,
    info: SDL_PenInfo = @import("std").mem.zeroes(SDL_PenInfo),
    axes: [7]f32 = @import("std").mem.zeroes([7]f32),
    x: f32 = 0,
    y: f32 = 0,
    input_state: SDL_PenInputFlags = 0,
    pending_proximity_out: bool = false,
    pending_proximity_window_id: SDL_WindowID = 0,
    driverdata: ?*anyopaque = null,
};
pub const SDL_Pen = struct_SDL_Pen;
pub var pen_device_rwlock: ?*SDL_RWLock = null;
pub var pen_devices: [*c]SDL_Pen = null;
pub var pen_device_count: c_int = 0;
pub var pending_proximity_out: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub fn FindPenByInstanceId(instance_id: SDL_PenID) callconv(.c) [*c]SDL_Pen {
    @setEvalBranchQuota(100000);
    if (instance_id != 0) {
        {
            var i: c_int = 0;
            _ = &i;
            while (i < pen_device_count) : (i += 1) {
                if (pen_devices[@bitCast(@as(isize, @intCast(i)))].instance_id == instance_id) {
                    return &pen_devices[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
    }
    _ = SDL_SetError_REAL("Invalid pen instance ID");
    return null;
}
pub export fn SDL_FindPenByHandle(handle: ?*anyopaque) SDL_PenID {
    @setEvalBranchQuota(100000);
    var result: SDL_PenID = 0;
    _ = &result;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < pen_device_count) : (i += 1) {
            if (pen_devices[@bitCast(@as(isize, @intCast(i)))].driverdata == handle) {
                result = pen_devices[@bitCast(@as(isize, @intCast(i)))].instance_id;
                break;
            }
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    return result;
}
pub export fn SDL_FindPenByCallback(callback: ?*const fn (handle: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) bool, userdata: ?*anyopaque) SDL_PenID {
    @setEvalBranchQuota(100000);
    var result: SDL_PenID = 0;
    _ = &result;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < pen_device_count) : (i += 1) {
            if (callback.?(pen_devices[@bitCast(@as(isize, @intCast(i)))].driverdata, userdata)) {
                result = pen_devices[@bitCast(@as(isize, @intCast(i)))].instance_id;
                break;
            }
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    return result;
}
pub fn UpdateTouchEmulationDevicePresence() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var has_pen: bool = pen_device_count != @as(c_int, 0);
    _ = &has_pen;
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (!mouse.*.pen_touch_events or !has_pen) {
        if (mouse.*.added_pen_touch_device) {
            SDL_DelTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))));
            mouse.*.added_pen_touch_device = @"false" != 0;
        }
    } else if (!mouse.*.added_pen_touch_device) {
        _ = SDL_AddTouch(@as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))), SDL_TOUCH_DEVICE_DIRECT, "pen_input");
        mouse.*.added_pen_touch_device = @"true" != 0;
    }
}
pub fn SDL_PenTouchEventsChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    mouse.*.pen_touch_events = SDL_GetStringBoolean(hint, @"true" != 0);
    UpdateTouchEmulationDevicePresence();
}
pub export fn SDL_InitPen() bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [11:0]u8 = "SDL_InitPen".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pen_device_rwlock))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pen_device_rwlock == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 129);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pen_devices))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pen_devices == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 130);
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
    while (true) {
        while (!(pen_device_count == @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pen_device_count == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 131);
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
    pen_device_rwlock = SDL_CreateRWLock_REAL();
    if (!(pen_device_rwlock != null)) {
        return @"false" != 0;
    }
    _ = SDL_AddHintCallback_REAL("SDL_PEN_TOUCH_EVENTS", SDL_PenTouchEventsChanged, null);
    return @"true" != 0;
}
pub export fn SDL_QuitPen() void {
    @setEvalBranchQuota(100000);
    SDL_RemoveHintCallback_REAL("SDL_PEN_TOUCH_EVENTS", SDL_PenTouchEventsChanged, null);
    SDL_RemoveAllPenDevices(null, null);
    SDL_DestroyRWLock_REAL(pen_device_rwlock);
    pen_device_rwlock = null;
}
pub export fn SDL_GetPenStatus(instance_id: SDL_PenID, axes: [*c]f32, arg_num_axes: c_int) SDL_PenInputFlags {
    @setEvalBranchQuota(100000);
    var num_axes = arg_num_axes;
    _ = &num_axes;
    if (num_axes < @as(c_int, 0)) {
        num_axes = 0;
    }
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]const SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    var result: SDL_PenInputFlags = 0;
    _ = &result;
    if (pen != null) {
        result = pen.*.input_state;
        if ((axes != null) and (num_axes != 0)) {
            _ = memcpy(@ptrCast(@alignCast(axes)), @ptrCast(@alignCast(@as([*c]f32, @ptrCast(@constCast(@alignCast(&pen.*.axes)))))), @as(c_ulong, @bitCast(@as(c_long, if (num_axes < SDL_PEN_AXIS_COUNT) num_axes else SDL_PEN_AXIS_COUNT))) *% @sizeOf(@TypeOf(axes.*)));
            if (num_axes > SDL_PEN_AXIS_COUNT) {
                _ = memset(@ptrCast(@alignCast(&axes[SDL_PEN_AXIS_COUNT])), '\x00', @as(c_ulong, @bitCast(@as(c_long, num_axes - SDL_PEN_AXIS_COUNT))) *% @sizeOf(@TypeOf(axes.*)));
            }
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    return result;
}
pub export fn SDL_GetPenDeviceType_REAL(instance_id: SDL_PenID) SDL_PenDeviceType {
    @setEvalBranchQuota(100000);
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]const SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    const result: SDL_PenDeviceType = if (pen != null) pen.*.info.device_type else SDL_PEN_DEVICE_TYPE_INVALID;
    _ = &result;
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    return result;
}
pub export fn SDL_GetPenCapabilityFromAxis(arg_axis: SDL_PenAxis) SDL_PenCapabilityFlags {
    @setEvalBranchQuota(100000);
    var axis = arg_axis;
    _ = &axis;
    if ((axis >= @as(SDL_PenAxis, SDL_PEN_AXIS_PRESSURE)) and (axis <= @as(SDL_PenAxis, SDL_PEN_AXIS_SLIDER))) {
        return @as(c_uint, 1) << @intCast(axis);
    }
    return 0;
}
pub export fn SDL_AddPenDevice(timestamp: Uint64, name: [*c]const u8, window: [*c]SDL_Window, info: [*c]const SDL_PenInfo, handle: ?*anyopaque, in_proximity: bool) SDL_PenID {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "SDL_AddPenDevice".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!(handle != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "handle != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 252);
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
    while (true) {
        while (!(SDL_FindPenByHandle(handle) == @as(SDL_PenID, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_FindPenByHandle(handle) == 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 253);
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
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(pen_device_rwlock))) != @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "pen_device_rwlock != ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 254);
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
    var namecpy: [*c]u8 = SDL_strdup_REAL(if (name != null) name else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("Unnamed pen")))))));
    _ = &namecpy;
    if (!(namecpy != null)) {
        return 0;
    }
    var result: SDL_PenID = 0;
    _ = &result;
    SDL_LockRWLockForWriting_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = null;
    _ = &pen;
    var ptr: ?*anyopaque = SDL_realloc_REAL(@ptrCast(@alignCast(pen_devices)), @as(c_ulong, @bitCast(@as(c_long, pen_device_count + @as(c_int, 1)))) *% @sizeOf(@TypeOf(pen.*)));
    _ = &ptr;
    if (ptr != null) {
        result = SDL_GetNextObjectID();
        pen_devices = @ptrCast(@alignCast(ptr));
        pen = &pen_devices[@bitCast(@as(isize, @intCast(pen_device_count)))];
        pen_device_count += 1;
        _ = memset(@ptrCast(@alignCast(pen)), 0, @sizeOf(@TypeOf(pen.*)));
        pen.*.instance_id = result;
        pen.*.name = namecpy;
        if (info != null) {
            {
                comptime {
                    if (!(@sizeOf(@TypeOf((&pen.*.info).*)) == @sizeOf(@TypeOf(info.*)))) @compileError("static assertion failed \"sizeof (*(&pen->info)) == sizeof (*( info))\"");
                }
            }
            _ = memcpy(@ptrCast(@alignCast(&pen.*.info)), @ptrCast(@alignCast(info)), @sizeOf(@TypeOf(info.*)));
        }
        pen.*.driverdata = handle;
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (!(pen != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(namecpy)));
    }
    UpdateTouchEmulationDevicePresence();
    if ((result != 0) and (@as(SDL_PenID, @bitCast(@as(c_int, @as(c_int, @intFromBool(in_proximity))))) != 0)) {
        SDL_SendPenProximity(timestamp, result, window, @"true" != 0, @"true" != 0);
    }
    return result;
}
pub export fn SDL_RemovePenDevice(timestamp: Uint64, window: [*c]SDL_Window, instance_id: SDL_PenID) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [19:0]u8 = "SDL_RemovePenDevice".*;
    };
    _ = &static_local___func__;
    if (!(instance_id != 0)) {
        return;
    }
    SDL_SendPenProximity(timestamp, instance_id, window, @"false" != 0, @"true" != 0);
    SDL_LockRWLockForWriting_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        SDL_free_REAL(@ptrCast(@alignCast(pen.*.name)));
        const idx: c_int = @as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(pen) -% @intFromPtr(pen_devices))), @sizeOf(SDL_Pen))));
        _ = &idx;
        while (true) {
            while (!((idx >= @as(c_int, 0)) and (idx < pen_device_count))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "(idx >= 0) && (idx < pen_device_count)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 311);
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
        if (idx < (pen_device_count - @as(c_int, 1))) {
            _ = memmove(@ptrCast(@alignCast(&pen_devices[@bitCast(@as(isize, @intCast(idx)))])), @ptrCast(@alignCast(&pen_devices[@bitCast(@as(isize, @intCast(idx + @as(c_int, 1))))])), @sizeOf(@TypeOf(pen.*)) *% @as(c_ulong, @bitCast(@as(c_long, (pen_device_count - idx) - @as(c_int, 1)))));
        }
        while (true) {
            while (!(pen_device_count > @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "pen_device_count > 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 316);
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
        pen_device_count -= 1;
        if (pen_device_count != 0) {
            var ptr: ?*anyopaque = SDL_realloc_REAL(@ptrCast(@alignCast(pen_devices)), @sizeOf(@TypeOf(pen.*)) *% @as(c_ulong, @bitCast(@as(c_long, pen_device_count))));
            _ = &ptr;
            if (ptr != null) {
                pen_devices = @ptrCast(@alignCast(ptr));
            }
        } else {
            SDL_free_REAL(@ptrCast(@alignCast(pen_devices)));
            pen_devices = null;
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    UpdateTouchEmulationDevicePresence();
}
pub export fn SDL_RemoveAllPenDevices(callback: ?*const fn (instance_id: SDL_PenID, handle: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) void, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "SDL_RemoveAllPenDevices".*;
    };
    _ = &static_local___func__;
    SDL_LockRWLockForWriting_REAL(pen_device_rwlock);
    if (pen_device_count > @as(c_int, 0)) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(pen_devices))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "pen_devices != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 339);
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
        {
            var i: c_int = 0;
            _ = &i;
            while (i < pen_device_count) : (i += 1) {
                if (callback != null) {
                    callback.?(pen_devices[@bitCast(@as(isize, @intCast(i)))].instance_id, pen_devices[@bitCast(@as(isize, @intCast(i)))].driverdata, userdata);
                }
                SDL_free_REAL(@ptrCast(@alignCast(pen_devices[@bitCast(@as(isize, @intCast(i)))].name)));
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(pen_devices)));
    pen_devices = null;
    pen_device_count = 0;
    pen_touching = 0;
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
}
pub export fn SDL_SendPenTouch(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, eraser: bool, down: bool) void {
    @setEvalBranchQuota(100000);
    var send_event: bool = @"false" != 0;
    _ = &send_event;
    var input_state: SDL_PenInputFlags = 0;
    _ = &input_state;
    var device_type: SDL_PenDeviceType = SDL_PEN_DEVICE_TYPE_UNKNOWN;
    _ = &device_type;
    var x: f32 = 0.0;
    _ = &x;
    var y: f32 = 0.0;
    _ = &y;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        input_state = pen.*.input_state;
        device_type = pen.*.info.device_type;
        x = pen.*.x;
        y = pen.*.y;
        if (down and ((input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) == @as(SDL_PenInputFlags, 0))) {
            input_state |= @as(c_uint, 1) << @intCast(@as(c_uint, 0));
            send_event = @"true" != 0;
        } else if ((@as(SDL_PenInputFlags, @bitCast(@as(c_int, @intFromBool(!down)))) != 0) and ((input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) != 0)) {
            input_state &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, 0)));
            send_event = @"true" != 0;
        }
        if (eraser and ((input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 30)))) == @as(SDL_PenInputFlags, 0))) {
            input_state |= @as(c_uint, 1) << @intCast(@as(c_uint, 30));
            send_event = @"true" != 0;
        } else if ((@as(SDL_PenInputFlags, @bitCast(@as(c_int, @intFromBool(!eraser)))) != 0) and ((input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 30)))) != 0)) {
            input_state &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, 30)));
            send_event = @"true" != 0;
        }
        pen.*.input_state = input_state;
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (send_event) {
        const evtype: SDL_EventType = @bitCast(if (down) SDL_EVENT_PEN_DOWN else SDL_EVENT_PEN_UP);
        _ = &evtype;
        if (SDL_EventEnabled_REAL(evtype)) {
            var event: SDL_Event = undefined;
            _ = &event;
            _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
            event.ptouch.type = evtype;
            event.ptouch.timestamp = timestamp;
            event.ptouch.windowID = if (window != null) window.*.id else @as(SDL_WindowID, 0);
            event.ptouch.which = instance_id;
            event.ptouch.pen_state = input_state;
            event.ptouch.x = x;
            event.ptouch.y = y;
            event.ptouch.eraser = eraser;
            event.ptouch.down = down;
            event.ptouch.device_type = device_type;
            _ = SDL_PushEvent_REAL(&event);
        }
        var mouse: [*c]SDL_Mouse = SDL_GetMouse();
        _ = &mouse;
        if ((mouse != null) and (window != null)) {
            if (mouse.*.pen_mouse_events) {
                if (down) {
                    if (!(pen_touching != 0)) {
                        SDL_SendMouseMotion(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), @"false" != 0, x, y);
                        SDL_SendMouseButton(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), SDL_BUTTON_LEFT, @"true" != 0);
                    }
                } else {
                    if (pen_touching == instance_id) {
                        SDL_SendMouseButton(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), SDL_BUTTON_LEFT, @"false" != 0);
                    }
                }
            }
            if (mouse.*.pen_touch_events) {
                const touchtype: SDL_EventType = @bitCast(if (down) SDL_EVENT_FINGER_DOWN else SDL_EVENT_FINGER_UP);
                _ = &touchtype;
                const normalized_x: f32 = x / @as(f32, @floatFromInt(window.*.w));
                _ = &normalized_x;
                const normalized_y: f32 = y / @as(f32, @floatFromInt(window.*.h));
                _ = &normalized_y;
                if (!(pen_touching != 0) or (pen_touching == instance_id)) {
                    SDL_SendTouch(timestamp, @as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))), SDL_BUTTON_LEFT, window, touchtype, normalized_x, normalized_y, pen.*.axes[SDL_PEN_AXIS_PRESSURE]);
                }
            }
        }
        if (down) {
            if (!(pen_touching != 0)) {
                pen_touching = instance_id;
            }
        } else {
            if (pen_touching == instance_id) {
                pen_touching = 0;
            }
        }
    }
}
pub export fn SDL_SendPenAxis(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, arg_axis: SDL_PenAxis, value: f32) void {
    @setEvalBranchQuota(100000);
    var axis = arg_axis;
    _ = &axis;
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "SDL_SendPenAxis".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!((axis >= @as(SDL_PenAxis, 0)) and (axis < @as(SDL_PenAxis, SDL_PEN_AXIS_COUNT)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "(axis >= 0) && (axis < SDL_PEN_AXIS_COUNT)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_pen.c", 451);
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
    var send_event: bool = @"false" != 0;
    _ = &send_event;
    var input_state: SDL_PenInputFlags = 0;
    _ = &input_state;
    var device_type: SDL_PenDeviceType = SDL_PEN_DEVICE_TYPE_UNKNOWN;
    _ = &device_type;
    var x: f32 = 0.0;
    _ = &x;
    var y: f32 = 0.0;
    _ = &y;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        if (pen.*.axes[axis] != value) {
            pen.*.axes[axis] = value;
            input_state = pen.*.input_state;
            device_type = pen.*.info.device_type;
            x = pen.*.x;
            y = pen.*.y;
            send_event = @"true" != 0;
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (send_event and SDL_EventEnabled_REAL(SDL_EVENT_PEN_AXIS)) {
        var event: SDL_Event = undefined;
        _ = &event;
        _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
        event.paxis.type = SDL_EVENT_PEN_AXIS;
        event.paxis.timestamp = timestamp;
        event.paxis.windowID = if (window != null) window.*.id else @as(SDL_WindowID, 0);
        event.paxis.which = instance_id;
        event.paxis.pen_state = input_state;
        event.paxis.x = x;
        event.paxis.y = y;
        event.paxis.axis = axis;
        event.paxis.value = value;
        event.paxis.device_type = device_type;
        _ = SDL_PushEvent_REAL(&event);
        if (((window != null) and (axis == @as(SDL_PenAxis, SDL_PEN_AXIS_PRESSURE))) and (pen_touching == instance_id)) {
            var mouse: [*c]SDL_Mouse = SDL_GetMouse();
            _ = &mouse;
            if ((mouse != null) and mouse.*.pen_touch_events) {
                const normalized_x: f32 = x / @as(f32, @floatFromInt(window.*.w));
                _ = &normalized_x;
                const normalized_y: f32 = y / @as(f32, @floatFromInt(window.*.h));
                _ = &normalized_y;
                SDL_SendTouchMotion(timestamp, @as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))), SDL_BUTTON_LEFT, window, normalized_x, normalized_y, value);
            }
        }
    }
}
pub fn EnsurePenProximity(timestamp: Uint64, pen: [*c]SDL_Pen, window: [*c]SDL_Window) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (pen.*.pending_proximity_out) {
        pen.*.pending_proximity_out = @"false" != 0;
    } else if (!((pen.*.input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 31)))) != 0)) {
        SDL_SendPenProximity(timestamp, pen.*.instance_id, window, @"true" != 0, @"true" != 0);
    }
}
pub export fn SDL_SendPenMotion(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, x: f32, y: f32) void {
    @setEvalBranchQuota(100000);
    var send_event: bool = @"false" != 0;
    _ = &send_event;
    var input_state: SDL_PenInputFlags = 0;
    _ = &input_state;
    var device_type: SDL_PenDeviceType = SDL_PEN_DEVICE_TYPE_UNKNOWN;
    _ = &device_type;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        EnsurePenProximity(timestamp, pen, window);
        if ((pen.*.x != x) or (pen.*.y != y)) {
            pen.*.x = x;
            pen.*.y = y;
            input_state = pen.*.input_state;
            device_type = pen.*.info.device_type;
            send_event = @"true" != 0;
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (send_event and SDL_EventEnabled_REAL(SDL_EVENT_PEN_MOTION)) {
        var event: SDL_Event = undefined;
        _ = &event;
        _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
        event.pmotion.type = SDL_EVENT_PEN_MOTION;
        event.pmotion.timestamp = timestamp;
        event.pmotion.windowID = if (window != null) window.*.id else @as(SDL_WindowID, 0);
        event.pmotion.which = instance_id;
        event.pmotion.pen_state = input_state;
        event.pmotion.x = x;
        event.pmotion.y = y;
        event.pmotion.device_type = device_type;
        _ = SDL_PushEvent_REAL(&event);
        if (window != null) {
            var mouse: [*c]SDL_Mouse = SDL_GetMouse();
            _ = &mouse;
            if (mouse != null) {
                if (pen_touching == instance_id) {
                    if (mouse.*.pen_mouse_events) {
                        SDL_SendMouseMotion(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), @"false" != 0, x, y);
                    }
                    if (mouse.*.pen_touch_events) {
                        const normalized_x: f32 = x / @as(f32, @floatFromInt(window.*.w));
                        _ = &normalized_x;
                        const normalized_y: f32 = y / @as(f32, @floatFromInt(window.*.h));
                        _ = &normalized_y;
                        SDL_SendTouchMotion(timestamp, @as(SDL_TouchID, @bitCast(@as(c_long, -@as(c_int, 2)))), SDL_BUTTON_LEFT, window, normalized_x, normalized_y, pen.*.axes[SDL_PEN_AXIS_PRESSURE]);
                    }
                } else if (pen_touching == @as(SDL_PenID, 0)) {
                    if (mouse.*.pen_mouse_events) {
                        SDL_SendMouseMotion(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), @"false" != 0, x, y);
                    }
                }
            }
        }
    }
}
pub fn SendPenButtonEvents(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, button: Uint8, down: bool, input_state: SDL_PenInputFlags, x: f32, y: f32, device_type: SDL_PenDeviceType) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const evtype: SDL_EventType = @bitCast(if (down) SDL_EVENT_PEN_BUTTON_DOWN else SDL_EVENT_PEN_BUTTON_UP);
    _ = &evtype;
    if (SDL_EventEnabled_REAL(evtype)) {
        var event: SDL_Event = undefined;
        _ = &event;
        _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
        event.pbutton.type = evtype;
        event.pbutton.timestamp = timestamp;
        event.pbutton.windowID = if (window != null) window.*.id else @as(SDL_WindowID, 0);
        event.pbutton.which = instance_id;
        event.pbutton.pen_state = input_state;
        event.pbutton.x = x;
        event.pbutton.y = y;
        event.pbutton.button = button;
        event.pbutton.down = down;
        event.pbutton.device_type = device_type;
        _ = SDL_PushEvent_REAL(&event);
        if ((window != null) and (!(pen_touching != 0) or (pen_touching == instance_id))) {
            var mouse: [*c]SDL_Mouse = SDL_GetMouse();
            _ = &mouse;
            if ((mouse != null) and mouse.*.pen_mouse_events) {
                const static_local_mouse_buttons = struct {
                    const mouse_buttons: [5]Uint8 = [5]Uint8{
                        SDL_BUTTON_LEFT,
                        SDL_BUTTON_RIGHT,
                        SDL_BUTTON_MIDDLE,
                        SDL_BUTTON_X1,
                        SDL_BUTTON_X2,
                    };
                };
                _ = &static_local_mouse_buttons;
                if (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, button)))) < (@sizeOf(@TypeOf(static_local_mouse_buttons.mouse_buttons)) / @sizeOf(@TypeOf(static_local_mouse_buttons.mouse_buttons[@as(c_int, 0)])))) {
                    SDL_SendMouseButton(timestamp, window, @as(SDL_MouseID, @bitCast(@as(c_int, -@as(c_int, 2)))), static_local_mouse_buttons.mouse_buttons[button], down);
                }
            }
        }
    }
}
pub export fn SDL_SendPenButton(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, button: Uint8, down: bool) void {
    @setEvalBranchQuota(100000);
    var send_event: bool = @"false" != 0;
    _ = &send_event;
    var input_state: SDL_PenInputFlags = 0;
    _ = &input_state;
    var device_type: SDL_PenDeviceType = SDL_PEN_DEVICE_TYPE_UNKNOWN;
    _ = &device_type;
    var x: f32 = 0.0;
    _ = &x;
    var y: f32 = 0.0;
    _ = &y;
    if ((@as(c_int, button) < @as(c_int, 1)) or (@as(c_int, button) > @as(c_int, 5))) {
        return;
    }
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        EnsurePenProximity(timestamp, pen, window);
        input_state = pen.*.input_state;
        device_type = pen.*.info.device_type;
        const flag: SDL_PenInputFlags = @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, button)))));
        _ = &flag;
        const current: bool = (input_state & flag) != @as(SDL_PenInputFlags, 0);
        _ = &current;
        x = pen.*.x;
        y = pen.*.y;
        if (down and !current) {
            input_state |= flag;
            send_event = @"true" != 0;
        } else if (!down and current) {
            input_state &= ~flag;
            send_event = @"true" != 0;
        }
        pen.*.input_state = input_state;
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (send_event) {
        SendPenButtonEvents(timestamp, instance_id, window, button, down, input_state, x, y, device_type);
    }
}
pub export fn SDL_SendPenProximity(timestamp: Uint64, instance_id: SDL_PenID, window: [*c]SDL_Window, in: bool, immediate: bool) void {
    @setEvalBranchQuota(100000);
    var send_event: bool = @"false" != 0;
    _ = &send_event;
    var input_state: SDL_PenInputFlags = 0;
    _ = &input_state;
    var orig_input_state: SDL_PenInputFlags = 0;
    _ = &orig_input_state;
    var device_type: SDL_PenDeviceType = SDL_PEN_DEVICE_TYPE_UNKNOWN;
    _ = &device_type;
    var x: f32 = 0.0;
    _ = &x;
    var y: f32 = 0.0;
    _ = &y;
    SDL_LockRWLockForReading_REAL(pen_device_rwlock);
    var pen: [*c]SDL_Pen = FindPenByInstanceId(instance_id);
    _ = &pen;
    if (pen != null) {
        device_type = pen.*.info.device_type;
        if (in or immediate) {
            orig_input_state = blk: {
                const tmp = pen.*.input_state;
                input_state = tmp;
                break :blk tmp;
            };
            const in_proximity: bool = (input_state & (@as(c_uint, 1) << @intCast(@as(c_uint, 31)))) != @as(SDL_PenInputFlags, 0);
            _ = &in_proximity;
            if (@as(c_int, @intFromBool(in_proximity)) != @as(c_int, @intFromBool(in))) {
                if (in) {
                    input_state |= @as(c_uint, 1) << @intCast(@as(c_uint, 31));
                } else {
                    input_state &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, 31)));
                    {
                        var button: c_int = 1;
                        _ = &button;
                        while (button <= @as(c_int, 5)) : (button += 1) {
                            input_state &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, button)))));
                        }
                    }
                }
                send_event = @"true" != 0;
                pen.*.input_state = input_state;
                x = pen.*.x;
                y = pen.*.y;
            }
            pen.*.pending_proximity_out = @"false" != 0;
        } else {
            pen.*.pending_proximity_out = @"true" != 0;
            pen.*.pending_proximity_window_id = if (window != null) window.*.id else @as(SDL_WindowID, 0);
            _ = SDL_SetAtomicInt_REAL(&pending_proximity_out, @"true");
        }
    }
    SDL_UnlockRWLock_REAL(pen_device_rwlock);
    if (send_event) {
        if (!in) {
            {
                var button: c_int = 1;
                _ = &button;
                while (button <= @as(c_int, 5)) : (button += 1) {
                    const flag: SDL_PenInputFlags = @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, button))));
                    _ = &flag;
                    if ((orig_input_state & flag) != 0) {
                        orig_input_state &= ~flag;
                        SendPenButtonEvents(timestamp, instance_id, window, @bitCast(@as(i8, @truncate(button))), @"false" != 0, orig_input_state, x, y, device_type);
                    }
                }
            }
        }
        const event_type: Uint32 = @bitCast(@as(c_int, if (in) SDL_EVENT_PEN_PROXIMITY_IN else SDL_EVENT_PEN_PROXIMITY_OUT));
        _ = &event_type;
        if (SDL_EventEnabled_REAL(event_type)) {
            var event: SDL_Event = undefined;
            _ = &event;
            _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
            event.pproximity.type = event_type;
            event.pproximity.timestamp = timestamp;
            event.pproximity.windowID = if (window != null) window.*.id else @as(SDL_WindowID, 0);
            event.pproximity.which = instance_id;
            event.pproximity.pen_state = input_state;
            event.pproximity.device_type = device_type;
            _ = SDL_PushEvent_REAL(&event);
        }
    }
}
pub export fn SDL_SendPendingPenProximity() void {
    @setEvalBranchQuota(100000);
    if (SDL_CompareAndSwapAtomicInt_REAL(&pending_proximity_out, @"true", @"false")) {
        SDL_LockRWLockForReading_REAL(pen_device_rwlock);
        {
            var i: c_int = 0;
            _ = &i;
            while (i < pen_device_count) : (i += 1) {
                var pen: [*c]SDL_Pen = &pen_devices[@bitCast(@as(isize, @intCast(i)))];
                _ = &pen;
                if (pen.*.pending_proximity_out) {
                    pen.*.pending_proximity_out = @"false" != 0;
                    var window: [*c]SDL_Window = null;
                    _ = &window;
                    if (pen.*.pending_proximity_window_id != 0) {
                        window = SDL_GetWindowFromID_REAL(pen.*.pending_proximity_window_id);
                        if (!(window != null)) {
                            continue;
                        }
                    }
                    SDL_SendPenProximity(0, pen.*.instance_id, window, @"false" != 0, @"true" != 0);
                }
            }
        }
        SDL_UnlockRWLock_REAL(pen_device_rwlock);
    }
}

pub const SDL_GetPenDeviceType = SDL_GetPenDeviceType_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_REQUIRES_SHARED = @compileError("unable to translate macro: undefined identifier `requires_shared_capability`");
// /home/addo/dev/stupid/zdl/.ref/SDL/include/SDL3/SDL_mutex.h:147:9
pub const SDL_BUTTON_LEFT = @as(c_int, 1);
pub const SDL_BUTTON_MIDDLE = @as(c_int, 2);
pub const SDL_BUTTON_RIGHT = @as(c_int, 3);
pub const SDL_BUTTON_X1 = @as(c_int, 4);
pub const SDL_BUTTON_X2 = @as(c_int, 5);
