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
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_iscntrl_REAL(x: c_int) c_int;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_utf8strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, dst_bytes: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
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
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
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
pub extern fn SDL_MinimizeWindow_REAL(window: [*c]SDL_Window) bool;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub const SDL_JoystickID = Uint32;
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_1: c_int = 30;
pub const SDL_SCANCODE_0: c_int = 39;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const SDL_SCANCODE_COUNT: c_int = 512;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub extern fn SDL_TextInputActive_REAL(window: [*c]SDL_Window) bool;
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
pub extern fn SDL_WarpMouseGlobal_REAL(x: f32, y: f32) bool;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED: c_int = 526;
pub const SDL_EVENT_WINDOW_FOCUS_LOST: c_int = 527;
pub const SDL_EVENT_KEY_DOWN: c_int = 768;
pub const SDL_EVENT_KEY_UP: c_int = 769;
pub const SDL_EVENT_TEXT_EDITING: c_int = 770;
pub const SDL_EVENT_TEXT_INPUT: c_int = 771;
pub const SDL_EVENT_KEYBOARD_ADDED: c_int = 773;
pub const SDL_EVENT_KEYBOARD_REMOVED: c_int = 774;
pub const SDL_EVENT_TEXT_EDITING_CANDIDATES: c_int = 775;
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
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
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
pub extern fn SDL_GetTicks_REAL() Uint64;
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
const struct_unnamed_14 = extern struct {
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
const struct_unnamed_15 = extern struct {
    vkGetInstanceProcAddr: SDL_FunctionPointer = null,
    vkEnumerateInstanceExtensionProperties: SDL_FunctionPointer = null,
    loader_loaded: c_int = 0,
    loader_path: [256]u8 = @import("std").mem.zeroes([256]u8),
    loader_handle: ?*SDL_SharedObject = null,
};
pub const struct_SDL_VideoData = opaque {};
pub const SDL_VideoData = struct_SDL_VideoData;
pub const struct_SDL_GLDriverData_16 = opaque {};
pub const struct_SDL_EGL_VideoData_17 = opaque {};
pub const struct_SDL_PrivateGLESData_18 = opaque {};
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
    gl_config: struct_unnamed_14 = @import("std").mem.zeroes(struct_unnamed_14),
    egl_platformattrib_callback: SDL_EGLAttribArrayCallback = null,
    egl_surfaceattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_contextattrib_callback: SDL_EGLIntArrayCallback = null,
    egl_attrib_callback_userdata: ?*anyopaque = null,
    current_glwin: [*c]SDL_Window = null,
    current_glctx: SDL_GLContext = null,
    current_glwin_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    current_glctx_tls: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID),
    gl_allow_no_surface: bool = false,
    vulkan_config: struct_unnamed_15 = @import("std").mem.zeroes(struct_unnamed_15),
    internal: ?*SDL_VideoData = null,
    gl_data: ?*struct_SDL_GLDriverData_16 = null,
    egl_data: ?*struct_SDL_EGL_VideoData_17 = null,
    gles_data: ?*struct_SDL_PrivateGLESData_18 = null,
    free: ?*const fn (_this: [*c]SDL_VideoDevice) callconv(.c) void = null,
};
pub const SDL_VideoDevice = struct_SDL_VideoDevice;
pub const struct_SDL_DisplayData = opaque {};
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
    internal: ?*SDL_DisplayData = null,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub const SDL_FullscreenOp = c_uint;
