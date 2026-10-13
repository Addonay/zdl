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
pub const __dev_t = c_ulong;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_SetAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_GetAtomicInt_REAL(a: [*c]SDL_AtomicInt) c_int;
pub extern fn SDL_AddAtomicInt_REAL(a: [*c]SDL_AtomicInt, v: c_int) c_int;
pub extern fn SDL_SetAtomicPointer_REAL(a: [*c]?*anyopaque, v: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_ClearError_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const SDL_ThreadID = Uint64;
pub const SDL_TLSID = SDL_AtomicInt;
pub extern fn SDL_GetTLS_REAL(id: [*c]SDL_TLSID) ?*anyopaque;
pub const SDL_TLSDestructorCallback = ?*const fn (value: ?*anyopaque) callconv(.c) void;
pub extern fn SDL_SetTLS_REAL(id: [*c]SDL_TLSID, value: ?*const anyopaque, destructor: SDL_TLSDestructorCallback) bool;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const struct_SDL_Semaphore = opaque {
};
pub const SDL_Semaphore = struct_SDL_Semaphore;
pub extern fn SDL_CreateSemaphore_REAL(initial_value: Uint32) ?*SDL_Semaphore;
pub extern fn SDL_DestroySemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_WaitSemaphore_REAL(sem: ?*SDL_Semaphore) void;
pub extern fn SDL_SignalSemaphore_REAL(sem: ?*SDL_Semaphore) void;
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
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const SDL_SensorID = Uint32;
pub extern fn SDL_UpdateSensors_REAL() void;
pub const SDL_JoystickID = Uint32;
pub extern fn SDL_UpdateJoysticks_REAL() void;
pub const enum_SDL_Scancode = c_uint;
pub const SDL_Scancode = enum_SDL_Scancode;
pub const SDL_Keycode = Uint32;
pub const SDL_Keymod = Uint16;
pub const SDL_KeyboardID = Uint32;
pub const SDL_MouseID = Uint32;
pub const SDL_MOUSEWHEEL_NORMAL: c_int = 0;
pub const enum_SDL_MouseWheelDirection = c_uint;
pub const SDL_MouseWheelDirection = enum_SDL_MouseWheelDirection;
pub const SDL_MouseButtonFlags = Uint32;
pub const SDL_NotificationID = Uint32;
pub const SDL_TouchID = Uint64;
pub const SDL_FingerID = Uint64;
pub const SDL_PenID = Uint32;
pub const SDL_PenInputFlags = Uint32;
pub const SDL_PEN_AXIS_COUNT: c_int = 7;
pub const enum_SDL_PenAxis = c_uint;
pub const SDL_PenAxis = enum_SDL_PenAxis;
pub const enum_SDL_PenDeviceType = c_int;
pub const SDL_PenDeviceType = enum_SDL_PenDeviceType;
pub const SDL_EVENT_FIRST: c_int = 0;
pub const SDL_EVENT_QUIT: c_int = 256;
pub const SDL_EVENT_TERMINATING: c_int = 257;
pub const SDL_EVENT_LOW_MEMORY: c_int = 258;
pub const SDL_EVENT_WILL_ENTER_BACKGROUND: c_int = 259;
pub const SDL_EVENT_DID_ENTER_BACKGROUND: c_int = 260;
pub const SDL_EVENT_WILL_ENTER_FOREGROUND: c_int = 261;
pub const SDL_EVENT_DID_ENTER_FOREGROUND: c_int = 262;
pub const SDL_EVENT_LOCALE_CHANGED: c_int = 263;
pub const SDL_EVENT_SYSTEM_THEME_CHANGED: c_int = 264;
pub const SDL_EVENT_DISPLAY_ORIENTATION: c_int = 337;
pub const SDL_EVENT_DISPLAY_ADDED: c_int = 338;
pub const SDL_EVENT_DISPLAY_REMOVED: c_int = 339;
pub const SDL_EVENT_DISPLAY_MOVED: c_int = 340;
pub const SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED: c_int = 341;
pub const SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED: c_int = 342;
pub const SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED: c_int = 343;
pub const SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED: c_int = 344;
pub const SDL_EVENT_WINDOW_SHOWN: c_int = 514;
pub const SDL_EVENT_WINDOW_HIDDEN: c_int = 515;
pub const SDL_EVENT_WINDOW_EXPOSED: c_int = 516;
pub const SDL_EVENT_WINDOW_MOVED: c_int = 517;
pub const SDL_EVENT_WINDOW_RESIZED: c_int = 518;
pub const SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: c_int = 519;
pub const SDL_EVENT_WINDOW_METAL_VIEW_RESIZED: c_int = 520;
pub const SDL_EVENT_WINDOW_MINIMIZED: c_int = 521;
pub const SDL_EVENT_WINDOW_MAXIMIZED: c_int = 522;
pub const SDL_EVENT_WINDOW_RESTORED: c_int = 523;
pub const SDL_EVENT_WINDOW_MOUSE_ENTER: c_int = 524;
pub const SDL_EVENT_WINDOW_MOUSE_LEAVE: c_int = 525;
pub const SDL_EVENT_WINDOW_FOCUS_GAINED: c_int = 526;
pub const SDL_EVENT_WINDOW_FOCUS_LOST: c_int = 527;
pub const SDL_EVENT_WINDOW_CLOSE_REQUESTED: c_int = 528;
pub const SDL_EVENT_WINDOW_HIT_TEST: c_int = 529;
pub const SDL_EVENT_WINDOW_ICCPROF_CHANGED: c_int = 530;
pub const SDL_EVENT_WINDOW_DISPLAY_CHANGED: c_int = 531;
pub const SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED: c_int = 532;
pub const SDL_EVENT_WINDOW_SAFE_AREA_CHANGED: c_int = 533;
pub const SDL_EVENT_WINDOW_OCCLUDED: c_int = 534;
pub const SDL_EVENT_WINDOW_ENTER_FULLSCREEN: c_int = 535;
pub const SDL_EVENT_WINDOW_LEAVE_FULLSCREEN: c_int = 536;
pub const SDL_EVENT_WINDOW_DESTROYED: c_int = 537;
pub const SDL_EVENT_WINDOW_HDR_STATE_CHANGED: c_int = 538;
pub const SDL_EVENT_WINDOW_SETTINGS_CHANGED: c_int = 539;
pub const SDL_EVENT_KEY_DOWN: c_int = 768;
pub const SDL_EVENT_KEY_UP: c_int = 769;
pub const SDL_EVENT_TEXT_EDITING: c_int = 770;
pub const SDL_EVENT_TEXT_INPUT: c_int = 771;
pub const SDL_EVENT_KEYMAP_CHANGED: c_int = 772;
pub const SDL_EVENT_KEYBOARD_ADDED: c_int = 773;
pub const SDL_EVENT_KEYBOARD_REMOVED: c_int = 774;
pub const SDL_EVENT_TEXT_EDITING_CANDIDATES: c_int = 775;
pub const SDL_EVENT_SCREEN_KEYBOARD_SHOWN: c_int = 776;
pub const SDL_EVENT_SCREEN_KEYBOARD_HIDDEN: c_int = 777;
pub const SDL_EVENT_MOUSE_MOTION: c_int = 1024;
pub const SDL_EVENT_MOUSE_BUTTON_DOWN: c_int = 1025;
pub const SDL_EVENT_MOUSE_BUTTON_UP: c_int = 1026;
pub const SDL_EVENT_MOUSE_WHEEL: c_int = 1027;
pub const SDL_EVENT_MOUSE_ADDED: c_int = 1028;
pub const SDL_EVENT_MOUSE_REMOVED: c_int = 1029;
pub const SDL_EVENT_JOYSTICK_AXIS_MOTION: c_int = 1536;
pub const SDL_EVENT_JOYSTICK_BALL_MOTION: c_int = 1537;
pub const SDL_EVENT_JOYSTICK_HAT_MOTION: c_int = 1538;
pub const SDL_EVENT_JOYSTICK_BUTTON_DOWN: c_int = 1539;
pub const SDL_EVENT_JOYSTICK_BUTTON_UP: c_int = 1540;
pub const SDL_EVENT_JOYSTICK_ADDED: c_int = 1541;
pub const SDL_EVENT_JOYSTICK_REMOVED: c_int = 1542;
pub const SDL_EVENT_JOYSTICK_BATTERY_UPDATED: c_int = 1543;
pub const SDL_EVENT_JOYSTICK_UPDATE_COMPLETE: c_int = 1544;
pub const SDL_EVENT_GAMEPAD_AXIS_MOTION: c_int = 1616;
pub const SDL_EVENT_GAMEPAD_BUTTON_DOWN: c_int = 1617;
pub const SDL_EVENT_GAMEPAD_BUTTON_UP: c_int = 1618;
pub const SDL_EVENT_GAMEPAD_ADDED: c_int = 1619;
pub const SDL_EVENT_GAMEPAD_REMOVED: c_int = 1620;
pub const SDL_EVENT_GAMEPAD_REMAPPED: c_int = 1621;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN: c_int = 1622;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION: c_int = 1623;
pub const SDL_EVENT_GAMEPAD_TOUCHPAD_UP: c_int = 1624;
pub const SDL_EVENT_GAMEPAD_SENSOR_UPDATE: c_int = 1625;
pub const SDL_EVENT_GAMEPAD_UPDATE_COMPLETE: c_int = 1626;
pub const SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED: c_int = 1627;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH: c_int = 1628;
pub const SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE: c_int = 1629;
pub const SDL_EVENT_FINGER_DOWN: c_int = 1792;
pub const SDL_EVENT_FINGER_UP: c_int = 1793;
pub const SDL_EVENT_FINGER_MOTION: c_int = 1794;
pub const SDL_EVENT_FINGER_CANCELED: c_int = 1795;
pub const SDL_EVENT_PINCH_BEGIN: c_int = 1808;
pub const SDL_EVENT_PINCH_UPDATE: c_int = 1809;
pub const SDL_EVENT_PINCH_END: c_int = 1810;
pub const SDL_EVENT_CLIPBOARD_UPDATE: c_int = 2304;
pub const SDL_EVENT_DROP_FILE: c_int = 4096;
pub const SDL_EVENT_DROP_TEXT: c_int = 4097;
pub const SDL_EVENT_DROP_BEGIN: c_int = 4098;
pub const SDL_EVENT_DROP_COMPLETE: c_int = 4099;
pub const SDL_EVENT_DROP_POSITION: c_int = 4100;
pub const SDL_EVENT_AUDIO_DEVICE_ADDED: c_int = 4352;
pub const SDL_EVENT_AUDIO_DEVICE_REMOVED: c_int = 4353;
pub const SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED: c_int = 4354;
pub const SDL_EVENT_SENSOR_UPDATE: c_int = 4608;
pub const SDL_EVENT_PEN_PROXIMITY_IN: c_int = 4864;
pub const SDL_EVENT_PEN_PROXIMITY_OUT: c_int = 4865;
pub const SDL_EVENT_PEN_DOWN: c_int = 4866;
pub const SDL_EVENT_PEN_UP: c_int = 4867;
pub const SDL_EVENT_PEN_BUTTON_DOWN: c_int = 4868;
pub const SDL_EVENT_PEN_BUTTON_UP: c_int = 4869;
pub const SDL_EVENT_PEN_MOTION: c_int = 4870;
pub const SDL_EVENT_PEN_AXIS: c_int = 4871;
pub const SDL_EVENT_CAMERA_DEVICE_ADDED: c_int = 5120;
pub const SDL_EVENT_CAMERA_DEVICE_REMOVED: c_int = 5121;
pub const SDL_EVENT_CAMERA_DEVICE_APPROVED: c_int = 5122;
pub const SDL_EVENT_CAMERA_DEVICE_DENIED: c_int = 5123;
pub const SDL_EVENT_NOTIFICATION_ACTION_INVOKED: c_int = 5376;
pub const SDL_EVENT_RENDER_TARGETS_RESET: c_int = 8192;
pub const SDL_EVENT_RENDER_DEVICE_RESET: c_int = 8193;
pub const SDL_EVENT_RENDER_DEVICE_LOST: c_int = 8194;
pub const SDL_EVENT_POLL_SENTINEL: c_int = 32512;
pub const SDL_EVENT_USER: c_int = 32768;
pub const SDL_EVENT_LAST: c_int = 65535;
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
pub const SDL_ADDEVENT: c_int = 0;
pub const SDL_PEEKEVENT: c_int = 1;
pub const SDL_GETEVENT: c_int = 2;
pub const enum_SDL_EventAction = c_uint;
pub const SDL_EventAction = enum_SDL_EventAction;
pub const SDL_EventFilter = ?*const fn (userdata: ?*anyopaque, event: [*c]SDL_Event) callconv(.c) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_HintCallback = ?*const fn (userdata: ?*anyopaque, name: [*c]const u8, oldValue: [*c]const u8, newValue: [*c]const u8) callconv(.c) void;
pub extern fn SDL_AddHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveHintCallback_REAL(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub const SDL_InitFlags = Uint32;
pub extern fn SDL_WasInit_REAL(flags: SDL_InitFlags) SDL_InitFlags;
pub extern fn SDL_IsMainThread_REAL() bool;
pub const SDL_MainThreadCallback = ?*const fn (userdata: ?*anyopaque) callconv(.c) void;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_Log_REAL(fmt: [*c]const u8, ...) void;
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
pub const union__XEvent = extern union {
    type: c_int,
    xany: XAnyEvent,
    xkey: XKeyEvent,
    xbutton: XButtonEvent,
    xmotion: XMotionEvent,
    xcrossing: XCrossingEvent,
    xfocus: XFocusChangeEvent,
    xexpose: XExposeEvent,
    xgraphicsexpose: XGraphicsExposeEvent,
    xnoexpose: XNoExposeEvent,
    xvisibility: XVisibilityEvent,
    xcreatewindow: XCreateWindowEvent,
    xdestroywindow: XDestroyWindowEvent,
    xunmap: XUnmapEvent,
    xmap: XMapEvent,
    xmaprequest: XMapRequestEvent,
    xreparent: XReparentEvent,
    xconfigure: XConfigureEvent,
    xgravity: XGravityEvent,
    xresizerequest: XResizeRequestEvent,
    xconfigurerequest: XConfigureRequestEvent,
    xcirculate: XCirculateEvent,
    xcirculaterequest: XCirculateRequestEvent,
    xproperty: XPropertyEvent,
    xselectionclear: XSelectionClearEvent,
    xselectionrequest: XSelectionRequestEvent,
    xselection: XSelectionEvent,
    xcolormap: XColormapEvent,
    xclient: XClientMessageEvent,
    xmapping: XMappingEvent,
    xerror: XErrorEvent,
    xkeymap: XKeymapEvent,
    xgeneric: XGenericEvent,
    xcookie: XGenericEventCookie,
    pad: [24]c_long,
};
pub const XEvent = union__XEvent;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_DelayNS_REAL(ns: Uint64) void;
pub extern fn SDL_UpdateTrays_REAL() void;
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
pub extern fn SDL_ToggleDragAndDropSupport() void;
pub extern fn SDL_ReleaseAutoReleaseKeys() void;
pub extern fn SDL_UpdateCursorAnimation() void;
pub extern fn SDL_SendPendingPenProximity() void;
pub extern fn SDL_InitWindowEventWatch() void;
pub extern fn SDL_QuitWindowEventWatch() void;
pub extern fn SDL_SendPendingSignalEvents() void;
pub extern fn SDL_InitQuit() bool;
pub extern fn SDL_QuitQuit() void;
pub const struct_SDL_EventWatcher = extern struct {
    callback: SDL_EventFilter = null,
    userdata: ?*anyopaque = null,
    removed: bool = false,
};
pub const SDL_EventWatcher = struct_SDL_EventWatcher;
pub const struct_SDL_EventWatchList = extern struct {
    filter: SDL_EventWatcher = @import("std").mem.zeroes(SDL_EventWatcher),
    watchers: [*c]SDL_EventWatcher = null,
    count: c_int = 0,
    dispatching: bool = false,
    removed: bool = false,
};
pub const SDL_EventWatchList = struct_SDL_EventWatchList;
pub extern fn SDL_InitEventWatchList(list: [*c]SDL_EventWatchList) bool;
pub extern fn SDL_QuitEventWatchList(list: [*c]SDL_EventWatchList) void;
pub extern fn SDL_DispatchEventWatchList(list: [*c]SDL_EventWatchList, event: [*c]SDL_Event) bool;
pub extern fn SDL_AddEventWatchList(list: [*c]SDL_EventWatchList, filter: SDL_EventFilter, userdata: ?*anyopaque) bool;
pub extern fn SDL_RemoveEventWatchList(list: [*c]SDL_EventWatchList, filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_GetStringBoolean(value: [*c]const u8, default_value: bool) bool;
pub extern fn SDL_UpdateAudio() void;
pub extern fn SDL_UpdateCamera() void;
pub extern fn gnu_dev_major(__dev: __dev_t) c_uint;
pub extern fn gnu_dev_minor(__dev: __dev_t) c_uint;
pub extern fn SDL_UDEV_Poll() void;
pub extern fn SDL_JoysticksOpened() bool;
pub extern fn SDL_SensorsOpened() bool;
pub extern fn SDL_DBus_PumpEvents() void;
pub extern fn SDL_HasActiveTrays() bool;
pub const XID = c_ulong;
pub const Atom = c_ulong;
pub const Time = c_ulong;
pub const Window = XID;
pub const Drawable = XID;
pub const Colormap = XID;
pub const struct__XDisplay = opaque {
};
pub const Display = struct__XDisplay;
pub const XKeyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    keycode: c_uint = 0,
    same_screen: c_int = 0,
};
pub const XButtonEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    button: c_uint = 0,
    same_screen: c_int = 0,
};
pub const XMotionEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    state: c_uint = 0,
    is_hint: u8 = 0,
    same_screen: c_int = 0,
};
pub const XCrossingEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    root: Window = 0,
    subwindow: Window = 0,
    time: Time = 0,
    x: c_int = 0,
    y: c_int = 0,
    x_root: c_int = 0,
    y_root: c_int = 0,
    mode: c_int = 0,
    detail: c_int = 0,
    same_screen: c_int = 0,
    focus: c_int = 0,
    state: c_uint = 0,
};
pub const XFocusChangeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    mode: c_int = 0,
    detail: c_int = 0,
};
pub const XKeymapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    key_vector: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const XExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    count: c_int = 0,
};
pub const XGraphicsExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    drawable: Drawable = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    count: c_int = 0,
    major_code: c_int = 0,
    minor_code: c_int = 0,
};
pub const XNoExposeEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    drawable: Drawable = 0,
    major_code: c_int = 0,
    minor_code: c_int = 0,
};
pub const XVisibilityEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    state: c_int = 0,
};
pub const XCreateWindowEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    parent: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    override_redirect: c_int = 0,
};
pub const XDestroyWindowEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
};
pub const XUnmapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    from_configure: c_int = 0,
};
pub const XMapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    override_redirect: c_int = 0,
};
pub const XMapRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    parent: Window = 0,
    window: Window = 0,
};
pub const XReparentEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    parent: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    override_redirect: c_int = 0,
};
pub const XConfigureEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    above: Window = 0,
    override_redirect: c_int = 0,
};
pub const XGravityEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
};
pub const XResizeRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    width: c_int = 0,
    height: c_int = 0,
};
pub const XConfigureRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    parent: Window = 0,
    window: Window = 0,
    x: c_int = 0,
    y: c_int = 0,
    width: c_int = 0,
    height: c_int = 0,
    border_width: c_int = 0,
    above: Window = 0,
    detail: c_int = 0,
    value_mask: c_ulong = 0,
};
pub const XCirculateEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    event: Window = 0,
    window: Window = 0,
    place: c_int = 0,
};
pub const XCirculateRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    parent: Window = 0,
    window: Window = 0,
    place: c_int = 0,
};
pub const XPropertyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    atom: Atom = 0,
    time: Time = 0,
    state: c_int = 0,
};
pub const XSelectionClearEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    selection: Atom = 0,
    time: Time = 0,
};
pub const XSelectionRequestEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    owner: Window = 0,
    requestor: Window = 0,
    selection: Atom = 0,
    target: Atom = 0,
    property: Atom = 0,
    time: Time = 0,
};
pub const XSelectionEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    requestor: Window = 0,
    selection: Atom = 0,
    target: Atom = 0,
    property: Atom = 0,
    time: Time = 0,
};
pub const XColormapEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    colormap: Colormap = 0,
    new: c_int = 0,
    state: c_int = 0,
};
const union_unnamed_22 = extern union {
    b: [20]u8,
    s: [10]c_short,
    l: [5]c_long,
};
pub const XClientMessageEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    message_type: Atom = 0,
    format: c_int = 0,
    data: union_unnamed_22 = @import("std").mem.zeroes(union_unnamed_22),
};
pub const XMappingEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
    request: c_int = 0,
    first_keycode: c_int = 0,
    count: c_int = 0,
};
pub const XErrorEvent = extern struct {
    type: c_int = 0,
    display: ?*Display = null,
    resourceid: XID = 0,
    serial: c_ulong = 0,
    error_code: u8 = 0,
    request_code: u8 = 0,
    minor_code: u8 = 0,
};
pub const XAnyEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    window: Window = 0,
};
pub const XGenericEvent = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
};
pub const XGenericEventCookie = extern struct {
    type: c_int = 0,
    serial: c_ulong = 0,
    send_event: c_int = 0,
    display: ?*Display = null,
    extension: c_int = 0,
    evtype: c_int = 0,
    cookie: c_uint = 0,
    data: ?*anyopaque = null,
};
pub const struct_SDL2_version = extern struct {
    major: Uint8 = 0,
    minor: Uint8 = 0,
    patch: Uint8 = 0,
};
pub const SDL2_version = struct_SDL2_version;
pub const SDL2_SYSWM_TYPE = c_uint;
const struct_unnamed_27 = extern struct {
    event: XEvent = @import("std").mem.zeroes(XEvent),
};
const union_unnamed_26 = extern union {
    x11: struct_unnamed_27,
    dummy: c_int,
};
pub const struct_SDL2_SysWMmsg = extern struct {
    version: SDL2_version = @import("std").mem.zeroes(SDL2_version),
    subsystem: SDL2_SYSWM_TYPE = @import("std").mem.zeroes(SDL2_SYSWM_TYPE),
    msg: union_unnamed_26 = @import("std").mem.zeroes(union_unnamed_26),
};
pub const SDL2_SysWMmsg = struct_SDL2_SysWMmsg;
pub var SDL_event_watchers: SDL_EventWatchList = @import("std").mem.zeroes(SDL_EventWatchList);
pub var SDL_sentinel_pending: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub var SDL_last_event_id: Uint32 = 0;
pub const SDL_DisabledEventBlock = extern struct {
    bits: [8]Uint32 = @import("std").mem.zeroes([8]Uint32),
};
pub var SDL_disabled_events: [256][*c]SDL_DisabledEventBlock = @import("std").mem.zeroes([256][*c]SDL_DisabledEventBlock);
pub var SDL_userevents: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt);
pub const struct_SDL_TemporaryMemory = extern struct {
    memory: ?*anyopaque = null,
    prev: [*c]struct_SDL_TemporaryMemory = null,
    next: [*c]struct_SDL_TemporaryMemory = null,
};
pub const SDL_TemporaryMemory = struct_SDL_TemporaryMemory;
pub const struct_SDL_TemporaryMemoryState = extern struct {
    head: [*c]SDL_TemporaryMemory = null,
    tail: [*c]SDL_TemporaryMemory = null,
};
pub const SDL_TemporaryMemoryState = struct_SDL_TemporaryMemoryState;
pub var SDL_temporary_memory: SDL_TLSID = @import("std").mem.zeroes(SDL_TLSID);
pub const struct_SDL_EventEntry = extern struct {
    event: SDL_Event = @import("std").mem.zeroes(SDL_Event),
    memory: [*c]SDL_TemporaryMemory = null,
    prev: [*c]struct_SDL_EventEntry = null,
    next: [*c]struct_SDL_EventEntry = null,
};
pub const SDL_EventEntry = struct_SDL_EventEntry;
const struct_unnamed_28 = extern struct {
    lock: ?*SDL_Mutex = null,
    active: bool = false,
    count: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    max_events_seen: c_int = 0,
    head: [*c]SDL_EventEntry = null,
    tail: [*c]SDL_EventEntry = null,
    free: [*c]SDL_EventEntry = null,
};
pub var SDL_EventQ: struct_unnamed_28 = struct_unnamed_28{
    .lock = null,
    .active = @"false" != 0,
    .count = SDL_AtomicInt{
        .value = 0,
    },
    .max_events_seen = 0,
    .head = null,
    .tail = null,
    .free = null,
};
pub export var SDL_event_lock: ?*SDL_Mutex = null;
pub export fn SDL_CreateEventLock() void {
    @setEvalBranchQuota(100000);
    if (!(SDL_event_lock != null)) {
        SDL_event_lock = SDL_CreateMutex_REAL();
    }
}
pub export fn SDL_DestroyEventLock() void {
    @setEvalBranchQuota(100000);
    if (SDL_event_lock != null) {
        SDL_DestroyMutex_REAL(SDL_event_lock);
        SDL_event_lock = null;
    }
}
pub fn SDL_CleanupTemporaryMemory(data: ?*anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = @ptrCast(@alignCast(data));
    _ = &state;
    SDL_FreeTemporaryMemory();
    SDL_free_REAL(@ptrCast(@alignCast(state)));
}
pub fn SDL_GetTemporaryMemoryState(create: bool) callconv(.c) [*c]SDL_TemporaryMemoryState {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    state = @ptrCast(@alignCast(SDL_GetTLS_REAL(&SDL_temporary_memory)));
    if (!(state != null)) {
        if (!create) {
            return null;
        }
        state = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(state.*)))));
        if (!(state != null)) {
            return null;
        }
        if (!SDL_SetTLS_REAL(&SDL_temporary_memory, @ptrCast(@alignCast(state)), SDL_CleanupTemporaryMemory)) {
            SDL_free_REAL(@ptrCast(@alignCast(state)));
            return null;
        }
    }
    return state;
}
pub fn SDL_GetTemporaryMemoryEntry(state: [*c]SDL_TemporaryMemoryState, mem: ?*const anyopaque) callconv(.c) [*c]SDL_TemporaryMemory {
    @setEvalBranchQuota(100000);
    var entry: [*c]SDL_TemporaryMemory = undefined;
    _ = &entry;
    {
        entry = state.*.tail;
        while (entry != null) : (entry = entry.*.prev) {
            if (mem == entry.*.memory) {
                return entry;
            }
        }
    }
    return null;
}
pub fn SDL_LinkTemporaryMemoryEntry(state: [*c]SDL_TemporaryMemoryState, entry: [*c]SDL_TemporaryMemory) callconv(.c) void {
    @setEvalBranchQuota(100000);
    entry.*.prev = state.*.tail;
    entry.*.next = null;
    if (state.*.tail != null) {
        state.*.tail.*.next = entry;
    } else {
        state.*.head = entry;
    }
    state.*.tail = entry;
}
pub fn SDL_UnlinkTemporaryMemoryEntry(state: [*c]SDL_TemporaryMemoryState, entry: [*c]SDL_TemporaryMemory) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (state.*.head == entry) {
        state.*.head = entry.*.next;
    }
    if (state.*.tail == entry) {
        state.*.tail = entry.*.prev;
    }
    if (entry.*.prev != null) {
        entry.*.prev.*.next = entry.*.next;
    }
    if (entry.*.next != null) {
        entry.*.next.*.prev = entry.*.prev;
    }
    entry.*.prev = null;
    entry.*.next = null;
}
pub fn SDL_FreeTemporaryMemoryEntry(_: [*c]SDL_TemporaryMemoryState, entry: [*c]SDL_TemporaryMemory, free_data: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (free_data) {
        SDL_free_REAL(entry.*.memory);
    }
    SDL_free_REAL(@ptrCast(@alignCast(entry)));
}
pub fn SDL_LinkTemporaryMemoryToEvent(event: [*c]SDL_EventEntry, mem: ?*const anyopaque) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    var entry: [*c]SDL_TemporaryMemory = undefined;
    _ = &entry;
    state = SDL_GetTemporaryMemoryState(@"false" != 0);
    if (!(state != null)) {
        return;
    }
    entry = SDL_GetTemporaryMemoryEntry(state, mem);
    if (entry != null) {
        SDL_UnlinkTemporaryMemoryEntry(state, entry);
        entry.*.next = event.*.memory;
        event.*.memory = entry;
    }
}
pub fn SDL_TransferSysWMMemoryToEvent(event: [*c]SDL_EventEntry) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var wmmsg: [*c][*c]SDL2_SysWMmsg = @ptrCast(@alignCast((__builtin.as_c_pointer((&event.*.event.common)) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))));
    _ = &wmmsg;
    var mem: [*c]SDL2_SysWMmsg = undefined;
    mem = @ptrCast(@alignCast(SDL_AllocateTemporaryMemory(@sizeOf(@TypeOf(mem.*)))));
    _ = &mem;
    if (mem != null) {
        {
            comptime {
                if (!(@sizeOf(@TypeOf(mem.*)) == @sizeOf(@TypeOf(wmmsg.*.*)))) @compileError("static assertion failed \"sizeof (*(mem)) == sizeof (*( *wmmsg))\"");
            }
        }
        _ = memcpy(@ptrCast(@alignCast(mem)), @ptrCast(@alignCast(wmmsg.*)), @sizeOf(@TypeOf(wmmsg.*.*)));
        wmmsg.* = mem;
        SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(mem)));
    }
}
pub fn SDL_TransferTemporaryMemoryToEvent(event: [*c]SDL_EventEntry) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (event.*.event.type) {
                    @as(Uint32, SDL_EVENT_TEXT_EDITING) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_EDITING_CANDIDATES) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_INPUT) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_BEGIN) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_FILE) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_TEXT) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_COMPLETE) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_POSITION) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CLIPBOARD_UPDATE) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(Uint32, SDL2_SYSWMEVENT) => {
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
                {}
            },
            2 => {
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.edit.text)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.edit_candidates.candidates)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.text.text)));
                {
                    sdl_pc = 1;
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
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.drop.source)));
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.drop.data)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                SDL_LinkTemporaryMemoryToEvent(event, @ptrCast(@alignCast(event.*.event.clipboard.mime_types)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                SDL_TransferSysWMMemoryToEvent(event);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_TransferTemporaryMemoryFromEvent(event: [*c]SDL_EventEntry) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    var entry: [*c]SDL_TemporaryMemory = undefined;
    _ = &entry;
    var next: [*c]SDL_TemporaryMemory = undefined;
    _ = &next;
    if (!(event.*.memory != null)) {
        return;
    }
    state = SDL_GetTemporaryMemoryState(@"true" != 0);
    if (!(state != null)) {
        return;
    }
    {
        entry = event.*.memory;
        while (entry != null) : (entry = next) {
            next = entry.*.next;
            SDL_LinkTemporaryMemoryEntry(state, entry);
        }
    }
    event.*.memory = null;
}
pub fn SDL_FreeLater(memory: ?*anyopaque) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    if (memory == @as(?*anyopaque, null)) {
        return null;
    }
    state = SDL_GetTemporaryMemoryState(@"true" != 0);
    if (!(state != null)) {
        return memory;
    }
    var entry: [*c]SDL_TemporaryMemory = undefined;
    entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
    _ = &entry;
    if (!(entry != null)) {
        return memory;
    }
    entry.*.memory = memory;
    SDL_LinkTemporaryMemoryEntry(state, entry);
    return memory;
}
pub export fn SDL_AllocateTemporaryMemory(size: usize) ?*anyopaque {
    @setEvalBranchQuota(100000);
    return SDL_FreeLater(SDL_malloc_REAL(size));
}
pub export fn SDL_CreateTemporaryString(string: [*c]const u8) [*c]const u8 {
    @setEvalBranchQuota(100000);
    if (string != null) {
        return @ptrCast(@alignCast(SDL_FreeLater(@ptrCast(@alignCast(SDL_strdup_REAL(string))))));
    }
    return null;
}
pub export fn SDL_ClaimTemporaryMemory(mem: ?*const anyopaque) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    state = SDL_GetTemporaryMemoryState(@"false" != 0);
    if ((state != null) and (mem != null)) {
        var entry: [*c]SDL_TemporaryMemory = SDL_GetTemporaryMemoryEntry(state, mem);
        _ = &entry;
        if (entry != null) {
            SDL_UnlinkTemporaryMemoryEntry(state, entry);
            SDL_FreeTemporaryMemoryEntry(state, entry, @"false" != 0);
            return @ptrCast(@alignCast(@constCast(mem)));
        }
    }
    return null;
}
pub export fn SDL_FreeTemporaryMemory() void {
    @setEvalBranchQuota(100000);
    var state: [*c]SDL_TemporaryMemoryState = undefined;
    _ = &state;
    state = SDL_GetTemporaryMemoryState(@"false" != 0);
    if (!(state != null)) {
        return;
    }
    while (state.*.head != null) {
        var entry: [*c]SDL_TemporaryMemory = state.*.head;
        _ = &entry;
        SDL_UnlinkTemporaryMemoryEntry(state, entry);
        SDL_FreeTemporaryMemoryEntry(state, entry, @"true" != 0);
    }
}
pub var SDL_update_joysticks: bool = @"true" != 0;
pub fn SDL_AutoUpdateJoysticksChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_update_joysticks = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub var SDL_update_sensors: bool = @"true" != 0;
pub fn SDL_AutoUpdateSensorsChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_update_sensors = SDL_GetStringBoolean(hint, @"true" != 0);
}
pub fn SDL_PollSentinelChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_SetEventEnabled_REAL(SDL_EVENT_POLL_SENTINEL, SDL_GetStringBoolean(hint, @"true" != 0));
}
pub var SDL_EventLoggingVerbosity: c_int = 0;
pub fn SDL_EventLoggingChanged(_: ?*anyopaque, _: [*c]const u8, _: [*c]const u8, hint: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_EventLoggingVerbosity = if ((hint != null) and (@as(c_int, hint.*) != 0)) if (SDL_atoi_REAL(hint) < @as(c_int, 0)) @as(c_int, 0) else if (SDL_atoi_REAL(hint) > @as(c_int, 3)) @as(c_int, 3) else SDL_atoi_REAL(hint) else @as(c_int, 0);
}
pub export fn SDL_GetEventDescription_REAL(event: [*c]const SDL_Event, buf: [*c]u8, buflen: c_int) c_int {
    @setEvalBranchQuota(100000);
    const static_local_pen_axisnames = struct {
        var pen_axisnames: [7][*c]const u8 = [7][*c]const u8{
            "PRESSURE",
            "XTILT",
            "YTILT",
            "DISTANCE",
            "ROTATION",
            "SLIDER",
            "TANGENTIAL_PRESSURE",
        };
    };
    _ = &static_local_pen_axisnames;
    var name: [64]u8 = undefined;
    _ = &name;
    var details: [128]u8 = undefined;
    _ = &details;
    var plusstr: [16]u8 = undefined;
    _ = &plusstr;
    var retval: c_int = undefined;
    _ = &retval;
    comptime {
        if (!((@sizeOf(@TypeOf(static_local_pen_axisnames.pen_axisnames)) / @sizeOf(@TypeOf(static_local_pen_axisnames.pen_axisnames[@as(c_int, 0)]))) == @as(c_ulong, SDL_PEN_AXIS_COUNT))) @compileError("static assertion failed \"SDL_arraysize(pen_axisnames) == SDL_PEN_AXIS_COUNT\"");
    }
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(event != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return SDL_snprintf_REAL(buf, @bitCast(@as(c_long, buflen)), "(null)");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                name[@as(c_int, 0)] = '\x00';
                details[@as(c_int, 0)] = '\x00';
                if ((event.*.type >= @as(Uint32, SDL_EVENT_USER)) and (event.*.type <= @as(Uint32, SDL_EVENT_LAST))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_USER", @sizeOf(@TypeOf(name)));
                if (event.*.type > @as(Uint32, SDL_EVENT_USER)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                switch (event.*.type) {
                    @as(Uint32, SDL_EVENT_FIRST) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_QUIT) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TERMINATING) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_LOW_MEMORY) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WILL_ENTER_BACKGROUND) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DID_ENTER_BACKGROUND) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WILL_ENTER_FOREGROUND) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DID_ENTER_FOREGROUND) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_LOCALE_CHANGED) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SYSTEM_THEME_CHANGED) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEYMAP_CHANGED) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CLIPBOARD_UPDATE) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_TARGETS_RESET) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_DEVICE_RESET) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_RENDER_DEVICE_LOST) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_ORIENTATION) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_ADDED) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_REMOVED) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_MOVED) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED) => {
                        sdl_pc = 33;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_SHOWN) => {
                        sdl_pc = 34;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_HIDDEN) => {
                        sdl_pc = 35;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_EXPOSED) => {
                        sdl_pc = 36;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_MOVED) => {
                        sdl_pc = 37;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_RESIZED) => {
                        sdl_pc = 38;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED) => {
                        sdl_pc = 39;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_METAL_VIEW_RESIZED) => {
                        sdl_pc = 40;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_MINIMIZED) => {
                        sdl_pc = 41;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_MAXIMIZED) => {
                        sdl_pc = 42;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_RESTORED) => {
                        sdl_pc = 43;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_MOUSE_ENTER) => {
                        sdl_pc = 44;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_MOUSE_LEAVE) => {
                        sdl_pc = 45;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_FOCUS_GAINED) => {
                        sdl_pc = 46;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_FOCUS_LOST) => {
                        sdl_pc = 47;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_CLOSE_REQUESTED) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_HIT_TEST) => {
                        sdl_pc = 49;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_ICCPROF_CHANGED) => {
                        sdl_pc = 50;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_DISPLAY_CHANGED) => {
                        sdl_pc = 51;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED) => {
                        sdl_pc = 52;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_SAFE_AREA_CHANGED) => {
                        sdl_pc = 53;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_OCCLUDED) => {
                        sdl_pc = 54;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_ENTER_FULLSCREEN) => {
                        sdl_pc = 55;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_LEAVE_FULLSCREEN) => {
                        sdl_pc = 56;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_DESTROYED) => {
                        sdl_pc = 57;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_HDR_STATE_CHANGED) => {
                        sdl_pc = 58;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_WINDOW_SETTINGS_CHANGED) => {
                        sdl_pc = 59;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEYBOARD_ADDED) => {
                        sdl_pc = 60;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEYBOARD_REMOVED) => {
                        sdl_pc = 61;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEY_DOWN) => {
                        sdl_pc = 62;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_KEY_UP) => {
                        sdl_pc = 63;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_EDITING) => {
                        sdl_pc = 64;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_EDITING_CANDIDATES) => {
                        sdl_pc = 65;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_TEXT_INPUT) => {
                        sdl_pc = 66;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SCREEN_KEYBOARD_SHOWN) => {
                        sdl_pc = 67;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SCREEN_KEYBOARD_HIDDEN) => {
                        sdl_pc = 68;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_ADDED) => {
                        sdl_pc = 69;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_REMOVED) => {
                        sdl_pc = 70;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_MOTION) => {
                        sdl_pc = 71;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_BUTTON_DOWN) => {
                        sdl_pc = 72;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_BUTTON_UP) => {
                        sdl_pc = 73;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_MOUSE_WHEEL) => {
                        sdl_pc = 74;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_AXIS_MOTION) => {
                        sdl_pc = 75;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BALL_MOTION) => {
                        sdl_pc = 76;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_HAT_MOTION) => {
                        sdl_pc = 77;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_DOWN) => {
                        sdl_pc = 78;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BUTTON_UP) => {
                        sdl_pc = 79;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_BATTERY_UPDATED) => {
                        sdl_pc = 80;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_ADDED) => {
                        sdl_pc = 81;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_REMOVED) => {
                        sdl_pc = 82;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_JOYSTICK_UPDATE_COMPLETE) => {
                        sdl_pc = 83;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_AXIS_MOTION) => {
                        sdl_pc = 84;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_DOWN) => {
                        sdl_pc = 85;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_UP) => {
                        sdl_pc = 86;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_ADDED) => {
                        sdl_pc = 87;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_REMOVED) => {
                        sdl_pc = 88;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_REMAPPED) => {
                        sdl_pc = 89;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE) => {
                        sdl_pc = 90;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED) => {
                        sdl_pc = 91;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN) => {
                        sdl_pc = 92;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_UP) => {
                        sdl_pc = 93;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION) => {
                        sdl_pc = 94;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_SENSOR_UPDATE) => {
                        sdl_pc = 95;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH) => {
                        sdl_pc = 96;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE) => {
                        sdl_pc = 97;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_DOWN) => {
                        sdl_pc = 98;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_UP) => {
                        sdl_pc = 99;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_CANCELED) => {
                        sdl_pc = 100;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_FINGER_MOTION) => {
                        sdl_pc = 101;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_BEGIN) => {
                        sdl_pc = 102;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_UPDATE) => {
                        sdl_pc = 103;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PINCH_END) => {
                        sdl_pc = 104;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_DOWN) => {
                        sdl_pc = 105;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_UP) => {
                        sdl_pc = 106;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_PROXIMITY_IN) => {
                        sdl_pc = 107;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_PROXIMITY_OUT) => {
                        sdl_pc = 108;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_AXIS) => {
                        sdl_pc = 109;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_MOTION) => {
                        sdl_pc = 110;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_BUTTON_DOWN) => {
                        sdl_pc = 111;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_PEN_BUTTON_UP) => {
                        sdl_pc = 112;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_FILE) => {
                        sdl_pc = 113;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_TEXT) => {
                        sdl_pc = 114;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_BEGIN) => {
                        sdl_pc = 115;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_COMPLETE) => {
                        sdl_pc = 116;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_DROP_POSITION) => {
                        sdl_pc = 117;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_ADDED) => {
                        sdl_pc = 118;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_REMOVED) => {
                        sdl_pc = 119;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED) => {
                        sdl_pc = 120;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_ADDED) => {
                        sdl_pc = 121;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_REMOVED) => {
                        sdl_pc = 122;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_APPROVED) => {
                        sdl_pc = 123;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_CAMERA_DEVICE_DENIED) => {
                        sdl_pc = 124;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_NOTIFICATION_ACTION_INVOKED) => {
                        sdl_pc = 125;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_SENSOR_UPDATE) => {
                        sdl_pc = 126;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_POLL_SENTINEL) => {
                        sdl_pc = 127;
                        continue;
                    },
                    else => {
                        sdl_pc = 128;
                        continue;
                    },
                }
            },
            7 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&plusstr)), @sizeOf(@TypeOf(plusstr)), "+%u", event.*.type -% @as(c_uint, SDL_EVENT_USER));
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                plusstr[@as(c_int, 0)] = '\x00';
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), "%s (timestamp=%lu windowid=%u code=%d data1=%p data2=%p)", @as([*c]u8, @ptrCast(@alignCast(&plusstr))), event.*.user.timestamp, event.*.user.windowID, event.*.user.code, event.*.user.data1, event.*.user.data2);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                retval = 0;
                if (@as(c_int, name[@as(c_int, 0)]) != 0) {
                    sdl_pc = 135;
                    continue;
                } else {
                    sdl_pc = 136;
                    continue;
                }
            },
            11 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_FIRST", @sizeOf(@TypeOf(name)));
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&details)), " (THIS IS PROBABLY A BUG!)", @sizeOf(@TypeOf(details)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_QUIT", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu)", event.*.quit.timestamp);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_TERMINATING", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_LOW_MEMORY", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WILL_ENTER_BACKGROUND", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            16 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DID_ENTER_BACKGROUND", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            17 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WILL_ENTER_FOREGROUND", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            18 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DID_ENTER_FOREGROUND", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            19 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_LOCALE_CHANGED", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            20 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_SYSTEM_THEME_CHANGED", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            21 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_KEYMAP_CHANGED", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            22 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_CLIPBOARD_UPDATE", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            23 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_RENDER_TARGETS_RESET", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu event=%s windowid=%u)", event.*.display.timestamp, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.render.windowID);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            24 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_RENDER_DEVICE_RESET", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu event=%s windowid=%u)", event.*.display.timestamp, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.render.windowID);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            25 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_RENDER_DEVICE_LOST", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu event=%s windowid=%u)", event.*.display.timestamp, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.render.windowID);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            26 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_ORIENTATION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            27 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            28 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            29 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_MOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            30 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            31 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            32 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            33 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu display=%u event=%s data1=%d, data2=%d)", event.*.display.timestamp, event.*.display.displayID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.display.data1, event.*.display.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            34 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_SHOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            35 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_HIDDEN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            36 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_EXPOSED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            37 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_MOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            38 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_RESIZED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            39 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            40 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_METAL_VIEW_RESIZED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            41 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_MINIMIZED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            42 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_MAXIMIZED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            43 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_RESTORED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            44 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_MOUSE_ENTER", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            45 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_MOUSE_LEAVE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            46 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_FOCUS_GAINED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            47 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_FOCUS_LOST", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            48 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_CLOSE_REQUESTED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            49 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_HIT_TEST", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            50 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_ICCPROF_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            51 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_DISPLAY_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            52 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            53 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_SAFE_AREA_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            54 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_OCCLUDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            55 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_ENTER_FULLSCREEN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            56 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_LEAVE_FULLSCREEN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            57 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_DESTROYED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            58 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_HDR_STATE_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            59 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_WINDOW_SETTINGS_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u event=%s data1=%d data2=%d)", event.*.window.timestamp, event.*.window.windowID, @as([*c]u8, @ptrCast(@alignCast(&name))), event.*.window.data1, event.*.window.data2);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            60 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_KEYBOARD_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.kdevice.timestamp, event.*.kdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            61 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_KEYBOARD_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.kdevice.timestamp, event.*.kdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            62 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_KEY_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u state=%s repeat=%s scancode=%u keycode=%u mod=0x%x)", event.*.key.timestamp, event.*.key.windowID, event.*.key.which, if (event.*.key.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))), if (event.*.key.repeat) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))), event.*.key.scancode, event.*.key.key, @as(c_uint, event.*.key.mod));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            63 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_KEY_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u state=%s repeat=%s scancode=%u keycode=%u mod=0x%x)", event.*.key.timestamp, event.*.key.windowID, event.*.key.which, if (event.*.key.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))), if (event.*.key.repeat) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))), event.*.key.scancode, event.*.key.key, @as(c_uint, event.*.key.mod));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            64 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_TEXT_EDITING", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u text='%s' start=%d length=%d)", event.*.edit.timestamp, event.*.edit.windowID, event.*.edit.text, event.*.edit.start, event.*.edit.length);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            65 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_TEXT_EDITING_CANDIDATES", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u num_candidates=%d selected_candidate=%d)", event.*.edit_candidates.timestamp, event.*.edit_candidates.windowID, event.*.edit_candidates.num_candidates, event.*.edit_candidates.selected_candidate);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            66 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_TEXT_INPUT", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u text='%s')", event.*.text.timestamp, event.*.text.windowID, event.*.text.text);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            67 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_SCREEN_KEYBOARD_SHOWN", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            68 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_SCREEN_KEYBOARD_HIDDEN", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            69 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.mdevice.timestamp, event.*.mdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            70 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.mdevice.timestamp, event.*.mdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            71 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u state=%u x=%g y=%g xrel=%g yrel=%g)", event.*.motion.timestamp, event.*.motion.windowID, event.*.motion.which, event.*.motion.state, event.*.motion.x, event.*.motion.y, event.*.motion.xrel, event.*.motion.yrel);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            72 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_BUTTON_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u button=%u state=%s clicks=%u x=%g y=%g)", event.*.button.timestamp, event.*.button.windowID, event.*.button.which, @as(c_uint, event.*.button.button), if (event.*.button.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))), @as(c_uint, event.*.button.clicks), event.*.button.x, event.*.button.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            73 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_BUTTON_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u button=%u state=%s clicks=%u x=%g y=%g)", event.*.button.timestamp, event.*.button.windowID, event.*.button.which, @as(c_uint, event.*.button.button), if (event.*.button.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))), @as(c_uint, event.*.button.clicks), event.*.button.x, event.*.button.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            74 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_MOUSE_WHEEL", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u x=%g y=%g integer_x=%d integer_y=%d direction=%s)", event.*.wheel.timestamp, event.*.wheel.windowID, event.*.wheel.which, event.*.wheel.x, event.*.wheel.y, event.*.wheel.integer_x, event.*.wheel.integer_y, if (event.*.wheel.direction == @as(SDL_MouseWheelDirection, SDL_MOUSEWHEEL_NORMAL)) @as([*c]u8, @as([*c]u8, @constCast("normal"))) else @as([*c]u8, @as([*c]u8, @constCast("flipped"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            75 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_AXIS_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d axis=%u value=%d)", event.*.jaxis.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jaxis.which)))), @as(c_uint, event.*.jaxis.axis), @as(c_int, event.*.jaxis.value));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            76 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_BALL_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d ball=%u xrel=%d yrel=%d)", event.*.jball.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jball.which)))), @as(c_uint, event.*.jball.ball), @as(c_int, event.*.jball.xrel), @as(c_int, event.*.jball.yrel));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            77 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_HAT_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d hat=%u value=%u)", event.*.jhat.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jhat.which)))), @as(c_uint, event.*.jhat.hat), @as(c_uint, event.*.jhat.value));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            78 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_BUTTON_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d button=%u state=%s)", event.*.jbutton.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jbutton.which)))), @as(c_uint, event.*.jbutton.button), if (event.*.jbutton.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            79 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_BUTTON_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d button=%u state=%s)", event.*.jbutton.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jbutton.which)))), @as(c_uint, event.*.jbutton.button), if (event.*.jbutton.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            80 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_BATTERY_UPDATED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d state=%u percent=%d)", event.*.jbattery.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jbattery.which)))), event.*.jbattery.state, event.*.jbattery.percent);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            81 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.jdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            82 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.jdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            83 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_JOYSTICK_UPDATE_COMPLETE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.jdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.jdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            84 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_AXIS_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d axis=%u value=%d)", event.*.gaxis.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gaxis.which)))), @as(c_uint, event.*.gaxis.axis), @as(c_int, event.*.gaxis.value));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            85 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_BUTTON_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d button=%u state=%s)", event.*.gbutton.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gbutton.which)))), @as(c_uint, event.*.gbutton.button), if (event.*.gbutton.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            86 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_BUTTON_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d button=%u state=%s)", event.*.gbutton.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gbutton.which)))), @as(c_uint, event.*.gbutton.button), if (event.*.gbutton.down) @as([*c]u8, @as([*c]u8, @constCast("pressed"))) else @as([*c]u8, @as([*c]u8, @constCast("released"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            87 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.gdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            88 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.gdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            89 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_REMAPPED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.gdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            90 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_UPDATE_COMPLETE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.gdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            91 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d)", event.*.gdevice.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gdevice.which)))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            92 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d touchpad=%d finger=%d x=%f y=%f pressure=%f)", event.*.gtouchpad.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gtouchpad.which)))), event.*.gtouchpad.touchpad, event.*.gtouchpad.finger, event.*.gtouchpad.x, event.*.gtouchpad.y, event.*.gtouchpad.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            93 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_TOUCHPAD_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d touchpad=%d finger=%d x=%f y=%f pressure=%f)", event.*.gtouchpad.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gtouchpad.which)))), event.*.gtouchpad.touchpad, event.*.gtouchpad.finger, event.*.gtouchpad.x, event.*.gtouchpad.y, event.*.gtouchpad.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            94 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d touchpad=%d finger=%d x=%f y=%f pressure=%f)", event.*.gtouchpad.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gtouchpad.which)))), event.*.gtouchpad.touchpad, event.*.gtouchpad.finger, event.*.gtouchpad.x, event.*.gtouchpad.y, event.*.gtouchpad.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            95 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_SENSOR_UPDATE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d sensor=%d data[0]=%f data[1]=%f data[2]=%f)", event.*.gsensor.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gsensor.which)))), event.*.gsensor.sensor, event.*.gsensor.data[@as(c_int, 0)], event.*.gsensor.data[@as(c_int, 1)], event.*.gsensor.data[@as(c_int, 2)]);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            96 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d capsense=%u state=%s)", event.*.gcapsense.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gcapsense.which)))), event.*.gcapsense.capsense, if (event.*.gcapsense.down) @as([*c]u8, @as([*c]u8, @constCast("touch"))) else @as([*c]u8, @as([*c]u8, @constCast("release"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            97 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d capsense=%u state=%s)", event.*.gcapsense.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.gcapsense.which)))), event.*.gcapsense.capsense, if (event.*.gcapsense.down) @as([*c]u8, @as([*c]u8, @constCast("touch"))) else @as([*c]u8, @as([*c]u8, @constCast("release"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            98 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_FINGER_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu touchid=%lu fingerid=%lu x=%f y=%f dx=%f dy=%f pressure=%f)", event.*.tfinger.timestamp, event.*.tfinger.touchID, event.*.tfinger.fingerID, event.*.tfinger.x, event.*.tfinger.y, event.*.tfinger.dx, event.*.tfinger.dy, event.*.tfinger.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            99 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_FINGER_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu touchid=%lu fingerid=%lu x=%f y=%f dx=%f dy=%f pressure=%f)", event.*.tfinger.timestamp, event.*.tfinger.touchID, event.*.tfinger.fingerID, event.*.tfinger.x, event.*.tfinger.y, event.*.tfinger.dx, event.*.tfinger.dy, event.*.tfinger.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            100 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_FINGER_CANCELED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu touchid=%lu fingerid=%lu x=%f y=%f dx=%f dy=%f pressure=%f)", event.*.tfinger.timestamp, event.*.tfinger.touchID, event.*.tfinger.fingerID, event.*.tfinger.x, event.*.tfinger.y, event.*.tfinger.dx, event.*.tfinger.dy, event.*.tfinger.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            101 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_FINGER_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu touchid=%lu fingerid=%lu x=%f y=%f dx=%f dy=%f pressure=%f)", event.*.tfinger.timestamp, event.*.tfinger.touchID, event.*.tfinger.fingerID, event.*.tfinger.x, event.*.tfinger.y, event.*.tfinger.dx, event.*.tfinger.dy, event.*.tfinger.pressure);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            102 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PINCH_BEGIN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu scale=%f)", event.*.pinch.timestamp, event.*.pinch.scale);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            103 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PINCH_UPDATE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu scale=%f)", event.*.pinch.timestamp, event.*.pinch.scale);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            104 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PINCH_END", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu scale=%f)", event.*.pinch.timestamp, event.*.pinch.scale);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            105 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g eraser=%s state=%s)", event.*.ptouch.timestamp, event.*.ptouch.windowID, event.*.ptouch.which, event.*.ptouch.pen_state, event.*.ptouch.x, event.*.ptouch.y, if (event.*.ptouch.eraser) @as([*c]u8, @as([*c]u8, @constCast("yes"))) else @as([*c]u8, @as([*c]u8, @constCast("no"))), if (event.*.ptouch.down) @as([*c]u8, @as([*c]u8, @constCast("down"))) else @as([*c]u8, @as([*c]u8, @constCast("up"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            106 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g eraser=%s state=%s)", event.*.ptouch.timestamp, event.*.ptouch.windowID, event.*.ptouch.which, event.*.ptouch.pen_state, event.*.ptouch.x, event.*.ptouch.y, if (event.*.ptouch.eraser) @as([*c]u8, @as([*c]u8, @constCast("yes"))) else @as([*c]u8, @as([*c]u8, @constCast("no"))), if (event.*.ptouch.down) @as([*c]u8, @as([*c]u8, @constCast("down"))) else @as([*c]u8, @as([*c]u8, @constCast("up"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            107 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_PROXIMITY_IN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u)", event.*.pproximity.timestamp, event.*.pproximity.windowID, event.*.pproximity.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            108 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_PROXIMITY_OUT", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u)", event.*.pproximity.timestamp, event.*.pproximity.windowID, event.*.pproximity.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            109 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_AXIS", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g axis=%s value=%g)", event.*.paxis.timestamp, event.*.paxis.windowID, event.*.paxis.which, event.*.paxis.pen_state, event.*.paxis.x, event.*.paxis.y, if ((@as(c_int, @bitCast(event.*.paxis.axis)) >= @as(c_int, 0)) and (@as(c_ulong, event.*.paxis.axis) < (@sizeOf(@TypeOf(static_local_pen_axisnames.pen_axisnames)) / @sizeOf(@TypeOf(static_local_pen_axisnames.pen_axisnames[@as(c_int, 0)]))))) static_local_pen_axisnames.pen_axisnames[event.*.paxis.axis] else @as([*c]const u8, @ptrCast(@alignCast(@as([*c]u8, @as([*c]u8, @constCast("[UNKNOWN]")))))), event.*.paxis.value);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            110 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_MOTION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g)", event.*.pmotion.timestamp, event.*.pmotion.windowID, event.*.pmotion.which, event.*.pmotion.pen_state, event.*.pmotion.x, event.*.pmotion.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            111 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_BUTTON_DOWN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g button=%u state=%s)", event.*.pbutton.timestamp, event.*.pbutton.windowID, event.*.pbutton.which, event.*.pbutton.pen_state, event.*.pbutton.x, event.*.pbutton.y, @as(c_uint, event.*.pbutton.button), if (event.*.pbutton.down) @as([*c]u8, @as([*c]u8, @constCast("down"))) else @as([*c]u8, @as([*c]u8, @constCast("up"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            112 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_PEN_BUTTON_UP", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu windowid=%u which=%u pen_state=%u x=%g y=%g button=%u state=%s)", event.*.pbutton.timestamp, event.*.pbutton.windowID, event.*.pbutton.which, event.*.pbutton.pen_state, event.*.pbutton.x, event.*.pbutton.y, @as(c_uint, event.*.pbutton.button), if (event.*.pbutton.down) @as([*c]u8, @as([*c]u8, @constCast("down"))) else @as([*c]u8, @as([*c]u8, @constCast("up"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            113 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DROP_FILE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (data='%s' timestamp=%lu windowid=%u x=%f y=%f)", event.*.drop.data, event.*.drop.timestamp, event.*.drop.windowID, event.*.drop.x, event.*.drop.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            114 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DROP_TEXT", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (data='%s' timestamp=%lu windowid=%u x=%f y=%f)", event.*.drop.data, event.*.drop.timestamp, event.*.drop.windowID, event.*.drop.x, event.*.drop.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            115 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DROP_BEGIN", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (data='%s' timestamp=%lu windowid=%u x=%f y=%f)", event.*.drop.data, event.*.drop.timestamp, event.*.drop.windowID, event.*.drop.x, event.*.drop.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            116 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DROP_COMPLETE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (data='%s' timestamp=%lu windowid=%u x=%f y=%f)", event.*.drop.data, event.*.drop.timestamp, event.*.drop.windowID, event.*.drop.x, event.*.drop.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            117 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_DROP_POSITION", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (data='%s' timestamp=%lu windowid=%u x=%f y=%f)", event.*.drop.data, event.*.drop.timestamp, event.*.drop.windowID, event.*.drop.x, event.*.drop.y);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            118 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_AUDIO_DEVICE_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u recording=%s)", event.*.adevice.timestamp, event.*.adevice.which, if (event.*.adevice.recording) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            119 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_AUDIO_DEVICE_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u recording=%s)", event.*.adevice.timestamp, event.*.adevice.which, if (event.*.adevice.recording) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            120 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u recording=%s)", event.*.adevice.timestamp, event.*.adevice.which, if (event.*.adevice.recording) @as([*c]u8, @as([*c]u8, @constCast("true"))) else @as([*c]u8, @as([*c]u8, @constCast("false"))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            121 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_CAMERA_DEVICE_ADDED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.cdevice.timestamp, event.*.cdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            122 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_CAMERA_DEVICE_REMOVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.cdevice.timestamp, event.*.cdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            123 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_CAMERA_DEVICE_APPROVED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.cdevice.timestamp, event.*.cdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            124 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_CAMERA_DEVICE_DENIED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%u)", event.*.cdevice.timestamp, event.*.cdevice.which);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            125 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_NOTIFICATION_ACTION_INVOKED", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d button_id='%s')", event.*.notification.timestamp, event.*.notification.which, event.*.notification.action_id);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            126 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "SDL_EVENT_SENSOR_UPDATE", @sizeOf(@TypeOf(name)));
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " (timestamp=%lu which=%d data[0]=%f data[1]=%f data[2]=%f data[3]=%f data[4]=%f data[5]=%f)", event.*.sensor.timestamp, @as(c_int, @bitCast(@as(c_uint, @truncate(event.*.sensor.which)))), event.*.sensor.data[@as(c_int, 0)], event.*.sensor.data[@as(c_int, 1)], event.*.sensor.data[@as(c_int, 2)], event.*.sensor.data[@as(c_int, 3)], event.*.sensor.data[@as(c_int, 4)], event.*.sensor.data[@as(c_int, 5)]);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            127 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            128 => {
                if (!(@as(c_int, name[@as(c_int, 0)]) != 0)) {
                    sdl_pc = 129;
                    continue;
                } else {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                if (event.*.type >= @as(Uint32, SDL_EVENT_USER)) {
                    sdl_pc = 132;
                    continue;
                } else {
                    sdl_pc = 133;
                    continue;
                }
            },
            130 => {
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            131 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            132 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "USER", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            133 => {
                _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&name)), "UNKNOWN", @sizeOf(@TypeOf(name)));
                {
                    sdl_pc = 134;
                    continue;
                }
            },
            134 => {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&details)), @sizeOf(@TypeOf(details)), " 0x%x", event.*.type);
                {
                    sdl_pc = 131;
                    continue;
                }
            },
            135 => {
                retval = SDL_snprintf_REAL(buf, @bitCast(@as(c_long, buflen)), "%s%s", @as([*c]u8, @ptrCast(@alignCast(&name))), @as([*c]u8, @ptrCast(@alignCast(&details))));
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            136 => {
                if ((buf != null) and (buflen > @as(c_int, 0))) {
                    sdl_pc = 138;
                    continue;
                } else {
                    sdl_pc = 139;
                    continue;
                }
            },
            137 => {
                return retval;
            },
            138 => {
                buf.* = '\x00';
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            139 => {
                {
                    sdl_pc = 140;
                    continue;
                }
            },
            140 => {
                {
                    sdl_pc = 137;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_LogEvent(event: [*c]const SDL_Event) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SDL_LogEvent".*;
    };
    _ = &static_local___func__;
    if (!(event != null)) {
        return;
    }
    if ((SDL_EventLoggingVerbosity < @as(c_int, 2)) and ((((((((((((event.*.type == @as(Uint32, SDL_EVENT_MOUSE_MOTION)) or (event.*.type == @as(Uint32, SDL_EVENT_FINGER_MOTION))) or (event.*.type == @as(Uint32, SDL_EVENT_PEN_AXIS))) or (event.*.type == @as(Uint32, SDL_EVENT_PEN_MOTION))) or (event.*.type == @as(Uint32, SDL_EVENT_PINCH_UPDATE))) or (event.*.type == @as(Uint32, SDL_EVENT_GAMEPAD_AXIS_MOTION))) or (event.*.type == @as(Uint32, SDL_EVENT_GAMEPAD_SENSOR_UPDATE))) or (event.*.type == @as(Uint32, SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION))) or (event.*.type == @as(Uint32, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE))) or (event.*.type == @as(Uint32, SDL_EVENT_JOYSTICK_AXIS_MOTION))) or (event.*.type == @as(Uint32, SDL_EVENT_JOYSTICK_UPDATE_COMPLETE))) or (event.*.type == @as(Uint32, SDL_EVENT_SENSOR_UPDATE)))) {
        return;
    }
    var buf: [256]u8 = undefined;
    _ = &buf;
    const rc: c_int = SDL_GetEventDescription_REAL(event, @ptrCast(@alignCast(&buf)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buf))))));
    _ = &rc;
    while (true) {
        while (!(@as(c_ulong, @bitCast(@as(c_long, rc))) < @sizeOf(@TypeOf(buf)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "rc < sizeof (buf)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 979);
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
    if (@as(c_int, buf[@as(c_int, 0)]) != 0) {
        SDL_Log_REAL("SDL EVENT: %s", @as([*c]u8, @ptrCast(@alignCast(&buf))));
    }
}
pub export fn SDL_StopEventLoop() void {
    @setEvalBranchQuota(100000);
    var report: [*c]const u8 = SDL_GetHint_REAL("SDL_EVENT_QUEUE_STATISTICS");
    _ = &report;
    var i: c_int = undefined;
    _ = &i;
    var entry: [*c]SDL_EventEntry = undefined;
    _ = &entry;
    var lock: ?*SDL_Mutex = SDL_EventQ.lock;
    _ = &lock;
    SDL_LockMutex_REAL(lock);
    SDL_EventQ.active = @"false" != 0;
    if ((report != null) and (SDL_atoi_REAL(report) != 0)) {
        SDL_Log_REAL("SDL EVENT QUEUE: Maximum events in-flight: %d", SDL_EventQ.max_events_seen);
    }
    {
        entry = SDL_EventQ.head;
        while (entry != null) {
            var next: [*c]SDL_EventEntry = entry.*.next;
            _ = &next;
            SDL_TransferTemporaryMemoryFromEvent(entry);
            SDL_free_REAL(@ptrCast(@alignCast(entry)));
            entry = next;
        }
    }
    {
        entry = SDL_EventQ.free;
        while (entry != null) {
            var next: [*c]SDL_EventEntry = entry.*.next;
            _ = &next;
            SDL_free_REAL(@ptrCast(@alignCast(entry)));
            entry = next;
        }
    }
    _ = SDL_SetAtomicInt_REAL(&SDL_EventQ.count, 0);
    SDL_EventQ.max_events_seen = 0;
    SDL_EventQ.head = null;
    SDL_EventQ.tail = null;
    SDL_EventQ.free = null;
    _ = SDL_SetAtomicInt_REAL(&SDL_sentinel_pending, 0);
    {
        i = 0;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(SDL_disabled_events)) / @sizeOf(@TypeOf(SDL_disabled_events[@as(c_int, 0)])))) : (i += 1) {
            SDL_free_REAL(@ptrCast(@alignCast(SDL_disabled_events[@bitCast(@as(isize, @intCast(i)))])));
            SDL_disabled_events[@bitCast(@as(isize, @intCast(i)))] = null;
        }
    }
    SDL_QuitEventWatchList(&SDL_event_watchers);
    SDL_QuitWindowEventWatch();
    SDL_EventQ.lock = null;
    SDL_UnlockMutex_REAL(lock);
    SDL_DestroyMutex_REAL(lock);
}
pub export fn SDL_StartEventLoop() bool {
    @setEvalBranchQuota(100000);
    if (!(SDL_EventQ.lock != null)) {
        SDL_EventQ.lock = SDL_CreateMutex_REAL();
        if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_EventQ.lock))) == @as(?*anyopaque, null)) {
            return @"false" != 0;
        }
    }
    SDL_LockMutex_REAL(SDL_EventQ.lock);
    if (!SDL_InitEventWatchList(&SDL_event_watchers)) {
        SDL_UnlockMutex_REAL(SDL_EventQ.lock);
        return @"false" != 0;
    }
    SDL_InitWindowEventWatch();
    SDL_EventQ.active = @"true" != 0;
    SDL_UnlockMutex_REAL(SDL_EventQ.lock);
    return @"true" != 0;
}
pub fn SDL_AddEvent(event: [*c]SDL_Event) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SDL_AddEvent".*;
    };
    _ = &static_local___func__;
    var entry: [*c]SDL_EventEntry = undefined;
    _ = &entry;
    const initial_count: c_int = SDL_GetAtomicInt_REAL(&SDL_EventQ.count);
    _ = &initial_count;
    var final_count: c_int = undefined;
    _ = &final_count;
    if (initial_count >= SDL_MAX_QUEUED_EVENTS) {
        _ = SDL_SetError_REAL("Event queue is full (%d events)", initial_count);
        return 0;
    }
    if (@as(?*anyopaque, @ptrCast(@alignCast(SDL_EventQ.free))) == @as(?*anyopaque, null)) {
        entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
        if (@as(?*anyopaque, @ptrCast(@alignCast(entry))) == @as(?*anyopaque, null)) {
            return 0;
        }
    } else {
        entry = SDL_EventQ.free;
        SDL_EventQ.free = entry.*.next;
    }
    if (SDL_EventLoggingVerbosity > @as(c_int, 0)) {
        SDL_LogEvent(event);
    }
    {
        comptime {
            if (!(@sizeOf(@TypeOf((&entry.*.event).*)) == @sizeOf(@TypeOf(event.*)))) @compileError("static assertion failed \"sizeof (*(&entry->event)) == sizeof (*( event))\"");
        }
    }
    _ = memcpy(@ptrCast(@alignCast(&entry.*.event)), @ptrCast(@alignCast(event)), @sizeOf(@TypeOf(event.*)));
    if (event.*.type == @as(Uint32, SDL_EVENT_POLL_SENTINEL)) {
        _ = SDL_AddAtomicInt_REAL(&SDL_sentinel_pending, 1);
    }
    entry.*.memory = null;
    SDL_TransferTemporaryMemoryToEvent(entry);
    if (SDL_EventQ.tail != null) {
        SDL_EventQ.tail.*.next = entry;
        entry.*.prev = SDL_EventQ.tail;
        SDL_EventQ.tail = entry;
        entry.*.next = null;
    } else {
        while (true) {
            while (!!(SDL_EventQ.head != null)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "!SDL_EventQ.head",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1110);
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
        SDL_EventQ.head = entry;
        SDL_EventQ.tail = entry;
        entry.*.prev = null;
        entry.*.next = null;
    }
    final_count = SDL_AddAtomicInt_REAL(&SDL_EventQ.count, 1) + @as(c_int, 1);
    if (final_count > SDL_EventQ.max_events_seen) {
        SDL_EventQ.max_events_seen = final_count;
    }
    SDL_last_event_id +%= 1;
    return 1;
}
pub fn SDL_CutEvent(entry: [*c]SDL_EventEntry) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [12:0]u8 = "SDL_CutEvent".*;
    };
    _ = &static_local___func__;
    SDL_TransferTemporaryMemoryFromEvent(entry);
    if (entry.*.prev != null) {
        entry.*.prev.*.next = entry.*.next;
    }
    if (entry.*.next != null) {
        entry.*.next.*.prev = entry.*.prev;
    }
    if (entry == SDL_EventQ.head) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(entry.*.prev))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "entry->prev == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1140);
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
        SDL_EventQ.head = entry.*.next;
    }
    if (entry == SDL_EventQ.tail) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(entry.*.next))) == @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "entry->next == ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1144);
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
        SDL_EventQ.tail = entry.*.prev;
    }
    if (entry.*.event.type == @as(Uint32, SDL_EVENT_POLL_SENTINEL)) {
        _ = SDL_AddAtomicInt_REAL(&SDL_sentinel_pending, -@as(c_int, 1));
    }
    entry.*.next = SDL_EventQ.free;
    SDL_EventQ.free = entry;
    while (true) {
        while (!(SDL_GetAtomicInt_REAL(&SDL_EventQ.count) > @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_GetAtomicInt_REAL(&SDL_EventQ.count) > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1154);
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
    _ = SDL_AddAtomicInt_REAL(&SDL_EventQ.count, -@as(c_int, 1));
}
pub fn SDL_SendWakeupEvent() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if ((@as(?*anyopaque, @ptrCast(@alignCast(_this))) == @as(?*anyopaque, null)) or !(_this.*.SendWakeupEvent != null)) {
        return;
    }
    var wakeup_window: [*c]SDL_Window = @ptrCast(@alignCast(SDL_SetAtomicPointer_REAL(&_this.*.wakeup_window, null)));
    _ = &wakeup_window;
    if (wakeup_window != null) {
        _this.*.SendWakeupEvent.?(_this, wakeup_window);
    }
}
pub fn SDL_PeepEventsInternal(events: [*c]SDL_Event, numevents: c_int, action: SDL_EventAction, arg_minType: Uint32, maxType: Uint32, include_sentinel: bool) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var minType = arg_minType;
    _ = &minType;
    var i: c_int = undefined;
    _ = &i;
    var used: c_int = undefined;
    _ = &used;
    var sentinels_expected: c_int = 0;
    _ = &sentinels_expected;
    used = 0;
    SDL_LockMutex_REAL(SDL_EventQ.lock);
    {
        if (!SDL_EventQ.active) {
            if (action == @as(SDL_EventAction, SDL_GETEVENT)) {
                _ = SDL_SetError_REAL("The event system has been shut down");
            }
            SDL_UnlockMutex_REAL(SDL_EventQ.lock);
            return -@as(c_int, 1);
        }
        if (action == @as(SDL_EventAction, SDL_ADDEVENT)) {
            if (!(events != null)) {
                SDL_UnlockMutex_REAL(SDL_EventQ.lock);
                _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("events"))));
                return -@as(c_int, 1);
            }
            {
                i = 0;
                while (i < numevents) : (i += 1) {
                    used += SDL_AddEvent(&events[@bitCast(@as(isize, @intCast(i)))]);
                }
            }
        } else {
            var entry: [*c]SDL_EventEntry = undefined;
            _ = &entry;
            var next: [*c]SDL_EventEntry = undefined;
            _ = &next;
            var @"type": Uint32 = undefined;
            _ = &@"type";
            {
                entry = SDL_EventQ.head;
                while ((entry != null) and ((@as(?*anyopaque, @ptrCast(@alignCast(events))) == @as(?*anyopaque, null)) or (used < numevents))) : (entry = next) {
                    next = entry.*.next;
                    @"type" = entry.*.event.type;
                    if ((minType <= @"type") and (@"type" <= maxType)) {
                        if (events != null) {
                            {
                                comptime {
                                    if (!(@sizeOf(@TypeOf((&events[@bitCast(@as(isize, @intCast(used)))]).*)) == @sizeOf(@TypeOf((&entry.*.event).*)))) @compileError("static assertion failed \"sizeof (*(&events[used])) == sizeof (*( &entry->event))\"");
                                }
                            }
                            _ = memcpy(@ptrCast(@alignCast(&events[@bitCast(@as(isize, @intCast(used)))])), @ptrCast(@alignCast(&entry.*.event)), @sizeOf(@TypeOf((&entry.*.event).*)));
                            if (action == @as(SDL_EventAction, SDL_GETEVENT)) {
                                SDL_CutEvent(entry);
                            }
                        }
                        if (@"type" == @as(Uint32, SDL_EVENT_POLL_SENTINEL)) {
                            if (!include_sentinel) {
                                continue;
                            }
                            if ((@as(?*anyopaque, @ptrCast(@alignCast(events))) == @as(?*anyopaque, null)) or (action != @as(SDL_EventAction, SDL_GETEVENT))) {
                                sentinels_expected += 1;
                            }
                            if (SDL_GetAtomicInt_REAL(&SDL_sentinel_pending) > sentinels_expected) {
                                continue;
                            }
                        }
                        used += 1;
                    }
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_EventQ.lock);
    if ((used > @as(c_int, 0)) and (action == @as(SDL_EventAction, SDL_ADDEVENT))) {
        SDL_SendWakeupEvent();
    }
    return used;
}
pub export fn SDL_PeepEvents_REAL(events: [*c]SDL_Event, numevents: c_int, action: SDL_EventAction, minType: Uint32, maxType: Uint32) c_int {
    @setEvalBranchQuota(100000);
    return SDL_PeepEventsInternal(events, numevents, action, minType, maxType, @"false" != 0);
}
pub export fn SDL_HasEvent_REAL(arg_type: Uint32) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    return SDL_HasEvents_REAL(@"type", @"type");
}
pub export fn SDL_HasEvents_REAL(arg_minType: Uint32, maxType: Uint32) bool {
    @setEvalBranchQuota(100000);
    var minType = arg_minType;
    _ = &minType;
    var found: bool = @"false" != 0;
    _ = &found;
    SDL_LockMutex_REAL(SDL_EventQ.lock);
    {
        if (SDL_EventQ.active) {
            {
                var entry: [*c]SDL_EventEntry = SDL_EventQ.head;
                _ = &entry;
                while (entry != null) : (entry = entry.*.next) {
                    const @"type": Uint32 = entry.*.event.type;
                    _ = &@"type";
                    if ((minType <= @"type") and (@"type" <= maxType)) {
                        found = @"true" != 0;
                        break;
                    }
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_EventQ.lock);
    return found;
}
pub export fn SDL_FlushEvent_REAL(arg_type: Uint32) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    SDL_FlushEvents_REAL(@"type", @"type");
}
pub export fn SDL_FlushEvents_REAL(arg_minType: Uint32, maxType: Uint32) void {
    @setEvalBranchQuota(100000);
    var minType = arg_minType;
    _ = &minType;
    var entry: [*c]SDL_EventEntry = undefined;
    _ = &entry;
    var next: [*c]SDL_EventEntry = undefined;
    _ = &next;
    var @"type": Uint32 = undefined;
    _ = &@"type";
    SDL_LockMutex_REAL(SDL_EventQ.lock);
    {
        if (!SDL_EventQ.active) {
            SDL_UnlockMutex_REAL(SDL_EventQ.lock);
            return;
        }
        {
            entry = SDL_EventQ.head;
            while (entry != null) : (entry = next) {
                next = entry.*.next;
                @"type" = entry.*.event.type;
                if ((minType <= @"type") and (@"type" <= maxType)) {
                    SDL_CutEvent(entry);
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_EventQ.lock);
}
pub const SDL_MAIN_CALLBACK_WAITING: c_int = 0;
pub const SDL_MAIN_CALLBACK_COMPLETE: c_int = 1;
pub const SDL_MAIN_CALLBACK_CANCELED: c_int = 2;
pub const struct_SDL_MainThreadCallbackEntry = extern struct {
    callback: SDL_MainThreadCallback = null,
    userdata: ?*anyopaque = null,
    state: SDL_AtomicInt = @import("std").mem.zeroes(SDL_AtomicInt),
    semaphore: ?*SDL_Semaphore = null,
    next: [*c]struct_SDL_MainThreadCallbackEntry = null,
};
pub const SDL_MainThreadCallbackEntry = struct_SDL_MainThreadCallbackEntry;
pub var SDL_main_callbacks_lock: ?*SDL_Mutex = null;
pub var SDL_main_callbacks_head: [*c]SDL_MainThreadCallbackEntry = null;
pub var SDL_main_callbacks_tail: [*c]SDL_MainThreadCallbackEntry = null;
pub fn SDL_CreateMainThreadCallback(callback: SDL_MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) callconv(.c) [*c]SDL_MainThreadCallbackEntry {
    @setEvalBranchQuota(100000);
    var entry: [*c]SDL_MainThreadCallbackEntry = undefined;
    entry = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(entry.*)))));
    _ = &entry;
    if (!(entry != null)) {
        return null;
    }
    entry.*.callback = callback;
    entry.*.userdata = userdata;
    _ = SDL_SetAtomicInt_REAL(&entry.*.state, SDL_MAIN_CALLBACK_WAITING);
    if (wait_complete) {
        entry.*.semaphore = SDL_CreateSemaphore_REAL(0);
        if (!(entry.*.semaphore != null)) {
            SDL_free_REAL(@ptrCast(@alignCast(entry)));
            return null;
        }
    } else {
        entry.*.semaphore = null;
    }
    entry.*.next = null;
    return entry;
}
pub fn SDL_DestroyMainThreadCallback(entry: [*c]SDL_MainThreadCallbackEntry) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (entry.*.semaphore != null) {
        SDL_DestroySemaphore_REAL(entry.*.semaphore);
    }
    SDL_free_REAL(@ptrCast(@alignCast(entry)));
}
pub fn SDL_InitMainThreadCallbacks() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [27:0]u8 = "SDL_InitMainThreadCallbacks".*;
    };
    _ = &static_local___func__;
    SDL_main_callbacks_lock = SDL_CreateMutex_REAL();
    while (true) {
        while (!((@as(?*anyopaque, @ptrCast(@alignCast(SDL_main_callbacks_head))) == @as(?*anyopaque, null)) and (@as(?*anyopaque, @ptrCast(@alignCast(SDL_main_callbacks_tail))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_main_callbacks_head == ((void*)0) && SDL_main_callbacks_tail == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1371);
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
}
pub fn SDL_QuitMainThreadCallbacks() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var entry: [*c]SDL_MainThreadCallbackEntry = undefined;
    _ = &entry;
    SDL_LockMutex_REAL(SDL_main_callbacks_lock);
    {
        entry = SDL_main_callbacks_head;
        SDL_main_callbacks_head = null;
        SDL_main_callbacks_tail = null;
    }
    SDL_UnlockMutex_REAL(SDL_main_callbacks_lock);
    while (entry != null) {
        var next: [*c]SDL_MainThreadCallbackEntry = entry.*.next;
        _ = &next;
        if (entry.*.semaphore != null) {
            _ = SDL_SetAtomicInt_REAL(&entry.*.state, SDL_MAIN_CALLBACK_CANCELED);
            SDL_SignalSemaphore_REAL(entry.*.semaphore);
        } else {
            SDL_DestroyMainThreadCallback(entry);
        }
        entry = next;
    }
    SDL_DestroyMutex_REAL(SDL_main_callbacks_lock);
    SDL_main_callbacks_lock = null;
}
pub fn SDL_RunMainThreadCallbacks() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var entry: [*c]SDL_MainThreadCallbackEntry = undefined;
    _ = &entry;
    SDL_LockMutex_REAL(SDL_main_callbacks_lock);
    {
        entry = SDL_main_callbacks_head;
        SDL_main_callbacks_head = null;
        SDL_main_callbacks_tail = null;
    }
    SDL_UnlockMutex_REAL(SDL_main_callbacks_lock);
    while (entry != null) {
        var next: [*c]SDL_MainThreadCallbackEntry = entry.*.next;
        _ = &next;
        entry.*.callback.?(entry.*.userdata);
        if (entry.*.semaphore != null) {
            _ = SDL_SetAtomicInt_REAL(&entry.*.state, SDL_MAIN_CALLBACK_COMPLETE);
            SDL_SignalSemaphore_REAL(entry.*.semaphore);
        } else {
            SDL_DestroyMainThreadCallback(entry);
        }
        entry = next;
    }
}
pub export fn SDL_RunOnMainThread_REAL(callback: SDL_MainThreadCallback, userdata: ?*anyopaque, wait_complete: bool) bool {
    @setEvalBranchQuota(100000);
    var entry: [*c]SDL_MainThreadCallbackEntry = undefined;
    _ = &entry;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_IsMainThread_REAL() or !(SDL_WasInit_REAL(SDL_INIT_EVENTS) != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                callback.?(userdata);
                return @"true" != 0;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                entry = SDL_CreateMainThreadCallback(callback, userdata, wait_complete);
                if (!(entry != null)) {
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
                SDL_LockMutex_REAL(SDL_main_callbacks_lock);
                if (SDL_main_callbacks_tail != null) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            7 => {
                SDL_main_callbacks_tail.*.next = entry;
                SDL_main_callbacks_tail = entry;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                SDL_main_callbacks_head = entry;
                SDL_main_callbacks_tail = entry;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                SDL_UnlockMutex_REAL(SDL_main_callbacks_lock);
                SDL_SendWakeupEvent();
                if (!wait_complete) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return @"true" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                SDL_WaitSemaphore_REAL(entry.*.semaphore);
                switch (SDL_GetAtomicInt_REAL(&entry.*.state)) {
                    SDL_MAIN_CALLBACK_COMPLETE => {
                        sdl_pc = 14;
                        continue;
                    },
                    SDL_MAIN_CALLBACK_CANCELED => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            13 => {
                return undefined;
            },
            14 => {
                SDL_DestroyMainThreadCallback(entry);
                return @"true" != 0;
            },
            15 => {
                SDL_DestroyMainThreadCallback(entry);
                return SDL_SetError_REAL("Callback canceled");
            },
            16 => {
                return SDL_SetError_REAL("Callback timed out");
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_PumpEventMaintenance() void {
    @setEvalBranchQuota(100000);
    SDL_UDEV_Poll();
    SDL_UpdateAudio();
    SDL_UpdateCamera();
    if (SDL_update_sensors) {
        SDL_UpdateSensors_REAL();
    }
    if (SDL_update_joysticks) {
        SDL_UpdateJoysticks_REAL();
    }
    SDL_SendPendingPenProximity();
    SDL_UpdateCursorAnimation();
    SDL_UpdateTrays_REAL();
    SDL_SendPendingSignalEvents();
}
pub fn SDL_PumpEventsInternal(push_sentinel: bool) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_PumpEventsInternal".*;
    };
    _ = &static_local___func__;
    while (true) {
        while (!SDL_IsMainThread_REAL()) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "SDL_IsMainThread_REAL()",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1529);
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
    SDL_FreeTemporaryMemory();
    SDL_ReleaseAutoReleaseKeys();
    SDL_RunMainThreadCallbacks();
    SDL_DBus_PumpEvents();
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (_this != null) {
        _this.*.PumpEvents.?(_this);
    }
    SDL_PumpEventMaintenance();
    if (push_sentinel and SDL_EventEnabled_REAL(SDL_EVENT_POLL_SENTINEL)) {
        var sentinel: SDL_Event = undefined;
        _ = &sentinel;
        if (SDL_GetAtomicInt_REAL(&SDL_sentinel_pending) > @as(c_int, 0)) {
            _ = SDL_PeepEventsInternal(&sentinel, 1, SDL_GETEVENT, SDL_EVENT_POLL_SENTINEL, SDL_EVENT_POLL_SENTINEL, @"true" != 0);
        }
        sentinel.type = SDL_EVENT_POLL_SENTINEL;
        sentinel.common.timestamp = 0;
        _ = SDL_PushEvent_REAL(&sentinel);
    }
}
pub export fn SDL_PumpEvents_REAL() void {
    @setEvalBranchQuota(100000);
    SDL_PumpEventsInternal(@"false" != 0);
}
pub export fn SDL_PollEvent_REAL(event: [*c]SDL_Event) bool {
    @setEvalBranchQuota(100000);
    return SDL_WaitEventTimeoutNS(event, 0);
}
pub fn SDL_events_get_polling_interval() callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    var poll_intervalNS: Sint64 = 9223372036854775807;
    _ = &poll_intervalNS;
    if ((SDL_WasInit_REAL(SDL_INIT_JOYSTICK) != 0) and (@as(SDL_InitFlags, @bitCast(@as(c_int, @as(c_int, @intFromBool(SDL_update_joysticks))))) != 0)) {
        if (SDL_JoysticksOpened()) {
            poll_intervalNS = @bitCast(@as(c_ulong, @truncate(if (@as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) < (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 1)))) *% @as(Uint64, SDL_NS_PER_MS))) @as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) else @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1)))) *% @as(Uint64, SDL_NS_PER_MS))));
        } else {
            poll_intervalNS = @truncate(if (@as(c_longlong, poll_intervalNS) < (@as(c_longlong, 3) * SDL_NS_PER_SECOND)) @as(c_longlong, poll_intervalNS) else @as(c_longlong, 3) * SDL_NS_PER_SECOND);
        }
    }
    if (((SDL_WasInit_REAL(SDL_INIT_SENSOR) != 0) and (@as(SDL_InitFlags, @bitCast(@as(c_int, @as(c_int, @intFromBool(SDL_update_sensors))))) != 0)) and SDL_SensorsOpened()) {
        poll_intervalNS = @bitCast(@as(c_ulong, @truncate(if (@as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) < (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 1)))) *% @as(Uint64, SDL_NS_PER_MS))) @as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) else @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1)))) *% @as(Uint64, SDL_NS_PER_MS))));
    }
    if (SDL_HasActiveTrays()) {
        poll_intervalNS = @bitCast(@as(c_ulong, @truncate(if (@as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) < (@as(Uint64, @bitCast(@as(c_long, @as(c_int, 50)))) *% @as(Uint64, SDL_NS_PER_MS))) @as(Uint64, @bitCast(@as(c_long, poll_intervalNS))) else @as(Uint64, @bitCast(@as(c_long, @as(c_int, 50)))) *% @as(Uint64, SDL_NS_PER_MS))));
    }
    poll_intervalNS = @truncate(if (@as(c_longlong, poll_intervalNS) < (@as(c_longlong, 3) * SDL_NS_PER_SECOND)) @as(c_longlong, poll_intervalNS) else @as(c_longlong, 3) * SDL_NS_PER_SECOND);
    return poll_intervalNS;
}
pub fn SDL_WaitEventTimeout_Device(_this: [*c]SDL_VideoDevice, wakeup_window: [*c]SDL_Window, event: [*c]SDL_Event, start: Uint64, timeoutNS: Sint64) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var loop_timeoutNS: Sint64 = timeoutNS;
    _ = &loop_timeoutNS;
    var poll_intervalNS: Sint64 = SDL_events_get_polling_interval();
    _ = &poll_intervalNS;
    while (true) {
        var status: c_int = undefined;
        _ = &status;
        SDL_PumpEventsInternal(@"true" != 0);
        status = SDL_PeepEvents_REAL(event, 1, SDL_GETEVENT, SDL_EVENT_FIRST, SDL_EVENT_LAST);
        if (status < @as(c_int, 0)) {
            break;
        }
        if (status > @as(c_int, 0)) {
            return 1;
        }
        if (timeoutNS > @as(Sint64, 0)) {
            var elapsed: Sint64 = @bitCast(@as(c_ulong, @truncate(SDL_GetTicksNS_REAL() -% start)));
            _ = &elapsed;
            if (elapsed >= timeoutNS) {
                return 0;
            }
            loop_timeoutNS = timeoutNS - elapsed;
        }
        if (poll_intervalNS != @as(c_long, 9223372036854775807)) {
            if (loop_timeoutNS >= @as(Sint64, 0)) {
                loop_timeoutNS = if (loop_timeoutNS < poll_intervalNS) loop_timeoutNS else poll_intervalNS;
            } else {
                loop_timeoutNS = poll_intervalNS;
            }
        }
        _ = SDL_SetAtomicPointer_REAL(&_this.*.wakeup_window, @ptrCast(@alignCast(wakeup_window)));
        status = _this.*.WaitEventTimeout.?(_this, loop_timeoutNS);
        _ = SDL_SetAtomicPointer_REAL(&_this.*.wakeup_window, null);
        if (((status == @as(c_int, 0)) and (poll_intervalNS != @as(c_long, 9223372036854775807))) and (loop_timeoutNS == poll_intervalNS)) {
            continue;
        } else if (status <= @as(c_int, 0)) {
            return status;
        }
    }
    return 0;
}
pub fn SDL_find_active_window(_this: [*c]SDL_VideoDevice) callconv(.c) [*c]SDL_Window {
    @setEvalBranchQuota(100000);
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    {
        window = _this.*.windows;
        while (window != null) : (window = window.*.next) {
            if (!window.*.is_destroying) {
                return window;
            }
        }
    }
    return null;
}
pub export fn SDL_WaitEvent_REAL(event: [*c]SDL_Event) bool {
    @setEvalBranchQuota(100000);
    return SDL_WaitEventTimeoutNS(event, -@as(c_int, 1));
}
pub export fn SDL_WaitEventTimeout_REAL(event: [*c]SDL_Event, timeoutMS: Sint32) bool {
    @setEvalBranchQuota(100000);
    var timeoutNS: Sint64 = undefined;
    _ = &timeoutNS;
    if (timeoutMS > @as(c_int, 0)) {
        timeoutNS = @bitCast(@as(c_ulong, @truncate(@as(Uint64, @bitCast(@as(c_long, timeoutMS))) *% @as(Uint64, SDL_NS_PER_MS))));
    } else {
        timeoutNS = timeoutMS;
    }
    return SDL_WaitEventTimeoutNS(event, timeoutNS);
}
pub export fn SDL_WaitEventTimeoutNS(event: [*c]SDL_Event, timeoutNS: Sint64) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [22:0]u8 = "SDL_WaitEventTimeoutNS".*;
    };
    _ = &static_local___func__;
    var start: Uint64 = undefined;
    _ = &start;
    var expiration: Uint64 = undefined;
    _ = &expiration;
    var include_sentinel: bool = timeoutNS == @as(Sint64, 0);
    _ = &include_sentinel;
    var result: c_int = undefined;
    _ = &result;
    if (timeoutNS > @as(Sint64, 0)) {
        start = SDL_GetTicksNS_REAL();
        expiration = start +% @as(Uint64, @bitCast(@as(c_long, timeoutNS)));
    } else {
        start = 0;
        expiration = 0;
    }
    if (SDL_GetAtomicInt_REAL(&SDL_sentinel_pending) == @as(c_int, 0)) {
        SDL_PumpEventsInternal(@"true" != 0);
    }
    result = SDL_PeepEventsInternal(event, 1, SDL_GETEVENT, SDL_EVENT_FIRST, SDL_EVENT_LAST, include_sentinel);
    if (result < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (include_sentinel) {
        if (event != null) {
            if (event.*.type == @as(Uint32, SDL_EVENT_POLL_SENTINEL)) {
                return @"false" != 0;
            }
        } else {
            var dummy: SDL_Event = undefined;
            _ = &dummy;
            if ((SDL_PeepEventsInternal(&dummy, 1, SDL_PEEKEVENT, SDL_EVENT_FIRST, SDL_EVENT_LAST, @"true" != 0) != 0) and (dummy.type == @as(Uint32, SDL_EVENT_POLL_SENTINEL))) {
                _ = SDL_PeepEventsInternal(&dummy, 1, SDL_GETEVENT, SDL_EVENT_POLL_SENTINEL, SDL_EVENT_POLL_SENTINEL, @"true" != 0);
                return @"false" != 0;
            }
        }
    }
    if (result == @as(c_int, 0)) {
        if (timeoutNS == @as(Sint64, 0)) {
            return @"false" != 0;
        }
    } else {
        if (!(event != null)) {
            SDL_RunMainThreadCallbacks();
        }
        return @"true" != 0;
    }
    while (true) {
        while (!(timeoutNS != @as(Sint64, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "timeoutNS != 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1765);
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
    var _this: [*c]SDL_VideoDevice = SDL_GetVideoDevice();
    _ = &_this;
    if (((_this != null) and (_this.*.WaitEventTimeout != null)) and (_this.*.SendWakeupEvent != null)) {
        var wakeup_window: [*c]SDL_Window = SDL_find_active_window(_this);
        _ = &wakeup_window;
        if (wakeup_window != null) {
            result = SDL_WaitEventTimeout_Device(_this, wakeup_window, event, start, timeoutNS);
            if (result > @as(c_int, 0)) {
                return @"true" != 0;
            } else if (result == @as(c_int, 0)) {
                return @"false" != 0;
            } else {}
        }
    }
    while (true) {
        SDL_PumpEventsInternal(@"true" != 0);
        if (SDL_PeepEvents_REAL(event, 1, SDL_GETEVENT, SDL_EVENT_FIRST, SDL_EVENT_LAST) > @as(c_int, 0)) {
            return @"true" != 0;
        }
        var delay: Uint64 = @as(Uint64, @bitCast(@as(c_long, @as(c_int, 1)))) *% @as(Uint64, SDL_NS_PER_MS);
        _ = &delay;
        if (timeoutNS > @as(Sint64, 0)) {
            var now: Uint64 = SDL_GetTicksNS_REAL();
            _ = &now;
            if (now >= expiration) {
                return @"false" != 0;
            }
            delay = if ((expiration -% now) < delay) expiration -% now else delay;
        }
        SDL_DelayNS_REAL(delay);
    }
    return undefined;
}
pub fn SDL_CallEventWatchers(event: [*c]SDL_Event) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (event.*.common.type == @as(Uint32, SDL_EVENT_POLL_SENTINEL)) {
        return @"true" != 0;
    }
    return SDL_DispatchEventWatchList(&SDL_event_watchers, event);
}
pub export fn SDL_PushEvent_REAL(event: [*c]SDL_Event) bool {
    @setEvalBranchQuota(100000);
    if (!(event.*.common.timestamp != 0)) {
        event.*.common.timestamp = SDL_GetTicksNS_REAL();
    }
    if (!SDL_CallEventWatchers(event)) {
        _ = SDL_ClearError_REAL();
        return @"false" != 0;
    }
    if (SDL_PeepEvents_REAL(event, 1, SDL_ADDEVENT, 0, 0) <= @as(c_int, 0)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_SetEventFilter_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    var event: [*c]SDL_EventEntry = undefined;
    _ = &event;
    var next: [*c]SDL_EventEntry = undefined;
    _ = &next;
    SDL_LockMutex_REAL(SDL_event_lock);
    {
        SDL_event_watchers.filter.callback = filter;
        SDL_event_watchers.filter.userdata = userdata;
        if (filter != null) {
            SDL_LockMutex_REAL(SDL_EventQ.lock);
            {
                {
                    event = SDL_EventQ.head;
                    while (event != null) : (event = next) {
                        next = event.*.next;
                        if (!filter.?(userdata, &event.*.event)) {
                            SDL_CutEvent(event);
                        }
                    }
                }
            }
            SDL_UnlockMutex_REAL(SDL_EventQ.lock);
        }
    }
    SDL_UnlockMutex_REAL(SDL_event_lock);
}
pub export fn SDL_GetEventFilter_REAL(filter: [*c]SDL_EventFilter, userdata: [*c]?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    var event_ok: SDL_EventWatcher = undefined;
    _ = &event_ok;
    SDL_LockMutex_REAL(SDL_event_lock);
    {
        event_ok = SDL_event_watchers.filter;
    }
    SDL_UnlockMutex_REAL(SDL_event_lock);
    if (filter != null) {
        filter.* = event_ok.callback;
    }
    if (userdata != null) {
        userdata.* = event_ok.userdata;
    }
    return (if (event_ok.callback != null) @"true" else @"false") != 0;
}
pub export fn SDL_AddEventWatch_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    return SDL_AddEventWatchList(&SDL_event_watchers, filter, userdata);
}
pub export fn SDL_RemoveEventWatch_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    SDL_RemoveEventWatchList(&SDL_event_watchers, filter, userdata);
}
pub export fn SDL_FilterEvents_REAL(filter: SDL_EventFilter, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    SDL_LockMutex_REAL(SDL_EventQ.lock);
    {
        var entry: [*c]SDL_EventEntry = undefined;
        _ = &entry;
        var next: [*c]SDL_EventEntry = undefined;
        _ = &next;
        {
            entry = SDL_EventQ.head;
            while (entry != null) : (entry = next) {
                next = entry.*.next;
                if (!filter.?(userdata, &entry.*.event)) {
                    SDL_CutEvent(entry);
                }
            }
        }
    }
    SDL_UnlockMutex_REAL(SDL_EventQ.lock);
}
pub export fn SDL_SetEventEnabled_REAL(arg_type: Uint32, enabled: bool) void {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "SDL_SetEventEnabled_REAL".*;
    };
    _ = &static_local___func__;
    var current_state: bool = undefined;
    _ = &current_state;
    var hi: Uint8 = undefined;
    _ = &hi;
    var lo: Uint8 = undefined;
    _ = &lo;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "SDL_disabled_events[hi] != ((void*)0)",
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
                hi = @truncate((@"type" >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
                lo = @truncate(@"type" & @as(Uint32, 255));
                if ((SDL_disabled_events[hi] != null) and ((SDL_disabled_events[hi].*.bits[@bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, lo), @as(c_int, 32)))))] & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, lo) & @as(c_int, 31))))))) != 0)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                current_state = @"false" != 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                current_state = @"true" != 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                if (@intFromBool(@as(c_int, @intFromBool(enabled)) != @"false") != @as(c_int, @intFromBool(current_state))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if (enabled) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                {}
            },
            7 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            8 => {
                if (!(SDL_disabled_events[hi] != null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            9 => {
                if ((@"type" == @as(Uint32, SDL_EVENT_DROP_FILE)) or (@"type" == @as(Uint32, SDL_EVENT_DROP_TEXT))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                SDL_disabled_events[hi].*.bits[@bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, lo), @as(c_int, 32)))))] &= ~(@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, lo) & @as(c_int, 31))))));
                switch (@"type") {
                    @as(Uint32, SDL_EVENT_GAMEPAD_ADDED) => {
                        sdl_pc = 23;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_REMOVED) => {
                        sdl_pc = 24;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_AXIS_MOTION) => {
                        sdl_pc = 25;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_DOWN) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_BUTTON_UP) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(Uint32, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE) => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 29;
                        continue;
                    },
                }
            },
            13 => {
                if (!(@as(?*anyopaque, @ptrCast(@alignCast(SDL_disabled_events[hi]))) != @as(?*anyopaque, null))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_events.c", 1937);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                __builtin.debugtrap();
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
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            23 => {
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_ADDED, @"true" != 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            24 => {
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_REMOVED, @"true" != 0);
                {
                    sdl_pc = 22;
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
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_AXIS_MOTION, @"true" != 0);
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_HAT_MOTION, @"true" != 0);
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_BUTTON_DOWN, @"true" != 0);
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_BUTTON_UP, @"true" != 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            28 => {
                SDL_SetEventEnabled_REAL(SDL_EVENT_JOYSTICK_UPDATE_COMPLETE, @"true" != 0);
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            30 => {
                SDL_disabled_events[hi] = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_DisabledEventBlock))));
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
                if (SDL_disabled_events[hi] != null) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                SDL_disabled_events[hi].*.bits[@bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, lo), @as(c_int, 32)))))] |= @as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, lo) & @as(c_int, 31)))));
                SDL_FlushEvent_REAL(@"type");
                {
                    sdl_pc = 35;
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
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            36 => {
                SDL_ToggleDragAndDropSupport();
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_EventEnabled_REAL(arg_type: Uint32) bool {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var hi: Uint8 = @truncate((@"type" >> @intCast(@as(Uint32, 8))) & @as(Uint32, 255));
    _ = &hi;
    var lo: Uint8 = @truncate(@"type" & @as(Uint32, 255));
    _ = &lo;
    if ((SDL_disabled_events[hi] != null) and ((SDL_disabled_events[hi].*.bits[@bitCast(@as(isize, @intCast(@divTrunc(@as(c_int, lo), @as(c_int, 32)))))] & (@as(c_uint, 1) << @intCast(@as(c_uint, @bitCast(@as(c_int, @as(c_int, lo) & @as(c_int, 31))))))) != 0)) {
        return @"false" != 0;
    } else {
        return @"true" != 0;
    }
}
pub export fn SDL_RegisterEvents_REAL(numevents: c_int) Uint32 {
    @setEvalBranchQuota(100000);
    var event_base: Uint32 = 0;
    _ = &event_base;
    if (numevents > @as(c_int, 0)) {
        var value: c_int = SDL_AddAtomicInt_REAL(&SDL_userevents, numevents);
        _ = &value;
        if ((value >= @as(c_int, 0)) and (value <= (SDL_EVENT_LAST - SDL_EVENT_USER))) {
            event_base = @bitCast(@as(c_int, SDL_EVENT_USER + value));
        }
    }
    return event_base;
}
pub export fn SDL_SendAppEvent(eventType: SDL_EventType) void {
    @setEvalBranchQuota(100000);
    var event: SDL_Event = undefined;
    _ = &event;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (SDL_EventEnabled_REAL(eventType)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                event.type = eventType;
                event.common.timestamp = 0;
                switch (eventType) {
                    @as(SDL_EventType, SDL_EVENT_TERMINATING) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_EventType, SDL_EVENT_LOW_MEMORY) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(SDL_EventType, SDL_EVENT_WILL_ENTER_BACKGROUND) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(SDL_EventType, SDL_EVENT_DID_ENTER_BACKGROUND) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(SDL_EventType, SDL_EVENT_WILL_ENTER_FOREGROUND) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(SDL_EventType, SDL_EVENT_DID_ENTER_FOREGROUND) => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (SDL_EventLoggingVerbosity > @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                SDL_LogEvent(&event);
                {
                    sdl_pc = 13;
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
                _ = SDL_CallEventWatchers(&event);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            14 => {
                _ = SDL_PushEvent_REAL(&event);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SendKeymapChangedEvent() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_KEYMAP_CHANGED);
}
pub export fn SDL_SendLocaleChangedEvent() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_LOCALE_CHANGED);
}
pub export fn SDL_SendSystemThemeChangedEvent() void {
    @setEvalBranchQuota(100000);
    SDL_SendAppEvent(SDL_EVENT_SYSTEM_THEME_CHANGED);
}
pub export fn SDL_InitEvents() bool {
    @setEvalBranchQuota(100000);
    _ = SDL_AddHintCallback_REAL("SDL_AUTO_UPDATE_JOYSTICKS", SDL_AutoUpdateJoysticksChanged, null);
    _ = SDL_AddHintCallback_REAL("SDL_AUTO_UPDATE_SENSORS", SDL_AutoUpdateSensorsChanged, null);
    _ = SDL_AddHintCallback_REAL("SDL_EVENT_LOGGING", SDL_EventLoggingChanged, null);
    _ = SDL_AddHintCallback_REAL("SDL_POLL_SENTINEL", SDL_PollSentinelChanged, null);
    SDL_InitMainThreadCallbacks();
    if (!SDL_StartEventLoop()) {
        SDL_RemoveHintCallback_REAL("SDL_EVENT_LOGGING", SDL_EventLoggingChanged, null);
        return @"false" != 0;
    }
    _ = SDL_InitQuit();
    return @"true" != 0;
}
pub export fn SDL_QuitEvents() void {
    @setEvalBranchQuota(100000);
    SDL_QuitQuit();
    SDL_StopEventLoop();
    SDL_QuitMainThreadCallbacks();
    SDL_RemoveHintCallback_REAL("SDL_POLL_SENTINEL", SDL_PollSentinelChanged, null);
    SDL_RemoveHintCallback_REAL("SDL_EVENT_LOGGING", SDL_EventLoggingChanged, null);
    SDL_RemoveHintCallback_REAL("SDL_AUTO_UPDATE_JOYSTICKS", SDL_AutoUpdateJoysticksChanged, null);
    SDL_RemoveHintCallback_REAL("SDL_AUTO_UPDATE_SENSORS", SDL_AutoUpdateSensorsChanged, null);
}

pub const SDL_AddEventWatch = SDL_AddEventWatch_REAL;
pub const SDL_EventEnabled = SDL_EventEnabled_REAL;
pub const SDL_FilterEvents = SDL_FilterEvents_REAL;
pub const SDL_FlushEvent = SDL_FlushEvent_REAL;
pub const SDL_FlushEvents = SDL_FlushEvents_REAL;
pub const SDL_GetEventFilter = SDL_GetEventFilter_REAL;
pub const SDL_HasEvent = SDL_HasEvent_REAL;
pub const SDL_HasEvents = SDL_HasEvents_REAL;
pub const SDL_PeepEvents = SDL_PeepEvents_REAL;
pub const SDL_PollEvent = SDL_PollEvent_REAL;
pub const SDL_PumpEvents = SDL_PumpEvents_REAL;
pub const SDL_PushEvent = SDL_PushEvent_REAL;
pub const SDL_RegisterEvents = SDL_RegisterEvents_REAL;
pub const SDL_RemoveEventWatch = SDL_RemoveEventWatch_REAL;
pub const SDL_SetEventEnabled = SDL_SetEventEnabled_REAL;
pub const SDL_SetEventFilter = SDL_SetEventFilter_REAL;
pub const SDL_WaitEvent = SDL_WaitEvent_REAL;
pub const SDL_WaitEventTimeout = SDL_WaitEventTimeout_REAL;
pub const SDL_RunOnMainThread = SDL_RunOnMainThread_REAL;
pub const SDL_GetEventDescription = SDL_GetEventDescription_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_INIT_JOYSTICK = @as(c_uint, 0x00000200);
pub const SDL_INIT_EVENTS = @as(c_uint, 0x00004000);
pub const SDL_INIT_SENSOR = @as(c_uint, 0x00008000);
pub const SDL_NS_PER_SECOND = @as(c_longlong, 1000000000);
pub const SDL_NS_PER_MS = __helpers.promoteIntLiteral(c_int, 1000000, .decimal);
pub inline fn major(dev: anytype) @TypeOf(gnu_dev_major(dev)) {
    @setEvalBranchQuota(100000);
    _ = &dev;
    return gnu_dev_major(dev);
}
pub inline fn minor(dev: anytype) @TypeOf(gnu_dev_minor(dev)) {
    @setEvalBranchQuota(100000);
    _ = &dev;
    return gnu_dev_minor(dev);
}
pub const SDL_MAX_QUEUED_EVENTS = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const SDL2_SYSWMEVENT = @as(c_int, 0x201);