pub const SDL_FullscreenResult = c_uint;
pub extern fn SDL_GetVideoDevice() [*c]SDL_VideoDevice;
pub const struct_SDL_Keymap = opaque {
};
pub const SDL_Keymap = struct_SDL_Keymap;
pub extern fn SDL_CreateKeymap(auto_release: bool) ?*SDL_Keymap;
pub extern fn SDL_SetKeymapEntry(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod, keycode: SDL_Keycode) void;
pub extern fn SDL_GetKeymapKeycode(keymap: ?*SDL_Keymap, scancode: SDL_Scancode, modstate: SDL_Keymod) SDL_Keycode;
pub extern fn SDL_GetKeymapScancode(keymap: ?*SDL_Keymap, keycode: SDL_Keycode, modstate: [*c]SDL_Keymod) SDL_Scancode;
pub extern fn SDL_GetKeymapNextReservedScancode(keymap: ?*SDL_Keymap) SDL_Scancode;
pub extern fn SDL_GetKeymapFlags(keymap: ?*SDL_Keymap) Uint32;
pub extern fn SDL_DetermineKeymapLayout(keymap: ?*SDL_Keymap) void;
pub extern fn SDL_DestroyKeymap(keymap: ?*SDL_Keymap) void;
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
pub extern fn SDL_SetRelativeMouseMode(enabled: bool) bool;
pub extern fn SDL_UpdateRelativeMouseMode() bool;
pub extern fn SDL_SendWindowEvent(window: [*c]SDL_Window, windowevent: SDL_EventType, data1: c_int, data2: c_int) bool;
pub extern fn SDL_SendKeymapChangedEvent() void;
pub extern fn SDL_AllocateTemporaryMemory(size: usize) ?*anyopaque;
pub extern fn SDL_CreateTemporaryString(string: [*c]const u8) [*c]const u8;
pub const struct_SDL_Keyboard = extern struct {
    focus: [*c]SDL_Window = null,
    modstate: SDL_Keymod = 0,
    keysource: [512]Uint8 = @import("std").mem.zeroes([512]Uint8),
    keystate: [512]bool = @import("std").mem.zeroes([512]bool),
    keymap: ?*SDL_Keymap = null,
    keycode_options: Uint32 = 0,
    autorelease_pending: bool = false,
    hardware_timestamp: Uint64 = 0,
};
pub const SDL_Keyboard = struct_SDL_Keyboard;
pub var SDL_keyboard: SDL_Keyboard = @import("std").mem.zeroes(SDL_Keyboard);
pub var SDL_keyboard_count: c_int = 0;
pub var SDL_keyboards: [*c]SDL_KeyboardID = null;
pub var SDL_keyboard_names: ?*SDL_HashTable = null;
pub var SDL_keyboard_quitting: bool = false;
pub fn SDL_KeycodeOptionsChanged(userdata: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = @ptrCast(@alignCast(userdata));
    _ = &keyboard;
    if ((hint != null) and (@as(c_int, hint.*) != 0)) {
        keyboard.*.keycode_options = 0;
        if (!(SDL_strstr_REAL(hint, "none") != null)) {
            if (SDL_strstr_REAL(hint, "hide_numpad") != null) {
                keyboard.*.keycode_options |= KEYCODE_OPTION_HIDE_NUMPAD;
            }
            if (SDL_strstr_REAL(hint, "french_numbers") != null) {
                keyboard.*.keycode_options |= KEYCODE_OPTION_FRENCH_NUMBERS;
            }
            if (SDL_strstr_REAL(hint, "latin_letters") != null) {
                keyboard.*.keycode_options |= KEYCODE_OPTION_LATIN_LETTERS;
            }
        }
    } else {
        keyboard.*.keycode_options = @bitCast(@as(c_int, KEYCODE_OPTION_FRENCH_NUMBERS | KEYCODE_OPTION_LATIN_LETTERS));
    }
}
pub export fn SDL_InitKeyboard() bool {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_KEYCODE_OPTIONS", SDL_KeycodeOptionsChanged, @ptrCast(@alignCast(&SDL_keyboard)));
    SDL_keyboard_names = SDL_CreateHashTable(0, @"true" != 0, SDL_HashID, SDL_KeyMatchID, SDL_DestroyHashValue, null);
    return @"true" != 0;
}
pub export fn SDL_IsKeyboard(_: Uint16, _: Uint16, num_keys: c_int) bool {
    @setEvalBranchQuota(100000);
    const REAL_KEYBOARD_KEY_COUNT: c_int = 50;
    _ = &REAL_KEYBOARD_KEY_COUNT;
    if ((num_keys > @as(c_int, 0)) and (num_keys < REAL_KEYBOARD_KEY_COUNT)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_GetKeyboardIndex(keyboardID: SDL_KeyboardID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    {
        var i: c_int = 0;
        _ = &i;
        while (i < SDL_keyboard_count) : (i += 1) {
            if (keyboardID == SDL_keyboards[@bitCast(@as(isize, @intCast(i)))]) {
                return i;
            }
        }
    }
    return -@as(c_int, 1);
}
pub export fn SDL_AddKeyboard(keyboardID: SDL_KeyboardID, arg_name: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var name = arg_name;
    _ = &name;
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "SDL_AddKeyboard".*;
    };
    _ = &static_local___func__;
    var keyboard_index: c_int = SDL_GetKeyboardIndex(keyboardID);
    _ = &keyboard_index;
    if (keyboard_index >= @as(c_int, 0)) {
        return;
    }
    while (true) {
        while (!(keyboardID != @as(SDL_KeyboardID, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "keyboardID != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_keyboard.c", 128);
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
    var keyboards: [*c]SDL_KeyboardID = undefined;
    keyboards = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(SDL_keyboards)), @as(c_ulong, @bitCast(@as(c_long, SDL_keyboard_count + @as(c_int, 1)))) *% @sizeOf(@TypeOf(keyboards.*)))));
    _ = &keyboards;
    if (!(keyboards != null)) {
        return;
    }
    keyboards[@bitCast(@as(isize, @intCast(SDL_keyboard_count)))] = keyboardID;
    SDL_keyboards = keyboards;
    SDL_keyboard_count += 1;
    if (!(name != null)) {
        name = "Keyboard";
    }
    _ = SDL_InsertIntoHashTable(SDL_keyboard_names, @ptrFromInt(@as(usize, keyboardID)), @ptrCast(@alignCast(SDL_strdup_REAL(name))), @"true" != 0);
    var event: SDL_Event = undefined;
    _ = &event;
    _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
    event.type = SDL_EVENT_KEYBOARD_ADDED;
    event.kdevice.which = keyboardID;
    _ = SDL_PushEvent_REAL(&event);
}
pub export fn SDL_RemoveKeyboard(keyboardID: SDL_KeyboardID) void {
    @setEvalBranchQuota(100000);
    var keyboard_index: c_int = SDL_GetKeyboardIndex(keyboardID);
    _ = &keyboard_index;
    if (keyboard_index < @as(c_int, 0)) {
        return;
    }
    if (keyboard_index != (SDL_keyboard_count - @as(c_int, 1))) {
        _ = memmove(@ptrCast(@alignCast(&SDL_keyboards[@bitCast(@as(isize, @intCast(keyboard_index)))])), @ptrCast(@alignCast(&SDL_keyboards[@bitCast(@as(isize, @intCast(keyboard_index + @as(c_int, 1))))])), @as(c_ulong, @bitCast(@as(c_long, (SDL_keyboard_count - keyboard_index) - @as(c_int, 1)))) *% @sizeOf(@TypeOf(SDL_keyboards[@bitCast(@as(isize, @intCast(keyboard_index)))])));
    }
    SDL_keyboard_count -= 1;
    if (!SDL_keyboard_quitting) {
        var event: SDL_Event = undefined;
        _ = &event;
        _ = memset(@ptrCast(@alignCast(&event)), 0, @sizeOf(@TypeOf(event)));
        event.type = SDL_EVENT_KEYBOARD_REMOVED;
        event.kdevice.which = keyboardID;
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_HasKeyboard_REAL() bool {
    @setEvalBranchQuota(100000);
    return SDL_keyboard_count > @as(c_int, 0);
}
pub export fn SDL_GetKeyboards_REAL(count: [*c]c_int) [*c]SDL_KeyboardID {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var keyboards: [*c]SDL_KeyboardID = undefined;
    _ = &keyboards;
    keyboards = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, SDL_keyboard_count + @as(c_int, 1)))) *% @sizeOf(@TypeOf(keyboards.*)))));
    if (keyboards != null) {
        if (count != null) {
            count.* = SDL_keyboard_count;
        }
        {
            i = 0;
            while (i < SDL_keyboard_count) : (i += 1) {
                keyboards[@bitCast(@as(isize, @intCast(i)))] = SDL_keyboards[@bitCast(@as(isize, @intCast(i)))];
            }
        }
        keyboards[@bitCast(@as(isize, @intCast(i)))] = 0;
    } else {
        if (count != null) {
            count.* = 0;
        }
    }
    return keyboards;
}
pub export fn SDL_GetKeyboardNameForID_REAL(instance_id: SDL_KeyboardID) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var name: [*c]const u8 = undefined;
    _ = &name;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                name = null;
                switch (instance_id) {
                    @as(SDL_KeyboardID, SDL_GLOBAL_KEYBOARD_ID) => {
                        sdl_pc = 2;
                        continue;
                    },
                    else => {
                        sdl_pc = 3;
                        continue;
                    },
                }
            },
            1 => {
                return name;
            },
            2 => {
                name = "Keyboard";
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                if (!SDL_FindInHashTable(SDL_keyboard_names, @ptrFromInt(@as(usize, instance_id)), @ptrCast(@alignCast(&name)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_SetError_REAL("Keyboard %u not found", instance_id);
                return null;
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
                _ = SDL_OutOfMemory_REAL();
                return null;
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
            else => unreachable,
        }
    }
}
pub export fn SDL_ResetKeyboard_REAL() void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    {
        var scancode: c_int = SDL_SCANCODE_UNKNOWN;
        _ = &scancode;
        while (scancode < SDL_SCANCODE_COUNT) : (scancode += 1) {
            if (keyboard.*.keystate[@bitCast(@as(isize, @intCast(scancode)))]) {
                _ = SDL_SendKeyboardKey(0, SDL_GLOBAL_KEYBOARD_ID, 0, @bitCast(scancode), @"false" != 0);
            }
        }
    }
}
pub export fn SDL_GetCurrentKeymap(ignore_options: bool) ?*SDL_Keymap {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    var keymap: ?*SDL_Keymap = SDL_keyboard.keymap;
    _ = &keymap;
    if ((keymap != null) and !ignore_options) {
        const keymap_flags: Uint32 = SDL_GetKeymapFlags(keymap);
        _ = &keymap_flags;
        if ((keymap_flags & @as(Uint32, SDL_KEYMAP_THAI_KEYBOARD)) != 0) {
            return null;
        }
        if (((keyboard.*.keycode_options & @as(Uint32, KEYCODE_OPTION_LATIN_LETTERS)) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(!((keymap_flags & @as(Uint32, SDL_KEYMAP_LATIN_LETTERS)) != 0))))) != 0)) {
            return null;
        }
    }
    return keymap;
}
pub export fn SDL_SetKeymap(keymap: ?*SDL_Keymap, send_event: bool) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    const keymap_flags: Uint32 = SDL_GetKeymapFlags(keymap);
    _ = &keymap_flags;
    if ((keymap_flags & @as(Uint32, SDL_KEYMAP_AUTO_RELEASE)) != 0) {
        SDL_DestroyKeymap(keyboard.*.keymap);
    }
    keyboard.*.keymap = keymap;
    SDL_DetermineKeymapLayout(keymap);
    if (send_event) {
        SDL_SendKeymapChangedEvent();
    }
}
pub fn GetNextReservedScancode() callconv(.c) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (!(keyboard.*.keymap != null)) {
        keyboard.*.keymap = SDL_CreateKeymap(@"true" != 0);
    }
    return SDL_GetKeymapNextReservedScancode(keyboard.*.keymap);
}
pub fn SetKeymapEntry(scancode: SDL_Scancode, modstate: SDL_Keymod, keycode: SDL_Keycode) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (!(keyboard.*.keymap != null)) {
        keyboard.*.keymap = SDL_CreateKeymap(@"true" != 0);
    }
    SDL_SetKeymapEntry(keyboard.*.keymap, scancode, modstate, keycode);
}
pub export fn SDL_GetKeyboardFocus_REAL() [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    return keyboard.*.focus;
}
pub export fn SDL_SetKeyboardFocus(window: [*c]SDL_Window) bool {
    @setEvalBranchQuota(100000);
    var video: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &video;
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    var mouse: [*c]SDL_Mouse = SDL_GetMouse();
    _ = &mouse;
    if (window != null) {
        if (!SDL_ObjectValid(@ptrCast(@alignCast(window)), SDL_OBJECT_TYPE_WINDOW) or window.*.is_destroying) {
            return SDL_SetError_REAL("Invalid window");
        }
    }
    if ((keyboard.*.focus != null) and !(window != null)) {
        SDL_ResetKeyboard_REAL();
    }
    if ((keyboard.*.focus != null) and (keyboard.*.focus != window)) {
        _ = SDL_SendWindowEvent(keyboard.*.focus, SDL_EVENT_WINDOW_FOCUS_LOST, 0, 0);
        if (SDL_TextInputActive_REAL(keyboard.*.focus)) {
            if ((video != null) and (video.*.StopTextInput != null)) {
                _ = video.*.StopTextInput.?(video, keyboard.*.focus);
            }
        }
    }
    if ((keyboard.*.focus != null) and !(window != null)) {
        if (mouse.*.relative_mode) {
            _ = SDL_SetRelativeMouseMode(@"false" != 0);
            var focus: [*c]SDL_Window = keyboard.*.focus;
            _ = &focus;
            if ((focus.*.flags & @as(c_ulong, 64)) != @as(SDL_WindowFlags, 0)) {
                var x: f32 = @as(f32, @floatFromInt(focus.*.x)) + mouse.*.x;
                _ = &x;
                var y: f32 = @as(f32, @floatFromInt(focus.*.y)) + mouse.*.y;
                _ = &y;
                _ = SDL_WarpMouseGlobal_REAL(x, y);
            }
        }
    }
    keyboard.*.focus = window;
    if (keyboard.*.focus != null) {
        _ = SDL_SendWindowEvent(keyboard.*.focus, SDL_EVENT_WINDOW_FOCUS_GAINED, 0, 0);
        if (SDL_TextInputActive_REAL(keyboard.*.focus)) {
            if ((video != null) and (video.*.StartTextInput != null)) {
                _ = video.*.StartTextInput.?(video, keyboard.*.focus, keyboard.*.focus.*.text_input_props);
            }
        }
    }
    _ = SDL_UpdateRelativeMouseMode();
    return @"true" != 0;
}
pub fn SDL_ConvertNumpadKeycode(keycode: SDL_Keycode, numlock: bool) callconv(.c) SDL_Keycode {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (keycode) {
                    SDLK_KP_DIVIDE => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDLK_KP_MULTIPLY => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDLK_KP_MINUS => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDLK_KP_PLUS => {
                        sdl_pc = 5;
                        continue;
                    },
                    SDLK_KP_ENTER => {
                        sdl_pc = 6;
                        continue;
                    },
                    SDLK_KP_1 => {
                        sdl_pc = 7;
                        continue;
                    },
                    SDLK_KP_2 => {
                        sdl_pc = 8;
                        continue;
                    },
                    SDLK_KP_3 => {
                        sdl_pc = 9;
                        continue;
                    },
                    SDLK_KP_4 => {
                        sdl_pc = 10;
                        continue;
                    },
                    SDLK_KP_5 => {
                        sdl_pc = 11;
                        continue;
                    },
                    SDLK_KP_6 => {
                        sdl_pc = 12;
                        continue;
                    },
                    SDLK_KP_7 => {
                        sdl_pc = 13;
                        continue;
                    },
                    SDLK_KP_8 => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDLK_KP_9 => {
                        sdl_pc = 15;
                        continue;
                    },
                    SDLK_KP_0 => {
                        sdl_pc = 16;
                        continue;
                    },
                    SDLK_KP_PERIOD => {
                        sdl_pc = 17;
                        continue;
                    },
                    SDLK_KP_EQUALS => {
                        sdl_pc = 18;
                        continue;
                    },
                    SDLK_KP_COMMA => {
                        sdl_pc = 19;
                        continue;
                    },
                    SDLK_KP_EQUALSAS400 => {
                        sdl_pc = 20;
                        continue;
                    },
                    SDLK_KP_LEFTPAREN => {
                        sdl_pc = 21;
                        continue;
                    },
                    SDLK_KP_RIGHTPAREN => {
                        sdl_pc = 22;
                        continue;
                    },
                    SDLK_KP_LEFTBRACE => {
                        sdl_pc = 23;
                        continue;
                    },
                    SDLK_KP_RIGHTBRACE => {
                        sdl_pc = 24;
                        continue;
                    },
                    SDLK_KP_TAB => {
                        sdl_pc = 25;
                        continue;
                    },
                    SDLK_KP_BACKSPACE => {
                        sdl_pc = 26;
                        continue;
                    },
                    SDLK_KP_A => {
                        sdl_pc = 27;
                        continue;
                    },
                    SDLK_KP_B => {
                        sdl_pc = 28;
                        continue;
                    },
                    SDLK_KP_C => {
                        sdl_pc = 29;
                        continue;
                    },
                    SDLK_KP_D => {
                        sdl_pc = 30;
                        continue;
                    },
                    SDLK_KP_E => {
                        sdl_pc = 31;
                        continue;
                    },
                    SDLK_KP_F => {
                        sdl_pc = 32;
                        continue;
                    },
                    SDLK_KP_PERCENT => {
                        sdl_pc = 33;
                        continue;
                    },
                    SDLK_KP_LESS => {
                        sdl_pc = 34;
                        continue;
                    },
                    SDLK_KP_GREATER => {
                        sdl_pc = 35;
                        continue;
                    },
                    SDLK_KP_AMPERSAND => {
                        sdl_pc = 36;
                        continue;
                    },
                    SDLK_KP_COLON => {
                        sdl_pc = 37;
                        continue;
                    },
                    SDLK_KP_HASH => {
                        sdl_pc = 38;
                        continue;
                    },
                    SDLK_KP_SPACE => {
                        sdl_pc = 39;
                        continue;
                    },
                    SDLK_KP_AT => {
                        sdl_pc = 40;
                        continue;
                    },
                    SDLK_KP_EXCLAM => {
                        sdl_pc = 41;
                        continue;
                    },
                    SDLK_KP_PLUSMINUS => {
                        sdl_pc = 42;
                        continue;
                    },
                    else => {
                        sdl_pc = 43;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return SDLK_SLASH;
            },
            3 => {
                return SDLK_ASTERISK;
            },
            4 => {
                return SDLK_MINUS;
            },
            5 => {
                return SDLK_PLUS;
            },
            6 => {
                return SDLK_RETURN;
            },
            7 => {
                return if (numlock) SDLK_1 else SDLK_END;
            },
            8 => {
                return if (numlock) SDLK_2 else SDLK_DOWN;
            },
            9 => {
                return if (numlock) SDLK_3 else SDLK_PAGEDOWN;
            },
            10 => {
                return if (numlock) SDLK_4 else SDLK_LEFT;
            },
            11 => {
                return if (numlock) SDLK_5 else SDLK_CLEAR;
            },
            12 => {
                return if (numlock) SDLK_6 else SDLK_RIGHT;
            },
            13 => {
                return if (numlock) SDLK_7 else SDLK_HOME;
            },
            14 => {
                return if (numlock) SDLK_8 else SDLK_UP;
            },
            15 => {
                return if (numlock) SDLK_9 else SDLK_PAGEUP;
            },
            16 => {
                return if (numlock) SDLK_0 else SDLK_INSERT;
            },
            17 => {
                return if (numlock) SDLK_PERIOD else SDLK_DELETE;
            },
            18 => {
                return SDLK_EQUALS;
            },
            19 => {
                return SDLK_COMMA;
            },
            20 => {
                return SDLK_EQUALS;
            },
            21 => {
                return SDLK_LEFTPAREN;
            },
            22 => {
                return SDLK_RIGHTPAREN;
            },
            23 => {
                return SDLK_LEFTBRACE;
            },
            24 => {
                return SDLK_RIGHTBRACE;
            },
            25 => {
                return SDLK_TAB;
            },
            26 => {
                return SDLK_BACKSPACE;
            },
            27 => {
                return SDLK_A;
            },
            28 => {
                return SDLK_B;
            },
            29 => {
                return SDLK_C;
            },
            30 => {
                return SDLK_D;
            },
            31 => {
                return SDLK_E;
            },
            32 => {
                return SDLK_F;
            },
            33 => {
                return SDLK_PERCENT;
            },
            34 => {
                return SDLK_LESS;
            },
            35 => {
                return SDLK_GREATER;
            },
            36 => {
                return SDLK_AMPERSAND;
            },
            37 => {
                return SDLK_COLON;
            },
            38 => {
                return SDLK_HASH;
            },
            39 => {
                return SDLK_SPACE;
            },
            40 => {
                return SDLK_AT;
            },
            41 => {
                return SDLK_EXCLAIM;
            },
            42 => {
                return SDLK_PLUSMINUS;
            },
            43 => {
                return keycode;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_GetKeyFromScancode_REAL(arg_scancode: SDL_Scancode, arg_modstate: SDL_Keymod, key_event: bool) SDL_Keycode {
    @setEvalBranchQuota(100000);
    var scancode = arg_scancode;
    _ = &scancode;
    var modstate = arg_modstate;
    _ = &modstate;
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (key_event) {
        var keymap: ?*SDL_Keymap = SDL_GetCurrentKeymap(@"false" != 0);
        _ = &keymap;
        const keymap_flags: Uint32 = SDL_GetKeymapFlags(keymap);
        _ = &keymap_flags;
        const numlock: bool = (@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & SDL_KMOD_NUM) != @as(c_uint, 0);
        _ = &numlock;
        modstate = SDL_KMOD_NONE;
        if ((((keyboard.*.keycode_options & @as(Uint32, KEYCODE_OPTION_FRENCH_NUMBERS)) != 0) and ((keymap_flags & @as(Uint32, SDL_KEYMAP_FRENCH_NUMBERS)) != 0)) and ((scancode >= @as(SDL_Scancode, SDL_SCANCODE_1)) and (scancode <= @as(SDL_Scancode, SDL_SCANCODE_0)))) {
            {
                const ref = &modstate;
                ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) | (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT));
            }
        }
        var keycode: SDL_Keycode = SDL_GetKeymapKeycode(keymap, scancode, modstate);
        _ = &keycode;
        if ((keyboard.*.keycode_options & @as(Uint32, KEYCODE_OPTION_HIDE_NUMPAD)) != 0) {
            keycode = SDL_ConvertNumpadKeycode(keycode, numlock);
        }
        return keycode;
    }
    return SDL_GetKeymapKeycode(keyboard.*.keymap, scancode, modstate);
}
pub export fn SDL_GetScancodeFromKey_REAL(key: SDL_Keycode, modstate: [*c]SDL_Keymod) SDL_Scancode {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    return SDL_GetKeymapScancode(keyboard.*.keymap, key, modstate);
}
pub fn SDL_SendKeyboardKeyInternal(timestamp: Uint64, flags: Uint32, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = undefined;
    _ = &keyboard;
    var posted: bool = undefined;
    _ = &posted;
    var keycode: SDL_Keycode = undefined;
    _ = &keycode;
    var @"type": Uint32 = undefined;
    _ = &@"type";
    var repeat: bool = undefined;
    _ = &repeat;
    var source: Uint8 = undefined;
    _ = &source;
    var modifier: SDL_Keymod = undefined;
    _ = &modifier;
    var event: SDL_Event = undefined;
    _ = &event;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                keyboard = &SDL_keyboard;
                posted = @"false" != 0;
                keycode = SDLK_UNKNOWN;
                repeat = @"false" != 0;
                source = @truncate(flags & @as(Uint32, @bitCast(@as(c_int, KEYBOARD_HARDWARE | KEYBOARD_AUTORELEASE))));
                if (down) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                @"type" = SDL_EVENT_KEY_DOWN;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                @"type" = SDL_EVENT_KEY_UP;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if ((scancode > @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and (scancode < @as(SDL_Scancode, SDL_SCANCODE_COUNT))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if (down) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                if (rawcode == @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            6 => {
                if (@as(c_int, source) == KEYBOARD_HARDWARE) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            7 => {
                if (keyboard.*.keystate[scancode]) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                if (!keyboard.*.keystate[scancode]) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            9 => {
                keyboard.*.keystate[scancode] = down;
                keycode = SDL_GetKeyFromScancode_REAL(scancode, keyboard.*.modstate, @"true" != 0);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                if (!((@as(c_int, keyboard.*.keysource[scancode]) & @as(c_int, source)) != 0)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
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
                    const ref = &keyboard.*.keysource[scancode];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, source))));
                }
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                {
                    const ref = &keyboard.*.keysource[scancode];
                    ref.* = @bitCast(@as(i8, @truncate(@as(c_int, ref.*) | @as(c_int, source))));
                }
                return @"false" != 0;
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                repeat = @"true" != 0;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                return @"false" != 0;
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                keyboard.*.keysource[scancode] = 0;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            19 => {
                return @"false" != 0;
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            22 => {
                keyboard.*.hardware_timestamp = SDL_GetTicks_REAL();
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                if (@as(c_int, source) == KEYBOARD_AUTORELEASE) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            24 => {
                if (!((flags & @as(Uint32, KEYBOARD_IGNOREMODIFIERS)) != 0) and !repeat) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            25 => {
                keyboard.*.autorelease_pending = @"true" != 0;
                {
                    sdl_pc = 27;
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
                    sdl_pc = 24;
                    continue;
                }
            },
            28 => {
                switch (keycode) {
                    SDLK_LCTRL => {
                        sdl_pc = 32;
                        continue;
                    },
                    SDLK_RCTRL => {
                        sdl_pc = 33;
                        continue;
                    },
                    SDLK_LSHIFT => {
                        sdl_pc = 34;
                        continue;
                    },
                    SDLK_RSHIFT => {
                        sdl_pc = 35;
                        continue;
                    },
                    SDLK_LALT => {
                        sdl_pc = 36;
                        continue;
                    },
                    SDLK_RALT => {
                        sdl_pc = 37;
                        continue;
                    },
                    SDLK_LGUI => {
                        sdl_pc = 38;
                        continue;
                    },
                    SDLK_RGUI => {
                        sdl_pc = 39;
                        continue;
                    },
                    SDLK_MODE => {
                        sdl_pc = 40;
                        continue;
                    },
                    else => {
                        sdl_pc = 41;
                        continue;
                    },
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                if (SDL_EventEnabled_REAL(@"type")) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            31 => {
                if (@as(Uint32, SDL_EVENT_KEY_DOWN) == @"type") {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            32 => {
                modifier = SDL_KMOD_LCTRL;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            33 => {
                modifier = SDL_KMOD_RCTRL;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            34 => {
                modifier = SDL_KMOD_LSHIFT;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            35 => {
                modifier = SDL_KMOD_RSHIFT;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            36 => {
                modifier = SDL_KMOD_LALT;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            37 => {
                modifier = SDL_KMOD_RALT;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            38 => {
                modifier = SDL_KMOD_LGUI;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            39 => {
                modifier = SDL_KMOD_RGUI;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            40 => {
                modifier = SDL_KMOD_MODE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            41 => {
                modifier = SDL_KMOD_NONE;
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            42 => {
                switch (keycode) {
                    SDLK_NUMLOCKCLEAR => {
                        sdl_pc = 46;
                        continue;
                    },
                    SDLK_CAPSLOCK => {
                        sdl_pc = 47;
                        continue;
                    },
                    SDLK_SCROLLLOCK => {
                        sdl_pc = 48;
                        continue;
                    },
                    else => {
                        sdl_pc = 49;
                        continue;
                    },
                }
            },
            43 => {
                {
                    const ref = &keyboard.*.modstate;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & ~@as(c_int, modifier))));
                }
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            46 => {
                {
                    const ref = &keyboard.*.modstate;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) ^ SDL_KMOD_NUM);
                }
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            47 => {
                {
                    const ref = &keyboard.*.modstate;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) ^ SDL_KMOD_CAPS);
                }
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                {
                    const ref = &keyboard.*.modstate;
                    ref.* = @truncate(@as(c_uint, @bitCast(@as(c_int, @as(c_int, ref.*)))) ^ SDL_KMOD_SCROLL);
                }
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            49 => {
                {
                    const ref = &keyboard.*.modstate;
                    ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, modifier))));
                }
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            50 => {
                event.type = @"type";
                event.common.timestamp = timestamp;
                event.key.scancode = scancode;
                event.key.key = keycode;
                event.key.mod = keyboard.*.modstate;
                event.key.raw = @bitCast(@as(c_short, @truncate(rawcode)));
                event.key.down = down;
                event.key.repeat = repeat;
                event.key.windowID = if (keyboard.*.focus != null) keyboard.*.focus.*.id else @as(SDL_WindowID, 0);
                event.key.which = keyboardID;
                posted = SDL_PushEvent_REAL(&event);
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
                if (((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool((@as(SDL_WindowFlags, @bitCast(@as(c_long, @intFromBool(((@as(c_uint, @bitCast(@as(c_int, @intFromBool((keycode == SDLK_TAB) and down)))) != 0) and ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, keyboard.*.modstate)))) & (SDL_KMOD_LALT | SDL_KMOD_RALT)) != 0)) and (keyboard.*.focus != null))))) != 0) and ((keyboard.*.focus.*.flags & @as(c_ulong, 1048576)) != 0))))) != 0) and ((keyboard.*.focus.*.flags & @as(c_ulong, 1)) != 0)) and SDL_GetHintBoolean_REAL("SDL_ALLOW_ALT_TAB_WHILE_GRABBED", @"true" != 0)) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                _ = SDL_MinimizeWindow_REAL(keyboard.*.focus);
                {
                    sdl_pc = 55;
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
                return posted;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SendKeyboardUnicodeKey(timestamp: Uint64, arg_ch: Uint32) void {
    @setEvalBranchQuota(100000);
    var ch = arg_ch;
    _ = &ch;
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    var modstate: SDL_Keymod = SDL_KMOD_NONE;
    _ = &modstate;
    var scancode: SDL_Scancode = undefined;
    _ = &scancode;
    if (ch == @as(Uint32, '\n')) {
        ch = SDLK_RETURN;
    }
    scancode = SDL_GetKeymapScancode(keyboard.*.keymap, ch, &modstate);
    if ((scancode == @as(SDL_Scancode, SDL_SCANCODE_UNKNOWN)) and (ch < (@as(c_uint, 1) << @intCast(@as(c_uint, 30))))) {
        scancode = GetNextReservedScancode();
        SetKeymapEntry(scancode, modstate, ch);
    }
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
        _ = SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_VIRTUAL, SDL_GLOBAL_KEYBOARD_ID, 0, SDL_SCANCODE_LSHIFT, @"true" != 0);
    }
    _ = SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_VIRTUAL, SDL_GLOBAL_KEYBOARD_ID, 0, scancode, @"true" != 0);
    _ = SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_VIRTUAL, SDL_GLOBAL_KEYBOARD_ID, 0, scancode, @"false" != 0);
    if ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, modstate)))) & (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)) != 0) {
        _ = SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_VIRTUAL, SDL_GLOBAL_KEYBOARD_ID, 0, SDL_SCANCODE_LSHIFT, @"false" != 0);
    }
}
pub export fn SDL_SendKeyboardKey(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool {
    @setEvalBranchQuota(100000);
    return SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_HARDWARE, keyboardID, rawcode, scancode, down);
}
pub export fn SDL_SendKeyboardKeyAndKeycode(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, keycode: SDL_Keycode, down: bool) bool {
    @setEvalBranchQuota(100000);
    if (down) {
        SetKeymapEntry(scancode, SDL_GetModState_REAL(), keycode);
    }
    return SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_HARDWARE, keyboardID, rawcode, scancode, down);
}
pub export fn SDL_SendKeyboardKeyIgnoreModifiers(timestamp: Uint64, keyboardID: SDL_KeyboardID, rawcode: c_int, scancode: SDL_Scancode, down: bool) bool {
    @setEvalBranchQuota(100000);
    return SDL_SendKeyboardKeyInternal(timestamp, @bitCast(@as(c_int, KEYBOARD_HARDWARE | KEYBOARD_IGNOREMODIFIERS)), keyboardID, rawcode, scancode, down);
}
pub export fn SDL_SendKeyboardKeyAutoRelease(timestamp: Uint64, scancode: SDL_Scancode) bool {
    @setEvalBranchQuota(100000);
    return SDL_SendKeyboardKeyInternal(timestamp, KEYBOARD_AUTORELEASE, SDL_GLOBAL_KEYBOARD_ID, 0, scancode, @"true" != 0);
}
pub export fn SDL_ReleaseAutoReleaseKeys() void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    var scancode: c_int = undefined;
    _ = &scancode;
    if (keyboard.*.autorelease_pending) {
        {
            scancode = SDL_SCANCODE_UNKNOWN;
            while (scancode < SDL_SCANCODE_COUNT) : (scancode += 1) {
                if (@as(c_int, keyboard.*.keysource[@bitCast(@as(isize, @intCast(scancode)))]) == KEYBOARD_AUTORELEASE) {
                    _ = SDL_SendKeyboardKeyInternal(0, KEYBOARD_AUTORELEASE, SDL_GLOBAL_KEYBOARD_ID, 0, @bitCast(scancode), @"false" != 0);
                }
            }
        }
        keyboard.*.autorelease_pending = @"false" != 0;
    }
    if (keyboard.*.hardware_timestamp != 0) {
        if (SDL_GetTicks_REAL() >= (keyboard.*.hardware_timestamp +% @as(Uint64, 250))) {
            keyboard.*.hardware_timestamp = 0;
        }
    }
}
pub export fn SDL_HardwareKeyboardKeyPressed() bool {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    var scancode: c_int = undefined;
    _ = &scancode;
    {
        scancode = SDL_SCANCODE_UNKNOWN;
        while (scancode < SDL_SCANCODE_COUNT) : (scancode += 1) {
            if ((@as(c_int, keyboard.*.keysource[@bitCast(@as(isize, @intCast(scancode)))]) & KEYBOARD_HARDWARE) != 0) {
                return @"true" != 0;
            }
        }
    }
    return (if (keyboard.*.hardware_timestamp != 0) @"true" else @"false") != 0;
}
pub export fn SDL_SendKeyboardText(text: [*c]const u8) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (!(keyboard.*.focus != null) or !SDL_TextInputActive_REAL(keyboard.*.focus)) {
        return;
    }
    if (!(text != null) or !(@as(c_int, text.*) != 0)) {
        return;
    }
    if (SDL_iscntrl_REAL(@as(u8, text.*)) != 0) {
        return;
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_TEXT_INPUT)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_TEXT_INPUT;
        event.common.timestamp = 0;
        event.text.windowID = if (keyboard.*.focus != null) keyboard.*.focus.*.id else @as(SDL_WindowID, 0);
        if (SDL_GetHintBoolean_REAL("SDL2_COMPAT", @"false" != 0)) {
            var pos: usize = 0;
            _ = &pos;
            var advance: usize = undefined;
            _ = &advance;
            var length: usize = SDL_strlen_REAL(text);
            _ = &length;
            while (pos < length) {
                var trimmed_text: [32]u8 = undefined;
                _ = &trimmed_text;
                advance = SDL_utf8strlcpy_REAL(@ptrCast(@alignCast(&trimmed_text)), text + pos, @sizeOf(@TypeOf(trimmed_text)) / @sizeOf(@TypeOf(trimmed_text[@as(c_int, 0)])));
                if (!(advance != 0)) {
                    break;
                }
                pos +%= advance;
                event.text.text = SDL_CreateTemporaryString(@ptrCast(@alignCast(&trimmed_text)));
                if (!(event.text.text != null)) {
                    return;
                }
                _ = SDL_PushEvent_REAL(&event);
            }
        } else {
            event.text.text = SDL_CreateTemporaryString(text);
            if (!(event.text.text != null)) {
                return;
            }
            _ = SDL_PushEvent_REAL(&event);
        }
    }
}
pub export fn SDL_SendEditingText(text: [*c]const u8, start: c_int, length: c_int) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (!(keyboard.*.focus != null) or !SDL_TextInputActive_REAL(keyboard.*.focus)) {
        return;
    }
    if (!(text != null)) {
        return;
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_TEXT_EDITING)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_TEXT_EDITING;
        event.common.timestamp = 0;
        event.edit.windowID = if (keyboard.*.focus != null) keyboard.*.focus.*.id else @as(SDL_WindowID, 0);
        event.edit.start = start;
        event.edit.length = length;
        event.edit.text = SDL_CreateTemporaryString(text);
        if (!(event.edit.text != null)) {
            return;
        }
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub fn CreateCandidatesForEvent(candidates: [*c][*c]u8, num_candidates: c_int) callconv(.c) [*c]const [*c]const u8 {
    @setEvalBranchQuota(100000);
    var event_candidates: [*c][*c]const u8 = undefined;
    _ = &event_candidates;
    var i: c_int = undefined;
    _ = &i;
    var ptr: [*c]u8 = undefined;
    _ = &ptr;
    var total_length: usize = @as(c_ulong, @bitCast(@as(c_long, num_candidates + @as(c_int, 1)))) *% @sizeOf(@TypeOf(event_candidates.*));
    _ = &total_length;
    {
        i = 0;
        while (i < num_candidates) : (i += 1) {
            var length: usize = SDL_strlen_REAL(candidates[@bitCast(@as(isize, @intCast(i)))]) +% @as(usize, 1);
            _ = &length;
            total_length +%= length;
        }
    }
    event_candidates = @ptrCast(@alignCast(SDL_AllocateTemporaryMemory(total_length)));
    if (!(event_candidates != null)) {
        return null;
    }
    ptr = @ptrCast(@alignCast(event_candidates + @as(usize, @bitCast(@as(isize, @intCast(num_candidates + @as(c_int, 1)))))));
    {
        i = 0;
        while (i < num_candidates) : (i += 1) {
            var length: usize = SDL_strlen_REAL(candidates[@bitCast(@as(isize, @intCast(i)))]) +% @as(usize, 1);
            _ = &length;
            event_candidates[@bitCast(@as(isize, @intCast(i)))] = ptr;
            _ = memcpy(@ptrCast(@alignCast(ptr)), @ptrCast(@alignCast(candidates[@bitCast(@as(isize, @intCast(i)))])), length);
            ptr += length;
        }
    }
    event_candidates[@bitCast(@as(isize, @intCast(i)))] = null;
    return event_candidates;
}
pub export fn SDL_SendEditingTextCandidates(candidates: [*c][*c]u8, num_candidates: c_int, selected_candidate: c_int, horizontal: bool) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (!(keyboard.*.focus != null) or !SDL_TextInputActive_REAL(keyboard.*.focus)) {
        return;
    }
    if (SDL_EventEnabled_REAL(SDL_EVENT_TEXT_EDITING_CANDIDATES)) {
        var event: SDL_Event = undefined;
        _ = &event;
        event.type = SDL_EVENT_TEXT_EDITING_CANDIDATES;
        event.common.timestamp = 0;
        event.edit.windowID = if (keyboard.*.focus != null) keyboard.*.focus.*.id else @as(SDL_WindowID, 0);
        if (num_candidates > @as(c_int, 0)) {
            var event_candidates: [*c]const [*c]const u8 = CreateCandidatesForEvent(candidates, num_candidates);
            _ = &event_candidates;
            if (!(event_candidates != null)) {
                return;
            }
            event.edit_candidates.candidates = event_candidates;
            event.edit_candidates.num_candidates = num_candidates;
            event.edit_candidates.selected_candidate = selected_candidate;
            event.edit_candidates.horizontal = horizontal;
        } else {
            event.edit_candidates.candidates = null;
            event.edit_candidates.num_candidates = 0;
            event.edit_candidates.selected_candidate = -@as(c_int, 1);
            event.edit_candidates.horizontal = @"false" != 0;
        }
        _ = SDL_PushEvent_REAL(&event);
    }
}
pub export fn SDL_QuitKeyboard() void {
    @setEvalBranchQuota(100000);
    SDL_keyboard_quitting = @"true" != 0;
    {
        var i: c_int = SDL_keyboard_count;
        _ = &i;
        while ((blk: {
            const ref = &i;
            const tmp = ref.*;
            ref.* -= 1;
            break :blk tmp;
        }) != 0) {
            SDL_RemoveKeyboard(SDL_keyboards[@bitCast(@as(isize, @intCast(i)))]);
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(SDL_keyboards)));
    SDL_keyboards = null;
    SDL_DestroyHashTable(SDL_keyboard_names);
    SDL_keyboard_names = null;
    const keymap_flags: Uint32 = SDL_GetKeymapFlags(SDL_keyboard.keymap);
    _ = &keymap_flags;
    if ((keymap_flags & @as(Uint32, SDL_KEYMAP_AUTO_RELEASE)) != 0) {
        SDL_DestroyKeymap(SDL_keyboard.keymap);
        SDL_keyboard.keymap = null;
    }
    SDL_RemoveHintCallback_REAL("SDL_KEYCODE_OPTIONS", SDL_KeycodeOptionsChanged, @ptrCast(@alignCast(&SDL_keyboard)));
    SDL_keyboard_quitting = @"false" != 0;
}
pub export fn SDL_GetKeyboardState_REAL(numkeys: [*c]c_int) [*c]const bool {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (numkeys != null) {
        numkeys.* = SDL_SCANCODE_COUNT;
    }
    return @ptrCast(@alignCast(&keyboard.*.keystate));
}
pub export fn SDL_GetModState_REAL() SDL_Keymod {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    return keyboard.*.modstate;
}
pub export fn SDL_SetModState_REAL(modstate: SDL_Keymod) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    keyboard.*.modstate = modstate;
}
pub export fn SDL_ToggleModState(modstate: SDL_Keymod, toggle: bool) void {
    @setEvalBranchQuota(100000);
    var keyboard: [*c]SDL_Keyboard = &SDL_keyboard;
    _ = &keyboard;
    if (toggle) {
        {
            const ref = &keyboard.*.modstate;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) | @as(c_int, modstate))));
        }
    } else {
        {
            const ref = &keyboard.*.modstate;
            ref.* = @bitCast(@as(c_short, @truncate(@as(c_int, ref.*) & ~@as(c_int, modstate))));
        }
    }
}

pub const SDL_GetKeyFromScancode = SDL_GetKeyFromScancode_REAL;
pub const SDL_GetKeyboardFocus = SDL_GetKeyboardFocus_REAL;
pub const SDL_GetKeyboardNameForID = SDL_GetKeyboardNameForID_REAL;
pub const SDL_GetKeyboardState = SDL_GetKeyboardState_REAL;
pub const SDL_GetKeyboards = SDL_GetKeyboards_REAL;
pub const SDL_GetModState = SDL_GetModState_REAL;
pub const SDL_GetScancodeFromKey = SDL_GetScancodeFromKey_REAL;
pub const SDL_HasKeyboard = SDL_HasKeyboard_REAL;
pub const SDL_ResetKeyboard = SDL_ResetKeyboard_REAL;
pub const SDL_SetModState = SDL_SetModState_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDLK_UNKNOWN = @as(c_uint, 0x00000000);
pub const SDLK_RETURN = @as(c_uint, 0x0000000d);
pub const SDLK_BACKSPACE = @as(c_uint, 0x00000008);
pub const SDLK_TAB = @as(c_uint, 0x00000009);
pub const SDLK_SPACE = @as(c_uint, 0x00000020);
pub const SDLK_EXCLAIM = @as(c_uint, 0x00000021);
pub const SDLK_HASH = @as(c_uint, 0x00000023);
pub const SDLK_PERCENT = @as(c_uint, 0x00000025);
pub const SDLK_AMPERSAND = @as(c_uint, 0x00000026);
pub const SDLK_LEFTPAREN = @as(c_uint, 0x00000028);
pub const SDLK_RIGHTPAREN = @as(c_uint, 0x00000029);
pub const SDLK_ASTERISK = @as(c_uint, 0x0000002a);
pub const SDLK_PLUS = @as(c_uint, 0x0000002b);
pub const SDLK_COMMA = @as(c_uint, 0x0000002c);
pub const SDLK_MINUS = @as(c_uint, 0x0000002d);
pub const SDLK_PERIOD = @as(c_uint, 0x0000002e);
pub const SDLK_SLASH = @as(c_uint, 0x0000002f);
pub const SDLK_0 = @as(c_uint, 0x00000030);
pub const SDLK_1 = @as(c_uint, 0x00000031);
pub const SDLK_2 = @as(c_uint, 0x00000032);
pub const SDLK_3 = @as(c_uint, 0x00000033);
pub const SDLK_4 = @as(c_uint, 0x00000034);
pub const SDLK_5 = @as(c_uint, 0x00000035);
pub const SDLK_6 = @as(c_uint, 0x00000036);
pub const SDLK_7 = @as(c_uint, 0x00000037);
pub const SDLK_8 = @as(c_uint, 0x00000038);
pub const SDLK_9 = @as(c_uint, 0x00000039);
pub const SDLK_COLON = @as(c_uint, 0x0000003a);
pub const SDLK_LESS = @as(c_uint, 0x0000003c);
pub const SDLK_EQUALS = @as(c_uint, 0x0000003d);
pub const SDLK_GREATER = @as(c_uint, 0x0000003e);
pub const SDLK_AT = @as(c_uint, 0x00000040);
pub const SDLK_A = @as(c_uint, 0x00000061);
pub const SDLK_B = @as(c_uint, 0x00000062);
pub const SDLK_C = @as(c_uint, 0x00000063);
pub const SDLK_D = @as(c_uint, 0x00000064);
pub const SDLK_E = @as(c_uint, 0x00000065);
pub const SDLK_F = @as(c_uint, 0x00000066);
pub const SDLK_LEFTBRACE = @as(c_uint, 0x0000007b);
pub const SDLK_RIGHTBRACE = @as(c_uint, 0x0000007d);
pub const SDLK_DELETE = @as(c_uint, 0x0000007f);
pub const SDLK_PLUSMINUS = @as(c_uint, 0x000000b1);
pub const SDLK_CAPSLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000039, .hex);
pub const SDLK_SCROLLLOCK = __helpers.promoteIntLiteral(c_uint, 0x40000047, .hex);
pub const SDLK_INSERT = __helpers.promoteIntLiteral(c_uint, 0x40000049, .hex);
pub const SDLK_HOME = __helpers.promoteIntLiteral(c_uint, 0x4000004a, .hex);
pub const SDLK_PAGEUP = __helpers.promoteIntLiteral(c_uint, 0x4000004b, .hex);
pub const SDLK_END = __helpers.promoteIntLiteral(c_uint, 0x4000004d, .hex);
pub const SDLK_PAGEDOWN = __helpers.promoteIntLiteral(c_uint, 0x4000004e, .hex);
pub const SDLK_RIGHT = __helpers.promoteIntLiteral(c_uint, 0x4000004f, .hex);
pub const SDLK_LEFT = __helpers.promoteIntLiteral(c_uint, 0x40000050, .hex);
pub const SDLK_DOWN = __helpers.promoteIntLiteral(c_uint, 0x40000051, .hex);
pub const SDLK_UP = __helpers.promoteIntLiteral(c_uint, 0x40000052, .hex);
pub const SDLK_NUMLOCKCLEAR = __helpers.promoteIntLiteral(c_uint, 0x40000053, .hex);
pub const SDLK_KP_DIVIDE = __helpers.promoteIntLiteral(c_uint, 0x40000054, .hex);
pub const SDLK_KP_MULTIPLY = __helpers.promoteIntLiteral(c_uint, 0x40000055, .hex);
pub const SDLK_KP_MINUS = __helpers.promoteIntLiteral(c_uint, 0x40000056, .hex);
pub const SDLK_KP_PLUS = __helpers.promoteIntLiteral(c_uint, 0x40000057, .hex);
pub const SDLK_KP_ENTER = __helpers.promoteIntLiteral(c_uint, 0x40000058, .hex);
pub const SDLK_KP_1 = __helpers.promoteIntLiteral(c_uint, 0x40000059, .hex);
pub const SDLK_KP_2 = __helpers.promoteIntLiteral(c_uint, 0x4000005a, .hex);
pub const SDLK_KP_3 = __helpers.promoteIntLiteral(c_uint, 0x4000005b, .hex);
pub const SDLK_KP_4 = __helpers.promoteIntLiteral(c_uint, 0x4000005c, .hex);
pub const SDLK_KP_5 = __helpers.promoteIntLiteral(c_uint, 0x4000005d, .hex);
pub const SDLK_KP_6 = __helpers.promoteIntLiteral(c_uint, 0x4000005e, .hex);
pub const SDLK_KP_7 = __helpers.promoteIntLiteral(c_uint, 0x4000005f, .hex);
pub const SDLK_KP_8 = __helpers.promoteIntLiteral(c_uint, 0x40000060, .hex);
pub const SDLK_KP_9 = __helpers.promoteIntLiteral(c_uint, 0x40000061, .hex);
pub const SDLK_KP_0 = __helpers.promoteIntLiteral(c_uint, 0x40000062, .hex);
pub const SDLK_KP_PERIOD = __helpers.promoteIntLiteral(c_uint, 0x40000063, .hex);
pub const SDLK_KP_EQUALS = __helpers.promoteIntLiteral(c_uint, 0x40000067, .hex);
pub const SDLK_KP_COMMA = __helpers.promoteIntLiteral(c_uint, 0x40000085, .hex);
pub const SDLK_KP_EQUALSAS400 = __helpers.promoteIntLiteral(c_uint, 0x40000086, .hex);
pub const SDLK_CLEAR = __helpers.promoteIntLiteral(c_uint, 0x4000009c, .hex);
pub const SDLK_KP_LEFTPAREN = __helpers.promoteIntLiteral(c_uint, 0x400000b6, .hex);
pub const SDLK_KP_RIGHTPAREN = __helpers.promoteIntLiteral(c_uint, 0x400000b7, .hex);
pub const SDLK_KP_LEFTBRACE = __helpers.promoteIntLiteral(c_uint, 0x400000b8, .hex);
pub const SDLK_KP_RIGHTBRACE = __helpers.promoteIntLiteral(c_uint, 0x400000b9, .hex);
pub const SDLK_KP_TAB = __helpers.promoteIntLiteral(c_uint, 0x400000ba, .hex);
pub const SDLK_KP_BACKSPACE = __helpers.promoteIntLiteral(c_uint, 0x400000bb, .hex);
pub const SDLK_KP_A = __helpers.promoteIntLiteral(c_uint, 0x400000bc, .hex);
pub const SDLK_KP_B = __helpers.promoteIntLiteral(c_uint, 0x400000bd, .hex);
pub const SDLK_KP_C = __helpers.promoteIntLiteral(c_uint, 0x400000be, .hex);
pub const SDLK_KP_D = __helpers.promoteIntLiteral(c_uint, 0x400000bf, .hex);
pub const SDLK_KP_E = __helpers.promoteIntLiteral(c_uint, 0x400000c0, .hex);
pub const SDLK_KP_F = __helpers.promoteIntLiteral(c_uint, 0x400000c1, .hex);
pub const SDLK_KP_PERCENT = __helpers.promoteIntLiteral(c_uint, 0x400000c4, .hex);
pub const SDLK_KP_LESS = __helpers.promoteIntLiteral(c_uint, 0x400000c5, .hex);
pub const SDLK_KP_GREATER = __helpers.promoteIntLiteral(c_uint, 0x400000c6, .hex);
pub const SDLK_KP_AMPERSAND = __helpers.promoteIntLiteral(c_uint, 0x400000c7, .hex);
pub const SDLK_KP_COLON = __helpers.promoteIntLiteral(c_uint, 0x400000cb, .hex);
pub const SDLK_KP_HASH = __helpers.promoteIntLiteral(c_uint, 0x400000cc, .hex);
pub const SDLK_KP_SPACE = __helpers.promoteIntLiteral(c_uint, 0x400000cd, .hex);
pub const SDLK_KP_AT = __helpers.promoteIntLiteral(c_uint, 0x400000ce, .hex);
pub const SDLK_KP_EXCLAM = __helpers.promoteIntLiteral(c_uint, 0x400000cf, .hex);
pub const SDLK_KP_PLUSMINUS = __helpers.promoteIntLiteral(c_uint, 0x400000d7, .hex);
pub const SDLK_LCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e0, .hex);
pub const SDLK_LSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e1, .hex);
pub const SDLK_LALT = __helpers.promoteIntLiteral(c_uint, 0x400000e2, .hex);
pub const SDLK_LGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e3, .hex);
pub const SDLK_RCTRL = __helpers.promoteIntLiteral(c_uint, 0x400000e4, .hex);
pub const SDLK_RSHIFT = __helpers.promoteIntLiteral(c_uint, 0x400000e5, .hex);
pub const SDLK_RALT = __helpers.promoteIntLiteral(c_uint, 0x400000e6, .hex);
pub const SDLK_RGUI = __helpers.promoteIntLiteral(c_uint, 0x400000e7, .hex);
pub const SDLK_MODE = __helpers.promoteIntLiteral(c_uint, 0x40000101, .hex);
pub const SDL_KMOD_NONE = @as(c_uint, 0x0000);
pub const SDL_KMOD_LSHIFT = @as(c_uint, 0x0001);
pub const SDL_KMOD_RSHIFT = @as(c_uint, 0x0002);
pub const SDL_KMOD_LCTRL = @as(c_uint, 0x0040);
pub const SDL_KMOD_RCTRL = @as(c_uint, 0x0080);
pub const SDL_KMOD_LALT = @as(c_uint, 0x0100);
pub const SDL_KMOD_RALT = @as(c_uint, 0x0200);
pub const SDL_KMOD_LGUI = @as(c_uint, 0x0400);
pub const SDL_KMOD_RGUI = @as(c_uint, 0x0800);
pub const SDL_KMOD_NUM = @as(c_uint, 0x1000);
pub const SDL_KMOD_CAPS = @as(c_uint, 0x2000);
pub const SDL_KMOD_MODE = @as(c_uint, 0x4000);
pub const SDL_KMOD_SCROLL = @as(c_uint, 0x8000);
pub const SDL_KEYMAP_AUTO_RELEASE = @as(c_int, 0x01);
pub const SDL_KEYMAP_FRENCH_NUMBERS = @as(c_int, 0x04);
pub const SDL_KEYMAP_LATIN_LETTERS = @as(c_int, 0x08);
pub const SDL_KEYMAP_THAI_KEYBOARD = @as(c_int, 0x10);
pub const SDL_GLOBAL_KEYBOARD_ID = @as(c_int, 0);
pub const KEYBOARD_HARDWARE = @as(c_int, 0x01);
pub const KEYBOARD_VIRTUAL = @as(c_int, 0x02);
pub const KEYBOARD_AUTORELEASE = @as(c_int, 0x04);
pub const KEYBOARD_IGNOREMODIFIERS = @as(c_int, 0x08);
pub const KEYCODE_OPTION_HIDE_NUMPAD = @as(c_int, 0x01);
pub const KEYCODE_OPTION_FRENCH_NUMBERS = @as(c_int, 0x02);
pub const KEYCODE_OPTION_LATIN_LETTERS = @as(c_int, 0x04);
